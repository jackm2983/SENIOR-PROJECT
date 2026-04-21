v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Works As intended} -280 -110 0 0 0.2 0.2 {}
N 20 -100 20 -40 {
lab=VDD}
N 160 -10 200 -10 {
lab=out}
N -350 110 -350 180 {
lab=nclk}
N -280 130 -280 250 {
lab=clk}
N -280 130 -140 130 {
lab=clk}
N -350 110 -140 110 {
lab=nclk}
N -210 50 -140 50 {
lab=GND}
N -250 90 -140 90 {
lab=GND}
N -230 70 -140 70 {
lab=GND}
N -420 -10 -140 -10 {
lab=#net1}
N -310 10 -140 10 {
lab=#net2}
N -690 120 -660 120 {
lab=CLK_N_5v}
N -700 170 -700 180 {
lab=CLK_5v}
C {vsource.sym} 20 -130 2 0 {name=V2 value=5 savecurrent=false}
C {opin.sym} 200 -10 0 0 {name=p1 lab=out}
C {vsource.sym} -290 310 0 0 {name=V3 value="pulse(0 5 0 1f 1f 312.4u 625u)" savecurrent=false}
C {gnd.sym} -360 290 0 0 {name=l11 lab=GND}
C {vsource.sym} -360 260 0 0 {name=V4 value="pulse(5 0 0 1f 1f 312.4u 625u)" savecurrent=false}
C {gnd.sym} -290 340 0 0 {name=l2 lab=GND}
C {vdd.sym} 20 -80 1 0 {name=l3 lab=VDD}
C {devices/code.sym} 300 230 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 120 280 0 0 {name=spice only_toplevel=false value=".tran 1u 10000u
.control
run
.endc"}
C {gnd.sym} 20 -160 2 0 {name=l1 lab=GND}
C {vdd.sym} -140 30 3 1 {name=l4 lab=VDD}
C {gnd.sym} -210 50 1 1 {name=l5 lab=GND}
C {gnd.sym} -230 70 1 1 {name=l6 lab=GND}
C {gnd.sym} -250 90 1 1 {name=l7 lab=GND}
C {vsource.sym} -450 -10 1 0 {name=V1 value=2.75 savecurrent=false}
C {gnd.sym} -480 -10 1 0 {name=l8 lab=GND}
C {vsource.sym} -340 10 1 0 {name=V5 value=2.5 savecurrent=false}
C {gnd.sym} -370 10 1 0 {name=l9 lab=GND}
C {/home/ee431/workspace/6SAR_CDAC/CDAC_4bit_VCM_simplified.sym} 10 60 0 0 {name=x1}
C {lab_pin.sym} -290 280 0 1 {name=p2 sig_type=std_logic lab=clk}
C {vsource.sym} -700 210 0 0 {name=V9 value="PULSE(0 5 0 1f 1f 312.5u 625u)" savecurrent=false}
C {gnd.sym} -700 240 0 0 {name=l20 lab=GND}
C {lab_pin.sym} -700 170 2 1 {name=p19 sig_type=std_logic lab=CLK_5v}
C {vsource.sym} -660 150 0 0 {name=V10 value="PULSE(5 0 0 1f 1f 312.5u 625u)" savecurrent=false}
C {gnd.sym} -660 180 0 0 {name=l21 lab=GND}
C {lab_pin.sym} -690 120 2 1 {name=p36 sig_type=std_logic lab=CLK_N_5v}
C {lab_pin.sym} -470 130 2 1 {name=p3 sig_type=std_logic lab=CLK_5v}
C {lab_pin.sym} -540 70 2 1 {name=p4 sig_type=std_logic lab=CLK_N_5v}
C {lab_pin.sym} -360 230 0 1 {name=p5 sig_type=std_logic lab=nclk}
C {lab_pin.sym} -280 180 0 1 {name=p6 sig_type=std_logic lab=clk}
C {lab_pin.sym} -350 120 0 1 {name=p7 sig_type=std_logic lab=nclk}
