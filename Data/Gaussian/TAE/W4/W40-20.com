%nproc=8
%chk=W40-20.chk
#p b3lyp/6-311+G(d,p) opt freq

SO3

0 1
X
S 1 1.0
O 2 RSO 1 Pi2
O 2 RSO 1 Pi2 3  120.0
O 2 RSO 1 Pi2 3 -120.0 

RSO=1.42279
Pi2=90.0

