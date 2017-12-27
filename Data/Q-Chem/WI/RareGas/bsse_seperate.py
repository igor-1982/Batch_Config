#!/usr/bin/env python
# USAGE :: only fit for PES-Rare-gas seperation

import os
import sys
import re

for item in os.listdir('.'):
    name, prefix = os.path.splitext(item)
    namelist = name.split('_')
    if len(namelist[0])==4:
        newname = [namelist[0][:2],namelist[0][2:]]
        p       = [re.compile('^ *(?P<name>%s).*$' %newname[1],re.IGNORECASE|re.MULTILINE),\
                   re.compile('^ *(?P<name>%s).*$' %newname[0],re.IGNORECASE|re.MULTILINE)]
        replace = [newname[1],newname[0]]
        for index in range(len(newname)):
            tmplist = [newname[index]]+namelist[1:]
            fn = '_'.join(tmplist)
            fn += prefix
            os.system('cp %s %s' %(item,fn))
            ff = open(fn,'r')
            fs = ff.read()
            ff.close()
            if p[index].search(fs):
                start, end = p[index].search(fs).span('name')
            else:
                raise Exception("Error in %s" %item)
            fs = fs[:start]+'@%s' %replace[index]+fs[end:]
            ff = open(fn,'w')
            ff.write(fs)
            ff.close()
        os.system('rm %s' %item)
    elif len(namelist[0])==2:
        newname = namelist[0]
        p   = re.compile('^ *(?P<name>%s).*$' %newname,re.IGNORECASE|re.MULTILINE)
        ff  = open(item,'r')
        fs  = ff.read()
        ff.close()
        if p.search(fs):
            start, end = p.search(fs).span('name')
        else:
            raise Exception("Error in %s" %item)
        fs = fs[:start]+'@%s' %newname+fs[end:]
        ff = open(item,'w')
        ff.write(fs)
        ff.close()


