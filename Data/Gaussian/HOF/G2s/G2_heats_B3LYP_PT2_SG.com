%chk=G2-1.chk
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
LITHIUM HYDRIDE, //B3LYP/6-31g* opt geom
 
0,1
LI
H,1,R
 
R=1.62106264






--link1--
%chk=G2-2.chk
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
BERYLLIUM HYDRIDE //b3lyp/6-31G*
 
0,2
Be
H,1,RBEH
 
RBEH=1.34944423


 



--link1--
%chk=G2-3.chk
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
DOUBLET CH //b3lyp/6-31G*
 
0,2
C
H,1,RCH
 
RCH=1.13309913






--link1--
%chk=G2-4.chk
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
CH2 3-B1 //b3lyp/6-31G*
 
0,3
C
H,1,RCH
H,1,RCH,2,HCH
 
RCH=1.08207824
HCH=133.15233121
 






--link1--
%chk=G2-5.chk
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
Singlet methylene, 1A1, //b3lyp/6-31G*
 
0,1
C
H,1,CH
H,1,CH,2,HCH
 
CH=1.11942218
HCH=100.2755497
 



--link1--
%chk=G2-6.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
Methyl radical, D3h, //b3lyp/6-31G*
 
0,2
C
H,1,CH
H,1,CH,2,120.
H,1,CH,2,120.,3,180.,0
 
CH=1.08274368




--link1--
%chk=G2-7.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
ch4 //b3lyp/6-31G*
 
0,1
C
H,1,RCH
H,1,RCH,2,109.471221
H,1,RCH,2,109.471221,3,109.471221,1
H,1,RCH,2,109.471221,3,109.471221,-1
 
RCH=1.09336252
 



--link1--
%chk=G2-8.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
NH,TRIPLET, //b3lyp/6-31G*
 
0,3
N
H,1,RNH
 
RNH=1.04782793




--link1--
%chk=G2-9.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
NH2,2-B-1, //b3lyp/6-31G*
 
0,2
N
H,1,RBH
H,1,RBH,2,HBH
 
RBH=1.03433331
HBH=102.13281397
 



--link1--
%chk=G2-10.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
AMMONIA, //b3lyp/6-31G*
 
0,1
N
X,1,1.
H,1,RNH,2,XNH
H,1,RNH,2,XNH,3,120.,0
H,1,RNH,2,XNH,3,240.,0
 
RNH=1.01940056
XNH=112.97687284
 



--link1--
%chk=G2-11.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
OH RADICAL //b3lyp/6-31G*
 
0,2
O
H,1,ROH
 
ROH=0.98267246
 



--link1--
%chk=G2-12.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
Water //b3lyp/6-31G*
 
0,1
O
H,1,OH
H,1,OH,2,HOH
 
 OH=0.96874889
 HOH=103.66330094
 



--link1--
%chk=G2-13.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
HYDROGEN FLUORIDE, //b3lyp/6-31G*
 
0,1
F
H,1,R
 
 R=0.933891
 



--link1--
%chk=G2-14.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
SIH2 singlet //b3lyp/6-31G*
 
0,1
Si
X,1,1.
H,1,R,2,A
H,1,R,2,A,3,180.,0
 
 R=1.53065307
 A=45.59755585
  



--link1--
%chk=G2-15.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
SIH2 3B1 //b3lyp/6-31G*
 
0,3
Si
X,1,1.
H,1,R,2,A
H,1,R,2,A,3,180.,0
 
 R=1.49136629
 A=59.12543327
 



--link1--
%chk=G2-16.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
SIH3 c3v //b3lyp/6-31G*
 
0,2
Si
X,1,1.
H,1,R,2,BETA
H,1,R,2,BETA,3,120.,0
H,1,R,2,BETA,3,-120.,0
 
 R=1.48898721
 BETA=108.02552928
 



--link1--
%chk=G2-17.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
SIH4 //b3lyp/6-31G*
 
0,1
Si
H,1,R
H,1,R,2,109.471221
H,1,R,2,109.471221,3,120.,0
H,1,R,2,109.471221,3,-120.,0
 
 R=1.48598655
 



--link1--
%chk=G2-18.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
ph2 doublet //b3lyp/6-31G*
 
0,2
P
X,1,1.
H,1,R,2,A
H,1,R,2,A,3,180.,0
 
 R=1.43044019
 A=45.80225056
 



--link1--
%chk=G2-19.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
PH3 c3v //b3lyp/6-31G*
 
0,1
P
X,1,1.
H,1,R,2,BETA
H,1,R,2,BETA,3,120.,0
H,1,R,2,BETA,3,-120.,0
 
 R=1.42430407
 BETA=122.85357649
 



--link1--
%chk=G2-20.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
SH2  //b3lyp/6-31G*
 
0,1
S
X,1,1.
H,1,R,2,A
H,1,R,2,A,3,180.,0
 
 R=1.34974999
 A=46.39389033
 



--link1--
%chk=G2-21.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
HCL //b3lyp/6-31G*
 
0,1
Cl
H,1,R
 
 R=1.28991833
 



--link1--
%chk=G2-22.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
DILITHIUM //b3lyp/6-31G*
 
0,1
LI
LI,1,R
 
 R=2.7230522




--link1--
%chk=G2-23.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
Lithium Fluoride, //b3lyp/6-31g*
 
0,1
LI
F,1,LiF
 
LiF=1.55170308
 



--link1--
%chk=G2-24.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
ACETYLENE //b3lyp/6-31g*
 
0,1
C
C,1,CC
X,2,1.,1,90.
H,2,CH,3,90.,1,180.,0
X,1,1.,2,90.,3,180.,0
H,1,CH,5,90.,2,180.,0
 
CC=1.20496699
CH=1.06661997
 



--link1--
%chk=G2-25.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
ETHYLENE //b3lyp/6-31g*
 
0,1
C
C,1,RCC
H,1,RCH,2,HCC
H,1,RCH,2,HCC,3,180.,0
H,2,RCH,1,HCC,3,0.,0
H,2,RCH,1,HCC,3,180.,0
 
RCC=1.33093238
RCH=1.08746872
HCC=121.86515828
 



--link1--
%chk=G2-26.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
ETHANE //b3lyp/6-31g*
 
0,1
C
C,1,AA
H,1,AH,2,HAA
H,1,AH,2,HAA,3,120.,0
H,1,AH,2,HAA,3,-120.,0
H,2,AH,1,HAA,3,180.,0
H,2,AH,1,HAA,6,120.,0
H,2,AH,1,HAA,6,-120.,0
 
AA=1.53063863
AH=1.09618054
HAA=111.34246599
 



--link1--
%chk=G2-27.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
CYANO RADICAL, 2-SIGMA-PLUS, //b3lyp/6-31g*
 
0,2
C
N,1,R
 
R=1.17392061
 



--link1--
%chk=G2-28.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
HYDROGEN CYANIDE //b3lyp/6-31g*
 
0,1
C
N,1,AB
X,1,1.,2,90.
H,1,AH,3,90.,2,180.,0
 
AB=1.15705957
AH=1.07039626
 



--link1--
%chk=G2-29.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
CARBON MONOXIDE //b3lyp/6-31g*
 
0,1
O
C,1,RCO
 
RCO=1.13793816
 



--link1--
%chk=G2-30.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
HCO BENT CS, //b3lyp/6-31g*
 
0,2
C
O,1,CO
H,1,CH,2,HCO
 
CO=1.18271512
CH=1.12830969
HCO=123.65060441
 



--link1--
%chk=G2-31.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
H2CO //b3lyp/6-31g*
 
0,1
O
C,1,RCO
H,2,RH,1,THETA
H,2,RH,1,THETA,3,180.,0
 
RCO=1.20648509
THETA=122.37640093
RH=1.11044484
 



--link1--
%chk=G2-32.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
METHANOL //b3lyp/6-31g*
 
0,1
C
O,1,AB
H,1,AH3,2,H3AB
H,2,BH9,1,H9BA,3,180.,0
X,1,1.,2,BAH12,3,180.,0
H,1,AH1,5,H1AH2,2,90.,0
H,1,AH1,5,H1AH2,2,-90.,0
 
AB=1.41919435
AH1=1.10117667
AH3=1.09346715
BH9=0.96865998
H1AH2=54.22417123
BAH12=131.27350844
H3AB=106.64369205
H9BA=107.57953769
 



--link1--
%chk=G2-33.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
Nitrogen N2, //b3lyp/6-31g* opt=z-matrix
 
0,1
N
N,1,NN
 
NN=1.10549853
 



--link1--
%chk=G2-34.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
H2NNH2 //b3lyp/6-31g* opt=z-matrix
 
0,1
N
N,1,AA
H,1,AH4,2,H4AA
H,1,AH5,2,H5AA,3,H4AH5,1
H,2,AH4,1,H4AA,3,H4AAH7,0
H,2,AH5,1,H5AA,5,H4AH5,1
 
AA=1.4373691
AH4=1.02194422
AH5=1.01729305
H4AA=111.78265471
H5AA=106.64309317
H4AH5=106.81573564
H4AAH7=25.8658655
 



