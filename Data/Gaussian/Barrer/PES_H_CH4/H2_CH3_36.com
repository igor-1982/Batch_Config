%chk=H2_CH3_36.chk
#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

37 H2+CH3

0    2
C
H,  C,  R1
H,  C,  R2,  H,  A1
H,  C,  R2,  H,  A1,    H,  120.0
H,  C,  R2,  H,  A1,    H, -120.0
H,  H, R3,  C,   180.0, H,  0.0
 
R1=  3.1091467
R2=  1.0792206
A1= 90.1928482
R3=  0.7433972
  
 
 
