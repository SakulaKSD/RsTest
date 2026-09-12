"""rstest.fitting.model —— 复洛伦兹谐振模型（FinalFitPipeline.m 移植 · 模块 1/6）

数学模型（与 MATLAB 参考实现逐符号一致）：

    S(f) = (m1 + j*m2) + (m3 + j*m4) / (1 + 2j*(m6*f/f_ref - m5))

参数表：
    m1, m2 : 背景项的实部/虚部（复平面圆弧的"出发点"）
    m3, m4 : 谐振半径向量的实部/虚部（圆直径 d = |m3 + j*m4|）
    m5     : Q_L（有载品质因数）
    m6     : 频率编码；谐振频率 F_L = m5 * f_ref / m6
    f_ref  : 参考频率（MATLAB 实现里取裁剪窗口的第一个频率点。
             纯技术参数：取任何值物理结果不变，只改变 m6 的读数）

出处：Derived from NLQFIT6, NPL Report MAT 58 (A. P. Gregory, 2021, CC0).
"""

import numpy as np


def resonance_model(f, m1, m2, m3, m4, m5, m6, f_ref):
    """计算复洛伦兹模型 S(f)。f 可为标量或数组，返回同形状的复数结果。"""
    f = np.asarray(f, dtype=float)
    den = 1.0 + 2j * (m6 * f / f_ref - m5)
    return (m1 + 1j * m2) + (m3 + 1j * m4) / den


def fl_from_params(m5, m6, f_ref):
    """从 (m5, m6, f_ref) 还原谐振频率：F_L = m5 * f_ref / m6。"""
    return m5 * f_ref / m6


def q_circle_diam(m1, m2, m3, m4, a=1.0):
    """耦合圆直径 d = |(m1+m3 + j*(m2+m4)) - (m1 + j*m2)| * a。"""
    b = (m1 + m3) + 1j * (m2 + m4)
    s_v = m1 + 1j * m2
    return abs(b - s_v) * a


def angular_weights(f, f_r, q_l):
    """IRLS 角度权重：w = 1 / (1 + (2*Q*(f-f_r)/f_r)^2)。"""
    ptmp = 2.0 * q_l * (f - f_r) / f_r
    return 1.0 / (ptmp**2 + 1.0)
