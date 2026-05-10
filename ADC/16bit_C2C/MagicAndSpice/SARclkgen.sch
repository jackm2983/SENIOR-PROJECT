v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -250 -190 -180 -190 {
lab=PHIB}
N -100 -190 -10 -190 {
lab=#net1}
N -180 -50 -160 -50 {
lab=CLK}
N -180 80 -160 80 {
lab=PHIA}
N -120 -100 -120 -80 {
lab=#net2}
N -120 110 -120 140 {
lab=VSS}
N -120 -20 -120 0 {
lab=VSS}
N -120 30 -120 50 {
lab=#net3}
N -80 -50 0 -50 {
lab=#net4}
N 0 -30 0 80 {
lab=#net5}
N -80 80 0 80 {
lab=#net5}
N -140 -240 -140 -220 {
lab=#net6}
N -140 -160 -140 -130 {
lab=VSS}
C {lab_pin.sym} -10 -210 0 0 {name=p54 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 290 -230 2 0 {name=p63 sig_type=std_logic lab=PHIA}
C {lab_pin.sym} 300 -70 0 1 {name=p65 sig_type=std_logic lab=PHIB}
C {AND2.sym} 140 -200 0 0 {name=x8}
C {inverter.sym} -160 -190 0 0 {name=x12}
C {lab_pin.sym} -250 -190 2 1 {name=p70 sig_type=std_logic lab=PHIB}
C {AND2.sym} 150 -40 0 0 {name=x15}
C {inverter.sym} -140 -50 0 0 {name=x16}
C {inverter.sym} -140 80 0 0 {name=x17}
C {lab_pin.sym} -180 -50 0 0 {name=p71 sig_type=std_logic lab=CLK}
C {lab_pin.sym} -180 80 0 0 {name=p90 sig_type=std_logic lab=PHIA}
C {lab_pin.sym} -120 140 2 0 {name=p119 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -120 0 2 0 {name=p120 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 150 20 2 0 {name=p122 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 140 -140 2 0 {name=p123 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -140 -130 2 0 {name=p125 sig_type=std_logic lab=VSS}
C {iopin.sym} -290 -390 2 0 {name=p1 lab=VDD}
C {iopin.sym} -290 -370 2 0 {name=p2 lab=VSS}
C {ipin.sym} -290 -350 0 0 {name=p4 lab=CLK}
C {lab_pin.sym} -290 -350 2 0 {name=p3 sig_type=std_logic lab=CLK}
C {lab_pin.sym} -290 -390 2 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -290 -370 2 0 {name=p6 sig_type=std_logic lab=VSS}
C {opin.sym} -290 -320 2 0 {name=p7 lab=PHIA}
C {opin.sym} -290 -300 2 0 {name=p8 lab=PHIB}
C {lab_pin.sym} -290 -320 2 0 {name=p9 sig_type=std_logic lab=PHIA}
C {lab_pin.sym} -290 -300 0 1 {name=p10 sig_type=std_logic lab=PHIB}
C {iopin.sym} -290 -390 2 0 {name=p11 lab=VDD}
C {lab_pin.sym} -140 -240 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 140 -260 2 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 150 -100 2 0 {name=p14 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -120 -100 2 0 {name=p15 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -120 30 2 0 {name=p16 sig_type=std_logic lab=VDD}
