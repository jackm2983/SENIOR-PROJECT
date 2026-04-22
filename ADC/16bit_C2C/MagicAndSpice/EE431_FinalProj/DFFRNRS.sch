v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 550 -180 730 -180 {
lab=#net1}
N 640 -180 640 110 {
lab=#net1}
N 500 110 640 110 {
lab=#net1}
N 330 110 420 110 {
lab=#net2}
N 330 -190 330 110 {
lab=#net2}
N 330 -190 370 -190 {
lab=#net2}
N 250 -190 330 -190 {
lab=#net2}
N -140 100 -120 100 {
lab=#net3}
N -140 -190 -140 100 {
lab=#net3}
N -190 -190 -140 -190 {
lab=#net3}
N -140 -190 -60 -190 {
lab=#net3}
N 20 -190 130 -190 {
lab=#net4}
N 100 -190 100 110 {
lab=#net4}
N 60 110 100 110 {
lab=#net4}
N -460 -120 -460 -90 {
lab=VN}
N -460 -130 -460 -120 {
lab=VN}
N -220 -270 -220 -240 {
lab=VN}
N -20 -150 -20 -130 {
lab=VN}
N -20 -160 -20 -150 {
lab=VN}
N 160 -270 160 -240 {
lab=VP}
N -20 20 -20 40 {
lab=VN}
N 500 90 530 90 {
lab=VN}
N 770 -150 770 -120 {
lab=VN}
N 450 -120 450 -100 {
lab=VN}
N -460 -290 -460 -260 {
lab=VP}
N -460 -260 -460 -250 {
lab=VP}
N -220 -140 -220 -120 {
lab=VP}
N -20 -260 -20 -220 {
lab=VP}
N 450 -260 450 -240 {
lab=VP}
N 770 -240 770 -210 {
lab=VP}
N 500 130 530 130 {
lab=VP}
N -20 160 -20 180 {
lab=VP}
N 160 -140 160 -100 {
lab=VN}
N 190 -140 190 -120 {
lab=PHIA_N}
N -250 -150 -250 -130 {
lab=PHIB}
N -250 -160 -250 -150 {
lab=PHIB}
N 10 160 10 180 {
lab=PHIB}
N 460 50 460 70 {
lab=PHIA_N}
N 460 150 460 170 {
lab=PHIA}
N 10 20 10 40 {
lab=PHIB_N}
N -250 -260 -250 -240 {
lab=PHIB_N}
N 190 -250 190 -220 {
lab=PHIA}
N 60 90 130 90 {
lab=RST_N}
N 340 -260 340 -170 {
lab=RST_N}
N 340 -170 370 -170 {
lab=RST_N}
N 810 -180 860 -180 {
lab=Q}
N -600 90 -540 90 {
lab=RST_N}
N -600 60 -540 60 {
lab=PHIA}
N -600 0 -540 0 {
lab=VN}
N -600 -30 -540 -30 {
lab=VP}
N -600 220 -540 220 {
lab=PHIB}
N -540 220 -470 220 {
lab=PHIB}
N -390 220 -330 220 {
lab=PHIB_N}
N -390 60 -350 60 {
lab=PHIA_N}
N -540 60 -470 60 {
lab=PHIA}
N -430 250 -430 270 {
lab=VN}
N -430 90 -430 110 {
lab=VN}
N -430 0 -430 30 {
lab=VP}
N -430 170 -430 190 {
lab=VP}
N -360 -190 -310 -190 {
lab=#net5}
N -600 -200 -540 -200 {
lab=D}
N -600 -180 -540 -180 {
lab=#net6}
N -650 -180 -600 -180 {
lab=#net6}
N -790 -180 -730 -180 {
lab=RST}
N -690 -160 -690 -110 {
lab=VN}
N -690 -260 -690 -210 {
lab=VP}
C {TGATE.sym} -250 -240 2 0 {name=x2}
C {inverter.sym} -40 -190 0 0 {name=x3}
C {TGATE.sym} 190 -140 0 0 {name=x4}
C {inverter.sym} 750 -180 0 0 {name=x6}
C {tristate_inv.sym} 460 110 2 0 {name=x7}
C {tristate_NAND2.sym} -20 90 2 0 {name=x8}
C {lab_pin.sym} 530 90 2 0 {name=p1 sig_type=std_logic lab=VN}
C {lab_pin.sym} 450 -100 3 0 {name=p2 sig_type=std_logic lab=VN}
C {lab_pin.sym} -20 20 1 0 {name=p3 sig_type=std_logic lab=VN}
C {lab_pin.sym} -20 -130 3 0 {name=p4 sig_type=std_logic lab=VN}
C {lab_pin.sym} 160 -100 3 0 {name=p5 sig_type=std_logic lab=VN}
C {lab_pin.sym} 770 -120 3 0 {name=p6 sig_type=std_logic lab=VN}
C {lab_pin.sym} -220 -270 1 0 {name=p7 sig_type=std_logic lab=VN}
C {lab_pin.sym} -460 -90 3 0 {name=p8 sig_type=std_logic lab=VN}
C {lab_pin.sym} -540 0 2 0 {name=p9 sig_type=std_logic lab=VN}
C {lab_pin.sym} -20 180 3 0 {name=p10 sig_type=std_logic lab=VP}
C {lab_pin.sym} 530 130 2 0 {name=p11 sig_type=std_logic lab=VP}
C {lab_pin.sym} 450 -260 1 0 {name=p12 sig_type=std_logic lab=VP}
C {lab_pin.sym} 770 -240 1 0 {name=p13 sig_type=std_logic lab=VP}
C {lab_pin.sym} -220 -120 3 0 {name=p14 sig_type=std_logic lab=VP}
C {lab_pin.sym} -460 -290 1 0 {name=p15 sig_type=std_logic lab=VP}
C {lab_pin.sym} -20 -260 1 0 {name=p16 sig_type=std_logic lab=VP}
C {lab_pin.sym} 160 -270 1 0 {name=p17 sig_type=std_logic lab=VP}
C {lab_pin.sym} 130 90 2 0 {name=p27 sig_type=std_logic lab=RST_N}
C {lab_pin.sym} 340 -260 0 0 {name=p28 sig_type=std_logic lab=RST_N}
C {opin.sym} 860 -180 0 0 {name=p29 lab=Q}
C {lab_pin.sym} -540 90 2 0 {name=p30 sig_type=std_logic lab=RST_N}
C {lab_pin.sym} -350 60 2 0 {name=p31 sig_type=std_logic lab=PHIA_N}
C {ipin.sym} -600 -200 0 0 {name=p32 lab=D}
C {ipin.sym} -600 0 0 0 {name=p33 lab=VN}
C {ipin.sym} -600 90 0 0 {name=p36 lab=RST_N}
C {lab_pin.sym} -540 -30 2 0 {name=p37 sig_type=std_logic lab=VP}
C {ipin.sym} -600 -30 0 0 {name=p38 lab=VP}
C {lab_pin.sym} -330 220 2 0 {name=p39 sig_type=std_logic lab=PHIB_N}
C {NAND2.sym} 420 -180 0 0 {name=x10}
C {ipin.sym} -600 220 0 0 {name=p22 lab=PHIB}
C {inverter.sym} -450 60 0 0 {name=x5}
C {inverter.sym} -450 220 0 0 {name=x9}
C {lab_pin.sym} -430 110 3 0 {name=p51 sig_type=std_logic lab=VN}
C {lab_pin.sym} -430 270 3 0 {name=p52 sig_type=std_logic lab=VN}
C {lab_pin.sym} -430 0 1 0 {name=p53 sig_type=std_logic lab=VP}
C {lab_pin.sym} -430 170 1 0 {name=p54 sig_type=std_logic lab=VP}
C {lab_pin.sym} 190 -120 3 0 {name=p18 sig_type=std_logic lab=PHIA_N}
C {ipin.sym} -600 60 0 0 {name=p26 lab=PHIA}
C {lab_pin.sym} -580 60 2 0 {name=p55 sig_type=std_logic lab=PHIA
}
C {lab_pin.sym} 190 -250 1 0 {name=p56 sig_type=std_logic lab=PHIA
}
C {lab_pin.sym} 460 50 1 0 {name=p57 sig_type=std_logic lab=PHIA_N}
C {lab_pin.sym} 460 170 3 0 {name=p21 sig_type=std_logic lab=PHIA
}
C {lab_pin.sym} -560 220 2 0 {name=p23 sig_type=std_logic lab=PHIB
}
C {lab_pin.sym} 10 180 3 0 {name=p24 sig_type=std_logic lab=PHIB
}
C {lab_pin.sym} -250 -130 3 0 {name=p58 sig_type=std_logic lab=PHIB
}
C {lab_pin.sym} -250 -260 1 0 {name=p25 sig_type=std_logic lab=PHIB_N}
C {lab_pin.sym} 10 20 1 0 {name=p19 sig_type=std_logic lab=PHIB_N}
C {ipin.sym} -790 -180 0 0 {name=p20 lab=RST}
C {NAND2.sym} -490 -190 0 0 {name=x1}
C {inverter.sym} -710 -180 0 0 {name=x11}
C {lab_pin.sym} -690 -260 1 0 {name=p61 sig_type=std_logic lab=VP}
C {lab_pin.sym} -690 -110 3 0 {name=p62 sig_type=std_logic lab=VN}
