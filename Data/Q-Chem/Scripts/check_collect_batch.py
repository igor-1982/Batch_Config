#!/usr/bin/env python

import os
import sys
import re

#tmpString = 'Barrier  GMTKN30  HOF  NCIE  PES'
#handle_dir = tmpString.strip().split()

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
        	    print("Fatal error occurs for %s in %s" %(P4.search(fs).group('error'), xfile))
        	    os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
        	elif P5.search(fs):
        	    print("Unexpected error occures in %s" %xfile)
        	    os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
    return
    
if len(sys.argv)==1:
    raise Exception('You should type the name of the project DIR for checking and collecting')

proj_name = sys.argv[1]
if not os.path.exists(proj_name):
    raise Exception("The project DIR for checking and collecting is not exists")



check_dir = '%s_Data' %(proj_name)
if not os.path.exists(check_dir):
    os.makedirs(check_dir)

for folder in os.listdir('./%s/' %proj_name):
    if not os.path.exists('%s/%s' %(proj_name,folder)):
        raise Exception("The DIR (%s/%s), you want to handle is not exist" %(proj_name,folder))
    for item in os.listdir('%s/%s' %(proj_name,folder)):
        item_name = '%s/%s/%s' %(proj_name,folder,item)
        if os.path.isdir(item_name):
            check_result(item_name,check_dir)
        elif os.path.isfile(item_name):
            head, end = os.path.splitext(item_name)
            if end == '.err' or end == '.out' or end == '.hosts':
                os.remove(item_name)
            elif end == '.Batch':
                os.system('cp %s %s/%s' %(item_name,check_dir,item))





