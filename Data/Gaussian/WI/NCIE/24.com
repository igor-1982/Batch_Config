%nproc=8
#P B3LYP/6-311+g(3df,2p) scf=tight iop(5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=7,6=2,8=1,11=2,16=1,25=1,30=1,67=1,74=205/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

NH3-H2O HB4

0   1
      N                -1.395591   -0.021564    0.000037
      H                -1.629811    0.961096   -0.106224
      H                -1.862767   -0.512544   -0.755974
      H                -1.833547   -0.330770    0.862307
      O                 1.568501    0.105892    0.000005
      H                 0.606736   -0.033962   -0.000628
      H                 1.940519   -0.780005    0.000222
 






