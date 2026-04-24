#!/usr/bin/env python3
"""
plot fpga streamer output. auto-detects mode (snn vs encoding) and only
shows panels with data.

usage: python plot_results.py fpga_results.csv
"""
import sys
import pandas as pd
import matplotlib.pyplot as plt

csv_file = sys.argv[1] if len(sys.argv) > 1 else 'fpga_results.csv'
df = pd.read_csv(csv_file)

# coerce empty strings to NaN, then to numeric
for col in ['spike_p', 'spike_n', 'fire', 'winner']:
    if col in df.columns:
        df[col] = pd.to_numeric(df[col], errors='coerce')

# detect mode by which cols have non-nan data
has_enc = ('spike_p' in df.columns and df['spike_p'].notna().any())
has_snn = ('fire' in df.columns and df['fire'].notna().any())

panels = ['ecg']
if has_enc: panels.append('enc')
if has_snn: panels.append('snn')

fig, axes = plt.subplots(len(panels), 1, figsize=(12, 2.2 * len(panels)), sharex=True)
if len(panels) == 1:
    axes = [axes]

# ecg trace
ax_ecg = axes[panels.index('ecg')]
ax_ecg.plot(df['sample_idx'], df['ecg_value'], lw=0.6, color='steelblue')
ax_ecg.set_ylabel('ecg (12-bit)')
ax_ecg.grid(alpha=0.3)

# annotations overlaid on ecg
ann = df[df['ground_truth'].notna() & (df['ground_truth'].astype(str) != '')]
for _, row in ann.iterrows():
    ax_ecg.axvline(row['sample_idx'], color='r', alpha=0.15, lw=0.5)

# encoding spikes
if has_enc:
    ax = axes[panels.index('enc')]
    sp = df['spike_p'].fillna(0)
    sn = df['spike_n'].fillna(0)
    ax.plot(df['sample_idx'], sp, label='spike_p', lw=0.6, color='green')
    ax.plot(df['sample_idx'], -sn, label='spike_n', lw=0.6, color='red')
    ax.set_ylabel('spikes')
    ax.legend(loc='upper right')
    ax.grid(alpha=0.3)

# snn outputs
if has_snn:
    ax = axes[panels.index('snn')]
    ax.plot(df['sample_idx'], df['fire'], label='fire bitmask', lw=0.6, color='steelblue')
    ax.plot(df['sample_idx'], df['winner'], label='winner idx', lw=0.6, color='orange', alpha=0.7)
    ax.set_ylabel('snn')
    ax.legend(loc='upper right')
    ax.grid(alpha=0.3)

axes[-1].set_xlabel('sample index')
plt.tight_layout()

out = csv_file.replace('.csv', '.png')
plt.savefig(out, dpi=120)
print(f"saved {out}  (mode: {'snn' if has_snn else 'encoding'})")
plt.show()