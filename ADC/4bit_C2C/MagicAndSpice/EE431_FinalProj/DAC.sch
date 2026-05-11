v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 440 -20 520 -20 {
lab=OUT}
N 520 -20 520 60 {
lab=OUT}
N 110 60 520 60 {
lab=OUT}
N 110 -20 110 60 {
lab=OUT}
N 110 -20 140 -20 {
lab=OUT}
N 520 -20 540 -20 {
lab=OUT}
N -310 -10 -250 -10 {
lab=VDD}
N -250 -10 -250 0 {
lab=VDD}
N -250 -20 -250 0 {
lab=VDD}
N -250 -40 -250 -20 {
lab=VDD}
N 50 -40 90 -40 {
lab=R2R}
N 90 -40 140 -40 {
lab=R2R}
C {opin.sym} 540 -20 0 0 {name=p1 lab=OUT}
C {gnd.sym} 440 0 0 0 {name=l1 lab=GND}
C {gnd.sym} -250 60 0 0 {name=l2 lab=GND}
C {vsource.sym} -130 190 0 0 {name=V1 value=5 savecurrent=false}
C {gnd.sym} -130 220 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -130 160 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -250 40 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 440 -40 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -310 -10 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} -250 20 1 0 {name=l3 lab=GND}
C {code.sym} 170 120 0 0 {name=TT_MODELS only_toplevel=true 
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 180 290 0 0 {name=spice only_toplevel=false 
value=".tran 0.001 0.1
.control
run
.endc"}
C {opin.sym} 90 -40 3 0 {name=p6 lab=R2R}
C {/home/ee431/workspace/EE431_FinalProj/2_Stage_OP_AMP.sym} 290 -20 0 0 {name=x2}
C {/home/ee431/workspace/EE431_FinalProj/R2R_20k.sym} -100 10 0 0 {name=x1}
