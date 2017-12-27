%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 C  

 0 3
 C


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
CH radical. Doublet, C*v symm. MP2(full)/6-31G* Geom. MP2=-38.3423986
 
0,2
C
H,1,RCH
 
RCH=1.12052



--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Triplet methylene (CH2), C2v symm, 3-B1. MP2(full)/6-31G* Geom. MP2=-39.0074352
 
0,3
C
H,1,RCH
H,1,RCH,2,HCH
 
RCH=1.07726
HCH=131.60824


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Methyl radical (CH3), D3h symm. MP2(full)/6-31G* Geom. MP2=-39.6730312
 
0,2
C
H,1,CH
H,1,CH,2,120.
H,1,CH,2,120.,3,180.,0
 
CH=1.07841


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight

NH, triplet, C*v symm. MP2(full)/6-31G* Geom. MP2=-55.0614242

0,3
N
H,1,RNH

RNH=1.03943



--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight

NH2 radical, C2v symm, 2-B1. MP2(full)/6-31G* Geom. MP2=-55.6937452

0,2
N
H,1,RBH
H,1,RBH,2,HBH

RBH=1.02805
HBH=103.337613



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 O  

 0 3
 O




--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
OH radical, C*v symm. MP2(full)/6-31G* Geom. MP2=-75.5232063
 
0,2
O
H,1,ROH
 
ROH=0.97907
 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  F

 0 2
 F



--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
O2 molecule, D*h symm, Triplet. MP2(full)/6-31G* Geom. MP2=-149.9543197
 
0,3
O
O,1,r
 
r=1.245957
 

--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
NO radical, C*v symm, 2-Pi. MP2(full)/6-31G* Geom. MP2=-129.564464
 
0,2
N
O,1,r
 
r=1.142703
 


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Cyano radical (CN), C*v symm, 2-Sigma+. MP2(full)/6-31G* Geom. MP2=-92.441963
 
0,2
C
N,1,R
 
R=1.134799
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 Si  

 0 3
 Si


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  p

 0 4
 p


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 S  

 0 3
 S


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  cl

 0 2
 cl



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight   

SiH //mp2(full)/6-31G* 

0 2
si
h si 1.526259


 
--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Singlet silylene (SiH2), C2v symm, 1-A1. MP2(full)/6-31G* Geom. 
MP2=-290.0772034
 
0,1
Si
X,1,1.
H,1,R,2,A
H,1,R,2,A,3,180.,0
 
R=1.5186
A=46.2476
  


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Silyl radical (SiH3), C3v symm. MP2(full)/6-31G* Geom. MP2=-290.6841563
 
0,2
Si
X,1,1.
H,1,R,2,BETA
H,1,R,2,BETA,3,120.,0
H,1,R,2,BETA,3,-120.,0
 
R=1.482999
BETA=107.638334
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

PH TRIPLET //MP2(full)/6-31G*

0,3
P
H,1,R

R=1.425635


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
PH2 radical, C2v symm. MP2(full)/6-31G* Geom. MP2=-341.9457892
 
0,2
P
X,1,1.
H,1,R,2,A
H,1,R,2,A,3,180.,0
 
R=1.419167
A=46.278424
 

--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight

SH radical, C*v symm. MP2(full)/6-31G* geom. MP2=-398.1720853
 
0,2
S
H,1,R
 
R=1.344413
 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=(tight,xqc)
 
PO 2-PI //mp2(full)/6-31g* MP2=-415.8397251
scf=qc for dft. For mp2: 1) hf/6-31g* 2) mp2 scf=qc
 
0,2
P
O,1,R
 
R=1.537713
 


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
S2 molecule, D*h symm, triplet. MP2(full)/6-31G* Geom. MP2=-795.2628131
 
0,3
S
S,1,R
 
R=1.920226
 


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Cl2 molecule, D*h symm. MP2(full)/6-31G* Geom. MP2=-919.191224
 
0,1
Cl
Cl,1,R
 
R=2.015082
 


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight

H2. D*h symm. MP2(full)/6-31G* geom. MP2=-1.1441408

0,1
H
H,1,r

r=0.737166


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Ammonia (NH3), C3v symm. MP2(full)/6-31G* Geom. MP2=-56.3573777
 
0,1
N
X,1,1.
H,1,RNH,2,XNH
H,1,RNH,2,XNH,3,120.,0
H,1,RNH,2,XNH,3,240.,0
 
RNH=1.016793
XNH=112.450403
 


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Water (H2O), C2v symm. MP2(full)/6-31G* Geom. MP2=-76.1992442
 
0,1
O
H,1,OH
H,1,OH,2,HOH
 
OH=0.968565
HOH=103.999825
 

--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Acetylene (C2H2), D*h symm. MP2(full)/6-31G* Geom. MP2=-77.0762154
 
0,1
C
C,1,CC
X,2,1.,1,90.
H,2,CH,3,90.,1,180.,0
X,1,1.,2,90.,3,180.,0
H,1,CH,5,90.,2,180.,0
 
CC=1.21616
CH=1.06591
 

--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Silane (SiH4), Td symm. MP2(full)/6-31G* Geom. MP2=-291.3168497
 
0,1
Si
H,1,R
H,1,R,2,109.471221
H,1,R,2,109.471221,3,120.,0
H,1,R,2,109.471221,3,-120.,0
 
R=1.482869
 

--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Phosphine (PH3), C3v symm. MP2(full)/6-31G* Geom. MP2=-342.562259
 
0,1
P
X,1,1.
H,1,R,2,BETA
H,1,R,2,BETA,3,120.,0
H,1,R,2,BETA,3,-120.,0
 
R=1.414436
BETA=121.912965
 


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Hydrogen sulfide (H2S), C2v symm. MP2(full)/6-31G* Geom. MP2=-398.7986975
 
0,1
S
X,1,1.
H,1,R,2,A
H,1,R,2,A,3,180.,0
 
R=1.339464
A=46.66533

 
--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Hydrogen chloride (HCl), C*v symm. MP2(full)/6-31G* Geom. MP2=-460.2021493
 
0,1
Cl
H,1,R
 
R=1.279978
 



