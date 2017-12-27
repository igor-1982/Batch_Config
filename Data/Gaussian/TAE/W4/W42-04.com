%nproc=8
%chk=W42-04.chk
#p b3lyp/6-311+G(d,p) opt freq

CH2C

0 1
C
C 1 Rcc
H 2 Rch 1 120.0
H 2 Rch 1 120.0 3 180.0

Rcc=1.30277
Rch=1.08587 

