%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -8.34501824E+02, ZPE = 0.007012, TE = 0.011031

0        1
S      0.00000000        0.00000000        1.55640571
C      0.00000000        0.00000000        0.00000000
S      0.00000000        0.00000000       -1.55640571