--link1--
%chk=G2-35.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
NO radical, 2pi, //b3lyp/6-31g* opt=z-matrix
 
0,2
N
O,1,r
 
r=1.15869834
 



--link1--
%chk=G2-36.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
O2 //b3lyp/6-31g* opt=z-matrix
 
0,3
O
O,1,r
 
r=1.21453434
 



--link1--
%chk=G2-37.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
HYDROGEN PEROXIDE //b3lyp/6-31g* opt=z-matrix
 
0,1
O
O,1,AA
H,1,AH4,2,H4AA
H,2,AH4,1,H4AA,3,H4AAH8,0
 
AA=1.4557049
AH4=0.97363519
H4AA=99.66701987
H4AAH8=118.66374246
 



--link1--
%chk=G2-38.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;
 
F2 //b3lyp/6-31g* opt=z-matrix
 
0,1
F
F,1,FF
 
FF=1.40325215
 



--link1--
%chk=G2-39.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
CO2 D*H //b3lyp/6-31g*
 
0,1
C
O,1,R
X,1,1.000000,2,90.000000
O,1,R,3,90.000000,2,180.000000,0
 
R=1.16915425
 



--link1--
%chk=G2-40.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
na2 //b3lyp/6-31G*
 
0,1
Na
Na,1,R
 
R=3.03883602
 



--link1--
%chk=G2-41.chk 
#P B3LYP/6-31+g(d,p) scf=tight guess(alter) iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
SI2 3-SGG //b3lyp/6-31g* alter beta 13 14
 
0,3
Si
Si,1,R
 
 R=2.17109251
 

13 14




--link1--
%chk=G2-42.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
P2 //b3lyp/6-31g*
 
0,1
P
P,1,PP
 
PP=1.90449329
 



--link1--
%chk=G2-43.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
S2 //b3lyp/6-31g*
 
0,3
S
S,1,R
 
R=1.92739053
 



--link1--
%chk=G2-44.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
CL2 //b3lyp/6-31g*
 
0,1
Cl
Cl,1,R
 
R=2.04231295
 



--link1--
%chk=G2-45.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
Sodium Chloride NaCl, //b3lyp/6-31g*
 
0,1
NA
CL,1,NaCl
 
NaCl=2.37576315
 



--link1--
%chk=G2-46.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
SIO //b3lyp/6-31g*
 
0,1
Si
O,1,sio
 
sio=1.52385166
 



--link1--
%chk=G2-47.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
Carbon monosulfide, CS, //b3lyp/6-31g*
 
0,1
C
S,1,CS
 
CS=1.54765317
 



--link1--
%chk=G2-48.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
OS //b3lyp/6-31g* opt=z-matrix
 
0,3
O
S,1,OS
 
OS=1.51776141
 



--link1--
%chk=G2-49.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
CLO 2-PI //b3lyp/6-31g*
 
0,2
Cl
O,1,R
 
R=1.61959205
 



--link1--
%chk=G2-50.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
CLF 1-SG //b3lyp/6-31g*
 
0,1
F
Cl,1,R1
 
R1=1.66405576
 



--link1--
%chk=G2-51.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
si2h6 //b3lyp/6-31g*
 
0,1
Si
Si,1,R
H,1,SIH,2,SICC
H,1,SIH,2,SICC,3,120.,0
H,1,SIH,2,SICC,3,-120.,0
H,2,SIH,1,SICC,3,180.,0
H,2,SIH,1,SICC,6,120.,0
H,2,SIH,1,SICC,6,-120.,0
 
SICC=110.60481212
SIH=1.48914466
R=2.35023138
 



--link1--
%chk=G2-52.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
Methyl chloride, CH3Cl C3v //b3lyp/6-31g*
 
0,1
C
CL,1,CCl
H,1,CH,2,HCCl
H,1,CH,2,HCCl,3,120.,0
H,1,CH,2,HCCl,3,240.,0
 
CCl=1.80320288
CH=1.09011507
HCCl=108.51648869
 



--link1--
%chk=G2-53.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
H3C-SH METHANETHIOL STAGGERED //b3lyp/6-31g*
 
0,1
C
S,1,CS
H,2,SH,1,CSH
H,1,CHA,2,HACS,3,180.,0
X,1,1.,2,XCS,3,0.,0
H,1,CHB,5,HALF,2,90.,0
H,1,CHB,5,HALF,2,-90.,0
 
CS=1.83564514
SH=1.3505588
CHA=1.09257403
CHB=1.09241027
CSH=96.98562022
HACS=106.23506816
XCS=129.74508671
HALF=55.07649095
 



--link1--
%chk=G2-54.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
HOCl //b3lyp/6-31g*
 
0,1
O
H,1,OH
Cl,1,OCl,2,HOCl
 
 OH=0.97555677
 OCl=1.72794541
 HOCl=102.48786676
 



--link1--
%chk=G2-55.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6; 
 
SO2 //b3lyp/6-31G*
 
0,1
S
O,1,SO
O,1,SO,2,OSO
 
SO=1.46359695
OSO=119.10217046





--link1--
%chk=G2-56.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

BF3 PLANAR B3LYP 6-31G* geometry

0,1
B
F,1,BF
F,1,BF,2,120.
F,1,BF,2,120.,3,180.,0

 BF=1.31772295




--link1--
%chk=G2-57.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

bcl3 B3LYP 6-31G* geometry 

0,1
B
X,1,1.
X,1,1.,2,90.
Cl,1,R2,2,ALPHA,3,0.,0
Cl,1,R2,2,ALPHA,3,120.,0
Cl,1,R2,2,ALPHA,3,-120.,0

 R2=1.75274159
 ALPHA=90.




--link1--
%chk=G2-58.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ALf3  B3LYP 6-31G* geometry 

0,1
Al
X,1,1.
X,1,1.,2,90.
F,1,R2,2,ALPHA,3,0.,0
F,1,R2,2,ALPHA,3,120.,0
F,1,R2,2,ALPHA,3,-120.,0

 R2=1.63908394
 ALPHA=90.




--link1--
%chk=G2-59.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

 alcl3 B3LYP 6-31G* geometry 

0,1
Al
X,1,1.
X,1,1.,2,90.
Cl,1,R2,2,ALPHA,3,0.,0
Cl,1,R2,2,ALPHA,3,120.,0
Cl,1,R2,2,ALPHA,3,-120.,0

 R2=2.08744849
 ALPHA=90.




--link1--
%chk=G2-60.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

cf4  B3LYP 6-31G* geometry 

0,1
C
F,1,R
F,1,R,2,A
F,1,R,2,A,3,120.,0
F,1,R,2,A,3,-120.,0

 R=1.32937451
 A=109.47122063




--link1--
%chk=G2-61.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ccl4  B3LYP 6-31G* geometry 

0,1
C
Cl,1,R
Cl,1,R,2,A
Cl,1,R,2,A,3,120.,0
Cl,1,R,2,A,3,-120.,0

 R=1.79265109
 A=109.47122063




--link1--
%chk=G2-62.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

O=C=S. Singlet Sigma(+) B3LYP 6-31G* geometry 

0,1
O
C,1,C-O
X,2,1.,1,90.
S,2,C-S,3,90.,1,180.,0

 C-O=1.16492344
 C-S=1.57427936




--link1--
%chk=G2-63.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CS2 B3LYP 6-31G* geometry 

0,1
S
C,1,r1
X,2,1.,1,90.
S,2,r1,3,90.,1,180.,0

 r1=1.5631656




--link1--
%chk=G2-64.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

 COF2 B3LYP 6-31G* geometry 

0,1
O
C,1,CO
F,2,CF,1,FCO
F,2,CF,1,FCO,3,180.,0

 CO=1.18026296
 CF=1.32239607
 FCO=126.07788494




--link1--
%chk=G2-65.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

sif4  B3LYP 6-31G* geometry 

0,1
Si
F,1,sif
F,1,sif,2,109.47122063
F,1,sif,2,109.47122063,3,120.,0
F,1,sif,2,109.47122063,3,-120.,0

  sif=1.57905278




--link1--
%chk=G2-66.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

sicl4, td 1a1, B3LYP 6-31G* geometry 

0,1
Si
Cl,1,r
Cl,1,r,2,109.47122063
Cl,1,r,2,109.47122063,3,109.47122063,1
Cl,1,r,2,109.47122063,3,109.47122063,-1

r=2.04746151




--link1--
%chk=G2-67.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

nno B3LYP 6-31G* geometry 

0,1
N
N,1,r1
X,2,1.,1,90.
O,2,r2,3,90.,1,180.,0

 r1=1.13435115
 r2=1.1923951
 




--link1--
%chk=G2-68.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

clno B3LYP 6-31G* geometry 

0,1
Cl
N,1,r1
O,2,r2,1,a

 r1=2.00507901
 r2=1.14212673
 a=113.94985326




--link1--
%chk=G2-69.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

nf3 c3v  B3LYP 6-31G* geometry 

