v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 940 10 1120 10 {
lab=#net1}
N 1030 10 1030 300 {
lab=#net1}
N 890 300 1030 300 {
lab=#net1}
N 720 300 810 300 {
lab=#net2}
N 720 0 720 300 {
lab=#net2}
N 720 0 760 -0 {
lab=#net2}
N 640 -0 720 -0 {
lab=#net2}
N 250 290 270 290 {
lab=#net3}
N 250 -0 250 290 {
lab=#net3}
N 200 -0 250 -0 {
lab=#net3}
N 250 -0 330 0 {
lab=#net3}
N 410 -0 520 -0 {
lab=#net4}
N 490 0 490 300 {
lab=#net4}
N 450 300 490 300 {
lab=#net4}
N -50 -0 80 0 {
lab=#net5}
N -90 40 -90 70 {
lab=VN}
N -90 30 -90 40 {
lab=VN}
N 170 -80 170 -50 {
lab=VN}
N 370 40 370 60 {
lab=VN}
N 370 30 370 40 {
lab=VN}
N 550 -80 550 -50 {
lab=VP}
N 370 210 370 230 {
lab=VN}
N 890 280 920 280 {
lab=VN}
N 1160 40 1160 70 {
lab=VN}
N 840 70 840 90 {
lab=VN}
N -90 -70 -90 -40 {
lab=VP}
N -90 -40 -90 -30 {
lab=VP}
N 170 50 170 70 {
lab=VP}
N 370 -70 370 -30 {
lab=VP}
N 840 -70 840 -50 {
lab=VP}
N 1160 -50 1160 -20 {
lab=VP}
N 890 320 920 320 {
lab=VP}
N 370 350 370 370 {
lab=VP}
N 550 50 550 90 {
lab=VN}
N 580 50 580 70 {
lab=PHIA_N}
N 140 40 140 60 {
lab=PHIB}
N 140 30 140 40 {
lab=PHIB}
N 400 350 400 370 {
lab=PHIB}
N 850 240 850 260 {
lab=PHIA_N}
N 850 340 850 360 {
lab=PHIA}
N 400 210 400 230 {
lab=PHIB_N}
N 140 -70 140 -50 {
lab=PHIB_N}
N 580 -60 580 -30 {
lab=PHIA}
N 450 280 520 280 {
lab=RST_N}
N 730 -70 730 20 {
lab=RST_N}
N 730 20 760 20 {
lab=RST_N}
N 1200 10 1250 10 {
lab=Q}
N -210 0 -130 0 {
lab=D}
N -210 280 -150 280 {
lab=RST_N}
N -210 250 -150 250 {
lab=PHIA}
N -210 190 -150 190 {
lab=VN}
N -210 160 -150 160 {
lab=VP}
N -210 410 -150 410 {
lab=PHIB}
N -150 410 -80 410 {
lab=PHIB}
N 0 410 60 410 {
lab=PHIB_N}
N -0 250 40 250 {
lab=PHIA_N}
N -150 250 -80 250 {
lab=PHIA}
N -40 440 -40 460 {
lab=VN}
N -40 280 -40 300 {
lab=VN}
N -40 190 -40 220 {
lab=VP}
N -40 360 -40 380 {
lab=VP}
C {inverter.sym} -110 0 0 0 {name=x1}
C {TGATE.sym} 140 -50 2 0 {name=x2}
C {inverter.sym} 350 0 0 0 {name=x3}
C {TGATE.sym} 580 50 0 0 {name=x4}
C {inverter.sym} 1140 10 0 0 {name=x6}
C {tristate_inv.sym} 850 300 2 0 {name=x7}
C {tristate_NAND2.sym} 370 280 2 0 {name=x8}
C {lab_pin.sym} 920 280 2 0 {name=p1 sig_type=std_logic lab=VN}
C {lab_pin.sym} 840 90 3 0 {name=p2 sig_type=std_logic lab=VN}
C {lab_pin.sym} 370 210 1 0 {name=p3 sig_type=std_logic lab=VN}
C {lab_pin.sym} 370 60 3 0 {name=p4 sig_type=std_logic lab=VN}
C {lab_pin.sym} 550 90 3 0 {name=p5 sig_type=std_logic lab=VN}
C {lab_pin.sym} 1160 70 3 0 {name=p6 sig_type=std_logic lab=VN}
C {lab_pin.sym} 170 -80 1 0 {name=p7 sig_type=std_logic lab=VN}
C {lab_pin.sym} -90 70 3 0 {name=p8 sig_type=std_logic lab=VN}
C {lab_pin.sym} -150 190 2 0 {name=p9 sig_type=std_logic lab=VN}
C {lab_pin.sym} 370 370 3 0 {name=p10 sig_type=std_logic lab=VP}
C {lab_pin.sym} 920 320 2 0 {name=p11 sig_type=std_logic lab=VP}
C {lab_pin.sym} 840 -70 1 0 {name=p12 sig_type=std_logic lab=VP}
C {lab_pin.sym} 1160 -50 1 0 {name=p13 sig_type=std_logic lab=VP}
C {lab_pin.sym} 170 70 3 0 {name=p14 sig_type=std_logic lab=VP}
C {lab_pin.sym} -90 -70 1 0 {name=p15 sig_type=std_logic lab=VP}
C {lab_pin.sym} 370 -70 1 0 {name=p16 sig_type=std_logic lab=VP}
C {lab_pin.sym} 550 -80 1 0 {name=p17 sig_type=std_logic lab=VP}
C {lab_pin.sym} 520 280 2 0 {name=p27 sig_type=std_logic lab=RST_N}
C {lab_pin.sym} 730 -70 0 0 {name=p28 sig_type=std_logic lab=RST_N}
C {opin.sym} 1250 10 0 0 {name=p29 lab=Q}
C {lab_pin.sym} -150 280 2 0 {name=p30 sig_type=std_logic lab=RST_N}
C {lab_pin.sym} 40 250 2 0 {name=p31 sig_type=std_logic lab=PHIA_N}
C {ipin.sym} -210 0 0 0 {name=p32 lab=D}
C {ipin.sym} -210 190 0 0 {name=p33 lab=VN}
C {ipin.sym} -210 280 0 0 {name=p36 lab=RST_N}
C {lab_pin.sym} -150 160 2 0 {name=p37 sig_type=std_logic lab=VP}
C {ipin.sym} -210 160 0 0 {name=p38 lab=VP}
C {lab_pin.sym} 60 410 2 0 {name=p39 sig_type=std_logic lab=PHIB_N}
C {NAND2.sym} 810 10 0 0 {name=x10}
C {ipin.sym} -210 410 0 0 {name=p22 lab=PHIB}
C {inverter.sym} -60 250 0 0 {name=x5}
C {inverter.sym} -60 410 0 0 {name=x9}
C {lab_pin.sym} -40 300 3 0 {name=p51 sig_type=std_logic lab=VN}
C {lab_pin.sym} -40 460 3 0 {name=p52 sig_type=std_logic lab=VN}
C {lab_pin.sym} -40 190 1 0 {name=p53 sig_type=std_logic lab=VP}
C {lab_pin.sym} -40 360 1 0 {name=p54 sig_type=std_logic lab=VP}
C {lab_pin.sym} 580 70 3 0 {name=p18 sig_type=std_logic lab=PHIA_N}
C {ipin.sym} -210 250 0 0 {name=p26 lab=PHIA}
C {lab_pin.sym} -190 250 2 0 {name=p55 sig_type=std_logic lab=PHIA
}
C {lab_pin.sym} 580 -60 1 0 {name=p56 sig_type=std_logic lab=PHIA
}
C {lab_pin.sym} 850 240 1 0 {name=p57 sig_type=std_logic lab=PHIA_N}
C {lab_pin.sym} 850 360 3 0 {name=p21 sig_type=std_logic lab=PHIA
}
C {lab_pin.sym} -170 410 2 0 {name=p23 sig_type=std_logic lab=PHIB
}
C {lab_pin.sym} 400 370 3 0 {name=p24 sig_type=std_logic lab=PHIB
}
C {lab_pin.sym} 140 60 3 0 {name=p58 sig_type=std_logic lab=PHIB
}
C {lab_pin.sym} 140 -70 1 0 {name=p25 sig_type=std_logic lab=PHIB_N}
C {lab_pin.sym} 400 210 1 0 {name=p19 sig_type=std_logic lab=PHIB_N}
