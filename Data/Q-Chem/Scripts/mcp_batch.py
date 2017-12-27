#!/usr/bin/env python

import os
import sys
import re
orig_name = 'B3LYP'
#tmpString = 'Barrier  GMTKN30  HOF  NCIE  PES'
#cp_dir = tmpString.strip().split()
if len(sys.argv)==1:
    print('You should type the name of the new project at least')
    exit()


def parse_string(fs,p1):
    if p1.search(fs):
        string = p1.search(fs).group(0)
        start, end = p1.search(fs).span()
    else:
        string='Non'
        start='Non'
        end='Non'
    return string, start, end

def get_Input(append_name):
        '''Loading molecule group from input file'''
        from re         import compile
        f = open(append_name,'r')
        InpuDict = {}
        p1  = compile('\$rem',re.IGNORECASE)                          # Now loading rem group
        p2  = compile('\$end',re.IGNORECASE) 
        f.seek(0L)
        TmpFile=f.read()
        if p1.search(TmpFile):
            InpuDict['rem']=[]
            InpuDict['rem'].append('$rem')
            LocPos  = p1.search(TmpFile).start() 
            f.seek(LocPos)
            f.readline()
            TmpLine = f.readline().strip()
            while not p2.search(TmpLine.lower()):
                InpuDict['rem'].append(TmpLine)
                TmpLine = f.readline().strip()
            else:
                InpuDict['rem'].append('$end')

        p1  = compile('\$xc_functional',re.IGNORECASE)                # Now loading xc_functional
        p2  = compile('\$end',re.IGNORECASE) 
        f.seek(0L)
        TmpFile=f.read().lower()
        if p1.search(TmpFile):
            InpuDict['xc_functional']=[]
            InpuDict['xc_functional'].append('$xc_functional')
            LocPos  = p1.search(TmpFile).start() 
            f.seek(LocPos)
            f.readline()
            TmpLine = f.readline().strip()
            while not p2.search(TmpLine.lower()):
                InpuDict['xc_functional'].append(TmpLine)
                TmpLine = f.readline().strip()
            else:
                InpuDict['xc_functional'].append('$end')

        p1  = compile('\$occupied',re.IGNORECASE)                                  # Now loading occupied
        p2  = compile('\$end',re.IGNORECASE) 
        f.seek(0L)
        TmpFile=f.read().lower()
        if p1.search(TmpFile):
            InpuDict['occupied']=[]
            InpuDict['occupied'].append('$occupied')
            LocPos  = p1.search(TmpFile).start() 
            f.seek(LocPos)
            f.readline()
            TmpLine = f.readline().strip()
            while not p2.search(TmpLine.lower()):
                InpuDict['occupied'].append(TmpLine)
                TmpLine = f.readline().strip()
            else:
                InpuDict['occupied'].append('$end')

        p1  = compile('\$basis',re.IGNORECASE)                                  # Now loading basis
        p2  = compile('\$end',re.IGNORECASE) 
        f.seek(0L)
        TmpFile=f.read().lower()
        if p1.search(TmpFile):
            InpuDict['basis']=[]
            InpuDict['basis'].append('$basis')
            LocPos  = p1.search(TmpFile).start() 
            f.seek(LocPos)
            f.readline()
            TmpLine = f.readline().strip()
            while not p2.search(TmpLine.lower()):
                InpuDict['basis'].append(TmpLine)
                TmpLine = f.readline().strip()
            else:
                InpuDict['basis'].append('$end')

        p1  = compile('\$ecp',re.IGNORECASE)                                  # Now loading basis
        p2  = compile('\$end',re.IGNORECASE) 
        f.seek(0L)
        TmpFile=f.read().lower()
        if p1.search(TmpFile):
            InpuDict['ecp']=[]
            InpuDict['ecp'].append('$ecp')
            LocPos  = p1.search(TmpFile).start() 
            f.seek(LocPos)
            f.readline()
            TmpLine = f.readline().strip()
            while not p2.search(TmpLine.lower()):
                InpuDict['ecp'].append(TmpLine)
                TmpLine = f.readline().strip()
            else:
                InpuDict['ecp'].append('$end')
        return InpuDict

def modify_Input(InpDir,fs):
    Form = '%s\n'
    for key,value in InpDir.items():
        # if the 'key' group have already existed
        tmpString1 = ''
        for line in value[1:-1]:
            tmpString1 += Form %line
        tmpString2 = ''
        # if the 'key' group is additional totally
        for line in value:
            tmpString2 += Form %line
        p1 = re.compile('^ *\$%s.*$' %key,re.IGNORECASE|re.MULTILINE)
        p2 = re.compile('^ *\$end.*$',re.IGNORECASE|re.MULTILINE)
        if p1.search(fs):
            key, start, end = parse_string(fs,p1)
            fs = fs[:end+1]+tmpString1+fs[end+1:]
        else:
            key, start, end = parse_string(fs,p2)
            fs = fs[:end+1]+tmpString2+fs[end+1:]
    return fs

proj_name = sys.argv[1]

par_flag = True
QChem_Cfg   = 'rmp2'

