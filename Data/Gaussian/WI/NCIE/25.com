%nproc=8
#P B3LYP/6-311+g(3df,2p) scf=tight iop(5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=7,6=2,8=1,11=2,16=1,25=1,30=1,67=1,74=205/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

HCONH2-HCONH2 HB5

0   1
      O          -1.141087    1.445212     .000000
      C           -.061754    2.030947     .000000
      H           -.013687    3.130169     .000000
      N           1.141087    1.435877     .000000
      H           1.217686     .416527     .000000
      H           1.971446    2.002095     .000000
      O           1.141087   -1.445212     .000000
      C            .061754   -2.030947     .000000
      H            .013687   -3.130169     .000000
      N          -1.141087   -1.435877     .000000
      H          -1.217686    -.416527     .000000
      H          -1.971446   -2.002095     .000000


 





