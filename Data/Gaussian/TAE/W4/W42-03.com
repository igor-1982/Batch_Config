%nproc=8
%chk=W42-03.chk
#p b3lyp/6-311+G(d,p) opt freq

BeF2

0 1
Be
F 1 R
X 1 ONE 2 PI2
F 1 R 3 PI2 2 PI

R=1.37958968
PI2=90.0
PI=180.0
ONE=1.0
 
