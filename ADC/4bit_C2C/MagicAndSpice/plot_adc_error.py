import numpy as np
import matplotlib.pyplot as plt

filename = "adc_tran.txt"

vref = 5.0
nbits = 4
logic_thresh = 0.9

# your SAR takes about 4 clock cycles:
# 4 * 625 us = 2.5 ms
conversion_delay = 2.5e-3

# ignore startup/reset region
ignore_before = 625e-6

data = np.loadtxt(filename)

# ngspice wrdata format:
# time Vin time OUT0 time OUT1 time OUT2 time OUT3 time VALID
t = data[:, 0]
vin = data[:, 1]
out0 = data[:, 3]
out1 = data[:, 5]
out2 = data[:, 7]
out3 = data[:, 9]
valid = data[:, 11]

print("file info")
print(f"rows: {len(data)}")
print(f"time range: {t[0]:.6g} to {t[-1]:.6g} s")
print(f"Vin range: {vin.min():.4f} to {vin.max():.4f} V")
print(f"VALID range: {valid.min():.4g} to {valid.max():.4g} V")
print(f"OUT0 range: {out0.min():.4g} to {out0.max():.4g} V")
print(f"OUT1 range: {out1.min():.4g} to {out1.max():.4g} V")
print(f"OUT2 range: {out2.min():.4g} to {out2.max():.4g} V")
print(f"OUT3 range: {out3.min():.4g} to {out3.max():.4g} V")

valid_hi = valid > logic_thresh

# sample once per conversion at valid rising edge
sample_idx = np.where((valid_hi[1:] == True) & (valid_hi[:-1] == False))[0] + 1

# remove startup samples
sample_idx = sample_idx[t[sample_idx] > ignore_before]

if len(sample_idx) == 0:
    raise SystemExit("No VALID rising edges found. Check VALID waveform or threshold.")

# decode bits at valid rising edge
bits = np.column_stack([
    out0[sample_idx] > logic_thresh,
    out1[sample_idx] > logic_thresh,
    out2[sample_idx] > logic_thresh,
    out3[sample_idx] > logic_thresh,
]).astype(int)

codes_lsb_first = (
    bits[:, 0] * 1 +
    bits[:, 1] * 2 +
    bits[:, 2] * 4 +
    bits[:, 3] * 8
)

codes_msb_first = (
    bits[:, 0] * 8 +
    bits[:, 1] * 4 +
    bits[:, 2] * 2 +
    bits[:, 3] * 1
)

# compare against Vin from the start of the conversion
sampled_vin_time = t[sample_idx] - conversion_delay
sampled_vin_time = np.clip(sampled_vin_time, t[0], t[-1])
vin_s = np.interp(sampled_vin_time, t, vin)

t_s = t[sample_idx]

max_code = 2**nbits - 1

# ideal ADC transfer using code bins
ideal_codes = np.floor((vin_s / vref) * (max_code + 1)).astype(int)
ideal_codes = np.clip(ideal_codes, 0, max_code)

# automatically choose bit order
err_lsb_first = codes_lsb_first - ideal_codes
err_msb_first = codes_msb_first - ideal_codes

rms_lsb_first = np.sqrt(np.mean(err_lsb_first**2))
rms_msb_first = np.sqrt(np.mean(err_msb_first**2))

if rms_msb_first < rms_lsb_first:
    codes = codes_msb_first
    bit_order = "OUT0=MSB, OUT3=LSB"
else:
    codes = codes_lsb_first
    bit_order = "OUT0=LSB, OUT3=MSB"

error_lsb = codes - ideal_codes

print("\nADC results")
print(f"samples used: {len(sample_idx)}")
print(f"conversion delay used: {conversion_delay * 1e3:.3f} ms")
print(f"bit order used: {bit_order}")
print(f"actual codes: {np.unique(codes)}")
print(f"ideal codes: {np.unique(ideal_codes)}")
print(f"max error: {np.max(error_lsb):.2f} LSB")
print(f"min error: {np.min(error_lsb):.2f} LSB")
print(f"rms error: {np.sqrt(np.mean(error_lsb**2)):.2f} LSB")

if vin.max() < 0.95 * vref:
    print("\nWARNING: Vin did not reach 5 V in this file.")

# plot 1: ideal vs actual code
plt.figure()
plt.step(vin_s, ideal_codes, where="post", label="ideal")
plt.plot(vin_s, codes, "o", label="actual")
plt.xlabel("Vin sampled at conversion start (V)")
plt.ylabel("ADC code")
plt.title("Ideal vs actual ADC code")
plt.grid(True)
plt.legend()
plt.tight_layout()

# plot 2: error
plt.figure()
plt.plot(vin_s, error_lsb, "o-")
plt.axhline(0, linewidth=1)
plt.xlabel("Vin sampled at conversion start (V)")
plt.ylabel("Error (LSB)")
plt.title("ADC code error")
plt.grid(True)
plt.tight_layout()

plt.show()
