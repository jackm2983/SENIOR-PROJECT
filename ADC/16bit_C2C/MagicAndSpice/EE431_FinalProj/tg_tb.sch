v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -10 -100 -10 -30 {
lab=#net1}
N -10 50 -10 110 {
lab=#net2}
N -170 0 -170 20 {
lab=IN}
N -170 0 -70 0 {
lab=IN}
N 50 0 80 0 {
lab=OUT}
N -260 -50 -40 -50 {
lab=#net3}
C {code.sym} 120 -160 0 0 {name=TT_MODELS only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 170 60 0 0 {name=spice only_toplevel=false value="
.tran 1u 40m
.control
run
.endc"}
C {vsource.sym} -170 50 0 0 {name=V1 value="pulse(0 1.8 0 1u 1u 5m 10m)" savecurrent=false}
C {vsource.sym} -10 140 0 0 {name=V2 value="pulse(0 1.8 0 1u 1u 0.5m 1m)" savecurrent=false}
C {vsource.sym} -10 -130 2 0 {name=V3 value="pulse(1.8 0 0 1u 1u 0.5m 1m)" savecurrent=false}
C {gnd.sym} -10 170 0 0 {name=l1 lab=GND}
C {gnd.sym} -10 -160 2 0 {name=l2 lab=GND}
C {gnd.sym} -170 80 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 80 0 2 0 {name=p1 sig_type=std_logic lab=OUT}
C {lab_pin.sym} -170 0 0 0 {name=p2 sig_type=std_logic lab=IN}
C {TGATE.sym} -10 50 0 0 {name=x1}
C {vsource.sym} -260 -20 0 0 {name=V4 value=1.8 savecurrent=false}
C {gnd.sym} -260 10 0 0 {name=l4 lab=GND}
C {gnd.sym} -40 50 0 0 {name=l5 lab=GND}
