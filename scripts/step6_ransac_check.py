"""
第六步：RANSAC 初始化模块体检台（FinalFitPipeline 移植 · 模块 3/6）

体检对象：rstest.fitting.ransac.ransac_init_adaptive
职责：在复平面上的 S21 轨迹里"盲找"那个圆，输出两个种子——
    Fseed —— 谐振频率的粗估计（Hz），给线性初值拟合当靶心
    Qseed —— Q_L 的粗估计（无量纲），给线性初值拟合定权重形状

运行方式（必须在项目根目录！）：
    python -m scripts.step6_ransac_check
"""

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import skrf as rf

from rstest.fitting.crop import crop_3db
from rstest.fitting.ransac import ransac_init_adaptive

S2P = Path("data/20260721_MOVCDLAO/MOVCDLAO_24.36K.s2p")
QL_GOLD = 1_412_238.9  # MATLAB 金标准（batch 第 66 行）
QU_GOLD = 1_426_731.2  # 同一行；d = 1 - QL/Qu 可反推金标准的圆直径
SEED = 0  # 固定随机种子 → 体检结果可复现


def main():
    # ---------- 1. 读数据 → 裁剪（模块 2 的成果直接复用） ----------
    ntwk = rf.Network(S2P)
    f_all = ntwk.f
    s_all = ntwk.s[:, 1, 0]
    f_c, d_c, n_c = crop_3db(f_all, s_all)

    # ---------- 2. 体检对象 ----------
    f_seed, q_seed, inl, dg = ransac_init_adaptive(
        f_c, d_c, n_c, rng=np.random.default_rng(SEED)
    )

    mag = np.abs(d_c)
    i_argmax = int(np.argmax(mag))
    step = f_c[1] - f_c[0]
    d_gold = 1.0 - QL_GOLD / QU_GOLD  # 金标准圆直径（由 Qu/QL 反推）

    # ---------- 3. 两个诊断量（管线不采用，仅供判读） ----------
    # 诊断①：半角理论公式。tan((θ+π)/2) 才对频率严格线性（tan(θ) 不是）。
    i1, i2 = dg["i1"], dg["i2"]
    if i1 is not None:
        th = dg["theta_unwrap"]
        q_half = abs(
            f_seed
            * (np.tan((th[i1] + np.pi) / 2.0) - np.tan((th[i2] + np.pi) / 2.0))
            / (2.0 * (dg["f2"] - dg["f1"]))
        )
    else:
        q_half = float("nan")

    # 诊断②：圆上落点检验——裁剪窗口的两个端点也在圆弧上，应落在圆上
    r_lo = abs(d_c[0] - dg["c"]) / dg["r"]
    r_hi = abs(d_c[-1] - dg["c"]) / dg["r"]
    r_bg = abs(dg["sv_est"] - dg["c"]) / dg["r"]  # 背景点估计在圆内，正常

    # ---------- 4. 体检表 ----------
    print("=== RANSAC 初始化体检表（24.36K 实测数据）===")
    print(
        f"[1] 输入窗口      : {n_c} 点 | 步进 {step:.4f} Hz | 峰值 |S| = {dg['peak']:.6f}"
        f" @ 第 {i_argmax} 点"
    )
    print(
        f"[2] 粗圆 C0 / R0  : {dg['c0'].real:+.6f} {dg['c0'].imag:+.6f}j | R0 = {dg['r0']:.6f}"
        f"   (粗阈值 0.2*peak = {dg['peak'] * 0.2:.3e})"
    )
    print(f"[3] 噪声尺度 σ̂    : {dg['sigma_hat']:.3e}   (点到粗圆距离残差的 MAD)")
    print(
        f"[4] 细阈值 thr    : {dg['thr']:.3e}"
        f"   [3σ̂ = {3 * dg['sigma_hat']:.3e} | 0.001*peak = {dg['peak'] * 0.001:.3e}]"
    )
    print(
        f"[5] 细圆 C / R    : {dg['c'].real:+.6f} {dg['c'].imag:+.6f}j | R = {dg['r']:.6f}"
        f" | 直径 2R = {2 * dg['r']:.6f}"
    )
    print(
        f"[6] 内点率        : {dg['n_inliers']} / {dg['n']} = "
        f"{dg['n_inliers'] / dg['n'] * 100:.1f}%   (应 > 80%)"
    )
    print(
        f"[7] 圆上落点检验  : 窗口两端 |S-C|/R = {r_lo:.4f} / {r_hi:.4f}   (应 ≈ 1.000)"
    )
    print(
        f"     背景点估计     : |Sv_est-C|/R = {r_bg:.4f}   (弧上点的均值落在圆内，正常)"
    )
    print(f"[8] 圆弧角跨度    : {np.degrees(dg['theta_span']):.2f}°")
    print(
        f"[9] Fseed         : {f_seed / 1e9:.9f} GHz"
        f"   (argmax 峰位 {f_c[i_argmax] / 1e9:.9f} GHz，偏差 {(f_seed - f_c[i_argmax]) / 1e3:+.2f} kHz)"
    )
    print(
        f"[10] Qseed        : {q_seed:,.0f}   (金标准 QL = {QL_GOLD:,.1f}，比值 {q_seed / QL_GOLD:.4f})"
    )
    print(
        f"     半角公式对照  : {q_half:,.0f}   (比值 {q_half / QL_GOLD:.4f})  ← 仅诊断，管线不采用"
    )
    print(f"     金标准直径 d  : {d_gold:.6f}   (由 1 - QL/Qu 反推，应与 2R 同量级)")

    # ---------- 5. 两视图 ----------
    fig, axes = plt.subplots(1, 2, figsize=(13, 5.5))

    # 左：复平面（圆的战场）
    ax = axes[0]
    ax.plot(d_c.real, d_c.imag, ".", ms=3, color="0.75", label="cropped points")
    ax.plot(d_c[inl].real, d_c[inl].imag, ".", ms=3, color="tab:blue", label="inliers")
    tc = np.linspace(0.0, 2.0 * np.pi, 400)
    ax.plot(
        dg["c"].real + dg["r"] * np.cos(tc),
        dg["c"].imag + dg["r"] * np.sin(tc),
        "--",
        lw=1.2,
        color="tab:red",
        label="RANSAC circle",
    )
    ax.plot(
        dg["c"].real, dg["c"].imag, "x", ms=10, mew=2, color="tab:red", label="center C"
    )
    ax.plot(dg["sv_est"].real, dg["sv_est"].imag, "s", ms=7, color="k", label="Sv_est")
    ax.plot(
        dg["s_peak_est"].real,
        dg["s_peak_est"].imag,
        "^",
        ms=7,
        color="tab:green",
        label="S_peak_est",
    )
    ax.set_xlabel("Re(S21)")
    ax.set_ylabel("Im(S21)")
    ax.set_aspect("equal")  # 不设等比例，圆会被压成椭圆
    ax.legend(fontsize=8)

    # 右：|S21| 幅度（Fseed 的靶心对不对）
    ax = axes[1]
    ax.plot(
        f_all / 1e6,
        20 * np.log10(np.abs(s_all)),
        lw=0.8,
        color="0.7",
        label="full sweep",
    )
    ax.plot(
        f_c / 1e6, 20 * np.log10(mag), lw=1.2, color="tab:blue", label="crop window"
    )
    ax.axhline(
        20 * np.log10(dg["peak"] / np.sqrt(2.0)),
        ls="--",
        lw=1,
        color="tab:red",
        label="-3 dB threshold",
    )
    ax.axvline(f_seed / 1e6, ls=":", lw=1.2, color="tab:green", label="Fseed")
    ax.set_xlabel("Frequency (MHz)")
    ax.set_ylabel("|S21| (dB)")
    ax.legend(fontsize=8)

    plt.tight_layout()
    plt.savefig("data/step6_ransac_check.png", dpi=150)
    print("图已存到 data/step6_ransac_check.png")


if __name__ == "__main__":
    main()
