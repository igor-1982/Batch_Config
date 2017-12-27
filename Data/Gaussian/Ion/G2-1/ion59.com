#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

SIH3- C3V //mp2(full)/6-31G* MP2=-290.7018387

-1    1
Si
X,1,1.
H,1,R,2,BETA
H,1,R,2,BETA,3,120.,0
H,1,R,2,BETA,3,-120.,0
 
R=1.542352
BETA=121.760962
  
 
 
