%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -4.05236860E+01, ZPE = 0.044765, TE = 0.048578

0        1
C      0.00000000        0.00000000        0.00000000
H      0.63039291        0.63039291        0.63039291
H     -0.63039291       -0.63039291        0.63039291
H      0.63039291       -0.63039291       -0.63039291
H     -0.63039291        0.63039291       -0.63039291

