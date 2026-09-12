"""
第二步 v2：按温度数值排序 + 颜色=温度的曲线族 + f0-T 趋势图 + 离群点标记。
修复 v1 两个 bug：字典序排序、147 项图例挤爆版面。
"""

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import skrf as rf
from matplotlib.colors import Normalize

folder = Path("data/20260721_MOVCDLAO")


def temp_of(path):
    """从文件名提取温度：MOVCDLAO_24.36K → 24.36"""
    label = path.stem.rsplit("_", 1)[1]  # '24.36K'
    return float(label[:-1])  # 24.36


files = sorted(folder.glob("*.s2p"), key=temp_of)

records = []  # 每个元素是元组：(温度, f0_MHz, 频率数组MHz, dB数组)
for f in files:
    ntwk = rf.Network(f)
    db = 20 * np.log10(np.abs(ntwk.s[:, 1, 0]))
    i = np.argmin(db)
    records.append((temp_of(f), ntwk.f[i] / 1e6, ntwk.f / 1e6, db))

temps = np.array([r[0] for r in records])
f0s = np.array([r[1] for r in records])
names = [f.name for f in files]

fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(9, 9))

# ---- 上图：147 条曲线，颜色代表温度 ----
norm = Normalize(vmin=temps.min(), vmax=temps.max())
cmap = plt.cm.viridis
for T, rec in zip(temps, records):
    ax1.plot(rec[2], rec[3], color=cmap(norm(T)), lw=0.8)
fig.colorbar(
    plt.cm.ScalarMappable(norm=norm, cmap=cmap), ax=ax1, label="Temperature (K)"
)
ax1.set_xlabel("Frequency (MHz)")
ax1.set_ylabel("|S21| (dB)")

# ---- 下图：f0 随温度的漂移（本次实验的"正片"）----
ax2.plot(temps, f0s, "o-", ms=3, lw=0.8)
med = np.median(f0s)
for T, f0, n in zip(temps, f0s, names):
    if abs(f0 - med) > 0.05:  # 偏离中位数超过 50 kHz 判为离群
        ax2.plot(T, f0, "rx", ms=12, mew=2)
        ax2.annotate(n, (T, f0), xytext=(6, 6), textcoords="offset points", fontsize=8)
        print(f"离群点: {n}  f0 = {f0:.4f} MHz")
ax2.set_xlabel("Temperature (K)")
ax2.set_ylabel("f0 (MHz)")

print(f"温度范围 {temps.min()} - {temps.max()} K，共 {len(records)} 个文件")
print(f"f0 总漂移: {(f0s[-1] - f0s[0]) * 1000:.1f} kHz")
plt.tight_layout()
plt.savefig("data/step2_f0_vs_T.png", dpi=150)
print("图已存到 data/step2_f0_vs_T.png")
