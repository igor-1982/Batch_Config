%nproc=8
%chk=F250.chk
#p b3lyp/6-311+G(d,p) opt freq

test

 0 1
 C               -0.063298    0.569754    0.079387
 C                1.010969   -0.506866   -0.069357
 C                2.428234    0.072595    0.008660
 S               -1.793187   -0.045293   -0.074378
 H               -1.759050   -0.877794    0.986908
 H                3.178883   -0.716055   -0.088952
 H                2.601006    0.578950    0.963346
 H                2.604881    0.799391   -0.790190
 H                0.867904   -1.026307   -1.021606
 H                0.878498   -1.259612    0.715798
 H                0.024827    1.313784   -0.716549
 H                0.038615    1.099432    1.029150
 
