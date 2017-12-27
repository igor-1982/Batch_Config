%chk=G2-38.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

F2 //b3lyp/6-31g* opt=z-matrix

0    1
  F      0.00000000      0.00000000      0.70162600
  F      0.00000000      0.00000000     -0.70162600
 
 
 
