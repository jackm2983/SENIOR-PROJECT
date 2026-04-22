v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 0 -0 0 60 {
lab=#net1}
N 0 60 0 70 {
lab=#net1}
N 0 -10 0 0 {
lab=#net1}
N -0 150 0 170 {
lab=S}
N -0 140 0 150 {
lab=S}
N -120 30 -0 30 {
lab=#net1}
N 0 -120 0 -90 {
lab=S}
N 0 -90 -0 -80 {
lab=S}
N -100 -120 -0 -120 {
lab=S}
N -100 -120 -100 170 {
lab=S}
N -100 170 0 170 {
lab=S}
N -120 170 -100 170 {
lab=S}
N -120 100 -60 100 {
lab=A}
N -60 100 -50 100 {
lab=A}
N -120 -50 -60 -50 {
lab=B}
N -60 -50 -50 -50 {
lab=B}
N 60 -50 80 -50 {
lab=Y}
N 80 -50 80 100 {
lab=Y}
N 60 100 80 100 {
lab=Y}
N 50 100 60 100 {
lab=Y}
N 50 -50 60 -50 {
lab=Y}
N 80 30 130 30 {
lab=Y}
N -70 50 -30 50 {
lab=VP}
N -70 -100 -70 50 {
lab=VP}
N -70 -100 -30 -100 {
lab=VP}
N -30 -150 -30 -100 {
lab=VP}
N -90 0 -30 -0 {
lab=VN}
N -90 0 -90 150 {
lab=VN}
N -90 150 -30 150 {
lab=VN}
N -30 150 -30 200 {
lab=VN}
N -380 180 -280 180 {
lab=S}
N -280 150 -280 180 {
lab=S}
N -280 180 -130 180 {
lab=S}
N -130 170 -130 180 {
lab=S}
N -130 170 -120 170 {
lab=S}
N -280 40 -280 70 {
lab=#net1}
N -280 30 -280 40 {
lab=#net1}
N -280 30 -120 30 {
lab=#net1}
N -240 110 -210 110 {
lab=VN}
N -210 110 -210 230 {
lab=VN}
N -210 230 -80 230 {
lab=VN}
N -80 190 -80 230 {
lab=VN}
N -80 190 -30 190 {
lab=VN}
N -350 110 -320 110 {
lab=VP}
N -350 -140 -350 110 {
lab=VP}
N -350 -140 -30 -140 {
lab=VP}
N -250 110 -240 110 {
lab=VN}
N -320 110 -310 110 {
lab=VP}
C {TGATE.sym} 0 0 0 0 {name=x1}
C {TGATE.sym} 0 150 0 0 {name=x2}
C {ipin.sym} -120 100 0 0 {name=p1 lab=A}
C {ipin.sym} -120 -50 0 0 {name=p3 lab=B}
C {ipin.sym} -380 180 0 0 {name=p4 lab=S}
C {opin.sym} 130 30 0 0 {name=p5 lab=Y}
C {ipin.sym} -30 200 3 0 {name=p6 lab=VN}
C {ipin.sym} -30 -150 1 0 {name=p7 lab=VP}
C {inverter.sym} -280 130 3 0 {name=x3}
