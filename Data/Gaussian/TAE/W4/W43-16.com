%nproc=8
%chk=W43-16.chk
#p b3lyp/6-311+G(d,p) opt freq

SiH4

0 1
H
Si 1 R
H 2 R 1 TH
H 2 R 1 TH 3 PI3
H 2 R 1 TH 4 PI3

R=1.47862837
TH=109.4712206344907
PI3=120.0
 
