%nproc=8
%chk=W43-09.chk
#p b3lyp/6-311+G(d,p) opt freq

HCN

0 1
H
C 1 RCH
N 2 RCN 1 180.0

RCH=1.0668
RCN=1.1564
 
