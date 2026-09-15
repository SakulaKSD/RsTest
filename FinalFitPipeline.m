function FinalFitPipeline(mode, arg2, arg3, arg4)
%FINALFITPIPELINE  Self-contained Q-factor fitting pipeline (single file).
%
%   This file is the complete, self-contained implementation of the
%   Q-factor fitting algorithm described in the paper. It requires no
%   other files: every helper function is a local function at the bottom
%   of this file.
%
%   Pipeline:
%     S2P file -> cropping to a total width of 3 x (-3 dB bandwidth)
%     (i.e. +-1.5 x on each side) -> adaptive-threshold RANSAC
%     initialization -> initial linear fit -> final nonlinear optimizer
%     (diagonal scaling + Levenberg-Marquardt damping + IRLS angular
%     weights + analytical covariance) -> QL, FL, Qu and analytical
%     uncertainties.
%
%   Usage:
%     FinalFitPipeline('single', 'D:\Study\PINN\02_Raw_Data\20260721_MOVCDLAO\MOVCDLAO_6.36K.s2p')  % one .s2p FILE
%     FinalFitPipeline('batch',  'D:\Study\PINN\02_Raw_Data\20260721_MOVCDLAO')            % a FOLDER of .s2p
%     FinalFitPipeline('mc',     'D:\Study\PINN\02_Raw_Data\20260721_MOVCDLAO\MOVCDLAO_6.36K.s2p', [1 2 5 10])
%     FinalFitPipeline('rs', G, sampleTbl, refTbl)            % Rs calculation
%   (single/mc expect a FILE path; batch expects a FOLDER path.)
%
%   Monte Carlo protocol (reproducible): seeds 42/2024/7; real and
%   imaginary noise components independent, each with standard deviation
%   sigma_w * multiplier; a fit is successful when it returns without
%   error and QL is finite, positive and below 1e10.
%
%   Derived from NLQFIT6, NPL Report MAT 58 (A. P. Gregory, 2021, CC0).

    if nargin < 1, mode = 'single'; end
    if strcmp(mode, 'demo') || nargin == 0
        error('Please provide an S2P file: FinalFitPipeline(''single'', file)');
    end

    switch lower(mode)
        case 'single'
            [mv, Cov, info] = fitOneFile(arg2, true);
            if ~isempty(mv)
                QL = mv(5); FL = mv(6);
                d  = qCircleDiam(1.0, mv(1), mv(2), mv(3), mv(4));
                Qu = QL / (1 - d);
                u_QL = sqrt(Cov(5,5));
                fprintf('\nResult: FL = %.6f GHz, QL = %.2f, Qu = %.2f, u(QL) = %.2f (%.4f%%)\n', ...
                    FL/1e9, QL, Qu, u_QL, u_QL/QL*100);
            end

        case 'batch'
            rng(0);   % fixed seed so that the RANSAC-based fits are reproducible
            files = dir(fullfile(arg2, '*.s2p'));
            nFile = numel(files);
            T = cell(nFile, 6);
            for k = 1:nFile
                fn = fullfile(arg2, files(k).name);
                [mv, Cov, info] = fitOneFile(fn, false);
                tok = regexp(files(k).name, '([0-9]+\.[0-9]+)K', 'tokens');
                Tk = NaN;
                if ~isempty(tok)
                    Tk = str2double(tok{1}{1});
                end
                if ~isempty(mv)
                    QL = mv(5); FL = mv(6);
                    d  = qCircleDiam(1.0, mv(1), mv(2), mv(3), mv(4));
                    Qu = QL / (1 - d);
                    u_QL = sqrt(Cov(5,5));
                    T(k, :) = {files(k).name, Tk, FL/1e9, QL, Qu, u_QL};
                    fprintf('[%d/%d] %s: QL=%.1f, Qu=%.1f\n', k, nFile, files(k).name, QL, Qu);
                else
                    T(k, :) = {files(k).name, Tk, NaN, NaN, NaN, NaN};
                end
            end
            T = cell2table(T, 'VariableNames', {'File','Temperature_K','FL_GHz','QL','Qu','u_QL'});
            writetable(T, fullfile(arg2, 'fitting_summary.xlsx'));

        case 'mc'
            [mv, ~, info] = fitOneFile(arg2, true);
            if isempty(mv)
                error('Fit failed; Monte Carlo aborted.');
            end
            nf = [1, 2, 5, 10];
            if nargin >= 3 && ~isempty(arg3), nf = arg3; end
            mc = runMonteCarlo(info.F, info.N, mv, info.sigma_w, 200, nf, [42 2024 7], false);
            T = array2table(mc, 'VariableNames', ...
                {'NoiseFactor','Seed','SuccessRate_pct','Bias_pct','RSD_pct','k_ratio','Coverage_pct'});
            disp(T);

        case 'rs'
            if nargin < 4, error('Usage: FinalFitPipeline(''rs'', G, sampleSummary, refSummary)'); end
            T = computeRs(arg3, arg4, arg2);   % (sample table, reference table, G)
            disp(T);

        otherwise
            error('Unknown mode: %s', mode);
    end
