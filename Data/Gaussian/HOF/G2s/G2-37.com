%chk=G2-37.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

HYDROGEN PEROXIDE //b3lyp/6-31g* opt=z-matrix

0    1
  O      0.00000000      0.72785200     -0.05439600
  O      0.00000000     -0.72785200     -0.05439600
  H      0.82556700      0.89134700      0.43516900
  H     -0.82556700     -0.89134700      0.43516900
 
 
 
