v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -50 -170 -50 20 {
lab=#net1}
N -50 -270 -50 -230 {
lab=VP_1v8}
N -50 -270 200 -270 {
lab=VP_1v8}
N 200 -270 200 -100 {
lab=VP_1v8}
N 200 -40 200 20 {
lab=OUT_1v8}
N 200 80 200 130 {
lab=GND}
N -50 130 200 130 {
lab=GND}
N -50 80 -50 130 {
lab=GND}
N -50 50 -10 50 {
lab=GND}
N -10 50 -10 130 {
lab=GND}
N 150 50 180 50 {
lab=GND}
N 150 50 150 130 {
lab=GND}
N 80 130 80 160 {
lab=GND}
N 200 -70 240 -70 {
lab=VP_1v8}
N 240 -130 240 -70 {
lab=VP_1v8}
N 200 -130 240 -130 {
lab=VP_1v8}
N -30 -200 -10 -200 {
lab=GND}
N -50 -70 160 -70 {
lab=#net1}
N -10 -200 -10 50 {
lab=GND}
N 70 -300 70 -270 {
lab=VP_1v8}
N -140 50 -90 50 {
lab=IN_5v}
N 200 -10 350 -10 {
lab=OUT_1v8}
C {sky130_fd_pr/pfet_01v8.sym} 180 -70 0 0 {name=M1
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -70 50 0 0 {name=M2
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
C {sky130_fd_pr/res_xhigh_po_0p35.sym} -50 -200 0 1 {name=R1
L=8.4
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} 200 50 0 0 {name=R2
L=8.4
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {ipin.sym} -140 50 0 0 {name=p1 lab=IN_5v}
C {ipin.sym} 70 -300 0 0 {name=p2 lab=VP_1v8}
C {ipin.sym} 80 160 0 0 {name=p3 lab=GND}
C {opin.sym} 350 -10 0 0 {name=p4 lab=OUT_1v8}
