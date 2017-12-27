%chk=H2_CH3_33.chk
#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

34 H2+CH3

0    2
C
H1,  C,  R1
H2,  C,  R2,  H1,  A1
H3,  C,  R2,  H1,  A1,    H2,  120.0
H4,  C,  R2,  H1,  A1,    H2, -120.0
H5,  H1, R3,  C,   180.0, H2,  0.0
 
R1=  3.0685133
R2=  1.0792253
A1= 90.1973393
R3=  0.7434533
  
 
 
