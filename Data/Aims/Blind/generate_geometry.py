#!/usr/bin/env python3

import re
import os
import sys

pat1 = re.compile('Benzene-Methane Configuration Number = (?P<num>\d*)')
pat2 = re.compile('R_COM= *(?P<num>\d.\d\d\d\d\d)')
pat3 = re.compile('CCSD\(T\) = *(?P<num>[+|-]\d{1,3}.\d*) kcal/mol')
pat4 = re.compile('CBS *= *(?P<num>[+|-]\d{1,3}.\d*) kcal/mol')
pat5 = re.compile('Monomer A')
pat6 = re.compile('Monomer B')
pat7 = re.compile('(?P<element>\D) *(?P<x>-?\d{1,3}.\d{2,5}) *(?P<y>-?\d{1,3}.\d{2,5}) *(?P<z>-?\d{1,3}.\d{2,5})')
pat8 = re.compile('-----END-----')

pat9 = re.compile('Benzene-Water Configuration Number = (?P<num>\d*)')
pat10 = re.compile('Ethanol Dimer Configuration Number = (?P<num>\d*)')
pat11 = re.compile('EDNA Dimer Configuration Number = (?P<num>\d*)')
pat12 = re.compile('FOX-7 Dimer Configuration Number = (?P<num>\d*)')
pat13 = re.compile('Imidazole Dimer Configuration Number = (?P<num>\d*)')
pat14 = re.compile('Methyl Formate Dimer Configuration Number = (?P<num>\d*)')
pat15 = re.compile('Nitrobenzene Dimer Configuration Number = (?P<num>\d*)')
pat16 = re.compile('Nitromethane Dimer Configuration Number = (?P<num>\d*)')
pat17 = re.compile('Water Dimer Configuration Number = (?P<num>\d*)')

flagConf = False
tmpIndex = 0
data = {}

ff= open(sys.argv[1],'r')

for lineX in ff.readlines():
    tmpOS = pat1.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        tmpNum = 'BM-%s' %tmpIndex
        data[tmpNum] = {}

    tmpOS = pat9.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        tmpNum = 'BW-%s' %tmpIndex
        data[tmpNum] = {}

    tmpOS = pat10.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        tmpNum = 'ED-%s' %tmpIndex
        data[tmpNum] = {}

    tmpOS = pat11.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        tmpNum = 'ED2-%s' %tmpIndex
        data[tmpNum] = {}

    tmpOS = pat12.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        tmpNum = 'FD-%s' %tmpIndex
        data[tmpNum] = {}

    tmpOS = pat13.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        tmpNum = 'ID-%s' %tmpIndex
        data[tmpNum] = {}

    tmpOS = pat14.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        tmpNum = 'MFD-%s' %tmpIndex
        data[tmpNum] = {}

    tmpOS = pat15.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        tmpNum = 'NBD-%s' %tmpIndex
        data[tmpNum] = {}

    tmpOS = pat16.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        tmpNum = 'NMD-%s' %tmpIndex
        data[tmpNum] = {}

    tmpOS = pat17.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        tmpNum = 'WD-%s' %tmpIndex
        data[tmpNum] = {}

    tmpOS = pat2.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        data[tmpNum]['R_COM']=tmpIndex

    tmpOS = pat3.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        data[tmpNum]['CCSDT']=tmpIndex

    tmpOS = pat4.search(lineX)
    if tmpOS:
        tmpIndex = tmpOS.group('num')
        data[tmpNum]['CBS']=tmpIndex

    tmpOS = pat5.search(lineX)
    if tmpOS:
        tmpMonomer = 'A'
        data[tmpNum][tmpMonomer]=[]

    tmpOS = pat6.search(lineX)
    if tmpOS:
        tmpMonomer = 'B'
        data[tmpNum][tmpMonomer]=[]

    tmpOS = pat7.search(lineX)
    if tmpOS:
        tmpE = tmpOS.group('element')
        tmpX = float(tmpOS.group('x'))
        tmpY = float(tmpOS.group('y'))
        tmpZ = float(tmpOS.group('z'))
        data[tmpNum][tmpMonomer].append([tmpE, tmpX, tmpY, tmpZ])

ff.close()

for x,y in data.items():
    os.makedirs(x)
    fT = open('%s/geometry.in' %x,'w')
    numA = 0
    numB = 0
    if y.get('A'):
        os.makedirs('%s-A' %x)
        fA = open('%s-A/geometry.in' %x,'w')
        numA = len(y['A'])
        for i in range(numA):
            tmpE, tmpX, tmpY, tmpZ = y['A'][i]
            fA.write('atom%16.8f%16.8f%16.8f%6s\n' %(tmpX,tmpY,tmpZ,tmpE))
            fT.write('atom%16.8f%16.8f%16.8f%6s\n' %(tmpX,tmpY,tmpZ,tmpE))
        fA.close()
        fA = open('%s-A/elec_state' %x,'w')
        fA.write('charge       0\n')
        fA.write('spin         1\n')
        fA.write('atoms %8i\n' %numA)
        fA.close()
    if y.get('B'):
        os.makedirs('%s-B' %x)
        fB = open('%s-B/geometry.in' %x,'w')
        numB = len(y['B'])
        for i in range(numB):
            tmpE, tmpX, tmpY, tmpZ = y['B'][i]
            fB.write('atom%16.8f%16.8f%16.8f%6s\n' %(tmpX,tmpY,tmpZ,tmpE))
            fT.write('atom%16.8f%16.8f%16.8f%6s\n' %(tmpX,tmpY,tmpZ,tmpE))
        fB.close()
        fB = open('%s-B/elec_state' %x,'w')
        fB.write('charge       0\n')
        fB.write('spin         1\n')
        fB.write('atoms %8i\n' %numA)
        fB.close()
    fT.close()
    fT = open('%s/elec_state' %x,'w')
    fT.write('charge       0\n')
    fT.write('spin         1\n')
    numT = numA + numB
    fT.write('atoms %8i\n' %numT)
    fT.close()

