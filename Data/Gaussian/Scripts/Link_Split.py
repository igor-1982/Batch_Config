#!/usr/bin/env python2
#Purpose    :: To split Gaussian link file to a set of single jobs which are named by check name if possible
#Authors    :: Igor Ying Zhang, and Xin Xu
#Version    :: 0.1(2010-05-29)

import os
import sys
import re
from cStringIO  import StringIO

f = file(sys.argv[1],'r')
WorkDir = os.getcwd().strip()
HomeDir = os.getenv('HOME')
if os.getenv('IGOR_MODULES_PATH'):                                   # STRING, private module DIR
    ModuDir=os.getenv('IGOR_MODULES_PATH')
    sys.path.append(ModuDir)                                         # Append it into "sys.path"
    import gaussian_manage as gaum                                   # Import private modules
else:
    print '\n'+\
        'Error in getting grobal environment '+\
        '\"$IGOR_MODULES_PATH\" which is the direction to private modules'
    os.exit()

os.system('grep -inc \'link1\' '+sys.argv[1])
start = ''
startNum = 0
if len(sys.argv)==3:
    try:
        start = sys.argv[2]
        print "Starting flag is %s" %start
    except ValueError:
        print "Error in getting starting flag"
        os.exit()
elif len(sys.argv)==4:
    try:
        start = sys.argv[2]
        print "Starting flag is %s" %start
        startNum = int(sys.argv[3])
        print "Starting Number is %s" %startNum
    except ValueError:
        print "Error in getting starting flag or number"
        os.exit()
elif len(sys.argv)>4:
    print "Invalid input"
    os.exit()

name,postfix = os.path.splitext(sys.argv[1])
tmplist = f.read().split('--link1--\n')
IOut = file('test.out','w')
print len(tmplist)
for i in range(len(tmplist)):
    TmpGau   = gaum.GauIO(IOut,fn=None,bugctrl=1)
    TmpGau.f = StringIO(tmplist[i])
    TmpGau.get_MachAndOpt()
    TmpGau.ctrl_Option()
    TmpGau.get_TCSGR()
    TmpGau.MoreOptionDict['extraoverlay']=0
    TmpGau.OptionList = ['p','b3lyp','6-311+G(3df,2p)','scf=tight','nosymm']
    TmpGau.JobName = '%s%i' %(start,i+startNum)
    TmpGau.ChkName = '%s%i' %(start,i+startNum)
    #TmpGau.collect_Geom()
    TmpGau.form_Inp()
    del TmpGau
