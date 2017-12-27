%nproc=8
%chk=G2-41.chk
#p b3lyp/6-311+G(d,p) opt freq

SI2 3-SGG alter beta 13 14

0 3
 Si                 0.00000000    0.00000000    1.14030900
 Si                 0.00000000    0.00000000   -1.14030900 
 
