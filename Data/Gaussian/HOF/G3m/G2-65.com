%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -6.89151207E+02, ZPE = 0.012742, TE = 0.018606

0        1
Si      0.00000000        0.00000000        0.00000000
F      0.90344754        0.90344754        0.90344754
F     -0.90344754       -0.90344754        0.90344754
F     -0.90344754        0.90344754       -0.90344754
F      0.90344754       -0.90344754       -0.90344754

