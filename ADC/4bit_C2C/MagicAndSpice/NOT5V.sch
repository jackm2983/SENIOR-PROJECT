v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -10 -30 -10 0 {
lab=Y}
N -10 -10 90 -10 {
lab=Y}
N -100 -60 -50 -60 {
lab=X}
N -100 -60 -100 30 {
lab=X}
N -100 30 -50 30 {
lab=X}
N -130 -20 -100 -20 {
lab=X}
N -10 -110 -10 -90 {
lab=VDD}
N -10 60 -10 100 {
lab=VSS}
N -10 30 20 30 {}
N 20 30 20 70 {}
N -10 70 20 70 {}
N -10 -60 10 -60 {}
N 10 -100 10 -60 {}
N -10 -100 10 -100 {}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -30 30 0 0 {name=M1
W=1
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -30 -60 0 0 {name=M2
W=2
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
C {ipin.sym} -130 -20 0 0 {name=p1 lab=X}
C {opin.sym} 90 -10 0 0 {name=p3 lab=Y}
C {iopin.sym} -10 100 0 0 {name=p4 lab=VSS}
C {iopin.sym} -10 -110 0 0 {name=p5 lab=VDD}
