# FPGA ECG Encoder + SNN

Streams MIT-BIH ECG samples to a Basys3 (Artix-7) over UART. The FPGA runs one
of four spike encoders or a spiking neural network, then sends results back to
the PC for plotting.

## Hardware

- Basys3 board, USB to PC (UART at 115200 baud)

## Build the bitstream

Open the Vivado project (`SNN_Encoder.xpr`), generate the bitstream, program
the board. Top module is `system_top_wrapper`.

## Switches

| Switch | Function |
|--------|----------|
| SW0 | input: 0 = UART, 1 = live ADC |
| SW2 | mode: 0 = encoder, 1 = SNN |
| SW4, SW5 | encoder select (encoder mode only) |

Encoder select `{SW5, SW4}`: `00` rate, `01` temporal, `10` delta, `11` multispike.

LEDs `{LED6, LED4}` echo the live encoder select so you can confirm the mode.


## Run

```powershell
# encoder mode
python mitbih_stream.py --port COM4 --record 100 --mode encoding

# snn mode
python mitbih_stream.py --port COM4 --record 100 --mode snn
```

Set `--port` to your board's COM port. Output goes to `fpga_results.csv`.

## Plot

```powershell
python plot_results.py fpga_results.csv --enc rate
python plot_results.py fpga_results.csv --enc temporal
python plot_results.py fpga_results.csv --enc delta
python plot_results.py fpga_results.csv --enc multispike
python plot_results.py fpga_results.csv            # snn
```
