%nproc=8
%chk=W44-09.chk
#p b3lyp/6-311+G(d,p) opt freq

C2H

0 2
C
C 1 Rcc
X 2 ONE 1 PI2
H 2 Rch 3 PI2 1 PI

Rcc=1.21131544
Rch=1.06452797
PI=180.0
PI2=90.0
ONE=1.0 

