%nproc=8
#P B3LYP/6-311+g(3df,2p) scf=tight iop(5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=7,6=2,8=1,11=2,16=1,25=1,30=1,67=1,74=205/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

C2H2-C2H2

0   1
      C                 -0.412546    1.678175   -0.000000
      C                  0.412546    2.561627   -0.000000
      H                 -1.132026    0.890809   -0.000000
      H                  1.134651    3.345770   -0.000000
      C                  0.412546   -1.678175   -0.000000
      C                 -0.412546   -2.561627   -0.000000
      H                  1.132026   -0.890809   -0.000000
      H                 -1.134651   -3.345770   -0.000000



