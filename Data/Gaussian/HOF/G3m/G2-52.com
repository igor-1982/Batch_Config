%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -5.00115614E+02, ZPE = 0.037683, TE = 0.041651

0        1
C      0.00000062       -0.00001811       -1.14004454
Cl      0.00000607        0.00000892        0.65949138
H     -0.00000857        1.03401612       -1.48111767
H      0.89551564       -0.51700946       -1.48112276
H     -0.89551375       -0.51699847       -1.48113741

