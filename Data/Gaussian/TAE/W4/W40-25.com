%nproc=8
%chk=W40-25.chk
#p b3lyp/6-311+G(d,p) opt freq

S4 C2v

0 1
S
S 1 rsh
S 2 rlo 1 th
S 3 rsh 2 th 1 zero

rsh=1.90634338
rlo=2.13701674
th=104.70263744
zero=0.0

