%nproc=8
#P TPSSTPSS/6-311+g(3df,2p) scf=tight iop(3/76=0500005000,5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=4,6=6,7=216,11=2,16=1,25=1,30=1,74=203/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

11; geometry from JPCA, 2005, 109, 2012-2018

0  1 
      C                .000000     .000000    -.737248
      N                .000000     .000000     .432089
      H                .000000     .000000    1.426960




