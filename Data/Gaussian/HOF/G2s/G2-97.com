%chk=G2-97.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

chcl3  B3LYP/6-31G* geometry

0    1
  C      0.00000000      0.00000000      0.45420200
  H      0.00000000      0.00000000      1.53973900
 Cl      0.00000000      1.70491700     -0.08362700
 Cl      1.47650200     -0.85245900     -0.08362700
 Cl     -1.47650200     -0.85245900     -0.08362700
 
 
 
