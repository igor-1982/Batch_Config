%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -2.53110579E+02, ZPE = 0.048961, TE = 0.05421

0        1
C     -0.01038841        0.18807326        0.00000000
O      0.08859384        1.36892183       -0.00000000
F     -1.22533895       -0.40070336        0.00000000
C      1.07310213       -0.84953415        0.00000000
H      2.04915979       -0.36678984        0.00000000
H      0.96773380       -1.48982287        0.88057692
H      0.96773380       -1.48982287       -0.88057692

