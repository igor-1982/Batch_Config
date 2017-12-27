%chk=G2-40.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

na2 //b3lyp/6-31G*

0    1
 Na      0.00000000      0.00000000      1.51941800
 Na      0.00000000      0.00000000     -1.51941800
 
 
 
