%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -5.53021345E+02, ZPE = 0.066635, TE = 0.071641

0        1
S      0.00000000        0.00000000        1.19038488
C      0.00000000        1.23999774       -0.01107134
C      0.00000000       -1.23999774       -0.01107134
C      0.00000000        0.71298317       -1.27057148
C      0.00000000       -0.71298317       -1.27057148
H      0.00000000        2.27754318        0.28585352
H      0.00000000       -2.27754318        0.28585352
H      0.00000000        1.31642560       -2.16958663
H      0.00000000       -1.31642560       -2.16958663

