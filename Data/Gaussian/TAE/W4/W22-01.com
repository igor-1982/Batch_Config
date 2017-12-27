%nproc=8
%chk=W22-01.chk
#p b3lyp/6-311+G(d,p) opt freq

SiF4

0 1
F
Si 1 R
F 2 R 1 TH
F 2 R 1 TH 3 PI3
F 2 R 1 TH 4 PI3

R=1.56043
TH=109.4712206344907
PI3=120.0 

