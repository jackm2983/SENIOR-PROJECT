v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -190 -10 -140 -10 {
lab=CLK5}
N 160 20 160 40 {
lab=vdd}
N 160 -10 160 20 {
lab=vdd}
N -360 -50 -140 -50 {
lab=inp}
N -270 -30 -140 -30 {
lab=inn}
N 160 -50 200 -50 {
lab=outp}
N 160 -30 200 -30 {
lab=outn}
N -190 -10 -190 10 {
lab=CLK5}
N 200 -50 260 -50 {
lab=outp}
N 200 -30 260 -30 {
lab=outn}
C {devices/code.sym} 360 210 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} -170 210 0 0 {name=spice only_toplevel=false value=".tran 10u 10m
.control
run
.endc"}
C {/home/ee431/workspace/6SAR_CDAC/strongarm_comp.sym} 10 -30 0 0 {name=x1}
C {vsource.sym} 160 70 0 0 {name=V2 value=5 savecurrent=false}
C {gnd.sym} 160 100 0 0 {name=l1 lab=GND}
C {vsource.sym} -390 -50 1 0 {name=V1 value=2.5 savecurrent=false}
C {gnd.sym} -420 -50 1 0 {name=l4 lab=GND}
C {vsource.sym} -300 -30 1 0 {name=V4 value=2.55 savecurrent=false}
C {gnd.sym} -330 -30 1 0 {name=l5 lab=GND}
C {lab_pin.sym} 200 -50 0 1 {name=p2 sig_type=std_logic lab=outp}
C {lab_pin.sym} 200 -30 0 1 {name=p3 sig_type=std_logic lab=outn}
C {vsource.sym} -190 40 0 0 {name=V6 value="PULSE(0 5 0       .1n .1n 312.5u 625u)" savecurrent=false}
C {gnd.sym} -190 70 0 0 {name=l14 lab=GND}
C {lab_pin.sym} -190 -10 0 0 {name=p53 sig_type=std_logic lab=CLK5}
C {lab_pin.sym} -240 -50 1 0 {name=p4 sig_type=std_logic lab=inp}
C {lab_pin.sym} -220 -30 1 0 {name=p5 sig_type=std_logic lab=inn}
C {/home/ee431/workspace/6SAR_CDAC/SR_latch.sym} 410 -20 0 0 {name=x2}
C {gnd.sym} 560 10 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 160 20 0 1 {name=p6 sig_type=std_logic lab=vdd
}
C {lab_pin.sym} 560 -50 0 1 {name=p7 sig_type=std_logic lab=vdd
}
