#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

SIH4+ H2---SIH2+ CS //MP2(full)/6-31G* MP2=-290.9225259

1    2
Si
X,1,1.
H,1,R1,2,HALF1
H,1,R1,2,HALF1,3,180.,0
X,1,1.,2,90.,3,90.,0
X,1,1.,5,THETA,2,180.,0
H,1,R3,6,HALF3,5,0.,0
H,1,R4,6,HALF3,7,180.,0
 
R1=1.47014
R3=1.890457
R4=1.83514
HALF1=60.633314
THETA=10.35464
HALF3=11.861807
  
 
 
