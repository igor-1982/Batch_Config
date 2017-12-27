%chk=H_CH4_17.chk
#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

18 H_CH4

0    2
C
H1,  C,  R1
H2,  C,  R2,  H1,  A1
H3,  C,  R2,  H1,  A1,    H2,  120.0
H4,  C,  R2,  H1,  A1,    H2, -120.0
H5,  H1, R3,  C,   180.0, H2,  0.0
 
R1=    1.0919913
R2=    1.0894944
A1=  109.4137131
R3=    1.8606469
  
 
 