end

%% ======================== Core fit function ========================

function [mv, Cov, info] = fitOneFile(fn, verbose)
%FITONEFILE  Full pipeline on one S2P file.
    mv = []; Cov = []; info = [];
    try
        [F_Hz, S21] = parseS2P(fn);
        F = F_Hz(:); D = S21(:);
        [Fc, Dc, N] = crop3dB(F, D);

        [Fseed, Qseed, inl] = ransacInitAdaptive(Fc, Dc, N);
        if min(Fc(inl)) < Fseed && max(Fc(inl)) > Fseed
            sv = initialFit(Fc(inl), Dc(inl), numel(inl), Fseed, Qseed);
        else
            sv = initialFit(Fc, Dc, N, Fseed, Qseed);
        end

        Tol = max(abs(Dc)) * 1.0e-5;
        [mv, Cov] = optimiseFit6(Fc, Dc, N, Fseed, sv, Tol, ~verbose);

        QL = mv(5); FL = mv(6);
        PV = angularWeights(Fc, FL, QL);
        m6_int = mv(5) * Fc(1) / FL;
        sigma_w = computeRMS(Fc, Dc, N, PV, mv(1), mv(2), mv(3), mv(4), ...
            mv(5), m6_int, Fc(1));

        info.F = Fc; info.N = N; info.sigma_w = sigma_w;
        info.inlierRatio = numel(inl) / N * 100;

        if verbose
            d = qCircleDiam(1.0, mv(1), mv(2), mv(3), mv(4));
            fprintf('  %s: QL = %.2f, FL = %.6f GHz, d = %.6f, sigma_w = %.3e, inliers = %.1f%%\n', ...
                fn, QL, FL/1e9, d, sigma_w, info.inlierRatio);
        end
    catch ME
        fprintf('  %s: error: %s\n', fn, ME.message);
    end
end

