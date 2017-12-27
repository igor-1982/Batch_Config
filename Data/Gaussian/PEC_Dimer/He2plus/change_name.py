#!/usr/bin/env python2

import os
import sys

FileList = os.listdir('./')
for inp in FileList:
    if inp!="change_name.py":
        os.system('mv %s %s' %(inp,inp.replace('H2',sys.argv[1])))
