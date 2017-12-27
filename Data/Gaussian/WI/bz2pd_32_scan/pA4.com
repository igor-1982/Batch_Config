%nproc=8
%chk=bz2_pd_32.chk
#P TPSSTPSS/6-311+g(3df,2p) scf=tight iop(3/76=0500005000,5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=4,6=6,7=216,11=2,16=1,25=1,30=1,74=203/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

Estimated CCSD(T)/aug-cc-pVQZ* Level of Theory using Frozen Monomers
(C-C=1.3915, C-H=1.0800), R1=3.6, R2=1.6 Angstroms
 
  0  1
C    -0.700000000000      1.6     1.391500000000 
H    -0.700000000000      1.6     2.471500000000 
C     0.505074349366      1.6     0.695750000000 
H     1.440381785453      1.6     1.235750000000 
C    -1.905074349366      1.6     0.695750000000 
H    -2.840381785453      1.6     1.235750000000 
C     0.505074349366      1.6    -0.695750000000 
H     1.440381785453      1.6    -1.235750000000 
C    -1.905074349366      1.6    -0.695750000000 
H    -2.840381785453      1.6    -1.235750000000 
C    -0.700000000000      1.6    -1.391500000000 
H    -0.700000000000      1.6    -2.471500000000 
C     0.700000000000     -1.6    -1.391500000000 
C     1.905074349366     -1.6    -0.695750000000 
H     2.840381785453     -1.6    -1.235750000000 
H     0.700000000000     -1.6    -2.471500000000 
C     1.905074349366     -1.6     0.695750000000 
H     2.840381785453     -1.6     1.235750000000 
C     0.700000000000     -1.6     1.391500000000 
H     0.700000000000     -1.6     2.471500000000 
C    -0.505074349366     -1.6     0.695750000000 
H    -1.440381785453     -1.6     1.235750000000 
C    -0.505074349366     -1.6    -0.695750000000 
H    -1.440381785453     -1.6    -1.235750000000 

   