function mc_results = runMonteCarlo(F, N, mv, sigma_weighted, N_mc, noise_factors, seeds, quiet)
%RUNMONTECARLO  Monte Carlo verification (final protocol).
    QL_true = mv(5); FL_true = mv(6);
    y_true = 1.0 ./ (1.0 + 2j * (QL_true / FL_true) * F - 2j * QL_true);
    S_true = mv(1) + 1j*mv(2) + (mv(3) + 1j*mv(4)) .* y_true;

    n_comb = numel(noise_factors) * numel(seeds);
    mc_results = zeros(n_comb, 7);
    row = 0;

    for nf = noise_factors
        noise_level = sigma_weighted * nf;
        for sd = seeds
            rng(sd);
            QL_mc = nan(N_mc, 1); u_mc = nan(N_mc, 1);
            nfail = 0;
            for i = 1:N_mc
                noise = noise_level * (randn(N,1) + 1j*randn(N,1));
                Dn = S_true + noise;
                try
                    [Fcn, Dcn, Nn] = crop3dB(F, Dn);
                    Tol_n = max(abs(Dcn)) * 1.0e-5;
                    [Fsn, Qsn, inl_n] = ransacInitAdaptive(Fcn, Dcn, Nn);
                    if min(Fcn(inl_n)) < Fsn && max(Fcn(inl_n)) > Fsn
                        sv_n = initialFit(Fcn(inl_n), Dcn(inl_n), numel(inl_n), Fsn, Qsn);
                    else
                        sv_n = initialFit(Fcn, Dcn, Nn, Fsn, Qsn);
                    end
                    [mv_n, Cov_n] = optimiseFit6(Fcn, Dcn, Nn, Fsn, sv_n, Tol_n, true);
                    QLn = mv_n(5);
                    if isfinite(QLn) && QLn > 0 && QLn < 1e10
                        QL_mc(i) = QLn;
                        u_mc(i)  = sqrt(Cov_n(5,5));
                    else
                        nfail = nfail + 1;
                    end
                catch
                    nfail = nfail + 1;
                end
            end
            v  = QL_mc(~isnan(QL_mc));
            uv = u_mc(~isnan(QL_mc));
            row = row + 1;
            mc_results(row, :) = [nf, sd, (N_mc-nfail)/N_mc*100, ...
                (mean(v)-QL_true)/QL_true*100, std(v)/mean(v)*100, ...
                std(v)/mean(uv), sum(abs(v-QL_true) <= 2*uv)/numel(v)*100];
            if ~quiet
                fprintf('  %dx sigma, seed %d: success %.1f%%, bias %.3f%%, RSD %.3f%%, k = %.3f, coverage %.1f%%\n', ...
                    nf, sd, mc_results(row,3), mc_results(row,4), mc_results(row,5), ...
                    mc_results(row,6), mc_results(row,7));
            end
        end
    end
end

function Rs_table = computeRs(sample_tbl, ref_tbl, G)
%COMPUTERS  Surface resistance with theoretical (calibrated) geometric factor.
    Ts = sample_tbl.Temperature_K; Qs = sample_tbl.Qu; uQs = sample_tbl.u_QL;
    Tr = ref_tbl.Temperature_K;    Qr = ref_tbl.Qu;    uQr = ref_tbl.u_QL;
    Qr_m = zeros(size(Ts)); uQr_m = zeros(size(Ts));
    for i = 1:numel(Ts)
        [~, idx] = min(abs(Tr - Ts(i)));
        Qr_m(i) = Qr(idx); uQr_m(i) = uQr(idx);
    end
    Rs = G * (1./Qs - 1./Qr_m);
    u_Rs = G * sqrt((uQs./Qs.^2).^2 + (uQr_m./Qr_m.^2).^2);
    Rs_table = table(Ts, Rs, u_Rs, u_Rs./abs(Rs)*100, ...
        'VariableNames', {'Temperature_K','Rs_Ohm','u_Rs_Ohm','Rel_u_pct'});
end

%% ======================== Fitting algorithm ========================

