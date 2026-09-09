"""
第一步：读取一个 Touchstone .s2p 文件，看看里面有什么。
这是整个复现工程的第一块砖。
"""

import matplotlib.pyplot as plt
import numpy as np
import skrf as rf

# scikit-rf 的惯用简称，全社区都这么写


# ① 读文件：rf.Network 会自动解析 Touchstone 格式
#    "data/你的样品.s2p" 换成你的实际文件名
ntwk = rf.Network("data/20260721_MOVCDLAO/MOVCDLAO_24.36K.s2p")

# ② 看看它"自我介绍"：频率点数、单位、S 参数维度
print(ntwk)  # 直接 print 一个对象，Python 会调用它的 __str__ 方法

# ③ 提取 S21：二端口网络的 S 参数矩阵是 (点数, 2, 2)
#    s[:, 1, 0] 的意思是：所有频率点(:)，第 2 个端口输出(1)，第 1 个端口输入(0)
freq = ntwk.f  # 频率数组，单位 Hz
s21 = ntwk.s[:, 1, 0]  # S21 复数数组（幅度+相位）

# ④ 画幅度图（dB）和相位图，肉眼确认读对了
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(8, 6), sharex=True)
ax1.plot(freq / 1e9, 20 * np.log10(np.abs(s21)))  # dB = 20*log10(|S21|)
ax1.set_ylabel("|S21| (dB)")
ax2.plot(freq / 1e9, np.angle(s21, deg=True))  # 相位（度）
ax2.set_ylabel("Phase (deg)")
ax2.set_xlabel("Frequency (GHz)")
plt.tight_layout()
plt.savefig("data/step1_check.png", dpi=150)  # 存图，方便回看
plt.show()
print("图已存到 data/step1_check.png")
