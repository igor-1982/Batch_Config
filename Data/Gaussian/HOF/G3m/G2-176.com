%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -2.64316404E+02, ZPE = 0.073378, TE = 0.080473

0        1
C     -0.42401611        1.83728726        0.00000000
N     -1.11228014        2.76487085       -0.00000000
C      0.42408201        0.64844494        0.00000000
H      1.07432561        0.67054737        0.87995579
H      1.07432561        0.67054737       -0.87995578
C     -0.42404902       -0.64842320        0.00000000
H     -1.07429413       -0.67051931        0.87995566
C      0.42404337       -1.83727043       -0.00000000
H     -1.07429413       -0.67051931       -0.87995565
N      1.11215693       -2.76496556       -0.00000000

