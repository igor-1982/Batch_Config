%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -5.58813813E+01, ZPE = 0.018987, TE = 0.022767

0        2
N      0.00000000        0.00000000        0.14833216
H      0.00000000        0.80095854       -0.50123158
H      0.00000000       -0.80095854       -0.50123158

