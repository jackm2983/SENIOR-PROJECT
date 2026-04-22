v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Skewed inverter to convert from 1.8V logic to 5V logic} 130 -120 0 0 0.4 0.4 {}
N 20 -150 20 -80 {
lab=VP}
N 20 -50 40 -50 {
lab=VP}
N 40 -80 40 -50 {
lab=VP}
N 20 -80 40 -80 {
lab=VP}
N 20 -20 20 30 {
lab=Y}
N 20 0 110 0 {
lab=Y}
N -70 0 -40 0 {
lab=A}
N -40 -50 -20 -50 {
lab=A}
N -40 -50 -40 0 {
lab=A}
N -40 0 -40 60 {
lab=A}
N -40 60 -20 60 {
lab=A}
N 20 90 20 150 {
lab=VN}
N 20 60 40 60 {
lab=VN}
N 40 60 40 90 {
lab=VN}
N 20 90 40 90 {
lab=VN}
C {ipin.sym} -70 0 0 0 {name=p1 lab=A
}
C {opin.sym} 110 0 0 0 {name=p2 lab=Y
}
C {iopin.sym} 20 -150 0 0 {name=p3 lab=VP
}
C {iopin.sym} 20 150 0 0 {name=p4 lab=VN
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 0 60 0 0 {name=M6
W=1000
L=1
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 0 -50 0 0 {name=M11
W=100
L=1
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
