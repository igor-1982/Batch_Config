%nproc=8
%chk=W40-03.chk
#p b3lyp/6-311+G(d,p) opt freq

BF3

0 1
B
F 1 R
F 1 R 2 OTW
F 1 R 2 OTW 3 PI

R=1.3103
OTW=120.0
PI=180.0 

