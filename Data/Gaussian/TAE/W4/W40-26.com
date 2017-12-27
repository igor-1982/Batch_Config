%nproc=8
%chk=W40-26.chk
#p b3lyp/6-311+G(d,p) opt freq

BeCl2

0 1
Be
Cl 1 R
X  1 R 2 PI2
Cl 1 R 3 PI2 2 PI

R=1.79984001
PI2=90.0
PI=180.0

