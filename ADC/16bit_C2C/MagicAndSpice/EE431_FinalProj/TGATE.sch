v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 250 -10 250 80 {
lab=Y}
N 250 -100 250 -70 {
lab=A}
N 370 -40 420 -40 {
lab=EN_N}
N 90 -40 140 -40 {
lab=EN}
N 180 -70 330 -70 {
lab=A}
N 180 -10 330 -10 {
lab=Y}
N 310 -40 330 -40 {
lab=VP}
N 310 -40 310 20 {
lab=VP}
N 180 -40 210 -40 {
lab=VN}
N 210 -40 210 20 {
lab=VN}
C {iopin.sym} 250 -100 3 0 {name=p1 lab=A
}
C {iopin.sym} 250 80 1 0 {name=p2 lab=Y
}
C {ipin.sym} 90 -40 0 0 {name=p5 lab=EN
}
C {ipin.sym} 420 -40 2 0 {name=p6 lab=EN_N
}
C {sky130_fd_pr/nfet_01v8.sym} 160 -40 0 0 {name=M5
W=3
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
C {sky130_fd_pr/pfet_01v8.sym} 350 -40 2 0 {name=M6
W=3
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
C {ipin.sym} 310 20 3 0 {name=p3 lab=VP}
C {ipin.sym} 210 20 3 0 {name=p4 lab=VN}
