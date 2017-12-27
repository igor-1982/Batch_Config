#!/usr/bin/env python2.7

import os,sys,re

rf=open(sys.argv[1],'r')
zpef = open('%s.ZPE' %sys.argv[1],'w')
wf = open('%s.com' %sys.argv[1],'w')

P1 = re.compile('Enter the job :')
P2 = re.compile('QM Energy = (-*\d.\d*E[+-]\d\d)')
P3 = re.compile('Zero-point correction= *(\d+.\d+)')
P4 = re.compile('Thermal correction to Enthalpy= *(\d+.\d+)')
P5 = re.compile('This is a batch job for geom. opt.')
P6 = re.compile('Charge =  (\d) Multiplicity = (\d)')
P7 = re.compile('There are *(\d+) atoms in this molecule')


tmpString = rf.read()
LocPos = 0
JobFit   = P1.search(tmpString)
while JobFit:
    Name = 'NAN'
    Energy = 'NAN'
    Charge = 'NAN'
    Multip = 'NAN'
    NumA   = 'NAN'
    CList  = 'NAN'
    ZPE    = 'NAN'
    TE     = 'NAN'
    sta, end = JobFit.span()
    rf.seek(end+LocPos)
    tmpLine = rf.readline().strip()
    Name = tmpLine.split()[-1].strip('"')
    tmpLine = rf.readline()
    while not P5.search(tmpLine):
        tmpLine = rf.readline()
    rf.readline()
    tmpLine = rf.readline()
    EngFit = P2.search(tmpLine.strip())
    if EngFit:
        Energy = EngFit.group(1)
    rf.readline()
    tmpLine = rf.readline()
    CMFit  = P6.search(tmpLine)
    if CMFit:
        Charge = int(CMFit.group(1))
        Multip = int(CMFit.group(2))
    tmpLine = rf.readline()
    NAFit  = P7.search(tmpLine)
    rf.readline()
    if NAFit:
        NumA  = int(NAFit.group(1))
        CList = []
        for x in range(NumA):
            CList.append(rf.readline())
    rf.readline()
    tmpLine = rf.readline()
    ZPEFit = P3.search(tmpLine)
    if ZPEFit:
        ZPE = float(ZPEFit.group(1))
    tmpLine = rf.readline()
    TEFit  = P4.search(tmpLine)
    if TEFit:
        TE = float(TEFit.group(1))
    LocPos   = rf.tell()
    JobFit   = P1.search(tmpString[LocPos:])
    print Name
    print Energy
    print Charge,Multip
    print NumA
    print CList
    print ZPE
    print TE
    zpef.write('%16.8f,%16.8f\n' %(ZPE,TE))
    #wf.write('\%chk   = %s.chk\n' %Name)
    wf.write('%nproc = 8\n')
    wf.write('%mem   = 6000MB\n')
    wf.write('#p b3lyp/6-311+G(3df,2p), scf=tight\nextraoverlay\n')
    wf.write('\n')
    wf.write('8/10=90/1;9/16=-3/6;\n')
    wf.write('6//8;\n')
    wf.write('\n')
    wf.write('Optimized at the level of B3LYP/6-31G(2df,p), Etot = %s, ZPE = %s, TE = %s\n' % (Energy, ZPE, TE))
    wf.write('\n')
    wf.write('%-5d%5d\n' %(Charge,Multip))
    for x in range(NumA):
        wf.write(CList[x].strip()+'\n')
    wf.write('\n')
    wf.write('205\n')
    wf.write('402\n')
    wf.write('\n')
    wf.write('\n')
    wf.write('--link1--\n')

zpef.close()
rf.close()
wf.close()
