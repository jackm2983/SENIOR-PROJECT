v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -180 -60 -60 -60 {
lab=s}
N 270 -80 270 -60 {
lab=#net1}
N 240 -60 270 -60 {
lab=#net1}
N -320 -40 -60 -40 {
lab=r}
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
C {vsource.sym} -210 -60 1 0 {name=V3 value="pulse(0 5 0 1n 1n 10u 20u)" savecurrent=false}
C {gnd.sym} -240 -60 1 0 {name=l2 lab=GND}
C {vsource.sym} 270 -110 2 0 {name=V1 value=5 savecurrent=false}
C {gnd.sym} 270 -140 2 0 {name=l4 lab=GND}
C {lab_pin.sym} 240 -40 0 1 {name=p1 sig_type=std_logic lab=out}
C {lab_pin.sym} -150 -60 1 1 {name=p2 sig_type=std_logic lab=s}
C {lab_pin.sym} -170 -40 1 1 {name=p3 sig_type=std_logic lab=r}
C {/home/ee431/workspace/6SAR_CDAC/SR_latch.sym} 90 -30 0 0 {name=x1}
C {gnd.sym} 240 0 0 0 {name=l3 lab=GND}
C {vsource.sym} -350 -40 1 0 {name=V2 value="pulse(0 5 0 1n 1n 20u 40u)" savecurrent=false}
C {gnd.sym} -380 -40 1 0 {name=l1 lab=GND}
