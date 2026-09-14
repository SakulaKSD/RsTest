"""rstest.fitting.ransac —— 自适应阈值 RANSAC 圆初始化（FinalFitPipeline.m 移植 · 模块 3/6）

用途：在没有先验知识的情况下，从复平面上的 S21 轨迹里"找圆"，
为后续的线性初值拟合提供两个种子：
    Fseed —— 谐振频率的粗估计（Hz）
    Qseed —— Q_L 的粗估计（无量纲）

对应 MATLAB 参考实现里的四个局部函数（逐行对照移植）：
    ransacInitAdaptive  →  ransac_init_adaptive()   两轮 MAD 自适应阈值
    ransacCircle        →  ransac_circle()          三点随机采样 + 内点计数
    threePointCircle    →  three_point_circle()     三点定圆
    leastSquaresCircle  →  least_squares_circle()   代数最小二乘圆拟合

移植要点（与 MATLAB 的差异集中写在这里，函数内部不再重复）：
  1. 索引 1-based → 0-based：下标统一减 1；MATLAB 的区间 [a:b] 在 Python 里
     要写成 np.arange(a-1, b)，即右端"减 1 后再 +1"抵消掉；
  2. round()：Python 内置 round 是"银行家舍入"（.5 往偶数靠），MATLAB 的
     round 是四舍五入（.5 一律进位）——一律用 matlab_round() 代替；
  3. 反斜杠解方程：方阵用 np.linalg.solve，超定（最小二乘）用 np.linalg.lstsq；
  4. 随机数：MATLAB randperm 与 numpy Generator 是两套不同算法，随机序列
     无法逐位对齐（统计性质一致）。本模块用传入的 rng 保证可复现。

出处：Derived from NLQFIT6, NPL Report MAT 58 (A. P. Gregory, 2021, CC0).
"""

import numpy as np

EPS = np.finfo(float).eps  # MATLAB 的 eps：2.220446049250313e-16


def matlab_round(x):
    """MATLAB 的 round：四舍五入到最近整数（恰好 .5 时一律进位）。"""
    return int(np.floor(x + 0.5))


def three_point_circle(x1, y1, x2, y2, x3, y3):
    """三点定圆（解 x²+y² + Dx + Ey + F = 0 的线性方程组）。

    返回 (C, R, valid)：C 是复数圆心（实部 cx、虚部 cy），R 是半径。
    三点接近共线时矩阵奇异，valid = False，调用方应丢弃这次采样。
    """
    m = np.array([[x1, y1, 1.0], [x2, y2, 1.0], [x3, y3, 1.0]], dtype=float)
    b = -np.array(
        [x1 * x1 + y1 * y1, x2 * x2 + y2 * y2, x3 * x3 + y3 * y3], dtype=float
    )
    if np.linalg.matrix_rank(m) < 3:
        return 0.0 + 0.0j, 0.0, False
    d, e, f = np.linalg.solve(m, b)
    cx, cy = -d / 2.0, -e / 2.0
    r = np.sqrt(max(d * d + e * e - 4.0 * f, 0.0)) / 2.0
    c = complex(cx, cy)
    return c, float(r), bool(np.isfinite(r) and r > 0.0)


def least_squares_circle(x, y):
    """代数最小二乘圆拟合（Kåsa 法）：对已选中的内点做一次性精修。"""
    x = np.asarray(x, dtype=float)
    y = np.asarray(y, dtype=float)
    n = x.size
    m = np.column_stack([x, y, np.ones(n)])
    b = -(x * x + y * y)
    sol, *_ = np.linalg.lstsq(m, b, rcond=None)
    d, e, f = sol
    cx, cy = -d / 2.0, -e / 2.0
    r = np.sqrt(max(d * d + e * e - 4.0 * f, 0.0)) / 2.0
    return complex(cx, cy), float(r)


def ransac_circle(s, max_iter, threshold, rng):
    """三点 RANSAC 圆拟合：随机抽 3 点画圆 → 数内点 → 取内点最多者。

    参数
    ----
    s         : 复数数组（复平面上的 S21 轨迹点）
    max_iter  : 随机采样次数
    threshold : 内点判据（点到圆的距离 < threshold 即为内点）
    rng       : numpy 随机数发生器（Generator）

    返回 (C_best, R_best, inlier_idx)：内点最多那次的圆参数与内点下标。
    最后若拿到过内点，再用全部内点做一次最小二乘精修。
    """
    s = np.asarray(s, dtype=complex)
    n = s.size
    x, y = s.real, s.imag
    best_count = 0
    c_best, r_best = 0.0 + 0.0j, 0.0
    inl_best = np.empty(0, dtype=int)
    for _ in range(max_iter):
        idx = rng.choice(n, size=3, replace=False)  # MATLAB: randperm(N, 3)
        c, r, valid = three_point_circle(
            x[idx[0]], y[idx[0]], x[idx[1]], y[idx[1]], x[idx[2]], y[idx[2]]
        )
        if not valid:
            continue
        dist = np.abs(np.sqrt((x - c.real) ** 2 + (y - c.imag) ** 2) - r)
        inl = np.flatnonzero(dist < threshold)  # MATLAB: find(dist < threshold)
        if inl.size > best_count:
            best_count = int(inl.size)
            c_best, r_best, inl_best = c, r, inl
    if inl_best.size > 0:
        c_best, r_best = least_squares_circle(x[inl_best], y[inl_best])
    return c_best, r_best, inl_best


