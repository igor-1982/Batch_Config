%nproc=8
%chk=W42-07.chk
#p b3lyp/6-311+G(d,p) opt freq

CH2NH CCSD(T)/cc-pVQZ [from: J. Comput. Chem., 22, 1297, 2001]

0 1
C
N 1 R1
H 2 R2 1 A1
H 1 R3 2 A2 3 D1
H 1 R4 2 A3 3 D2

R1=1.27416
R2=1.02000
R3=1.09148
R4=1.08728
A1=109.934
A2=124.418
A3=118.672
D1=0.00000
D2=180.000 

