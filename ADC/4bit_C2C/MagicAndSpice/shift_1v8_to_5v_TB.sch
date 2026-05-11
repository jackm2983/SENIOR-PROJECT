v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -260 -50 -210 -50 {
lab=in}
N 180 -60 180 -30 {
lab=#net1}
N 160 -30 180 -30 {
lab=#net1}
N 90 -10 180 -10 {
lab=output_5v}
N 90 -30 160 -30 {
lab=#net1}
N 120 -70 120 -50 {
lab=#net2}
N 90 -50 120 -50 {
lab=#net2}
C {vsource.sym} 180 -90 2 0 {name=V1 value=5 savecurrent=false}
C {vsource.sym} -260 -20 0 0 {name=V2 value="PULSE(0 1.8 10n 1n 1n 500n 1u)" savecurrent=false}
C {gnd.sym} 90 10 0 0 {name=l1 lab=GND}
C {gnd.sym} -260 10 0 0 {name=l3 lab=GND}
C {gnd.sym} 180 -120 2 0 {name=l4 lab=GND}
C {opin.sym} 180 -10 0 0 {name=p1 lab=OUT_5v
}
C {lab_pin.sym} -260 -50 0 0 {name=p2 sig_type=std_logic lab=in}
C {code.sym} -130 170 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 80 180 0 0 {name=spice1 only_toplevel=false value="
.tran 100p 3u
.control
run
.endc"}
C {vsource.sym} 120 -100 2 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} 120 -130 2 0 {name=l2 lab=GND}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} -60 -20 0 0 {name=x1}
