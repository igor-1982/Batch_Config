%nproc=8
#P TPSSTPSS/6-311+g(3df,2p) scf=tight iop(3/76=0500005000,5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=4,6=6,7=216,11=2,16=1,25=1,30=1,74=203/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

ts9; geometry from JPCA, 2005, 109, 2012-2018

-1 1
      F                  .022536    -.007453     .005529
      C                 -.018420     .005037    1.764925
      H                 1.048050     .005240    1.854146
      H                 -.547819     .934707    1.792224
      H                 -.548955    -.923433    1.805762
      O                  .001265     .019200    3.750599
      H                 -.926763     .031615    3.997581
      
      


