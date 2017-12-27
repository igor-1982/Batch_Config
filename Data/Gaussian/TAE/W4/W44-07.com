%nproc=8
%chk=W44-07.chk
#p b3lyp/6-311+G(d,p) opt freq

CH3

0 2
C
H 1 R
H 1 R 2 TH
H 1 R 2 TH 3 PI

R=1.0777
TH=120.0
PI=180.0
 
