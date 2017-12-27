#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

HCCH+ 2-PI-U LINEAR //MP2(full)/6-31G* MP2=-76.6728707

1    2
H
C,1,CH
X,2,1.,1,90.
C,2,CC,3,90.,1,180.,0
X,4,CC,2,90.,3,180.,0
H,4,CH,5,90.,2,180.,0
 
CH=1.081382
CC=1.257817
  
 
 
