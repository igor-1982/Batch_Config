%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -4.76795718E+02, ZPE = 0.054906, TE = 0.059229

0        1
C      0.00000000        0.74063961       -0.80505226
S      0.00000000        0.00000000        0.86946173
C      0.00000000       -0.74063961       -0.80505226
H      0.91459808        1.25643159       -1.07899530
H     -0.91459808        1.25643159       -1.07899530
H     -0.91459808       -1.25643159       -1.07899530
H      0.91459808       -1.25643159       -1.07899530

