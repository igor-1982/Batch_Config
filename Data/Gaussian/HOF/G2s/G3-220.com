%chk=G3-220.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

cf3cl b3lyp/6-31g* = -797.8167156

0    1
  C      0.00000000      0.00000000     -0.36100700
 Cl      0.00000000      0.00000000      1.42250900
  F      0.00000000      1.25082500     -0.81543000
  F      1.08324700     -0.62541300     -0.81543000
  F     -1.08324700     -0.62541300     -0.81543000
 
 
 
