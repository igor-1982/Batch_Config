#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

SH3+ //mp2(full)/6-31g* MP2=-399.0732876

1    1
S
X,1,RX
H,1,R1,2,A
H,1,R1,2,A,3,120.,0
H,1,R1,2,A,3,-120.,0
 
RX=1.
R1=1.346968
A=120.852951
  
 
 