function [mv, Cov_params] = optimiseFit6(F, S, N, EstimatedResFreq, sv, Tol, quiet)
%OPTIMISEFIT6  Final nonlinear optimizer (see paper for the full description).
    N2 = N * 2;
    PV = ones(N, 1); PA = ones(N2, 1); P = diag(PA);

    m1 = sv(2)/sv(5); m2 = -sv(1)/sv(5);
    m3 = sv(3) - m1; m4 = sv(4) - m2;
    m5 = sv(5); Flwst = F(1);
    m6 = Flwst * m5 / EstimatedResFreq;

    lambda = 1e-3; lambda_up = 10; lambda_down = 0.1;
    lambda_max = 1e12; lambda_min = 1e-12;

    QL_prev = NaN;
    for irls = 1:10
        PV = angularWeights(F, Flwst*m5/m6, m5);
        PA = [PV; PV]; P = diag(PA);

        if ~quiet
            RMS_w = computeRMS(F, S, N, PV, m1, m2, m3, m4, m5, m6, Flwst);
            fprintf('  [IRLS %d/%d] angular weights updated, RMS = %.6f\n', ...
                irls, 10, RMS_w);
        end

        Valid_RMS_Error = false;
        TerminationConditionMet = false;
        iter_count = 0;

        while ~TerminationConditionMet
            iter_count = iter_count + 1;
            if Valid_RMS_Error, RMS_prev = RMS_Error; end

            [X, G] = buildJacobianResidual(F, S, N, N2, m1, m2, m3, m4, m5, m6, Flwst);
            M = X.'; T = X * P; C_mat = T * M; q = T * G;

            col_norms = sqrt(abs(diag(C_mat)));
            col_norms(col_norms < eps) = 1;
            D_scale = diag(1./col_norms);
            C_scaled = D_scale * C_mat * D_scale;
            q_scaled = D_scale * q;

            step_accepted = false;
            while ~step_accepted
                A_mat = C_scaled + lambda * eye(6);
                dm_scaled = A_mat \ q_scaled;
                dm = D_scale * dm_scaled;
                mc = [m1+dm(1), m2+dm(2), m3+dm(3), m4+dm(4), m5+dm(5), m6+dm(6)];
                RMS_new = computeRMS(F, S, N, PV, mc(1), mc(2), mc(3), mc(4), mc(5), mc(6), Flwst);

                if ~Valid_RMS_Error
                    accept_step = true;
                else
                    delta_rms = RMS_Error - RMS_new;
                    if delta_rms > Tol
                        accept_step = true;
                    elseif abs(delta_rms) <= Tol
                        accept_step = true;
                    else
                        accept_step = false;
                    end
                end

                if accept_step
                    m1 = mc(1); m2 = mc(2); m3 = mc(3);
                    m4 = mc(4); m5 = mc(5); m6 = mc(6);
                    RMS_Error = RMS_new;
                    Valid_RMS_Error = true;
                    lambda = max(lambda * lambda_down, lambda_min);
                    step_accepted = true;
                else
                    lambda = lambda * lambda_up;
                    if lambda > lambda_max
                        m1 = mc(1); m2 = mc(2); m3 = mc(3);
                        m4 = mc(4); m5 = mc(5); m6 = mc(6);
                        RMS_Error = RMS_new;
                        Valid_RMS_Error = true;
                        lambda = max(lambda * lambda_down, lambda_min);
                        step_accepted = true;
                    end
                end
            end

            if ~all(isfinite([m1 m2 m3 m4 m5 m6])) || iter_count > 50
                mv = [m1, m2, m3, m4, NaN, NaN];
                Cov_params = NaN(6);
                return
            end

            if Valid_RMS_Error && exist('RMS_prev', 'var') && RMS_prev > 0
                TerminationConditionMet = (abs(RMS_Error - RMS_prev) < Tol) ...
                                          && (lambda <= 1e-9 || iter_count >= 20);
            end
        end

        QL_now = m5;
        if ~isnan(QL_prev) && QL_prev > 0
            if abs(QL_now - QL_prev) / QL_prev < 1e-8, break; end
        end
        QL_prev = QL_now;
    end

    [X_final, ~] = buildJacobianResidual(F, S, N, N2, m1, m2, m3, m4, m5, m6, Flwst);
    T_final = X_final * P;
    C_final = T_final * X_final.';
    col_norms_final = sqrt(abs(diag(C_final)));
    col_norms_final(col_norms_final < eps) = 1;
    D_scale_final = diag(1./col_norms_final);
    C_scaled_final = D_scale_final * C_final * D_scale_final;
    sigma_u = RMS_Error * sqrt(N / (N - 6));
    Cov_scaled = inv(C_scaled_final);
    Cov_params = sigma_u^2 * D_scale_final * Cov_scaled * D_scale_final;

    QL = m5;
    FL = m5 * Flwst / m6;
    mv = [m1, m2, m3, m4, QL, FL];
