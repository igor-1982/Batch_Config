%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.55985527E+02, ZPE = 0.086385, TE = 0.091146

0        1
C      0.00000000        0.66882075        0.81563205
C      0.00000000       -0.66882075        0.81563205
C      0.00000000        0.78602539       -0.69813799
C     -0.00000000       -0.78602539       -0.69813799
H      0.00000000        1.41785502        1.59956215
H     -0.00000000       -1.41785502        1.59956215
H      0.88837025        1.24646732       -1.14386761
H     -0.88837025        1.24646732       -1.14386760
H     -0.88837025       -1.24646732       -1.14386761
H      0.88837025       -1.24646732       -1.14386761

