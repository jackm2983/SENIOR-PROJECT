v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 160 -40 240 -40 {
lab=output}
N -310 -20 -140 -20 {
lab=A}
N -210 0 -140 -0 {
lab=B}
N -210 0 -210 60 {
lab=B}
N -380 -20 -310 -20 {
lab=A}
N -380 -20 -380 -10 {
lab=A}
C {AND2.sym} 10 -10 0 0 {name=x1}
C {vsource.sym} 10 -100 2 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} 10 50 0 0 {name=l1 lab=GND}
C {gnd.sym} 10 -130 2 0 {name=l2 lab=GND}
C {lab_pin.sym} 240 -40 2 0 {name=p2 sig_type=std_logic lab=output}
C {code.sym} 480 -90 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 250 130 0 0 {name=s2 only_toplevel=false value="
.tran 1n 4u
.control
run
.endc"}
C {vsource.sym} -380 20 0 0 {name=V2 value="PULSE(0 1.8 0 1n 1n 500n 1000n)" savecurrent=false}
C {vsource.sym} -210 90 0 0 {name=V3 value="PULSE(0 1.8 0 1n 1n 1000n 2000n)" savecurrent=false}
C {gnd.sym} -210 120 0 0 {name=l3 lab=GND}
C {gnd.sym} -380 50 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -310 -20 1 0 {name=p1 sig_type=std_logic lab=A}
C {lab_pin.sym} -170 0 3 0 {name=p3 sig_type=std_logic lab=B}
