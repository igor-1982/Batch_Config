#!/usr/bin/env python
import os
import sys

for i in os.listdir('.'):
    name,posfix=os.path.splitext(i)
    os.system('mv %s %s.com' %(i,name))
