#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

SIH5+ C1 //mp2(full)/6-31g* MP2=-291.5583167

1    1
Si
X,1,1.8995
H,2,H1X,1,A1
H,2,H1X,1,A2,3,180.,0
H,1,SIH2,2,A3,3,PH1,0
H,1,SIH3,2,A4,5,PH2,0
H,1,SIH4,2,A5,5,PH3,0
 
H1X=0.386592
SIH2=1.462962
SIH3=1.46435
SIH4=1.464287
A1=79.847639
A2=79.715238
A3=96.353704
A4=94.222646
A5=94.290989
PH1=88.984394
PH2=120.274682
PH3=-120.261719
  
 
 
