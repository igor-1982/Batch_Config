%chk=G2-108.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

DIMETHYLAMINE  b3lyp 6-31G* geometry

0    1
  C     -0.02708800     -0.22221800      1.21345400
  N     -0.02708800      0.58491300      0.00000000
  C     -0.02708800     -0.22221800     -1.21345400
  H      0.79834400     -0.95793500      1.27395100
  H      0.03095500      0.43159600      2.09020100
  H     -0.96923200     -0.78047100      1.27628600
  H      0.79453900      1.18584000      0.00000000
  H      0.79834400     -0.95793500     -1.27395100
  H      0.03095500      0.43159600     -2.09020100
  H     -0.96923200     -0.78047100     -1.27628600
 
 
 
