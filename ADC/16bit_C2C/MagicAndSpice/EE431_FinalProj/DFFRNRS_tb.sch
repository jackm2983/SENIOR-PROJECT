v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -20 -190 -20 -150 {
lab=RST_N}
N 70 -60 200 -60 {
lab=Q}
N -150 70 -150 150 {
lab=#net1}
N -150 70 -110 70 {
lab=#net1}
N -110 90 -110 120 {
lab=GND}
N -320 -60 -320 -40 {
lab=D}
N -320 -60 -110 -60 {
lab=D}
N -260 40 -110 40 {
lab=CLK}
N -290 40 -260 40 {
lab=CLK}
N -290 40 -290 80 {
lab=CLK}
N -20 -150 -20 -120 {
lab=RST_N}
N -130 -30 -110 -30 {
lab=RST_N}
N -130 -140 -130 -30 {
lab=RST_N}
N -130 -140 -20 -140 {
lab=RST_N}
C {code.sym} 90 -260 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 170 70 0 0 {name=spice1 only_toplevel=false value="
.tran 100n 10m
.control
run
.endc"}
C {vsource.sym} -20 -220 2 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -20 -250 2 0 {name=l2 lab=GND}
C {lab_pin.sym} -20 -170 0 0 {name=p2 sig_type=std_logic lab=RST_N}
C {lab_pin.sym} 200 -60 2 0 {name=p3 sig_type=std_logic lab=Q}
C {vsource.sym} -150 180 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} -110 120 0 0 {name=l3 lab=GND}
C {gnd.sym} -150 210 0 0 {name=l4 lab=GND}
C {vsource.sym} -290 100 0 0 {name=V4 value="pulse(0 1.8 2m 1u 1u 0.5m 1m)" savecurrent=false}
C {vsource.sym} -320 -10 0 0 {name=V1 value="pulse(0 1.8 0 1u 1u 5m 10m)" savecurrent=false}
C {gnd.sym} -290 130 0 0 {name=l1 lab=GND}
C {gnd.sym} -320 20 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -240 -60 1 0 {name=p1 sig_type=std_logic lab=D}
C {lab_pin.sym} -190 40 1 0 {name=p4 sig_type=std_logic lab=CLK}
C {/home/ee431/workspace/EE431_FinalProj/DFFRNRS.sym} -30 0 0 0 {name=x1}
