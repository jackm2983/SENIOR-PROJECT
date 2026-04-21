v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -290 -80 -170 -80 {
lab=in}
N 130 -80 180 -80 {
lab=out}
N -70 -210 10 -210 {
lab=#net1}
N 10 -210 10 -140 {
lab=#net1}
C {gnd.sym} 30 -20 0 0 {name=l1 lab=GND}
C {vdd.sym} 30 -140 0 0 {name=l2 lab=VDD}
C {vsource.sym} -170 100 0 0 {name=V1 value=5 savecurrent=false}
C {gnd.sym} -170 130 0 0 {name=l3 lab=GND}
C {vdd.sym} -170 70 0 0 {name=l4 lab=VDD}
C {code.sym} 310 -130 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 330 70 0 0 {name=spice1 only_toplevel=false value="
.tran 10000n 2m
.control
run
.endc"}
C {vsource.sym} -320 -80 1 0 {name=V2 value="PULSE(0 5 0 1m 1m 1m 2m)" savecurrent=false}
C {gnd.sym} -350 -80 1 0 {name=l5 lab=GND}
C {opin.sym} 180 -80 0 0 {name=p1 lab=out}
C {lab_pin.sym} -250 -80 1 0 {name=p2 sig_type=std_logic lab=in}
C {/home/ee431/workspace/6SAR_CDAC/inverter_5v_to_1v8.sym} -20 -80 0 0 {name=x1}
C {vsource.sym} -100 -210 1 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} -130 -210 1 0 {name=l6 lab=GND}
