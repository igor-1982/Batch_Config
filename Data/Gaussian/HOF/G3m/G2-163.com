%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -3.85917486E+02, ZPE = 0.146949, TE = 0.154719

0        1
C      0.00000000        0.00000000        0.71530664
C      0.00000000        0.00000000       -0.71530664
C      0.00000000        1.24229358        1.39928397
C      0.00000000       -1.24229358        1.39928397
C      0.00000000        1.24229358       -1.39928397
C      0.00000000       -1.24229358       -1.39928397
C      0.00000000       -2.42801656        0.70703726
C      0.00000000        2.42801656        0.70703726
H      0.00000000        1.23888372        2.48526440
H      0.00000000       -1.23888372        2.48526440
C      0.00000000       -2.42801656       -0.70703726
C      0.00000000        2.42801656       -0.70703726
H      0.00000000        1.23888372       -2.48526440
H      0.00000000       -1.23888372       -2.48526440
H      0.00000000       -3.37146782        1.24292501
H      0.00000000        3.37146782        1.24292501
H      0.00000000       -3.37146782       -1.24292501
H      0.00000000        3.37146782       -1.24292501

