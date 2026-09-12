"""
第三步：把 S21 画到复平面上——换一双眼睛看谐振。
dB 图是"俯视图"（只看幅度），复平面图是"全景"（幅度+相位一起看）。
单极谐振在复平面上是一段圆弧：这步先看清楚，下一步做圆拟合。
"""

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import skrf as rf

ntwk = rf.Network(Path("data/20260721_MOVCDLAO/MOVCDLAO_24.36K.s2p"))
s21 = ntwk.s[:, 1, 0]  # 复数数组：每个点 = 实部 + j*虚部
freq = ntwk.f / 1e6  # MHz
db = 20 * np.log10(np.abs(s21))

fig, axes = plt.subplots(1, 3, figsize=(15, 5))

# 面板1：|S21| dB（老朋友，这次把峰顶标出来）
axes[0].plot(freq, db, lw=1)
i_peak = np.argmax(db)
axes[0].plot(freq[i_peak], db[i_peak], "ro")
axes[0].annotate(
    f"peak {db[i_peak]:.1f} dB",
    (freq[i_peak], db[i_peak]),
    xytext=(10, -30),
    textcoords="offset points",
    arrowprops=dict(arrowstyle="->"),
)
axes[0].set_xlabel("Frequency (MHz)")
axes[0].set_ylabel("|S21| (dB)")

# 面板2：相位
axes[1].plot(freq, np.angle(s21, deg=True), lw=1)
axes[1].set_xlabel("Frequency (MHz)")
axes[1].set_ylabel("Phase (deg)")

# 面板3：复平面轨迹（今天的主角）
sc = axes[2].scatter(s21.real, s21.imag, c=np.arange(len(s21)), s=4, cmap="coolwarm")
fig.colorbar(sc, ax=axes[2], label="point index (frequency order)")
axes[2].set_xlabel("Re(S21)")
axes[2].set_ylabel("Im(S21)")
axes[2].set_aspect("equal")  # 不设等比例，圆会被压成椭圆！

plt.tight_layout()
plt.savefig("data/step3_complex_view.png", dpi=150)
print("峰顶:", round(float(db[i_peak]), 2), "dB @", freq[i_peak], "MHz")
print("图已存到 data/step3_complex_view.png")
