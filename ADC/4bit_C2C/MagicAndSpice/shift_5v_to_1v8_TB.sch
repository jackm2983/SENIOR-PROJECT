v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 160 -60 160 -40 {
lab=#net1}
N 130 -40 160 -40 {
lab=#net1}
N -210 -40 -170 -40 {
lab=in}
N 130 -20 200 -20 {
lab=OUT_1v8}
N -260 -40 -210 -40 {
lab=in}
N 130 20 130 40 {
lab=GND}
N 130 -0 130 20 {
lab=GND}
N 130 -60 130 -40 {
lab=#net1}
N -170 -60 -170 -40 {
lab=in}
C {vsource.sym} 160 -90 2 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} 130 40 0 0 {name=l1 lab=GND}
C {opin.sym} 200 -20 0 0 {name=p1 lab=OUT_1v8
}
C {vsource.sym} -260 -10 0 0 {name=V2 value="PULSE(0 5 10n 1n 1n 500n 1u)" savecurrent=false}
C {gnd.sym} -260 20 0 0 {name=l3 lab=GND}
C {gnd.sym} 160 -120 2 0 {name=l4 lab=GND}
C {code.sym} 340 -150 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 240 80 0 0 {name=spice1 only_toplevel=false value="
.tran 100p 3u
.control
run
.endc"}
C {lab_pin.sym} -260 -40 0 0 {name=p2 sig_type=std_logic lab=in}
C {/home/ee431/workspace/6SAR_CDAC/shift_5v_to_1v8.sym} -20 -20 0 0 {name=x1}
