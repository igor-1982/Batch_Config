%chk=G2-26.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

ETHANE //b3lyp/6-31g*

0    1
  C      0.00000000      0.00000000      0.76531900
  C      0.00000000      0.00000000     -0.76531900
  H      0.00000000      1.02100600      1.16426500
  H     -0.88421700     -0.51050300      1.16426500
  H      0.88421700     -0.51050300      1.16426500
  H      0.00000000     -1.02100600     -1.16426500
  H     -0.88421700      0.51050300     -1.16426500
  H      0.88421700      0.51050300     -1.16426500
 
 
 
