"""
第五步：裁剪模块体检台（FinalFitPipeline.m 移植 · 模块 2/6 验收）
用 24.36K 实测数据检查 crop_3db：窗口宽度应约等于 3 倍 -3dB 带宽（≈600 点）。
运行方式（必须在项目根目录！）：
    python -m scripts.step5_crop_check
"""

import matplotlib.pyplot as plt
import numpy as np
import skrf as rf

from rstest.fitting.crop import crop_3db

FILE = "data/20260721_MOVCDLAO/MOVCDLAO_24.36K.s2p"
Q_L = 1_412_238.9  # MATLAB 金标准（batch 结果，24.36K）

ntwk = rf.Network(FILE)
f, d = ntwk.f, ntwk.s[:, 1, 0]

fc, dc, n = crop_3db(f, d)

# ---------- 体检 ----------
s_mag = np.abs(d)
peak = float(s_mag.max())
thr = peak / np.sqrt(2.0)
idx_peak = int(np.argmax(s_mag))
bw_hz = f[idx_peak] / Q_L  # 恒等式：BW = f0 / QL（金标准 Q）
df = float(f[1] - f[0])
span = float(fc[-1] - fc[0])
i_peak_c = int(np.argmax(np.abs(dc)))

print("=== 裁剪模块体检表（24.36K 实测数据）===")
print(
    f"[1] 全窗口         : {f.size} 点 | 跨度 {(f[-1]-f[0])/1e3:.3f} kHz | 步进 {df:.4f} Hz"
)
print(f"[2] 峰顶           : |S| = {peak:.6f} @ {f[idx_peak]/1e6:.6f} MHz")
print(f"[3] -3dB 阈值      : {thr:.6f}  ( = 峰顶 / √2 )")
print(f"[4] 裁剪后点数 N   : {n} 点  ( 占全窗口 {n / f.size * 100:.1f}% )")
print(f"[5] 裁剪窗口跨度   : {span/1e3:.3f} kHz")
print(
    f"[6] 窗口 / -3dB带宽: {span / bw_hz:.3f}   ( 理论 3.000；金标准 QL 反算 BW = {bw_hz/1e3:.3f} kHz )"
)
print(
    f"[7] 峰顶在窗口内   : 第 {i_peak_c} 点 / 共 {n} 点，偏离中心 {i_peak_c - (n - 1) / 2:+.1f} 点"
)
print(
    f"[8] 窗口两端幅度   : {abs(dc[0])/peak*100:.1f}% / {abs(dc[-1])/peak*100:.1f}%  ( 应 < 70.7% )"
)

# ---------- 图：全窗口 + 裁剪区 ----------
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(13, 4.5))
ax1.plot(f / 1e6, 20 * np.log10(s_mag), lw=0.8, color="0.6", label="full sweep")
ax1.plot(fc / 1e6, 20 * np.log10(np.abs(dc)), lw=1.2, color="C0", label="crop window")
ax1.axhline(20 * np.log10(thr), color="r", ls="--", lw=0.8, label="-3 dB of peak")
ax1.set_xlabel("Frequency (MHz)")
ax1.set_ylabel("|S21| (dB)")
ax1.legend(fontsize=8)

ax2.plot(fc / 1e6, 20 * np.log10(np.abs(dc)), lw=1.2, color="C0")
ax2.axhline(20 * np.log10(thr), color="r", ls="--", lw=0.8)
ax2.axvline(f[idx_peak] / 1e6, color="k", ls=":", lw=0.8)
ax2.set_xlabel("Frequency (MHz)")
ax2.set_ylabel("|S21| (dB)")

plt.tight_layout()
plt.savefig("data/step5_crop_check.png", dpi=150)
print("图已存到 data/step5_crop_check.png")
