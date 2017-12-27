#!/usr/bin/env python

import os
import sys
import re

#tmpString = 'Barrier  GMTKN30  HOF  NCIE  PES  PES_RG'
#cp_dir = tmpString.strip().split()

job_dict = {'HOF':['EAtom','G2-1','G2-2','G3-3','Bond3'],
            'RBH':['Non_H_lm','Non_H_ts','H_lm','H_ts'],
            'NBI':['NCIE','S22','ADIM6','BSSE_NCIE','BSSE_S22','BSSE_ADIM6','PCONF','ACONF'],
            'PES':['PES_H_CH4','PES_bz_methane','PES_methane2',\
                   'PES-He2','PES-Ne2','PES-Ar2','PES-HeNe','PES-HeAr','PES-NeAr',\
                   'BSSE_PES_bz_methane','BSSE_methane2',\
                   'BSSE-PES-He2','BSSE-PES-Ne2','BSSE-PES-Ar2',\
                   'BSSE-PES-HeNe','BSSE-PES-HeAr','BSSE-PES-NeAr'],
            'GMTKN30':['IDISP','MB08-165','W4','G21IP','G21EA','PA','SIE11','BHPERI','BH76','RSE43',\
                    'O3ADD6','G2RC','AL2X','NBPRC','ISO34','ISOL22','DC9','DARC','BSR36','WATER27','S22',\
                    'ADIM6','PCONF','ACONF','SCONF','CYCONF','BSSE_S22','BSSE_ADIM6']
        }

# XYG3_type_flag
xyg3_flag_list = ['E_SCF','E_no_XC','EK','Ex_SLATER','Ex_BECKE','Ec_VWN1RPA','Ec_LYP',
               '1st PT2 Energy','aaaa correlation','abab correlation','bbbb correlation']
#xyg3_flag_list = ['E_SCF','E_no_XC','EK','Ex_BECKE','Ec_LYP',
#               '1st PT2 Energy','aaaa correlation','abab correlation','bbbb correlation']
#xyg3_flag_list = ['E_SCF','E_no_XC','EK','Ex_PBE','Ec_PBE',
#               '1st PT2 Energy','aaaa correlation','abab correlation','bbbb correlation']
# b3lyp_type_flag
b3lyp_flag_list = ['SCF Energy']
# rsXYG3_type_flag
rsxyg3_flag_list = ['aaaa correlation','abab correlation','bbbb correlation']


def prepare_pattern(flag_list):
    XFunDic = {0:'HF',1:'SLATER',2:'BECKE',3:'PW91',16:'PBE'}
    CFunDic = {0:'NONE',1:'VWN',2:'LYP',4:'PW91',5:'P86',10:'VWN1RPA',13:'PBE'}
    pattern_list = []
    for flag in flag_list:
        if flag.lower()[:3]=='ex_':
            for key,value in XFunDic.items():
                if flag.lower()[3:]==value.lower():
                    P = re.compile('^ Exch\[\d+\] = *(?P<data>-{0,1}\d+\.\d+), Index = *%i$' %key,re.MULTILINE)
                    pattern_list.append(P)
                    break
            else:
                print('Unknown exchange name :: %s' %flag)
                exit()
        elif flag.lower()[:3]=='ec_':
            for key,value in CFunDic.items():
                if flag.lower()[3:]==value.lower():
                    P = re.compile('^ Corr\[\d+\] = *(?P<data>-{0,1}\d+\.\d+), Index = *%i$' %key,re.MULTILINE)
                    pattern_list.append(P)
                    break
            else:
                print('Unknown correlation name :: %s' %flag)
                exit()
        else:
            P = re.compile('^.*%s.* +(?P<data>-{0,1}\d+\.\d+).*$' %flag,re.IGNORECASE|re.MULTILINE)
            pattern_list.append(P)
    return pattern_list

def print_data(print_list,file_name):
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

def get_data(file_name):
    proj_name = file_name
    if not os.path.exists(proj_name):
        raise Exception('You do not run the batch %s' %proj_name)
    
    ff = open(proj_name,'r')
    fs = ff.read()
    print_list = []
    
    for p in pattern_list:
        print_list.append(p.findall(fs))

    ps = print_data(print_list,file_name)
    return ps


if len(sys.argv)==1:
    print('You should type the DIR name of the project')
    exit()
elif len(sys.argv)==2:
    proj_name = sys.argv[1]
    flag = 'b3lyp'
elif len(sys.argv)==3:
    proj_name = sys.argv[1]
    flag = sys.argv[2]
else:
    raise Exception("mgrep_batch.py requires no more than 2 arguments")

if flag.lower() == 'b3lyp':
    flag_list = b3lyp_flag_list
elif flag.lower() == 'xyg3':
    flag_list = xyg3_flag_list
elif flag.lower() == 'rsxyg3':
    flag_list = rsxyg3_flag_list
else:
    raise Exception("Unknown flag %s for collecting" %flag)

pattern_list = prepare_pattern(flag_list)

for key,value in job_dict.items():
    ff = open('%s/%s.dat' %(proj_name,key),'w')
    form = '%16s,'*(len(flag_list)-1)+'%16s\n'
    ps = form %tuple(flag_list)
    for item in value:
        ps += get_data('%s/%s.Batch' %(proj_name,item))
    ff.write(ps)
    ff.close()



