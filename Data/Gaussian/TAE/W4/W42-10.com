%nproc=8
%chk=W42-10.chk
#p b3lyp/6-311+G(d,p) opt freq

CO2

0 1
C
O 1 RCO
X 1 ONE 2 PI2
O 1 RCO 3 PI2 2 PI

RCO=1.1626
PI2=90.0
PI=180.0
ONE=1.0
 
