v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -230 -20 -150 -20 {
lab=#net1}
N 150 -20 180 -20 {
lab=out}
N -100 -90 -100 -70 {
lab=#net2}
N -60 -70 -40 -70 {
lab=#net3}
N -40 -90 -40 -70 {
lab=#net3}
C {vsource.sym} -230 10 0 0 {name=V1 value="pulse(0 5 0 20n 0 20n 40n 1)" savecurrent=false}
C {gnd.sym} -230 40 0 0 {name=l1 lab=GND}
C {gnd.sym} 60 30 0 0 {name=l2 lab=GND}
C {vsource.sym} -140 110 0 0 {name=V2 value=5 savecurrent=false}
C {gnd.sym} -140 140 0 0 {name=l3 lab=GND}
C {vdd.sym} -140 80 0 0 {name=l4 lab=VDD}
C {vdd.sym} 60 -70 0 0 {name=l5 lab=VDD}
C {opin.sym} 180 -20 0 0 {name=p1 lab=out}
C {vsource.sym} -100 -120 2 0 {name=V3 value="pulse(0 5 1f 1f 0 10n 20n)" savecurrent=false}
C {gnd.sym} -100 -150 2 0 {name=l6 lab=GND}
C {vsource.sym} -40 -120 2 0 {name=V4 value="pulse(5 0 1f 1f 0 10n 20n)" savecurrent=false}
C {gnd.sym} -40 -150 2 0 {name=l8 lab=GND}
C {devices/code.sym} 210 80 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 50 110 0 0 {name=spice only_toplevel=false value=".tran 1n 40n
.control
run
.endc"}
C {/home/ee431/workspace/6SAR_CDAC/T_gate.sym} 0 -20 0 0 {name=x1}
