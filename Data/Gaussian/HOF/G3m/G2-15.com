%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -2.90586295E+02, ZPE = 0.011977, TE = 0.015811

0        3
Si      0.00000000        0.00000000        0.09579527
H      0.00000000        1.27765010       -0.66429464
H      0.00000000       -1.27765010       -0.66429464

