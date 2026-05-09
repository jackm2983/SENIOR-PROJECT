v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {} 920 -750 0 0 0.2 0.2 {}
T {Comparator operating off of delayed Clock} -530 -760 0 0 0.2 0.2 {}
N 350 -130 350 -60 {
lab=CLK5_N}
N 420 -110 420 10 {
lab=CLK5}
N 420 -110 560 -110 {
lab=CLK5}
N 350 -130 560 -130 {
lab=CLK5_N}
N -150 -380 -120 -380 {
lab=b3}
N 860 -250 880 -250 {
lab=cdac}
N 610 -760 630 -760 {
lab=VDD1v8}
N 1120 -590 1220 -590 {
lab=DAC_B3}
N 1120 -530 1220 -530 {
lab=DAC_B0}
N 1120 -550 1220 -550 {
lab=DAC_B1}
N 1120 -570 1220 -570 {
lab=DAC_B2}
N 1120 -670 1220 -670 {
lab=ADC_OUT3}
N 1120 -650 1220 -650 {
lab=ADC_OUT2}
N 1120 -630 1220 -630 {
lab=ADC_OUT1}
N 1120 -610 1220 -610 {
lab=ADC_OUT0}
N 780 -610 820 -610 {
lab=CLK_N}
N 790 -590 820 -590 {
lab=VDD1v8}
N 820 -570 820 -540 {
lab=VSS}
N -200 -680 -120 -680 {
lab=compp}
N -200 -660 -120 -660 {
lab=compn}
N 220 -650 220 -640 {
lab=latch}
N 660 -690 660 -670 {
lab=comp1v8}
N 790 -630 820 -630 {
lab=CLK}
N 720 -330 720 -280 {
lab=VDD_5V}
N 180 -720 180 -680 {
lab=VDD_5V}
N 210 -640 220 -640 {
lab=latch}
N 1420 -490 1420 -470 {
lab=CLK_N}
N 1420 -610 1420 -590 {
lab=CLK}
N 180 -640 210 -640 {
lab=latch}
N 520 -230 560 -230 {
lab=VCM}
N 450 -250 560 -250 {
lab=Vin}
N 660 -670 820 -670 {
lab=comp1v8}
N 700 -650 700 -540 {
lab=RST_N}
N -610 -640 -500 -640 {
lab=CLK_comp5}
N -670 -640 -610 -640 {
lab=CLK_comp5}
N 600 -760 610 -760 {
lab=VDD1v8}
N 600 -760 600 -680 {
lab=VDD1v8}
N 640 -670 640 -640 {
lab=comp1v8}
N 220 -640 300 -640 {
lab=latch}
N 300 -680 300 -650 {
lab=latch}
N 300 -650 300 -640 {
lab=latch}
N 700 -650 820 -650 {
lab=RST_N}
N 600 -640 640 -640 {
lab=comp1v8}
N 640 -670 660 -670 {
lab=comp1v8}
N -150 -420 -120 -420 {
lab=VDD1v8}
N -150 -400 -120 -400 {
lab=VDD_5V}
N -150 -190 -120 -190 {
lab=b2}
N -150 -230 -120 -230 {
lab=VDD1v8}
N -150 -210 -120 -210 {
lab=VDD_5V}
N -150 -50 -120 -50 {
lab=b1}
N -150 -90 -120 -90 {
lab=VDD1v8}
N -150 -70 -120 -70 {
lab=VDD_5V}
N -150 140 -120 140 {
lab=b0}
N -150 100 -120 100 {
lab=VDD1v8}
N -150 120 -120 120 {
lab=VDD_5V}
N 1400 -170 1400 -140 {
lab=VCM}
N 1400 -150 1530 -150 {
lab=VCM}
N 1400 -260 1400 -230 {
lab=VDD_5V}
N 1400 -80 1400 -40 {
lab=VSS}
N 1860 -570 1890 -570 {
lab=CLK5}
N 1860 -610 1890 -610 {
lab=VDD1v8}
N 1860 -590 1890 -590 {
lab=VDD_5V}
N 1860 -450 1890 -450 {
lab=CLK5_N}
N 1860 -490 1890 -490 {
lab=VDD1v8}
N 1860 -470 1890 -470 {
lab=VDD_5V}
N 1420 -610 1560 -610 {
lab=CLK}
N 1420 -490 1560 -490 {
lab=CLK_N}
N 1420 -380 1420 -360 {
lab=CLK_comp}
N 1860 -340 1890 -340 {
lab=CLK_comp5}
N 1860 -380 1890 -380 {
lab=VDD1v8}
N 1860 -360 1890 -360 {
lab=VDD_5V}
N 1420 -380 1560 -380 {
lab=CLK_comp}
C {/home/ee431/workspace/6SAR_CDAC/CDAC_4bit_VCM_simplified.sym} 710 -180 0 0 {name=x1}
C {lab_pin.sym} -120 -380 2 0 {name=p4 sig_type=std_logic lab=b3}
C {lab_pin.sym} 560 -210 2 1 {name=p10 sig_type=std_logic lab=b3}
C {lab_pin.sym} 560 -190 2 1 {name=p11 sig_type=std_logic lab=b2}
C {lab_pin.sym} 560 -170 2 1 {name=p12 sig_type=std_logic lab=b1}
C {lab_pin.sym} 560 -150 2 1 {name=p13 sig_type=std_logic lab=b0}
C {lab_pin.sym} 520 -230 0 0 {name=p16 sig_type=std_logic lab=VCM}
C {lab_pin.sym} -500 -680 0 0 {name=p17 sig_type=std_logic lab=VCM}
C {vsource.sym} 660 -760 3 0 {name=V7 value=1.8 savecurrent=false}
C {gnd.sym} 690 -760 3 0 {name=l30 lab=GND}
C {lab_pin.sym} 610 -760 1 0 {name=p21 sig_type=std_logic lab=VDD1v8}
C {shift_5v_to_1v8.sym} 450 -640 0 0 {name=x6}
C {lab_pin.sym} 1220 -590 2 0 {name=p19 sig_type=std_logic lab=DAC_B3}
C {lab_pin.sym} 1220 -570 2 0 {name=p20 sig_type=std_logic lab=DAC_B2}
C {lab_pin.sym} 1220 -550 2 0 {name=p22 sig_type=std_logic lab=DAC_B1}
C {lab_pin.sym} 1220 -530 2 0 {name=p23 sig_type=std_logic lab=DAC_B0}
C {lab_pin.sym} 1220 -670 2 0 {name=p24 sig_type=std_logic lab=ADC_OUT3}
C {lab_pin.sym} 1220 -650 2 0 {name=p25 sig_type=std_logic lab=ADC_OUT2}
C {lab_pin.sym} 1220 -630 2 0 {name=p26 sig_type=std_logic lab=ADC_OUT1}
C {lab_pin.sym} 1220 -610 2 0 {name=p27 sig_type=std_logic lab=ADC_OUT0}
C {lab_pin.sym} 700 -570 2 1 {name=p28 sig_type=std_logic lab=RST_N}
C {lab_pin.sym} 660 -690 0 1 {name=p18 sig_type=std_logic lab=comp1v8}
C {lab_pin.sym} -450 -230 2 1 {name=p33 sig_type=std_logic lab=DAC_B2}
C {/home/ee431/workspace/6SAR_CDAC/strongarm_comp.sym} -350 -660 0 0 {name=x13}
C {/home/ee431/workspace/6SAR_CDAC/SR_latch.sym} 30 -650 0 0 {name=x14}
C {lab_pin.sym} 880 -250 0 1 {name=p1 sig_type=std_logic lab=cdac}
C {lab_pin.sym} -500 -660 0 0 {name=p41 sig_type=std_logic lab=cdac}
C {lab_pin.sym} 720 -330 0 1 {name=p42 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} 180 -720 3 1 {name=p51 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -200 -640 0 1 {name=p52 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} 1890 -570 2 0 {name=p53 sig_type=std_logic lab=CLK5}
C {lab_pin.sym} 1890 -450 2 0 {name=p54 sig_type=std_logic lab=CLK5_N}
C {lab_pin.sym} 420 -60 0 1 {name=p55 sig_type=std_logic lab=CLK5}
C {lab_pin.sym} 350 -60 2 1 {name=p6 sig_type=std_logic lab=CLK5_N}
C {lab_pin.sym} 1420 -610 0 0 {name=p7 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 1420 -490 0 0 {name=p56 sig_type=std_logic lab=CLK_N}
C {lab_pin.sym} 490 -250 1 0 {name=p5 sig_type=std_logic lab=Vin}
C {lab_pin.sym} -450 -420 2 1 {name=p32 sig_type=std_logic lab=DAC_B3}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} -300 -390 0 0 {name=x10}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} -300 -200 0 0 {name=x3}
C {lab_pin.sym} 610 -760 1 0 {name=p37 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -120 -420 2 0 {name=p43 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} 720 -330 0 1 {name=p47 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -120 -400 0 1 {name=p48 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -120 -190 2 0 {name=p49 sig_type=std_logic lab=b2}
C {lab_pin.sym} -120 -230 2 0 {name=p50 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -120 -210 0 1 {name=p57 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -120 -50 2 0 {name=p3 sig_type=std_logic lab=b1
}
C {lab_pin.sym} -450 100 2 1 {name=p8 sig_type=std_logic lab=DAC_B0}
C {lab_pin.sym} -450 -90 2 1 {name=p9 sig_type=std_logic lab=DAC_B1}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} -300 -60 0 0 {name=x2}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} -300 130 0 0 {name=x4}
C {lab_pin.sym} -120 -90 2 0 {name=p34 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -120 -70 0 1 {name=p35 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -120 140 2 0 {name=p38 sig_type=std_logic lab=b0}
C {lab_pin.sym} -120 100 2 0 {name=p44 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -120 120 0 1 {name=p45 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} 1530 -150 2 0 {name=p46 sig_type=std_logic lab=VCM}
C {lab_pin.sym} 720 -330 0 1 {name=p58 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} 1400 -260 0 1 {name=p59 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} 790 -630 0 0 {name=p60 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 780 -610 2 1 {name=p30 sig_type=std_logic lab=CLK_N}
C {lab_pin.sym} 790 -590 0 0 {name=p31 sig_type=std_logic lab=VDD1v8}
C {SAR.sym} 970 -580 0 0 {name=x5}
C {sky130_fd_pr/res_xhigh_po.sym} 1400 -200 0 0 {name=R3
W=2
L=10
model=res_xhigh_po
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po.sym} 1400 -110 0 0 {name=R4
W=2
L=10
model=res_xhigh_po
spiceprefix=X
mult=1}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} 1710 -580 0 0 {name=x7}
C {lab_pin.sym} 1890 -610 2 0 {name=p61 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} 1890 -590 0 1 {name=p62 sig_type=std_logic lab=VDD_5V}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} 1710 -460 0 0 {name=x8}
C {lab_pin.sym} 1890 -490 2 0 {name=p65 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} 1890 -470 0 1 {name=p66 sig_type=std_logic lab=VDD_5V}
C {iopin.sym} -770 -280 2 0 {name=p15 lab=VDD_5V}
C {iopin.sym} -770 -260 2 0 {name=p29 lab=CLK}
C {iopin.sym} -770 -240 2 0 {name=p63 lab=CLK_N}
C {iopin.sym} -770 -220 2 0 {name=p64 lab=CLK_comp}
C {iopin.sym} -770 -300 2 0 {name=p67 lab=VDD1v8}
C {iopin.sym} -770 -320 2 0 {name=p68 lab=VSS}
C {lab_pin.sym} -770 -220 2 0 {name=p69 sig_type=std_logic lab=CLK_comp}
C {lab_pin.sym} 1420 -490 0 0 {name=p70 sig_type=std_logic lab=CLK_N}
C {lab_pin.sym} -770 -240 2 0 {name=p71 sig_type=std_logic lab=CLK_N}
C {lab_pin.sym} -770 -260 2 0 {name=p72 sig_type=std_logic lab=CLK}
C {lab_pin.sym} -770 -280 0 1 {name=p73 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} -770 -300 2 0 {name=p74 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} -770 -320 2 0 {name=p75 sig_type=std_logic lab=VSS}
C {iopin.sym} -770 -200 2 0 {name=p36 lab=RST_N}
C {lab_pin.sym} -770 -200 2 0 {name=p76 sig_type=std_logic lab=RST_N}
C {iopin.sym} -770 -180 2 0 {name=p77 lab=Vin}
C {lab_pin.sym} -770 -180 2 0 {name=p78 sig_type=std_logic lab=Vin}
C {lab_pin.sym} -770 -320 2 0 {name=p79 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -150 160 2 0 {name=p80 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -150 -30 2 0 {name=p81 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -150 -170 2 0 {name=p82 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 720 -80 2 0 {name=p83 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -150 -360 2 0 {name=p84 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -200 -620 2 0 {name=p85 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 180 -620 2 0 {name=p86 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 600 -620 2 0 {name=p87 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 820 -540 3 0 {name=p88 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1860 -550 2 0 {name=p89 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1860 -430 2 0 {name=p90 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1400 -40 2 0 {name=p91 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1380 -110 0 0 {name=p92 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -770 -320 2 0 {name=p93 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1380 -200 0 0 {name=p95 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 720 -80 3 0 {name=p96 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -770 -140 2 0 {name=p94 sig_type=std_logic lab=ADC_OUT3}
C {lab_pin.sym} -770 -120 2 0 {name=p97 sig_type=std_logic lab=ADC_OUT2}
C {lab_pin.sym} -770 -100 2 0 {name=p98 sig_type=std_logic lab=ADC_OUT1}
C {lab_pin.sym} -770 -80 2 0 {name=p99 sig_type=std_logic lab=ADC_OUT0}
C {iopin.sym} -770 -140 2 0 {name=p100 lab=ADC_OUT3}
C {iopin.sym} -770 -120 2 0 {name=p101 lab=ADC_OUT2}
C {iopin.sym} -770 -100 2 0 {name=p102 lab=ADC_OUT1}
C {iopin.sym} -770 -80 2 0 {name=p103 lab=ADC_OUT0}
C {lab_pin.sym} 220 -650 3 1 {name=p104 sig_type=std_logic lab=latch}
C {lab_pin.sym} -160 -680 3 1 {name=p39 sig_type=std_logic lab=compp}
C {lab_pin.sym} -130 -660 1 1 {name=p105 sig_type=std_logic lab=compn}
C {/home/ee431/workspace/6SAR_CDAC/shift_1v8_to_5v.sym} 1710 -350 0 0 {name=x9}
C {lab_pin.sym} 1890 -380 2 0 {name=p106 sig_type=std_logic lab=VDD1v8}
C {lab_pin.sym} 1890 -360 0 1 {name=p107 sig_type=std_logic lab=VDD_5V}
C {lab_pin.sym} 1860 -320 2 0 {name=p109 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1420 -380 0 0 {name=p110 sig_type=std_logic lab=CLK_comp}
C {lab_pin.sym} 1420 -380 0 0 {name=p40 sig_type=std_logic lab=CLK_comp}
C {lab_pin.sym} 1420 -380 0 0 {name=p108 sig_type=std_logic lab=CLK_comp}
C {lab_pin.sym} 1890 -340 2 0 {name=p111 sig_type=std_logic lab=CLK_comp5}
C {lab_pin.sym} -670 -640 0 0 {name=p14 sig_type=std_logic lab=CLK_comp5}
