v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 0 160 40 160 {
lab=out}
N 40 -70 40 160 {
lab=out}
N -0 -70 40 -70 {
lab=out}
N -120 -70 -60 -70 {
lab=in}
N -120 -70 -120 160 {
lab=in}
N -120 160 -60 160 {
lab=in}
N 40 0 140 0 {
lab=out}
N -180 -0 -120 0 {
lab=in}
N -30 100 -30 160 {
lab=Vdd}
N -30 -70 -30 -50 {
lab=GND}
N -30 200 -30 220 {
lab=cbar}
N -220 120 -190 120 {
lab=Vdd}
N -240 140 -210 140 {
lab=Vss}
N -30 -160 -30 -110 {
lab=c}
N -210 140 -190 140 {
lab=Vss}
N -30 -50 -30 -0 {
lab=GND}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -30 -90 3 1 {name=M1
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
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -30 180 3 0 {name=M2
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
C {lab_pin.sym} -30 100 1 0 {name=p2 sig_type=std_logic lab=Vdd
}
C {ipin.sym} -180 0 0 0 {name=p3 lab=in}
C {ipin.sym} -30 220 3 0 {name=p5 lab=cbar}
C {ipin.sym} -30 -160 1 0 {name=p6 lab=c}
C {lab_pin.sym} -220 120 0 0 {name=p7 sig_type=std_logic lab=Vdd
}
C {iopin.sym} -190 120 0 0 {name=p8 lab=Vdd}
C {iopin.sym} -190 140 0 0 {name=p9 lab=Vss}
C {lab_pin.sym} -240 140 0 0 {name=p10 sig_type=std_logic lab=Vss
}
C {gnd.sym} -30 0 0 0 {name=l4 lab=GND}
C {iopin.sym} 140 0 0 0 {name=p1 lab=out}
