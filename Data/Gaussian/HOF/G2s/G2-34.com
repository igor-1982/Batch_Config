%chk=G2-34.chk
#p b3lyp/6-31+g(d,p) scf=tight iop(5/33=1) extraoverlay

H2NNH2 //b3lyp/6-31g* opt=z-matrix

0    1
  N      0.00000000      0.71868500     -0.07754800
  N      0.00000000     -0.71868500     -0.07754800
  H      0.21239100      1.09791400      0.84735500
  H     -0.94788000      1.01004600     -0.30452100
  H     -0.21239100     -1.09791400      0.84735500
  H      0.94788000     -1.01004600     -0.30452100
 
 
 
