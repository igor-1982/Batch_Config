%nproc=8
%chk=W42-09.chk
#p b3lyp/6-311+G(d,p) opt freq

H2CO

0 1
O
C 1 RCO
H 2 RCH 1 TH
H 2 RCH 1 TH 3 PI

RCO=1.2066
RCH=1.1022
TH=121.78
PI=180.0 

