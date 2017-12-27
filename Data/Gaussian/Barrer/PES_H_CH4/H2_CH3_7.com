%chk=H2_CH3_7.chk
#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

8 H2+CH3

0    2
C
H1,  C,  R1
H2,  C,  R2,  H1,  A1
H3,  C,  R2,  H1,  A1,    H2,  120.0
H4,  C,  R2,  H1,  A1,    H2, -120.0
H5,  H1, R3,  C,   180.0, H2,  0.0
 
R1= 1.7544777
R2= 1.0807074
A1=96.6423642
R3= 0.7745274
  
 
 
