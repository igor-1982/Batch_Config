%chk=G2-145.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

c2h5 staggered Cs 2-A' b3lyp 6-31g* geometry

0    2
  C     -0.01127300     -0.69403300      0.00000000
  C     -0.01127300      0.79533700      0.00000000
  H      1.01258500     -1.11042700      0.00000000
  H     -0.51041800     -1.10191800      0.88764700
  H     -0.51041800     -1.10191800     -0.88764700
  H      0.07176300      1.35322000      0.92741800
  H      0.07176300      1.35322000     -0.92741800
 
 
 
