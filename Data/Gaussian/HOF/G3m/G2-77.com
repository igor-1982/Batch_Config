%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.16664959E+02, ZPE = 0.05541, TE = 0.060353

0        1
C      0.00000170       -0.00098796        0.21990011
C      0.00000316        0.00088933        1.42135018
C      0.00000071       -0.00015001       -1.23501809
H     -0.00000327        0.00002113        2.48282210
H     -0.00000148        1.02125290       -1.63050013
H      0.88436221       -0.51051335       -1.63139636
H     -0.88436303       -0.51051204       -1.63139580