end

function [X, G] = buildJacobianResidual(F, S, N, N2, m1, m2, m3, m4, m5, m6, Flwst)
    X = zeros(6, N2); G = zeros(N2, 1);
    for i = 1:N
        i2 = i + N;
        y = 1.0 / (1.0 + 2j*(m6*F(i)/Flwst - m5));
        X(1,i) = 1;       X(1,i2) = 0;
        X(2,i) = 0;       X(2,i2) = 1;
        X(3,i) = real(y); X(3,i2) = imag(y);
        X(4,i) = -imag(y);X(4,i2) = real(y);
        u = (1j*m3 - m4) * y * y * 2;
        X(5,i) = real(u); X(5,i2) = imag(u);
        u = -u * F(i) / Flwst;
        X(6,i) = real(u); X(6,i2) = imag(u);
        v = m1 + 1j*m2 + (m3 + 1j*m4) * y;
        r = S(i) - v;
        G(i) = real(r);   G(i2) = imag(r);
    end
end

function [RMS, E_vec] = computeRMS(F, S, N, PV, m1, m2, m3, m4, m5, m6, Flwst)
%COMPUTERMS  Weighted RMS residual of the six-parameter model.
%   NOTE: m6 here is the INTERNAL reparameterized variable of optimiseFit6
%   (m6 = QL*F(1)/FL), NOT the FL returned in mv. A caller holding the
%   returned vector must restore it first:
%       m6_int = mv(5)*F(1)/mv(6);
%   as done in fitOneFile above.
    SumNum = 0.0; SumDen = 0.0; E_vec = zeros(N, 1);
    for i = 1:N
        den = 1.0 + 2j*(m6*F(i)/Flwst - m5);
        E = S(i) - (m1 + 1j*m2) - (m3 + 1j*m4)/den;
        E_vec(i) = E;
        ip = PV(i);
        SumNum = SumNum + ip * (real(E)^2 + imag(E)^2);
        SumDen = SumDen + ip;
    end
    RMS = sqrt(SumNum / SumDen);
end

function PV = angularWeights(F, Fr, QL)
    ptmp = 2.0 * QL * (F - Fr) / Fr;
    PV = 1 ./ (ptmp.^2 + 1.0);
end

function d = qCircleDiam(A, m1, m2, m3, m4)
    b = (m1+m3) + 1j*(m2+m4);
    Sv = m1 + 1j*m2;
    d = abs(b - Sv) * A;
end

function sv = initialFit(F, S, N, EstimatedResFreq, Qseed)
%INITIALFIT  Initial linear fit (MAT 58, CC0).
%   The unscaled normal equations of this linear fit are ill-conditioned
%   for high-Q data, so MATLAB may report a near-singular matrix warning.
%   The warning is suppressed locally: this fit only provides the starting
%   point for the nonlinear optimizer, which refines the solution using
%   diagonally scaled normal equations.
    w1 = warning('off', 'MATLAB:nearlySingularMatrix');
    w2 = warning('off', 'MATLAB:singularMatrix');
    w3 = warning('off', 'MATLAB:illConditionedMatrix');

    N2 = 2*N;
    X = zeros(5, N2); G = zeros(N2, 1); P = zeros(1, N2);
    for i = 1:N
        i2 = i+N;
        t = 2.0*(F(i)/EstimatedResFreq - 1.0);
        y = abs(1.0/(1.0 + 1j*Qseed*t));
        P(i) = y*y; P(i2) = P(i);
        X(1,i) = t;  X(1,i2) = 0.0;
        X(2,i) = 0.0; X(2,i2) = t;
        X(3,i) = 1.0;  X(3,i2) = 0.0;
        X(4,i) = 0.0; X(4,i2) = 1.0;
        v1 = S(i);
        G(i) = real(v1);    G(i2) = imag(v1);
        v2 = v1*t;
        X(5,i) = imag(v2);  X(5,i2) = -real(v2);
    end
    M = X.'; T = X.*P; C = T*M; q = T*G;
    sv = C\ q;

    warning(w1); warning(w2); warning(w3);
