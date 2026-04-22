v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {} 920 -750 0 0 0.2 0.2 {}
T {PULSE(Vo V1 Td Tr Tf Tw To)} 830 80 0 0 0.4 0.4 {}
T {Comparator operating off of delayed Clock} -530 -760 0 0 0.2 0.2 {}
N 350 -130 350 -60 {
lab=CLK5_N}
N 420 -110 420 10 {
lab=CLK5}
N 420 -110 560 -110 {
lab=CLK5}
N 350 -130 560 -130 {
lab=CLK5_N}
N -150 -380 -120 -380 {
lab=b3}
N 860 -250 880 -250 {
lab=cdac}
N 610 -760 630 -760 {
lab=VDD1v8}
N 1120 -590 1220 -590 {
lab=DAC_B3}
N 1120 -530 1220 -530 {
lab=DAC_B0}
N 1120 -550 1220 -550 {
lab=DAC_B1}
N 1120 -570 1220 -570 {
lab=DAC_B2}
N 1120 -670 1220 -670 {
lab=ADC_OUT3}
N 1120 -650 1220 -650 {
lab=ADC_OUT2}
N 1120 -630 1220 -630 {
lab=ADC_OUT1}
N 1120 -610 1220 -610 {
lab=ADC_OUT0}
N 780 -630 820 -630 {
lab=CLK}
N 790 -610 820 -610 {
lab=CLK_N}
N 820 -570 820 -540 {
lab=GND}
N -200 -680 -120 -680 {
lab=compp}
N -200 -660 -120 -660 {
lab=compn}
N 220 -650 220 -640 {
lab=latch}
N 660 -690 660 -670 {
lab=comp1v8}
N 790 -590 820 -590 {
lab=VDD1v8}
N 720 -330 720 -280 {
lab=VDD_5V}
N 180 -720 180 -680 {
lab=VDD_5V}
N 210 -640 220 -640 {
lab=latch}
N 1060 -210 1060 -190 {
lab=CLK5_N}
N 1020 -150 1020 -130 {
lab=CLK5}
N 1040 -430 1040 -410 {
lab=CLK_N}
N 1000 -370 1000 -350 {
lab=CLK}
N 180 -640 210 -640 {
lab=latch}
N 520 -230 560 -230 {
lab=VCM}
N 450 -250 560 -250 {
lab=Vin}
N 660 -670 820 -670 {
lab=comp1v8}
N 700 -650 700 -540 {
lab=RST_N}
N -610 -640 -500 -640 {
lab=CLK_comp}
N -670 -640 -610 -640 {
lab=CLK_comp}
N 1120 -40 1120 -20 {
lab=CLK_comp}
N 600 -760 610 -760 {
lab=VDD1v8}
N 600 -760 600 -680 {
lab=VDD1v8}
N 640 -670 640 -640 {
lab=comp1v8}
N 220 -640 300 -640 {
lab=latch}
N 300 -680 300 -650 {
lab=latch}
N 300 -650 300 -640 {
lab=latch}
N 700 -650 820 -650 {
lab=RST_N}
N 600 -640 640 -640 {
lab=comp1v8}
N 640 -670 660 -670 {
lab=comp1v8}
N -150 -420 -120 -420 {
lab=VDD1v8}
N -150 -400 -120 -400 {
lab=VDD_5V}
N -150 -190 -120 -190 {
lab=b2}
N -150 -230 -120 -230 {
lab=VDD1v8}
N -150 -210 -120 -210 {
lab=VDD_5V}
N -150 -50 -120 -50 {
lab=b1}
N -150 -90 -120 -90 {
lab=VDD1v8}
N -150 -70 -120 -70 {
lab=VDD_5V}
N -150 140 -120 140 {
lab=b0}
N -150 100 -120 100 {
lab=VDD1v8}
N -150 120 -120 120 {
lab=VDD_5V}
N 1400 -170 1400 -140 {
lab=VCM}
N 1400 -150 1530 -150 {
lab=VCM}
N 1400 -260 1400 -230 {
lab=VDD_5V}
N 1400 -80 1400 -40 {
lab=GND}
C {vsource.sym} 690 -330 1 0 {name=V2 value=5 savecurrent=false}
C {devices/code.sym} 680 40 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 350 90 0 0 {name=spice only_toplevel=false value=".tran 10u 10000u
.options method=gear reltol=1e-4
.control
run
.endc"}
C {gnd.sym} 660 -330 1 0 {name=l1 lab=GND}
C {vsource.sym} 420 -250 1 0 {name=V1 value=5 savecurrent=false}
C {gnd.sym} 390 -250 1 0 {name=l8 lab=GND}
C {/home/ee431/workspace/6SAR_CDAC/CDAC_4bit_VCM_simplified.sym} 710 -180 0 0 {name=x1}
C {lab_pin.sym} -120 -380 2 0 {name=p4 sig_type=std_logic lab=b3}
C {lab_pin.sym} 560 -210 2 1 {name=p10 sig_type=std_logic lab=b3}
C {lab_pin.sym} 560 -190 2 1 {name=p11 sig_type=std_logic lab=b2}
C {lab_pin.sym} 560 -170 2 1 {name=p12 sig_type=std_logic lab=b1}
C {lab_pin.sym} 560 -150 2 1 {name=p13 sig_type=std_logic lab=b0}
C {opin.sym} -160 -680 3 0 {name=p14 lab=compp}
C {lab_pin.sym} 520 -230 0 0 {name=p16 sig_type=std_logic lab=VCM}
C {lab_pin.sym} -500 -680 0 0 {name=p17 sig_type=std_logic lab=VCM}
C {gnd.sym} 600 -620 0 0 {name=l7 lab=GND}
C {vsource.sym} 660 -760 3 0 {name=V7 value=1.8 savecurrent=false}
C {gnd.sym} 690 -760 3 0 {name=l30 lab=GND}
C {lab_pin.sym} 610 -760 1 0 {name=p21 sig_type=std_logic lab=VDD1v8}
C {shift_5v_to_1v8.sym} 450 -640 0 0 {name=x6}
C {lab_pin.sym} 1220 -590 2 0 {name=p19 sig_type=std_logic lab=DAC_B3}
C {lab_pin.sym} 1220 -570 2 0 {name=p20 sig_type=std_logic lab=DAC_B2}
C {lab_pin.sym} 1220 -550 2 0 {name=p22 sig_type=std_logic lab=DAC_B1}
C {lab_pin.sym} 1220 -530 2 0 {name=p23 sig_type=std_logic lab=DAC_B0}
C {gnd.sym} 700 -480 0 0 {name=l33 lab=GND}
C {lab_pin.sym} 1220 -670 2 0 {name=p24 sig_type=std_logic lab=ADC_OUT3}
C {lab_pin.sym} 1220 -650 2 0 {name=p25 sig_type=std_logic lab=ADC_OUT2}
C {lab_pin.sym} 1220 -630 2 0 {name=p26 sig_type=std_logic lab=ADC_OUT1}
C {lab_pin.sym} 1220 -610 2 0 {name=p27 sig_type=std_logic lab=ADC_OUT0}
C {vsource.sym} 700 -510 0 0 {name=V10 value="PULSE(0 1.8 1.5m .1n .1n 1e9 2e9)" savecurrent=false}
C {lab_pin.sym} 700 -570 2 1 {name=p28 sig_type=std_logic lab=RST_N}
C {gnd.sym} 820 -540 0 0 {name=l35 lab=GND}
C {SAR.sym} 970 -600 0 0 {name=x7}
C {lab_pin.sym} 660 -690 0 1 {name=p18 sig_type=std_logic lab=comp1v8}
C {lab_pin.sym} -450 -230 2 1 {name=p33 sig_type=std_logic lab=DAC_B2}
C {/home/ee431/workspace/6SAR_CDAC/strongarm_comp.sym} -350 -660 0 0 {name=x13}
C {/home/ee431/workspace/6SAR_CDAC/SR_latch.sym} 30 -650 0 0 {name=x14}
C {opin.sym} 220 -650 3 0 {name=p39 lab=latch}
C {gnd.sym} 180 -620 0 0 {name=l24 lab=GND}
C {opin.sym} -160 -660 1 0 {name=p40 lab=compn}
C {lab_pin.sym} 880 -250 0 1 {name=p1 sig_type=std_logic lab=cdac}
C {lab_pin.sym} -500 -660 0 0 {name=p41 sig_type=std_logic lab=cdac}
C {lab_pin.sym} 790 -590 0 0 {name=p31 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} 720 -330 0 1 {name=p42 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} 180 -720 3 1 {name=p51 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -200 -640 1 1 {name=p52 sig_type=std_logic lab=VDD_5V}
C {vsource.sym} 1020 -100 0 0 {name=V6 value="PULSE(0 5 0       .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 1020 -70 0 0 {name=l14 lab=GND}
C {vsource.sym} 1060 -160 0 0 {name=V8 value="PULSE(5 0 0   .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 1060 -130 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 1020 -150 0 0 {name=p53 sig_type=std_logic lab=CLK5}
C {lab_pin.sym} 1060 -210 2 0 {name=p54 sig_type=std_logic lab=CLK5_N}
C {lab_pin.sym} 420 -60 0 1 {name=p55 sig_type=std_logic lab=CLK5}
C {lab_pin.sym} 350 -60 2 1 {name=p6 sig_type=std_logic lab=CLK5_N}
C {vsource.sym} 1000 -320 0 0 {name=V9 value="PULSE(0 1.8 0       .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 1000 -290 0 0 {name=l5 lab=GND}
C {vsource.sym} 1040 -380 0 0 {name=V13 value="PULSE(1.8 0 0   .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 1040 -350 0 0 {name=l6 lab=GND}
C {lab_pin.sym} 1000 -370 0 0 {name=p7 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 1040 -430 2 0 {name=p56 sig_type=std_logic lab=CLK_N}
C {lab_pin.sym} 780 -630 0 0 {name=p29 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 790 -610 2 1 {name=p30 sig_type=std_logic lab=CLK_N}
C {lab_pin.sym} -670 -640 0 0 {name=p2 sig_type=std_logic lab=CLK_comp}
C {lab_pin.sym} 490 -250 1 0 {name=p5 sig_type=std_logic lab=Vin}
C {vsource.sym} 1120 10 0 0 {name=V3 value="PULSE(0 5 100u       .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 1120 40 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 1120 -40 0 0 {name=p36 sig_type=std_logic lab=CLK_comp}
C {lab_pin.sym} -450 -420 2 1 {name=p32 sig_type=std_logic lab=DAC_B3}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} -300 -390 0 0 {name=x10}
C {gnd.sym} 180 -620 0 0 {name=l10 lab=GND}
C {gnd.sym} -150 -360 3 0 {name=l13 lab=GND}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} -300 -200 0 0 {name=x3}
C {lab_pin.sym} 610 -760 1 0 {name=p37 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -120 -420 2 0 {name=p43 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} 720 -330 0 1 {name=p47 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -120 -400 0 1 {name=p48 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -120 -190 2 0 {name=p49 sig_type=std_logic lab=b2}
C {gnd.sym} -150 -170 3 0 {name=l11 lab=GND}
C {lab_pin.sym} -120 -230 2 0 {name=p50 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -120 -210 0 1 {name=p57 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -120 -50 2 0 {name=p3 sig_type=std_logic lab=b1
}
C {lab_pin.sym} -450 100 2 1 {name=p8 sig_type=std_logic lab=DAC_B0}
C {lab_pin.sym} -450 -90 2 1 {name=p9 sig_type=std_logic lab=DAC_B1}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} -300 -60 0 0 {name=x2}
C {gnd.sym} -150 -30 3 0 {name=l4 lab=GND}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} -300 130 0 0 {name=x4}
C {lab_pin.sym} -120 -90 2 0 {name=p34 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -120 -70 0 1 {name=p35 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -120 140 2 0 {name=p38 sig_type=std_logic lab=b0}
C {gnd.sym} -150 160 3 0 {name=l12 lab=GND}
C {lab_pin.sym} -120 100 2 0 {name=p44 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -120 120 0 1 {name=p45 sig_type=std_logic lab=VDD_5V}
C {gnd.sym} 1400 -40 0 0 {name=l15 lab=GND}
C {lab_pin.sym} 1530 -150 2 0 {name=p46 sig_type=std_logic lab=VCM}
C {lab_pin.sym} 720 -330 0 1 {name=p58 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} 1400 -260 0 1 {name=p59 sig_type=std_logic lab=VDD_5V}
C {sky130_fd_pr/res_high_po.sym} 1400 -200 0 0 {name=R1
W=2
L=50
model=res_high_po
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po.sym} 1400 -110 0 0 {name=R2
W=2
L=50
model=res_high_po
spiceprefix=X
mult=1}
C {gnd.sym} 1380 -110 0 0 {name=l9 lab=GND}
C {gnd.sym} 1380 -200 0 0 {name=l16 lab=GND}
