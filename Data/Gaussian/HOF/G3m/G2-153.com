%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.97791173E+02, ZPE = 0.159467, TE = 0.167161

0        1
C      0.00000000        0.00000000       -0.00000000
C      0.88864862        0.88864862        0.88864862
C     -0.88864861       -0.88864861        0.88864861
C     -0.88864861        0.88864862       -0.88864861
C      0.88864862       -0.88864862       -0.88864862
H      1.53418615        1.53418616        0.28274281
H      0.28274281        1.53418615        1.53418616
H      1.53418616        0.28274281        1.53418616
H     -1.53418616       -1.53418615        0.28274281
H     -0.28274281       -1.53418615        1.53418616
H     -1.53418615       -0.28274280        1.53418615
H     -1.53418616        0.28274281       -1.53418615
H     -1.53418616        1.53418615       -0.28274280
H     -0.28274281        1.53418616       -1.53418616
H      0.28274281       -1.53418616       -1.53418616
H      1.53418616       -0.28274281       -1.53418616
H      1.53418615       -1.53418616       -0.28274281