end

%% ======================== RANSAC initialization ========================

function [Fseed, Qseed, inlier_idx] = ransacInitAdaptive(F, D, N)
%RANSACINITADAPTIVE  Adaptive-threshold RANSAC initialization (two-pass MAD).
    peak = max(abs(D));
    [C0c, R0c, ~] = ransacCircle(D, 200, peak * 0.2);
    if isempty(R0c) || ~isfinite(R0c) || R0c <= 0
        error('RANSAC coarse circle failed');
    end
    dist0 = abs(sqrt((real(D) - real(C0c)).^2 + (imag(D) - imag(C0c)).^2) - R0c);
    sigma_hat = 1.4826 * median(abs(dist0 - median(dist0)));
    thr = max(3 * sigma_hat, peak * 0.001);
    [C, R, inlier_idx] = ransacCircle(D, 200, thr);
    if isempty(inlier_idx) || R <= 0
        error('RANSAC refined circle failed');
    end

    inlier_S = D(inlier_idx);
    inlier_F = F(inlier_idx);
    idx_tail = [1:round(0.15*N), round(0.85*N):N];
    Sv_est = mean(D(idx_tail));
    Sv_proj = C + (Sv_est - C) * R / abs(Sv_est - C + eps);
    S_peak_est = 2*C - Sv_proj;
    theta = angle((inlier_S - C) ./ (Sv_proj - C + eps));
    theta_unwrap = unwrap(theta);
    theta_span = max(theta_unwrap) - min(theta_unwrap);

    if theta_span < 1.0
        [~, idx_max] = max(abs(D));
        Fseed = F(idx_max);
        Qseed = 5.0 * Fseed / (F(end) - F(1));
    else
        [~, idx_peak_est] = min(abs(D - S_peak_est));
        Fseed = F(idx_peak_est);
        [~, idx_t1] = min(theta_unwrap);
        [~, idx_t2] = max(theta_unwrap);
        f1 = inlier_F(idx_t1); f2 = inlier_F(idx_t2);
        tan1 = tan(theta_unwrap(idx_t1)); tan2 = tan(theta_unwrap(idx_t2));
        if abs(f2 - f1) > eps
            Qseed = abs(Fseed * (tan1 - tan2) / (2 * (f2 - f1)));
        else
            Qseed = 5.0 * Fseed / (F(end) - F(1));
        end
        if Qseed < 10 || ~isreal(Qseed) || isnan(Qseed) || isinf(Qseed)
            Qseed = 5.0 * Fseed / (F(end) - F(1));
        end
    end
end

function [C_best, R_best, inlier_idx] = ransacCircle(S, max_iter, threshold)
%RANSACCIRCLE  Three-point RANSAC circle fitting with a given threshold.
    N = length(S);
    x = real(S); y = imag(S);
    best_inlier_count = 0;
    C_best = 0; R_best = 0; inlier_idx = [];
    for iter = 1:max_iter
        idx = randperm(N, 3);
        [C, R, valid] = threePointCircle(x(idx(1)), y(idx(1)), ...
                                         x(idx(2)), y(idx(2)), ...
                                         x(idx(3)), y(idx(3)));
        if ~valid, continue; end
        dist = abs(sqrt((x - real(C)).^2 + (y - imag(C)).^2) - R);
        inliers = find(dist < threshold);
        if length(inliers) > best_inlier_count
            best_inlier_count = length(inliers);
            C_best = C; R_best = R; inlier_idx = inliers;
        end
    end
    if ~isempty(inlier_idx)
        [C_best, R_best] = leastSquaresCircle(x(inlier_idx), y(inlier_idx));
    end
end

