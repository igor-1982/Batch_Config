%nproc=8
%chk=W40-11.chk
#p b3lyp/6-311+G(d,p) opt freq

N2H

0 2
H
N 1 RNH
N 2 RNN 1 AN

RNH=1.0499342
RNN=1.1791549
AN=116.521247 

