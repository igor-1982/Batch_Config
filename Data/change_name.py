#!/usr/bin/env python2

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
        'Error in getting grobal environment '+\
        '\"$IGOR_MODULES_PATH\" which is the direction to private modules'
    sys.exit(1)

p1  = re.compile(' *\d+[ \t]+[\d]+ *\n')
os.listdir('%s' %WorkDir)
FileList = os.listdir('./')
for inp in FileList:
    name, postfix   = os.path.splitext(inp)
    os.system('mv %s %s%s' %(inp,sys.argv[1],inp)) 

