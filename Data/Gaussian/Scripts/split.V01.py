#!/usr/bin/env python

import os
import sys
import re

f = file(sys.argv[1],'r')
WorkDir = os.getcwd().strip()
HomeDir = os.getenv('HOME')
if os.path.isfile('%s/.my_modules_path' %HomeDir):               # Load Private Modules DIR
    tmpf	= file('%s/.my_modules_path'\
        %HomeDir,'r')
    ModuDir=tmpf.read().strip()                                  # STRING, PATH of my modules
    sys.path.append(ModuDir)                                     # Append it into "sys.path"
    tmpf.close()
    import gaussian_manage as gaum                               # Import private modules
else:
    print '\n'+\
        'Error for loading \"$HOME/.my_modules_path\" \n'+\
        'which contains absolute path of personal python modules'

os.system('grep -inc \'link1\' '+sys.argv[1])
name,postfix = os.path.splitext(sys.argv[1])
os.system('mkdir %s' % name)
tmplist = f.read().split('--link1--\n')
for i in range(len(tmplist)):
    of = file('%s/G2_%s.com' %(name,i+149),'w')
    of.write(tmplist[i])
    of.close()
os.system('ls '+name)
