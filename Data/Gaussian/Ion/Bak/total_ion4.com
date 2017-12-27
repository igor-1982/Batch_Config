%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

C  quartet mp2(full)/6-31g* MP2=-37.728092

 -1 4
 C


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

CH- mp2(full)/6-31g* MP2=-38.3343437

-1 3
c
h c 1.161019


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
CH2- //mp2(full)/6-31g* MP2=-38.959817
 
-1,2
C
H,1,r
H,1,r,2,a
 
r=1.14059
a=97.917282
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
METHYL ANION C3V //mp2(full)/6-31g* MP2=-39.6070093
 
-1,1
C
X,1,1.
H,1,R,2,A
H,1,R,2,A,3,120.,0
H,1,R,2,A,3,-120.,0
 
R=1.120888
A=116.546186
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
NH- //mp2(full)/6-31g* MP2=-54.9981305
 
-1,2
N
H,1,r
 
r=1.057451
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
nh2- //mp2(full)/6-31g* MP2=-55.6499369
 
-1,1
N
H,1,RNH
H,1,RNH,2,HNH
 
RNH=1.042632
HNH=98.432415
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  Oxygen  doublet mp2(full)/6-31g* MP2=-74.8598673

 -1 2
 O



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
OH- //mp2(full)/6-31g* MP2=-75.5154393
 
-1,1
O
H,1,r
 
r=0.980348
 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  F  singlet mp2(full)/6-31g* MP2=-99.5285086

 -1 1
 F



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
o2-  //mp2(full)/6-31g* MP2=-149.9202213
 
-1,2
O
O,1,OO
 
OO=1.379745
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
NO- 3Sigma- //mp2(full)/6-31g* MP2=-129.5232476
 
-1,3
N
O,1,NO
 
NO=1.28013
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
CN- //mp2(full)/6-31g* MP2=-92.5706802
 
-1,1
C
N,1,CN
 
CN=1.200154
 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  Si  quartet mp2(full)/6-31g* MP2=-288.9099813

 -1 4
 Si


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  P triplet mp2(full)/6-31g* MP2=-340.7341779

 -1 3
 P


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  S  doublet mp2(full)/6-31g* MP2=-397.5987309

 -1 2
 S


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

  cl singlet mp2(full)/6-31g* MP2=-459.6618249

 -1 1
 cl



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
SIH- 3-sigma //mp2(full)/6-31g* MP2=-289.4951319
 
-1,3
Si
H,1,R
 
R=1.560836
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
SIH2- 2-B-1 //mp2(full)/6-31g* MP2=-290.0925952
 
-1,2
Si
X,1,1.
H,1,R,2,A
H,1,R,2,A,3,180.,0
 
R=1.550319
A=46.188316
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

SIH3- C3V //mp2(full)/6-31G* MP2=-290.7018387

-1,1
Si
X,1,1.
H,1,R,2,BETA
H,1,R,2,BETA,3,120.,0
H,1,R,2,BETA,3,-120.,0

R=1.542352
BETA=121.760962


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
PH- //mp2(full)/6-31g* MP2=-341.3353403
 
-1,2
P
H,1,R
 
R=1.445714
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
ph2- //mp2(full)/6-31g* MP2=-341.9512749
 
-1,1
P
X,1,1.
H,1,R,2,A
H,1,R,2,A,3,180.,0
 
R=1.436823
A=45.902715
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
SH- //mp2(full)/6-31g* MP2=-398.2207031
 
-1,1
S
H,1,R
 
R=1.353342
 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
PO- 3-sigma //mp2(full)/6-31g* MP2=-415.8394258
 
-1,3
P
O,1,R
 
R=1.580663
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
s2- 2-sigma //mp2(full)/6-31g* MP2=-795.2945538
 
-1,2
S
S,1,R
 
R=2.029189
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
cl2- //mp2(full)/6-31g* MP2=-919.26946
 
-1,2
Cl
Cl,1,R
 
R=2.651811
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

   cation: H3+  d3h   mp2(full)/6-31G* geom

1 1
h1
h2 h1 0.85108753
h3 h1 0.85108753 h2 60.



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
Ammonium, NH4+, //mp2(full)/6-31g* MP2=-56.7035842
 
1,1
N
H,1,NH
H,1,NH,2,109.47122
H,1,NH,2,109.47122,3,109.47122,1
H,1,NH,2,109.47122,3,109.47122,-1
 
NH=1.02853
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
Hydronium, H3O+, //mp2(full)/6-31g* MP2=-76.4776092
 
1,1
O
H,1,OH
H,1,OH,2,HOH
H,1,OH,2,HOH,3,HOH,1
 
OH=0.99082
HOH=111.42234
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
nonclassical vinyl cation, //mp2(full)/6-31g* MP2=-77.3235627
 
1,1
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
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
SIH5+ C1 //mp2(full)/6-31g* MP2=-291.5583167
 
1,1
Si
X,1,1.8995
H,2,H1X,1,A1
H,2,H1X,1,A2,3,180.,0
H,1,SIH2,2,A3,3,PH1,0
H,1,SIH3,2,A4,5,PH2,0
H,1,SIH4,2,A5,5,PH3,0
 
H1X=0.386592
SIH2=1.462962
SIH3=1.46435
SIH4=1.464287
A1=79.847639
A2=79.715238
A3=96.353704
A4=94.222646
A5=94.290989
PH1=88.984394
PH2=120.274682
PH3=-120.261719
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
PH4+ //mp2(full)/6-31g* MP2=-342.8710603
 
1,1
P
H,1,R1
H,1,R1,2,109.471221
H,1,R1,2,109.471221,3,120.,0
H,1,R1,2,109.471221,3,-120.,0
 
R1=1.39292
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
SH3+ //mp2(full)/6-31g* MP2=-399.0732876
 
1,1
S
X,1,RX
H,1,R1,2,A
H,1,R1,2,A,3,120.,0
H,1,R1,2,A,3,-120.,0
 
RX=1.
R1=1.346968
A=120.852951
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
H2CL+ //mp2(full)/6-31g* MP2=-460.4125779
 
1,1
Cl
H,1,R1
H,1,R1,2,A
 
R1=1.302176
A=96.635367
 

