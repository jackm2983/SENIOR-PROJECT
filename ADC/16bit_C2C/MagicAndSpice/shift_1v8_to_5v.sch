v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 20 -20 20 30 {
lab=#net1}
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
N -40 60 -40 120 {
lab=A}
N -40 220 130 220 {
lab=A}
N 430 210 460 210 {
lab=#net2}
N 500 240 500 290 {
lab=VN}
N 500 -40 500 -10 {
lab=VP}
N 20 -110 280 -110 {
lab=VP}
N 20 -110 20 -80 {
lab=VP}
N 20 -150 20 -110 {
lab=VP}
N 60 -50 160 -50 {
lab=Y}
N 20 20 90 20 {
lab=#net1}
N 500 210 530 210 {
lab=VN}
N 530 210 530 250 {
lab=VN}
N 500 250 530 250 {
lab=VN}
N 500 20 520 20 {
lab=VP}
N 520 -30 520 20 {
lab=VP}
N 500 -30 520 -30 {
lab=VP}
N -0 -50 20 -50 {
lab=VP}
N -0 -90 -0 -50 {
lab=VP}
N -0 -90 20 -90 {
lab=VP}
N 210 260 240 260 {
lab=A}
N 280 180 280 230 {
lab=#net2}
N 280 90 280 120 {
lab=V1v8}
N 280 260 310 260 {
lab=VN}
N 310 260 310 300 {
lab=VN}
N 280 300 310 300 {
lab=VN}
N 280 150 300 150 {
lab=V1v8}
N 300 100 300 150 {
lab=V1v8}
N 280 100 300 100 {
lab=V1v8}
N 210 150 240 150 {
lab=A}
N 210 150 210 260 {
lab=A}
N 280 210 340 210 {
lab=#net2}
N 280 290 280 300 {
lab=VN}
N 280 300 280 320 {
lab=VN}
N 280 80 280 90 {
lab=V1v8}
N 500 -110 500 -100 {
lab=VP}
N 280 -110 500 -110 {
lab=VP}
N 20 150 20 320 {
lab=VN}
N 20 320 280 320 {
lab=VN}
N 280 320 280 340 {
lab=VN}
N 280 320 500 320 {
lab=VN}
N 130 220 210 220 {
lab=A}
N 340 210 420 210 {
lab=#net2}
N 420 210 430 210 {
lab=#net2}
N 160 -50 250 -50 {
lab=Y}
N -70 60 -40 60 {
lab=A}
N -40 120 -40 220 {
lab=A}
N 500 290 500 320 {
lab=VN}
N 500 150 540 150 {
lab=Y}
N 90 20 460 20 {
lab=#net1}
N 500 -100 500 -40 {
lab=VP}
N 500 50 500 180 {
lab=Y}
N 410 -50 410 70 {
lab=Y}
N 410 70 500 70 {
lab=Y}
N 250 -50 410 -50 {
lab=Y}
C {ipin.sym} -70 60 0 0 {name=p1 lab=A
}
C {opin.sym} 540 150 0 0 {name=p2 lab=Y
}
C {iopin.sym} 20 -150 0 0 {name=p3 lab=VP
}
C {iopin.sym} 280 340 0 0 {name=p4 lab=VN
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 0 60 0 0 {name=M6
W=30
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 40 -50 0 1 {name=M11
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 480 210 0 0 {name=M1
W=30
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 480 20 0 0 {name=M2
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 260 260 0 0 {name=M3
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 260 150 0 0 {name=M4
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
C {iopin.sym} 280 80 0 0 {name=p5 lab=V1v8
}
