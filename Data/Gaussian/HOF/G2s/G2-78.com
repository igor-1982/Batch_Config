%chk=G2-78.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

ALLENE  D2D B3LYP 6-31G* geometry

0    1
  C      0.00000000      0.00000000      0.00000000
  C      0.00000000      0.00000000      1.30683000
  C      0.00000000      0.00000000     -1.30683000
  H      0.00000000      0.92735900      1.87625600
  H      0.00000000     -0.92735900      1.87625600
  H      0.92735900      0.00000000     -1.87625600
  H     -0.92735900      0.00000000     -1.87625600
 
 
 
