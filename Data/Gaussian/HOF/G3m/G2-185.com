%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -3.07682756E+02, ZPE = 0.121944, TE = 0.128119

0        1
H      0.56116093        1.15410243        2.02490286
H      0.56116093        1.15410243       -2.02490286
C     -0.00228771       -0.76253016        1.16891875
C     -0.00228771       -0.76253016       -1.16891875
H     -0.56116093       -1.15410243       -2.02490286
C      0.00228771        0.76253016       -1.16891875
C      0.00228771        0.76253016        1.16891875
H      1.03532954       -1.13149493        1.22552657
H      1.03532954       -1.13149493       -1.22552657
O     -0.63629052       -1.25991736        0.00000000
H     -1.03532954        1.13149493       -1.22552657
H     -1.03532954        1.13149493        1.22552657
O      0.63629052        1.25991736        0.00000000
H     -0.56116093       -1.15410243        2.02490286

