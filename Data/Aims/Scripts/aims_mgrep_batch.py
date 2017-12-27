#!/usr/bin/env python2

import os
import sys
import re

# tmpString = 'Barrier  GMTKN30  HOF  NCIE  PES  PES_RG'
# cp_dir = tmpString.strip().split()

# xyg3_type_flag
xyg3_flag_list = ['SCF energy', 'Exact exchange energy', 'X BLYP', 'X SVWN',
                  'C SVWN', 'C BLYP', 'osMP2 correlation energy']

# dhpbe0_type_flag
dhpbe0_flag_list = ['SCF energy', 'Exact exchange energy', 'X PBE', 'C PBE',
                    'osMP2 correlation energy']
# osrpa_type_flag
# osrpa_flag_list = ['SCF energy', 'Exact exchange energy', 'X PBE', 'C PBE',
#                    'osRPA correlation energy']
osrpa_flag_list = ['SCF energy', 'Exact exchange energy', 'X PBE', 'C PBE',
                   'X SCAN', 'C SCAN', 'osRPA correlation energy']


def prepare_pattern(flag_list, flag):
    pattern_list = []
    for tflag in flag_list:
        alen = 0
        for x in tflag:
            if x == '\\':
                alen += 1
        Patt = tflag + ' '*(28-len(tflag)+alen)+':'
        print(Patt)
        if flag == 'wrpa':
            P = re.compile(
                "^=>%s *(?P<iters1>\d+.\d+),\s*(?P<iters2>-?\d+.\d+)"
                % Patt, re.MULTILINE)
        else:
            P = re.compile('^=>%s *(?P<data>-{0,1}\d+\.\d+)'
                           % Patt, re.MULTILINE)
            #print('^=>%s *(?P<data>-{0,1}\d+\.\d+)' % Patt)
        pattern_list.append(P)
    return pattern_list


def print_data(print_list, file_name, flag):
    if flag == 'wrpa':
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
        result = ''
        for i in range(1, length_x):
            if length_y != len(print_list[i]):
                dlength = length_y - len(print_list[i])
                print("Inconsistency %i is found for %s in the file %s"
                      % (dlength, flag_list[i], file_name))
                print(print_list[0])
                print(print_list[i])
                exit()
        for i in range(length_y):
            tmplist = []
            for j in range(length_x):
                tmplist += [print_list[j][i]]
            result += form % tuple(tmplist)
    return result


def get_data(file_name, flag):
    proj_name = file_name
    if not os.path.exists(proj_name):
        raise Exception('You do not run the batch %s' % proj_name)

    ff = open(proj_name, 'r')
    fs = ff.read()
    print_list = []

    for p in pattern_list:
        print_list.append(p.findall(fs))
        print(p.findall(fs))

    ps = print_data(print_list, file_name, flag)
    return ps


if len(sys.argv) == 1:
    print('You should type the DIR name of the project')
    exit()
elif len(sys.argv) == 2:
    proj_name = sys.argv[1]
    flag = 'osrpa'
elif len(sys.argv) == 3:
    proj_name = sys.argv[1]
    flag = sys.argv[2].lower()
else:
    raise Exception("mgrep_batch.py requires no more than 2 arguments")

if flag.lower() == 'xyg3':
    flag_list = xyg3_flag_list
elif flag.lower() == 'dhpbe0':
    flag_list = dhpbe0_flag_list
elif flag.lower() == 'osrpa':
    flag_list = osrpa_flag_list
else:
    raise Exception("Unknown flag %s for collecting" % flag)

pattern_list = prepare_pattern(flag_list, flag.lower())

ff = open('%s.dat' % proj_name, 'w')
form = '%16s,'*(len(flag_list)-1)+'%16s\n'
ps = form % tuple(flag_list)
ps += get_data(proj_name, flag)
ff.write(ps)
ff.close()
