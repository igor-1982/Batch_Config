%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -5.55454405E+02, ZPE = 0.113592, TE = 0.119686

0        1
H      0.99123751        1.81072729        0.02465444
S      0.00000000        0.00000000        1.31223870
C     -0.00000071       -1.35085415        0.05000462
C      0.34347894       -0.68552234       -1.28671873
C     -0.34347894        0.68552234       -1.28671873
C      0.00000071        1.35085415        0.05000462
H     -0.72808673        2.10871318        0.34432226
H     -0.99123751       -1.81072729        0.02465444
H      0.72808673       -2.10871318        0.34432226
H      1.42870183       -0.55430935       -1.36571986
H      0.02274154       -1.30683106       -2.12965607
H     -1.42870183        0.55430935       -1.36571986
H     -0.02274154        1.30683106       -2.12965607

