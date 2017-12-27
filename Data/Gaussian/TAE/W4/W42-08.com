%nproc=8
%chk=W42-08.chk
#p b3lyp/6-311+G(d,p) opt freq

HCO

0 2
O
C 1 Rco
H 2 Roh 1 THE

Rco=1.17848684
Roh=1.11965179
THE=124.45073591 

