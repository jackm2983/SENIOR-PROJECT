v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -150 10 -150 40 {
lab=GND}
N -150 -100 -150 -30 {
lab=#net1}
N -240 -150 -240 -130 {
lab=#net1}
N -240 -150 -150 -150 {
lab=#net1}
N -150 -150 -150 -100 {
lab=#net1}
N -370 -10 -280 -10 {
lab=IN_5v}
N -280 -10 -150 -10 {
lab=IN_5v}
N 150 -30 220 -30 {
lab=OUT_1v8}
C {/home/ee431/workspace/EE431_FinalProj/Shift_5v_to_1v8.sym} 0 -10 0 0 {name=x1}
C {gnd.sym} -150 40 0 0 {name=l1 lab=GND}
C {vsource.sym} -240 -100 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -240 -70 0 0 {name=l2 lab=GND}
C {vsource.sym} -370 20 0 0 {name=V2 value="pulse(0 5 0 10n 10n 500u 1000u)" savecurrent=false}
C {gnd.sym} -370 50 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 220 -30 2 0 {name=p1 sig_type=std_logic lab=OUT_1v8}
C {lab_pin.sym} -310 -10 1 0 {name=p2 sig_type=std_logic lab=IN_5v}
C {code.sym} 230 -240 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 390 -60 0 0 {name=spice1 only_toplevel=false value="
.tran 100n 10m
.control
run
.endc"}
