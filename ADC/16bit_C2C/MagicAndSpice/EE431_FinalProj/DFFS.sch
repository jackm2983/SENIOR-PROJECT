v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -240 -190 -240 100 {
lab=#net1}
N -290 -190 -240 -190 {
lab=#net1}
N -40 110 0 110 {
lab=#net2}
N -540 -190 -410 -190 {
lab=#net3}
N -580 -150 -580 -120 {
lab=VN}
N -580 -160 -580 -150 {
lab=VN}
N -380 -270 -380 -240 {
lab=VN}
N -120 -110 -120 -90 {
lab=VN}
N -120 -120 -120 -110 {
lab=VN}
N -80 130 -60 130 {
lab=VN}
N -580 -260 -580 -230 {
lab=VP}
N -580 -230 -580 -220 {
lab=VP}
N -380 -140 -380 -120 {
lab=VP}
N -120 -280 -120 -240 {
lab=VP}
N -80 90 -60 90 {
lab=VP}
N -350 -150 -350 -130 {
lab=PHIB}
N -350 -160 -350 -150 {
lab=PHIB}
N -120 50 -120 70 {
lab=PHIB}
N -120 150 -120 170 {
lab=PHIB_N}
N -350 -260 -350 -240 {
lab=PHIB_N}
N -200 -170 -200 -100 {
lab=SET_N}
N -700 -190 -620 -190 {
lab=D}
N -700 20 -640 20 {
lab=SET_N}
N -700 0 -640 0 {
lab=VN}
N -700 -30 -640 -30 {
lab=VP}
N -240 -190 -200 -190 {
lab=#net1}
N -20 -180 0 -180 {
lab=#net2}
N 0 -180 20 -180 {
lab=#net2}
N -80 110 -40 110 {
lab=#net2}
N -240 100 -240 110 {
lab=#net1}
N -120 30 -120 50 {
lab=PHIB}
N 0 -180 0 110 {
lab=#net2}
N -240 110 -160 110 {
lab=#net1}
N 250 -180 300 -180 {
lab=#net4}
N 160 -260 160 -230 {
lab=VN}
N 160 -130 160 -110 {
lab=VP}
N 190 -140 190 -120 {
lab=PHIA}
N 190 -150 190 -140 {
lab=PHIA}
N 190 -250 190 -230 {
lab=PHIA_N}
N 20 -180 130 -180 {
lab=#net2}
N 300 -180 430 -180 {
lab=#net4}
N 340 60 370 60 {
lab=#net4}
N 340 -180 340 60 {
lab=#net4}
N 510 -180 610 -180 {
lab=#net5}
N 610 -180 610 50 {
lab=#net5}
N 550 50 610 50 {
lab=#net5}
N 550 70 600 70 {
lab=SET_N}
N 610 -180 670 -180 {
lab=#net5}
N 750 -180 800 -180 {
lab=Q}
N 500 120 500 150 {
lab=PHIA_N}
N 470 120 470 140 {
lab=VN}
N 470 -30 470 0 {
lab=VP}
N 500 -20 500 0 {
lab=PHIA}
N 470 -150 470 -130 {
lab=VN}
N 470 -260 470 -210 {
lab=VP}
N 710 -260 710 -210 {
lab=VP}
N 710 -160 710 -120 {
lab=VN}
N -700 100 -640 100 {
lab=PHIA}
N -700 260 -640 260 {
lab=PHIB}
N -640 260 -570 260 {
lab=PHIB}
N -490 260 -430 260 {
lab=PHIB_N}
N -490 100 -450 100 {
lab=PHIA_N}
N -640 100 -570 100 {
lab=PHIA}
N -530 290 -530 310 {
lab=VN}
N -530 130 -530 150 {
lab=VN}
N -530 210 -530 230 {
lab=VP}
N -530 40 -530 70 {
lab=VP}
C {inverter.sym} -600 -190 0 0 {name=x1}
C {TGATE.sym} -350 -240 2 1 {name=x2}
C {lab_pin.sym} -60 130 2 0 {name=p3 sig_type=std_logic lab=VN}
C {lab_pin.sym} -120 -90 3 0 {name=p4 sig_type=std_logic lab=VN}
C {lab_pin.sym} -380 -270 1 0 {name=p7 sig_type=std_logic lab=VN}
C {lab_pin.sym} -580 -120 3 0 {name=p8 sig_type=std_logic lab=VN}
C {lab_pin.sym} -640 0 2 0 {name=p9 sig_type=std_logic lab=VN}
C {lab_pin.sym} -60 90 2 0 {name=p10 sig_type=std_logic lab=VP}
C {lab_pin.sym} -380 -120 3 0 {name=p14 sig_type=std_logic lab=VP}
C {lab_pin.sym} -580 -260 1 0 {name=p15 sig_type=std_logic lab=VP}
C {lab_pin.sym} -120 -280 1 0 {name=p16 sig_type=std_logic lab=VP}
C {lab_pin.sym} -640 20 2 0 {name=p30 sig_type=std_logic lab=SET_N}
C {ipin.sym} -700 -190 0 0 {name=p32 lab=D}
C {ipin.sym} -700 0 0 0 {name=p33 lab=VN}
C {ipin.sym} -700 20 0 0 {name=p36 lab=SET_N}
C {lab_pin.sym} -640 -30 2 0 {name=p37 sig_type=std_logic lab=VP}
C {ipin.sym} -700 -30 0 0 {name=p38 lab=VP}
C {opin.sym} 800 -180 0 0 {name=p29 lab=Q}
C {lab_pin.sym} -200 -100 3 0 {name=p1 sig_type=std_logic lab=SET_N}
C {NAND2.sym} -150 -180 0 0 {name=x3}
C {tristate_inv.sym} -120 110 0 1 {name=x4}
C {TGATE.sym} 190 -230 2 1 {name=x6}
C {lab_pin.sym} 160 -260 1 0 {name=p17 sig_type=std_logic lab=VN}
C {lab_pin.sym} 160 -110 3 0 {name=p18 sig_type=std_logic lab=VP}
C {inverter.sym} 450 -180 0 0 {name=x7}
C {tristate_NAND2.sym} 470 70 0 1 {name=x8}
C {lab_pin.sym} 600 70 2 0 {name=p13 sig_type=std_logic lab=SET_N}
C {inverter.sym} 690 -180 0 0 {name=x9}
C {lab_pin.sym} 470 -260 1 0 {name=p20 sig_type=std_logic lab=VP}
C {lab_pin.sym} 710 -260 1 0 {name=p23 sig_type=std_logic lab=VP}
C {lab_pin.sym} 470 -30 1 0 {name=p24 sig_type=std_logic lab=VP}
C {lab_pin.sym} 470 -130 3 0 {name=p26 sig_type=std_logic lab=VN}
C {lab_pin.sym} 710 -120 3 0 {name=p27 sig_type=std_logic lab=VN}
C {lab_pin.sym} 470 140 3 0 {name=p28 sig_type=std_logic lab=VN}
C {lab_pin.sym} -450 100 2 0 {name=p40 sig_type=std_logic lab=PHIA_N}
C {lab_pin.sym} -430 260 2 0 {name=p43 sig_type=std_logic lab=PHIB_N}
C {ipin.sym} -700 260 0 0 {name=p44 lab=PHIB}
C {inverter.sym} -550 100 0 0 {name=x5}
C {inverter.sym} -550 260 0 0 {name=x10}
C {lab_pin.sym} -530 150 3 0 {name=p51 sig_type=std_logic lab=VN}
C {lab_pin.sym} -530 310 3 0 {name=p52 sig_type=std_logic lab=VN}
C {lab_pin.sym} -530 210 1 0 {name=p54 sig_type=std_logic lab=VP}
C {ipin.sym} -700 100 0 0 {name=p45 lab=PHIA}
C {lab_pin.sym} -680 100 2 0 {name=p55 sig_type=std_logic lab=PHIA
}
C {lab_pin.sym} -660 260 2 0 {name=p46 sig_type=std_logic lab=PHIB
}
C {lab_pin.sym} -530 40 1 0 {name=p6 sig_type=std_logic lab=VP}
C {lab_pin.sym} -120 30 1 0 {name=p5 sig_type=std_logic lab=PHIB
}
C {lab_pin.sym} -120 170 3 0 {name=p2 sig_type=std_logic lab=PHIB_N}
C {lab_pin.sym} -350 -130 3 0 {name=p11 sig_type=std_logic lab=PHIB
}
C {lab_pin.sym} -350 -260 1 0 {name=p12 sig_type=std_logic lab=PHIB_N}
C {lab_pin.sym} 190 -250 1 0 {name=p19 sig_type=std_logic lab=PHIA_N}
C {lab_pin.sym} 190 -120 3 0 {name=p21 sig_type=std_logic lab=PHIA
}
C {lab_pin.sym} 500 -20 1 0 {name=p22 sig_type=std_logic lab=PHIA
}
C {lab_pin.sym} 500 150 3 0 {name=p25 sig_type=std_logic lab=PHIA_N}
