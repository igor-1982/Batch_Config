%chk=H2_CH3_6.chk
#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

7 H2+CH3

0    2
C
H1,  C,  R1
H2,  C,  R2,  H1,  A1
H3,  C,  R2,  H1,  A1,    H2,  120.0
H4,  C,  R2,  H1,  A1,    H2, -120.0
H5,  H1, R3,  C,   180.0, H2,  0.0
 
R1=  1.6930983
R2=  1.0812074
A1= 97.6718890
R3=  0.7841560
  
 
 