0,1
N
X,1,1.
F,1,R,2,BETA
F,1,R,2,BETA,3,120.,0
F,1,R,2,BETA,3,-120.,0

 R=1.38391963
 BETA=116.30747818




--link1--
%chk=G2-70.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

pf3 c3v  B3LYP 6-31G* geometry 

0,1
P
X,1,1.
F,1,R,2,BETA
F,1,R,2,BETA,3,120.,0
F,1,R,2,BETA,3,-120.,0

 R=1.5959273
 BETA=119.61586513




--link1--
%chk=G2-71.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ozone 1-a1 B3LYP 6-31G* geometry 

0,1
O
O,1,r
O,2,r,1,a

 r=1.26435929
 a=117.92287929




--link1--
%chk=G2-72.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

f2o  B3LYP 6-31G* geometry 

0,1
F
O,1,r1
X,2,1.,1,90.
F,2,r1,3,a,1,180.,0

 r1=1.40891796
 a=166.07508234




--link1--
%chk=G2-73.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CLF3, C2V B3LYP 6-31G* geometry -758.2017685

0,1
Cl
F,1,R1
F,1,R2,2,A1
F,1,R2,2,A1,3,180.,0

 R1=1.65104512
 R2=1.72862693
 A1=87.1076401




--link1--
%chk=G2-74.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CF2=CF2 D2H SINGLET B3LYP 6-31G* geometry 

0,1
C
C,1,C2-C1
F,1,C-F,2,F-C-C
F,1,C-F,2,F-C-C,3,180.,0
F,2,C-F,1,F-C-C,3,0.,0
F,2,C-F,1,F-C-C,3,180.,0

 C2-C1=1.32551808
 C-F=1.32432207
 
 F-C-C=123.13412096




--link1--
%chk=G2-75.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

cl2c=ccl2 B3LYP 6-31G* geometry 

0,1
C
C,1,cc
Cl,1,ccl,2,cccl
Cl,1,ccl,2,cccl,3,180.,0
Cl,2,ccl,1,cccl,3,180.,0
Cl,2,ccl,1,cccl,3,0.,0

 cc=1.34675858
 ccl=1.73127512
 cccl=122.47219158




--link1--
%chk=G2-76.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

cf3cn B3LYP 6-31G*  geometry 

0,1
C
C,1,r1
F,1,R,2,A
F,1,R,2,A,3,120.,0
F,1,R,2,A,3,-120.,0
X,2,1.,1,90.,3,0.,0
N,2,r2,6,90.,1,180.,0

 r1=1.48356667
 r2=1.15764311
 R=1.33830927
 A=110.06187828



--link1--
%chk=G2-77.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

PROPYNE C3V B3LYP 6-31G* geometry 

0,1
C
C,1,R1
X,1,1.,2,90.
C,1,R2,3,90.,2,180.,0
X,2,1.,1,90.,3,0.,0
H,2,R3,5,90.,1,180.,0
H,4,R4,1,THETA1,3,0.,0
H,4,R4,1,THETA1,7,120.,0
H,4,R4,1,THETA1,7,-120.,0

 R1=1.20716163
 R2=1.46072439
 R3=1.06604906
 R4=1.09647694
 THETA1=111.17437048




--link1--
%chk=G2-78.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ALLENE  D2D B3LYP 6-31G* geometry 

0,1
C
C,1,R1
X,1,1.,2,90.
C,1,R1,3,90.,2,180.,0
H,2,R2,1,THETA1,3,0.,0
H,2,R2,1,THETA1,3,180.,0
H,4,R2,1,THETA1,3,90.,0
H,4,R2,1,THETA1,3,-90.,0

 R1=1.30683002
 R2=1.08822774
 THETA1=121.55115214




--link1--
%chk=G2-79.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CYCLOPROPENE C2V B3LYP 6-31G* geometry 

0,1
X
C,1,R1
C,1,R2,2,90.
C,1,R2,2,90.,3,180.,0
H,2,R3,1,THETA1,3,90.,0
H,2,R3,1,THETA1,3,-90.,0
H,3,R4,1,THETA2,2,180.,0
H,4,R4,1,THETA2,2,180.,0

 R1=1.36279839
 R2=0.64744345
 R3=1.09475715
 R4=1.07976902
 THETA1=123.4894802
 THETA2=149.86562277




--link1--
%chk=G2-80.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

PROPENE CS B3LYP 6-31G* geometry 

0,1
C
C,1,R1
H,1,R2,2,THETA1
H,1,R3,2,THETA2,3,180.,0
H,2,R4,1,THETA3,4,0.,0
C,2,R5,1,THETA4,5,180.,0
H,6,R6,2,THETA5,5,180.,0
X,6,1.,2,THETA6,5,0.,0
H,6,R7,8,THETA7,2,90.,0
H,6,R7,8,THETA7,2,-90.,0

 R1=1.33337529
 R2=1.08851751
 R3=1.08675279
 R4=1.09114675
 R5=1.50216239
 R6=1.09522828
 R7=1.09843254
 THETA1=121.64706661
 THETA2=121.8195312
 THETA3=118.84981094
 THETA4=125.21285063
 THETA5=111.49386433
 THETA6=127.20106315
 THETA7=53.28528043




--link1--
%chk=G2-81.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CYCLOPROPANE D3H B3LYP 6-31G* geometry 

0,1
C
X,1,1.
C,1,R1,2,150.
C,1,R1,2,150.,3,180.,0
H,1,R2,2,THETA1,3,90.,0
H,1,R2,2,THETA1,3,-90.,0
X,3,1.,1,150.,2,0.,0
H,3,R2,7,THETA1,1,90.,0
H,3,R2,7,THETA1,1,-90.,0
X,4,1.,1,150.,2,0.,0
H,4,R2,10,THETA1,1,90.,0
H,4,R2,10,THETA1,1,-90.,0

 R1=1.50867948
 R2=1.08673752
 THETA1=56.96367653




--link1--
%chk=G2-82.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

PROPANE C2V B3LYP 6-31G* geometry 

0,1
C
X,1,1.
C,1,R1,2,THETA1
C,1,R1,2,THETA1,3,180.,0
H,1,R2,2,THETA2,3,90.,0
H,1,R2,2,THETA2,3,-90.,0
H,3,R3,1,THETA3,2,180.,0
H,4,R3,1,THETA3,2,180.,0
X,3,1.,1,THETA4,2,0.,0
H,3,R4,9,THETA5,1,90.,0
H,3,R4,9,THETA5,1,-90.,0
X,4,1.,1,THETA4,2,0.,0
H,4,R4,12,THETA5,1,90.,0
H,4,R4,12,THETA5,1,-90.,0

 R1=1.53217085
 R2=1.09852524
 R3=1.09613878
 R4=1.0971989
 THETA1=56.44689823
 THETA2=126.97489387
 THETA3=111.55412317
 THETA4=127.49968236
 THETA5=53.73444174




--link1--
%chk=G2-83.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

TRANS-1,3-BUTADIENE C2H B3LYP 6-31G* geometry 

0,1
C
C,1,CDC
C,2,CSC,1,CCC
C,3,CDC,2,CCC,1,180.,0
H,1,CH1,2,CC1,3,180.,0
H,1,CH2,2,CC2,3,0.,0
H,2,CH3,1,CC3,3,180.,0
H,3,CH3,4,CC3,2,180.,0
H,4,CH2,3,CC2,2,0.,0
H,4,CH1,3,CC1,2,180.,0

CDC=1.34054111
CSC=1.45747113
CH1=1.08576026
CH2=1.08793795
CH3=1.09045613
CCC=124.31048212
CC1=121.82705922
CC2=121.53880082
CC3=119.43908311




--link1--
%chk=G2-84.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Dimethyl acetylene (2-butyne). D3h (eclipsed). B3LYP/6-31G* Geometry

0,1
C
C,1,CCS
X,2,1.00000,1,90.00000
C,2,CCT,3,90.00000,1,180.00000,0
X,4,1.00000,2,90.00000,3,0.00000,0
C,4,CCS,5,90.00000,2,180.00000,0
H,1,CH,2,HCC,3,0.00000,0
H,1,CH,2,HCC,3,120.00000,0
H,1,CH,2,HCC,3,-120.00000,0
H,6,CH,4,HCC,7,0.00000,0
H,6,CH,4,HCC,7,120.00000,0
H,6,CH,4,HCC,7,-120.00000,0
 
CCS=1.46150625
CCT=1.20917083
CH=1.09706726
HCC=111.38649086




--link1--
%chk=G2-85.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Methylene cyclopropane. C2v symm. b3lyp/6-31G* Geom. 
 
0,1
C,0.,0.,0.3180248749
C,0.7701458752,0.,-0.9339108919
C,-0.7701458752,0.,-0.9339108919
C,0.,0.,1.6404275776
H,1.2794364824,-0.9127151459,-1.2405794722
H,1.2794364824,0.9127151459,-1.2405794722
H,-1.2794364824,0.9127151459,-1.2405794722
H,-1.2794364824,-0.9127151459,-1.2405794722
H,0.9272099346,0.,2.2092669381
H,-0.9272099346,0.,2.2092669381




