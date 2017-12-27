%nproc=8
%chk=W40-04.chk
#p b3lyp/6-311+G(d,p) opt freq

C2H6

0 1
C
C 1 r1
H 1 r2 2 a1
H 1 r2 2 a1 3 th1
H 1 r2 2 a1 3 th2
H 2 r2 1 a1 3 pi
H 2 r2 1 a1 6 th1
H 2 r2 1 a1 6 th2

r1=1.52651649
r2=1.09079789
a1=111.20705966
th1=120.0
th2=-120.0
pi=180.0

