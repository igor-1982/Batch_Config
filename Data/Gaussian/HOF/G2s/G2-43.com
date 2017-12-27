%chk=G2-43.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

S2 //b3lyp/6-31g*

0    3
  S      0.00000000      0.00000000      0.96369500
  S      0.00000000      0.00000000     -0.96369500
 
 
 
