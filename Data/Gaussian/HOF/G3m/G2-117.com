%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -5.53217556E+02, ZPE = 0.079019, TE = 0.085635

0        1
S     -0.00000785        0.24665722       -0.43538287
O      0.00004107        1.48979782        0.38638079
C      1.35789842       -0.81020052        0.18350549
C     -1.35791127       -0.81015299        0.18359557
H      1.26925034       -0.91054645        1.26807776
H     -2.29064601       -0.30163454       -0.06677066
H      1.32332216       -1.78619188       -0.30738053
H      2.29063870       -0.30171429       -0.06690556
H     -1.32339424       -1.78614818       -0.30728692
H     -1.26921332       -0.91049719        1.26816393

