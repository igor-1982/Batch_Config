%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.50332301E+02, ZPE = 0.003794, TE = 0.007101

0        3
O      0.00000000        0.00000000        0.60312340
O      0.00000000        0.00000000       -0.60312340

