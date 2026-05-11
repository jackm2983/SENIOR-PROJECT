v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 50 -60 180 -60 {
lab=Q}
N -170 70 -170 150 {
lab=VP}
N -170 70 -130 70 {
lab=VP}
N -130 90 -130 120 {
lab=GND}
N -340 -60 -340 -40 {
lab=D}
N -340 -60 -130 -60 {
lab=D}
N -280 40 -130 40 {
lab=CLK}
N -310 40 -280 40 {
lab=CLK}
N -310 40 -310 80 {
lab=CLK}
N -40 -150 -40 -120 {
lab=SET_N}
N -150 -150 -40 -150 {
lab=SET_N}
N -310 80 -310 230 {
lab=CLK}
C {code.sym} 70 -260 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 150 70 0 0 {name=spice1 only_toplevel=false value="
.tran 100n 10m
.control
run
.endc"}
C {lab_pin.sym} 180 -60 2 0 {name=p3 sig_type=std_logic lab=Q}
C {vsource.sym} -170 180 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} -130 120 0 0 {name=l3 lab=GND}
C {gnd.sym} -170 210 0 0 {name=l4 lab=GND}
C {vsource.sym} -310 260 0 0 {name=V4 value="pulse(0 1.8 0m 10n 10n 312.5u 625u)" savecurrent=false}
C {vsource.sym} -340 -10 0 0 {name=V1 value="pulse(0 1.8 0 1u 1u 5m 10m)" savecurrent=false}
C {gnd.sym} -310 290 0 0 {name=l1 lab=GND}
C {gnd.sym} -340 20 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -260 -60 1 0 {name=p1 sig_type=std_logic lab=D}
C {lab_pin.sym} -210 40 1 0 {name=p4 sig_type=std_logic lab=CLK}
C {/home/ee431/workspace/EE431_FinalProj/DFFS.sym} -40 20 0 0 {name=x1}
C {vsource.sym} -180 -150 1 0 {name=V5 value=0 savecurrent=false}
C {gnd.sym} -210 -150 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -40 -150 2 0 {name=p5 sig_type=std_logic lab=SET_N}
C {lab_pin.sym} -170 120 0 0 {name=p6 sig_type=std_logic lab=VP}
