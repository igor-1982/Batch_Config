%chk=G2-41.chk
#p b3lyp/6-31+g(d,p) scf=tight guess(alter) iop(5/33=1) extraoverlay

SI2 3-SGG //b3lyp/6-31g* alter beta 13 14

0    3
 Si      0.00000000      0.00000000      1.08554600
 Si      0.00000000      0.00000000     -1.08554600
 
13 14
 
 
