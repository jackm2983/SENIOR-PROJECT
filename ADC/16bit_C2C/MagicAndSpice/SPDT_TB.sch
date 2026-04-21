v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -340 50 -260 50 {
lab=#net1}
N -170 -160 -170 -130 {
lab=ctrl}
N -70 -220 -70 -180 {
lab=ctrl_bar}
N -270 80 -190 80 {
lab=VDD}
N 110 60 450 60 {
lab=out}
N -260 50 -190 50 {
lab=#net1}
N 180 60 180 90 {
lab=out}
N 370 60 370 90 {
lab=out}
C {vsource.sym} -370 50 1 0 {name=V1 value="pulse(0 5 0 40n 0 40n 80n 1)" savecurrent=false}
C {gnd.sym} -400 50 1 0 {name=l1 lab=GND}
C {vsource.sym} 110 -230 0 0 {name=V2 value=5 savecurrent=false}
C {gnd.sym} 110 -200 0 0 {name=l3 lab=GND}
C {vdd.sym} 110 -260 0 0 {name=l4 lab=VDD}
C {opin.sym} 450 60 0 0 {name=p1 lab=out}
C {vsource.sym} -170 -190 2 0 {name=V3 value="pulse(0 5 1f 1f 0 10n 20n)" savecurrent=false}
C {gnd.sym} -170 -220 2 0 {name=l6 lab=GND}
C {vsource.sym} -70 -250 2 0 {name=V4 value="pulse(5 0 1f 1f 0 10n 20n)" savecurrent=false}
C {gnd.sym} -70 -280 2 0 {name=l8 lab=GND}
C {devices/code.sym} 480 -180 0 0 {name=TT_MODELS
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
C {vdd.sym} -270 80 3 0 {name=l7 lab=VDD}
C {/home/ee431/workspace/6SAR_CDAC/SPDT.sym} -40 60 0 0 {name=x1}
C {lab_pin.sym} -130 0 0 0 {name=p4 sig_type=std_logic lab=ctrl}
C {lab_pin.sym} -90 0 0 1 {name=p5 sig_type=std_logic lab=ctrl_bar}
C {vdd.sym} 20 0 0 0 {name=l2 lab=VDD}
C {gnd.sym} 20 120 0 0 {name=l5 lab=GND}
C {sky130_fd_pr/cap_mim_m3_2.sym} 370 120 0 0 {name=C1 model=cap_mim_m3_2 W=5 L=5 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_2.sym} 180 120 0 0 {name=C2 model=cap_mim_m3_2 W=5 L=5 MF=1 spiceprefix=X}
C {gnd.sym} 180 150 0 0 {name=l9 lab=GND}
C {gnd.sym} 370 150 0 0 {name=l10 lab=GND}
