v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -270 0 -150 -0 {
lab=in}
N 150 -0 200 0 {
lab=out}
C {/home/ee431/workspace/6SAR_CDAC/inverter_5v.sym} 0 0 0 0 {name=x1}
C {gnd.sym} 40 50 0 0 {name=l1 lab=GND}
C {vdd.sym} 40 -50 0 0 {name=l2 lab=VDD}
C {vsource.sym} -150 180 0 0 {name=V1 value=5 savecurrent=false}
C {gnd.sym} -150 210 0 0 {name=l3 lab=GND}
C {vdd.sym} -150 150 0 0 {name=l4 lab=VDD}
C {code.sym} 330 -50 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 350 150 0 0 {name=spice1 only_toplevel=false value="
.tran 10000n 2m
.control
run
.endc"}
C {vsource.sym} -300 0 1 0 {name=V2 value="PULSE(0 1.8 0 1m 1m 1m 2m)" savecurrent=false}
C {gnd.sym} -330 0 1 0 {name=l5 lab=GND}
C {opin.sym} 200 0 0 0 {name=p1 lab=out}
C {lab_pin.sym} -230 0 1 0 {name=p2 sig_type=std_logic lab=in}
