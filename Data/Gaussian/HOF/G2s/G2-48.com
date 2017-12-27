%chk=G2-48.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

OS //b3lyp/6-31g* opt=z-matrix

0    3
  O      0.00000000      0.00000000     -1.01184100
  S      0.00000000      0.00000000      0.50592000
 
 
 
