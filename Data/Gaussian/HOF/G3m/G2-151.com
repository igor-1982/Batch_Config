%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.96573186E+02, ZPE = 0.140395, TE = 0.146522

0        1
C      0.00000000        0.00000000        1.30736158
C     -0.32752066        0.69477536       -1.03076718
C      0.32752066       -0.69477536       -1.03076718
C      0.00137545        1.24248059        0.37137365
C     -0.00137545       -1.24248059        0.37137365
H      0.87603979        0.00555554        1.96233286
H     -0.87603979       -0.00555554        1.96233286
H      0.02827495        1.34354665       -1.83665193
H     -0.02827495       -1.34354665       -1.83665193
H     -1.41336431        0.59059453       -1.15220811
H      1.41336431       -0.59059453       -1.15220811
H      0.99616479        1.70174827        0.35999400
H     -0.99616479       -1.70174827        0.35999400
H     -0.69943567        2.01592632        0.69775292
H      0.69943567       -2.01592632        0.69775292

