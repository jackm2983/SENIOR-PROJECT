v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 220 -10 280 -10 {
lab=Out}
N -90 -10 -80 -10 {
lab=#net1}
N -170 -30 -80 -30 {
lab=#net2}
N -110 -10 -110 30 {
lab=#net1}
N -110 -10 -90 -10 {
lab=#net1}
C {gnd.sym} 220 10 0 0 {name=l1 lab=GND}
C {vsource.sym} 250 -30 3 0 {name=V1 value=5 savecurrent=false}
C {gnd.sym} 280 -30 3 0 {name=l2 lab=GND}
C {vsource.sym} -170 0 0 0 {name=V2 value="2.5" savecurrent=false}
C {gnd.sym} -170 30 0 0 {name=l3 lab=GND}
C {code.sym} 390 -140 0 0 {name=TT_MODELS only_toplevel=true 
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 400 30 0 0 {name=spice only_toplevel=false 
value=".tran 100n 2m
.control
run
.endc"}
C {vsource.sym} -110 60 0 0 {name=V3 value=2.5 savecurrent=false}
C {gnd.sym} -110 90 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 280 -10 0 1 {name=p1 sig_type=std_logic lab=Out}
C {/home/ee431/workspace/EE431_FinalProj/2_Stage_OP_AMP.sym} 70 -10 0 0 {name=x1}
