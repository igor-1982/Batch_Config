%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -2.33436355E+02, ZPE = 0.121829, TE = 0.12802

0        1
H     -2.17560934        0.00000000        0.86918667
C     -1.49848934        0.00000000        0.00000000
C      0.66549558        1.25268016        0.00000000
C      0.66549558       -1.25268016        0.00000000
C      1.49848934        0.00000000        0.00000000
C     -0.66549558       -1.25268016        0.00000000
C     -0.66549558        1.25268016        0.00000000
H      1.20503530        2.19674775        0.00000000
H     -1.20503530        2.19674775        0.00000000
H      2.17560934        0.00000000        0.86918667
H     -1.20503530       -2.19674775        0.00000000
H      1.20503530       -2.19674775        0.00000000
H     -2.17560934        0.00000000       -0.86918667
H      2.17560934        0.00000000       -0.86918667

