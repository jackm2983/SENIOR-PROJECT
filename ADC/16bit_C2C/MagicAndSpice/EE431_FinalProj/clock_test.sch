v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -300 200 -300 250 {
lab=CLK}
N -300 200 -160 200 {
lab=CLK}
N 420 220 480 220 {
lab=#net1}
N 420 420 480 420 {
lab=#net2}
N 480 420 550 420 {
lab=#net2}
N 630 420 690 420 {
lab=#net3}
N 630 220 670 220 {
lab=#net4}
N 480 220 550 220 {
lab=#net1}
N 590 450 590 470 {
lab=GND}
N 590 250 590 270 {
lab=GND}
N 590 160 590 190 {
lab=VP}
N 590 370 590 390 {
lab=VP}
N 330 420 420 420 {
lab=#net2}
N -160 200 -50 200 {
lab=CLK}
N 70 360 70 400 {
lab=PHIA}
N 70 240 70 280 {
lab=PHIB}
N -10 230 -10 260 {
lab=GND}
N -10 140 -10 170 {
lab=VP}
N 70 410 150 410 {
lab=PHIA}
N 70 400 70 410 {
lab=PHIA}
N 140 200 150 200 {
lab=CLK}
N 70 220 70 240 {
lab=PHIB}
N 70 220 150 220 {
lab=PHIB}
N 410 220 420 220 {
lab=#net1}
N 410 210 410 220 {
lab=#net1}
N 330 210 410 210 {
lab=#net1}
N 30 200 30 400 {
lab=#net5}
N -120 60 -110 200 {
lab=CLK}
N -120 60 110 70 {
lab=CLK}
N 110 70 110 200 {
lab=CLK}
N 110 200 150 200 {
lab=CLK}
N 30 410 30 430 {
lab=#net5}
N 30 400 30 410 {
lab=#net5}
N 30 430 150 430 {
lab=#net5}
N 690 420 720 420 {
lab=#net3}
N 800 420 860 420 {
lab=PHIB}
N 940 420 980 420 {
lab=PHIB_N}
N 940 220 980 220 {
lab=PHIA_N}
N 800 220 860 220 {
lab=PHIA}
N 670 220 720 220 {
lab=#net4}
N 900 440 900 480 {
lab=GND}
N 760 450 760 480 {
lab=GND}
N 760 150 760 180 {
lab=VP}
N 760 180 760 190 {
lab=VP}
N 900 150 900 190 {
lab=VP}
N 900 240 900 280 {
lab=GND}
N 760 240 760 280 {
lab=GND}
N 760 360 760 390 {
lab=VP}
N 900 360 900 390 {
lab=VP}
N 70 280 430 350 {
lab=PHIB}
N 430 350 820 350 {
lab=PHIB}
N 820 350 820 420 {
lab=PHIB}
N 70 360 500 290 {
lab=PHIA}
N 500 290 830 290 {
lab=PHIA}
N 830 220 830 290 {
lab=PHIA}
C {vsource.sym} -300 280 0 0 {name=V1 value="pulse(0 1.8 0 1n 1n 312.5u 625u" savecurrent=false}
C {gnd.sym} -300 310 0 0 {name=l1 lab=GND}
C {code.sym} 510 -290 0 0 {name=TT_MODELS1 only_toplevel=true
format="tcleval( @value )"
value=".lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt"}
C {code_shown.sym} 540 10 0 0 {name=spice1 only_toplevel=false value="
.tran 10n 2m
.control
run
.endc"}
C {vsource.sym} -110 -140 0 0 {name=V2 value=1.8 savecurrent=false}
C {lab_pin.sym} -110 -170 1 0 {name=p5 sig_type=std_logic lab=VP}
C {gnd.sym} -110 -110 0 0 {name=l5 lab=GND}
C {/home/ee431/workspace/EE431_FinalProj/inverter.sym} 570 220 0 0 {name=x5}
C {/home/ee431/workspace/EE431_FinalProj/inverter.sym} 570 420 0 0 {name=x9}
C {lab_pin.sym} 590 160 1 0 {name=p53 sig_type=std_logic lab=VP}
C {lab_pin.sym} 590 370 1 0 {name=p54 sig_type=std_logic lab=VP}
C {lab_pin.sym} 820 220 1 0 {name=p55 sig_type=std_logic lab=PHIA
}
C {lab_pin.sym} 830 420 3 0 {name=p23 sig_type=std_logic lab=PHIB
}
C {lab_pin.sym} 230 360 1 0 {name=p59 sig_type=std_logic lab=VP}
C {lab_pin.sym} 230 150 1 0 {name=p60 sig_type=std_logic lab=VP}
C {lab_pin.sym} -10 140 1 0 {name=p61 sig_type=std_logic lab=VP}
C {lab_pin.sym} -190 200 1 0 {name=p1 sig_type=std_logic lab=CLK}
C {/home/ee431/workspace/EE431_FinalProj/NAND2.sym} 200 420 0 0 {name=x1}
C {/home/ee431/workspace/EE431_FinalProj/NAND2.sym} 200 210 0 0 {name=x2}
C {/home/ee431/workspace/EE431_FinalProj/inverterx3.sym} -30 200 0 0 {name=x3}
C {gnd.sym} -10 260 0 0 {name=l2 lab=GND}
C {gnd.sym} 230 270 0 0 {name=l3 lab=GND}
C {gnd.sym} 590 270 0 0 {name=l4 lab=GND}
C {gnd.sym} 590 470 0 0 {name=l6 lab=GND}
C {gnd.sym} 230 480 0 0 {name=l7 lab=GND}
C {/home/ee431/workspace/EE431_FinalProj/inverter.sym} 740 220 0 0 {name=x4}
C {/home/ee431/workspace/EE431_FinalProj/inverter.sym} 880 220 0 0 {name=x6}
C {/home/ee431/workspace/EE431_FinalProj/inverter.sym} 740 420 0 0 {name=x7}
C {/home/ee431/workspace/EE431_FinalProj/inverter.sym} 880 420 0 0 {name=x8}
C {lab_pin.sym} 980 420 2 0 {name=p2 sig_type=std_logic lab=PHIB_N}
C {lab_pin.sym} 980 220 2 0 {name=p3 sig_type=std_logic lab=PHIA_N}
C {gnd.sym} 760 280 0 0 {name=l8 lab=GND}
C {gnd.sym} 900 280 0 0 {name=l9 lab=GND}
C {gnd.sym} 760 480 0 0 {name=l10 lab=GND}
C {gnd.sym} 900 480 0 0 {name=l11 lab=GND}
C {lab_pin.sym} 760 360 1 0 {name=p4 sig_type=std_logic lab=VP}
C {lab_pin.sym} 900 360 1 0 {name=p6 sig_type=std_logic lab=VP}
C {lab_pin.sym} 900 150 1 0 {name=p7 sig_type=std_logic lab=VP}
C {lab_pin.sym} 760 150 1 0 {name=p8 sig_type=std_logic lab=VP}