--link1--
%chk=G2-86.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Bicyclo[1.1.0]butane. C2v symm. b3lyp/6-31G* Geometry
 
0,1
C,1.1377491531,0.,0.3121231238
C,-1.1377491531,0.,0.3121231238
C,0.,-0.7468230522,-0.3157626481
C,0.,0.7468230522,-0.3157626481
H,1.2479214368,0.,1.4011668432
H,2.0853046366,0.,-0.2261545013
H,-1.2479214368,0.,1.4011668432
H,-2.0853046366,0.,-0.2261545013
H,0.,-1.43084391,-1.1531751956
H,0.,1.43084391,-1.1531751956
 



--link1--
%chk=G2-87.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CYCLOBUTENE  b3lyp 6-31G* geometry 

0,1
X
X,1,R
C,1,CDC,2,90.
C,1,CDC,2,90.,3,180.,0
C,2,CSC,1,90.,3,0.,0
C,2,CSC,1,90.,3,180.,0
H,3,CH1,1,HCX,2,180.,0
H,4,CH1,1,HCX,2,180.,0
X,5,1.,2,ZCY,1,180.,0
X,6,1.,2,ZCY,1,180.,0
H,5,CH3,9,HAL,2,90.,0
H,5,CH3,9,HAL,2,-90.,0
H,6,CH3,10,HAL,2,90.,0
H,6,CH3,10,HAL,2,-90.,0

R=1.5143378
CDC=0.67023784
CSC=0.78602384
CH1=1.0871737
HCX=133.60549231
ZCY=135.89597619
CH3=1.0971253
HAL=54.19566979




--link1--
%chk=G2-88.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CYCLOBUTANE b3lyp/6-31G* geometry 

0,1
X
X,1,1.
X,1,1.,2,90.
X,1,1.,3,90.,2,180.,0
C,1,R,2,A,3,0.,0
C,1,R,2,A,3,180.,0
C,1,R,4,A,3,90.,0
C,1,R,4,A,3,-90.,0
H,5,RH1,1,A1,2,180.,0
H,5,RH2,1,A2,2,0.,0
H,6,RH1,1,A1,2,180.,0
H,6,RH2,1,A2,3,0.,0
H,7,RH1,1,A1,4,180.,0
H,7,RH2,1,A2,4,0.,0
H,8,RH1,1,A1,4,180.,0
H,8,RH2,1,A2,4,0.,0

R=1.0914082
RH1=1.0950072
RH2=1.09569171
A=83.43113504
A1=137.05340826
A2=114.54750566




--link1--
%chk=G2-89.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Isobutene. Single bonds trans. C2v symm. b3lyp/6-31G* Geometry
 
0,1
C,0.,0.,-1.4594417966
C,0.,0.,-0.1227712649
H,0.9248052707,0.,-2.0312656256
H,-0.9248052707,0.,-2.0312656256
C,1.2782648385,0.,0.6788939524
H,2.1630344335,0.,0.0349475379
H,1.3327918899,0.8800596873,1.3347967791
H,1.3327918899,-0.8800596873,1.3347967791
C,-1.2782648385,0.,0.6788939524
H,-2.1630344335,0.,0.0349475379
H,-1.3327918899,-0.8800596873,1.3347967791
H,-1.3327918899,0.8800596873,1.3347967791




--link1--
%chk=G2-90.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Trans butane B3LYP/6-31G* geometry 

0,1
C
C,1,dcc1
C,2,dcc2,1,accc
C,3,dcc1,2,accc,1,180.,0
H,1,dch1,2,ach1,3,180.,0
H,4,dch1,3,ach1,2,180.,0
H,1,dch2,2,ach2,3,thccc2,0
H,1,dch2,2,ach2,3,-thccc2,0
H,4,dch2,3,ach2,2,thccc2,0
H,4,dch2,3,ach2,2,-thccc2,0
H,2,dch3,3,ach3,4,thccc3,0
H,2,dch3,3,ach3,4,-thccc3,0
H,3,dch3,2,ach3,1,thccc3,0
H,3,dch3,2,ach3,1,-thccc3,0

dcc1=1.5319297
dcc2=1.53421807
accc=113.25309719
dch1=1.09600386
ach1=111.51409286
dch2=1.09714092
ach2=111.15193307
thccc2=59.83286461
dch3=1.09955628
ach3=109.15744745
thccc3=57.70792046




--link1--
%chk=G2-91.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

isobutane B3LYP/6-31G* geometry 

0,1
C
H,1,RCH1
C,1,RCC,2,A1
H,3,RCH2,1,A2,2,180.,0
X,3,1.,1,A3,4,180.,0
H,3,RCH3,5,A4,1,90.,0
H,3,RCH3,5,A4,1,-90.,0
C,1,RCC,2,A1,3,120.,0
H,8,RCH2,1,A2,2,180.,0
X,8,1.,1,A3,9,180.,0
H,8,RCH3,10,A4,1,90.,0
H,8,RCH3,10,A4,1,-90.,0
C,1,RCC,2,A1,3,-120.,0
H,13,RCH2,1,A2,2,180.,0
X,13,1.,1,A3,14,180.,0
H,13,RCH3,15,A4,1,90.,0
H,13,RCH3,15,A4,1,-90.,0

RCC=1.53533269
RCH1=1.10053474
RCH2=1.09808372
RCH3=1.09665667
A1=107.76867937
A2=110.8489623
A3=128.22406411
A4=53.91139669




--link1--
%chk=G2-92.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Spiropentane. D2d symm. b3lyp/6-31G* Geometry
 
0,1
X
C 1 1.
X 2 r 1 90.
X 2 r 1 90. 3 180.
C 3 ra 2 90. 1 90.
C 3 ra 2 90. 1 -90.
C 4 ra 2 90. 1 0.
C 4 ra 2 90. 1 180.
H 5 rh 3 ah 2 t1
H 5 rh 3 ah 2 -t1
H 6 rh 3 ah 2 -t1
H 6 rh 3 ah 2 t1
H 7 rh 4 ah 2 t1
H 7 rh 4 ah 2 -t1
H 8 rh 4 ah 2 -t1
H 8 rh 4 ah 2 t1
 
r=1.27305905
ra=0.76471759
rh=1.08816375
ah=117.7243034
t1=108.45079893




--link1--
%chk=G2-93.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Benzene B3LYP 6-31G* geometry 

0,1
X
C,1,r1
C,1,r1,2,60.
C,1,r1,3,60.,2,180.,0
C,1,r1,4,60.,3,180.,0
C,1,r1,5,60.,4,180.,0
C,1,r1,6,60.,5,180.,0
H,2,r2,3,120.,4,180.,0
H,3,r2,4,120.,5,180.,0
H,4,r2,5,120.,6,180.,0
H,5,r2,6,120.,7,180.,0
H,6,r2,7,120.,2,180.,0
H,7,r2,2,120.,3,180.,0

r1=1.39661479
r2=1.08700711




--link1--
%chk=G2-94.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

DIFLUOROMETHANE C2V B3LYP/6-31G* geometry 

0,1
C
X,1,1.
F,1,CF,2,XCF
F,1,CF,2,XCF,3,180.,0
H,1,CH,2,XCH,3,90.,0
H,1,CH,2,XCH,3,-90.,0

CF=1.36109343
CH=1.09576573
XCF=54.56753191
XCH=123.87134226




--link1--
%chk=G2-95.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

HCF3 TRI-FLUOROMETHANE  B3LYP/6-31G* geometry 

0,1
C
H,1,CH
F,1,CF,2,FCH
F,1,CF,2,FCH,3,120.,0
F,1,CF,2,FCH,3,-120.,0

CH=1.09277054
CF=1.34203912
FCH=110.36172274




--link1--
%chk=G2-96.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CH2CL2 C2V B3LYP/6-31G* geometry 

0,1
C
X,1,1.
Cl,1,CCl,2,HClX
Cl,1,CCl,2,HClX,3,180.,0
H,1,CH,2,HCX,3,90.,0
H,1,CH,2,HCX,3,-90.,0

CCl=1.79088554
CH=1.08757434
HClX=56.65320917
HCX=124.25124469




--link1--
%chk=G2-97.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

chcl3  B3LYP/6-31G* geometry 

0,1
C
H,1,R
Cl,1,R1,2,A
Cl,1,R1,2,A,3,120.,0
Cl,1,R1,2,A,3,-120.,0

R=1.08553635
R1=1.78773686
A=107.50826708




--link1--
%chk=G2-98.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

METHYLAMINE b3lyp 6-31G* geometry 

0,1
C
N,1,AB
H,1,AH3,2,H3AB
X,2,1.,1,ABH78,3,0.,0
H,2,BH7,4,H7BH8,1,90.,0
H,2,BH7,4,H7BH8,1,-90.,0
X,1,1.,2,BAH12,3,180.,0
H,1,AH1,7,H1AH2,2,90.,0
H,1,AH1,7,H1AH2,2,-90.,0

