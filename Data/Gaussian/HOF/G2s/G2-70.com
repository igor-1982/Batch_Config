%chk=G2-70.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

pf3 c3v  B3LYP 6-31G* geometry

0    1
  P      0.00000000      0.00000000      0.50700800
  F      0.00000000      1.38743200     -0.28167100
  F      1.20155200     -0.69371600     -0.28167100
  F     -1.20155200     -0.69371600     -0.28167100
 
 
 
