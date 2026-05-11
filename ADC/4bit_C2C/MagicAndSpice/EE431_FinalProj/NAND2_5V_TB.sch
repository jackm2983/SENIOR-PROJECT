v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -180 0 -180 20 {
lab=GND}
N -180 0 -140 -0 {
lab=GND}
N -170 -80 -170 -60 {
lab=b}
N -170 -60 -140 -60 {
lab=b}
N -170 -60 -170 -20 {
lab=b}
N -170 -20 -140 -20 {
lab=b}
N -260 -40 -140 -40 {
lab=a}
C {NAND2_5V.sym} 10 -30 0 0 {name=x1}
C {gnd.sym} -180 20 0 0 {name=l1 lab=GND}
C {devices/code.sym} 260 80 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 80 130 0 0 {name=spice only_toplevel=false value=".tran 1u 100u
.control
run
.endc"}
C {vsource.sym} -290 -40 1 0 {name=V3 value="pulse(0 5 0 1n 1n 10u 20u)" savecurrent=false}
C {gnd.sym} -320 -40 1 0 {name=l2 lab=GND}
C {vsource.sym} -170 -110 2 0 {name=V1 value=5 savecurrent=false}
C {gnd.sym} -170 -140 2 0 {name=l4 lab=GND}
C {lab_pin.sym} 160 -60 0 1 {name=p1 sig_type=std_logic lab=out}
C {lab_pin.sym} -230 -40 1 1 {name=p2 sig_type=std_logic lab=a}
C {lab_pin.sym} -170 -20 2 1 {name=p3 sig_type=std_logic lab=b}
