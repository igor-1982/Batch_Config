#!/usr/bin/env python

import os
import sys
import re

# wrpa_flag_list
wrpa_flag_list = ['P Energy RPA']


def prepare_pattern(flag_list):
    pattern_list = []
    for tflag in flag_list:
        alen = 0
        for x in tflag:
            if x=='\\':
                alen += 1
        Patt = tflag + ' '*(28-len(tflag)+alen)+':'
        #print Patt
        P = re.compile('^=>%s *(?P<iters1>\d+.\d+),\s*(?P<iters2>-?\d+.\d+)' %Patt,re.MULTILINE)
        pattern_list.append(P)
    return pattern_list

def print_data(print_list,file_name,wnum):
    form = '%16s,'*(wnum-1)+'%16s\n'
    length_y = len(print_list)
    print(length_y)
    result  = ''
    #for i in range(1,length_x):
    #    if length_y != len(print_list[i]):
    #        dlength = length_y - len(print_list[i])
    #        print("Inconsistency %i is found for %s in the file %s" %(dlength, flag_list[i],file_name))
    #        print(print_list[0])
    #        print(print_list[i])
    #        exit()
    for i in range(0,length_y,wnum):
        tmplist = []
        for j in range(10):
            print(i+j)
            #print(print_list[i*wnum+j][1])
            tmplist.append(print_list[i+j][1])
        result += form %tuple(tmplist)
    return result

def get_data(file_name,wnum):
    proj_name = file_name
    if not os.path.exists(proj_name):
        raise Exception('You do not run the batch %s' %proj_name)
    
    ff = open(proj_name,'r')
    fs = ff.read()
    print_list = []
    
    for p in pattern_list:
        print_list=p.findall(fs)
        print(print_list)

    ps = print_data(print_list,file_name,wnum)
    return ps

if len(sys.argv)==1:
    print('You should type the DIR name of the project')
    exit()
elif len(sys.argv)==2:
    proj_name = sys.argv[1]
    wnum      = 10
elif len(sys.argv)==3:
    proj_name = sys.argv[1]
    try:
        wnum      = int(sys.argv[2])
    except:
        print('The second argument should be the number of RPA potentials')
        exit()
else:
    raise Exception("mgrep_batch.py requires no more than 2 arguments")

flag = 'wrpa'

flag_list = wrpa_flag_list

pattern_list = prepare_pattern(flag_list)

ff = open('%s.dat' %proj_name,'w')
form = '%16s,'*(wnum-1)+'%16s\n'
w_flag_list = []
for i in range(wnum):
    tmp_num = (i+1)*float(1)/float(wnum)
    w_flag_list.append('L=%3.2E' %tmp_num)
ps = form %tuple(w_flag_list)
ps += get_data(proj_name,wnum)
ff.write(ps)
ff.close()



