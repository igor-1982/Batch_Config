%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.53192534E+02, ZPE = 0.043028, TE = 0.047926

0        2
C     -0.96436042       -0.66614878        0.00000000
C      0.00097303        0.50175669       -0.00000000
H     -0.43638191       -1.62613800        0.00000000
H     -1.60906226       -0.58623517        0.88000992
H     -1.60906226       -0.58623517       -0.88000992
O      1.18308682        0.47650543        0.00000000

