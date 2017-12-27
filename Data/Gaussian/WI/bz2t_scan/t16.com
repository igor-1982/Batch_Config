%nproc=8
%chk=bz2_t.chk
#P TPSSTPSS/6-311+g(3df,2p) scf=tight iop(3/76=0500005000,5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=4,6=6,7=216,11=2,16=1,25=1,30=1,74=203/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

Estimated CCSD(T)/aug-cc-pVQZ* Level of Theory using Frozen Monomers
(C-C=1.3915, C-H=1.0800), R(center-to-center)=4.99 Angstroms

0 1
C      1.39150000    -0.00000000     4.40425
H      2.47150000    -0.00000000     4.40425
C      0.69575000     1.20507434     4.40425
H      1.23575000     2.14038178     4.40425
C      0.69575000    -1.20507434     4.40425
H      1.23575000    -2.14038178     4.40425
C     -0.69575000     1.20507434     4.40425
H     -1.23575000     2.14038178     4.40425
C     -0.69575000    -1.20507434     4.40425
H     -1.23575000    -2.14038178     4.40425
C     -1.39150000    -0.00000000     4.40425
H     -2.47150000    -0.00000000     4.40425
C      0.00000000     0.00000000    -1.10425000
C     -0.00000000    -1.20507434    -1.80000000
H     -0.00000000    -2.14038178    -1.26000000
H      0.00000000     0.00000000    -0.02425000
C     -0.00000000    -1.20507434    -3.19150000
H     -0.00000000    -2.14038178    -3.73150000
C     -0.00000000     0.00000000    -3.88725000
H     -0.00000000     0.00000000    -4.96725000
C     -0.00000000     1.20507434    -3.19150000
H      0.00000000     2.14038178    -3.73150000
C      0.00000000     1.20507434    -1.80000000
H      0.00000000     2.14038178    -1.26000000





