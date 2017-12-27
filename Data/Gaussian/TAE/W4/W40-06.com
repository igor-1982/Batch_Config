%nproc=8
%chk=W40-06.chk
#p b3lyp/6-311+G(d,p) opt freq

NCCN

0 1
N
C 1 rcn
X 2 1.0 1 90.0
C 2 rcc 3 90.0 1 180.0
X 4 1.0 2 90.0 3 0.0
N 4 rcn 5 90.0 2 180.0

rcn = 1.16127689
rcc = 1.38784354
 
