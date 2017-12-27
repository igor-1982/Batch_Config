%chk=H2_CH3_11.chk
#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

12 H2+CH3

0    2
C
H1,  C,  R1
H2,  C,  R2,  H1,  A1
H3,  C,  R2,  H1,  A1,    H2,  120.0
H4,  C,  R2,  H1,  A1,    H2, -120.0
H5,  H1, R3,  C,   180.0, H2,  0.0
 
R1=  2.0093571
R2=  1.0795433
A1= 93.0653777
R3=  0.7544556
  
 
 