function [C, R, valid] = threePointCircle(x1, y1, x2, y2, x3, y3)
    valid = true;
    M = [x1 y1 1; x2 y2 1; x3 y3 1];
    b = -[x1^2+y1^2; x2^2+y2^2; x3^2+y3^2];
    if rank(M) < 3
        valid = false; C = 0; R = 0; return;
    end
    sol = M \ b;
    D = sol(1); E = sol(2); F = sol(3);
    cx = -D/2; cy = -E/2;
    R = sqrt(max(D^2 + E^2 - 4*F, 0)) / 2;
    C = cx + 1j*cy;
    if ~isreal(R) || R <= 0 || ~isfinite(R)
        valid = false;
    end
end

function [C, R] = leastSquaresCircle(x, y)
    N = length(x);
    M = [x, y, ones(N,1)];
    b = -(x.^2 + y.^2);
    sol = M \ b;
    D = sol(1); E = sol(2); F = sol(3);
    cx = -D/2; cy = -E/2;
    R = sqrt(max(D^2 + E^2 - 4*F, 0)) / 2;
    C = cx + 1j*cy;
end

%% ======================== Data handling ========================

function [F_Hz, S21] = parseS2P(filename)
%PARSES2P  Read an S2P file (RI / dB / MA formats).
    fid = fopen(filename, 'r');
    if fid == -1, error('Cannot open file: %s', filename); end
    raw = textscan(fid, '%s', 'Delimiter', '\n', 'Whitespace', '');
    fclose(fid);
    lines = raw{1};

    opt_line = '';
    data_start = 1;
    for k = 1:length(lines)
        ln = strtrim(lines{k});
        if isempty(ln), continue; end
        if ln(1) == '#'
            opt_line = ln;
        elseif ln(1) ~= '!'
            data_start = k; break;
        end
    end

    opt_upper = upper(opt_line);
    if contains(opt_upper, 'GHZ'), freq_mult = 1e9;
    elseif contains(opt_upper, 'MHZ'), freq_mult = 1e6;
    elseif contains(opt_upper, 'KHZ'), freq_mult = 1e3;
    else, freq_mult = 1; end

    is_RI = contains(opt_upper, ' RI');
    is_DB = contains(opt_upper, ' DB');

    nLines = length(lines) - data_start + 1;
    F_Hz = zeros(nLines, 1); S21 = zeros(nLines, 1); cnt = 0;
    for k = data_start:length(lines)
        ln = strtrim(lines{k});
        if isempty(ln), continue; end
        vals = sscanf(ln, '%f');
        if numel(vals) < 5, continue; end
        cnt = cnt + 1;
        F_Hz(cnt) = vals(1) * freq_mult;
        if is_RI
            S21(cnt) = vals(4) + 1j * vals(5);
        elseif is_DB
            S21(cnt) = 10^(vals(4)/20) * exp(1j * vals(5) * pi/180);
        else
            S21(cnt) = vals(4) * exp(1j * vals(5) * pi/180);
        end
    end
    F_Hz = F_Hz(1:cnt); S21 = S21(1:cnt);
    if cnt == 0, error('No valid data in file: %s', filename); end
end

function [Fc, Dc, N] = crop3dB(F, D)
%CROP3DB  Crop to a total width of 3 x (-3 dB bandwidth) around the peak,
%   i.e. +-1.5 x the -3 dB bandwidth on each side. This is the fitting
%   window used throughout the paper.
    S_mag = abs(D);
    [S_peak, idx_peak] = max(S_mag);
    thr = S_peak / sqrt(2);

    idx_left = idx_peak;
    while idx_left > 1 && S_mag(idx_left) >= thr
        idx_left = idx_left - 1;
    end
    idx_right = idx_peak;
    while idx_right < numel(S_mag) && S_mag(idx_right) >= thr
        idx_right = idx_right + 1;
    end

    BW_pts = idx_right - idx_left;
    half = round(3 * BW_pts / 2);
    il = max(1, idx_peak - half);
    ir = min(numel(F), idx_peak + half);
    Fc = F(il:ir);
    Dc = D(il:ir);
    N = numel(Fc);
end
