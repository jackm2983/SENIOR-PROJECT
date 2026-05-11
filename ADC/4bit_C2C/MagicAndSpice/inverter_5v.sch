v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {} 180 -30 0 0 0.4 0.4 {}
N 70 -60 70 10 {
lab=VP}
N 70 40 90 40 {
lab=VP}
N 90 10 90 40 {
lab=VP}
N 70 10 90 10 {
lab=VP}
N 70 70 70 120 {
lab=Y}
N 70 90 160 90 {
lab=Y}
N -20 90 10 90 {
lab=A}
N 10 40 30 40 {
lab=A}
N 10 40 10 90 {
lab=A}
N 10 90 10 150 {
lab=A}
N 10 150 30 150 {
lab=A}
N 70 180 70 240 {
lab=VN}
N 70 150 90 150 {
lab=VN}
N 90 150 90 180 {
lab=VN}
N 70 180 90 180 {
lab=VN}
C {ipin.sym} -20 90 0 0 {name=p1 lab=A
}
C {opin.sym} 160 90 0 0 {name=p2 lab=Y
}
C {iopin.sym} 70 -60 0 0 {name=p3 lab=VP
}
C {iopin.sym} 70 240 0 0 {name=p4 lab=VN
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 50 150 0 0 {name=M6
W=5
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 50 40 0 0 {name=M11
W=10
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
