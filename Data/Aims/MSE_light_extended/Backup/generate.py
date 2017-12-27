#!/usr/bin/env python2.7

import sys
import re
import os

for fl in os.listdir('./'):
    if os.path.isfile(fl):
        fd,ft  = os.path.split(fl)
        #fn,fe  = os.path.splitext(ft)
        #fn     = fd+'/'+fn
        name_list = ft.split('_')
        if name_list[0]=='geometry.in':
            fn = name_list[-2]+'_'+name_list[-1]
            if os.path.isdir(fn) or os.path.isfile(fn):
                index = 0
                while os.path.isdir("%s.trace.%i" %(fn,index)):
                    index += 1
                print("direction or file named as %s exists, now rename as %s.trace.%i" %(fn,fn,index))
                os.rename(fn,"%s.trace.%i" %(fn,index))
            os.mkdir(fn)
            sff = open("%s/elec_state" %fn,'w')
            
            os.system('cp %s %s/geometry.in' %(fl,fn))
            
            ff = open(fl,'r')
            fs = ff.readlines()
            ff.close()
            
            p1 = re.compile('^atom *\d*.\d* *\d*.\d* *\d*.\d* *\w*')
            
            num_atom = 0
            mol_flag = False
            for line in fs:
                mol_flag = p1.match(line.strip())
                if mol_flag:
                    num_atom += 1
            sff.write('charge %6i\n' %0)
            sff.write('spin   %6i\n' %1)
            sff.write('atoms  %6i\n' %num_atom)
            sff.close()
            

