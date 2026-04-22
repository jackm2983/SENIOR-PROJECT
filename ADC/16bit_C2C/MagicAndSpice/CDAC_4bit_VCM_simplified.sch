v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Short To VCM In Sample Phase} -360 310 0 0 0.4 0.4 {}
T {0-10us -> SPDT (Vin) Connected
>10us  -> VDD Connected} -1280 -220 1 0 0.4 0.4 {}
T {Switching Scheme:
Sample Phase (clk low)
	Top plate - > Vin
	Bottom Plate -> VCM
Evaluate Phase (clk high)
	Top Plate -> Digital 1 or 0 (forming guess voltage)
	Bottom Plate -> Open} -1180 -630 0 0 0.4 0.4 {}
T {rising edge sample, falling edge evaluate
} -1180 -440 0 0 0.4 0.4 {}
T {During Sample phase (clk high):
Vin -> Top Plate
Vcm -> Bottom Plate
This charges the output to Vcm - Vin} -470 -690 0 0 0.4 0.4 {}
T {During Evaluate Phase(clk low):
b0-b3 ->top plate
bottom plate ->open
Apply binary code, using charge sharing to add Vguess to output
Final output equation:
Vout = Vcm + Vguess - Vin} -390 -540 0 0 0.4 0.4 {}
T {Dummy Cap} 510 60 0 0 0.4 0.4 {}
T {b0} 150 50 0 0 0.4 0.4 {}
T {b1} -250 50 0 0 0.4 0.4 {}
T {b2} -670 40 0 0 0.4 0.4 {}
T {b3} -1070 30 0 0 0.4 0.4 {}
N 40 120 310 120 {
lab=out}
N 310 120 470 120 {
lab=out}
N -1260 -380 -10 -380 {
lab=Vin}
N -1110 200 -1090 200 {
lab=clkbar}
N 40 50 40 60 {
lab=#net1}
N -10 -380 20 -380 {
lab=Vin}
N 20 -380 20 -250 {
lab=Vin}
N 20 -380 230 -380 {
lab=Vin}
N 100 -150 120 -150 {
lab=clkbar}
N 100 -190 130 -190 {
lab=clk}
N -410 240 -400 240 {
lab=clkbar}
N -370 50 -370 60 {
lab=#net2}
N -310 -150 -290 -150 {
lab=clkbar}
N -310 -190 -280 -190 {
lab=clk}
N -390 -380 -390 -250 {
lab=Vin}
N -780 50 -780 60 {
lab=#net3}
N -720 -150 -700 -150 {
lab=clkbar}
N -720 -190 -690 -190 {
lab=clk}
N -1180 50 -1180 60 {
lab=#net4}
N -1120 -150 -1100 -150 {
lab=clkbar}
N -1120 -190 -1090 -190 {
lab=clk}
N -370 120 40 120 {
lab=out}
N -780 120 -370 120 {
lab=out}
N -1180 120 -780 120 {
lab=out}
N -800 -380 -800 -250 {
lab=Vin}
N -1200 -380 -1200 -250 {
lab=Vin}
N -460 120 -460 190 {
lab=out}
N -1110 240 -1070 240 {
lab=clk}
N -1090 320 -1060 320 {
lab=VDD}
N -1100 320 -1090 320 {
lab=VDD}
N 380 50 380 60 {
lab=#net5}
N 440 -150 460 -150 {
lab=clkbar}
N 440 -190 470 -190 {
lab=clk}
N 360 -380 360 -250 {
lab=Vin}
N 230 -380 360 -380 {
lab=Vin}
N -410 280 -400 280 {
lab=clk}
N -1100 280 -1060 280 {
lab=vcm}
C {sky130_fd_pr/cap_mim_m3_2.sym} 380 90 0 0 {name=C1 model=cap_mim_m3_2 W=5 L=5 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_2.sym} 40 90 0 0 {name=C2 model=cap_mim_m3_2 W=5 L=5 MF=1 spiceprefix=X}
C {/home/ee431/workspace/6SAR_CDAC/T_gate.sym} -460 340 1 0 {name=x2}
C {gnd.sym} -510 400 1 0 {name=l5 lab=GND}
C {lab_pin.sym} -1110 240 0 0 {name=p2 sig_type=std_logic lab=clk}
C {lab_pin.sym} -1110 200 2 1 {name=p3 sig_type=std_logic lab=clkbar}
C {lab_pin.sym} -1060 280 2 0 {name=p7 sig_type=std_logic lab=vcm}
C {lab_pin.sym} -460 490 3 0 {name=p8 sig_type=std_logic lab=vcm}
C {/home/ee431/workspace/6SAR_CDAC/SPDT.sym} 40 -100 1 0 {name=x3}
C {gnd.sym} -20 -40 1 0 {name=l4 lab=GND}
C {lab_pin.sym} -400 280 2 0 {name=p10 sig_type=std_logic lab=clk}
C {lab_pin.sym} -400 240 2 0 {name=p11 sig_type=std_logic lab=clkbar}
C {sky130_fd_pr/cap_mim_m3_2.sym} -370 90 0 0 {name=C3 model=cap_mim_m3_2 W=10 L=5 MF=1 spiceprefix=X}
C {/home/ee431/workspace/6SAR_CDAC/SPDT.sym} -370 -100 1 0 {name=x4}
C {gnd.sym} -430 -40 1 0 {name=l19 lab=GND}
C {sky130_fd_pr/cap_mim_m3_2.sym} -780 90 0 0 {name=C4 model=cap_mim_m3_2 W=10 L=10 MF=1 spiceprefix=X}
C {/home/ee431/workspace/6SAR_CDAC/SPDT.sym} -780 -100 1 0 {name=x5}
C {gnd.sym} -840 -40 1 0 {name=l24 lab=GND}
C {sky130_fd_pr/cap_mim_m3_2.sym} -1180 90 0 0 {name=C5 model=cap_mim_m3_2 W=20 L=10 MF=1 spiceprefix=X}
C {/home/ee431/workspace/6SAR_CDAC/SPDT.sym} -1180 -100 1 0 {name=x6}
C {gnd.sym} -1240 -40 1 0 {name=l29 lab=GND}
C {ipin.sym} -1260 -380 0 0 {name=p1 lab=Vin}
C {ipin.sym} -1070 240 2 0 {name=p4 lab=clk}
C {ipin.sym} -1090 200 2 0 {name=p18 lab=clkbar}
C {ipin.sym} -1100 280 0 0 {name=p19 lab=vcm}
C {iopin.sym} -1100 320 0 1 {name=p20 lab=VDD}
C {ipin.sym} -1170 -250 3 1 {name=p21 lab=b3}
C {ipin.sym} -770 -250 3 1 {name=p14 lab=b2}
C {ipin.sym} -360 -250 3 1 {name=p12 lab=b1}
C {iopin.sym} 470 120 0 0 {name=p5 lab=out}
C {lab_pin.sym} -1090 -190 0 1 {name=p15 sig_type=std_logic lab=clk}
C {lab_pin.sym} -1100 -150 0 1 {name=p17 sig_type=std_logic lab=clkbar}
C {lab_pin.sym} -690 -190 0 1 {name=p22 sig_type=std_logic lab=clk}
C {lab_pin.sym} -700 -150 0 1 {name=p23 sig_type=std_logic lab=clkbar}
C {lab_pin.sym} -280 -190 0 1 {name=p24 sig_type=std_logic lab=clk}
C {lab_pin.sym} -290 -150 0 1 {name=p25 sig_type=std_logic lab=clkbar}
C {ipin.sym} 50 -250 3 1 {name=p26 lab=b0}
C {lab_pin.sym} 130 -190 0 1 {name=p6 sig_type=std_logic lab=clk}
C {lab_pin.sym} 120 -150 0 1 {name=p27 sig_type=std_logic lab=clkbar}
C {/home/ee431/workspace/6SAR_CDAC/SPDT.sym} 380 -100 1 0 {name=x1}
C {gnd.sym} 320 -40 1 0 {name=l16 lab=GND}
C {lab_pin.sym} 470 -190 0 1 {name=p9 sig_type=std_logic lab=clk}
C {lab_pin.sym} 460 -150 0 1 {name=p13 sig_type=std_logic lab=clkbar}
C {gnd.sym} 390 -250 2 1 {name=l18 lab=GND}
C {lab_pin.sym} -1060 320 0 1 {name=p16 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -1120 -40 0 1 {name=p28 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -720 -40 0 1 {name=p29 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -310 -40 0 1 {name=p30 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 100 -40 0 1 {name=p31 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 440 -40 0 1 {name=p32 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -410 400 0 1 {name=p33 sig_type=std_logic lab=VDD}
