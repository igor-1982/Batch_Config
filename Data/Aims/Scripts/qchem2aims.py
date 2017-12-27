#!/usr/bin/env python2.7

import sys
import re
import os

target = sys.argv[1]

for fl in os.listdir(target):
    if os.path.isfile('%s/%s' %(target,fl)):
        fd,ft  = os.path.split('%s/%s' %(target,fl))
        fn,fe  = os.path.splitext(ft)
        fn     = fd+'/'+fn
        if os.path.isdir(fn) or os.path.isfile(fn):
            index = 0
            while os.path.isdir("%s.trace.%i" %(fn,index)):
                index += 1
            print("direction or file named as %s exists, now rename as %s.trace.%i" %(fn,fn,index))
            os.rename(fn,"%s.trace.%i" %(fn,index))
        os.mkdir(fn)
        wff = open("%s/geometry.in" %fn,'w')
        sff = open("%s/elec_state" %fn,'w')
        
        ff = open('%s/%s' %(target,fl),'r')
        fs = ff.readlines()
        ff.close()
        
        p1 = re.compile('\$molecule')
        p2 = re.compile('\$end')
        
        num_atom = -1
        mol_flag = False
        for line in fs:
            if not mol_flag:    # whether enter the molecule block
                mol_flag = p1.match(line.strip())
            else:
                if num_atom == -1:
                    charge,spin = line.strip().split()
                    try:
                        charge = int(charge)
                        spin   = int(spin)
                    except ValueError:
                        print("Error happens in getting charge and spin")
                        sys.exit()
                    num_atom += 1
                    sff.write('charge %6i\n' %charge)
                    sff.write('spin   %6i\n' %spin)
                elif p2.match(line.strip()):
                    wff.close()
                    print("There is(are) %i atom(s) in this case" %num_atom)
                    break
                else:
                    tl = line.strip().split()
                    if len(tl)==4:
                        wff.write("atom%16s%16s%16s%5s\n" %(tl[1],tl[2],tl[3],tl[0]))
                        num_atom += 1
                    else:
                        print("Unknown geometry input \(elements are not equal 4\)")
                        sys.exit()
        sff.write('atoms  %6i\n' %num_atom)
        sff.close()
            

