v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -30 160 -30 180 {
lab=B}
N -30 160 70 160 {
lab=B}
N -230 200 -230 220 {
lab=A}
N -230 200 -130 200 {
lab=A}
N 170 230 170 320 {
lab=#net1}
N 170 220 170 230 {
lab=#net1}
N 70 160 130 160 {
lab=B}
N -130 110 130 110 {
lab=A}
N -130 110 -130 200 {
lab=A}
N 170 30 170 70 {
lab=S}
N 70 200 70 290 {
lab=#net2}
N 70 190 70 200 {
lab=#net2}
N 70 190 130 190 {
lab=#net2}
N 110 210 130 210 {
lab=GND}
N 110 210 110 250 {
lab=GND}
N 210 150 240 150 {
lab=OUT}
C {code.sym} 240 -20 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 290 200 0 0 {name=spice1 only_toplevel=false value="
.tran 10u 40m
.control
run
.endc"}
C {vsource.sym} -30 210 0 0 {name=V5 value="pulse(0 1.8 0 1u 1u 1m 2m)" savecurrent=false}
C {vsource.sym} 170 350 0 0 {name=V6 value="pulse(1.8 0 0 1u 1u 10m 20m)" savecurrent=false}
C {gnd.sym} 170 380 0 0 {name=l6 lab=GND}
C {gnd.sym} -30 240 0 0 {name=l8 lab=GND}
C {lab_pin.sym} 240 150 2 0 {name=p3 sig_type=std_logic lab=OUT}
C {lab_pin.sym} -30 160 0 0 {name=p4 sig_type=std_logic lab=B}
C {/home/ee431/workspace/EE431_FinalProj/MUX_2_1.sym} 170 150 0 0 {name=x1}
C {vsource.sym} -230 250 0 0 {name=V1 value="pulse(0 1.8 0 1u 1u 5m 10m)" savecurrent=false}
C {gnd.sym} -230 280 0 0 {name=l1 lab=GND}
C {vsource.sym} 170 0 2 0 {name=V2 value="pulse(0 1.8 0 1u 1u 10m 20m)" savecurrent=false}
C {gnd.sym} 170 -30 2 0 {name=l2 lab=GND}
C {vsource.sym} 70 320 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} 110 250 0 0 {name=l3 lab=GND}
C {gnd.sym} 70 350 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -130 110 0 0 {name=p1 sig_type=std_logic lab=A}
C {lab_pin.sym} 170 50 0 0 {name=p2 sig_type=std_logic lab=S}
