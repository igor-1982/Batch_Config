%chk=G3-172.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

benzoquinone C6H4O2 b3lyp/6-31g* = -381.4516851

0    1
  C      0.00000000      0.00000000      1.44500700
  C      0.00000000      0.00000000     -1.44500700
  O      0.00000000      0.00000000      2.66996000
  O      0.00000000      0.00000000     -2.66996000
  C      0.00000000      1.26938300      0.67153100
  C      0.00000000     -1.26938300      0.67153100
  C      0.00000000     -1.26938300     -0.67153100
  C      0.00000000      1.26938300     -0.67153100
  H      0.00000000      2.18267700      1.25994400
  H      0.00000000     -2.18267700      1.25994400
  H      0.00000000     -2.18267700     -1.25994400
  H      0.00000000      2.18267700     -1.25994400
 
 
 
