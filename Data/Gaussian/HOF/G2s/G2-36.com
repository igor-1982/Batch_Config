%chk=G2-36.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

O2 //b3lyp/6-31g* opt=z-matrix

0    3
  O      0.00000000      0.00000000      0.60726700
  O      0.00000000      0.00000000     -0.60726700
 
 
 
