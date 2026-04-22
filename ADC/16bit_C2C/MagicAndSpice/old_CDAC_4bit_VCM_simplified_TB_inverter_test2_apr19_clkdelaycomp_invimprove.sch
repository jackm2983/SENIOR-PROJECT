v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {} 840 -710 0 0 0.2 0.2 {}
T {PULSE(Vo V1 Td Tr Tf Tw To)} 750 120 0 0 0.4 0.4 {}
T {Comparator operating off of delayed Clock} -610 -720 0 0 0.2 0.2 {}
N 270 -90 270 -20 {
lab=CLK5_N}
N 340 -70 340 50 {
lab=CLK5}
N 340 -70 480 -70 {
lab=CLK5}
N 270 -90 480 -90 {
lab=CLK5_N}
N 90 -360 120 -360 {
lab=b3}
N 90 -170 130 -170 {
lab=b2}
N -230 10 -210 10 {
lab=#net1}
N 90 10 130 10 {
lab=b1}
N 90 180 130 180 {
lab=b0}
N 780 -210 800 -210 {
lab=cdac}
N 220 -670 240 -670 {
lab=VDD1v8}
N 220 -670 220 -650 {
lab=VDD1v8}
N 220 -630 240 -630 {
lab=VDD1v8}
N 540 -630 580 -630 {
lab=comp1v8}
N 1040 -550 1140 -550 {
lab=DAC_B3}
N 1040 -490 1140 -490 {
lab=DAC_B0}
N 1040 -510 1140 -510 {
lab=DAC_B1}
N 1040 -530 1140 -530 {
lab=DAC_B2}
N 1040 -630 1140 -630 {
lab=ADC_OUT3}
N 1040 -610 1140 -610 {
lab=ADC_OUT2}
N 1040 -590 1140 -590 {
lab=ADC_OUT1}
N 1040 -570 1140 -570 {
lab=ADC_OUT0}
N 700 -590 740 -590 {
lab=CLK}
N 710 -570 740 -570 {
lab=CLK_N}
N 740 -530 740 -500 {
lab=GND}
N -280 -640 -200 -640 {
lab=compp}
N -280 -620 -200 -620 {
lab=compn}
N 140 -610 240 -610 {
lab=latch}
N 140 -620 140 -610 {
lab=latch}
N 580 -650 580 -630 {
lab=comp1v8}
N 710 -550 740 -550 {
lab=VDD1v8}
N 640 -290 640 -240 {
lab=VDD_5V}
N -20 120 -20 130 {
lab=VDD_5V}
N -230 -20 -230 -10 {
lab=VDD_5V}
N -20 -50 -20 -40 {
lab=VDD_5V}
N -20 -230 -20 -220 {
lab=VDD_5V}
N -20 -420 -20 -410 {
lab=VDD_5V}
N 100 -680 100 -640 {
lab=VDD_5V}
N 130 -610 140 -610 {
lab=latch}
N 980 -170 980 -150 {
lab=CLK5_N}
N 940 -110 940 -90 {
lab=CLK5}
N 960 -390 960 -370 {
lab=CLK_N}
N 920 -330 920 -310 {
lab=CLK}
N 130 -610 130 -600 {
lab=latch}
N 100 -600 130 -600 {
lab=latch}
N 440 -190 480 -190 {
lab=VCM}
N 370 -210 480 -210 {
lab=Vin}
N 580 -630 740 -630 {
lab=comp1v8}
N 590 -610 740 -610 {
lab=RST_N}
N 220 -650 220 -630 {
lab=VDD1v8}
N 540 -610 590 -610 {
lab=RST_N}
N 540 -610 540 -500 {
lab=RST_N}
N -690 -600 -580 -600 {
lab=CLK_comp}
N -750 -600 -690 -600 {
lab=CLK_comp}
N 1040 0 1040 20 {
lab=CLK_comp}
N -230 -40 -230 -20 {
lab=VDD_5V}
N -230 180 -210 180 {
lab=#net2}
N -230 150 -230 160 {
lab=VDD_5V}
N -230 130 -230 150 {
lab=VDD_5V}
N -230 -170 -210 -170 {
lab=#net3}
N -230 -200 -230 -190 {
lab=VDD_5V}
N -230 -220 -230 -200 {
lab=VDD_5V}
N -230 -360 -210 -360 {
lab=#net4}
N -230 -390 -230 -380 {
lab=VDD_5V}
N -230 -410 -230 -390 {
lab=VDD_5V}
C {vsource.sym} 610 -290 1 0 {name=V2 value=5 savecurrent=false}
C {devices/code.sym} 600 80 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 270 130 0 0 {name=spice only_toplevel=false value=".tran 10u 10000u
.options method=gear reltol=1e-4
.control
run
.endc"}
C {gnd.sym} 580 -290 1 0 {name=l1 lab=GND}
C {vsource.sym} 340 -210 1 0 {name=V1 value=2.75 savecurrent=false}
C {gnd.sym} 310 -210 1 0 {name=l8 lab=GND}
C {vsource.sym} 830 -20 0 0 {name=V5 value=2.5 savecurrent=false}
C {gnd.sym} 830 10 0 0 {name=l9 lab=GND}
C {/home/ee431/workspace/6SAR_CDAC/CDAC_4bit_VCM_simplified.sym} 630 -140 0 0 {name=x1}
C {/home/ee431/workspace/6SAR_CDAC/inverter_5v.sym} -60 -360 0 0 {name=x3}
C {gnd.sym} -20 -310 0 0 {name=l12 lab=GND}
C {/home/ee431/workspace/6SAR_CDAC/inverter_5v.sym} -60 -170 0 0 {name=x5}
C {gnd.sym} -20 -120 0 0 {name=l16 lab=GND}
C {lab_pin.sym} 130 -170 2 0 {name=p3 sig_type=std_logic lab=b2}
C {lab_pin.sym} 120 -360 2 0 {name=p4 sig_type=std_logic lab=b3}
C {/home/ee431/workspace/6SAR_CDAC/inverter_5v.sym} -60 10 0 0 {name=x9}
C {gnd.sym} -230 30 0 0 {name=l20 lab=GND}
C {gnd.sym} -20 60 0 0 {name=l21 lab=GND}
C {lab_pin.sym} 130 10 2 0 {name=p8 sig_type=std_logic lab=b1}
C {/home/ee431/workspace/6SAR_CDAC/inverter_5v.sym} -60 180 0 0 {name=x11}
C {gnd.sym} -20 230 0 0 {name=l26 lab=GND}
C {lab_pin.sym} 130 180 2 0 {name=p9 sig_type=std_logic lab=b0}
C {lab_pin.sym} 480 -170 2 1 {name=p10 sig_type=std_logic lab=b3}
C {lab_pin.sym} 480 -150 2 1 {name=p11 sig_type=std_logic lab=b2}
C {lab_pin.sym} 480 -130 2 1 {name=p12 sig_type=std_logic lab=b1}
C {lab_pin.sym} 480 -110 2 1 {name=p13 sig_type=std_logic lab=b0}
C {opin.sym} -240 -640 3 0 {name=p14 lab=compp}
C {lab_pin.sym} 830 -50 0 0 {name=p15 sig_type=std_logic lab=VCM}
C {lab_pin.sym} 440 -190 0 0 {name=p16 sig_type=std_logic lab=VCM}
C {lab_pin.sym} -580 -640 0 0 {name=p17 sig_type=std_logic lab=VCM}
C {gnd.sym} 240 -590 0 0 {name=l7 lab=GND}
C {vsource.sym} 270 -670 3 0 {name=V7 value=1.8 savecurrent=false}
C {gnd.sym} 300 -670 3 0 {name=l30 lab=GND}
C {lab_pin.sym} 220 -670 1 0 {name=p21 sig_type=std_logic lab=VDD1v8}
C {Shift_5v_to_1v8.sym} 390 -610 0 0 {name=x6}
C {lab_pin.sym} 1140 -550 2 0 {name=p19 sig_type=std_logic lab=DAC_B3}
C {lab_pin.sym} 1140 -530 2 0 {name=p20 sig_type=std_logic lab=DAC_B2}
C {lab_pin.sym} 1140 -510 2 0 {name=p22 sig_type=std_logic lab=DAC_B1}
C {lab_pin.sym} 1140 -490 2 0 {name=p23 sig_type=std_logic lab=DAC_B0}
C {gnd.sym} 540 -440 0 0 {name=l33 lab=GND}
C {lab_pin.sym} 1140 -630 2 0 {name=p24 sig_type=std_logic lab=ADC_OUT3}
C {lab_pin.sym} 1140 -610 2 0 {name=p25 sig_type=std_logic lab=ADC_OUT2}
C {lab_pin.sym} 1140 -590 2 0 {name=p26 sig_type=std_logic lab=ADC_OUT1}
C {lab_pin.sym} 1140 -570 2 0 {name=p27 sig_type=std_logic lab=ADC_OUT0}
C {vsource.sym} 540 -470 0 0 {name=V10 value="PULSE(0 1.8 2m .1n .1n 1e9 2e9)" savecurrent=false}
C {lab_pin.sym} 540 -530 2 1 {name=p28 sig_type=std_logic lab=RST_N}
C {gnd.sym} 740 -500 0 0 {name=l35 lab=GND}
C {SAR.sym} 890 -560 0 0 {name=x7}
C {lab_pin.sym} 580 -650 0 1 {name=p18 sig_type=std_logic lab=comp1v8}
C {lab_pin.sym} -530 -190 2 1 {name=p33 sig_type=std_logic lab=DAC_B2}
C {lab_pin.sym} -530 -10 2 1 {name=p34 sig_type=std_logic lab=DAC_B1}
C {lab_pin.sym} -530 160 2 1 {name=p35 sig_type=std_logic lab=DAC_B0}
C {/home/ee431/workspace/6SAR_CDAC/strongarm_comp.sym} -430 -620 0 0 {name=x13}
C {/home/ee431/workspace/6SAR_CDAC/SR_latch.sym} -50 -610 0 0 {name=x14}
C {opin.sym} 140 -620 3 0 {name=p39 lab=latch}
C {gnd.sym} 100 -580 0 0 {name=l24 lab=GND}
C {opin.sym} -240 -620 1 0 {name=p40 lab=compn}
C {lab_pin.sym} 800 -210 0 1 {name=p1 sig_type=std_logic lab=cdac}
C {lab_pin.sym} -580 -620 0 0 {name=p41 sig_type=std_logic lab=cdac}
C {lab_pin.sym} 710 -550 0 0 {name=p31 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} 640 -290 0 1 {name=p42 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -20 120 0 1 {name=p44 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -230 -40 0 1 {name=p45 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -20 -50 0 1 {name=p46 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -20 -230 0 1 {name=p48 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -20 -420 0 1 {name=p50 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} 100 -680 3 1 {name=p51 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -280 -600 1 1 {name=p52 sig_type=std_logic lab=VDD_5V}
C {vsource.sym} 940 -60 0 0 {name=V6 value="PULSE(0 5 0       .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 940 -30 0 0 {name=l14 lab=GND}
C {vsource.sym} 980 -120 0 0 {name=V8 value="PULSE(5 0 0   .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 980 -90 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 940 -110 0 0 {name=p53 sig_type=std_logic lab=CLK5}
C {lab_pin.sym} 980 -170 2 0 {name=p54 sig_type=std_logic lab=CLK5_N}
C {lab_pin.sym} 340 -20 0 1 {name=p55 sig_type=std_logic lab=CLK5}
C {lab_pin.sym} 270 -20 2 1 {name=p6 sig_type=std_logic lab=CLK5_N}
C {vsource.sym} 920 -280 0 0 {name=V9 value="PULSE(0 1.8 0       .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 920 -250 0 0 {name=l5 lab=GND}
C {vsource.sym} 960 -340 0 0 {name=V13 value="PULSE(1.8 0 0   .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 960 -310 0 0 {name=l6 lab=GND}
C {lab_pin.sym} 920 -330 0 0 {name=p7 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 960 -390 2 0 {name=p56 sig_type=std_logic lab=CLK_N}
C {lab_pin.sym} 700 -590 0 0 {name=p29 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 710 -570 2 1 {name=p30 sig_type=std_logic lab=CLK_N}
C {lab_pin.sym} -750 -600 0 0 {name=p2 sig_type=std_logic lab=CLK_comp}
C {lab_pin.sym} 410 -210 1 0 {name=p5 sig_type=std_logic lab=Vin}
C {vsource.sym} 1040 50 0 0 {name=V3 value="PULSE(0 5 100u       .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 1040 80 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 1040 0 0 0 {name=p36 sig_type=std_logic lab=CLK_comp}
C {/home/ee431/workspace/6SAR_CDAC/old_inverter_1v8_to_5v.sym} -380 10 0 0 {name=x2}
C {gnd.sym} -230 200 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -230 130 0 1 {name=p38 sig_type=std_logic lab=VDD_5V}
C {/home/ee431/workspace/6SAR_CDAC/old_inverter_1v8_to_5v.sym} -380 180 0 0 {name=x4}
C {gnd.sym} -230 -150 0 0 {name=l11 lab=GND}
C {lab_pin.sym} -230 -220 0 1 {name=p43 sig_type=std_logic lab=VDD_5V}
C {/home/ee431/workspace/6SAR_CDAC/old_inverter_1v8_to_5v.sym} -380 -170 0 0 {name=x8}
C {gnd.sym} -230 -340 0 0 {name=l13 lab=GND}
C {lab_pin.sym} -230 -410 0 1 {name=p37 sig_type=std_logic lab=VDD_5V}
C {/home/ee431/workspace/6SAR_CDAC/old_inverter_1v8_to_5v.sym} -380 -360 0 0 {name=x12}
C {lab_pin.sym} -530 -380 2 1 {name=p32 sig_type=std_logic lab=DAC_B3}
