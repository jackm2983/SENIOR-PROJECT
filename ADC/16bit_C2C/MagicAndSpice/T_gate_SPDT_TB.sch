v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -230 -20 -150 -20 {
lab=#net1}
N -100 -90 -100 -70 {
lab=ctrl}
N -60 -90 -60 -70 {
lab=ctrl_bar}
N -170 -160 -170 -130 {
lab=ctrl}
N -70 -220 -70 -180 {
lab=ctrl_bar}
N -230 180 -150 180 {
lab=VDD}
N -100 110 -100 130 {
lab=ctrl_bar}
N -60 110 -60 130 {
lab=ctrl}
N 160 -20 160 180 {
lab=out}
N 160 80 180 80 {
lab=out}
N 150 180 160 180 {
lab=out}
N 150 -20 160 -20 {
lab=out}
C {vsource.sym} -260 -20 1 0 {name=V1 value="pulse(0 5 0 40n 0 40n 80n 1)" savecurrent=false}
C {gnd.sym} -290 -20 1 0 {name=l1 lab=GND}
C {gnd.sym} 60 30 0 0 {name=l2 lab=GND}
C {vsource.sym} 110 -230 0 0 {name=V2 value=5 savecurrent=false}
C {gnd.sym} 110 -200 0 0 {name=l3 lab=GND}
C {vdd.sym} 110 -260 0 0 {name=l4 lab=VDD}
C {vdd.sym} 60 -70 0 0 {name=l5 lab=VDD}
C {opin.sym} 180 80 0 0 {name=p1 lab=out}
C {vsource.sym} -170 -190 2 0 {name=V3 value="pulse(0 5 1f 1f 0 10n 20n)" savecurrent=false}
C {gnd.sym} -170 -220 2 0 {name=l6 lab=GND}
C {vsource.sym} -70 -250 2 0 {name=V4 value="pulse(5 0 1f 1f 0 10n 20n)" savecurrent=false}
C {gnd.sym} -70 -280 2 0 {name=l8 lab=GND}
C {devices/code.sym} 280 40 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 240 -140 0 0 {name=spice only_toplevel=false value=".tran 1n 60n
.control
run
.endc"}
C {lab_pin.sym} -170 -130 0 0 {name=p2 sig_type=std_logic lab=ctrl}
C {lab_pin.sym} -70 -180 0 0 {name=p3 sig_type=std_logic lab=ctrl_bar}
C {lab_pin.sym} -100 -90 1 0 {name=p4 sig_type=std_logic lab=ctrl}
C {lab_pin.sym} -60 -90 3 1 {name=p5 sig_type=std_logic lab=ctrl_bar}
C {gnd.sym} 60 230 0 0 {name=l9 lab=GND}
C {vdd.sym} 60 130 0 0 {name=l10 lab=VDD}
C {lab_pin.sym} -60 110 1 0 {name=p7 sig_type=std_logic lab=ctrl}
C {lab_pin.sym} -100 110 3 1 {name=p8 sig_type=std_logic lab=ctrl_bar}
C {vdd.sym} -230 180 3 0 {name=l7 lab=VDD}
C {/home/ee431/workspace/6SAR_CDAC/T_gate.sym} 0 -20 0 0 {name=x1}
C {/home/ee431/workspace/6SAR_CDAC/T_gate.sym} 0 180 0 0 {name=x2}
