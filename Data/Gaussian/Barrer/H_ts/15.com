%nproc=8
#P TPSSTPSS/6-311+g(3df,2p) scf=tight iop(3/76=0500005000,5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=4,6=6,7=216,11=2,16=1,25=1,30=1,74=203/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

15; geometry from JPCA, 2005, 109, 2012-2018

0 3
C       -1.199577    -.011126    -.000030
N        1.400715     .129862     .000015
H       -1.426660    -.512932     .933057
H       -1.419907    -.591382    -.888143
H       -1.520237    1.022806    -.045783
H         .188926     .126896     .001001
H        1.570338    -.887667    -.000053




