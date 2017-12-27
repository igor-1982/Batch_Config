%nproc=8
%chk=W40-23.chk
#p b3lyp/6-311+G(d,p) opt freq

S2O

0 1
S
S 1 rss
O 2 rso 1 th

rss=1.89147415
rso=1.45992068
th=117.95454329 

