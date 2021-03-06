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

    P1 = re.compile('scf_solver: SCF cycle not converged.')
    P2 = re.compile('caused collective abort of all ranks')
    P3 = re.compile('\| Occupation number: *(\d+.\d+)')
    P4 = re.compile('WARNING! SELF-CONSISTENCY CYCLE DID NOT CONVERGE')
    P5 = re.compile('          Have a nice day.')
    for xfile in os.listdir(dirpath):
        name, pre = os.path.splitext(xfile)
        flagRemove = False
        if pre.lower()=='.log':
            ff = open('%s/%s' %(dirpath,xfile),'r')
            fs = ff.read()
            ff.close()
            if P1.search(fs):
                print("The SCF procedure is not complete in %s" %xfile)
                # os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
                flagRemove = True
            elif P2.search(fs):
                print("Uncertain errors, maybe is a parallel problem in %s" %xfile)
                # os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
                flagRemove = True
            elif not P5.search(fs):
                print("Uncertain errors, maybe is a parallel problem in %s" %xfile)
                # os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
                flagRemove = True
            else:
                tmplist = [float(occ_num) for occ_num in P3.findall(fs)]
                if tmplist[-1]!=0.0 and (tmplist[-2]!=2.0 or tmplist[-2]!=1.0):
                    print("Occupation number is not integer in %s" %xfile)
                    print("Occupation number for VBM : %8.6f" %tmplist[-2])
                    print("Occupation number for CBM : %8.6f" %tmplist[-1])
                    # os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
                # else:
                #     print("Occupation number for VBM : %8.6f" %tmplist[-2])
                #     print("Occupation number for CBM : %8.6f" %tmplist[-1])
            if P4.search(fs):
                print("The SCF procedure is not complete in %s" %xfile)
		flagRemove = True
                # os.rename('%s/%s' %(dirpath,xfile),'%s/%s' %(check_store_path,xfile))
            if flagRemove:
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