AB=1.46535367
AH1=1.09550333
AH3=1.10449986
BH7=1.01861268
BAH12=123.38826416
H3AB=115.7748966
ABH78=123.77663792
H1AH2=53.6000727
H7BH8=52.89335705




--link1--
%chk=G2-99.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Acetonitrile. CH3-CN. C3v symm. b3lyp/6-31G* Geometry
 
0,1
C
C,1,CC
X,2,1.,1,90.
N,2,CN,3,90.,1,180.,0
H,1,CH,2,HCC,3,0.,0
H,1,CH,2,HCC,5,120.,0
H,1,CH,2,HCC,5,240.,0

CC=1.46160249
CN=1.16025904
CH=1.09452453
HCC=110.31276371
 



--link1--
%chk=G2-100.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

NITRO METHANE ch3no2 B3LYP 6-31G* geometry 

0,1
 C
 N,1,rn1
 O,2,ro1,1,ao1
 O,2,ro2,1,ao2,3,to2,0
 H,1,rh1,2,ah1,3,th1,0
 H,1,rh2,2,ah2,5,th2,0
 H,1,rh3,2,ah3,5,th3,0
      Variables:
 rn1=1.49919618
 ro1=1.22676523
 ao1=117.0213243
 ro2=1.22676165
 ao2=117.02212404
 to2=181.89178544
 rh1=1.09240838
 ah1=106.82918485
 th1=89.04662497
 rh2=1.08852848
 ah2=108.05601167
 th2=118.84300819
 rh3=1.0885295
 ah3=108.0557423
 th3=-118.84193037




--link1--
%chk=G2-101.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Methyl-nitrite. CH3-O-N=O. NOCH trans, ONOC cis. Cs symm. b3lyp/6-31G* Geometry
 
0,1
  C                                                -0.300866612806     -1.109171081997      0.733883245961
  O                                                -0.312851485960      0.329259600313      0.763333044419
  H                                                -0.698563726169     -1.405382247113      1.704197699762
  H                                                 0.717436251461     -1.486085106060      0.599421681415
  H                                                -0.931944167677     -1.485987626515     -0.076570471881
  N                                                 0.160376826346      0.958159774757     -0.391225042374
  O                                                 0.512101633705      0.210917610470     -1.249520287638
  




--link1--
%chk=G2-102.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Methylsilane. CH3-SiH3. C3v symm. b3lyp/6-31G* Geometry
 
0,1
C
Si,1,SiC
H,1,CH,2,HCSi
H,1,CH,2,HCSi,3,120.,0
H,1,CH,2,HCSi,3,240.,0
H,2,SiH,1,HSiC,3,180.,0
H,2,SiH,1,HSiC,6,120.,0
H,2,SiH,1,HSiC,6,240.,0
 
SiC=1.88859042
CH=1.09552797
SiH=1.48953333
HCSi=111.0156463
HSiC=110.84558134




--link1--
%chk=G2-103.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Formic Acid. HCOOH. HOCO cis. Cs symm. b3lyp/6-31G* Geometry
 
0,1
O
C,1,RA
X,2,1.,1,A
O,2,RB,3,A,1,180.,0
H,1,R1,2,A1,3,0.,0
H,2,R4,1,A4,4,180.,0
 
RA=1.34724842
RB=1.20472567
R1=0.97740415
R4=1.09964234
A=62.60226564
A1=106.64234264
A4=109.35129373
 



--link1--
%chk=G2-104.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Methyl formate. HCOOCH3. Cs symm. b3lyp/6-31G* Geometry
 
0,1
C,-0.9204903101,-0.0627200183,-0.1599419274
O,-0.9069883055,1.1437412726,-0.1573168467
O,0.1408944498,-0.8630878216,0.0242794682
H,-1.8146166931,-0.6854346266,-0.3154329494
C,1.3926523924,-0.1831298703,0.2419191994
H,2.1341130304,-0.9714038931,0.3705592817
H,1.6405513681,0.4435581449,-0.6185700722
H,1.3357306465,0.443152098,1.135879136




--link1--
%chk=G2-105.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

acetamide ch3cohn2 b3lyp/6-31g* geometry

0 1
c1
c2 c1 rc2
o1 c2 ro1 c1 ao1
n1 c2 rn1 o1 an1 c1 tn1
h1 n1 rh1 c2 ah1 o1 th1
h2 n1 rh2 c2 ah2 h1 th2
h3 c1 rh3 c2 ah3 o1 th3
h4 c1 rh4 c2 ah4 h3 th4
h5 c1 rh5 c2 ah5 h3 th5

 rc2=1.52316421
 ro1=1.22126322
 ao1=122.30670158
 rn1=1.36949683
 an1=122.26031609
 tn1=179.69564918
 rh1=1.01046569
 ah1=117.90359934
 th1=4.97155447
 rh2=1.0080086
 ah2=122.68458623
 rh3=1.09448709
 ah3=113.93131647
 th3=173.18310305
 rh4=1.09494054
 ah4=108.80819051
 th4=121.6529972
 rh5=1.09349446
 ah5=108.61457196
 th5=-121.78094916
 th2=168.54597414




--link1--
%chk=G2-106.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Aziridine. (cyclic CH2CH2NH). C2v symm. b3lyp/6-31G* Geometry
 
0,1
C,0.0342806532,0.3974627423,0.7425016446
N,0.0471070071,-0.874619445,0.
C,0.0342806532,0.3974627423,-0.7425016446
H,-0.8865994948,-1.285237551,0.
H,0.9497975775,0.6160289895,1.2875600468
H,0.9497975775,0.6160289895,-1.2875600468
H,-0.8770562739,0.7029813895,1.2546822265
H,-0.8770562739,0.7029813895,-1.2546822265




--link1--
%chk=G2-107.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Cyanogen. NCCN. D*h symm. b3lyp/6-31G* Geometry
 
0,1
N,0.,0.,1.8539909259
C,0.,0.,0.6902279316
C,0.,0.,-0.6902279316
N,0.,0.,-1.8539909259




--link1--
%chk=G2-108.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

DIMETHYLAMINE  b3lyp 6-31G* geometry 

0,1
C
N,1,RAB
X,2,1.,1,ALPHA
C,2,RAB,3,ALPHA,1,180.,0
X,1,1.,2,90.,3,B16,0
X,4,1.,2,90.,3,-B16,0
H,1,R16,2,A16,5,0.,0
H,1,R27,2,A27,5,B27,0
H,1,R38,2,A38,5,-B38,0
H,2,R4,3,A4,1,90.,0
H,4,R16,2,A16,6,0.,0
H,4,R27,2,A27,6,-B27,0
H,4,R38,2,A38,6,B38,0

RAB=1.45737114
R16=1.10737446
R27=1.09522872
R38=1.09691878
R4=1.01793127
ALPHA=56.37006244
A16=114.42106502
A27=109.6284231
A38=109.24156111
A4=126.18121689
B16=54.94866805
B27=121.82583641
B38=120.41535782




--link1--
%chk=G2-109.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

TRANS ETHYLAMINE  b3lyp 6-31G* geometry 

0,1
C
C,1,RA
X,2,1.,1,ALPHA
N,2,RB,3,ALPHA,1,180.,0
X,1,1.,2,90.,3,180.,0
H,1,R1,2,A1,5,0.,0
H,1,R23,2,A23,5,B23,0
H,1,R23,2,A23,5,-B23,0
H,2,R45,3,A45,1,B45,0
H,2,R45,3,A45,1,-B45,0
H,4,R67,2,A67,3,B67,0
H,4,R67,2,A67,3,-B67,0

RA=1.53433259
RB=1.46733604
R1=1.09744016
R23=1.09766131
R45=1.09741524
R67=1.0199965
ALPHA=57.99165664
A1=111.53723231
A23=110.98368012
A45=126.91609839
A67=109.38481148
B23=120.14233562
B45=91.55640429
B67=57.61986012




--link1--
%chk=G2-110.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

KETENE B3LYP 6-31G* geometry 

0,1
C
C,1,R
H,1,RH,2,A
H,1,RH,2,A,3,180.00000,0
X,2,1.00000,1,90.00000,3,0.00000,0
O,2,RO,5,90.00000,1,180.00000,0

R=1.31493498
RH=1.08272621
RO=1.17138194
A=119.79095715




--link1--
%chk=G2-111.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

 OXIRANE B3LYP 6-31G* geometry 

  0,1
  X
  C,1,XC
  O,1,XO,2,90.
  C,1,XC,3,90.,2,180.,0
  X,2,1.,1,YCX,3,180.,0
  H,2,CH,5,HCY,1,90.,0
  H,2,CH,5,HCY,1,-90.,0
  X,4,1.,1,YCX,3,180.,0
  H,4,CH,8,HCY,1,90.,0
  H,4,CH,8,HCY,1,-90.,0

XC=0.73454169
XO=1.22754243
YCX=157.67707007
CH=1.09038487
HCY=57.60406144




--link1--
%chk=G2-112.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Acetaldehyde B3LYP 6-31G* geometry 

