%nproc=8
%mem=7GB
%chk=bz_methane.chk
#p b3lyp 6-311+g(3df,2p) scf=tight nosymm

Estimated CCSD(T)/aug-cc-pVQZ* Level of Theory using Frozen Monomers

0    1
C        1.405731        0.000000        r
C        0.702865       -1.217399        r
C       -0.702865       -1.217399        r
C       -1.405731        0.000000        r
C       -0.702865        1.217399        r
C        0.702865        1.217399        r
C        0.000000        0.000000       -3.800000
H        2.500941        0.000000        r
H        1.250470       -2.165878        r
H       -1.250470       -2.165878        r
H       -2.500941        0.000000        r
H       -1.250470        2.165878        r
H        1.250470        2.165878        r
H        0.000000        0.000000       -2.700497
H        1.036621        0.000000       -4.166500
H       -0.518311        0.897740       -4.166500
H       -0.518311       -0.897740       -4.166500
 
r = 1.4
 
 
