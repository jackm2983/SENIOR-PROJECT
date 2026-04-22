v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 0 -290 0 -220 {
lab=VP}
N 0 -190 20 -190 {
lab=VP}
N 20 -220 20 -190 {
lab=VP}
N 0 -220 20 -220 {
lab=VP}
N 0 -10 90 -10 {
lab=Y}
N -90 -10 -60 -10 {
lab=A}
N -60 -190 -40 -190 {
lab=A}
N -60 -190 -60 -10 {
lab=A}
N -60 -10 -60 160 {
lab=A}
N -60 160 -40 160 {
lab=A}
N 0 190 0 250 {
lab=VN}
N 0 160 20 160 {
lab=VN}
N 20 160 20 190 {
lab=VN}
N 0 190 20 190 {
lab=VN}
N -90 -80 -40 -80 {
lab=EN_N}
N -90 60 -40 60 {
lab=EN}
N 0 -50 -0 -10 {
lab=Y}
N -0 -10 0 30 {
lab=Y}
N 0 90 0 130 {
lab=#net1}
N 0 -160 0 -110 {
lab=#net2}
N -0 -80 20 -80 {
lab=VP}
N 20 -190 20 -80 {
lab=VP}
N 0 60 20 60 {
lab=VN}
N 20 60 20 160 {
lab=VN}
C {sky130_fd_pr/pfet_01v8.sym} -20 -190 0 0 {name=M1
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
C {sky130_fd_pr/nfet_01v8.sym} -20 160 0 0 {name=M2
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
C {ipin.sym} -90 -10 0 0 {name=p1 lab=A
}
C {opin.sym} 90 -10 0 0 {name=p2 lab=Y
}
C {ipin.sym} 0 -290 0 0 {name=p3 lab=VP
}
C {ipin.sym} 0 250 0 0 {name=p4 lab=VN
}
C {sky130_fd_pr/nfet_01v8.sym} -20 60 0 0 {name=M3
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
C {sky130_fd_pr/pfet_01v8.sym} -20 -80 0 0 {name=M4
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
C {ipin.sym} -90 -80 0 0 {name=p5 lab=EN_N
}
C {ipin.sym} -90 60 0 0 {name=p6 lab=EN
}
