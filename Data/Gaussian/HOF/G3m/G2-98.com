%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -9.58661700E+01, ZPE = 0.063991, TE = 0.068346

0        1
C      0.05055683        0.69925032        0.00000000
N      0.06712460       -0.76450320        0.00000000
H     -0.94894524        1.16562929        0.00000000
H     -0.43670955       -1.11260060        0.80957496
H     -0.43670955       -1.11260060       -0.80957496
H      0.58695896        1.06711939        0.88107935
H      0.58695896        1.06711939       -0.88107935

