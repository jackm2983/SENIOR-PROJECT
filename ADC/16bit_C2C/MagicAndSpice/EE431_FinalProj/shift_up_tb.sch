v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -170 0 -170 30 {
lab=GND}
N -170 -110 -170 -40 {
lab=#net1}
N -260 -160 -260 -140 {
lab=#net1}
N -260 -160 -170 -160 {
lab=#net1}
N -170 -160 -170 -110 {
lab=#net1}
N -390 -20 -300 -20 {
lab=IN_1v8}
N -300 -20 -170 -20 {
lab=IN_1v8}
N 130 -40 200 -40 {
lab=OUT_5v}
C {gnd.sym} -170 30 0 0 {name=l1 lab=GND}
C {vsource.sym} -260 -110 0 0 {name=V1 value=5 savecurrent=false}
C {gnd.sym} -260 -80 0 0 {name=l2 lab=GND}
C {vsource.sym} -390 10 0 0 {name=V2 value="pulse(0 1.8 0 10n 10n 500u 1000u)" savecurrent=false}
C {gnd.sym} -390 40 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 200 -40 2 0 {name=p1 sig_type=std_logic lab=OUT_5v}
C {lab_pin.sym} -330 -20 1 0 {name=p2 sig_type=std_logic lab=IN_1v8}
C {code.sym} 210 -250 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 370 -70 0 0 {name=spice1 only_toplevel=false value="
.tran 100n 10m
.control
run
.endc"}
C {Shift_1v8_to_5v.sym} -20 -20 0 0 {name=x2}
