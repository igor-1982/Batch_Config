%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.32763436E+02, ZPE = 0.045285, TE = 0.049816

0        1
C      0.00000191       -0.00001055       -1.17537462
C      0.00000294       -0.00003868        0.28204695
N      0.00000376        0.00005296        1.43696715
H     -0.00001183        1.02535380       -1.55473501
H      0.88797508       -0.51268602       -1.55480646
H     -0.88797186       -0.51267051       -1.55482601

