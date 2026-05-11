v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -110 40 -10 40 {
lab=DAC_B3}
N -110 100 -10 100 {
lab=DAC_B0}
N -110 80 -10 80 {
lab=DAC_B1}
N -110 60 -10 60 {
lab=DAC_B2}
N -750 -40 -410 -40 {
lab=COMP_1v8}
N -450 20 -450 270 {
lab=CLK}
N -770 -40 -750 -40 {
lab=COMP_1v8}
N -590 -20 -590 80 {
lab=RST_N}
N -590 -20 -410 -20 {
lab=RST_N}
N -590 80 -590 140 {
lab=RST_N}
N -110 -40 -10 -40 {
lab=ADC_OUT3}
N -110 -20 -10 -20 {
lab=ADC_OUT2}
N -110 0 -10 0 {
lab=ADC_OUT1}
N -110 20 -10 20 {
lab=ADC_OUT0}
N -700 250 -700 280 {
lab=VIN}
N -770 0 -770 10 {
lab=COMP_1v8}
N -770 -40 -770 0 {
lab=COMP_1v8}
N -450 -0 -450 20 {
lab=CLK}
N -450 -0 -410 0 {
lab=CLK}
N -440 210 -410 210 {
lab=CLK_N}
N -440 20 -440 210 {
lab=CLK_N}
N -440 20 -410 20 {
lab=CLK_N}
N -520 40 -520 80 {
lab=#net1}
N -520 40 -410 40 {
lab=#net1}
N -410 60 -410 90 {
lab=GND}
N -1130 110 -1040 110 {
lab=COMP}
N -740 30 -740 90 {
lab=COMP_1v8}
N -770 30 -740 30 {
lab=COMP_1v8}
N -770 10 -770 20 {
lab=COMP_1v8}
N -770 20 -770 30 {
lab=COMP_1v8}
N -1460 110 -1430 110 {
lab=VDAC}
N -1460 90 -1430 90 {
lab=VIN}
N -1170 -40 -1170 -20 {
lab=VDD5v}
N -1170 -40 -1100 -40 {
lab=VDD5v}
N -1100 -40 -1100 90 {
lab=VDD5v}
N -1130 90 -1100 90 {
lab=VDD5v}
N -1040 -40 -1040 -20 {
lab=VDD1v8}
N -1060 -40 -1040 -40 {
lab=VDD1v8}
N -1060 -40 -1060 90 {
lab=VDD1v8}
N -1060 90 -1040 90 {
lab=VDD1v8}
N -100 750 -20 750 {
lab=VDAC}
N -20 750 -20 830 {
lab=VDAC}
N -430 830 -20 830 {
lab=VDAC}
N -430 750 -430 830 {
lab=VDAC}
N -430 750 -400 750 {
lab=VDAC}
N -20 750 0 750 {
lab=VDAC}
N -490 730 -450 730 {
lab=R2R}
N -450 730 -400 730 {
lab=R2R}
N -1570 400 -1520 400 {
lab=DAC_B3}
N -1480 430 -1480 460 {
lab=GND}
N -1480 330 -1480 370 {
lab=VDD1v8}
N -1440 400 -1380 400 {
lab=DAC_B3_N}
N -1570 570 -1520 570 {
lab=DAC_B2}
N -1480 600 -1480 630 {
lab=GND}
N -1480 500 -1480 540 {
lab=VDD1v8}
N -1440 570 -1380 570 {
lab=DAC_B2_N}
N -1570 730 -1520 730 {
lab=DAC_B1}
N -1480 760 -1480 790 {
lab=GND}
N -1480 660 -1480 700 {
lab=VDD1v8}
N -1440 730 -1380 730 {
lab=DAC_B1_N}
N -1570 890 -1520 890 {
lab=DAC_B0}
N -1480 920 -1480 950 {
lab=GND}
N -1480 820 -1480 860 {
lab=VDD1v8}
N -1440 890 -1380 890 {
lab=DAC_B0_N}
N -1380 400 -1220 400 {
lab=DAC_B3_N}
N -1220 350 -1220 380 {
lab=VDD5v}
N -1220 520 -1220 550 {
lab=VDD5v}
N -1220 680 -1220 710 {
lab=VDD5v}
N -1220 840 -1220 870 {
lab=VDD5v}
N -1380 890 -1220 890 {
lab=DAC_B0_N}
N -1380 730 -1220 730 {
lab=DAC_B1_N}
N -1380 570 -1220 570 {
lab=DAC_B2_N}
N -920 870 -880 870 {
lab=b0_5v}
N -880 730 -880 870 {
lab=b0_5v}
N -880 730 -790 730 {
lab=b0_5v}
N -920 710 -810 710 {
lab=b1_5v}
N -810 710 -810 750 {
lab=b1_5v}
N -810 750 -790 750 {
lab=b1_5v}
N -920 550 -840 550 {
lab=b2_5v}
N -840 550 -840 770 {
lab=b2_5v}
N -840 770 -790 770 {
lab=b2_5v}
N -920 380 -870 380 {
lab=b3_5v}
N -870 380 -870 780 {
lab=b3_5v}
N -870 780 -870 790 {
lab=b3_5v}
N -870 790 -790 790 {
lab=b3_5v}
C {code.sym} 70 -220 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 150 110 0 0 {name=spice1 only_toplevel=false value="
.tran 10000n 10m
.control
run
.endc"}
C {lab_pin.sym} -10 40 2 0 {name=p1 sig_type=std_logic lab=DAC_B3}
C {lab_pin.sym} -10 60 2 0 {name=p2 sig_type=std_logic lab=DAC_B2}
C {lab_pin.sym} -10 80 2 0 {name=p3 sig_type=std_logic lab=DAC_B1}
C {lab_pin.sym} -10 100 2 0 {name=p4 sig_type=std_logic lab=DAC_B0}
C {vsource.sym} -450 300 0 0 {name=V1 value="PULSE(0 1.8 50n       10n 10n 312.4u 625u)" savecurrent=false}
C {gnd.sym} -450 330 0 0 {name=l3 lab=GND}
C {vsource.sym} -520 110 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -520 140 0 0 {name=l4 lab=GND}
C {gnd.sym} -590 200 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -10 -40 2 0 {name=p6 sig_type=std_logic lab=ADC_OUT3}
C {lab_pin.sym} -10 -20 2 0 {name=p7 sig_type=std_logic lab=ADC_OUT2}
C {lab_pin.sym} -10 0 2 0 {name=p8 sig_type=std_logic lab=ADC_OUT1}
C {lab_pin.sym} -10 20 2 0 {name=p9 sig_type=std_logic lab=ADC_OUT0}
C {vsource.sym} -590 170 0 0 {name=V4 value="PULSE(0 1.8 2m 10n 10n 1e9 2e9)" savecurrent=false}
C {vsource.sym} -700 310 0 0 {name=V5 value=2.75 savecurrent=false}
C {gnd.sym} -700 340 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -700 250 2 0 {name=p10 sig_type=std_logic lab=VIN}
C {lab_pin.sym} -1080 110 3 0 {name=p11 sig_type=std_logic lab=COMP}
C {lab_pin.sym} -590 40 2 0 {name=p12 sig_type=std_logic lab=RST_N}
C {lab_pin.sym} -450 60 2 0 {name=p13 sig_type=std_logic lab=CLK}
C {vsource.sym} -410 240 0 0 {name=V6 value="PULSE(0 1.8 312.55u   10n 10n 312.4u 625u)" savecurrent=false}
C {gnd.sym} -410 270 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -440 160 2 0 {name=p5 sig_type=std_logic lab=CLK_N}
C {lab_pin.sym} 0 750 2 0 {name=p14 sig_type=std_logic lab=VDAC}
C {gnd.sym} -410 90 0 0 {name=l10 lab=GND}
C {lab_pin.sym} -1460 90 0 0 {name=p15 sig_type=std_logic lab=VIN}
C {lab_pin.sym} -1460 110 0 0 {name=p16 sig_type=std_logic lab=VDAC}
C {vsource.sym} -1170 10 0 0 {name=V3 value=5 savecurrent=false}
C {gnd.sym} -1130 130 0 0 {name=l2 lab=GND}
C {gnd.sym} -1040 130 0 0 {name=l9 lab=GND}
C {gnd.sym} -1170 40 0 0 {name=l11 lab=GND}
C {vsource.sym} -1040 10 0 0 {name=V7 value=1.8 savecurrent=false}
C {gnd.sym} -1040 40 0 0 {name=l12 lab=GND}
C {lab_pin.sym} -910 210 3 0 {name=p17 sig_type=std_logic lab=OP_AMP_OUT}
C {gnd.sym} -100 770 0 0 {name=l13 lab=GND}
C {gnd.sym} -790 830 0 0 {name=l14 lab=GND}
C {opin.sym} -450 730 3 0 {name=p22 lab=R2R}
C {lab_pin.sym} -1570 400 0 0 {name=p18 sig_type=std_logic lab=DAC_B3}
C {gnd.sym} -1480 460 0 0 {name=l7 lab=GND}
C {lab_pin.sym} -1040 -40 1 0 {name=p21 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -1480 330 2 0 {name=p23 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -1380 400 2 0 {name=p24 sig_type=std_logic lab=DAC_B3_N}
C {lab_pin.sym} -1570 570 0 0 {name=p25 sig_type=std_logic lab=DAC_B2}
C {gnd.sym} -1480 630 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -1480 500 2 0 {name=p26 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -1380 570 2 0 {name=p27 sig_type=std_logic lab=DAC_B2_N}
C {lab_pin.sym} -1570 730 0 0 {name=p28 sig_type=std_logic lab=DAC_B1}
C {gnd.sym} -1480 790 0 0 {name=l15 lab=GND}
C {lab_pin.sym} -1480 660 2 0 {name=p29 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -1380 730 2 0 {name=p30 sig_type=std_logic lab=DAC_B1_N}
C {lab_pin.sym} -1570 890 0 0 {name=p31 sig_type=std_logic lab=DAC_B0}
C {gnd.sym} -1480 950 0 0 {name=l16 lab=GND}
C {lab_pin.sym} -1480 820 2 0 {name=p32 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -1380 890 2 0 {name=p33 sig_type=std_logic lab=DAC_B0_N}
C {gnd.sym} -1220 420 0 0 {name=l17 lab=GND}
C {lab_pin.sym} -1130 -40 1 0 {name=p34 sig_type=std_logic lab=VDD5v}
C {lab_pin.sym} -1220 350 2 0 {name=p35 sig_type=std_logic lab=VDD5v}
C {gnd.sym} -1220 590 0 0 {name=l18 lab=GND}
C {lab_pin.sym} -1220 520 2 0 {name=p36 sig_type=std_logic lab=VDD5v}
C {gnd.sym} -1220 750 0 0 {name=l19 lab=GND}
C {lab_pin.sym} -1220 680 2 0 {name=p37 sig_type=std_logic lab=VDD5v}
C {gnd.sym} -1220 910 0 0 {name=l20 lab=GND}
C {lab_pin.sym} -1220 840 2 0 {name=p38 sig_type=std_logic lab=VDD5v}
C {lab_pin.sym} -100 730 2 0 {name=p19 sig_type=std_logic lab=VDD5v}
C {lab_pin.sym} -790 810 0 0 {name=p20 sig_type=std_logic lab=VDD5v}
C {2_Stage_OP_AMP.sym} -1280 110 0 0 {name=x10}
C {2_Stage_OP_AMP.sym} -250 750 0 0 {name=x2}
C {Shift_5v_to_1v8.sym} -890 110 0 0 {name=x4}
C {Shift_1v8_to_5v.sym} -1070 400 0 0 {name=x3}
C {Shift_1v8_to_5v.sym} -1070 570 0 0 {name=x12}
C {Shift_1v8_to_5v.sym} -1070 730 0 0 {name=x13}
C {Shift_1v8_to_5v.sym} -1070 890 0 0 {name=x14}
C {R2R_20k.sym} -640 780 0 0 {name=x15}
C {inverter.sym} -1500 890 0 0 {name=x5}
C {inverter.sym} -1500 730 0 0 {name=x8}
C {inverter.sym} -1500 570 0 0 {name=x7}
C {inverter.sym} -1500 400 0 0 {name=x6}
C {SAR.sym} -260 50 0 0 {name=x1}
C {lab_pin.sym} -910 870 1 1 {name=p39 sig_type=std_logic lab=b0_5v}
C {lab_pin.sym} -890 710 1 1 {name=p40 sig_type=std_logic lab=b1_5v}
C {lab_pin.sym} -900 550 1 1 {name=p41 sig_type=std_logic lab=b2_5v}
C {lab_pin.sym} -900 380 3 0 {name=p42 sig_type=std_logic lab=b3_5v}
C {lab_pin.sym} -770 -20 0 0 {name=p43 sig_type=std_logic lab=COMP_1v8}
