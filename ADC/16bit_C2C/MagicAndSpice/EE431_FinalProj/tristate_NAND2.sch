v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 30 50 30 90 {
lab=#net1}
N -100 -260 -100 -250 {
lab=#net2}
N -100 -250 30 -250 {
lab=#net2}
N 30 -260 30 -250 {
lab=#net2}
N 30 -250 30 -230 {
lab=#net2}
N -30 -290 -10 -290 {
lab=A}
N -30 -290 -30 20 {
lab=A}
N -30 20 -10 20 {
lab=A}
N -180 20 -30 20 {
lab=A}
N -150 -290 -140 -290 {
lab=B}
N -150 -290 -150 120 {
lab=B}
N -150 120 -10 120 {
lab=B}
N -180 120 -150 120 {
lab=B}
N 30 150 30 170 {
lab=GND}
N 30 120 100 120 {
lab=GND}
N 100 120 100 170 {
lab=GND}
N 30 170 100 170 {
lab=GND}
N 30 20 100 20 {
lab=GND}
N 100 20 100 120 {
lab=GND}
N 30 -290 100 -290 {
lab=VDD}
N 100 -340 100 -290 {
lab=VDD}
N -100 -340 100 -340 {
lab=VDD}
N -100 -340 -100 -320 {
lab=VDD}
N -100 -290 -70 -290 {
lab=VDD}
N -70 -340 -70 -290 {
lab=VDD}
N 30 -340 30 -320 {
lab=VDD}
N -20 -360 -20 -340 {
lab=VDD}
N -190 20 -180 20 {
lab=A}
N -190 120 -180 120 {
lab=B}
N 100 170 110 170 {
lab=GND}
N -20 -370 -20 -360 {
lab=VDD}
N 160 -120 170 -120 {
lab=Y}
N -180 -70 -10 -70 {
lab=EN}
N -180 -180 -10 -180 {
lab=EN_N}
N 30 -230 30 -210 {
lab=#net2}
N 30 -150 30 -100 {
lab=Y}
N 30 -40 30 -10 {
lab=#net3}
N 30 -70 100 -70 {
lab=GND}
N 100 -70 100 20 {
lab=GND}
N 30 -120 160 -120 {
lab=Y}
N 30 -180 100 -180 {
lab=VDD}
N 100 -290 100 -180 {
lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} -120 -290 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} 10 -290 0 0 {name=M2
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
C {sky130_fd_pr/nfet_01v8.sym} 10 20 0 0 {name=M3
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
C {sky130_fd_pr/nfet_01v8.sym} 10 120 0 0 {name=M4
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
C {ipin.sym} -180 20 0 0 {name=p1 lab=A
}
C {ipin.sym} -180 120 0 0 {name=p2 lab=B}
C {ipin.sym} -20 -360 1 0 {name=p3 lab=VDD

}
C {ipin.sym} 100 170 2 0 {name=p4 lab=GND

}
C {opin.sym} 160 -120 0 0 {name=p5 lab=Y
}
C {sky130_fd_pr/pfet_01v8.sym} 10 -180 0 0 {name=M5
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
C {sky130_fd_pr/nfet_01v8.sym} 10 -70 0 0 {name=M6
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
C {ipin.sym} -180 -70 0 0 {name=p6 lab=EN
}
C {ipin.sym} -180 -180 0 0 {name=p7 lab=EN_N
}
C {lab_pin.sym} -290 -350 0 0 { name=p8 verilog_type=wire lab=Y }
C {lab_pin.sym} -290 -330 0 0 { name=p9 verilog_type=wire lab=VDD }
C {lab_pin.sym} -290 -310 0 0 { name=p10 verilog_type=wire lab=GND }
C {lab_pin.sym} -290 -290 0 0 { name=p11 verilog_type=wire lab=EN_N }
C {lab_pin.sym} -290 -270 0 0 { name=p12 verilog_type=wire lab=EN }
C {lab_pin.sym} -290 -250 0 0 { name=p13 verilog_type=wire lab=B }
C {lab_pin.sym} -290 -230 0 0 { name=p14 verilog_type=wire lab=A }
C {lab_pin.sym} -290 -210 0 0 { name=p15 verilog_type=wire lab=#net3 }
C {lab_pin.sym} -290 -190 0 0 { name=p16 verilog_type=wire lab=#net2 }
C {lab_pin.sym} -290 -170 0 0 { name=p17 verilog_type=wire lab=#net1 }
