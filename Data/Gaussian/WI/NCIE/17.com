%nproc=8
#P B3LYP/6-311+g(3df,2p) scf=tight iop(5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=7,6=2,8=1,11=2,16=1,25=1,30=1,67=1,74=205/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

benzene

0   1
      C               0.000000    1.395671   -0.617158
      C              -1.208686    0.697835   -0.617158
      C              -1.208686   -0.697835   -0.617158
      C              -0.000000   -1.395671   -0.617158
      C               1.208686   -0.697835   -0.617158
      C               1.208686    0.697835   -0.617158
      H               0.000000    2.479876   -0.616998
      H              -2.147636    1.239938   -0.616998
      H              -2.147636   -1.239938   -0.616998
      H              -0.000000   -2.479876   -0.616998
      H               2.147636   -1.239938   -0.616998
      H               2.147636    1.239938   -0.616998
      
      
      
