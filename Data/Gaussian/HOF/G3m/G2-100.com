%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -2.45029716E+02, ZPE = 0.049812, TE = 0.05511

0        1
C      1.32512582        0.00034588       -0.00225645
N     -0.17483110        0.00007323       -0.00980766
O     -0.72843805        1.08738554        0.00147400
O     -0.72760869       -1.08766010        0.00131053
H      1.63522963       -0.00699300        1.04429354
H      1.66386543       -0.90343326       -0.50407366
H      1.66374997        0.91068571       -0.49204030

