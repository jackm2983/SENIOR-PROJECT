#!/usr/bin/env python3
"""
plot fpga streamer output. auto-detects snn vs encoding, and for encoding mode
applies the right semantics per encoder type.

the csv does not record which encoder ran (the fpga packs the same fields for
all of them), so pass --enc to tell the plotter how to read the spike_p field:

  rate / delta / multispike : spike_p is a spike COUNT per window
  temporal                  : spike_p is the spike POSITION in the window
                              (time-to-first-spike), not a count

usage:
  python plot_results.py fpga_results.csv --enc rate
  python plot_results.py fpga_results.csv --enc temporal
  python plot_results.py fpga_results.csv            # snn or generic encoding
"""
import sys
import argparse
import pandas as pd
import matplotlib.pyplot as plt

p = argparse.ArgumentParser()
p.add_argument('csv', nargs='?', default='fpga_results.csv')
p.add_argument('--enc', choices=['rate', 'temporal', 'delta', 'multispike'],
               default=None, help='which encoder produced this capture')
args = p.parse_args()

csv_file = args.csv
enc = args.enc
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

# encoding panel, semantics depend on encoder
if has_enc:
    ax = axes[panels.index('enc')]
    sp = df['spike_p'].fillna(0)
    sn = df['spike_n'].fillna(0)

    if enc == 'temporal':
        # spike_p holds the time-to-first-spike position (0..63), not a count.
        # plot it as a position trace. there is no negative-spike component.
        ax.plot(df['sample_idx'], sp, label='spike position', lw=0.6, color='purple')
        ax.set_ylabel('temporal\nspike position')
        ax.set_ylim(0, 64)
        ax.legend(loc='upper right')

    elif enc == 'delta':
        # delta is the only encoder that drives spike_n. show both polarities.
        ax.plot(df['sample_idx'], sp, label='spike_p (up)', lw=0.6, color='green')
        ax.plot(df['sample_idx'], -sn, label='spike_n (down)', lw=0.6, color='red')
        ax.set_ylabel('delta\nspike count')
        ax.legend(loc='upper right')

    elif enc in ('rate', 'multispike'):
        # count-coded, spike_n is always 0 for these. show count only.
        label = f'{enc} spike count'
        ax.plot(df['sample_idx'], sp, label=label, lw=0.6, color='green')
        ax.set_ylabel(f'{enc}\nspike count')
        ax.legend(loc='upper right')

    else:
        # no --enc given: generic view, show both fields as before
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
mode_str = 'snn' if has_snn else (enc if enc else 'encoding')
print(f"saved {out}  (mode: {mode_str})")
