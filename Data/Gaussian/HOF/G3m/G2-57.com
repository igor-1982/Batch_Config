%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.40557079E+03, ZPE = 0.007517, TE = 0.012866

0        1
B      0.00000000        0.00000000        0.00000000
Cl      0.00000000        1.75133600        0.00000000
Cl      1.51670100       -0.87566800        0.00000000
Cl     -1.51670100       -0.87566800        0.00000000

