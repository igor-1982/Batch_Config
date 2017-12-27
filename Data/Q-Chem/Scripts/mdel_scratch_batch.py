#!/usr/bin/env python

import os
import sys
import re

projs = sys.argv[1:]

for proj_name in projs:
    for folder in os.listdir('./%s' %proj_name):
        if os.path.isdir('./%s/%s' %(proj_name,folder)):
            os.system('rm -r ./%s/%s/.script*' %(proj_name,folder))


