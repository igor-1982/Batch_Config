%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -4.78028232E+02, ZPE = 0.074595, TE = 0.080323

0        1
C      1.52029996        0.70879816       -0.00000000
C     -0.00089702        0.83620224        0.00000000
S     -0.75344211       -0.84568544        0.00000000
H     -2.04085759       -0.45305313        0.00000000
H     -0.34339668        1.37321622        0.88742281
H     -0.34339668        1.37321622       -0.88742281
H      1.97990296        1.70229088        0.00000000
H      1.87285008        0.17203542        0.88580454
H      1.87285008        0.17203542       -0.88580454