0,1
O
C,1,rco
H,2,rch2,1,aoch
C,2,rcc,1,aocc,3,180.,0
H,4,rch4a,2,accha,1,0.,0
H,4,rch4b,2,acchb,1,t1,0
H,4,rch4b,2,acchb,1,-t1,0

rco=1.21082857
rch2=1.11398159
rcc=1.50800063
rch4a=1.09233555
rch4b=1.09812901
aoch=120.46777663
aocc=124.63589771
accha=110.41675613
acchb=109.88112067
t1=121.4761766




--link1--
%chk=G2-113.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Glyoxal, O=CH-CH=O. Trans, C2h symm. b3lyp/6-31G* Geom. 
 
0,1
C1
C2,C1,rcc
O1,C1,rco,C2,a1
H,C1,rch,C2,a2,O1,180.0,0
O2,C2,rco,C1,a1,O1,180.,0
H,C2,rch,C1,a2,O1,0.,0

rcc=1.52501583
rco=1.20949276
rch=1.10918789
a1=121.52291302
a2=114.69886473
 



--link1--
%chk=G2-114.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ETHANOL TRANS B3LYP 6-31G* geometry 

0,1
C
C,1,CC
O,2,CO,1,OCC
H,3,OH,2,HOC,1,180.,0
X,2,1.,1,XCC,3,180.,0
H,2,CH,5,A1,1,90.,0
H,2,CH,5,A1,1,-90.,0
H,1,CH3,2,H3CC,3,180.,0
X,1,1.,2,YCC,3,0.,0
H,1,CH4,9,A2,2,90.,0
H,1,CH4,9,A2,2,-90.,0

CC=1.51956941
CO=1.42572482
OCC=107.71524991
OH=0.96900438
HOC=107.79856599
XCC=125.0944652
CH=1.10250643
A1=53.62321638
CH3=1.09570069
H3CC=110.65569583
YCC=126.38970148
CH4=1.09498698
A2=54.09129196




--link1--
%chk=G2-115.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

DIMETHYL ETHER, B3LYP 6-31G* geometry 

0,1
C
O,1,RAB
X,2,1.,1,A
C,2,RAB,3,A,1,180.,0
X,1,1.,2,90.,3,180.,0
X,4,1.,2,90.,3,180.,0
H,1,R16,2,A16,5,0.,0
H,1,R2378,2,A2378,5,B2378,0
H,1,R2378,2,A2378,5,-B2378,0
H,4,R16,2,A16,6,0.,0
H,4,R2378,2,A2378,6,B2378,0
H,4,R2378,2,A2378,6,-B2378,0

RAB=1.40992541
R16=1.09339324
R2378=1.10287588
A=56.15772762
A16=107.25555218
A2378=111.8119498
B2378=119.29533062




--link1--
%chk=G2-116.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Thiooxirane. (cyclic CH2-S-CH2 ring). C2v symm. b3lyp/6-31G* Geom.
 
0,1
C,0.741167814,0.8054998119,0.
S,0.,-0.8753990055,0.
C,-0.741167814,0.8054998119,0.
H,1.2584073082,1.0850965864,-0.9145221968
H,1.2584073082,1.0850965864,0.9145221968
H,-1.2584073082,1.0850965864,0.9145221968
H,-1.2584073082,1.0850965864,-0.9145221968




--link1--
%chk=G2-117.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Dimethylsulfoxide. (CH3)2SO. Cs symm. b3lyp/6-31G* Geom. 
 
0,1
S
O,1,so
C,1,cs1,2,cso
C,1,cs2,2,cso2,3,csoc,0
H,3,ch,1,hcs,2,h1cso,0
H,4,ch2,1,h2cs,2,h2cso,0
H,3,ch3,1,h3cs,5,h3csh,0
H,3,ch4,1,h4cs,5,h4csh,0
H,4,ch5,1,h5cs,6,h5csh2,0
H,4,ch6,1,h6cs,6,h6csh2,0

 so=1.5114085
 cs1=1.83770409
 cs2=1.83771322
 ch=1.09410106
 ch2=1.09268537
 ch3=1.09442764
 ch4=1.09268782
 ch5=1.09442505
 ch6=1.09410226
 cso=107.50620065
 cso2=107.50200825
 hcs=109.50111417
 h2cs=106.98728585
 h3cs=109.97908203
 h4cs=106.99006392
 h5cs=109.98044754
 h6cs=109.50242758
 csoc=102.14479943
 h1cso=51.65428836
 h2cso=66.9445925
 h3csh=122.18005901
 h4csh=-118.6141157
 h5csh2=119.20652942
 h6csh2=-118.61313292
 



--link1--
%chk=G2-118.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Thioethanol. CH3-CH2-SH. Cs symm. b3lyp/6-31G* Geom. 
 
0,1
C,0.0705120458,-1.4573954415,0.8284820118
C,0.0706032755,0.0699899665,0.8296505525
S,-0.0772163303,0.6847564096,-0.9073116523
H,-0.0525448241,2.0037488688,-0.6173179623
H,-0.7704122641,0.4525580601,1.4153010181
H,0.9984824652,0.4525675725,1.2647672455
H,0.1578428518,-1.8317736624,1.8546666253
H,-0.8561325083,-1.8543900243,0.4006016721
H,0.9115336364,-1.8543805185,0.2501724526




--link1--
%chk=G2-119.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ch3sch3  B3LYP 6-31G* geometry 

0,1
C
S,1,RAB
X,2,1.,1,A
C,2,RAB,3,A,1,180.,0
X,1,1.,2,90.,3,180.,0
X,4,1.,2,90.,3,180.,0
H,1,R16,2,A16,5,0.,0
H,1,R2378,2,A2378,5,B2378,0
H,1,R2378,2,A2378,5,-B2378,0
H,4,R16,2,A16,6,0.,0
H,4,R2378,2,A2378,6,B2378,0
H,4,R2378,2,A2378,6,-B2378,0

RAB=1.82580526
R16=1.09329676
R2378=1.09471502
A=49.80953519
A16=107.09654581
A2378=111.30515525
B2378=118.71196407
 



--link1--
%chk=G2-120.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Vinyl fluoride, H2C=CHF. Cs symm. b3lyp/6-31G* Geom. 
 
0,1
C1
C2,C1,rcc
F,C1,rcf,C2,a1
H,C1,rhc,C2,ahc,F,180.,0
H1,C2,rha,C1,aha,F,0.,0
H2,C2,rhb,C1,ahb,F,180.,0

rcc=1.32477149
rcf=1.34778181
rhc=1.08640791
rha=1.08467974
rhb=1.08374696
a1=122.4741017
ahc=125.72207263
aha=121.50511614
ahb=119.71364096
 



--link1--
%chk=G2-121.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Ethyl chloride. CH3-CH2-Cl. Cs symm. b3lyp/6-31G* Geom. 
 
0,1
C
C,1,cc
Cl,1,ccl,2,cccl
H,1,ch1,2,h1cc,3,h1cccl,0
H,1,ch1,2,h1cc,3,-h1cccl,0
H,2,ch3,1,h3cc,3,180.,0
H,2,ch4,1,h4cc,6,hcch,0
H,2,ch4,1,h4cc,6,-hcch,0

cc=1.51878601
ccl=1.82181061
ch1=1.09166594
ch3=1.09734368
ch4=1.09390727
cccl=111.58518858
h1cc=111.98358927
h3cc=109.23599589
h4cc=111.16667227
h1cccl=118.67648209
hcch=119.53194352
 



--link1--
%chk=G2-122.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Vinyl chloride, H2C=CHCl. Cs symm. b3lyp/6-31G* Geom. 
 
0,1
C1
C2,C1,rcc
Cl,C1,rccl,C2,a1
H,C1,rhc,C2,ahc,Cl,180.,0
H1,C2,rha,C1,aha,Cl,0.,0
H2,C2,rhb,C1,ahb,Cl,180.,0

rcc=1.32728793
rccl=1.75132138
rhc=1.08417891
rha=1.08498965
rhb=1.08606335
a1=123.41795741
ahc=124.17371969
aha=122.57986903
ahb=119.41146718
 



--link1--
%chk=G2-123.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

h2c=chcn B3LYP 6-31G* geometry 

0,1
C
C,1,RA
X,2,1.,1,A
C,2,RB,3,A,1,180.,0
H,1,R1,2,A1,3,0.,0
H,1,R2,2,A2,3,180.,0
H,2,R4,1,A4,3,180.,0
X,3,1.,2,A5,1,0.,0
N,3,RN,8,A5,2,180.,0

A5=132.24887659
RN=2.29993865
RA=1.33863262
RB=1.43102978
R1=1.08546126
R2=1.08532922
R4=1.08747364
A=61.45059868
A1=121.87548909
A2=120.66258701
A4=121.22554889




--link1--
%chk=G2-124.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ACETONE B3LYP 6-31G* geometry 

