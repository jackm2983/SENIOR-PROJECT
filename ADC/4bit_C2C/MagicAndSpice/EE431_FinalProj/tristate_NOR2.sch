v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 40 -90 40 -80 {
lab=#net1}
N 40 350 40 370 {
lab=VN}
N 110 320 110 370 {
lab=VN}
N 40 370 110 370 {
lab=VN}
N 40 -120 110 -120 {
lab=VP}
N 110 -170 110 -120 {
lab=VP}
N 40 -170 40 -150 {
lab=VP}
N -10 -190 -10 -170 {
lab=VP}
N 110 370 120 370 {
lab=VN}
N -10 -200 -10 -190 {
lab=VP}
N 40 320 110 320 {
lab=VN}
N -100 320 -70 320 {
lab=VN}
N -70 320 -70 370 {
lab=VN}
N -70 370 40 370 {
lab=VN}
N -100 350 -100 370 {
lab=VN}
N -100 370 -70 370 {
lab=VN}
N -100 260 -100 290 {
lab=#net2}
N -100 260 40 260 {
lab=#net2}
N 40 260 40 290 {
lab=#net2}
N 40 -40 110 -40 {
lab=VP}
N 110 -120 110 -40 {
lab=VP}
N 40 -170 110 -170 {
lab=VP}
N -10 -170 40 -170 {
lab=VP}
N -10 -40 0 -40 {
lab=B}
N -10 -40 -10 320 {
lab=B}
N -10 320 0 320 {
lab=B}
N -150 320 -140 320 {
lab=A}
N -150 -120 -150 320 {
lab=A}
N -150 -120 0 -120 {
lab=A}
N -190 -120 -150 -120 {
lab=A}
N -190 -40 -10 -40 {
lab=B}
N 40 -80 40 -70 {
lab=#net1}
N -190 170 0 170 {
lab=EN}
N -190 60 0 60 {
lab=EN_N}
N 40 90 40 140 {
lab=Y}
N 40 -10 40 30 {
lab=#net3}
N 40 60 110 60 {
lab=VP}
N 110 -40 110 60 {
lab=VP}
N 40 200 40 260 {
lab=#net2}
N 40 130 170 130 {
lab=Y}
N 40 170 110 170 {
lab=VN}
N 110 170 110 320 {
lab=VN}
C {sky130_fd_pr/pfet_01v8.sym} 20 -40 0 0 {name=M1
W=6
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
C {sky130_fd_pr/pfet_01v8.sym} 20 -120 0 0 {name=M2
W=6
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
C {sky130_fd_pr/nfet_01v8.sym} -120 320 0 0 {name=M3
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
C {sky130_fd_pr/nfet_01v8.sym} 20 320 0 0 {name=M4
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
C {ipin.sym} -190 -120 0 0 {name=p1 lab=A
}
C {ipin.sym} -190 -40 0 0 {name=p2 lab=B}
C {ipin.sym} -10 -200 1 0 {name=p3 lab=VP

}
C {ipin.sym} 120 370 2 0 {name=p4 lab=VN

}
C {opin.sym} 170 130 0 0 {name=p5 lab=Y
}
C {sky130_fd_pr/pfet_01v8.sym} 20 60 0 0 {name=M5
W=6
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
C {sky130_fd_pr/nfet_01v8.sym} 20 170 0 0 {name=M6
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
C {ipin.sym} -190 60 0 0 {name=p6 lab=EN_N}
C {ipin.sym} -190 170 0 0 {name=p7 lab=EN}
