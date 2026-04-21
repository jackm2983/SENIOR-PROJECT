v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -190 -10 -190 10 {
lab=clk}
N -190 -10 -140 -10 {
lab=clk}
N -200 -10 -190 -10 {
lab=clk}
N 50 -130 50 -110 {
lab=VDD}
N 50 -110 50 -80 {
lab=VDD}
N -360 -50 -140 -50 {
lab=#net1}
N -270 -30 -140 -30 {
lab=#net2}
N 160 -30 200 -30 {
lab=out}
C {devices/code.sym} 300 50 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 120 100 0 0 {name=spice only_toplevel=false value=".tran 1u 100u
.control
run
.endc"}
C {/home/ee431/workspace/6SAR_CDAC/strongarm_comp.sym} 10 -30 0 0 {name=x1}
C {vsource.sym} -190 40 0 0 {name=V3 value="pulse(0 5 0 1f 1f 10u 20u)" savecurrent=false}
C {gnd.sym} -190 70 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -200 -10 0 0 {name=p1 sig_type=std_logic lab=clk}
C {vsource.sym} 50 -160 2 0 {name=V2 value=5 savecurrent=false}
C {vdd.sym} 50 -110 1 0 {name=l3 lab=VDD}
C {gnd.sym} 50 -190 2 0 {name=l1 lab=GND}
C {vsource.sym} -390 -50 1 0 {name=V1 value=2.5 savecurrent=false}
C {gnd.sym} -420 -50 1 0 {name=l4 lab=GND}
C {vsource.sym} -300 -30 1 0 {name=V4 value=2.501 savecurrent=false}
C {gnd.sym} -330 -30 1 0 {name=l5 lab=GND}
C {lab_pin.sym} 200 -30 0 1 {name=p2 sig_type=std_logic lab=out}
