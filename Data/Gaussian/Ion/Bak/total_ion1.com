%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

h hf/6-31g*

0 2
h



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

He mp2(full)/6-31g*

0 1
He


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

li mp2(full)/6-31g*

0 2
li


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  be

 0 1
be 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  b

 0 2
B


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 C  

 0 3
 C


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  N

 0 4
 N


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 O  

 0 3
 O


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  F

 0 2
 F


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

Ne mp2(full)/6-31g*

0 1
Ne


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Methane (CH4), Td symm. MP2(full)/6-31G* Geom. MP2=-40.3370426
 
0,1
C
H,1,RCH
H,1,RCH,2,109.471221
H,1,RCH,2,109.471221,3,109.471221,1
H,1,RCH,2,109.471221,3,109.471221,-1
 
RCH=1.089665
 


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
 
OH radical, C*v symm. MP2(full)/6-31G* Geom. MP2=-75.5232063
 
0,2
O
H,1,ROH
 
ROH=0.97907


 
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
 
Hydrogen fluoride (HF), C*v symm. MP2(full)/6-31G* Geom. MP2=-100.1841614
 
0,1
F
H,1,R
 
R=0.933891



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

na mp2(full)/6-31g*

0 2
na


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  mg

 0 1
mg 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  al

 0 2
al 


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

  Ar

 0 1
 Ar



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

SH radical, C*v symm. MP2(full)/6-31G* geom. MP2=-398.1720853
 
0,2
S
H,1,R
 
R=1.344413
 


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
 
Ethylene (H2C=CH2), D2h symm. MP2(full)/6-31G* Geom. MP2=-78.2942862
 
0,1
C
C,1,RCC
H,1,RCH,2,HCC
H,1,RCH,2,HCC,3,180.,0
H,2,RCH,1,HCC,3,0.,0
H,2,RCH,1,HCC,3,180.,0
 
RCC=1.33496
RCH=1.084788
HCC=121.711801
 

--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Carbon monoxide (CO), C*v symm. MP2(full)/6-31G* Geom. MP2=-113.0281795
 
0,1
O
C,1,RCO
 
RCO=1.15034


--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
N2 molecule, D*h symm. MP2(full)/6-31G* Geom. MP2=-109.2615742
 
0,1
N
N,1,NN
 
NN=1.12998
 

--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
N2 molecule, D*h symm. MP2(full)/6-31G* Geom. MP2=-109.2615742
 
0,1
N
N,1,NN
 
NN=1.12998
 

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
 
P2 molecule, D*h symm. MP2(full)/6-31G* Geom. MP2=-681.6646966
 
0,1
P
P,1,PP
 
PP=1.932288
 

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
 
ClF molecule, C*v symm, 1-SG. MP2(full)/6-31G* Geom. MP2=-559.1392996
 
0,1
F
Cl,1,R1
 
R1=1.659096
 

--link1--
%mem=4GB
# M06/6-311+G(3df,2p) scf=tight
 
Carbon monosulfide (CS), C*v symm. MP2(full)/6-31G* Geom. MP2=-435.5576809
 
0,1
C
S,1,CS
 
CS=1.54465
 

 
