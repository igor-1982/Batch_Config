%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -5.65602452E+01, ZPE = 0.034388, TE = 0.038194

0        1
N      0.00011233        0.00006911        0.13781571
H     -0.00016437        0.93415719       -0.26358002
H      0.80892020       -0.46722257       -0.26358164
H     -0.80886816       -0.46700273       -0.26362004

