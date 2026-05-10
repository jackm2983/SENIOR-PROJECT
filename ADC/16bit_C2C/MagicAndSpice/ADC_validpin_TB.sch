v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 480 60 480 80 {
lab=CLK}
N 830 70 830 90 {
lab=CLK_comp}
N 910 230 910 250 {
lab=VDD1v8}
N 910 220 910 230 {
lab=VDD1v8}
N 220 140 260 140 {
lab=VALID}
N 220 160 260 160 {
lab=ADC_OUT3}
N 220 180 260 180 {
lab=ADC_OUT2}
N 220 200 260 200 {
lab=ADC_OUT1}
N 220 220 260 220 {
lab=ADC_OUT0}
N 440 -70 440 -50 {
lab=CLK_N}
C {/home/ee431/workspace/6SAR_CDAC/ADC_validpin.sym} 70 110 0 0 {name=x1}
C {vsource.sym} 480 110 0 0 {name=V2 value="PULSE(0 1.8 0       10n 10n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 480 140 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 480 60 0 0 {name=p2 sig_type=std_logic lab=CLK}
C {vsource.sym} 830 120 0 0 {name=V3 value="PULSE(0 1.8 156.25u       10n 10n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 830 150 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 830 70 0 0 {name=p36 sig_type=std_logic lab=CLK_comp}
C {gnd.sym} 780 10 0 0 {name=l33 lab=GND}
C {vsource.sym} 780 -20 0 0 {name=V10 value="PULSE(0 1.8 0 10n 10n 2.5m 3.125m)" savecurrent=false}
C {lab_pin.sym} 780 -50 2 1 {name=p28 sig_type=std_logic lab=RST_N}
C {devices/code.sym} 800 -250 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 470 -200 0 0 {name=spice only_toplevel=false value=".tran 1u 10000u 0 1u
.options method=gear reltol=1e-4
.control
run
.endc"}
C {vsource.sym} 560 250 0 0 {name=V1 value=4 savecurrent=false}
C {gnd.sym} 560 280 0 0 {name=l8 lab=GND}
C {lab_pin.sym} 560 220 0 0 {name=p5 sig_type=std_logic lab=Vin}
C {vsource.sym} 750 260 0 0 {name=V4 value=5 savecurrent=false}
C {gnd.sym} 750 290 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 750 230 0 1 {name=p42 sig_type=std_logic lab=VDD_5V}
C {vsource.sym} 910 280 0 0 {name=V7 value=1.8 savecurrent=false}
C {gnd.sym} 910 310 0 0 {name=l30 lab=GND}
C {lab_pin.sym} 910 230 2 0 {name=p21 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} 910 230 2 0 {name=p37 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} 220 20 2 0 {name=p4 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} 220 40 0 1 {name=p6 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} 220 60 2 0 {name=p7 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 220 80 2 0 {name=p8 sig_type=std_logic lab=CLK_comp}
C {lab_pin.sym} 220 100 0 1 {name=p9 sig_type=std_logic lab=RST_N}
C {lab_pin.sym} 220 120 2 0 {name=p10 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 260 140 2 0 {name=p11 sig_type=std_logic lab=VALID}
C {lab_pin.sym} 260 160 2 0 {name=p12 sig_type=std_logic lab=ADC_OUT3}
C {lab_pin.sym} 260 180 2 0 {name=p13 sig_type=std_logic lab=ADC_OUT2}
C {lab_pin.sym} 260 200 2 0 {name=p14 sig_type=std_logic lab=ADC_OUT1}
C {lab_pin.sym} 260 220 2 0 {name=p15 sig_type=std_logic lab=ADC_OUT0}
C {lab_pin.sym} 560 220 0 0 {name=p1 sig_type=std_logic lab=Vin}
C {vsource.sym} 1150 260 0 0 {name=V5 value=0 savecurrent=false}
C {gnd.sym} 1150 290 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 1150 230 0 0 {name=p16 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 220 0 2 0 {name=p3 sig_type=std_logic lab=VSS}
C {vsource.sym} 440 -20 0 0 {name=V6 value="PULSE(1.8 0 0       10n 10n 312.5u 625u)" savecurrent=false}
C {gnd.sym} 440 10 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 440 -70 0 0 {name=p17 sig_type=std_logic lab=CLK_N}
C {lab_pin.sym} 220 240 2 0 {name=p18 sig_type=std_logic lab=CLK_N}