0,1
O
C,1,CO
C,2,CC,1,CCO
C,2,CC,1,CCO,3,180.,0
H,3,C-HIN,2,HIN-C-C,1,0.,0
H,4,C-HIN,2,HIN-C-C,1,0.,0
X,3,1.,2,XCC,1,180.,0
X,4,1.,2,XCC,1,180.,0
H,3,CH,7,HHCH,5,90.,0
H,3,CH,7,HHCH,5,270.,0
H,4,CH,8,HHCH,6,90.,0
H,4,CH,8,HHCH,6,270.,0

CO=1.21569247
CC=1.52053642
C-HIN=1.09174928
CH=1.09739497
CCO=121.73294379
HIN-C-C=109.82835997
XCC=126.00372708
HHCH=53.39138364




--link1--
%chk=G2-125.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CH3COOH ACETIC ACID single bonds TRANS B3LYP 6-31G* geometry

0,1
C
O,1,CDO
O,1,CSO,2,OCO
H,3,OH,1,HOC,2,0.,0
C,1,CC,2,CCO,3,180.,0
H,5,CH,1,HCC,3,180.,0
X,5,1.,1,XCC,3,0.,0
H,5,CHP,7,HAL,1,90.,0
H,5,CHP,7,HAL,1,-90.,0

 CDO=1.21006886
 CSO=1.35891944
 OCO=122.43206907
 OH=0.97575643
 HOC=105.88549333
 CC=1.50810083
 CCO=126.19762409
 CH=1.09010605
 HCC=109.52252299
 XCC=125.26344985
 CHP=1.0949747
 HAL=53.65936849




--link1--
%chk=G2-126.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CH3CFO HCCO CIS B3LYP 6-31G* geometry 

0,1
C
O,1,co
F,1,cf,2,fco
C,1,cc,2,cco,3,180.,0
H,4,ch1,1,h1cc,2,0.,0
H,4,ch2,1,h2cc,2,hcco,0
H,4,ch2,1,h2cc,2,-hcco,0

co=1.19038568
cf=1.36270354
cc=1.50014117
ch1=1.09017909
ch2=1.0950597
fco=120.57845698
cco=129.08781785
h1cc=109.96680842
h2cc=109.64917534
hcco=121.23034195




--link1--
%chk=G2-127.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ch3c(o)cl hcco cis B3LYP 6-31G* geometry 

0,1
C
C,1,cc
Cl,1,ccl,2,cccl
O,1,co,2,cco,3,180.,0
H,2,ch,1,hcc,4,0.,0
H,2,ch2,1,h2cc,5,hcch,0
H,2,ch2,1,h2cc,5,-hcch,0

cc=1.50396188
ccl=1.83438954
co=1.18713355
ch=1.09202164
ch2=1.0943179
cccl=111.67292061
cco=128.04760265
hcc=109.03442969
h2cc=109.74484983
hcch=121.02696626




--link1--
%chk=G2-128.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ch3ch2ch2cl B3LYP 6-31G* geometry 

0,1
C
X,1,1.
C,1,R1,2,THETA1
C,1,R1a,2,theta1a,3,180.,0
H,1,R2,2,THETA2,3,90.,0
H,1,R2,2,THETA2,3,-90.,0
H,3,R3,1,THETA3,2,180.,0
Cl,4,R5,1,theta6,2,180.,0
X,3,1.,1,THETA4,2,0.,0
H,3,R4,9,THETA5,1,90.,0
H,3,R4,9,THETA5,1,-90.,0
X,4,1.,1,THETA4a,2,0.,0
H,4,R4a,12,THETA5a,1,90.,0
H,4,R4a,12,THETA5a,1,-90.,0

R1a=1.52309438
R1=1.53450477
R2=1.09616
R3=1.09513102
R4=1.09654921
R4a=1.09254388
THETA1=54.73579058
THETA2=126.58788234
theta1a=56.51992893
THETA3=110.60770195
THETA4=128.40127449
THETA5=53.89018205
THETA4a=129.44505213
THETA5a=54.39150454
R5=1.82004582
theta6=111.91183995




--link1--
%chk=G2-129.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Isopropyl alcohol, (CH3)2CH-OH. Gauche isomer. C1 symm. b3lyp/6-31G* Geom.
 
0,1
O
C1,O,r1
H1,C1,r2,O,a1
H,O,roh,C1,aoh,H1,toh,0
C2,C1,r3a,O,a2a,H1,t1a,0
C3,C1,r3b,O,a2b,H1,-t1b,0
H,C2,r4a,C1,a4a,H1,t2a,0
H,C3,r5a,C1,a5a,H1,-t2b,0
H,C2,r4b,C1,a4b,H1,t3a,0
H,C3,r5b,C1,a5b,H1,-t3b,0
H,C2,r4c,C1,a4c,H1,-t4a,0
H,C3,r5c,C1,a5c,H1,t4b,0

r1=1.43111827
r2=1.9557364
roh=2.07916264
r3a=1.52393712
r3b=1.53017411
r4a=1.09587708
r5a=1.09583825
r4b=1.09448657
r5b=1.09801539
r4c=1.0954512
r5c=1.0964078
a1=28.22171182
aoh=30.02045037
a2a=106.21524706
a2b=111.13113306
a4a=110.2041443
a5a=110.24366741
a4b=110.29321839
a5b=111.03931704
a4c=110.82961388
a5c=111.23833611
toh=-62.32359188
t1a=179.44473237
t1b=57.80032287
t2a=63.0172795
t2b=83.272013
t3a=-56.37337218
t3b=-36.4963859
t4a=176.72748761
t4b=156.21533884
 



--link1--
%chk=G2-130.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Methyl ethyl ether. CH3-CH2-O-CH3. Trans. Cs symm. b3lyp/6-31G* Geom.
 
0,1
O
C,1,R2
C,1,R3,2,A3
C,2,R4,1,A4,3,180.00000,0
H,2,R5,1,A5,3,D5,0
H,2,R5,1,A5,3,-D5,0
H,3,R7,1,A7,2,180.00000,0
H,3,R8,1,A8,2,D8,0
H,3,R8,1,A8,2,-D8,0
H,4,R10,2,A10,1,D10,0
H,4,R10,2,A10,1,-D10,0
H,4,R12,2,A12,1,180.00000,0

R2=1.41675112
R3=1.40988351
R4=1.51994245
R5=1.10428107
R7=1.093453
R8=1.10273501
R10=1.0947991
R12=1.09563348
A3=112.75284332
A4=108.46400259
A5=110.13979657
A7=107.26869591
A8=111.84043784
A10=110.46751022
A12=110.51510558
D5=-58.85684437
D8=-60.70965124
D10=-59.85049125
 



--link1--
%chk=G2-131.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Trimethyl Amine. (CH3)3N. C3v symm. b3lyp/6-31G* Geom. 
 
0,1
X
N,1,1.
C,2,rcn,1,a1
C,2,rcn,1,a1,3,120.,0
C,2,rcn,1,a1,3,-120.,0
H,3,rha,2,a2,1,180.,0
H,3,rhb,2,a3,1,t1,0
H,3,rhb,2,a3,1,-t1,0
H,4,rha,2,a2,1,180.,0
H,4,rhb,2,a3,1,t1,0
H,4,rhb,2,a3,1,-t1,0
H,5,rha,2,a2,1,180.,0
H,5,rhb,2,a3,1,t1,0
H,5,rhb,2,a3,1,-t1,0

rcn=1.45475726
rha=1.10926927
rhb=1.09573835
a1=107.30072668
a2=113.31044557
a3=109.72330209
t1=59.30128084
 



--link1--
%chk=G2-132.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

FURAN  B3LYP 6-31G* geometry 

0,1
O
X,1,OX
C,2,XC,1,90.
C,2,XC,1,90.,3,180.,0
X,2,XY,3,90.,1,180.,0
C,5,YC,2,90.,3,0.,0
C,5,YC,2,90.,3,180.,0
H,3,CH,1,HCO,2,180.,0
H,4,CH,1,HCO,2,180.,0
H,6,CHP,5,HCY,2,180.,0
H,7,CHP,5,HCY,2,180.,0

OX=0.81367085
XC=1.09489291
XY=1.30740989
YC=0.71790462
CH=1.07933212
HCO=115.63424245
CHP=1.08112572
HCY=127.40321931




--link1--
%chk=G2-133.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

Thiophene b3lyp 6-31G* geometry 

0,1
S
C,1,rcs
C,1,rcs,2,a1
C,2,rcdc,1,a2,3,0.,0
C,3,rcdc,1,a2,2,0.,0
H,2,r2h,1,a2h,3,180.,0
H,3,r2h,1,a2h,2,180.,0
H,4,r4h,2,a4h,1,180.,0
H,5,r4h,3,a4h,1,180.,0

rcs=1.7360563
rcdc=1.36739579
r2h=1.08161314
r4h=1.08474673
a1=91.51094962
a2=111.49586594
a2h=120.09583864
a4h=123.32881129




--link1--
%chk=G2-134.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

PYROLE PLANAR b3lyp 6-31g* geometry 

