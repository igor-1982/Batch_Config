%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 he+ mp2(full)/6-31g* -7.2359397

 +1 2
he



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 li+ mp2(full)/6-31g* -7.2359397

 +1 1
li



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 Be+ mp2(full)/6-31g* MP2=-14.2785766

 +1 2
be


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 B+ mp2(full)/6-31g* MP2=-24.2715012

 +1 1
B


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 C+ mp2(full)/6-31g* MP2=-37.3343505

 +1 2
C


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 N+ mp2(full)/6-31g* MP2=-53.9292719

 +1 3
N


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 O+ mp2(full)/6-31g* MP2=-74.4061728

 +1 4
O


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 F+ mp2(full)/6-31g* MP2=-98.871239

 +1 3
F


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 ne+ mp2(full)/6-31g* MP2=-161.6607843

 +1 2
ne



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
METHANE CATION 2-B2 //MP2(full)/6-31G* MP2=-39.8736814
 
1,2
C
X,1,1.
H,1,CH,2,HCX
H,1,CH,2,HCX,3,180.,0
H,1,CHP,2,HPCX,3,90.,0
H,1,CHP,2,HPCX,3,-90.,0
 
CH=1.173292
CHP=1.083863
HCX=29.280619
HPCX=118.269863
 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
PLANAR AMMONIA CATION //MP2(full)/6-31G* MP2=-56.006942
 
1,2
N
H,1,RNH
H,1,RNH,2,120.
H,1,RNH,2,120.,3,180.,0
 
RNH=1.025985
 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
OH+ 3-SIGMA //MP2(full)/6-31G* MP2=-75.0677739
 
1,3
H
O,1,R
 
R=1.034581
 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
WATER CATION OPTIMIZATION //MP2(full)/6-31G* MP2=-75.7569545
 
1,2
O
H,1,R
H,1,R,2,A
 
R=1.010335
A=109.95753
 


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
FH+ //MP2(full)/6-31G* MP2=-99.6189213
 
1,2
F
H,1,R
 
R=1.029648


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 na+ mp2(full)/6-31g* MP2=-161.6607843

 +1 1
na



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 mg+ mp2(full)/6-31g* MP2=-199.3585131

 +1 2
mg



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 Al+ mp2(full)/6-31g* MP2=-241.687734

 +1 1
Al



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 Si+ mp2(full)/6-31g* MP2=-288.5959386

 +1 2
Si



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 P+ mp2(full)/6-31g* MP2=-340.3829831

 +1 3
P



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 S+ mp2(full)/6-31g* MP2=-397.2150009

 +1 4
S



--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 Cl+ mp2(full)/6-31g* MP2=-459.1100629

 +1 3
Cl


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight

 Ar+ mp2(full)/6-31g* MP2=-459.1100629

 +1 2
Ar


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
SIH4+ H2---SIH2+ CS //MP2(full)/6-31G* MP2=-290.9225259
 
1,2
Si
X,1,1.
H,1,R1,2,HALF1
H,1,R1,2,HALF1,3,180.,0
X,1,1.,2,90.,3,90.,0
X,1,1.,5,THETA,2,180.,0
H,1,R3,6,HALF3,5,0.,0
H,1,R4,6,HALF3,7,180.,0
 
R1=1.47014
R3=1.890457
R4=1.83514
HALF1=60.633314
THETA=10.35464
HALF3=11.861807
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
PH+ mp2(full)/6-31g* MP2=-340.9817281
 
1,2
P
H,1,1.42
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
PH2+ 1A1 //MP2(full)/6-31G* MP2=-341.5970934
 
1,1
P
H,1,R1
H,1,R1,2,A
 
R1=1.415438
A=93.410417
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
PH3+ //MP2(full)/6-31G* MP2=-342.2239439
 
1,2
P
X,1,RX
H,1,R1,2,A
H,1,R1,2,A,3,120.,0
H,1,R1,2,A,3,-120.,0
 
RX=1.
R1=1.395097
A=105.295842
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
SH+ //MP2(full)/6-31G* MP2=-397.8163661
 
1,3
S
H,1,R1
 
R1=1.356664
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
SH2+ 2B1 //MP2(full)/6-31G* MP2=-398.4357861
 
1,2
S
H,1,R1
H,1,R1,2,A
 
R1=1.350793
A=94.724008
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight guess=alter
 
SH2+ 2A1 //MP2(full)/6-31G* MP2=-398.3480896
 
1,2
S
H,1,R1
H,1,R1,2,A
 
R1=1.353158
A=126.60501
 
 
8,9

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
HCL+ //MP2(full)/6-31G* MP2=-459.7520272
 
1,2
Cl
H,1,R
 
R=1.3098


--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
HCCH+ 2-PI-U LINEAR //MP2(full)/6-31G* MP2=-76.6728707
 
1,2
H
C,1,CH
X,2,1.,1,90.
C,2,CC,3,90.,1,180.,0
X,4,CC,2,90.,3,180.,0
H,4,CH,5,90.,2,180.,0
 
CH=1.081382
CC=1.257817
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
H2C=CH2+ ETHYLENE CATION D2H //MP2(full)/6-31G* MP2=-77.926503
 
1,2
C
C,1,CC
H,1,CH,2,HCC
H,1,CH,2,HCC,3,180.,0
H,2,CH,1,HCC,3,180.,0
H,2,CH,1,HCC,5,180.,0
 
CC=1.41632
CH=1.08624
HCC=120.67794
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
CO+ //MP2(full)/6-31G* MP2=-112.5164734
 
1,2
C
O,1,R
 
R=1.102565
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
N2+ 2-sigma-g //MP2(full)/6-31G* MP2=-108.71122
 
1,2
N
N,1,NN
 
NN=1.146572
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight guess=alter
 
N2+ 2-PI-u //MP2(full)/6-31G* MP2=-108.6493503
 
1,2
N
N,1,NN
 
NN=1.202845
 
 
6,7
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
O2+ //MP2(full)/6-31G* MP2=-149.5310341
 
1,2
O
O,1,OO
 
OO=1.186898
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight guess=alter
 
P2+ 2-PIU //MP2(full)/6-31G* MP2=-681.2796357
alter B 14,15

1,2
P
P,1,R1
 
R1=2.009857
 

14 15

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
S2+ 2-PIG //MP2(full)/6-31G* MP2=-794.9350475
 
1,2
S
S,1,R1
 
R1=1.86912
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
CL2+ 2-PIG //MP2(full)/6-31G* MP2=-918.7797275
 
1,2
Cl
Cl,1,R1
 
R1=1.928097
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
CLF+ //MP2(full)/6-31G* MP2=-558.6884868
 
1,2
Cl
F,1,r
 
r=1.5548
 

--link1--
%mem=4GB
%chk=filename
# M06/6-311+G(3df,2p) scf=tight
 
CS+ 2-SG  //MP2(full)/6-31G* MP2=-435.1305686
 
1,2
C
S,1,R1
 
R1=1.458781
 

