"""
第四步：模型解剖台（合成数据往返测试）。
用一组"已知答案"的参数伪造谐振数据，量回 f0/峰高/圆直径与理论对账。
运行方式（必须在项目根目录！）：
    python -m scripts.step4_model_check
"""

import matplotlib.pyplot as plt
import numpy as np

from rstest.fitting.model import fl_from_params, resonance_model

# ---------- 1. 裁判参数（正确答案提前写死） ----------
A_BG = 0.0008 - 0.0008j  # 背景：量级模仿 24.36K 的地板（约 -59 dB）
B_RES = 0.0085 + 0.0030j  # 半径向量：|B| ≈ 0.009，模仿实测圆直径
Q_L = 1_412_238.9  # 直接抄 MATLAB 金标准在 24.36K 的拟合值
F0 = 18.0071541e9  # argmax 验尸得到的峰顶频率 (Hz)
BW = F0 / Q_L  # 恒等式：-3dB 带宽 = f0 / QL

F_REF = F0  # 参考频率取 f0（取别的值物理不变）
M5, M6 = Q_L, Q_L  # 谐振点满足 m6*F0/F_REF = m5，故两者都取 Q_L

# ---------- 2. 伪造数据（含可复现噪声） ----------
f = np.linspace(F0 - 8 * BW, F0 + 8 * BW, 2001)
S_clean = resonance_model(
    f, A_BG.real, A_BG.imag, B_RES.real, B_RES.imag, M5, M6, F_REF
)
rng = np.random.default_rng(42)
S_noisy = S_clean + 1e-5 * (
    rng.standard_normal(f.size) + 1j * rng.standard_normal(f.size)
)

db = 20 * np.log10(np.abs(S_noisy))
i_peak = int(np.argmax(db))
i_mid = f.size // 2  # 2001 个点的正中央 = F0（linspace 对称保证）

# ---------- 3. 对账 ----------
print("=== 模型体检表 ===")
print(f"[1] 恒等式 S(F0)=a+b : 偏差 {abs(S_clean[i_mid] - (A_BG + B_RES)):.2e}")
print(f"[2] 谐振频率还原      : {fl_from_params(M5, M6, F_REF)/1e9:.9f} GHz")
print(
    f"[3] argmax 峰顶       : {f[i_peak]/1e9:.9f} GHz（偏离 F0 {(f[i_peak]-F0)/1e3:+.2f} kHz）"
)
print(
    f"[4] 圆直径 d          : 理论 {abs(B_RES):.6f} | 实测 {np.max(np.abs(S_clean - A_BG)):.6f}"
)
print(f"[5] -3dB 带宽         : f0/QL = {BW/1e3:.3f} kHz")

# ---------- 4. 三视图（与 step3 同款布局） ----------
fig, axes = plt.subplots(1, 3, figsize=(15, 5))
axes[0].plot(f / 1e6, db, lw=1)
axes[0].plot(f[i_peak] / 1e6, db[i_peak], "ro")
axes[0].set_xlabel("Frequency (MHz)")
axes[0].set_ylabel("|S21| (dB)")
axes[1].plot(f / 1e6, np.angle(S_noisy, deg=True), lw=1)
axes[1].set_xlabel("Frequency (MHz)")
axes[1].set_ylabel("Phase (deg)")
axes[2].plot(S_clean.real, S_clean.imag, "-", color="0.7", lw=1, label="clean")
axes[2].plot(S_noisy.real, S_noisy.imag, ".", ms=2, label="noisy")
axes[2].set_xlabel("Re(S21)")
axes[2].set_ylabel("Im(S21)")
axes[2].set_aspect("equal")
axes[2].legend()
plt.tight_layout()
plt.savefig("data/step4_model_check.png", dpi=150)
print("图已存到 data/step4_model_check.png")
