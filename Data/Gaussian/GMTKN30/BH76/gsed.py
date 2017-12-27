#!/usr/bin/env python2.7

import sys
import os

for line in file(sys.argv[1]):
    spin = int(line.split()[1].strip().replace('(','').replace(')',''))
    line = line.split()[0].strip()
    fname = '%s.com' %line
    print('%s,  %i' %(fname,spin+1))
    fn = open(fname,'r')
    st = fn.read()
    fn.close()
    st = st.replace(' 1\n',' %i\n' %(spin+1))
    fn = open(fname,'w')
    fn.write(st)
    fn.close()
    print(st)

    
