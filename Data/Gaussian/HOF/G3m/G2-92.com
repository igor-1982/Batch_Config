%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.95288398E+02, ZPE = 0.114831, TE = 0.120689

0        1
C      0.00000000        0.00000000        0.00000000
C      0.00000000        0.76466525        1.26927499
C      0.00000000       -0.76466525        1.26927499
C      0.76466525        0.00000000       -1.26927499
C     -0.76466525        0.00000000       -1.26927499
H     -0.91288683        1.26769353        1.57342288
H      0.91288683        1.26769353        1.57342288
H     -0.91288683       -1.26769353        1.57342288
H      0.91288683       -1.26769353        1.57342288
H      1.26769353       -0.91288683       -1.57342288
H      1.26769353        0.91288683       -1.57342288
H     -1.26769353       -0.91288683       -1.57342288
H     -1.26769353        0.91288683       -1.57342288

