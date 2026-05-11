v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -110 -170 -110 20 {
lab=#net1}
N -110 -270 -110 -230 {
lab=VP_5v}
N -110 -270 140 -270 {
lab=VP_5v}
N 140 -270 140 -100 {
lab=VP_5v}
N 140 -40 140 20 {
lab=OUT_5v}
N 140 80 140 130 {
lab=GND}
N -110 130 140 130 {
lab=GND}
N -110 80 -110 130 {
lab=GND}
N -110 50 -70 50 {
lab=GND}
N -70 50 -70 130 {
lab=GND}
N 90 50 120 50 {
lab=GND}
N 90 50 90 130 {
lab=GND}
N 20 130 20 160 {
lab=GND}
N 140 -70 180 -70 {
lab=VP_5v}
N 180 -130 180 -70 {
lab=VP_5v}
N 140 -130 180 -130 {
lab=VP_5v}
N -90 -200 -70 -200 {
lab=GND}
N -110 -70 100 -70 {
lab=#net1}
N -70 -200 -70 50 {
lab=GND}
N 10 -300 10 -270 {
lab=VP_5v}
N -200 50 -150 50 {
lab=IN_1v8}
N 140 -10 290 -10 {
lab=OUT_5v}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} -110 -200 0 1 {name=R1
L=8.4
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_0p35.sym} 140 50 0 0 {name=R2
L=8.4
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {ipin.sym} -200 50 0 0 {name=p1 lab=IN_1v8}
C {ipin.sym} 10 -300 0 0 {name=p2 lab=VP_5v}
C {ipin.sym} 20 160 0 0 {name=p3 lab=GND}
C {opin.sym} 290 -10 0 0 {name=p4 lab=OUT_5v}
C {sky130_fd_pr/nfet_01v8.sym} -130 50 0 0 {name=M1
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 120 -70 0 0 {name=M2
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
model=pfet_g5v0d10v5
spiceprefix=X
}
