v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -20 -140 -20 -100 {
lab=RST_N}
N 70 -10 200 -10 {
lab=Q}
N -150 120 -150 200 {
lab=#net1}
N -150 120 -110 120 {
lab=#net1}
N -110 140 -110 170 {
lab=GND}
N -320 -10 -320 10 {
lab=D}
N -320 -10 -110 -10 {
lab=D}
N -260 90 -110 90 {
lab=CLK}
N -290 90 -260 90 {
lab=CLK}
N -290 90 -290 130 {
lab=CLK}
N -20 -100 -20 -70 {
lab=RST_N}
N -150 70 -110 70 {
lab=CLK_N}
N -530 130 -150 70 {
lab=CLK_N}
C {code.sym} 90 -210 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 170 120 0 0 {name=spice1 only_toplevel=false value="
.tran 100n 10m
.control
run
.endc"}
C {vsource.sym} -20 -170 2 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} -20 -200 2 0 {name=l2 lab=GND}
C {lab_pin.sym} -20 -120 0 0 {name=p2 sig_type=std_logic lab=RST_N}
C {/home/ee431/workspace/EE431_FinalProj/DFFRN.sym} -10 60 0 0 {name=x1}
C {lab_pin.sym} 200 -10 2 0 {name=p3 sig_type=std_logic lab=Q}
C {vsource.sym} -150 230 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} -110 170 0 0 {name=l3 lab=GND}
C {gnd.sym} -150 260 0 0 {name=l4 lab=GND}
C {vsource.sym} -290 150 0 0 {name=V4 value="pulse(0 1.8 0m 1u 1u 312.5u 625u)" savecurrent=false}
C {vsource.sym} -320 40 0 0 {name=V1 value="pulse(0 1.8 0 1u 1u 5m 10m)" savecurrent=false}
C {gnd.sym} -290 180 0 0 {name=l1 lab=GND}
C {gnd.sym} -320 70 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -240 -10 1 0 {name=p1 sig_type=std_logic lab=D}
C {lab_pin.sym} -190 90 1 0 {name=p4 sig_type=std_logic lab=CLK}
C {vsource.sym} -530 160 0 0 {name=V5 value="pulse(0 1.8 0m 1u 1u 312.5u 625u)" savecurrent=false}
C {gnd.sym} -530 190 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -530 130 1 0 {name=p5 sig_type=std_logic lab=CLK_N}
