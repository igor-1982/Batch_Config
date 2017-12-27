#!/usr/bin/env python2.7

import re
import os
import sys
WorkDir	= os.getcwd().strip()                                    # STRING, current DIR 
HomeDir	= os.getenv('HOME')                                      # STRING, Home DIR
if os.getenv('IGOR_MODULES_PATH'):                               # STRING, private module DIR
    ModuDir=os.getenv('IGOR_MODULES_PATH')
    sys.path.append(ModuDir)                                     # Append it into "sys.path"
    import gaussian_manage as gaum                               # Import private modules
    import dft_d           as dftd
    from my_io             import print_Error
    from my_io             import print_List
    from my_io             import print_String
    from my_io             import ConfigIO
    from pos_scf           import get_Freq
else:
    print '\n'+\
        'Error in getting global environment '+\
        '\"$IGOR_MODULES_PATH\" which is the direction to private modules'
    sys.exit(1)

p1  = re.compile(' *\d+[ \t]+[\d]+ *\n')
os.listdir('%s' %WorkDir)
for inp in os.listdir('./'):
    name, postfix   = os.path.splitext(inp)
    of  = file('%s.in' % name,'w')
    of.write('$molecule\n')
    f   = file(inp,'r')
    TmpFile     = f.read()
    if p1.search(TmpFile):
        Star  = p1.search(TmpFile).start()
        tmpList = []
        while TmpFile[Star-1:Star]!='\n':
            Star -= 1
        f.seek(Star)
        tmp = f.readline()
        tmp1 = tmp
        while not (tmp.strip()=='' and tmp1.strip()==''):
                tmpList.append(tmp)
                tmp1 = tmp
                tmp = f.readline()
    else:
        print 'Error in find spin and charge %s' %inp
    for x in tmpList[:-1]:
        of.write(x)
    f.close()
    of.write('$end\n')
    of.write('   \n')
    of.write('$rem\n')
    of.write('mem_static = 200\nmem_total  = 7500\nexchange = b3lyp\nbasis = G3Large\nmax_scf_cycles = 50\nscf_convergence = 7\nsymmetry = false\nxc_grid = 000075000302\n');
    of.write('$end\n')
    of.close()

