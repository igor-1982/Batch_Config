%nproc=8
%chk=W42-13.chk
#p b3lyp/6-311+G(d,p) opt freq

N2O

0 1
N
N 1 RNN
X 1 ONE 2 PI2
O 1 RNO 3 PI2 2 PI

RNN=1.1291
RNO=1.1870
PI2=90.0
PI=180.0
ONE=1.0 

