#!/usr/bin/env python2.7
#Purpose    :: To change xyz file to gaussian input file
#Authors    :: Igor Ying Zhang, and Xin Xu
#Version    :: 0.1(2010-05-29)

import os
import sys
import os.path
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
counter = 0
for line in file(sys.argv[1]):
    counter += 1
    if counter == 1 or counter == 2:
        pass
    else:
        tmpList = line.split()
        geomList = map(float,tmpList[1:])
        geomList = [parse_atom_name(tmpList[0].lower())] + geomList
        TmpGau.GeomList.append(Form %tuple(geomList))

TmpGau.Charge = 0
TmpGau.Spin = 1
TmpGau.CartesianFlag = True
TmpGau.TitleList = ['%s' % os.path.splitext(sys.argv[1])[0]]
TmpGau.MoreOptionDict['extraoverlay']=0
TmpGau.OptionList = ['p','b3lyp','6-311+G(3df,2p)','scf=tight','nosymm']
TmpGau.JobName = '%s' % os.path.splitext(sys.argv[1])[0]
TmpGau.ChkName = '%s' % os.path.splitext(sys.argv[1])[0]
#TmpGau.collect_Geom()
TmpGau.form_Inp()
del TmpGau
