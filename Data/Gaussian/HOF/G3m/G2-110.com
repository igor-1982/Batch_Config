%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.52614324E+02, ZPE = 0.031695, TE = 0.03615

0        1
C      0.00000000        0.00000000       -1.20700089
C      0.00000000        0.00000000        0.10136197
H     -0.00000000        0.93842230       -1.74248256
H     -0.00000000       -0.93842230       -1.74248256
O     -0.00000000        0.00000000        1.26479303