def ransac_init_adaptive(f, d, n=None, rng=None):
    """自适应阈值 RANSAC 初始化（两轮 MAD）。

    流程：
      ① 粗圆：阈值放宽到 peak*0.2，先找到一个"大致像圆"的模型；
      ② 用粗圆算每个点到圆的距离，取其 MAD 作为噪声尺度 sigma_hat；
      ③ 细阈值 thr = max(3*sigma_hat, peak*0.001)，再跑一次 RANSAC 拿内点；
      ④ 从内点的角度序列里同时估出 Fseed（谐振频率）与 Qseed（Q_L）。

    参数
    ----
    f : 频率数组（Hz，裁剪窗口内）
    d : 复数 S21 数组（与 f 等长）
    n : 参与计算的点数；缺省取 len(f)（MATLAB 里是显式传入的 N）
    rng : 随机数发生器；缺省用 default_rng(0)（固定种子 → 可复现）

    返回 (f_seed, q_seed, inlier_idx, diag)
    diag 是本移植版附加的诊断字典（不参与任何数值计算，只给体检台看）。
    """
    f = np.asarray(f, dtype=float)
    d = np.asarray(d, dtype=complex)
    if n is None:
        n = f.size
    if rng is None:
        rng = np.random.default_rng(0)

    # ---------- ① 粗圆 ----------
    peak = float(np.max(np.abs(d)))
    c0, r0, _ = ransac_circle(d, 200, peak * 0.2, rng)
    if not np.isfinite(r0) or r0 <= 0:
        raise RuntimeError("RANSAC coarse circle failed")

    # ---------- ② MAD 噪声尺度 ----------
    dist0 = np.abs(np.sqrt((d.real - c0.real) ** 2 + (d.imag - c0.imag) ** 2) - r0)
    sigma_hat = 1.4826 * np.median(np.abs(dist0 - np.median(dist0)))

    # ---------- ③ 细阈值 + 第二次 RANSAC ----------
    thr = max(3.0 * sigma_hat, peak * 0.001)
    c, r, inl = ransac_circle(d, 200, thr, rng)
    if inl.size == 0 or r <= 0:
        raise RuntimeError("RANSAC refined circle failed")

    inlier_s = d[inl]
    inlier_f = f[inl]

    # ---------- ④ 角度序列 → Fseed / Qseed ----------
    m = matlab_round(0.15 * n)  # MATLAB: 1 : round(0.15*N)
    k = matlab_round(0.85 * n)  # MATLAB: round(0.85*N) : N
    idx_tail = np.concatenate([np.arange(0, m), np.arange(k - 1, n)])
    sv_est = np.mean(d[idx_tail])  # 背景点的粗估计（首尾各 15% 点的均值）
    sv_proj = c + (sv_est - c) * r / abs(sv_est - c + EPS)  # 径向投影到圆上
    s_peak_est = 2.0 * c - sv_proj  # 背景点关于圆心的对径点 ≈ 峰顶

    theta = np.angle((inlier_s - c) / (sv_proj - c + EPS))
    theta_unwrap = np.unwrap(theta)  # 解开 ±π 跳变，得到连续角度
    theta_span = float(theta_unwrap.max() - theta_unwrap.min())

    if theta_span < 1.0:
        # 圆弧太短（几乎没有谐振特征）→ 退化为"峰值点 + 窗口宽度"的保守估计
        i_max = int(np.argmax(np.abs(d)))
        f_seed = float(f[i_max])
        q_seed = 5.0 * f_seed / (f[-1] - f[0])
    else:
        i_pk = int(np.argmin(np.abs(d - s_peak_est)))
        f_seed = float(f[i_pk])
        i1 = int(np.argmin(theta_unwrap))
        i2 = int(np.argmax(theta_unwrap))
        f1, f2 = float(inlier_f[i1]), float(inlier_f[i2])
        tan1, tan2 = float(np.tan(theta_unwrap[i1])), float(np.tan(theta_unwrap[i2]))
        if abs(f2 - f1) > EPS:
            q_seed = abs(f_seed * (tan1 - tan2) / (2.0 * (f2 - f1)))
        else:
            q_seed = 5.0 * f_seed / (f[-1] - f[0])
        if q_seed < 10.0 or not np.isfinite(q_seed):
            q_seed = 5.0 * f_seed / (f[-1] - f[0])

    diag = {
        "peak": peak,
        "c0": c0,
        "r0": r0,
        "sigma_hat": sigma_hat,
        "thr": thr,
        "c": c,
        "r": r,
        "n_inliers": int(inl.size),
        "n": int(n),
        "sv_est": sv_est,
        "sv_proj": sv_proj,
        "s_peak_est": s_peak_est,
        "theta": theta,
        "theta_unwrap": theta_unwrap,
        "theta_span": theta_span,
        "i1": i1 if theta_span >= 1.0 else None,
        "i2": i2 if theta_span >= 1.0 else None,
        "f1": f1 if theta_span >= 1.0 else None,
        "f2": f2 if theta_span >= 1.0 else None,
    }
    return f_seed, q_seed, inl, diag
