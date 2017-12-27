%nproc=8
%chk=W43-10.chk
#p b3lyp/6-311+G(d,p) opt freq

HOF

0 1
H
O 1 ROH
F 2 ROF 1 AN

ROH=0.96648572
ROF=1.43475410
AN=97.77978996 

