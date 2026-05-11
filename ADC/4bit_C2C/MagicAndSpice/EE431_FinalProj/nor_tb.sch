v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 90 20 90 40 {
lab=#net1}
N -10 20 90 20 {
lab=#net1}
N -10 20 -10 80 {
lab=#net1}
N 80 -260 80 -240 {
lab=#net2}
N -10 -260 80 -260 {
lab=#net2}
N -10 -260 -10 -170 {
lab=#net2}
N 70 140 170 140 {
lab=NOR_OUT}
N 70 -110 150 -110 {
lab=TRINOR_OUT}
N 150 -110 160 -110 {
lab=TRINOR_OUT}
N -280 120 -70 120 {
lab=A2}
N -280 120 -280 190 {
lab=A2}
N -280 -130 -280 -60 {
lab=A1}
N -190 -90 -70 -90 {
lab=B2}
N -200 -90 -190 -90 {
lab=B2}
N -280 -130 -70 -130 {
lab=A1}
N -100 -250 10 -250 {
lab=EN_N}
N 10 -250 10 -160 {
lab=EN_N}
N 10 -30 90 -30 {
lab=EN}
N 10 -60 10 -30 {
lab=EN}
N -140 160 -60 160 {
lab=B2}
N -520 210 -470 210 {
lab=B2}
N -720 210 -720 250 {
lab=#net3}
N -720 210 -600 210 {
lab=#net3}
N -560 240 -560 320 {
lab=GND}
N -490 70 -490 90 {
lab=#net4}
N -560 70 -490 70 {
lab=#net4}
N -560 70 -560 180 {
lab=#net4}
C {/home/ee431/workspace/EE431_FinalProj/tristate_NOR2.sym} 0 -100 0 0 {name=x1}
C {/home/ee431/workspace/EE431_FinalProj/NOR2.sym} -40 140 0 0 {name=x2}
C {code.sym} 250 -260 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 470 20 0 0 {name=spice1 only_toplevel=false value="
.tran 100n 10m
.control
run
.endc"}
C {vsource.sym} 90 70 0 0 {name=V3 value=1.8 savecurrent=false}
C {vsource.sym} 80 -210 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -10 -40 0 0 {name=l3 lab=GND}
C {gnd.sym} 80 -180 0 0 {name=l1 lab=GND}
C {gnd.sym} 90 100 0 0 {name=l2 lab=GND}
C {gnd.sym} -10 210 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 170 140 2 0 {name=p1 sig_type=std_logic lab=NOR_OUT}
C {lab_pin.sym} 160 -110 2 0 {name=p2 sig_type=std_logic lab=TRINOR_OUT}
C {vsource.sym} -720 280 0 0 {name=V2 value="PULSE(1.8 0 1m 1u 1u 2m 4m)" savecurrent=false}
C {vsource.sym} -280 220 0 0 {name=V4 value="PULSE(0 1.8 0 1u 1u 1m 2m)" savecurrent=false}
C {gnd.sym} -720 310 0 0 {name=l5 lab=GND}
C {gnd.sym} -280 250 0 0 {name=l6 lab=GND}
C {vsource.sym} -280 -30 0 0 {name=V6 value="PULSE(0 1.8 0 1u 1u 1m 2m)" savecurrent=false}
C {gnd.sym} -280 0 0 0 {name=l8 lab=GND}
C {vsource.sym} -100 -220 0 0 {name=V7 value="PULSE(1.8 0 0      1u 1u 0.5m 1m)" savecurrent=false}
C {gnd.sym} -100 -190 0 0 {name=l9 lab=GND}
C {vsource.sym} 120 -30 3 0 {name=V8 value="PULSE(0 1.8 0      1u 1u 0.5m 1m)" savecurrent=false}
C {gnd.sym} 150 -30 0 0 {name=l10 lab=GND}
C {lab_pin.sym} -240 -130 1 0 {name=p3 sig_type=std_logic lab=A1}
C {lab_pin.sym} -240 120 1 0 {name=p4 sig_type=std_logic lab=A2}
C {lab_pin.sym} -140 160 1 0 {name=p6 sig_type=std_logic lab=B2}
C {lab_pin.sym} -50 -250 1 0 {name=p7 sig_type=std_logic lab=EN_N}
C {lab_pin.sym} 60 -30 1 0 {name=p8 sig_type=std_logic lab=EN}
C {lab_pin.sym} -470 210 2 0 {name=p9 sig_type=std_logic lab=B2}
C {lab_pin.sym} -150 -90 1 0 {name=p5 sig_type=std_logic lab=B2}
C {/home/ee431/workspace/EE431_FinalProj/inverter.sym} -580 210 0 0 {name=x3}
C {gnd.sym} -560 320 0 0 {name=l7 lab=GND}
C {vsource.sym} -490 120 0 0 {name=V5 value=1.8 savecurrent=false}
C {gnd.sym} -490 150 0 0 {name=l11 lab=GND}
