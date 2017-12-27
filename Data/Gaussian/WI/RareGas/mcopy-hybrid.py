#!/bin/env python
import os
import sys

FileList=os.listdir('./')
for item in FileList:
    tmpList = item.split('_')
    tmpName = '%s_%s' % (sys.argv[2],'_'.join(item.split('_')[1:]))
    os.rename(item,tmpName)
    os.system('sed s/%s/%s/g %s > tmp.tt'
        %(sys.argv[1],sys.argv[2],tmpName))
    os.system('mv tmp.tt %s' %tmpName)
    tmpString1 = "%s\ 1" % sys.argv[2]
    tmpString2 = "Ne\ 1"
    os.system('sed s/%s/%s/g %s > tmp.tt'
        %(tmpString1,tmpString2,tmpName))
    os.system('mv tmp.tt %s' %tmpName)
    tmpString1 = "%s\ " % sys.argv[2]
    tmpString2 = "Ar\ "
    os.system('sed s/%s/%s/g %s > tmp.tt'
        %(tmpString1,tmpString2,tmpName))
    os.system('mv tmp.tt %s' %tmpName)
    tmpString1 = "NeAr\-"
    tmpString2 = "Ne\-"
    os.system('sed s/%s/%s/g %s > tmp.tt'
        %(tmpString1,tmpString2,tmpName))
    os.system('mv tmp.tt %s' %tmpName)
    tmpString1 = "NeAr"
    tmpString2 = "Ar"
    os.system('sed s/%s/%s/g %s > tmp.tt'
        %(tmpString1,tmpString2,tmpName))
    os.system('mv tmp.tt %s' %tmpName)
    tmpString1 = "Ar\_"
    tmpString2 = "NeAr\_"
    os.system('sed s/%s/%s/g %s > tmp.tt'
        %(tmpString1,tmpString2,tmpName))
    os.system('mv tmp.tt %s' %tmpName)
