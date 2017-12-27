#!/usr/bin/env python2.7

import sys
import os

for line in file(sys.argv[1])
    line = line.split()[0].strip()
    fname = '%s.com' %line
    os.system('./gsed %s' %fname)
