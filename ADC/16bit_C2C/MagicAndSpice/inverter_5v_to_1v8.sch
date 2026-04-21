v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -10 -150 -10 -80 {
lab=1v8}
N -10 -50 10 -50 {
lab=5v}
N -10 -20 -10 30 {
lab=Y}
N -10 0 80 0 {
lab=Y}
N -100 0 -70 0 {
lab=A}
N -70 -50 -50 -50 {
lab=A}
N -70 -50 -70 0 {
lab=A}
N -70 0 -70 60 {
lab=A}
N -70 60 -50 60 {
lab=A}
N -10 90 -10 150 {
lab=VN}
N -10 60 10 60 {
lab=VN}
N 10 60 10 90 {
lab=VN}
N -10 90 10 90 {
lab=VN}
N 10 -50 70 -50 {
lab=5v}
C {ipin.sym} -100 0 0 0 {name=p1 lab=A
}
C {opin.sym} 80 0 0 0 {name=p2 lab=Y
}
C {iopin.sym} -10 -150 0 0 {name=p3 lab=1v8
}
C {iopin.sym} -10 150 0 0 {name=p4 lab=VN
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -30 60 0 0 {name=M6
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -30 -50 0 0 {name=M11
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
C {iopin.sym} 70 -50 0 0 {name=p5 lab=5v
}
