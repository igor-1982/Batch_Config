%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.79727628E+03, ZPE = 0.009556, TE = 0.016394

0        1
P     -0.00001214       -0.00000623        0.43637730
O      0.00005556        0.00002029        1.89290175
Cl     -0.00002533        1.83516998       -0.42494171
Cl      1.58927134       -0.91760142       -0.42492687
Cl     -1.58928943       -0.91758262       -0.42499946

