#!/usr/bin/env python

import os
import sys
import re

def check_result(dirpath,check_dir):

    if not os.path.exists(check_dir):
        raise Exception("The DIR for checking is not exists")
    check_store_path = '%s/%s' %(check_dir,os.path.relpath(dirpath))
    if not os.path.exists(check_store_path):
        os.makedirs(check_store_path)

    P1 = re.compile('SCF failed to converge')
    P2 = re.compile('rm_l_\d+_\d+')
    P3 = re.compile('Error (?P<IO>\w+) to TMP file (?P<fn>\d+/\d+)')
    P4 = re.compile('^ *Q-Chem fatal error occurred in module (?P<error>.+)$',re.MULTILINE)
    P5 = re.compile('^ *p\d_\d+: * p\d_error: .*$',re.MULTILINE)
    for xfile in os.listdir(dirpath):
        name, pre = os.path.splitext(xfile)
        if pre.lower()=='.log':
        	ff = open('%s/%s' %(dirpath,xfile),'r')
        	fs = ff.read()
        	ff.close()
        	if P1.search(fs):
        	    print("The SCF procedure is not complete in %s" %xfile)
        	    os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
        	elif P2.search(fs):
        	    print("Unexpected error occures in %s" %xfile)
        	    os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
        	elif P3.search(fs):
        	    print("Error %s to TMP file %s in %s" %(P3.search(fs).group('IO'),
                      P3.search(fs).group('fn'),xfile))
        	    os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
        	elif P4.search(fs):
        	    print("Unexpected error occures in %s" %xfile)
        	    os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
        	elif P5.search(fs):
        	    print("Parallel fatal error occurs in %s" %xfile)
        	    os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
    return


if len(sys.argv)==2:
    dirpath = sys.argv[1]
elif len(sys.argv)==1:
    dirpath = './'
else:
    raise Exception('You just need to put in the direction you want to check')

check_dir = 'check'
if not os.path.exists(check_dir):
    os.makedirs(check_dir)

check_result(dirpath,check_dir)

