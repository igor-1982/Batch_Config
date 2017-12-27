%nproc=8
#P TPSSTPSS/6-311+g(3df,2p) scf=tight iop(3/76=0500005000,5/33=1)
extraoverlay

8/10=90/1;9/16=-3/6;
3/5=4,6=6,7=216,11=2,16=1,25=1,30=1,74=203/1,2,3;
5/5=2,6=-2,32=1,33=1,38=5/2;

8; geometry from JPCA, 2005, 109, 2012-2018

0 2
C        1.458334    -.446365     .025478
C         .469423     .697422    -.027493
O       -1.853037    -.314659    -.053055
H        1.301764   -1.061079     .910737
H        1.366585   -1.086189    -.851118
H        2.482245    -.066879     .057150
H         .471069    1.325443     .861037
H         .533524    1.303495    -.928560
H        -.630232     .207816    -.078465
H       -2.267207     .388321     .465751




