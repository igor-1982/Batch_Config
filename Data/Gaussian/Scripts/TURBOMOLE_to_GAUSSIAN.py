#!/usr/bin/env python2.7
#Purpose    :: To split Gaussian link file to a set of single jobs which are named by check name if possible
#Authors    :: Igor Ying Zhang, and Xin Xu
#Version    :: 0.1(2010-05-29)

import os
import sys
import re
from StringIO  import StringIO

bohr    = 0.52917721

def parse_atom_name(lan):
    if len(lan)==1: return lan.upper()
    elif len(lan)==2:
        return '%s%s' %(lan[0].upper(),lan[1].lower())
    else:
        return lan




WorkDir = os.getcwd().strip()
HomeDir = os.getenv('HOME')
if os.getenv('IGOR_MODULES_PATH'):                                   # STRING, private module DIR
    ModuDir=os.getenv('IGOR_MODULES_PATH')
    sys.path.append(ModuDir)                                         # Append it into "sys.path"
    import gaussian_manage as gaum                                   # Import private modules
else:
    print('\n'+\
        'Error in getting grobal environment '+\
        '\"$IGOR_MODULES_PATH\" which is the direction to private modules')
    os.exit()


IOut = file('test.out','w')
TmpGau   = gaum.GauIO(IOut,fn=None,bugctrl=1)
Form = '%5s%16.8f%16.8f%16.8f'
for line in file(sys.argv[1]):
    if line.lower().find('coord')>=0 or line.lower().find('end')>=0:
        pass
    else:
        tmpList = line.split()
        geomList = map(float,tmpList[:-1])
        geomList = [x*bohr for x in geomList]
        geomList = [parse_atom_name(tmpList[-1].lower())] + geomList
        TmpGau.GeomList.append(Form %tuple(geomList))

TmpGau.Charge = 0
TmpGau.Spin = 1
TmpGau.CartesianFlag = True
TmpGau.TitleList = ['%s' % sys.argv[1]]
TmpGau.MoreOptionDict['extraoverlay']=0
TmpGau.OptionList = ['p','b3lyp','6-311+G(3df,2p)','scf=tight','nosymm']
TmpGau.JobName = '%s' % sys.argv[1]
TmpGau.ChkName = '%s' % sys.argv[1]
#TmpGau.collect_Geom()
TmpGau.form_Inp()
del TmpGau
