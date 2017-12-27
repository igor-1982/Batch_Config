#!/usr/bin/env python

import os
import sys
import re

#tmpString = 'Barrier  GMTKN30  HOF  NCIE  PES  PES_RG'
#cp_dir = tmpString.strip().split()

# XYG3_type_flag
xyg3_flag_list = ['E_SCF','E_no_XC','EK','Ex_SLATER','Ex_BECKE','Ec_VWN1RPA','Ec_LYP',
               '1st PT2 Energy','aaaa correlation','abab correlation','bbbb correlation']
# rpa_type_flag
rpa_flag_list = ['SCF energy','Exact exchange energy','RPA correlation energy','RPA total energy','RPA\+rSE \(full\) total energy','RPA\+ total energy']
# rpt2_type_flag
rpt2_flag_list = ['SCF energy','Exact exchange energy','RPA correlation energy','RPA total energy','RPA\+rSE \(full\) total energy','RPA\+ total energy','RPA\+2OX total energy','RPA\+SOSEX total energy','rPT2 total energy']
# scpt2_flag_list
scpt2_flag_list = ['SCF energy','X Energy HF','X Energy DFT','X Energy LDA',
               'C Energy LDA','C Energy GGA','C Energy PT2','C Energy PT2ss','C Energy PT2os',
               'C Energy CPT2','C Energy CPT2ss','C Energy CPT2os','Overall HOMO-LUMO gap']
# wrpa_flag_list
wrpa_flag_list = ['P Energy RPA']


def prepare_pattern(flag_list,flag):
    pattern_list = []
    for tflag in flag_list:
        alen = 0
        for x in tflag:
            if x=='\\':
                alen += 1
        Patt = tflag + ' '*(28-len(tflag)+alen)+':'
        print Patt
        if flag == 'wrpa':
            P = re.compile('^=>%s *(?P<iters1>\d+.\d+),\s*(?P<iters2>-?\d+.\d+)' %Patt,re.MULTILINE)
            
        else:
            P = re.compile('^=>%s *(?P<data>-{0,1}\d+\.\d+)' %Patt,re.MULTILINE)
        pattern_list.append(P)
    return pattern_list

def print_data(print_list,file_name,flag):
    if flag=='wrpa':
        length_x_1 = len(print_list)
        if length_x_1 != 1:
            print("The flag for wrpa should be only single")
            exit()
    else:
        length_x = len(print_list)
        if length_x == 0:
            print("No data prepared for printing out")
            exit()
        form = '%16s,'*(length_x-1)+'%16s\n'
        length_y = len(print_list[0])
        result  = ''
        for i in range(1,length_x):
            if length_y != len(print_list[i]):
                dlength = length_y - len(print_list[i])
                print("Inconsistency %i is found for %s in the file %s" %(dlength, flag_list[i],file_name))
                print(print_list[0])
                print(print_list[i])
                exit()
        for i in range(length_y):
            tmplist = []
            for j in range(length_x):
                tmplist += [print_list[j][i]]
            result += form %tuple(tmplist)
    return result

def get_data(file_name,flag):
    proj_name = file_name
    if not os.path.exists(proj_name):
        raise Exception('You do not run the batch %s' %proj_name)
    
    ff = open(proj_name,'r')
    fs = ff.read()
    print_list = []
    
    for p in pattern_list:
        print_list.append(p.findall(fs))
        print(p.findall(fs))

    ps = print_data(print_list,file_name,flag)
    return ps


if len(sys.argv)==1:
    print('You should type the DIR name of the project')
    exit()
elif len(sys.argv)==2:
    proj_name = sys.argv[1]
    flag = 'rpa'
elif len(sys.argv)==3:
    proj_name = sys.argv[1]
    flag = sys.argv[2].lower()
else:
    raise Exception("mgrep_batch.py requires no more than 2 arguments")

if flag.lower() == 'rpa':
    flag_list = rpa_flag_list
elif flag.lower() == 'xyg3':
    flag_list = xyg3_flag_list
elif flag.lower() == 'rpt2':
    flag_list = rpt2_flag_list
elif flag.lower() == 'scpt2':
    flag_list = scpt2_flag_list
elif flag.lower() == 'wrpa':
    flag_list = wrpa_flag_list
else:
    raise Exception("Unknown flag %s for collecting" %flag)

pattern_list = prepare_pattern(flag_list,flag.lower())

ff = open('%s.dat' %proj_name,'w')
form = '%16s,'*(len(flag_list)-1)+'%16s\n'
ps = form %tuple(flag_list)
ps += get_data(proj_name,flag)
ff.write(ps)
ff.close()



