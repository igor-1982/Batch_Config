#!/usr/bin/env python

import os
import sys
import re
#rsXYG3String = 'Barrier  GMTKN30  HOF  NCIE  PES'
#handle_dir = rsXYG3String.strip().split()
if len(sys.argv)==1:
    print('You should put in the main DIR of the new project')
    exit()
elif len(sys.argv)==2:
    proj_name = sys.argv[1]
    queue_name = 'nas'
elif len(sys.argv)==3:
    proj_name = sys.argv[1]
    queue_name = sys.argv[2]

home_dir = os.getcwd()
for folder in os.listdir('./%s' %proj_name):
    for item in os.listdir('%s/%s' %(proj_name,folder)):
        if os.path.isfile('%s/%s/%s' %(proj_name,folder,item)):
            name, prex = os.path.splitext(item)
            if prex == '.ctl':
                os.chdir('%s/%s/%s' %(home_dir,proj_name,folder))
                os.system(r'qBatch -q %s %s' %(queue_name,item))
                os.chdir('%s' %home_dir)

