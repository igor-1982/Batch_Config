%nproc=8
#P TPSSTPSS/6-311+g(3df,2p) scf=tight iop(3/76=0500005000,5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=4,6=6,7=216,11=2,16=1,25=1,30=1,74=203/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

4; geometry from JPCA, 2005, 109, 2012-2018

0 2
C       -1.211487     .007968     .000407
O        1.293965    -.108694     .000133
H         .009476    -.118020     .002799
H       -1.525529    -.233250    1.010070
H       -1.430665    1.033233    -.278082
H       -1.552710    -.710114    -.737702
H        1.416636     .849894    -.000591


 



