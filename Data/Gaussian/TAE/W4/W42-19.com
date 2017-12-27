%nproc=8
%chk=W42-19.chk
#p b3lyp/6-311+G(d,p) opt freq

S2H

0 2
S
H 1 R1
S 1 R2 2 A1

R1=1.35030200
R2=1.97638590
A1=101.28132311

