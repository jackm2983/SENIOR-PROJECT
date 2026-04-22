v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 30 -100 30 -90 {
lab=#net1}
N 30 120 30 140 {
lab=VN}
N 100 90 100 140 {
lab=VN}
N 30 140 100 140 {
lab=VN}
N 30 -130 100 -130 {
lab=VP}
N 100 -180 100 -130 {
lab=VP}
N 30 -180 30 -160 {
lab=VP}
N -20 -200 -20 -180 {
lab=VP}
N 100 140 110 140 {
lab=VN}
N -20 -210 -20 -200 {
lab=VP}
N 30 90 100 90 {
lab=VN}
N -110 90 -80 90 {
lab=VN}
N -80 90 -80 140 {
lab=VN}
N -80 140 30 140 {
lab=VN}
N -110 120 -110 140 {
lab=VN}
N -110 140 -80 140 {
lab=VN}
N -110 30 -110 60 {
lab=Y}
N -110 30 30 30 {
lab=Y}
N 30 30 30 60 {
lab=Y}
N 30 -20 30 30 {
lab=Y}
N 30 10 70 10 {
lab=Y}
N 30 -50 100 -50 {
lab=VP}
N 100 -130 100 -50 {
lab=VP}
N 30 -180 100 -180 {
lab=VP}
N -20 -180 30 -180 {
lab=VP}
N -20 -50 -10 -50 {
lab=A}
N -20 -50 -20 90 {
lab=A}
N -20 90 -10 90 {
lab=A}
N -160 90 -150 90 {
lab=#net2}
N -160 -130 -160 90 {
lab=#net2}
N -160 -130 -10 -130 {
lab=#net2}
N -200 -130 -160 -130 {
lab=#net2}
N -200 -50 -20 -50 {
lab=A}
N 30 -90 30 -80 {
lab=#net1}
C {sky130_fd_pr/pfet_01v8.sym} 10 -50 0 0 {name=M1
W=4
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
C {sky130_fd_pr/pfet_01v8.sym} 10 -130 0 0 {name=M2
W=4
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
C {sky130_fd_pr/nfet_01v8.sym} -130 90 0 0 {name=M3
W=1
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
C {sky130_fd_pr/nfet_01v8.sym} 10 90 0 0 {name=M4
W=1
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
C {ipin.sym} -200 -50 0 0 {name=p1 lab=A
}
C {ipin.sym} -200 -130 0 0 {name=p2 lab=B}
C {ipin.sym} -20 -200 1 0 {name=p3 lab=VP

}
C {ipin.sym} 100 140 2 0 {name=p4 lab=VN

}
C {opin.sym} 70 10 0 0 {name=p5 lab=Y
}
