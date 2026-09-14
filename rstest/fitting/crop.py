"""rstest.fitting.crop —— -3dB 窗口裁剪（FinalFitPipeline.m 移植 · 模块 2/6）

对应 MATLAB 参考实现里的 crop3dB：
    S2P 全窗口 → 找 |S| 峰顶 → 阈值 thr = 峰顶/√2（幅度 -3.01 dB）
    → 向左右走到第一个跌破 thr 的点，量出宽度点数 BW_pts
    → 以峰顶为中心、左右各留 round(3 * BW_pts / 2) 点 → 输出裁剪子集

移植要点（与 MATLAB 逐位对齐）：
  1) 索引体系：MATLAB 从 1 数起，Python 从 0 数起。凡是"差值"（BW_pts）
     在两套体系里完全相同，所以 BW_pts 不需要任何修正；只有"边界"和
     "切片"需要换算法。
  2) 取整：MATLAB 的 round 是四舍五入（远离零），而 Python 内置 round 与
     numpy 的 np.round 都是"银行家舍入"（.5 向偶数靠）。当 BW_pts 为奇数时
     3*BW_pts/2 正好落在 .5 上，两者会差 1 个点 → 必须用 floor(x + 0.5) 复刻。
"""

import numpy as np


def crop_3db(f, d):
    """按 MATLAB crop3dB 的规则，裁剪到谐振峰周围（总宽 3 倍 -3dB 带宽）。

    参数
    ----
    f : 频率数组（Hz），一维
    d : 复数 S21 数组，与 f 等长

    返回
    ----
    (fc, dc, n) : 裁剪后的频率数组、复数数据、点数
    """
    f = np.asarray(f, dtype=float)
    d = np.asarray(d, dtype=complex)

    s_mag = np.abs(d)  # MATLAB: abs(D)，线性幅度
    n_all = s_mag.size
    idx_peak = int(np.argmax(s_mag))  # MATLAB: [~, idx_peak] = max(S_mag)
    thr = s_mag[idx_peak] / np.sqrt(2.0)  # -3dB 阈值

    # 从峰顶向左走，直到幅度跌破阈值（或撞到左边界 idx=0）
    idx_left = idx_peak
    while idx_left > 0 and s_mag[idx_left] >= thr:
        idx_left -= 1

    # 从峰顶向右走，直到幅度跌破阈值（或撞到右边界 idx=n_all-1）
    idx_right = idx_peak
    while idx_right < n_all - 1 and s_mag[idx_right] >= thr:
        idx_right += 1

    bw_pts = idx_right - idx_left  # -3dB 宽度的点数（差值，与索引体系无关）
    half = int(np.floor(3 * bw_pts / 2 + 0.5))  # MATLAB 式四舍五入

    i_lo = max(0, idx_peak - half)
    i_hi = min(n_all - 1, idx_peak + half)

    fc = f[i_lo : i_hi + 1]  # Python 切片右端不含 → +1 才等于 MATLAB 的闭区间
    dc = d[i_lo : i_hi + 1]
    return fc, dc, fc.size
