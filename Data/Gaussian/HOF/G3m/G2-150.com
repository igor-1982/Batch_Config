%nproc = 8
%mem   = 6000MB
#p b3lyp/6-31G(2df,p), scf=tight

Opt at the level of B3LYP/6-31G(2df,p), Etot = -1.95327491E+02, ZPE = 0.113417, TE = 0.120194

0        1
C     -1.58301159       -0.91239950       -0.00000236
C     -0.51509447       -0.10305636       -0.00000140
C      0.83347739       -0.67505942        0.00000042
C      1.98117910        0.00877334        0.00000517
C     -0.66237943        1.39742667       -0.00000030
H     -1.47450179       -1.99237138       -0.00000160
H     -2.59594728       -0.52437663       -0.00000380
H      0.87146662       -1.76315963       -0.00000191
H      2.93910810       -0.49915776        0.00000644
H      2.01113467        1.09295855        0.00000808
H     -0.18337310        1.84206072       -0.88007318
H     -1.71461763        1.69079376       -0.00001159
H     -0.18339359        1.84205665        0.88008604

