%chk=G2-32.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

METHANOL //b3lyp/6-31g*

0    1
  C     -0.04685700      0.66126700      0.00000000
  O     -0.04685700     -0.75792800      0.00000000
  H     -1.09451300      0.97445600      0.00000000
  H      0.87656500     -1.05049200      0.00000000
  H      0.43697600      1.08592900      0.89339600
  H      0.43697600      1.08592900     -0.89339600
 
 
 
