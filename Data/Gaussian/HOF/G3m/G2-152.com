%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.97789553E+02, ZPE = 0.160136, TE = 0.168173

0        1
C      0.00000000        0.00000000        0.31547562
C      0.00000000        1.28243630       -0.52332164
C      0.00000000       -1.28243630       -0.52332164
C      0.00000000        2.55787963        0.32391890
C      0.00000000       -2.55787963        0.32391890
H     -0.87695718        0.00000000        0.97844107
H      0.87695718        0.00000000        0.97844107
H     -0.87668168        1.28152091       -1.18479147
H      0.87668168        1.28152091       -1.18479147
H      0.87668168       -1.28152091       -1.18479147
H     -0.87668168       -1.28152091       -1.18479147
H      0.88342085        2.60305083        0.97074761
H     -0.88342085        2.60305083        0.97074760
H     -0.88342085       -2.60305083        0.97074761
H      0.88342085       -2.60305083        0.97074761
H      0.00000000        3.45590648       -0.30205840
H      0.00000000       -3.45590648       -0.30205840

