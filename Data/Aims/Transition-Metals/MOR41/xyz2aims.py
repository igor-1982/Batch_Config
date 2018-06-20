#!/usr/bin/env python3

import sys
import re
import os

target = sys.argv[1]
wff = open("geometry.in",'w')
sff = open("elec_state",'w')

ff = open(target,'r')
fs = ff.readlines()
ff.close()

try:
    num_atoms = int(fs[0])
except ValueError:
    print("ERROR: Not XYZ format")
    sys.exit()

name_sys = fs[1]

for line in fs[2:]:
    tl  = line.strip().split()
    if len(tl)==4:
        wff.write("atom%16s%16s%16s%5s\n" %(tl[1],tl[2],tl[3],tl[0]))
    else:
        print("ERROR: Not XYZ format")
        sys.exit()
sff.write('charge %6i\n' %0)
sff.write('spin   %6i\n' %1)
sff.write('atoms  %6i\n' %num_atoms)
sff.close()
wff.close()
