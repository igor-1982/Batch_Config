%nproc=8
%chk=G2-75.chk
#p b3lyp/6-311+G(d,p) opt freq

Cl2C=CCl2

0 1
 C                  0.00000000    0.00000000    0.67105100
 C                  0.00000000    0.00000000   -0.67105100
 Cl                 0.00000000    1.45874600    1.60274500
 Cl                 0.00000000   -1.45874600    1.60274500
 Cl                 0.00000000   -1.45874600   -1.60274500
 Cl                 0.00000000    1.45874600   -1.60274500 
 