0,1
H
N,1,NH
X,2,1.,1,90.
X,2,NX,3,90.,1,180.,0
C,4,XC,2,90.,3,0.,0
C,4,XC,2,90.,3,180.,0
X,4,XY,5,90.,2,180.,0
C,7,YC,4,90.,5,0.,0
C,7,YC,4,90.,5,180.,0
H,5,CH2,2,H2CC,1,0.,0
H,6,CH2,2,H2CC,1,0.,0
H,8,CH3,5,H3CC,2,180.,0
H,9,CH3,6,H3CC,2,180.,0

NH=1.00787619
NX=0.79067081
XC=1.12540557
XY=1.31502864
YC=0.71255006
CH2=1.08043314
CH3=1.08172219
H2CC=121.0773847
H3CC=125.7102192




--link1--
%chk=G2-135.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

C2v Pyridine B3LYP 6-31G* geometry 

0,1
X
X,1,1.
N,2,NXC,1,90.
C,2,NXC,1,90.,3,180.,0
C,2,RC2,1,90.,3,DC2,0
C,2,RC2,1,90.,3,-DC2,0
C,2,RC3,1,90.,4,DC3,0
C,2,RC3,1,90.,4,-DC3,0
X,4,1.,2,90.,1,0.,0
H,4,RH1,9,90.,2,180.,0
H,5,RH2,3,AH2,2,180.,0
H,6,RH2,3,AH2,2,180.,0
H,7,RH3,4,AH3,2,180.,0
H,8,RH3,4,AH3,2,180.,0

NXC=1.40331232
RC2=1.34182681
RC3=1.38343024
RH1=1.08687965
RH2=1.08912453
RH3=1.08616833
AH2=115.93585371
AH3=121.29965942
DC2=58.3424315
DC3=60.04559113




--link1--
%chk=G2-136.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

H2 B3LYP/6-31G* geometry 

0,1
H
H,1,r

r=0.74264369




--link1--
%chk=G2-137.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

SH b3lyp/6-31G* geometry 
 
0,2
S
H,1,R
 
R=1.35543613
 



--link1--
%chk=G2-138.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

CCH B3LYP 6-31G* geometry nonlinear

0,2
c1
c2 c1 rc2
x1 c2 1.0 c1 90.0
h1 c2 rh1 x1 90.0 c1 th1

 rc2=1.22704003
 rh1=1.07018202
 th1=-162.45731362




--link1--
%chk=G2-139.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

 C2H3 CS,2-A'  b3lyp 6-31G* geometry 

0,2
C
C,1,RCC
H,1,RCH1,2,ACH1
H,1,RCH2,2,ACH2,3,180.,0
H,2,RCH3,1,ACH3,3,0.,0

RCC=1.31023204
RCH1=1.0959437
RCH2=1.09036509
RCH3=1.08322575
ACH1=122.17811549
ACH2=122.30091994
ACH3=137.50747491




--link1--
%chk=G2-140.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

 ch3co hcco cis 2-a' b3lyp 6-31g* geometry 

0,2
C
C,1,CC
H,1,CH1,2,H1CC
X,1,1.,2,XCC,3,180.,0
H,1,CH2,4,HCX,2,90.,0
H,1,CH2,4,HCX,2,-90.,0
X,2,1.,1,90.,3,0.,0
O,2,CO,7,OCX,1,180.,0

CC=1.51705372
CH1=1.09673202
CH2=1.0950498
CO=1.18915198
H1CC=111.51713621
XCC=122.84016015
HCX=53.57981779
OCX=37.87178741




--link1--
%chk=G2-141.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

H2COH C1   b3lyp/6-31G*  geometry 

0,2
C
O,1,CO
H,2,OH,1,HOC
H,1,CH1,2,H1CO,3,PH1,0
H,1,CH2,2,H2CO,3,PH2,0

CO=1.3699812
OH=0.96902921
CH1=1.08886057
CH2=1.08380624
HOC=108.90801576
H1CO=118.50457427
H2CO=112.62604267
PH1=29.28000601
PH2=176.01181272




--link1--
%chk=G2-142.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ch3o CS, 2A' b3lyp 6-31G* geometry 

0,2
C
O,1,CO
H,1,CH1,2,A1
X,1,1.,2,X1,3,180.,0
H,1,CH2,4,HCX,2,90.,0
H,1,CH2,4,HCX,2,-90.,0

CO=1.36931862
CH1=1.11032167
CH2=1.10308272
A1=105.20448108
X1=134.83566105
HCX=55.47841476




--link1--
%chk=G2-143.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ch3ch2o  2A'' b3lyp 6-31G* geometry 

0,2
 C
 C,1,B1
 O,2,B2,1,A1
 H,2,B3,1,A2,3,D1,0
 H,2,B4,1,A3,3,D2,0
 H,1,B5,2,A4,3,D3,0
 H,1,B6,2,A5,3,D4,0
 H,1,B7,2,A6,3,D5,0
      Variables:
 B1=1.52856788
 B2=1.37079906
 B3=1.1084392
 B4=1.11176045
 B5=1.09640652
 B6=1.09512304
 B7=1.0947971
 A1=115.40481159
 A2=111.92740689
 A3=110.85275409
 A4=110.96387281
 A5=110.36004269
 A6=110.43614952
 D1=125.66488732
 D2=-119.44115211
 D3=178.15968089
 D4=-61.84506983
 D5=57.67426569



--link1--
%chk=G2-144.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

ch3s 2-A'   b3lyp 6-31G*  geometry 

0,2
C
S,1,R
H,1,ch1,2,hcs
X,1,1.,2,alpha,3,180.,0
H,1,ch,4,hch2,3,90.,0
H,1,ch,4,hch2,3,-90.,0

R=1.81256567
ch=1.09351119
hcs=106.82996657
ch1=1.09887196
hch2=55.32746965
alpha=130.50070297




--link1--
%chk=G2-145.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

c2h5 staggered Cs 2-A' b3lyp 6-31g* geometry 

0,2
C
C,1,RCC
H,1,R1,2,A1
X,1,1.,2,X1,3,180.,0
H,1,R2,4,A2,2,90.,0
H,1,R2,4,A2,2,-90.,0
X,2,1.,1,X2,3,0.,0
H,2,R3,7,A3,1,90.,0
H,2,R3,7,A3,1,-90.,0

RCC=1.48936945
R1=1.10529134
R2=1.09701109
R3=1.08546443
A1=112.13113048
X1=129.25454486
A2=54.01302883
X2=171.53419822
A3=58.6932455




--link1--
%chk=G2-146.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

(ch3)2ch Cs 2A' b3lyp 6-31g* geometry 

0,2
c1
x1 c1 1.0
x2 c1 1.0 x1 90.0
x3 c1 1.00 x2 90.0 x1 90.0
c2 c1 rc2 x1 90.0 x3 tc2
c3 c1 rc2 x1 90.0 x3 -tc2
h1 c1 rh1 x2 90.0 x3 th1
h2 c2 rh2 c1 ah2 c3 th2
h3 c3 rh2 c1 ah2 c2 -th2
h4 c2 rh4 c1 ah4 h2 th4
h5 c2 rh5 c1 ah5 h2 th5
h6 c3 rh4 c1 ah4 h3 -th4
h7 c3 rh5 c1 ah5 h3 -th5

rc2=1.49278841
tc2=119.36176246
rh1=1.08776261
th1=-13.68721693
rh2=1.09598824
ah2=111.94844128
th2=166.03899954
rh4=1.10606929
ah4=112.23599989
th4=120.01472402
rh5=1.09933549
ah5=111.52123676
th5=-121.14926786




--link1--
%chk=G2-147.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

TERT-BUTYL RADICAL C3V  b3lyp 6-31G* geometry 

0,2
C
X,1,1.
C,1,CC,2,CCX
C,1,CC,2,CCX,3,120.,0
C,1,CC,2,CCX,3,-120.,0
X,3,1.,1,XCC,2,0.,0
H,3,CH1,1,H1CC,6,180.,0
H,3,CH2,6,HCX,1,90.,0
H,3,CH2,6,HCX,1,-90.,0
X,4,1.,1,XCC,2,0.,0
H,4,CH1,1,H1CC,10,180.,0
H,4,CH2,10,HCX,1,90.,0
H,4,CH2,10,HCX,1,-90.,0
X,5,1.,1,XCC,2,0.,0
H,5,CH1,1,H1CC,14,180.,0
H,5,CH2,14,HCX,1,90.,0
H,5,CH2,14,HCX,1,-90.,0

CC=1.4974949
CH1=1.10709549
CH2=1.09754396
XCC=129.18006387
H1CC=112.18931802
HCX=54.06363192
CCX=96.10000574




--link1--
%chk=G2-148.chk 
#P B3LYP/6-31+g(d,p) scf=tight iop(5/33=1) 
extraoverlay 

8/10=90/1;9/16=-3/6;

NO2 RADICAL 2A1, B3LYP 6-31G* geometry 

0,2
N
O,1,NO
O,1,NO,2,ONO

 NO=1.20310253
 ONO=133.83428219




