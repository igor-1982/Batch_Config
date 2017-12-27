#!/bin/env python
import os
import sys

FileList=os.listdir('./')
for item in FileList:
    tmpList = item.split('_')
    tmpName = '%s_%s' % (sys.argv[2],item.split('_')[1])
    os.rename(item,tmpName)
    os.system('sed s/%s/%s/g %s > tmp.tt'
        %(sys.argv[1],sys.argv[2],tmpName))
    os.system('mv tmp.tt %s' %tmpName)
