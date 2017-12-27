#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

nonclassical vinyl cation, //mp2(full)/6-31g* MP2=-77.3235627

1    1
X
C,1,HalfCC
H,1,XHbr,2,90.
C,1,HalfCC,3,90.,2,180.,0
X,2,1.,4,HalfHCC,3,180.,0
X,4,1.,2,HalfHCC,3,180.,0
H,2,CH,5,HalfHCC,4,180.,0
H,4,CH,6,HalfHCC,2,180.,0
 
HalfCC=0.61597
XHbr=1.11709
CH=1.08124
HalfHCC=90.13339
  
 
 
