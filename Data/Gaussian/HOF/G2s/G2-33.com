%chk=G2-33.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

Nitrogen N2, //b3lyp/6-31g* opt=z-matrix

0    1
  N      0.00000000      0.00000000      0.55274900
  N      0.00000000      0.00000000     -0.55274900
 
 
 
