%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -3.81477041E+02, ZPE = 0.084919, TE = 0.092108

0        1
C      0.00000000        0.00000000        1.44497395
C     -0.00000000        0.00000000       -1.44497395
O     -0.00000000        0.00000000        2.66302370
O      0.00000000        0.00000000       -2.66302370
C      0.00000000        1.26655142        0.66948065
C      0.00000000       -1.26655142        0.66948065
C      0.00000000       -1.26655142       -0.66948065
C      0.00000000        1.26655142       -0.66948065
H      0.00000000        2.17809448        1.25855337
H      0.00000000       -2.17809448        1.25855337
H      0.00000000       -2.17809448       -1.25855337
H      0.00000000        2.17809448       -1.25855337

