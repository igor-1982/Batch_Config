%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.16668856E+02, ZPE = 0.055178, TE = 0.059892

0        1
C      0.00000000        0.00000000        0.00000000
C      0.00000000        0.00000000        1.30134055
C      0.00000000        0.00000000       -1.30134055
H     -0.00000000        0.92598405        1.86914433
H     -0.00000000       -0.92598405        1.86914433
H      0.92598405        0.00000000       -1.86914433
H     -0.92598405        0.00000000       -1.86914433

