%nproc=8
%mem=6000MB
#P B3LYP/6-31G scf=tight nosymm polar=dipole

B3LYP-C2H2_13
Geom@mp2/6-31G

0 1
6   6.80596364   -0.10647999   -0.00487429
1   6.81710335   -1.20350781   -0.00678740
6   5.59349821   0.54016108   -0.00312968
1   5.57773666   1.63687608   -0.00117551
6   4.31285023   -0.14552585   -0.00357136
1   4.33407208   -1.24205582   -0.00578758
6   3.09733713   0.48869696   -0.00139071
1   3.06497736   1.58397642   0.00081562
6   1.83042927   -0.23049396   -0.00186354
1   1.85434385   -1.32334511   -0.00394379
6   0.62526661   0.38464247   0.00059100
1   0.44723972   1.45729832   0.00229485
7   -0.62526661   -0.38464247   -0.00059100
8   -0.58372902   -1.66779740   0.00127657
8   -1.71283398   0.30497713   -0.00338769
6   8.09085366   0.56721785   -0.00433465
1   8.08297542   1.66431154   -0.00249857
6   9.30169288   -0.08550745   -0.00600524
1   9.30764548   -1.18264431   -0.00778131
6   10.58843302   0.58264039   -0.00534063
1   10.58420418   1.67990020   -0.00365658
6   11.79861233   -0.07282534   -0.00666321
1   11.80210744   -1.17002221   -0.00835025
6   13.08624124   0.59261911   -0.00593361
1   13.08374563   1.68995697   -0.00490658
6   14.29614271   -0.06413575   -0.00641819
1   14.29834634   -1.16138682   -0.00742521
6   15.58435600   0.59973102   -0.00563859
1   15.58291005   1.69710543   -0.00476157
6   16.79397712   -0.05790297   -0.00591317
1   16.79513535   -1.15521354   -0.00677118
6   18.08290765   0.60449060   -0.00505758
1   18.08259161   1.70187943   -0.00428957
6   19.29192462   -0.05431611   -0.00510215
1   19.29162258   -1.15170073   -0.00592215
6   20.58210093   0.60592103   -0.00427457
1   20.58361503   1.70330798   -0.00307658
6   21.78984384   -0.05497981   -0.00493013
1   21.78700773   -1.15246329   -0.00606710
6   23.08228676   0.60157602   -0.00401357
1   23.08702930   1.69893945   -0.00301362
6   24.28756523   -0.06311914   -0.00439111
1   24.28018047   -1.16075063   -0.00534303
6   25.58409977   0.58694327   -0.00335559
1   25.59459769   1.68421297   -0.00267470
6   26.78470464   -0.08463567   -0.00308308
1   26.76875998   -1.18250528   -0.00381191
6   28.08877449   0.55334084   -0.00206064
1   28.11043000   1.65016416   -0.00117187
6   29.27936918   -0.13274202   -0.00178403
1   29.24400492   -1.23057209   -0.00263166
6   30.59827049   0.47816489   -0.00098174
1   30.65655387   1.57247269   0.00085865
6   31.75533484   -0.25601345   -0.00195778
1   31.70541164   -1.34765319   -0.00351926
7   33.04785152   0.25601345   0.00195778
1   33.85009913   -0.35160956   -0.01247757
1   33.21373013   1.25154602   -0.00204995