if len(sys.argv)>2:
    Basis_Flag  = False
    Method_Flag = False
    Append_Flag = False
    Job_Flag    = False
    Cfg_Flag    = False
    Orig_Flag   = False
    for x in sys.argv[2:]:
        # for statements
        if Basis_Flag:
            basis_name = x
            Basis_Flag = False
        elif Method_Flag:
            method_name = x
            Method_Flag = False
        elif Job_Flag:
            job_flag = x
            Job_Flag = False
        elif Append_Flag:
            append_name = x
            Append_Flag = False
            if os.path.exists(append_name):
                inpdic = get_Input(append_name)
            else:
                print("The additional input file %s is not exist" %append_name)
                exit()
        elif Cfg_Flag:
            QChem_Cfg = x
            Cfg_Flag = False
        elif Orig_Flag:
            orig_name = x
            Orig_Flag = False
        # for flags
        if x=='-b' or x=='--basis':
            Basis_Flag = True
        elif x=='-m' or x=='--method':
            Method_Flag = True
        elif x=='-o' or x=='--original':
            Orig_Flag = True
        elif x=='-af' or x=='--appendfile':
            Append_Flag = True
        elif x=='-jf' or x=='--jobflag':
            Job_Flag = True
        elif x=='-cfg':
            Cfg_Flag = True
        elif x=='-par':
            par_flag = True
        elif x=='-ser':
            par_flag = False
            pass
            

if proj_name == orig_name:
    print('You can not cp %s to %s' %(orig_name, proj_name))
    exit()

if not os.path.exists(proj_name):
    os.makedirs(proj_name)

for folder in os.listdir('./%s' %orig_name):
    if not os.path.exists('%s/%s' %(proj_name,folder)):
        os.makedirs('%s/%s' %(proj_name,folder))
    if os.path.isdir('./%s/%s' %(orig_name,folder)):
        for item in os.listdir('%s/%s' %(orig_name,folder)):
            # prepare scratch file
            if os.path.isdir('%s/%s/%s' %(orig_name,folder,item)) and \
               not os.path.exists('%s/%s/%s' %(proj_name,folder,item)):
                os.system('cp -r %s/%s/%s %s/%s/%s' %(orig_name,folder,item,proj_name,folder,item))
                os.system('rm %s/%s/%s/*.log' %(proj_name,folder,item))
                pass
            #elif os.path.isdir('%s/%s/%s' %(orig_name,folder,item)) and \
            #   os.path.exists('%s/%s/%s' %(proj_name,folder,item)):
            #       for 
            elif os.path.isfile('%s/%s/%s' %(orig_name,folder,item)):
                name, prex = os.path.splitext(item)
                if prex == '.ctl':
                    os.system('cp %s/%s/%s %s/%s/%s' %(orig_name,folder,item,proj_name,folder,item))
                    ff = open('%s/%s/%s' %(proj_name,folder,item),'r')
                    fs = ff.read()
                    ff.close()
                    # control the project running type: parallel or serial
                    if par_flag:
                        new_head = '__qchem__ :: 1 %s' %QChem_Cfg
                    else:
                        new_head = '__qchem__ :: 0 %s' %Qchem_Cfg
                    p1 = re.compile('^ *__qchem__ * ::.*$',re.IGNORECASE|re.MULTILINE)
                    orig_head, start, end = parse_string(fs,p1)
                    fs = fs.replace(orig_head, new_head)
                    # modify the basis set
                    try:
                        new_basis = 'basis = %s' % basis_name
                        p1 = re.compile('^ *basis.*$',re.IGNORECASE|re.MULTILINE)
                        orig_basis, start, end = parse_string(fs,p1)
                        fs = fs.replace(orig_basis, new_basis)
                    except NameError:
                        pass
                    # modify the method
                    try:
                        new_method = 'exchange = %s' % method_name
                        p1 = re.compile('^ *exchange.*$',re.IGNORECASE|re.MULTILINE)
                        orig_method, start, end = parse_string(fs,p1)
                        fs = fs.replace(orig_method, new_method)
                    except NameError:
                        pass
                    # modify or append the key of 'scf_guess'
                    try:
                        p1 = re.compile('^ *scf_guess.*$',re.IGNORECASE|re.MULTILINE)
                        if p1.search(fs):
                            orig_guess, start, end = parse_string(fs,p1)
                            fs = fs.replace(orig_guess, 'scf_guess = read')
                        else:
                            p1 = re.compile('^ *\$rem *$',re.IGNORECASE|re.MULTILINE)
                            orig_rem, start, end = parse_string(fs,p1)
                            fs = fs[:end+1] + 'scf_guess = read\n' + fs[end+1:]
                    except NameError:
                        pass
                    # append additional keys into ctl file
                    try:
                        fs = modify_Input(inpdic,fs)
                    except NameError:
                        pass
                    # modify job flag
                    try:
                        new_flag = '.in     %s' %job_flag
                        p1 = re.compile('\.in.+energy.*$',re.IGNORECASE|re.MULTILINE)
                        fs = p1.sub(new_flag,fs)
                    except NameError:
                        pass

                    ff = open('%s/%s/%s' %(proj_name,folder,item),'w')
                    ff.write(fs)
                    ff.close()


