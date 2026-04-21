v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -230 -20 -150 -20 {
lab=in1}
N -100 -90 -100 -70 {
lab=c}
N -60 -90 -60 -70 {
lab=cbar}
N -230 180 -150 180 {
lab=in2}
N -100 110 -100 130 {
lab=cbar}
N -60 110 -60 130 {
lab=c}
N 160 -20 160 180 {
lab=out}
N 160 80 180 80 {
lab=out}
N 150 180 160 180 {
lab=out}
N 150 -20 160 -20 {
lab=out}
N -170 -160 -140 -160 {
lab=c}
N -90 -220 -60 -220 {
lab=cbar}
N 100 -220 130 -220 {
lab=vdd}
N 60 -100 60 -70 {
lab=vdd}
N 60 100 60 130 {
lab=vdd}
N 100 -180 130 -180 {
lab=vss}
N 20 30 60 30 {
lab=vss}
N 60 230 60 260 {
lab=vss}
C {devices/code.sym} 280 40 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {/home/ee431/workspace/6SAR_CDAC/T_gate.sym} 0 -20 0 0 {name=x1}
C {/home/ee431/workspace/6SAR_CDAC/T_gate.sym} 0 180 0 0 {name=x2}
C {ipin.sym} -230 -20 0 0 {name=p1 lab=in1}
C {ipin.sym} -230 180 0 0 {name=p2 lab=in2}
C {ipin.sym} -170 -160 0 0 {name=p3 lab=c}
C {ipin.sym} -90 -220 0 0 {name=p4 lab=cbar}
C {opin.sym} 180 80 0 0 {name=p5 lab=out}
C {iopin.sym} 130 -220 0 0 {name=p6 lab=vdd}
C {iopin.sym} 130 -180 0 0 {name=p7 lab=vss}
C {lab_pin.sym} -140 -160 0 1 {name=p8 sig_type=std_logic lab=c}
C {lab_pin.sym} -100 -90 3 1 {name=p9 sig_type=std_logic lab=c}
C {lab_pin.sym} -60 110 3 1 {name=p10 sig_type=std_logic lab=c}
C {lab_pin.sym} -60 -220 0 1 {name=p11 sig_type=std_logic lab=cbar}
C {lab_pin.sym} -60 -90 3 1 {name=p12 sig_type=std_logic lab=cbar}
C {lab_pin.sym} -100 110 3 1 {name=p13 sig_type=std_logic lab=cbar}
C {lab_pin.sym} 100 -220 0 0 {name=p14 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 60 -100 1 0 {name=p15 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 60 100 1 0 {name=p16 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 100 -180 0 0 {name=p17 sig_type=std_logic lab=vss}
C {lab_pin.sym} 20 30 3 0 {name=p18 sig_type=std_logic lab=vss}
C {lab_pin.sym} 60 260 3 0 {name=p19 sig_type=std_logic lab=vss}
