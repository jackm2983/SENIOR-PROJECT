v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Using Y as single ended output} -70 10 0 0 0.2 0.2 {}
T {CLK low -> X, Y, P, Q all precharged to 5V
CLK High -> inputs pull latch and Y swings to 0 or 5V} -350 -300 0 0 0.5 0.5 {}
N 0 390 0 420 {
lab=GND}
N -0 360 40 360 {
lab=GND}
N 40 360 70 360 {
lab=GND}
N -110 230 -40 230 {
lab=GND}
N 30 230 110 230 {
lab=GND}
N -110 260 -110 300 {
lab=#net1}
N -110 300 -0 300 {
lab=#net1}
N -0 300 -0 330 {
lab=#net1}
N 110 260 110 300 {
lab=#net1}
N 0 300 110 300 {
lab=#net1}
N -110 120 -110 200 {
lab=p}
N 110 120 110 200 {
lab=q}
N -190 90 -110 90 {
lab=GND}
N 110 90 180 90 {
lab=GND}
N -200 -50 -110 -50 {
lab=VDD}
N 110 -50 190 -50 {
lab=VDD}
N -110 -20 -110 60 {
lab=x}
N 110 -20 110 60 {
lab=out}
N 110 -170 110 -80 {
lab=VDD}
N -150 -170 110 -170 {
lab=VDD}
N -110 -170 -110 -80 {
lab=VDD}
N 110 -170 220 -170 {
lab=VDD}
N 0 -200 0 -170 {
lab=VDD}
N -70 -50 60 -0 {
lab=out}
N 60 -0 110 0 {
lab=out}
N -70 -0 70 -50 {
lab=x}
N -110 -0 -70 -0 {
lab=x}
N -70 90 50 50 {
lab=out}
N 50 50 110 50 {
lab=out}
N -60 50 70 90 {
lab=x}
N -110 50 -60 50 {
lab=x}
N -500 -170 -150 -170 {
lab=VDD}
N -350 -170 -350 -90 {
lab=VDD}
N -350 -30 -350 -0 {
lab=x}
N -350 -0 -110 -0 {
lab=x}
N -350 -60 -290 -60 {
lab=VDD}
N 350 -170 350 -90 {
lab=VDD}
N 350 -30 350 0 {
lab=out}
N 110 0 350 0 {
lab=out}
N 290 -60 350 -60 {
lab=VDD}
N 220 -170 350 -170 {
lab=VDD}
N -480 160 -110 160 {
lab=p}
N -480 110 -480 160 {
lab=p}
N -480 -170 -480 50 {
lab=VDD}
N -480 80 -390 80 {
lab=VDD}
N 110 160 480 160 {
lab=q}
N 480 110 480 160 {
lab=q}
N 390 80 480 80 {
lab=VDD}
N 350 -170 480 -170 {
lab=VDD}
N 480 -170 480 50 {
lab=VDD}
N -540 80 -520 80 {
lab=clk}
N -420 -60 -390 -60 {
lab=clk}
N 390 -60 410 -60 {
lab=clk}
N 520 80 540 80 {
lab=clk}
N -80 360 -40 360 {
lab=clk}
N -220 230 -150 230 {
lab=Vinp}
N 150 230 220 230 {
lab=Vinn}
N -400 380 -360 380 {
lab=clk}
N -390 340 -370 340 {
lab=VDD}
N 110 30 180 30 {
lab=out}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -90 90 0 1 {name=M1
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -90 -50 0 1 {name=M2
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 90 -50 0 0 {name=M3
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 90 90 0 0 {name=M4
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -130 230 0 0 {name=M5
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 130 230 0 1 {name=M6
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {gnd.sym} 0 420 0 0 {name=l1 lab=GND}
C {gnd.sym} 70 360 3 1 {name=l2 lab=GND}
C {gnd.sym} -40 230 3 1 {name=l3 lab=GND}
C {gnd.sym} 30 230 1 0 {name=l4 lab=GND}
C {gnd.sym} -190 90 1 0 {name=l5 lab=GND}
C {gnd.sym} 180 90 3 1 {name=l6 lab=GND}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -20 360 0 0 {name=M7
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {vdd.sym} -370 340 1 0 {name=l8 lab=VDD}
C {vdd.sym} -200 -50 3 0 {name=l9 lab=VDD}
C {vdd.sym} 190 -50 1 0 {name=l10 lab=VDD}
C {vdd.sym} 0 -200 0 0 {name=l11 lab=VDD}
C {vdd.sym} -290 -60 1 1 {name=l12 lab=VDD}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 370 -60 0 1 {name=M9
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {vdd.sym} 290 -60 3 0 {name=l13 lab=VDD}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -370 -60 0 0 {name=M10
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -500 80 0 0 {name=M8
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {vdd.sym} -390 80 1 1 {name=l14 lab=VDD}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 500 80 0 1 {name=M11
W=10
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {vdd.sym} 390 80 3 0 {name=l15 lab=VDD}
C {lab_pin.sym} -540 80 0 0 {name=p2 sig_type=std_logic lab=clk}
C {lab_pin.sym} -420 -60 0 0 {name=p3 sig_type=std_logic lab=clk}
C {lab_pin.sym} 410 -60 0 1 {name=p4 sig_type=std_logic lab=clk}
C {lab_pin.sym} 540 80 0 1 {name=p5 sig_type=std_logic lab=clk}
C {lab_pin.sym} -80 360 0 0 {name=p6 sig_type=std_logic lab=clk}
C {lab_pin.sym} -110 160 2 0 {name=p7 sig_type=std_logic lab=p}
C {lab_pin.sym} 110 160 2 1 {name=p8 sig_type=std_logic lab=q}
C {lab_pin.sym} -110 30 2 0 {name=p9 sig_type=std_logic lab=x}
C {ipin.sym} -220 230 0 0 {name=p1 lab=Vinp}
C {ipin.sym} 220 230 0 1 {name=p11 lab=Vinn}
C {ipin.sym} -400 380 0 0 {name=p12 lab=clk}
C {lab_pin.sym} -360 380 0 1 {name=p13 sig_type=std_logic lab=clk}
C {iopin.sym} -390 340 0 1 {name=p14 lab=VDD}
C {opin.sym} 180 30 0 0 {name=p15 lab=out}
