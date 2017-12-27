%chk=H_CH4_39.chk
#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

40 H_CH4

0    2
C
H1,  C,  R1
H2,  C,  R2,  H1,  A1
H3,  C,  R2,  H1,  A1,    H2,  120.0
H4,  C,  R2,  H1,  A1,    H2, -120.0
H5,  H1, R3,  C,   180.0, H2,  0.0
 
R1=    1.0892701
R2=    1.0893001
A1=  109.4688498
R3=    2.8338920
  
 
 
