v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 50 100 50 140 {
lab=#net1}
N 50 10 50 40 {
lab=Y}
N 50 -20 50 -10 {
lab=Y}
N 50 -10 50 10 {
lab=Y}
N 50 10 70 10 {
lab=Y}
N -10 -50 10 -50 {
lab=A}
N -10 -50 -10 70 {
lab=A}
N -10 70 10 70 {
lab=A}
N -160 70 -10 70 {
lab=A}
N -130 -50 -120 -50 {
lab=B}
N -130 -50 -130 170 {
lab=B}
N -130 170 10 170 {
lab=B}
N -160 170 -130 170 {
lab=B}
N 50 200 50 220 {
lab=GND}
N 50 170 120 170 {
lab=GND}
N 120 170 120 220 {
lab=GND}
N 50 220 120 220 {
lab=GND}
N 50 70 120 70 {
lab=GND}
N 120 70 120 170 {
lab=GND}
N 50 -50 120 -50 {
lab=VDD}
N 120 -100 120 -50 {
lab=VDD}
N -80 -100 120 -100 {
lab=VDD}
N -80 -100 -80 -80 {
lab=VDD}
N -50 -100 -50 -50 {
lab=VDD}
N 50 -100 50 -80 {
lab=VDD}
N -0 -120 -0 -100 {
lab=VDD}
N -170 70 -160 70 {
lab=A}
N -170 170 -160 170 {
lab=B}
N 120 220 130 220 {
lab=GND}
N 0 -130 0 -120 {
lab=VDD}
N 70 10 80 10 {
lab=Y}
N -80 -20 -50 -20 {
lab=VDD}
N -80 -50 -50 -50 {
lab=VDD}
N -50 -20 50 -20 {}
C {sky130_fd_pr/pfet_01v8.sym} -100 -50 0 0 {name=M1
W=2
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 30 -50 0 0 {name=M2
W=2
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 30 70 0 0 {name=M3
W=2
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 30 170 0 0 {name=M4
W=2
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {ipin.sym} -160 70 0 0 {name=p1 lab=A
}
C {ipin.sym} -160 170 0 0 {name=p2 lab=B}
C {ipin.sym} 0 -120 1 0 {name=p3 lab=VDD

}
C {ipin.sym} 120 220 2 0 {name=p4 lab=GND

}
C {opin.sym} 80 10 0 0 {name=p5 lab=Y
}
C {lab_pin.sym} -90 70 1 0 {name=p6 sig_type=std_logic lab=A}
C {lab_pin.sym} -50 170 1 0 {name=p7 sig_type=std_logic lab=B}
