v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -130 190 -90 190 {
lab=r}
N -130 -30 -90 -30 {
lab=s}
N -140 -10 -90 -10 {
lab=nq}
N -140 -10 -140 50 {
lab=nq}
N -140 50 260 110 {
lab=nq}
N 260 110 260 150 {
lab=nq}
N 210 150 260 150 {
lab=nq}
N -140 170 -90 170 {
lab=q}
N -140 110 -140 170 {
lab=q}
N -140 110 240 50 {
lab=q}
N 240 -50 240 50 {
lab=q}
N 210 -50 240 -50 {
lab=q}
N -190 -50 -90 -50 {
lab=VDD}
N -190 150 -90 150 {
lab=VDD}
N -190 -50 -190 150 {
lab=VDD}
N -190 210 -90 210 {
lab=VDD}
N -190 210 -190 270 {
lab=VDD}
N -240 10 -90 10 {
lab=VDD}
N -240 10 -240 210 {
lab=VDD}
N -240 210 -190 210 {
lab=VDD}
N 260 150 270 150 {
lab=nq}
N 240 -50 260 -50 {
lab=q}
C {NAND2_5V.sym} 60 -20 0 0 {name=x1}
C {NAND2_5V.sym} 60 180 0 0 {name=x2}
C {ipin.sym} -130 -30 0 0 {name=p1 lab=s}
C {ipin.sym} -130 190 0 0 {name=p2 lab=r}
C {iopin.sym} -190 -50 2 0 {name=p3 lab=VDD}
C {iopin.sym} -190 270 2 0 {name=p4 lab=GND}
C {opin.sym} 260 -50 0 0 {name=p5 lab=q}
C {opin.sym} 270 150 0 0 {name=p6 lab=nq}
