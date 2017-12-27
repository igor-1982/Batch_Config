#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

PH3+ //MP2(full)/6-31G* MP2=-342.2239439

1    2
P
X,1,RX
H,1,R1,2,A
H,1,R1,2,A,3,120.,0
H,1,R1,2,A,3,-120.,0
 
RX=1.
R1=1.395097
A=105.295842
  
 
 
