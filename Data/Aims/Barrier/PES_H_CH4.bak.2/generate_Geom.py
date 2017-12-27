#!/usr/bin/env python

import os, sys, re

P1 = re.compile('Input orientation:')
print sys.argv[1]
for xfile in sys.argv[1:]:
    tlist = xfile.split('.')[0].split('_')
    dname = ''
    for tc in tlist[1:]:
        dname = dname + tc + '_'
    dname = dname[:-1]
    #os.mkdir(dname)
    gf = open('%s/geometry.in' %dname,'w')
    ff = open(xfile,'r')
    fn = ff.read()
    P1P=P1.search(fn)
    ff.seek(P1P.end())
    x_count = 0
    for xline in ff.readlines():
        x_count = x_count + 1
        print xline, x_count
        if x_count >= 6 and x_count <=11:
            tlist = xline.split()
            tname = tlist[1]
            glist = [float(tvalue) for tvalue in tlist[3:]]
            if tname == '6':
                gf.write('atom    %10.6f%10.6f%10.6f  C\n' %tuple(glist))
            elif tname == '1':
                gf.write('atom    %10.6f%10.6f%10.6f  H\n' %tuple(glist))
        elif x_count > 10:
            break
    ff.close()
    gf.close()
