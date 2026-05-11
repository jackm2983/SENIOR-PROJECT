v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -10 -20 -10 20 {
lab=#net1}
N -110 -50 -50 -50 {
lab=A}
N -110 -50 -110 50 {
lab=A}
N -110 50 -50 50 {
lab=A}
N -10 -0 90 -0 {
lab=#net1}
N -10 -50 30 -50 {
lab=VP}
N 30 -100 30 -50 {
lab=VP}
N -10 -100 30 -100 {
lab=VP}
N -10 -100 -10 -80 {
lab=VP}
N -10 -130 -10 -100 {
lab=VP}
N -10 80 -10 100 {
lab=VN}
N -10 50 10 50 {
lab=VN}
N 10 50 10 90 {
lab=VN}
N -10 90 10 90 {
lab=VN}
N -10 100 -10 110 {
lab=VN}
N -130 -0 -110 -0 {
lab=A}
N 210 -20 210 20 {
lab=Y}
N 110 -50 170 -50 {
lab=#net1}
N 110 -50 110 50 {
lab=#net1}
N 110 50 170 50 {
lab=#net1}
N 210 0 310 0 {
lab=Y}
N 210 -50 250 -50 {
lab=VP}
N 250 -100 250 -50 {
lab=VP}
N 210 -100 250 -100 {
lab=VP}
N 210 -100 210 -80 {
lab=VP}
N 210 80 210 100 {
lab=VN}
N 210 50 230 50 {
lab=VN}
N 230 50 230 90 {
lab=VN}
N 210 90 230 90 {
lab=VN}
N 90 0 110 0 {
lab=#net1}
N -10 100 210 100 {
lab=VN}
N 210 -110 210 -100 {
lab=VP}
N -10 -110 210 -110 {
lab=VP}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -30 -50 0 0 {name=M1
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -30 50 0 0 {name=M2
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
C {iopin.sym} -10 110 0 0 {name=p2 lab=VN
}
C {iopin.sym} -10 -130 0 0 {name=p3 lab=VP

}
C {ipin.sym} -130 0 0 0 {name=p4 lab=A}
C {opin.sym} 310 0 0 0 {name=p1 lab=Y
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 190 -50 0 0 {name=M3
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 190 50 0 0 {name=M4
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
