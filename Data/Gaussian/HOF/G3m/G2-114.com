%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.55052491E+02, ZPE = 0.079754, TE = 0.085021

0        1
C      1.17600872       -0.40078186        0.00000000
C     -0.00775207        0.55242828        0.00000000
O     -1.19574212       -0.22671695        0.00000000
H     -1.94737263        0.37301584       -0.00000000
H      0.03774931        1.20576227        0.88643469
H      0.03774931        1.20576227       -0.88643469
H      2.11864691        0.15470696       -0.00000000
H      1.14893628       -1.04214791        0.88579644
H      1.14893628       -1.04214791       -0.88579644

