#!/usr/bin/env python

import os, sys, re

P1 = re.compile('Input orientation:')
print sys.argv[1]
for xfile in sys.argv[1:]:
    if os.path.isdir(xfile):
        os.system('cp elec_state %s/' %xfile)
