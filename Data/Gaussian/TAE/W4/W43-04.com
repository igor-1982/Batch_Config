%nproc=8
%chk=W43-04.chk
#p b3lyp/6-311+G(d,p) opt freq

BH3

0 1
B
H 1 R
H 1 R 2 OTW
H 1 R 2 OTW 3 PI

R=1.1899
OTW=120.0
PI=180.0
 
