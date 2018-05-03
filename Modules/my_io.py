#!/bin/env python2
# Module     :: my_io
# Authors    :: Igor Ying Zhang and Xin Xu
# Purpose    :: Private input and output formats
# Version    :: v4.0(20120521)
# Revised    :: 2012-05-21
# NOTE       :: DEV for develop; DEB for debug.
# History    ::
#  v1.0(20090924) :
#     Build personal-style output function: print_Error,
#       print_String, print_List, and print_Matrix
#  V2.0(20091009) :
#     Creat new class "ConfigIO", which batch the group of jobs
#       through a config file.
#  V2.1(20091011) :
#     DEV1) Add two parameters "ProjDir" and "ProjCtrl" for the class
#        "ConfigIO", where "ProjDir" is the running DIR of the project,
#        and "ProjCtrl" control the batch manner.
#        These two parameters should be specified following the label
#        "__project__ ::" in the config input file.
#     DEV2) Add five math functions : my_Plus, my_Substract, my_Product,
#        and my_Divide.
#        In these functions, the general real result would be return, if
#        plus, substract, product and divide operations are success.
#        If not, functions would return a string of "NAN".
#     DEV3) Modify the class of "ConfigIO" to be able to continue batch
#        when calculation fails during batching or statistic counting.
#  V2.2(20091020) :
#     DEV1) Add a list "PathList" to "ConfigIO", associated with one input
#        group which is specified following the label "__macro_path__::"
#        in the config input file.
#        This is a list, of which elements are all dual-element tuple.
#        In this tuple, the first element is <macro_path> name, and
#        another one is the exact path relatively.
#     DEV2) Add one more print function "print_Matrix_headed",
#        and corresponding "read_Matrix_headed" for matrix loading.
#     DEV3) Add one more print function "print_List_free".
#        This is a print function, to print list by "Format" customized
#        by users, which is exactly the reason why it names "free"
#     DEV4) Taking advantage of the new-added print function
#        "print_List_free", ConfigIO.BatcList could be print more
#        human-readable in the function of "ConfigIO.get_BatcList", and
#        also ConfigIO.EngyList, ConfigIO.PolaList, ConfigIO.NMRList
#        in the function of "ConfigIO.get_TrainSet"
#     DEV5) Due to the significant modification in the class of "DFTD",
#        several changes are made in "ConfigIO.run_GauBatch"
#  V2.3(20091106) :
#     DEV1) Add geometry optimization into "ConfigIO" class
#     DEV2) Corresponding functions for bond, angel, and dihedral evalution
#        are also added : my_bond, my_angle, and my_dihedral
#  V2.4(20100321) :
#     DEV1) Add one argument into the class "ConfigIO","ProjTool" which is
#        used to determine the QC soft package employed for job batch.
#        (Gaussian or QChem)
#     DEV2) Add the function "QcmIOCmd" into "ConfigIO", to collect the
#        Q-Chem input (expecially for $rem group) in Batch Input.
#     DEV3) Add one more function "QcmBatch" into "ConfigIO" to control
#        Batch running with Q-Chem
#     DEV4) Add two keys into the Dict of "ConfigIO.ResuDict", "PT21" and
#        "PT22" which are corresponding to first-excitation contribution
#        and second-exciation contibution in GLPT2 term
#     DEV5) "ConfigIO.GauIOCommand" is renamed as "ConfigIO.GauIOCmd", and
#        "ConfigIO.BatcList" is renamed as "ConfigIO.Batch"
#     DEB6) Debug the error in printing the energy tranining set
#        "ConfigIO.get_TrainSet"
#     DEB7) Debug the error in reading the energy tranining set when
#        encounters blank line "ConfigIO.get_TrainSet"
#  V3.0(20100705) :
#     DEV1) Add seven functions into the class "ConfigIO" for "DFT_Fitting"
#        They are: 1) get_OptComp; 2) get_OptInit; 3) get_OptFunc;
#                  4) get_OptAlgo; 5) get_OptResu; 6) run_OptCalc;
#                  7) run_Statistic
#     DEB2) Add the check procedure for duplicating redundant flags
#        "ConfigIO.get_OptComp"
#     DEV3) Modify "ConfigIO.get_OptFunc" to surport existing modules and
#        also the function of "update_qchem_xmp2" for xMP2 type optimization
#     DEV4) Add a new function into the class "ConfigIO" for "DFT_Fitting"
#        : get_OptJob
#     DEB5) Remove the unrequired chk file after result collection.
#        Changing code in "ConfigIO.run_GauBatch" for running energy
#        collection
#     DEV6) Rename the late temp scratch as the current one, if there is
#        only one existing scratch in "ProjDir" in "ConfigIO.QcmBatch"
#        It is for "SCF_GUESS=read" utility in Q-Chem package.
#     DEB7) Turn on the function of "extraoverlay" in "ConfigIO.get_GauIOCmd".
#     DEB8) Additional stopgap about running Gaussian job because of G09
#        being unable to handel "extraoverlay" correctly.
#        "ConfigIO.run_GauBatch()"
#  V3.1(20101017) :
#     DEV1) Add seven functions into the class "ConfigIO" for "KMC":
#        They are: 1) get_KMC_Environment; 2) get_KMC_Elements;
#                  3) get_KMC_Diffusions;  4) get_KMC_Desorptions;
#                  5) get_KMC_Reactions;   6) get_KMC_Adsorptions;
#                  7) calc_KMC_Adso_Rate;  8) calc_KMC_Deso_Rate;
#                  9) calc_KMC_Diff_Rate; 10) calc_KMC_Reac_Rate.
#  V3.2(20101228) :
#     DEV1) Add two functions into the class "ConfigIO" for "CP2K" batching:
#        They are: 1) get_CP2IOCmd();      2) run_CP2Batch()
#  V3.3(20110302) :
#     DEV1) Add several functions into the class "ConfigIO" for "KMC"
#  V4.0(20120521) :
#     DEV1) ADD two functions into the class "ConfigIO" for Aims calculation
#     DEV2) ADD a flag "__aims_basis__" into the class "ConfigIO" for
#       Aims basis set direction
#  V4.1(20130426) :
#     DEV1) ADD a flag "__aims_special_procs__" into the class "ConfigIO"
#       specifing the CPU number for special Aims jobs


def print_Error(IOut, Info):
    '''Report the error information "Info", and abort the process'''
    '''INPUT ARGUMENTS    ::'''
    '''IOut                : FLOW of output file'''
    '''Info                : STRING of error information to print'''
    from sys import exit
    IOut.write('*****\n*%s\n*****\n' % Info)
    print(Info)
    exit()
    return


def print_String(IOut, PString, IPrint, Info=''):
    '''To print the string "PString"'''
    '''  INPUT ARGUMENTS    ::'''
    '''IOut                : FLOW of output file'''
    '''PString             : SRING to print'''
    '''IPrint              : INTEGER to control the print formula'''
    '''                      0    :: Bypass the print'''
    '''                      1    :: Print both PString and Info'''
    '''                      2    :: Print in highline style'''
    '''                      3    :: Print PString and Info,'''
    '''                              without prompt "=>" before PString'''
    '''                      4    :: Print PString in primitive way'''
    '''Info                : STRING of info. of what to print'''
    NT = 80
    NN = NT - 2
    PL = len(PString)

    if IPrint == 0:   # Bypass the print
        pass
    elif IPrint == 1:  # Print both PString and Info
        NL = int(PL / NN)
        if PL == NL*NN:
            NL = NL - 1
        if NL > 0:
            BlankFlag = True
            BlankCount = 0
            for i in range(len(PString)):
                if PString[i] == ' ':
                    BlankCount += 1
            if BlankCount < NL:
                BlankFlag = False
            j = 0
            k = j+NN
            for i in range(NL):
                while BlankFlag and PString[k-1] != ' ':
                    k = k-1
                StrSplit = [PString[0:k], PString[k:]]
                PString = '\n  '.join(StrSplit)
                j = k+3
                k = j+NN
        if Info == '':
            IOut.write('=>%s\n' % PString)
        else:
            IOut.write('=>%s\n  %s\n' % (Info, PString))
    elif IPrint == 2:   # Print in highline style
        NL = PL/NN
        if PL == NL*NN:
            NL = NL-1
        if NL > 0:
            BlankFlag = True
            BlankCount = 0
            for i in range(len(PString)):
                if PString[i] == ' ':
                    BlankCount += 1
            if BlankCount < NL:
                BlankFlag = False
            j = 0
            k = j+NN
            for i in range(NL):
                while BlankFlag and PString[k-1] != ' ':
                    k = k-1
                StrSplit = [PString[0:k], PString[k:]]
                PString = '\n  '.join(StrSplit)
                j = k+3
                k = j+NN
        if Info != '':
            IOut.write('=>%s\n==%s==\n  %s\n==%s==\n'
                       % (Info, '-'*(NN-2), PString, '-'*(NN-2)))
        else:
            IOut.write('==%s==\n  %s\n==%s==\n'
                       % ('-'*(NN-2), PString, '-'*(NN-2)))
    elif IPrint == 3:    # Print string without prompt
        NL = PL / NN     # of "=>"
        if PL == NL*NN:
            NL = NL - 1
        if NL > 0:
            BlankFlag = True
            BlankCount = 0
            for i in range(len(PString)):
                if PString[i] == ' ':
                    BlankCount += 1
            if BlankCount < NL:
                BlankFlag = False
            j = 0
            k = j+NN
            for i in range(NL):
                while BlankFlag and PString[k-1] != ' ':
                    k = k-1
                StrSplit = [PString[0:k], PString[k:]]
                PString = '\n  '.join(StrSplit)
                j = k+3
                k = j+NN
        if Info == '':
            IOut.write('  %s\n' % PString)
        else:
            IOut.write('=>%s\n  %s\n' % (Info, PString))
    elif IPrint == 4:
        IOut.write('%s\n' % PString)
    else:
        print_Error(IOut, 'Error :: Invalid IPrint for print_String\n')
    return


def print_List(IOut, PList, IPrint, Info=''):
    '''To print the list "PList"'''
    '''  INPUT ARGUMENTS    ::'''
    '''    IOut   : FLOW of output file'''
    '''    PList  : LIST to print'''
    '''    IPrint : INTEGER to control the print formula'''
    '''             0 :: Bypass print'''
    '''             1 :: General cases'''
    '''             2 :: Print PList separately in different lines'''
    '''                  formated in "  %s"'''
    '''             3 :: Integrating the whole PList to be printed '''
    '''                  in a single line'''
    '''             4 :: Print each five numerical elements in one line '''
    '''                  formated in "%16.4E"'''
    '''             5 :: Similar with 4, but suit for the IO interface of '''
    '''                  the rGO package'''
    '''             6 :: Print list without info. and prompt "=>"'''
    '''    Info   : STRING of info. which to be printed before PList'''
    NT = 80
    NN = NT - 2
    if IPrint == 0:  # Bypass the print
        return
    elif IPrint == 1:  # Suit for general cases
        if Info == '':
            PString = '=>%s\n' % PList
        else:
            PString = '=>%s\n%s\n' % (Info, PList)
    elif IPrint == 2:    # Suit for "MachineList",
        TmpList = []     # "ExOvList","RestList" and
        for i in PList:  # text printing
            if i[-1:] == '\n':
                TmpList.append('  %s' % i)
            else:
                TmpList.append('  %s\n' % i)
        TmpPrint = ''.join(TmpList)
        if Info == '':
            PString = '=>\n%s' % TmpPrint
        else:
            PString = '=>%s\n%s' % (Info, TmpPrint)
    elif IPrint == 3:     # Suit for "OptionList",...
        try:
            TmpPrint = ' '.join(PList)
        except TypeError:
            TmpList = []
            for iterm in PList:
                TmpList.append('%s' % iterm)
            TmpPrint = ' '.join(TmpList)
        PL = len(TmpPrint)
        NL = PL/NN
        if NL*NN == PL:
            NL = NL-1
        if NL > 0:
            j = 0
            k = j+NN
            for i in range(NL):
                while TmpPrint[k-1] != ' ':
                    k = k-1
                TmpPrint = '\n  '.join([TmpPrint[0:k], TmpPrint[k:]])
                j = k+3
                k = j+NN
        if Info == '':
            PString = '=>%s\n' % TmpPrint
        else:
            PString = '=>%s\n  %s\n' % (Info, TmpPrint)
    elif IPrint == 4:     # Suit for numerical data
        NTT = len(PList)
        Index = 0
        OutPrint = []
        while Index < NTT:
            if ((Index+1) % 5) == 0 or Index+1 == NTT:
                OutPrint.append('%16.8E\n' % PList[Index])
            else:
                OutPrint.append('%16.8E' % PList[Index])
            Index = Index+1
        TmpPrint = ''.join(OutPrint)
        if Info == '':
            PString = '=>\n%s' % TmpPrint
        else:
            PString = '=>%s\n%s' % (Info, TmpPrint)
    elif IPrint == 5:     # Suit for interface of rGO
        NTT = len(PList)
        Index = 0
        OutPrint = []
        while Index < NTT:
            if ((Index+1) % 5) == 0 or Index+1 == NTT:
                OutPrint.append('%16.8E\n' % PList[Index])
            else:
                OutPrint.append('%16.8E' % PList[Index])
            Index = Index+1
        TmpPrint = ''.join(OutPrint)
        PString = '%s\n%s' % (Info, TmpPrint)
    elif IPrint == 6:    # Just print without info and prompt
        NTT = len(PList)
        Index = 0
        OutPrint = []
        while Index < NTT:
            if ((Index+1) % 5) == 0 or Index+1 == NTT:
                OutPrint.append('%16.8E\n' % PList[Index])
            else:
                OutPrint.append('%16.8E' % PList[Index])
            Index = Index + 1
        PString = ''.join(OutPrint)
    else:
        print_Error(IOut, 'Error :: Invalid IPrint for print_List\n')

    IOut.write(PString)  # Print result
    return


def print_List_free(IOut, PList, IPrint, FormList, Info=''):
    '''Print PList in "FormList" format customized by user.'''
    '''IPrint = 0  :: default, the same as 1;'''
    '''       = 1  :: to print all the list in the same FormList[0];'''
    '''       = 2  :: to treat the first element of list as the head,'''
    '''                then FormList[1] is utilized to print the head.'''
    if len(Info) != 0:
        PString = '=>%s :\n' % Info
    else:
        PString = ''
    for i in range(len(FormList)):
        if FormList[i][-2:] == '\n':
            FormList[i] = FormList[i][:-2]
    PString = PString + '==' + '-'*76 + '==' + '\n'
    if IPrint == 0 or IPrint == 1:
        for item in PList:
            try:
                PString = PString + FormList[0] % item + '\n'
            except TypeError:
                try:
                    PString = PString + FormList[0] % tuple(item) + '\n'
                except ValueError:
                    PString = PString + repr(item) + '\n'
    elif IPrint == 2:
        try:
            PString = PString + FormList[1] % tuple(PList[0]) + '\n'
        except ValueError:
            PString += repr(PList[0]) + '\n'
        PString += '-'*80 + '\n'
        for item in PList[1:]:
            try:
                PString += FormList[0] % item + '\n'
            except TypeError:
                try:
                    PString += FormList[0] % tuple(item) + '\n'
                except TypeError:
                    try:
                        PString += FormList[1] % tuple(item) + '\n'
                    except ValueError:
                        PString += repr(item) + '\n'
    PString += '==' + '-'*76 + '==' + '\n'
    IOut.write(PString)
    return


def print_SList(IOut, SList, Info=''):
    '''Calculate statistic result based on SList, and print it.'''
    '''AD, MAD, RMS, and correspond weighted ones are obtained here.'''
    '''SList[item]=[MoleName, RefData, CalcData, Deviation, Weight]'''
    from math import sqrt, pow
    if len(Info) > 0:
        IOut.write('=>%s\n' % Info)
    IOut.write('==%s==\n' % ('-'*76))
    TmpString = ['Name', 'Reference', 'Calc. Result', 'Deviation', 'Weight']
    IOut.write('%28s%16s%16s%13s%7s\n' % tuple(TmpString))
    IOut.write('%s\n' % ('-'*80))
    AD = 0.0
    MAD = 0.0
    RMS = 0.0
    wAD = 0.0
    wMAD = 0.0
    wRMS = 0.0
    NumData = 0
    for item in SList:
        try:
            IOut.write('%28s%16.8f%16.8f%13.2f%7.2f\n' % tuple(item))
            ii = item[3]
            jj = item[4]

            AD = AD + ii
            wAD = wAD + ii*jj

            MAD = MAD + abs(ii)
            wMAD = wMAD + abs(ii*jj)

            RMS = RMS + pow(ii, 2.0)
            wRMS = wRMS + pow(ii, 2.0)*jj

            NumData = NumData + 1
        except TypeError:
            IOut.write('%28s%16.8f%16s%13s%7.2f\n' % tuple(item))

    IOut.write('%s\n' % ('-'*80))
    if NumData > 0:
        AD = AD / NumData
        wAD = wAD / NumData
        MAD = MAD / NumData
        wMAD = wMAD / NumData
        RMS = sqrt(RMS) / NumData
        wRMS = sqrt(wRMS) / NumData
        IOut.write('%10s =   %16.8f\n' % ('AD', AD))
        IOut.write('%10s =   %16.8f\n' % ('MAD', MAD))
        IOut.write('%10s =   %16.8f\n' % ('RMS', RMS))
        IOut.write('%10s =   %16.8f\n' % ('wAD', wAD))
        IOut.write('%10s =   %16.8f\n' % ('wMAD', wMAD))
        IOut.write('%10s =   %16.8f\n' % ('wRMS', wRMS))
    else:
        AD = 'NAN'
        wAD = 'NAN'
        MAD = 'NAN'
        wMAD = 'NAN'
        RMS = 'NAN'
        wRMS = 'NAN'
        IOut.write('%10s =   %16s\n' % ('AD', AD))
        IOut.write('%10s =   %16s\n' % ('MAD', MAD))
        IOut.write('%10s =   %16s\n' % ('RMS', RMS))
        IOut.write('%10s =   %16s\n' % ('wAD', wAD))
        IOut.write('%10s =   %16s\n' % ('wMAD', wMAD))
        IOut.write('%10s =   %16s\n' % ('wRMS', wRMS))

    IOut.write('==%s==\n' % ('-'*76))
    return (AD, MAD, RMS, wAD, wMAD, wRMS)


def print_Matrix_numpy(IOut, PMatrix, IPrint, Info=''):
    '''Print Matrix'''
    from numpy import array

    len1, len2 = PMatrix.shape
    if len1 == len2:
        Length = len1
    else:
        tmpString = 'Error :: only square matrix could be printed' +\
            ' at \"print_Matrix\"'
        print_Error(IOut, tmpString)
    TmpMat = array(PMatrix)
    NumLine = int(Length/5)
    OutPrint = []
    if (Length % 5) != 0:
        NumLine += 1
    NumStart = 0
    for i in range(NumLine):
        TmpString = '     %s\n' % (
            5*'%15d' % tuple(range(NumStart, NumStart+5)))
        OutPrint.append('%s' % TmpString)
        for j in range(NumStart, Length):
            if j-NumStart < 5:
                TmpString = '%5d%s\n' % (
                    j, (j-NumStart+1)*'%15.6E' % tuple(
                        TmpMat[j, NumStart:j+1]))
                OutPrint.append('%s' % TmpString)
            else:
                TmpString = '%5d%s\n' % (
                    j, 5*'%15.6E' % tuple(
                        TmpMat[j, NumStart:NumStart+5]))
                OutPrint.append('%s' % TmpString)
        NumStart += 5
    TmpPrint = ''.join(OutPrint)
    if Info == '':
        PrintString = '=>\n%s' % TmpPrint
    else:
        PrintString = '=>%s\n%s' % (Info, TmpPrint)
    IOut.write('%s' % PrintString)
    return


def print_Matrix_headed(IOut, PMatrix, Info=''):
    '''Print PMatrix each five columns per line'''
    form1 = '=>%14s%16s%16s%16s%16s\n'
    form2 = '%16.8f%16.8f%16.8f%16.8f%16.8f\n'
    NumRow = len(PMatrix[0])
    NumLine = NumRow / 5
    NumRest = NumRow % 5
    if NumRest == 0:
        pass
    if NumRest == 1:
        form3 = '=>%14s\n'
        form4 = '%16.8f\n'
    if NumRest == 2:
        form3 = '=>%14s%16s\n'
        form4 = '%16.8f%16.8f\n'
    if NumRest == 3:
        form3 = '=>%14s%16s%16s\n'
        form4 = '%16.8f%16.8f%16.8f\n'
    if NumRest == 4:
        form3 = '=>%14s%16s%16s%16s\n'
        form4 = '%16.8f%16.8f%16.8f%16.8f\n'
    if len(Info) != 0:
        IOut.write('=>%s\n' % Info)
    for i in range(NumLine):
        start = i*5
        end = i*5 + 5
        for item in PMatrix:
            try:
                IOut.write(form2 % tuple(item[start:end]))
            except TypeError:
                IOut.write(form1 % tuple(item[start:end]))
    if NumRest != 0:
        start = NumLine*5
        try:
            IOut.write(form4 % tuple(item[start:]))
        except TypeError:
            IOut.write(form3 % tuple(item[start:]))
    return


def read_Matrix_headed(IOut, FileName, Info=''):
    '''Loading the formated matrix from the file named "FileName"'''
    '''The first line of matrix is a list of heads for each columns.'''
    '''The rest should be the data in numerical real format.'''
    '''Optional: "Info" could be the label standing for the start of Matrix.'''
    '''Return this matrix and also the matrix length (PMatrix, Index).'''
    from os.path import isfile
    from re import compile
    if not isfile(FileName):
        tmpString = 'Error occurs :: the file of "%s" doesn\'t exist' \
            % FileName
        print_Error(IOut, tmpString)
    else:
        rf = file(FileName, 'r')
    if len(Info) != 0:
        p1 = compile(Info)
        TmpString = rf.read().strip()
        if p1.search(TmpString):
            LocPos = p1.search(TmpString).start()
            rf.seek(LocPos)
            rf.readline()
        else:
            rf.seek(0)
    else:
        pass
    PMatrix = []
    TmpList = [x.strip() for x in rf.read().split('\n')]
    for i in range(TmpList.count('')):
        TmpList.remove('')
    p1 = compile('=>')
    for line in TmpList:
        item = [x.strip() for x in line.split()]
        rep = p1.match(item[0])
        if len(item) == 5 and rep:
            item[0] = item[0][2:]
            Index = 0
            try:
                PMatrix[Index].extend(item)
                Index += 1
            except IndexError:
                PMatrix.append(item)
                Index += 1
        elif len(item) == 6 and rep:
            itemB = [x.strip() for x in item[1:]]
            Index = 0
            try:
                PMatrix[Index].extend(itemB)
                Index += 1
            except IndexError:
                PMatrix.append(itemB)
                Index += 1
        elif len(item) == 5 and not rep:
            try:
                PMatrix[Index].extend([float(x) for x in item])
                Index += 1
            except IndexError:
                PMatrix.append([float(x) for x in item])
                Index += 1
            except ValueError:
                tmpString = 'Error occures in converting string to float' +\
                    ' "read_Matrix_headed"\n' + '%s' % item
                print_Error(IOut, tmpString)
    return (PMatrix, Index)


def my_plus(a1, a2):
    '''if valid :a = a1 + a2; else return a = "NAN"'''
    try:
        a = a1 + a2
    except TypeError:
        a = 'NAN'
    return a


def my_substract(a1, a2):
    '''if valid :a = a1 - a2; else return a = "NAN"'''
    try:
        a = a1 - a2
    except TypeError:
        a = 'NAN'
    return a


def my_product(a1, a2):
    '''if valid :a = a1 * a2; else return a = "NAN"'''
    try:
        a = a1 * a2
    except TypeError:
        a = 'NAN'
    return a


def my_divide(a1, a2):
    '''if valid :a = a1 / a2; else return a = "NAN"'''
    try:
        a = a1 / a2
    except TypeError:
        a = 'NAN'
    return a


def my_vect_plus(vect1, vect2):
    '''calculate vector addition'''
    return [i[0]+i[1] for i in zip(vect1, vect2)]


def my_vect_substract(vect1, vect2):
    '''calculate vector substraction'''
    return [i[0]-i[1] for i in zip(vect1, vect2)]


def my_vect_product(vector, scale):
    '''multiple vector by scale'''
    return [i*scale for i in vector]


def my_cross(vect1, vect2):
    '''calculate cross product'''
    if len(vect1) != 3 or len(vect2) != 3:
        return 'NAN'
    NormVect = [0.0]*3
    try:
        NormVect[0] = vect1[1]*vect2[2]-vect1[2]*vect2[1]
        NormVect[1] = vect1[0]*vect2[2]-vect1[2]*vect2[0]
        NormVect[2] = vect1[0]*vect2[1]-vect1[1]*vect2[0]
    except IndexError or TypeError:
        NormVect = ['NAN']*3
    return NormVect


def my_dot(vect1, vect2):
    '''calculate dot product'''
    return sum(i[0]+i[1] for i in zip(vect1, vect2))


def my_bond(atom1, atom2):
    '''Calculate bond distance'''
    from math import sqrt
    if len(atom1) != 3 or len(atom2) != 3:
        return 'NAN'
    Vect1 = [0.0]*3
    for i in range(3):
        try:
            Vect1[i] = atom1[i] - atom2[i]
        except TypeError:
            return 'NAN'
    bond = sqrt(my_dot(Vect1, Vect1))
    return bond


def my_angle(atom1, atom2, atom3):
    '''calculate the angle of 1-2-3, and return the angle in "degree"'''
    from math import sqrt
    from math import acos
    from math import pi
    if len(atom1) != 3 or len(atom2) != 3 or len(atom3) != 3:
        return 'NAN'
    Vect1 = [0.0]*3
    Vect2 = [0.0]*3
    Dist1 = 0.0
    Dist2 = 0.0
    CosAng = 0.0
    for i in range(3):
        try:
            Vect1[i] = atom1[i]-atom2[i]
        except ValueError or TypeError or IndexError:
            return 'NAN'
        try:
            Vect2[i] = atom3[i]-atom2[i]
        except ValueError or TypeError or IndexError:
            return 'NAN'
    Dist1 = sqrt(my_dot(Vect1, Vect1))
    Dist2 = sqrt(my_dot(Vect2, Vect2))
    CosAng = my_dot(Vect1, Vect2)/(Dist1*Dist2)
    Angl = acos(CosAng)/pi*180.0
    return Angl


def my_dihedral(atom1, atom2, atom3, atom4):
    '''calculate the angle of 1-2-3-4, and return the dihedral in "degree"'''
    from math import sqrt
    from math import acos
    from math import pi
    if len(atom1) != 3 \
            or len(atom2) != 3 \
            or len(atom3) != 3 \
            or len(atom4) != 3:
        return 'NAN'
    Vect1 = [0.0]*3
    Vect2 = [0.0]*3
    Vect3 = [0.0]*3
    NormVect1 = [0.0]*3
    NormVect2 = [0.0]*3
    Dist1 = 0.0
    Dist2 = 0.0
    CosAng = 0.0
    Scale = 1.0
    for i in range(3):
        try:
            Vect1[i] = atom1[i]-atom2[i]
        except TypeError or ValueError:
            return 'NAN'
        try:
            Vect2[i] = atom3[i]-atom2[i]
        except TypeError or ValueError:
            return 'NAN'
        try:
            Vect3[i] = atom4[i]-atom3[i]
        except TypeError or ValueError:
            return 'NAN'
    NormVect1 = my_cross(Vect1, Vect2)
    NormVect2 = my_cross(Vect3, Vect2)
    Dist1 = sqrt(my_dot(NormVect1, NormVect1))
    Dist2 = sqrt(my_dot(NormVect2, NormVect2))
    CosAng = my_dot(NormVect1, NormVect2)/(Dist1*Dist2)
    if my_dot(my_cross(NormVect1, NormVect2), Vect2) <= 0:
        Scale = 1.0
    else:
        Scale = -1.0
    Dihe = Scale * acos(CosAng)/pi*180.0
    return Dihe


def my_permute(items, n=None):
        '''Build permutation iteration'''
        if n is None:
            n = len(items)
        for i in range(len(items)):
            v = items[i:i+1]
            if n == 1:
                yield v
            else:
                rest = items[:i] + items[i+1:]
                for p in my_permute(rest, n-1):
                    yield v + p


def my_combinate(items, n=None):
        '''build combination iteration'''
        if n is None:
            n = len(items)
        for i in range(len(items)):
            v = items[i:i+1]
            if n == 1:
                yield v
            else:
                rest = items[i+1:]
                for c in my_combinate(rest, n-1):
                    yield v + c


class ConfigIO:
    '''Control the project IO based on well-define configuration file'''
    ResuDict = {'energy': [],
                'polar': [],
                'nmr': [],
                'geom': [],
                'pt21': [],
                'pt22': [],
                'xyg3': [],
                'xmp2': [],
                }
    AlphDict = {0: 'A', 1: 'B', 2: 'C', 3: 'D', 4: 'E', 5: 'F',
                6: 'G', 7: 'H', 8: 'I', 9: 'J', 10: 'K',
                11: 'L', 12: 'M', 13: 'N', 14: 'O', 15: 'P',
                16: 'Q', 17: 'R', 18: 'S', 19: 'T', 20: 'U',
                21: 'V', 22: 'W', 23: 'X', 24: 'Y', 25: 'Z'
                }

    def __init__(self, iout, fn=None, bugctrl=0):
        '''Open configure file, and set default parameters'''
        from os.path import abspath

        self.IOut = iout
        self.FileName = fn
        self.IPrint = bugctrl
        if fn is None:
            pass
        else:
            try:
                self.f = open(self.FileName, 'r')
            except IOError:
                print_Error(self.IOut, 'Error in open config file')

        # Current work direction
        self.WorkDir = abspath('./')
        # The folder to store the project results
        self.ProjDir = ''
        # Different batch modes
        #   0: calculate all jobs
        #   1: collect results from
        #      exists log and chk files
        #   2: combination of 0 and 1
        #      0). calc. job. if not
        #          log and chk exist
        #      1). escape job calc. if
        #          log and chk exist
        self.ProjCtrl = 0
        # The electronic-structure packages used. Supported packages include:
        #     gaussian
        #     qchem
        #     fhi-aims
        #     xyg3_fit
        #     existing components
        self.ProjTool = 'gaussian'
        self.PathList = []  # Macro-Path environment
        self.Title = []

        # Input info. for Gaussian Job
        self.OptionList = []      # 1) Job control keywords
        self.MachineList = []     # 2) Machine statements
        self.ExOvList = []        # 3) Extra overlay statements

        # Input info. for Qchem Job
        self.RemList = []         # 1) Job control in $rem
        self.XCFList = []         # 2) XC in $xc_functional
        # 0 for serial version qchem
        # 1 for parallel version qchem
        self.ParaOrSeri = 0
        self.QchCfg = ''          # Relate to the global variable of $QCCFG

        # Input info. for Aims Job
        self.Procs = 1            # Num. of CPUs to run aims jobs, global set
        self.Threads = 1          # Num. of threads per task
        self.NPN = 32             # Num. of tasks per node
        self.AimsCfg = 'igor'     # Version of the aims excutable used
        self.add_CMD = []         # Additional commands for control.in
        self.Special_Procs = {}   # Num. of CPUs to run aims for special jobs
        self.BatchType = 'series'
        self.BatchCmd = ''
        self.BatchScriptName = 'Aims_Environment'

        # Number of batch jobs
        self.NBatc = 0
        self.BatcList = []

        self.NComp = 0            # Components for DFT Fitting
        self.CompDict = {}

        self.InitGuess = []       # Initial guess for DFT Fitting
        self.OptAlgo = 'leastsq'

        self.Result = []          # Deviations for DFT Fitting

        # Number of training energy
        self.NEngy = 0
        self.SEngy = 1.0          # Scale factor

        self.EngyList = []

        self.NPT21 = 0            # Number of training PT21
        self.SPT21 = 1.0          # Scale factor
        self.PT21List = []

        self.NPT22 = 0            # Number of training PT22
        self.SPT22 = 1.0          # Scale factor
        self.PT22List = []

        self.NResp = 0            # Number of elec. prop.
        self.SResp = [1.0, 1.0, 1.0]  # Scal factors
        self.RespList = []

        self.NNMR = 0      # Number of NMR data
        self.SNMR = 1.0    # Scale factor from calc. nmr to ref. data
        self.NMRList = []

        self.NGeom = 0                 # Number of Geom data
        self.SGeom = [1.0, 1.0, 1.0]   # Unit transfer factor from Angstron
        self.GeomList = []
        return

    def __del__(self):
        if self.FileName is None:
            pass
        else:
            self.f.close()
        return

    def get_ProjEnvr(self):
        '''1) Obtain project description "Title" by "__title__ ";'''
        '''2) Obtain project environment "ProjDir", "ProjCtrl" and'''
        '''   "ProjTool" by "__project__ ";'''
        '''3) Obtain macro-path environment "PathList" by "__macro_path__ "'''
        from re import compile
        from os import rename, mkdir, makedirs, listdir, remove
        from os.path import isdir, abspath, isfile
        from my_io import print_Error, print_List, print_String
        # ================================#
        #  Now obtain project description #
        # ================================#
        p1 = compile('__title__ *::')
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            self.f.readline()
            TmpLine = self.f.readline().strip()
            while len(TmpLine) != 0:
                self.Title.append(TmpLine)
                TmpLine = self.f.readline().strip()
        if len(self.Title) != 0:
            print_List(self.IOut, self.Title, 2, 'This project aims to ::')

        # ================================#
        #  Now obtain project environment #
        # ================================#
        ProjCtrlInfo = ['to run all the jobs',
                        'to fetch results from existed file',
                        'to run the job, if no log and chk exist']
        p1 = compile('__project__ *::')
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).end()
            self.f.seek(LocPos)
            # Split the keywords by ignoring the possible annotation
            TmpList = self.f.readline().split('#')[0].split()
            if len(TmpList) == 0:
                self.ProjDir = ''
                self.ProjCtrl = 0
                self.ProjTool = 'gaussian'
            elif len(TmpList) == 1:
                try:
                    self.ProjDir = ''
                    self.ProjCtrl = int(TmpList[1])
                    self.ProjTool = 'gaussian'
                except ValueError:
                    if TmpList[1].lower() == 'gaussian' \
                            or TmpList[1].lower() == 'qchem' \
                            or TmpList[1].lower() == 'aims':
                        self.ProjDir = ''
                        self.ProjCtrl = 0
                        self.ProjTool = TmpList[1].lower()
                    else:
                        self.ProjDir = TmpList[1].strip()
                        self.ProjCtrl = 0
                        self.ProjTool = 'gaussian'
            elif len(TmpList) == 2:
                if TmpList[1].lower() == 'gaussian' or\
                        TmpList[1].lower() == 'qchem' or\
                        TmpList[1].lower() == 'aims':
                    self.ProjDir = ''
                    self.ProjCtrl = int(TmpList[0])
                    self.ProjTool = TmpList[1].lower()
                elif TmpList[0].lower() == 'gaussian' or\
                        TmpList[0].lower() == 'qchem' or\
                        TmpList[0].lower() == 'aims':
                    print_Error(self.IOut, 'Error "__project__" statement (2)')
                else:
                    self.ProjDir = TmpList[0]
                    self.ProjCtrl = int(TmpList[1])
                    self.ProjTool = 'gaussian'
            elif len(TmpList) == 3:
                try:
                    self.ProjDir = TmpList[0]
                    self.ProjCtrl = int(TmpList[1])
                    self.ProjTool = TmpList[2].lower()
                except ValueError:
                    print_Error(self.IOut, 'Error "__project__" statement (3)')
        else:
            self.ProjDir = ''
            self.ProjCtrl = 0
            self.ProjTool = 'gaussian'
        if self.ProjDir != '':        # set absolute path for ProjDir
            self.ProjDir = abspath(self.ProjDir)
        print_String(self.IOut, '1) Project pool is "%s"' % self.ProjDir, 1)
        print_String(self.IOut, '2) Project batch type is "%d" '
                     % self.ProjCtrl +
                     'which %s' % ProjCtrlInfo[self.ProjCtrl], 1)
        print_String(self.IOut, '3) QC package employed is "%s"'
                     % self.ProjTool, 1)
        if len(self.ProjDir) > 0:
            if self.ProjCtrl == 0:
                if isdir(self.ProjDir):
                    for xFile in listdir(self.ProjDir):
                        if isfile(xFile) and xFile[-4:]=='.log':
                            remove('%s/%s' %(self.ProjDir, xFile))
                    #rename(self.ProjDir, '%s_BackUp' % self.ProjDir)
                    #mkdir(self.ProjDir)
                else:
                    makedirs(self.ProjDir)
            elif self.ProjCtrl == 1:
                if isdir(self.ProjDir):
                    pass
                else:
                    print_Error(self.IOut,
                                'DIR \"%s\" doesn\'t exists for ProjCtrl=1'
                                % self.ProjDir)
            elif self.ProjCtrl == 2:
                if isdir(self.ProjDir):
                    pass
                else:
                    makedirs(self.ProjDir)

        # ===================================#
        #  Now obtain <MacroPath> environment#
        # ===================================#
        p1 = compile('__macro_path__ *::')
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            self.f.readline().strip()
            TmpString = self.f.readline().strip()
            while TmpString[0] == '#':
                TmpString = self.f.readline().strip()
            TmpLine = \
                tuple([x.strip() for x in
                      TmpString.replace(',', '  ').replace('=', '  ').
                      replace('\'', '  ').replace('"', '  ').
                      split()])
            while len(TmpLine) == 2:
                self.PathList.append(TmpLine)
                TmpString = self.f.readline().strip()
                while len(TmpString) != 0 and TmpString[0] == '#':
                    TmpString = self.f.readline().strip()
                TmpLine = \
                    tuple([x.strip() for x in
                          TmpString.replace(',', '  ').replace('=', '  ').
                          replace('\'', '  ').replace('"', '  ').split()])
        if len(self.PathList) != 0:
            tmpString = 'There are %d <Macro-Path>s specified in %s :' \
                % (len(self.PathList), self.FileName)
            print_String(self.IOut, tmpString, 1)
            for macro, path in self.PathList:
                if len(macro) >= 9:
                    macro = macro[:6]+'...'
                if len(path) >= 53:
                    path = path[:50]+'...'
                len1 = 10 - len(macro)
                print_String(self.IOut, 'Macro-Path :%s%s = %s'
                             % (' '*len1, macro, path), 3)
        return

    def get_GauIOCmd(self):
        '''Obtain MachineList and OptionList for GausIO class'''
        from re import compile
        from io import StringIO
        from copy import deepcopy
        from my_io import print_String
        from my_io import print_List
        from gaussian_manage import GauIO
        p1 = compile('__gaussian__ *::')
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            self.KickOptionList = ['nonstd']
            tmpString = 'Following option(s) is(are) invalid in BATCH :'
            print_List(self.IOut, self.KickOptionList, 3, tmpString)
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            self.f.readline()
            LocPos = self.f.tell()
            TmpGau = GauIO(self.IOut, fn=None, bugctrl=0)
            TmpGau.f = StringIO(TmpFile[LocPos:])
            TmpGau.get_MachAndOpt()
            TmpGau.KickOptionList = self.KickOptionList[:]
            TmpGau.ctrl_Option()
            self.OptionList = TmpGau.OptionList[:]
            self.MoreOptionDict = deepcopy(TmpGau.MoreOptionDict)
            self.MachineList = TmpGau.MachineList[:]
            self.ExOvList = TmpGau.ExOvList[:]
        else:
            if self.IPrint >= 2:
                tmpString = 'No machine and option lists are specified'
                print_String(self.IOut, tmpString, 1)
        return

    def get_QcmIOCmd(self):
        '''Obtain RemList for QchemIO class'''
        from re import compile
        from copy import deepcopy
        from io import StringIO
        from my_io import print_String
        from qchem_manage import QChemIO
        p1 = compile('__qchem__ *::')
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            tmpList = self.f.readline().split("::")
            if len(tmpList) == 2:
                tmpList = tmpList[1].split('#')[0].split()
                if len(tmpList) ==1:
                    try:
                        self.ParaOrSeri = int(tmpList[0])
                        self.QchCfg = 'rmp2'
                    except ValueError:
                        pass
                if len(tmpList) == 2:
                    try:
                        self.ParaOrSeri = int(tmpList[0])
                        self.QchCfg = tmpList[1].strip()
                    except ValueError:
                        pass
            if self.IPrint >= 1:
                if self.ParaOrSeri == 0:
                    print_String(self.IOut,
                        'This batch run parallel qchem',1)
                if self.ParaOrSeri == 1:
                    print_String(self.IOut,
                        'This batch run series qchem',1)
            LocPos = self.f.tell()
            p2 = compile('$end')
            EndPos = 0
            for iterm in p2.finditer(self.f.read()):
                tmpPos = iterm.end()
                if tmpPos > EndPos:
                    EndPos = tmpPos
            TmpQchem = QChemIO(self.IOut,fn=None,bugctrl=0)
            TmpQchem.f = StringIO(TmpFile[LocPos:LocPos+EndPos])
            TmpQchem.get_Input()
            self.InpuDict = deepcopy(TmpQchem.InpuDict)
        else:
            if self.IPrint >= 2:
                print_String(self.IOut, 'No Q-Chem inputs are specified', 1)
        return

    def get_AimIOCmd(self):
        '''Obtain keywords for FHI-aims' jobs:'''
        '''   1) __aims__ '''
        '''   2) __aims_basis__ '''
        '''   3) __aims_special_nproc__ '''
        '''   4) __aims_batch_type__ '''
        from re import compile, MULTILINE
        from my_io import print_Error, print_String
        p1 = compile('^ *__aims__ *::', MULTILINE)
        self.f.seek(0)
        TmpFile = self.f.read()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile.lower()).start()
            self.f.seek(LocPos)
            tmpList = self.f.readline().split("::")
            if len(tmpList) == 2:
                tmpList = tmpList[1].split('#')[0].split()
                if len(tmpList) == 1:
                    try:
                        self.Procs = int(tmpList[0])
                        self.Threads = 1
                        self.NPN = 32
                        self.AimsCfg = 'igor'
                    except ValueError:
                        self.Procs = 1
                        self.Threads = 1
                        self.NPN = 1
                        self.AimsCfg = 'igor'
                elif len(tmpList) == 2:
                    try:
                        self.Procs = int(tmpList[0])
                        self.Threads = 1
                        self.NPN = 32
                        self.AimsCfg = tmpList[1].strip()
                    except ValueError:
                        self.Procs = 1
                        self.Threads = 1
                        self.NPN = 1
                        self.AimsCfg = 'igor'
                elif len(tmpList) == 4:
                    try:
                        self.Procs = int(tmpList[0])
                        self.Threads = int(tmpList[1])
                        self.NPN = int(tmpList[2])
                        self.AimsCfg = tmpList[3].strip()
                    except ValueError:
                        self.Procs = 1
                        self.Threads = 1
                        self.NPN = 1
                        self.AimsCfg = 'igor'
                else:
                    print_Error(self.IOut,
                                'Error :: Unknown input for __aims__')
            if self.IPrint >= 1:
                print_String(self.IOut, 'This batch runs for aims', 1)
            LocPos = self.f.tell()
            p2 = compile('end aims')
            if p2.search(TmpFile.lower()):
                EndPos = p2.search(TmpFile.lower()).start()
            else:
                print_Error(self.IOut,
                            "Error :: No stop sign for aims\'s control.in")
            ff = open('%s/control.in' % self.ProjDir, 'w')
            ff.write(TmpFile[LocPos:EndPos])
            ff.close()
        else:
            if self.IPrint >= 2:
                print_String(self.IOut,
                             'No Aims\'s control.in is specified',
                             1)

        p1 = compile('^ *__aims_basis__ *::', MULTILINE)
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile.lower()).start()
            self.f.seek(LocPos)
            tmpList = self.f.readline().split("#")[0].split("::")
            self.BasisDir = tmpList[-1].strip()
            print_String(self.IOut,
                         'Basis sets are loading from %s' % self.BasisDir,
                         1)

        p1 = compile('^ *__aims_special_nproc__ *::', MULTILINE)
        if p1.search(TmpFile):
            for p1result in p1.finditer(TmpFile.lower()):
                LocPos = p1result.start()
                self.f.seek(LocPos)
                try:
                    tmpList = self.f.readline().split("#")[0].split("::")
                    try:
                        tmpList = [int(x)-1 for x in tmpList[-1].split()]
                        nprocs = tmpList[0]+1
                        self.Special_Procs[nprocs] = tmpList[1:]
                    except ValueError:
                        print_String(self.IOut,
                                     'Error in reading CPU numbers ' +
                                     'for special aims jobs', 1)
                        pass
                except:
                    pass
        p1 = compile('^ *__aims_batch_type__ *::', MULTILINE)
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile.lower()).start()
            self.f.seek(LocPos)
            tmpList = self.f.readline().split("#")[0].split("::")
            if len(tmpList) == 2:
                tmpList = tmpList[1].split('#')[0].split()
                if len(tmpList) == 1:
                    self.BatchType = tmpList[-1].strip().lower()
                    if self.BatchType == 'queue':
                        self.BatchCmd = 'brun'
                        self.BatchScriptName = 'aims_runscr'
                        self.BatchQueueName = 'default'
                    elif self.BatchType == 'serial':
                        self.BatchScriptName = 'Aims_Environment'
                elif len(tmpList) == 2:
                    self.BatchType = tmpList[-2].strip().lower()
                    if self.BatchType == 'queue':
                        self.BatchCmd = tmpList[-1].strip()
                        self.BatchScriptName = 'aims_runscr'
                        self.BatchQueueName = 'default'
                    elif self.BatchType == 'serial':
                        self.BatchScriptName = tmpList[-1].strip()
                    else:
                        print_Error(self.IOut, 
                                    'Error :: Unknown BathType for aims_batch_type')
                elif len(tmpList) == 3:
                    self.BatchType = tmpList[-3].strip().lower()
                    if self.BatchType == 'queue':
                        self.BatchCmd = tmpList[-2].strip()
                        self.BatchScriptName = tmpList[-1].strip()
                        self.BatchQueueName = 'default'
                    elif self.BatchType == 'serial':
                        self.BatchScriptName = tmpList[-1].strip()
                    else:
                        print_Error(self.IOut, 
                                    'Error :: Unknown BathType for aims_batch_type')
                elif len(tmpList) == 4:
                    self.BatchType = tmpList[-4].strip().lower()
                    if self.BatchType == 'queue':
                        self.BatchCmd = tmpList[-3].strip()
                        self.BatchScriptName = tmpList[-2].strip()
                        self.BatchQueueName = tmpList[-1].strip()
                    elif self.BatchType == 'serial':
                        self.BatchScriptName = tmpList[-1].strip()
                    else:
                        print_Error(self.IOut, 
                                    'Error :: Unknown BathType for aims_batch_type')
                else:
                    print_Error(self.IOut,
                                'Error :: Unknown input for aims_batch_type')
                print_String(self.IOut, 'The batch type is %s'
                             % self.BatchType, 1)
            else:
                print_Error(self.IOut,
                            'Error :: Unknown input for aims_batch_type')
        return

    def get_CP2IOCmd(self):
        '''Obtain CP2K Input file'''
        from re import compile, MULTILINE
        from copy import deepcopy
        from io import StringIO
        from my_io import print_String
        from cp2k_manage import CP2KIO
        p1 = compile('^ *__cp2k__ *::', MULTILINE)
        self.f.seek(0)
        TmpFile = self.f.read()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            self.f.readline()
            LocPos = self.f.tell()
            p2 = compile('&[Ee][Nn][Dd]')
            EndPos = 0
            for iterm in p2.finditer(self.f.read().lower()):
                tmpPos = iterm.end()
                if tmpPos > EndPos:
                    EndPos = tmpPos
            TmpCP2K = CP2KIO(self.IOut,fn=None,bugctrl=2)
            TmpCP2K.f = StringIO(TmpFile[LocPos:LocPos+EndPos])
            TmpCP2K.get_Input()
            self.InpuDict = deepcopy(TmpCP2K.InpuDict)
        else:
            if self.IPrint >= 1:
                print_String(self.IOut,
                             'No CP2K inputs are specified',
                             1)
        return

    def get_Batch(self):
        '''Obtain the batch job list'''
        from os.path import isfile, isdir
        from re import compile, MULTILINE
        from copy import deepcopy
        from my_io import print_Error
        from my_io import print_List_free
        p1 = compile('^ *__batch__ *::', MULTILINE)
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()
        else:
            print_Error(self.IOut,
                'Error in accessing to batch set '+\
                ' \"ConfigIO.get_Batch\"')
            return
        try:
            self.NBatc=int(TmpLine.split('::')[1])
        except ValueError:
            print_Error(self.IOut,
                'Error in obtain the molecular number in the Batch'+\
                ' \"ConfigIO.get_Batch\"')

        for i in range(self.NBatc):
            TmpLine = self.f.readline().strip()
            if len(TmpLine) == 0:
                print_Error(self.IOut,
                'Interlude of blank line in Batch is forbidden')
            while TmpLine[0]=='#':                                   # To ignore annotations
                TmpLine = self.f.readline().strip()
                if len(TmpLine) == 0:
                    print_Error(self.IOut,
                    'Interlude of blank line in Batch is forbidden')
            TmpLine = TmpLine.split('#')[0].strip()                  # To ignore annotations

            self.BatcList.append(TmpLine.split())

            for macro, path in self.PathList:                        # Handle Macro-Path
                self.BatcList[i][1] = self.BatcList[i][1].\
                    replace(macro,path)

            if len(self.BatcList[i]) == 3:
                self.BatcList[i][3].append('energy')
            elif len(self.BatcList[i]) !=4:
                print_List(self.IOut,self.BatcList[i],3)
                print_Error(self.IOut,
                    'Error in BatcList obtaining '+\
                    '\"ConfigIO.get_Batch\"')
            if (self.BatcList[i][2]!='XYG3_Comp'):                   # Manage for read components
                if isfile('%s/%s'
                    %(self.BatcList[i][1],self.BatcList[i][2])) or\
                   isdir('%s/%s'
                    %(self.BatcList[i][1],self.BatcList[i][2])):
                    self.BatcList[i].append(deepcopy(ConfigIO.ResuDict))
                else:
                    print_Error(self.IOut,
                        'Error in file existence '+\
                        '\"ConfigIO.get_Batch\" :\n '+\
                        '(%s/%s)'
                        %(self.BatcList[i][1],self.BatcList[i][2]))
            else:
                self.BatcList[i].append(deepcopy(ConfigIO.ResuDict))
        self.f.readline()
        if self.IPrint >= 1:
            TmpList = []
            for i in range(self.NBatc):
                TmpList.append(['%3dth' %i])
                TmpList[i].extend(\
                    [x for x in self.BatcList[i][:-1]])
                if len(TmpList[i][1])>10:                            # Trim the label of the job
                    TmpList[i][1] = TmpList[i][1][:7]+'...'
                if len(TmpList[i][2])>31:                            # Trim the DIR of the job
                    TmpList[i][2] = TmpList[i][2][:28]+'...'
                if len(TmpList[i][3])>10:                            # Trim the job input name
                    TmpList[i][3] = TmpList[i][3][:7]+'...'
                if len(TmpList[i][4])>14:                            # Trim the job type
                    TmpList[i][4] = TmpList[i][4][:11]+'...'
            PrintList =\
                [['Index','Name','Direction','JobInput','JobType']]
            PrintList.extend(TmpList)
            FormList = ['%5s%12s%33s%12s%16s',
                '%5s%12s%33s%12s%16s']
            print_List_free(self.IOut,PrintList,2,FormList,
                'Loaded ConfigIO.BatcList')
        return

    def get_TrainSet(self):
        '''Obtain training set from config file'''
        from my_io   import print_Error
        from my_io   import print_List
        from my_io   import print_String
        from my_io   import print_List_free
        from re      import compile
        from re      import MULTILINE
        #=====================================#
        #Obtain info. of energy evaluation set#
        #=====================================#
        p1 = compile('^ *__energy__ *::', MULTILINE)
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()    # To ignore annotations
            TmpLine = TmpLine.split('::')[1].strip().\
                replace(',','   ').replace('=','   ')
            if len(TmpLine.split()) ==1:
                try:
                    self.NEngy = int(TmpLine.split()[0])
                    self.SEngy = 1.0
                except ValueError:
                    print_Error(self.IOut,
                        'Error in obtaining the length of EngyList'+\
                        ' \"ConfigIO.get_TrainSet\"')
            elif len(TmpLine.split()) >= 2:
                try:
                    self.NEngy = int(TmpLine.split()[0])
                    self.SEngy = float(TmpLine.split()[1])
                except ValueError:
                    print_Error(self.IOut,
                        'Error in obtaining the length of EngyList'+\
                        ' \"ConfigIO.get_TrainSet\"')

            for i in range(self.NEngy):
                TmpLine = self.f.readline().strip()                  # To ignore annotations
                if len(TmpLine) == 0:
                    print_Error(self.IOut,
                    'Interlude of blank line is forbidden'+\
                        ' \"ConfigIO.get_TrainSet\"')
                while TmpLine[0]=='#':
                    TmpLine = self.f.readline().strip()
                    if len(TmpLine) == 0:
                        print_Error(self.IOut,
                        'Interlude of blank line is forbidden'+\
                            ' \"ConfigIO.get_TrainSet\"')
                TmpLine = TmpLine.split('#')[0].strip()              # To ignore annotations

                self.EngyList.append(TmpLine.split())
                try:
                    self.EngyList[i][0]=int(self.EngyList[i][0])
                except ValueError:
                    print_Error(self.IOut,
                        'Error :: EngyList[%d][0] is an invalid integer'
                        % i + ' \"ConfigIO.get_TrainSet\"')
                if len(self.EngyList[i]) !=(self.EngyList[i][0]*2+3):
                    print_Error(self.IOut,
                        'Error :: EngyList[%d][0] is inconsistent ' %i \
                        + 'with the number of the following molecules' \
                        + ' \"ConfigIO.get_TrainSet\"')
                for l in range(self.EngyList[i][0]):
                    for j in range(self.NBatc):
                        k = l*2 + 1
                        if self.EngyList[i][k].strip().lower() ==\
                            self.BatcList[j][0].strip().lower():
                            self.EngyList[i][k]=j
                            break
                    else:
                        print_Error(self.IOut,
                            'Error in batch flag identifying of %s'\
                            % self.EngyList[i][k] +\
                            '\"ConfigIO.get_TrainSet\"')
                    k = l*2 + 2
                    try:
                        self.EngyList[i][k]=float(self.EngyList[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtaining the weight of '+\
                            'molecular energy'+\
                            '\"ConfigIO.get_TrainSet\"')
                else:
                    try:
                        k = self.EngyList[i][0]*2 + 1
                        self.EngyList[i][k] =\
                            float(self.EngyList[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtaining the reference energy'+\
                            '\"ConfigIO.get_TrainSet\"')
                    try:
                        k = self.EngyList[i][0]*2 + 2
                        self.EngyList[i][k] =\
                            float(self.EngyList[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtain the weight of'+\
                            'testing data'+\
                            '\"ConfigIO.get_TrainSet\"')
            if self.IPrint >= 1 and self.NEngy>0:
                MaxNum = 1
                for item in self.EngyList:
                    if item[0] > MaxNum:
                        MaxNum = item[0]
                FormList = ['%5s','%5s']
                PrintList = [['Num.']]
                for i in range(MaxNum):
                    FormList[0] = FormList[0] + '%5s%5s'
                    FormList[1] = FormList[1] + '%5s%5s'
                    PrintList[0].extend(['Ind.','Sca.'])
                FormList[0] = FormList[0] + '%16.8f%8.2f'
                FormList[1] = FormList[1] + '%16s%8s'
                PrintList[0].extend(['Ref. Data','Weight'])
                for i in range(self.NEngy):
                    TmpList = self.EngyList[i][:-2]
                    for j in range(MaxNum-self.EngyList[i][0]):
                        TmpList.extend([' ',' '])
                    TmpList.extend(self.EngyList[i][-2:])
                    PrintList.append(TmpList)
                print_List_free(self.IOut,PrintList,2,FormList,
                    'Loaded ConfigIO.EngyList')
            elif self.IPrint >= 1 and self.NEngy==0:
                print_String(self.IOut,
                    'No energy data for traning',1)
        else:
            if self.IPrint >= 1:
                print_String(self.IOut,
                    'No energy data for training',1)
        #=====================================#
        #Obtain info. of PT21 evaluation set  #
        #=====================================#
        p1 = compile('^ *__pt21__ *::', MULTILINE)
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()    # To ignore annotations
            TmpLine = TmpLine.split('::')[1].strip().\
                replace(',','   ').replace('=','   ')
            if len(TmpLine.split()) ==1:
                try:
                    self.NPT21 = int(TmpLine.split()[0])
                    self.SPT21 = 1.0
                except ValueError:
                    print_Error(self.IOut,
                        'Error in obtaining the length of EngyList'+\
                        ' \"ConfigIO.get_TrainSet\"')
            elif len(TmpLine.split()) >= 2:
                try:
                    self.NPT21 = int(TmpLine.split()[0])
                    self.SPT21 = float(TmpLine.split()[1])
                except ValueError:
                    print_Error(self.IOut,
                        'Error in obtaining the length of EngyList'+\
                        ' \"ConfigIO.get_TrainSet\"')

            for i in range(self.NPT21):
                if len(TmpLine) == 0:
                    print_Error(self.IOut,
                    'Interlude of blank line is forbidden')
                TmpLine = self.f.readline().strip()                  # To ignore annotations
                while TmpLine[0]=='#':
                    TmpLine = self.f.readline().strip()
                    if len(TmpLine) == 0:
                        print_Error(self.IOut,
                        'Interlude of blank line is forbidden')
                TmpLine = TmpLine.split('#')[0].strip()              # To ignore annotations

                self.PT21List.append(TmpLine.split())
                try:
                    self.PT21List[i][0]=int(self.PT21List[i][0])
                except ValueError:
                    print_Error(self.IOut,
                        'Error :: PT21List[%d][0] is invalid'
                        % i + ' \"ConfigIO.get_TrainSet\"')
                if len(self.PT21List[i]) !=(self.PT21List[i][0]*2+3):
                    print_Error(self.IOut,
                        'Error :: PT21List[%d][0] is invalid'
                        %i + ' \"ConfigIO.get_TrainSet\"')
                for l in range(self.PT21List[i][0]):
                    for j in range(self.NBatc):
                        k = l*2 + 1
                        if self.PT21List[i][k].strip().lower() ==\
                            self.BatcList[j][0].strip().lower():
                            self.PT21List[i][k]=j
                            break
                    else:
                        print_Error(self.IOut,
                            'Error in batch flag identifying of %s'\
                            % self.PT21List[i][k] +\
                            '\"ConfigIO.get_TrainSet\"')
                    k = l*2 + 2
                    try:
                        self.PT21List[i][k]=int(self.PT21List[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtaining the weight of '+\
                            'molecular energy'+\
                            '\"ConfigIO.get_TrainSet\"')
                else:
                    try:
                        k = self.PT21List[i][0]*2 + 1
                        self.PT21List[i][k] =\
                            float(self.PT21List[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtaining the reference energy'+\
                            '\"ConfigIO.get_TrainSet\"')
                    try:
                        k = self.PT21List[i][0]*2 + 2
                        self.PT21List[i][k] =\
                            float(self.PT21List[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtain the weight of'+\
                            'testing data'+\
                            '\"ConfigIO.get_TrainSet\"')
            if self.IPrint >= 1 and self.NPT21>0:
                MaxNum = 1
                for item in self.PT21List:
                    if item[0] > MaxNum:
                        MaxNum = item[0]
                FormList = ['%5s','%5s']
                PrintList = [['Num.']]
                for i in range(MaxNum):
                    FormList[0] = FormList[0] + '%5s%5s'
                    FormList[1] = FormList[1] + '%5s%5s'
                    PrintList[0].extend(['Ind.','Sca.'])
                FormList[0] = FormList[0] + '%16.8f%8.2f'
                FormList[1] = FormList[1] + '%16s%8s'
                PrintList[0].extend(['Ref. Data','Weight'])
                for i in range(self.NPT21):
                    TmpList = self.PT21List[i][:-2]
                    for i in range(MaxNum-self.PT21List[i][0]):
                        TmpList.extend([' ',' '])
                    TmpList.extend(self.PT21List[i][-2:])
                    PrintList.append(TmpList)
                print_List_free(self.IOut,PrintList,2,FormList,
                    'Loaded ConfigIO.PT21List')
            elif self.IPrint >= 1 and self.NPT21==0:
                print_String(self.IOut,
                    'No first-excitation PT2 data for traning',1)
        else:
            if self.IPrint >= 1:
                print_String(self.IOut,
                    'No first-excitation PT2 data for training',1)
        #=====================================#
        #Obtain info. of PT22 evaluation set  #
        #=====================================#
        p1 = compile('^ __pt22__ *::', MULTILINE)
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()    # To ignore annotations
            TmpLine = TmpLine.split('::')[1].strip().\
                replace(',','   ').replace('=','   ')
            if len(TmpLine.split()) ==1:
                try:
                    self.NPT22 = int(TmpLine.split()[0])
                    self.SPT22 = 1.0
                except ValueError:
                    print_Error(self.IOut,
                        'Error in obtaining the length of EngyList'+\
                        ' \"ConfigIO.get_TrainSet\"')
            elif len(TmpLine.split()) >= 2:
                try:
                    self.NPT22 = int(TmpLine.split()[0])
                    self.SPT22 = float(TmpLine.split()[1])
                except ValueError:
                    print_Error(self.IOut,
                        'Error in obtaining the length of EngyList'+\
                        ' \"ConfigIO.get_TrainSet\"')

            for i in range(self.NPT22):
                if len(TmpLine) == 0:
                    print_Error(self.IOut,
                    'Interlude of blank line is forbidden')
                TmpLine = self.f.readline().strip()                  # To ignore annotations
                while TmpLine[0]=='#':
                    TmpLine = self.f.readline().strip()
                    if len(TmpLine) == 0:
                        print_Error(self.IOut,
                        'Interlude of blank line is forbidden')
                TmpLine = TmpLine.split('#')[0].strip()              # To ignore annotations

                self.PT22List.append(TmpLine.split())
                try:
                    self.PT22List[i][0]=int(self.PT22List[i][0])
                except ValueError:
                    print_Error(self.IOut,
                        'Error :: PT22List[%d][0] is invalid'
                        % i + ' \"ConfigIO.get_TrainSet\"')
                if len(self.PT22List[i]) !=(self.PT22List[i][0]*2+3):
                    print_Error(self.IOut,
                        'Error :: PT21List[%d][0] is invalid'
                        %i + ' \"ConfigIO.get_TrainSet\"')
                for l in range(self.PT22List[i][0]):
                    for j in range(self.NBatc):
                        k = l*2 + 1
                        if self.PT22List[i][k].strip().lower() ==\
                            self.BatcList[j][0].strip().lower():
                            self.PT22List[i][k]=j
                            break
                    else:
                        print_Error(self.IOut,
                            'Error in batch flag identifying of %s'\
                            % self.PT22List[i][k] +\
                            '\"ConfigIO.get_TrainSet\"')
                    k = l*2 + 2
                    try:
                        self.PT22List[i][k]=int(self.PT22List[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtaining the weight of '+\
                            'molecular energy'+\
                            '\"ConfigIO.get_TrainSet\"')
                else:
                    try:
                        k = self.PT22List[i][0]*2 + 1
                        self.PT22List[i][k] =\
                            float(self.PT22List[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtaining the reference energy'+\
                            '\"ConfigIO.get_TrainSet\"')
                    try:
                        k = self.PT22List[i][0]*2 + 2
                        self.PT22List[i][k] =\
                            float(self.PT22List[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtain the weight of'+\
                            'testing data'+\
                            '\"ConfigIO.get_TrainSet\"')
            if self.IPrint >= 1 and self.NPT22>0:
                MaxNum = 1
                for item in self.PT22List:
                    if item[0] > MaxNum:
                        MaxNum = item[0]
                FormList = ['%5s','%5s']
                PrintList = [['Num.']]
                for i in range(MaxNum):
                    FormList[0] = FormList[0] + '%5s%5s'
                    FormList[1] = FormList[1] + '%5s%5s'
                    PrintList[0].extend(['Ind.','Sca.'])
                FormList[0] = FormList[0] + '%16.8f%8.2f'
                FormList[1] = FormList[1] + '%16s%8s'
                PrintList[0].extend(['Ref. Data','Weight'])
                for i in range(self.NPT21):
                    TmpList = self.PT22List[i][:-2]
                    for i in range(MaxNum-self.PT22List[i][0]):
                        TmpList.extend([' ',' '])
                    TmpList.extend(self.PT22List[i][-2:])
                    PrintList.append(TmpList)
                print_List_free(self.IOut,PrintList,2,FormList,
                    'Loaded ConfigIO.PT22List')
            elif self.IPrint >= 1 and self.NPT21==0:
                print_String(self.IOut,
                    'No second-excitation PT2 data for traning',1)
        else:
            if self.IPrint >= 1:
                print_String(self.IOut,
                    'No second-excitation PT2 data for training',1)

        #===============================================#
        #Obtain the training set of elec. resp. property#
        #===============================================#
        RespIndex={  'x':  0,  'y':  1,  'z':  2,
                    'xx':  3, 'yy':  4, 'zz':  5, 'xy':  6, 'xz':  7,
                    'yz':  8,
                   'xxx':  9,'yyy': 10,'zzz': 11,'xyy': 12,'xxy': 13,
                   'xxz': 14,'xzz': 15,'yzz': 16,'yyz': 17,'xyz': 18}
        p1 = compile('^ *__polar__ *::', MULTILINE)
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()        # To ignore annotations
            TmpLine = TmpLine.split('::')[1].strip().\
                replace(',','   ').replace('=','   ')
            if len(TmpLine.split()) ==1:
                try:
                    self.NResp = int(TmpLine.split()[0])
                    self.SResp = [1.0]*3
                except ValueError:
                    print_Error(self.IOut,
                        'Error in obtaining the lenght of RespList'+\
                        '\"ConfigIO.get_TrainSet\"')
            elif len(TmpLine.split())<4:
                try:
                    self.NResp = int(TmpLine.split()[0])
                    self.SResp =\
                        [float(x) for x in TmpLine.split()[1:]]
                    for i in range(3-len(self.SResp)):
                        self.Resp.append(1.0)
                except ValueError:
                    print_Error(self.IOut,
                        'Error in obtaining the lenght of RespList'+\
                        '\"ConfigIO.get_TrainSet\"')
            elif len(TmpLine.split()) >=4:
                try:
                    self.NResp = int(TmpLine.split()[0])
                    self.SResp =\
                        [float(x) for x in TmpLine.split()[1:4]]
                except ValueError:
                    print_Error(self.IOut,
                        'Error in obtaining the lenght of RespList'+\
                        '\"ConfigIO.get_TrainSet\"')
            for i in range(self.NResp):
                TmpLine = self.f.readline().strip()
                if len(TmpLine) == 0:
                    print_Error(self.IOut,
                    'Interlude of blank line is forbidden')
                while TmpLine[0]=='#':                               # To ignore annotations
                    TmpLine = self.f.readline().strip()
                    if len(TmpLine) == 0:
                        print_Error(self.IOut,
                        'Interlude of blank line is forbidden')
                TmpLine = TmpLine.split('#')[0].strip()              # To ignore annotations

                self.RespList.append(TmpLine.split())
                try:
                    self.RespList[i][0]=int(self.RespList[i][0])
                except ValueError:
                    print_Error(self.IOut,
                        'Error in the length of RespList[%d]' %i+\
                        '\"ConfigIO.get_TrainSet\"')
                if (self.RespList[i][0]*3+2) !=len(self.RespList[i]):
                    print_Error(self.IOut,
                        'Error in the length consistency of ' +\
                        'self.RespList[%d]' %i +\
                        '\"ConfigIO.get_TrainSet\"')
                for l in range(self.NBatc):
                    if self.BatcList[l][0].strip().lower() ==\
                        self.RespList[i][1].strip().lower():
                        self.RespList[i][1] = l
                        break
                else:
                    print_Error(self.IOut,
                        'Error in batch flag identifying'+\
                        '\"ConfigIO.get_TrainSet\"')
                for j in range(self.RespList[i][0]):
                    k = 2 + j*3
                    if not RespIndex.has_key\
                        (self.RespList[i][k].lower()):
                        print_Error(self.IOut,
                            'Error in elec. resp. direction (%s)'
                            % self.RespList[i][k] +\
                            '\"ConfigIO.get_TrainSet\"')
                    k = 2 + j*3 + 1
                    try:
                        self.RespList[i][k] =\
                            float(self.RespList[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtaining the reference data'+\
                            '\"ConfigIO.get_RespList\"')
                    k = 2 + j*3 + 2
                    try:
                        self.RespList[i][k] =\
                            float(self.RespList[i][k])
                    except ValueError:
                        print_Error(self.IOut,
                            'Error in obtaining the weight of '+\
                            'testing data'+\
                            '\"ConfigIO.get_RespList\"')
            if self.IPrint >= 1 and self.NResp>0:
                MaxNum = 1
                for item in self.RespList:
                    if item[0] > MaxNum:
                        MaxNum = item[0]
                FormList = ['%5s%5s','%5s%5s']
                PrintList = [['Num.','Ind.']]
                for i in range(MaxNum):
                    FormList[0] = FormList[0] + '%5s%10.2f%8.2f'
                    FormList[1] = FormList[1] + '%5s%10s%8s'
                    PrintList[0].extend(\
                        ['Dir.','Ref.','Wgt.'])
                for i in range(self.NResp):
                    TmpList = self.RespList[i][:]
                    for i in range(MaxNum-self.RespList[i][0]):
                        TmpList.extend([' ','0.00','0.00'])
                    PrintList.append(TmpList)
                print_List_free(self.IOut,PrintList,2,FormList,
                    'Loaded ConfigIO.RespList')
            else:
                print_String(self.IOut,
                    'No polar data for training',1)
        else:
            if self.IPrint >= 1:
                print_String(self.IOut,
                    'No polar data for training',1)

        #=========================================#
        #Obtain the training set of NMR properties#
        #=========================================#
        p1 = compile('^ *__nmr__ *::', MULTILINE)
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()    # To ignore annotation
            try:
                self.NNMR = int(TmpLine.split('::')[1])
            except ValueError:
                print_Error(self.IOut,
                    'Error in obtaining the length of NMRList'+\
                    '\"ConfigIO.get_TrainSet\"')
            for i in range(self.NNMR):
                TmpLine = self.f.readline().strip()                  # To ignore annotations
                if len(TmpLine) == 0:
                    print_Error(self.IOut,
                    'Interlude of blank line is forbidden')
                while TmpLine[0]=='#':
                    TmpLine = self.f.readline().strip()
                    if len(TmpLine) == 0:
                        print_Error(self.IOut,
                        'Interlude of blank line is forbidden')
                TmpLine = TmpLine.split('#')[0].strip()              # To ignore annotations
                #=============================#
                #Mark here for NMRList loading#
                pass
                #=============================#

            if self.IPrint >= 1 and self.NNMR>0:
                print_String(self.IOut,
                    'Loaded ConfigIO.NMRList :',1)
                for i in range(self.NNMR):
                    print_List(self.IOut,self.NMRList[i],3)
        else:
            if self.IPrint >= 1:
                print_String(self.IOut,
                             'No nmr data for training',
                             1)
        # =========================================#
        #  Obtain the training set of Geom. Info. #
        # =========================================#
        p1 = compile('^ __geom__ *::', MULTILINE)
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            # To ignore annotation
            TmpLine = self.f.readline().split('#')[0].strip()
            TmpLine = TmpLine.split('::')[1].replace(',', '   ')
            TmpLine = TmpLine.replace('=','   ').strip()
            try:
                self.NGeom = int(TmpLine.split()[0])
            except ValueError:
                print_Error(self.IOut,
                            'Error in obtaining the length of GeomList ' +\
                            '\"ConfigIO.get_TrainSet\"')
            try:
                self.SGeom[0] = float(TmpLine.split()[1])
            except:
                pass
            try:
                self.SGeom[1] = float(TmpLine.split()[2])
            except:
                pass
            try:
                self.SGeom[2] = float(TmpLine.split()[3])
            except:
                pass
            for i in range(self.NGeom):
                TmpLine = self.f.readline().strip()
                if len(TmpLine) == 0:
                    print_Error(self.IOut,
                    'Interlude of blank line is forbidden')
                while TmpLine[0]=='#':                               # To ignore annotations
                    TmpLine = self.f.readline().strip()
                    if len(TmpLine) == 0:
                        print_Error(self.IOut,
                        'Interlude of blank line is forbidden')
                TmpLine = TmpLine.split('#')[0].strip()              # To ignore annotations
                self.GeomList.append(TmpLine.split())
                for l in range(self.NBatc):
                    if self.BatcList[l][0].strip().lower() ==\
                        self.GeomList[i][0].strip().lower():
                        self.GeomList[i][0] = l
                        break
                else:
                    print_Error(self.IOut,
                        'Error in batch flag identifying '+\
                        '\"ConfigIO.get_TrainSet\"')
                try:
                    self.GeomList[i][1] = int(self.GeomList[i][1])
                except:
                    print_Error(self.IOut,
                        'Error in geometry type determination ' +\
                        '"ConfigIO.get_TrainSet"')
                if self.GeomList[i][1] == 1:
                    try:
                        self.GeomList[i][2] =\
                            int(self.GeomList[i][2])
                        self.GeomList[i][3] =\
                            int(self.GeomList[i][3])
                        self.GeomList[i][4] =\
                            float(self.GeomList[i][4])
                        self.GeomList[i][5] =\
                            float(self.GeomList[i][5])
                    except:
                        print_Error(self.IOut,
                            'Error in loading geom. data' +\
                            ' "ConfigIO.get_TrainSet"')
                    #if self.IPrint >= 2:
                    #    print_String(self.IOut,'Bond is loaded',
                    #        1)
                elif self.GeomList[i][1] == 2:
                    try:
                        self.GeomList[i][2] =\
                            int(self.GeomList[i][2])
                        self.GeomList[i][3] =\
                            int(self.GeomList[i][3])
                        self.GeomList[i][4] =\
                            int(self.GeomList[i][4])
                        self.GeomList[i][5] =\
                            float(self.GeomList[i][5])
                        self.GeomList[i][6] =\
                            float(self.GeomList[i][6])
                    except:
                        print_Error(self.IOut,
                            'Error in loading geom. data' +\
                            ' "ConfigIO.get_TrainSet"')
                    #if self.IPrint >= 2:
                    #    print_String(self.IOut,'Angel is loaded',
                    #        1)
                elif self.GeomList[i][1] == 3:
                    try:
                        self.GeomList[i][2] =\
                            int(self.GeomList[i][2])
                        self.GeomList[i][3] =\
                            int(self.GeomList[i][3])
                        self.GeomList[i][4] =\
                            int(self.GeomList[i][4])
                        self.GeomList[i][5] =\
                            int(self.GeomList[i][5])
                        self.GeomList[i][6] =\
                            float(self.GeomList[i][6])
                        self.GeomList[i][7] =\
                            float(self.GeomList[i][7])
                    except:
                        print_Error(self.IOut,
                            'Error in loading geom. data' +\
                            ' "ConfigIO.get_TrainSet"')
                    #if self.IPrint >= 2:
                    #    print_String(self.IOut,'Dihedral is loaded',
                    #        1)
                else:
                    print_Error(self.IOut,
                        'Error : invalid geometry type %d'\
                        %self.GeomList[i][1] +\
                        ' "ConfigIO.get_TrainSet"')

            if self.IPrint >= 1 and self.NGeom>0:
                FormList =\
                    [ '%10s%10s%10s%10s%10s%10s%10.4f%10.4f',\
                    '%10s%10s%10s%10s%10s%10s%10s%10s']
                PrintList =\
                    [['MoleIndx','GeomType','AtomIndx','AtomIndx',\
                      'AtomIndx','AtomIndx','Ref.','Weight']]
                for i in range(self.NGeom):
                    TmpList = self.GeomList[i][:]
                    if self.GeomList[i][1] == 1:
                        TmpList[1] = 'Bond'
                        TmpList.insert(4,' ')
                        TmpList.insert(5,' ')
                    elif self.GeomList[i][1] == 2:
                        TmpList[1] = 'Angle'
                        TmpList.insert(5,' ')
                    elif self.GeomList[i][1] == 3:
                        TmpList[1] = 'Dihedral'
                    PrintList.append(TmpList)
                print_List_free(self.IOut,PrintList,2,FormList,
                    'Loaded ConfigIO.GeomList')
            else:
                print_String(self.IOut,
                    'No geom data for training',1)
        else:
            if self.IPrint >= 1:
                print_String(self.IOut,
                    'No geom data for training',1)
        return

    def run_GauBatch(self):
        '''Batch Gaussian jobs and collect result based on job flag'''
        from os import chdir, system
        from os.path import isfile
        from copy import deepcopy
        import gaussian_manage  as gaum
        for job in self.BatcList:
            self.IOut.flush()   # Flush Output file

            strf = job[3].strip().lower()
            FlagEngy = strf.find('energy') != -1                    # To collect energy result
            FlagNMR = strf.find('nmr') != -1                       # To collect nmr result
            FlagPola = strf.find('polar') != -1                     # To collect polar result
            FlagGeom = strf.find('geom') != -1                      # To collect optimized geom.

            if len(self.ProjDir) == 0:                                 # Enter project workdir
                chdir(job[1])
            else:
                chdir(self.ProjDir)
                if isfile(job[2]):                                   #  Bypass input copy
                    pass
                else:
                    system('cp %s/%s ./' % (job[1],job[2]))

            # try: del tmpJob  # Reinitialize tmpJob
            # except: pass
            tmpJob =\
                gaum.GauIO(self.IOut,job[2],self.IPrint)
            tmpJob.get_MachAndOpt()
            tmpJob.ctrl_Option()
            tmpJob.get_TCSGR()

            if (len(tmpJob.GeomList) == 0) and\
            (tmpJob.MoreOptionDict['allcheck']==1 or\
            tmpJob.MoreOptionDict['checkpoint']==1):                 # For jobs to obtain geom.
                if self.ProjCtrl == 0 and len(self.ProjDir)>0:         #  from ChkFile
                    if system('cp %s/%s.chk %s/%s.chk'
                        % (job[1],tmpJob.ChkName,
                            self.ProjDir,tmpJob.ChkName)) != 0:
                        print_String(self.IOut,
                            '%s/%s.chk could not be found'
                            % (job[1],tmpJob.ChkName),1)
                    chdir(self.ProjDir)
                elif self.ProjCtrl == 2 and len(self.ProjDir)>0\
                and not isfile('%s.chk' %tmpJob.ChkName):
                    if system('cp %s/%s.chk %s/%s.chk'
                    % (job[1],tmpJob.ChkName,
                        self.ProjDir,tmpJob.ChkName)) != 0:
                        print_Error(self.IOut,
                            'Error in the file of %s' %job[2])
                    chdir(self.ProjDir)

            if len(self.MachineList) != 0:
                TmpMachList = []
                for item in tmpJob.MachineList:                      # Filter MachineList by
                    if item.lower().find('chk') != -1:                 #   '%chk' from GauIO class
                        TmpMachList.append(item)
                        ChkFlag = True
                        break
                else:
                    ChkFlag = False
                if ChkFlag:
                    for item in self.MachineList:
                        if item.lower().find('chk') ==-1:             #   others from config
                            TmpMachList.append(item)
                else:
                    TmpMachList = self.MachineList[:]
                tmpJob.MachineList = TmpMachList[:]

            if len(self.OptionList) != 0:                              # Set OptionList by config
                tmpJob.OptionList = self.OptionList[:]
                if tmpJob.MoreOptionDict['allcheck']==1:
                    tmpJob.OptionList.append('geom=allcheck')
                elif tmpJob.MoreOptionDict['checkpoint']==1:
                    tmpJob.OptionList.append('geom=checkpoint')
            tmpJob.ctrl_Option()
            if tmpJob.MoreOptionDict['extraoverlay']==1:             # Get ExtraOverlay list
                tmpJob.ExOvList = self.ExOvList[:]
                ExtFlag = True
            else:
                ExtFlag = False

            tmpOpt =\
                gaum.OptHandle(self.IOut,tmpJob,self.IPrint)         # Check geom. opt. keyword
            tmpDisp =\
                gaum.DFTD(self.IOut,tmpJob,tmpOpt,self.IPrint)       # Check keyword of DFT+D
            tmpR5DFT =\
                gaum.R5DFT(self.IOut,tmpJob,tmpOpt,self.IPrint)      # Check keyword of R5DFT

            if FlagPola:
                for option in tmpJob.OptionList:                     # Search 'polar' keyword
                    if option.lower().find('polar') != -1:
                        break
                else:
                    tmpJob.OptionList.append('Polar=Dipole')
            if FlagNMR:
                for option in tmpJob.OptionList:                     # Search 'nmr' keyword
                    if option.lower().find('nmr') != -1:
                        break
                else:
                    tmpJob.OptionList.append('NMR')
            if FlagGeom:
                for option in tmpJob.OptionList:                     # Search 'opt' keyword
                    if option.lower().find('opt') != -1:
                        break
                else:
                    tmpJob.OptionList.append('OPT')

            #======================================================#
            #       NOW RUN BATCH JOBS BASED ON self.BatcList      #
            #======================================================#

            #------------------------------------#
            # For single-point energy calculation#
            #------------------------------------#
            if FlagEngy and not FlagGeom:
                if self.IPrint >= 1:
                    print_String(self.IOut,
                        'This is a batch job for energy calculation'
                        ,1)
                if tmpDisp.TurnOn:
                    if not tmpJob.CartesianFlag:                     # get Cartesian geometry
                        tmpJob.collect_Geom()
                    if self.ProjCtrl == 0:                             # Control batch manner
                        tmpDisp.get_EngyReal(ICtrl=0)                #
                    elif self.ProjCtrl == 1:                           #
                        tmpDisp.get_EngyReal(ICtrl=2)                #
                    elif self.ProjCtrl == 2:                           #
                        if isfile('%s.chk' % tmpJob.ChkName) and\
                        isfile('Job_%s.log' % tmpJob.JobName):       #
                            if self.IPrint >= 2:                       #
                                print_String(self.IOut,              #
                                    'bypass the job of %s'           #
                                    % tmpJob.JobName,1)              #
                            tmpDisp.get_EngyReal(ICtrl=2)            #
                        else:                                        #
                            tmpDisp.get_EngyReal(ICtrl=1)            #======================
                    job[4]['energy'].append(tmpDisp.EngyReal)
                elif tmpR5DFT.TurnOn:
                    tmpR5DFT.gen_OptionList()

                    if self.ProjCtrl == 0:                             # Control batch manner
                        tmpR5DFT.run_Job(sync=False)                 #
                    elif self.ProjCtrl == 1:                           #
                        pass                                         #
                    elif self.ProjCtrl == 2:                           #
                        if isfile('%s.chk' % tmpJob.ChkName) and\
                        isfile('Job_%s.log' % tmpJob.JobName):       #
                            if self.IPrint >= 2:                       #
                                print_String(self.IOut,              #
                                    'bypass the job of %s'           #
                                    % tmpJob.JobName,1)              #
                            pass                                     #
                        else:                                        #
                            tmpR5DFT.run_Job(sync=False)             #======================

                    tmpR5DFT.collect_EngyReal()
                    job[4]['energy'].append(tmpJob.EngyReal)
                else:
                    tmpJob.form_Inp()
                    if self.ProjCtrl == 0:                             # Control batch manner
                        tmpJob.run_GauJob()                          #
                    elif self.ProjCtrl == 1:                           #
                        pass                                         #
                    elif self.ProjCtrl == 2:                           #
                        if isfile('%s.chk' % tmpJob.ChkName) and\
                        isfile('Job_%s.log' % tmpJob.JobName):       #
                            if self.IPrint >= 2:                       #
                                print_String(self.IOut,              #
                                    'bypass the job of %s'           #
                                    % tmpJob.JobName,1)              #
                            pass                                     #
                        else:                                        #
                            if ExtFlag == False:                     #
                                tmpJob.run_GauJob(iop=0)             #
                            elif ExtFlag == True:                    #
                                tmpJob.run_GauJob(iop=1)             #======================

                    Result =\
                        gaum.ChkHandle(self.IOut,tmpJob,self.IPrint)
                    Result.collect_EngyReal()
                    job[4]['energy'].append(Result.EngyReal)
                    #if tmpJob.MoreOptionDict['%chk']==1:             # Do not save chk
                    #    remove('%s.chk' % tmpJob.ChkName)
                    del Result
            #----------------------------#
            # For geometry optimization  #
            #----------------------------#
            if FlagGeom:
                if self.IPrint >= 1:
                    print_String(self.IOut,
                        'This is a batch job for geom. opt.'
                        ,1)
                if tmpDisp.TurnOn:
                    if tmpDisp.PureDisp:
                        print_String(self.IOut,
                            'Pure dispersion could not be used '+\
                            'to optimize molecular geometry',2)
                    else:
                        print_String(self.IOut,
                            'Geometry optimization for DFT+D sheme'+\
                            ' doesn\'t open at this version',2)
                    job[4]['energy'].append('NAN')
                    CList = []
                    for i in range(tmpJob.NAtom):
                        CList.append('NAN'*4)
                    job[4]['geom'].append(CList)
                elif tmpR5DFT.TurnOn:
                    print_String(self.IOut,
                        'Geometry optimization for R5DFT sheme '+\
                        'doesn\'t open at this version',2)
                    job[4]['energy'].append('NAN')
                    CList = []
                    for i in range(tmpJob.NAtom):
                        CList.append('NAN'*4)
                    job[4]['geom'].append(CList)
                else:
                    tmpJob.form_Inp()
                    if self.ProjCtrl == 0:    # Control batch manner
                        tmpJob.run_GauJob()   #
                    elif self.ProjCtrl == 1:  #
                        pass                  #
                    elif self.ProjCtrl == 2:  #
                        if isfile('%s.chk'
                                  % tmpJob.ChkName) and\
                           isfile('Job_%s.log'
                                  % tmpJob.JobName):
                            if self.IPrint >= 2:
                                print_String(self.IOut, 'bypass the job of %s'
                                             % tmpJob.JobName, 1)
                            pass
                        else:
                            tmpJob.run_GauJob()
                    Result =\
                        gaum.LogHandle(self.IOut, tmpJob, self.IPrint)
                    Result.collect_EngyReal()
                    tmpString = 'QM Energy =%16.8E' % Result.EngyReal
                    print_String(self.IOut, tmpString, 2)
                    job[4]['energy'].append(Result.EngyReal)
                    GeomConv, CList = Result.collect_Geom_converged()
                    job[4]['geom'] = deepcopy(CList)

            # ----------------------#
            #  For polar calculation#
            # ----------------------#
            if FlagPola:
                if self.IPrint >= 1:
                    tmpString = 'This is a batch job for elec.resp. property'
                    print_String(self.IOut, tmpString, 1)
                if tmpDisp.TurnOn:
                    tmpString = 'The DFT+D scheme could not produce more ' +\
                        'informations of the electronic response ' +\
                        'properties than the corresponding QM method'
                    print_String(self.IOut, tmpString, 2)
                    job[4]['polar'] = ['NAN']*19
                elif tmpR5DFT.TurnOn:
                    tmpString = 'R5DFT scheme could only generate the ' +\
                        'elec. resp. properties through the ' +\
                        'numerical procedure manually at present'
                    print_String(self.IOut, tmpString, 2)
                    job[4]['polar'] = ['NAN']*19
                else:
                    tmpJob.form_Inp()
                    # Control batch manner
                    if self.ProjCtrl == 0 and not FlagEngy:
                        tmpJob.run_GauJob()
                    elif self.ProjCtrl == 1:
                        if self.IPrint >= 2:
                            print_String(self.IOut,
                                         'bypass the job of %s'
                                         % tmpJob.JobName, 1)
                    elif self.ProjCtrl == 2:
                        if isfile('%s.chk'
                                  % tmpJob.ChkName
                                  ) and \
                           isfile('Job_%s.log'
                                  % tmpJob.JobName
                                  ):
                            if self.IPrint >= 2:
                                print_String(self.IOut, 'bypass the job of %s'
                                             % tmpJob.JobName, 1)
                            pass
                        else:
                            if self.IPrint >= 2:
                                print_String(self.IOut,
                                             'There are not %s.chk ' +
                                             'and Job_%s.log'
                                             % (tmpJob.ChkName,
                                                tmpJob.JobName),
                                             1)
                            tmpJob.run_GauJob()
                    Result = gaum.ChkHandle(self.IOut, tmpJob, self.IPrint)
                    Result.collect_ElecResp()
                    try:
                        job[4]['polar'].extend(Result.DipoList)
                        job[4]['polar'].extend(Result.PolaList)
                        job[4]['polar'].extend(Result.HyPoList)
                    except TypeError:
                        job[4]['polar'] = ['NAN']*19
                    del Result

            if FlagNMR:
                if self.IPrint >= 1:
                    print_String(self.IOut,
                                 'This is a batch job for NMR calculation',
                                 1)
                pass
        return

    def run_QcmBatch(self):
        '''Batch Q-Chem jobs and collect result based on job flag'''
        from os              import chdir
        from os              import getpid
        from os              import system
        from os              import listdir
        from os.path         import isfile
        import qchem_manage     as qchem
        for job in self.BatcList:
            self.IOut.flush()                                        # Flush Output file

            strf = job[3].strip().lower()
            FlagSCF = strf.find('energy') != -1 or\
                             strf.find('scf') != -1                    # To collect energy result
            FlagPT21 = strf.find('pt21') != -1                      # To collect 1st contr for PT2
            FlagPT22 = strf.find('pt22') != -1                      # To collect 2nd contr for PT2

            FlagxMP2 = strf.find('xmp2') != -1                      # To collect xMP2 energy

            if len(self.ProjDir) == 0:                                 # Enter project workdir
                chdir(job[1])
            else:
                chdir(self.ProjDir)
                if isfile(job[2]):   # Bypass input copy
                    pass
                else:
                    system('cp %s/%s ./' % (job[1], job[2]))

            tmpScratch = []   # Check the scratch
            for tS in listdir('.'):
                if tS.find('.script') != -1:
                    tmpScratch.append(tS)
            if len(tmpScratch) == 0:
                tmpString = 'No scratch in current path'
                print_String(self.IOut, tmpString, 1)
            elif len(tmpScratch) > 1:
                print_String(self.IOut, tmpString, 1)
            elif len(tmpScratch) == 1 and \
                tmpScratch[0] != '.script%s' % getpid():
                tmpString = 'The last scratch is found. Move it to current'
                print_String(self.IOut, tmpString, 1)
                system('mv %s .script%s' % (tmpScratch[0], getpid()))
            elif len(tmpScratch) == 1 and \
                tmpScratch[0] == '.script%s' % getpid():
                print_String(self.IOut, 'The current scratch is found.', 1)

            # try: del tmpJob    # Reinitialize tmpJob
            # except: pass
            tmpJob =\
                qchem.QChemIO(self.IOut, job[2], self.IPrint)
            tmpJob.get_Input()
            for x in sorted(self.InpuDict.keys()):
                if x != 'MolList' and len(self.InpuDict[x]) != 0:
                    tmpJob.InpuDict[x] = self.InpuDict[x][:]

            # ======================================================#
            #       NOW RUN BATCH JOBS BASED ON self.BatcList       #
            # ======================================================#

            # ------------------------------------#
            # For single-point energy calculation #
            # ------------------------------------#
            if self.IPrint >= 1:
                print_String(self.IOut, 'This is a batch job for energy ' +
                             'calculation', 1)
            tmpJob.form_Input()
            if self.ProjCtrl == 0:                                   # Control
                tmpJob.run_Job(self.ParaOrSeri, self.QchCfg)         # batch
            elif self.ProjCtrl == 1:                                 # manner
                pass                                                 #
            elif self.ProjCtrl == 2:                                 #
                if isfile('Job_%s.log' % tmpJob.JobName):            #
                    if self.IPrint >= 2:                             #
                        tmpString = 'bypass the job of %s' % tmpJob.JobName
                        print_String(self.IOut, tmpString, 1)        #
                    pass                                             #
                else:                                                #
                    tmpJob.run_Job(self.ParaOrSeri, self.QchCfg)     #
            if FlagSCF:
                tmpJob.get_Result(0)
                # To determine which type of total energy
                #   is stored in job[4]['energy']
                if tmpJob.CCSDTReal != 0.0:   # Assumed CCSD(T) is the highest
                    job[4]['energy'] = [tmpJob.CCSDTReal]   # correlated method
                elif tmpJob.R5DFTReal != 0.0:
                    job[4]['energy'] = [tmpJob.R5DFTReal]   # Post-DFT method
                else:
                    job[4]['energy'] = [tmpJob.SCFReal]
            if FlagPT21:
                tmpJob.get_Result(1)
                job[4]['pt21'] = [tmpJob.PT21Real]
            if FlagPT22:
                tmpJob.get_Result(2)
                job[4]['pt22'] = [tmpJob.PT22Real]
            if FlagxMP2:
                tmpJob.get_Result(3)
                job[4]['xmp2'] = [tmpJob.xMP2Real]
        return

    def run_AimBatch(self):
        '''Batch Aims jobs and collect result based on job flag'''
        from os import chdir, system
        from os.path import isfile, isdir
        from my_io import print_String
        import aims_manage as aims
        List_Procs = [self.Procs]*self.NBatc
        print_List(self.IOut, List_Procs, 3, 'NProcs for AIMS jobs')
        for procs, indices in self.Special_Procs.iteritems():
            for index in indices:
                try:
                    List_Procs[index] = procs
                except ValueError:
                    print_String(self.IOut, 'Warning: Error in ' +
                                 'loading nprocs for special jobs', 1)
                    pass
        print_List(self.IOut, List_Procs, 3, 'NProcs for AIMS jobs')
        job_index = 0
        FlagLogTot = True
        for job in self.BatcList:
            job_special_procs = List_Procs[job_index]
            job_index += 1
            self.IOut.flush()  # Flush Output file

            strf = job[3].strip().lower()
            # To collect energy result
            FlagSCF = strf.find('energy') != -1 or strf.find('scf') != -1
            FlagRPA = strf.find('rpa') != -1
            # FlagDHD = strf.find('dhd') != -1
            FlagSOX = strf.find('sosex') != -1
            FlagMP2 = strf.find('mp2') != -1
            FlagCMP2 = strf.find('cmp2') != -1
            FlagSCPT2 = strf.find('scpt2') != -1
            FlagDHDF = strf.find('dhdf') != -1
            FlagCDHDF = strf.find('cdhdf') != -1
            FlagWRPA = strf.find('wrpa') != -1
            FlagHLG = strf.find('hlg') != -1
            FlagCI = strf.find('ci') != -1
            FlagVDW = strf.find('vdw') != -1
            FlagMGGA = strf.find('meta') != -1
            FlagZRPS = strf.find('zrps') != -1
            FlagXYG3 = strf.find('xyg3') != -1
            FlagOSRPA = strf.find('osrpa') != -1
            FlagSCSRPA = strf.find('scsrpa') != -1
            if FlagSCPT2:
                FlagCMP2 = False
                FlagMP2 = False
            if FlagCMP2:
                FlagSCPT2 = False
                FlagMP2 = False
            if FlagCDHDF:
                FlagDHDF = False
            if FlagOSRPA:
                FlagRPA = False
            if FlagSCSRPA:
                FlagRPA = False

            if len(self.ProjDir) == 0:   # Enter project workdir
                chdir(job[1])
            else:
                chdir(self.ProjDir)
                if isdir(job[2]):   # Bypass input copy
                    pass
                else:
                    system('cp -r %s/%s ./' % (job[1], job[2]))
            # try: del tmpJob # Reinitialize tmpJob
            # except: pass
            tmpJob = aims.AimsIO(self.IOut, job[2], self.IPrint)
            if len(self.add_CMD) != 0:
                tmpJob.add_CMD = self.add_CMD[:]
            # tmpJob.qchem2aims(job[2])
            tmpJob.BasisDir = self.BasisDir
            tmpJob.Proj = job[2]

            # ======================================================#
            #        NOW RUN BATCH JOBS BASED ON self.BatcList      #
            # ======================================================#

            # ------------------------------------#
            #  For single-point energy calculation#
            # ------------------------------------#
            FlagLog = True
            if self.IPrint >= 1:
                print_String(self.IOut,
                             'This is a batch job for energy ' +
                             'calculation', 1)
            tmpJob.form_Control()
            tmpJob.form_Basis()
            if self.ProjCtrl == 0:
                if self.BatchType == 'queue':
                    FlagLog = \
                        tmpJob.run_Job_v02(job_special_procs,
                                           self.Threads,
                                           self.NPN,
                                           self.AimsCfg,
                                           self.BatchScriptName,
                                           self.BatchCmd,
                                           self.BatchQueueName
                                           )
                elif self.BatchType == 'serial':
                    FlagLog = \
                        tmpJob.run_Job(job_special_procs,
                                       self.AimsCfg,
                                       self.BatchScriptName)
            elif self.ProjCtrl == 1:
                # NOTE: it has been out of date because of introducing 
                #       a new flag FlagLog for parsing the results
                pass
            elif self.ProjCtrl == 2:
                if isfile('%s.log' % tmpJob.Proj):
                    if self.IPrint >= 2:
                        print_String(self.IOut,
                                     'bypass the job of %s'
                                     % tmpJob.Proj, 1)
                    pass
                else:
                    if self.BatchType == 'queue':
                        FlagLog = \
                            tmpJob.run_Job_v02(job_special_procs,
                                               self.Threads,
                                               self.NPN,
                                               self.AimsCfg,
                                               self.BatchScriptName,
                                               self.BatchCmd,
                                               self.BatchQueueName
                                               )
                    elif self.BatchType == 'serial':
                        FlagLog = \
                            tmpJob.run_Job(job_special_procs,
                                           self.AimsCfg,
                                           self.BatchScriptName)
            # To determine if we can proceed to the next batch
            FlagLogTot = FlagLogTot and FlagLog
            if not FlagLog:
                continue
            if FlagSCF:
                tmpJob.get_Result(0)
                # To determine which type of total energy
                #   is stored in job[4]['energy']
                job[4]['energy'] = [tmpJob.Energy['SCF']]
            if FlagRPA:
                tmpJob.get_Result(1)
                job[4]['RPA'] = [tmpJob.Energy['RPA']]
                job[4]['energy'] = [tmpJob.Energy['RPA']]
            if FlagSOX:
                tmpJob.get_Result(2)
                job[4]['SOSEX'] = [tmpJob.Energy['RPA+SOSEX']]
                job[4]['energy'] = [tmpJob.Energy['RPA+SOSEX']]
            if FlagMP2:
                tmpJob.get_Result(3)
                job[4]['MP2'] = [tmpJob.Energy['MP2']]
                job[4]['energy'] = [tmpJob.Energy['MP2']]
            if FlagDHDF:
                tmpJob.get_Result(4)
                job[4]['DHDF'] = [tmpJob.Energy['DHDF']]
                job[4]['energy'] = [tmpJob.Energy['DHDF']]
            if FlagCMP2:
                tmpJob.get_Result(5)
                job[4]['CMP2'] = [tmpJob.Energy['CMP2']]
                job[4]['energy'] = [tmpJob.Energy['CMP2']]
            if FlagCDHDF:
                tmpJob.get_Result(6)
                job[4]['CDHDF'] = [tmpJob.Energy['CDHDF']]
                job[4]['energy'] = [tmpJob.Energy['CDHDF']]
            if FlagSCPT2:
                tmpJob.get_Result(5)
                job[4]['CMP2'] = [tmpJob.Energy['CMP2']]
                job[4]['CPT2'] = [tmpJob.Energy['CPT2']]
                job[4]['ExHF'] = [tmpJob.Energy['ExHF']]
                job[4]['ExDFT'] = [tmpJob.Energy['ExDFT']]
                job[4]['EcDFT'] = [tmpJob.Energy['EcDFT']]
                job[4]['DFT'] = [tmpJob.Energy['DFT']]
                try:
                    job[4]['ExDFT'] = [(job[4]['ExDFT'][0] +
                                        job[4]['ExHF'][0]*0.25)/0.75]
                    job[4]['EnoXC'] = [job[4]['DFT'][0] -
                                       job[4]['ExDFT'][0]*0.75 -
                                       job[4]['EcDFT'][0] -
                                       job[4]['ExHF'][0]*0.25]
                    job[4]['energy'] = [job[4]['EnoXC'][0] +
                                        job[4]['ExHF'][0]+job[4]['CPT2'][0]]
                    print_String(self.IOut,
                                 'Hartree-only energy         : %16.8f'
                                 % job[4]['EnoXC'][0], 1)
                    print_String(self.IOut,
                                 'Optimized SCPT2             : %16.8f'
                                 % job[4]['energy'][0], 1)
                except ValueError:
                    job[4]['energy'] = ['NAN']
                    print_String(self.IOut,
                                 'Optimized SCPT2             : %16s'
                                 % job[4]['energy'][0], 1)
            if FlagWRPA:
                tmpJob.get_Result(7)
            if FlagHLG:
                tmpJob.get_Result(8)
                job[4]['hlg']=[tmpJob.Energy['HLG']]
            if FlagCI:
                tmpJob.get_Result(9)
            if FlagVDW:
                tmpJob.get_Result(10)
            if FlagMGGA:
                tmpJob.get_Result(11)
            if FlagZRPS:
                tmpJob.get_Result(12)
                try:
                    job[4]['energy'] = [tmpJob.Energy['ZRPS']]
                except:
                    job[4]['energy'] = ['NAN']
            if FlagXYG3:
                tmpJob.get_Result(16)
                try:
                    job[4]['energy'] = [tmpJob.Energy['XYG3']]
                except:
                    job[4]['energy'] = ['NAN']
            if FlagOSRPA:
                tmpJob.get_Result(17)
                try:
                    job[4]['energy'] = [tmpJob.Energy['osrpa']]
                except:
                    job[4]['energy'] = ['NAN']
            if FlagSCSRPA:
                tmpJob.get_Result(18)
                try:
                    job[4]['energy'] = [tmpJob.Energy['scsrpa']]
                except:
                    job[4]['energy'] = ['NAN']
        return FlagLogTot

    def run_CP2Batch(self):
        '''Batch CP2K jobs and collect result based on job flag'''
        from os import chdir
        from os import getpid
        from os import system
        from os import listdir
        from os.path import isfile
        from copy import deepcopy
        import cp2k_manage as cp2k
        for job in self.BatcList:
            self.IOut.flush()                                        # Flush Output file

            strf = job[3].strip().lower()
            FlagSCF = strf.find('energy') != -1 or\
                             strf.find('scf') != -1                    # To collect energy result

            if len(self.ProjDir) == 0:                                 # Enter project workdir
                chdir(job[1])
            else:
                chdir(self.ProjDir)
                if isfile(job[2]):                                   #  Bypass input copy
                    pass
                else:
                    system('cp %s/%s ./' % (job[1],job[2]))

            tmpScratch = []                                          # Check the scratch
            for tS in listdir('.'):
                if tS.find('.script') != -1:
                    tmpScratch.append(tS)
            if len(tmpScratch) == 0:
                print_String(self.IOut,
                    'No scratch in current path',1)
            elif len(tmpScratch)>1:
                print_String(self.IOut,
                    'More than one scratchs in current path',1)
            elif len(tmpScratch) ==1 and\
                tmpScratch[0]!='.script%s' %getpid():
                print_String(self.IOut,
                    'The last scratch is found. Move it to current'
                    ,1)
                system('mv %s .script%s' %(tmpScratch[0],getpid()))
            elif len(tmpScratch) == 1 and\
                tmpScratch[0]=='.script%s' %getpid():
                print_String(self.IOut,
                    'The current scratch is found.',1)

            # try: del tmpJob     # Reinitialize tmpJob
            # except: pass
            tmpJob =\
                cp2k.CP2KIO(self.IOut,job[2],self.IPrint)
            tmpJob.get_Input()

            # Now update tmpJob.InpuDict by self.InpuDict, except for
            #  variables :: multipilicty, charge, project
            #  groups    :: cell, coord
            update = {'dft'    : ['multiplicity','charge'],
                       'global' : ['project'],
                       'cell'   : ['abc'],
                       'coord'  : 'all'}
            tmpInpuDict = deepcopy(self.InpuDict)
            for x in sorted(update):                                 # update self.InpuDict based on "update"
                if update[x]!='all':
                    if x in tmpJob.InpuDict and x in self.InpuDict:
                        for line in tmpInpuDict[x]['content']:
                            tmplist = line.lower().strip().split()
                            for xx in update[x]:
                                if tmplist[0]==xx:
                                    tmpInpuDict[x]['content'].remove(line)
                                    break
                        for line in tmpJob.InpuDict[x]['content']:
                            tmplist = line.lower().strip().split()
                            for xx in update[x]:
                                if tmplist[0] == xx:
                                    tmpInpuDict[x]['content'].append(line)
                                    break
                    if x in tmpJob.InpuDict and x not in self.InpuDict:
                        tmpInpuDict[x] = deepcopy(tmpJob.InpuDict[x])
                    else:
                        pass
                else:
                    tmpInpuDict[x] =\
                        deepcopy(tmpJob.InpuDict[x])

            for line in tmpInpuDict['dft']['content']:
                tmplist = line.lower().split()
                if tmplist[0]=='multiplicity':
                    spin = int(tmplist[1])
                    if spin > 1 and tmpInpuDict['dft']['content'].count('LSD') == 0:
                        tmpInpuDict['dft']['content'].append('LSD')

            tmpJob.InpuDict = deepcopy(tmpInpuDict)

            #======================================================#
            #       NOW RUN BATCH JOBS BASED ON self.BatcList      #
            #======================================================#

            #------------------------------------#
            # For single-point energy calculation#
            #------------------------------------#
            if self.IPrint >= 1:
                print_String(self.IOut,
                    'This is a batch job for energy '+\
                    'calculation',1)
            tmpJob.reform_Geom()
            tmpJob.form_Input()
            if self.ProjCtrl == 0:                                     # Control batch manner
                tmpJob.run_Job()                                     #
            elif self.ProjCtrl == 1:                                   #
                pass                                                 #
            elif self.ProjCtrl == 2:                                   #
                if isfile('Job_%s.log' % tmpJob.JobName):            #
                    if self.IPrint >= 2:                               #
                        print_String(self.IOut,                      #
                            'bypass the job of %s'                   #
                            % tmpJob.JobName,1)                      #
                    pass                                             #
                else:                                                #
                    tmpJob.run_Job()                                 #======================
            if FlagSCF:
                tmpJob.get_Result(0)
                # To determine which type of total energy
                #   is stored in job[4]['energy']
                job[4]['energy'] = [tmpJob.SCFReal]
        return

    def get_Result(self):
        '''Analysis results according to the training set'''
        from my_io import print_SList

        from my_io import my_plus
        from my_io import my_substract
        from my_io import my_product
        # =======================================#
        # Analysis results based on self.EngyList#
        # =======================================#
        EngyResult = []
        if self.NEngy != len(self.EngyList):
            return
        for i in range(self.NEngy):
            # At first, get the name
            TmpName = ''
            if self.EngyList[i][0] == 1:
                TmpName = '%d*%dth' \
                    % (self.EngyList[i][2], self.EngyList[i][1])
            else:
                TmpIndex1 = []
                TmpIndex2 = []
                for j in range(self.EngyList[i][0]):
                    k = j*2 + 2
                    if self.EngyList[i][k] >= 0:
                        TmpIndex1.append(
                            (self.EngyList[i][k-1],
                             self.EngyList[i][k]))
                    else:
                        TmpIndex2.append(
                            (self.EngyList[i][k-1],
                             self.EngyList[i][k]))
                if len(TmpIndex2) == 0:
                    TmpName = '%d*%dth' \
                        % (TmpIndex1[0][1], TmpIndex1[0][0])
                    if len(TmpIndex1) >= 2:
                        for index, scale in TmpIndex1[1:]:
                            TmpName = TmpName + '+%d*%dth' % (scale, index)
                elif len(TmpIndex1) == 0:
                    TmpName = '-%d*%dth' \
                              % (abs(TmpIndex2[0][1]), TmpIndex2[0][0])
                    if len(TmpIndex2) >= 2:
                        for index, scale in TmpIndex2[1:]:
                            TmpName = TmpName + \
                                      '-%d*%dth' % (abs(scale), index)
                else:
                    TmpName = '%d*%dth'\
                              % (abs(TmpIndex2[0][1]), TmpIndex2[0][0])
                    if len(TmpIndex2) >= 2:
                        for index, scale in TmpIndex2[1:]:
                            TmpName = TmpName +\
                                      '+%d*%dth' % (abs(scale), index)
                    TmpName = TmpName + \
                        '->%d*%dth' % \
                        ((TmpIndex1[0][1]), TmpIndex1[0][0])
                    if len(TmpIndex1) >= 2:
                        for index, scale in TmpIndex1[1:]:
                            TmpName = TmpName + '+%d*%dth' % (scale, index)
            if len(TmpName) > 24:
                TmpName = TmpName[:19]+'...'

            k = self.EngyList[i][0]*2 + 1
            TmpRef = self.EngyList[i][k]  # Then get the ref enegy
            TmpWeig = self.EngyList[i][k+1]  # Then get the scale weight
            TmpCalc = 0.0   # Then get the energy
            for j in range(self.EngyList[i][0]):
                k = j*2 + 1
                try:
                    en = self.BatcList[self.EngyList[i][k]][4]['energy'][0]
                except IndexError:
                    en = 'NaN'
                ind = self.EngyList[i][k+1]
                TmpCalc = my_plus(TmpCalc, my_product(en, ind))
            # scale result by self.SEngy
            TmpCalc = my_product(TmpCalc, self.SEngy)
            TmpDev = my_substract(TmpCalc, TmpRef)
            TmpList = [TmpName, TmpRef, TmpCalc, TmpDev, TmpWeig]
            EngyResult.append(TmpList)

        if self.NEngy > 0:  # Print statistic results
            print_SList(self.IOut, EngyResult, 'Statistic result of energy :')

        # =======================================#
        # Analysis results based on self.PT21List#
        # =======================================#
        PT21Result = []
        for i in range(self.NPT21):
            TmpName = ''  # At first, get the name
            if self.PT21List[i][0] == 1:
                TmpName = '%d*%dth' % (
                    self.PT21List[i][2], self.PT21List[i][1])
            else:
                TmpIndex1 = []
                TmpIndex2 = []
                for j in range(self.PT21List[i][0]):
                    k = j*2 + 2
                    if self.PT21List[i][k] >= 0:
                        TmpIndex1.append(
                            (self.PT21List[i][k-1],
                             self.PT21List[i][k]))
                    else:
                        TmpIndex2.append(
                            (self.PT21List[i][k-1],
                             self.PT21List[i][k]))
                if len(TmpIndex2) == 0:
                    TmpName = '%d*%dth'\
                        % (TmpIndex1[0][1], TmpIndex1[0][0])
                    if len(TmpIndex1) >= 2:
                        for index, scale in TmpIndex1[1:]:
                            TmpName = TmpName +\
                                '+%d*%dth' % (scale, index)
                elif len(TmpIndex1) == 0:
                    TmpName = '-%d*%dth'\
                        % (abs(TmpIndex2[0][1]), TmpIndex2[0][0])
                    if len(TmpIndex2) >= 2:
                        for index, scale in TmpIndex2[1:]:
                            TmpName = TmpName +\
                                '-%d*%dth' % (abs(scale), index)
                else:
                    TmpName = '%d*%dth'\
                        % (abs(TmpIndex2[0][1]), TmpIndex2[0][0])
                    if len(TmpIndex2) >= 2:
                        for index, scale in TmpIndex2[1:]:
                            TmpName = TmpName +\
                                '+%d*%dth' % (abs(scale), index)
                    TmpName = TmpName+'->%d*%dth'\
                        % ((TmpIndex1[0][1]), TmpIndex1[0][0])
                    if len(TmpIndex1) >= 2:
                        for index, scale in TmpIndex1[1:]:
                            TmpName = TmpName + '+%d*%dth' % (scale, index)
            if len(TmpName) > 24:
                TmpName = TmpName[:19]+'...'

            k = self.PT21List[i][0]*2 + 1
            TmpRef = self.PT21List[i][k]  # Then get the ref enegy
            TmpWeig = self.PT21List[i][k+1]  # Then get the scale weight
            TmpCalc = 0.0    # Then get the energy
            for j in range(self.PT21List[i][0]):
                k = j*2 + 1
                en = self.BatcList[self.PT21List[i][k]][4]['pt21'][0]
                ind = self.PT21List[i][k+1]
                TmpCalc = my_plus(TmpCalc, my_product(en, ind))
            # scale result by self.SEngy
            TmpCalc = my_product(TmpCalc, self.SEngy)
            TmpDev = my_substract(TmpCalc, TmpRef)
            TmpList = [TmpName, TmpRef, TmpCalc, TmpDev, TmpWeig]
            PT21Result.append(TmpList)

        if self.NPT21 > 0:  # Print statistic results
            tmpString = 'Statistic result of GLPT2_1ST energy :'
            print_SList(self.IOut, PT21Result, tmpString)

        # =======================================#
        # Analysis results based on self.PT22List#
        # =======================================#
        PT22Result = []
        for i in range(self.NPT22):
            TmpName = ''    # At first, get the name
            if self.PT22List[i][0] == 1:
                TmpName = '%d*%dth' % (self.PT22List[i][2],
                                       self.PT22List[i][1])
            else:
                TmpIndex1 = []
                TmpIndex2 = []
                for j in range(self.PT22List[i][0]):
                    k = j*2 + 2
                    if self.PT22List[i][k] >= 0:
                        TmpIndex1.append(
                            (self.PT22List[i][k-1],
                             self.PT22List[i][k]))
                    else:
                        TmpIndex2.append(
                            (self.PT22List[i][k-1],
                             self.PT22List[i][k]))
                if len(TmpIndex2) == 0:
                    TmpName = '%d*%dth'\
                        % (TmpIndex1[0][1], TmpIndex1[0][0])
                    if len(TmpIndex1) >= 2:
                        for index, scale in TmpIndex1[1:]:
                            TmpName = TmpName + '+%d*%dth' % (scale, index)
                elif len(TmpIndex1) == 0:
                    TmpName = '-%d*%dth'\
                        % (abs(TmpIndex2[0][1]), TmpIndex2[0][0])
                    if len(TmpIndex2) >= 2:
                        for index, scale in TmpIndex2[1:]:
                            TmpName = TmpName + '-%d*%dth' \
                                % (abs(scale), index)
                else:
                    TmpName = '%d*%dth'\
                        % (abs(TmpIndex2[0][1]), TmpIndex2[0][0])
                    if len(TmpIndex2) >= 2:
                        for index, scale in TmpIndex2[1:]:
                            TmpName = TmpName + '+%d*%dth'\
                                % (abs(scale), index)
                    TmpName = TmpName+'->%d*%dth'\
                        % ((TmpIndex1[0][1]), TmpIndex1[0][0])
                    if len(TmpIndex1) >= 2:
                        for index, scale in TmpIndex1[1:]:
                            TmpName = TmpName + '+%d*%dth' % (scale, index)
            if len(TmpName) > 24:
                TmpName = TmpName[:19]+'...'

            k = self.PT22List[i][0]*2 + 1
            TmpRef = self.PT22List[i][k]   # Then get the ref enegy
            TmpWeig = self.PT22List[i][k+1]  # Then get the scale weight
            TmpCalc = 0.0     # Then get the energy
            for j in range(self.PT22List[i][0]):
                k = j*2 + 1
                en = self.BatcList[self.PT22List[i][k]][4]['pt22'][0]
                ind = self.PT22List[i][k+1]
                TmpCalc = my_plus(TmpCalc, my_product(en, ind))
            # scale result by self.SEngy
            TmpCalc = my_product(TmpCalc, self.SEngy)
            TmpDev = my_substract(TmpCalc, TmpRef)
            TmpList = [TmpName, TmpRef, TmpCalc, TmpDev, TmpWeig]
            PT22Result.append(TmpList)

        if self.NPT22 > 0:  # Print statistic results
            tmpString = 'Statistic result of GLPT2_2ST energy :'
            print_SList(self.IOut, PT22Result, tmpString)

        # =======================================#
        # Analysis results based on self.RespList#
        # =======================================#
        RespIndex = {'x':  0, 'y':  1, 'z':  2,
                     'xx':  3, 'yy':  4, 'zz':  5, 'xy':  6, 'xz':  7,
                     'yz':  8,
                     'xxx':  9, 'yyy': 10, 'zzz': 11, 'xyy': 12, 'xxy': 13,
                     'xxz': 14, 'xzz': 15, 'yzz': 16, 'yyz': 17, 'xyz': 18}
        DipoResult = []
        PolaResult = []
        HyPoResult = []
        for i in range(self.NResp):
            for j in range(self.RespList[i][0]):
                k = 2 + j*3
                TmpName =\
                    self.BatcList[self.RespList[i][1]][0] +\
                    '   (' + self.RespList[i][k] + ')'
                TmpRef = self.RespList[i][k+1]
                TmpIndex = RespIndex[self.RespList[i][k].lower()]
                TmpCalc =\
                    self.BatcList[self.RespList[i][1]][4]['polar'][TmpIndex]
                TmpDev = my_substract(TmpCalc, TmpRef)
                TmpWeig = self.RespList[i][k+2]

                if len(self.RespList[i][k]) == 1:
                    # Scale result by self.SResp
                    TmpCalc = my_product(TmpCalc, self.SResp[0])
                    TmpList =\
                        [TmpName, TmpRef, TmpCalc, TmpDev, TmpWeig]
                    DipoResult.append(TmpList)
                elif len(self.RespList[i][k]) == 2:
                    # Scale result by self.SResp
                    TmpCalc = my_product(TmpCalc, self.SResp[1])
                    TmpList =\
                        [TmpName, TmpRef, TmpCalc, TmpDev, TmpWeig]
                    PolaResult.append(TmpList)
                elif len(self.RespList[i][k]) == 3:
                    # Scale result by self.SResp
                    TmpCalc = my_product(TmpCalc, self.SResp[2])
                    TmpList =\
                        [TmpName, TmpRef, TmpCalc, TmpDev, TmpWeig]
                    HyPoResult.append(TmpList)
        if len(DipoResult) >= 1:
            print_SList(self.IOut, DipoResult,
                        'Statistic result of dipole moment :')
        if len(PolaResult) >= 1:
            print_SList(self.IOut, PolaResult,
                        'Statistic result of polarizability :')
        if len(HyPoResult) >= 1:
            tmpString = 'Statistic result of hyperpolarizability :'
            print_SList(self.IOut, HyPoResult, tmpString)

        # =======================================#
        # Analysis results based on self.GeomList#
        # =======================================#
        AtomIndex = {0: 'X', 1: 'H', 2: 'He',
                     3: 'Li', 4: 'Be', 5: 'B', 6: 'C', 7: 'N', 8: 'O',
                     9: 'F', 10: 'Ne',
                     11: 'Na', 12: 'Mg', 13: 'Al', 14: 'Si',
                     15: 'P', 16: 'S', 17: 'Cl', 18: 'Ar',
                     19: 'K', 20: 'Ga'
                     }
        BondResult = []
        AnglResult = []
        DiheResult = []
        for i in range(self.NGeom):
            if self.GeomList[i][1] == 1:
                MoleIndex = self.GeomList[i][0]
                AtomIndex1 = self.GeomList[i][2]
                AtomIndex2 = self.GeomList[i][3]
                # print_String(self.IOut,'Mole=%d,Atom1=%d,Atom2=%d'\
                #     % (MoleIndex,AtomIndex1,AtomIndex2),1,'IGOR :: DEBUG')
                # print_List_free(self.IOut,\
                #     self.BatcList[MoleIndex][4]['geom'],1,\
                #     ['%3sth%10s%10s%10s'],'IGOR :: DEBUG')
                Atom1 = self.BatcList[MoleIndex][4]['geom'][AtomIndex1-1][1:]
                Atom2 = self.BatcList[MoleIndex][4]['geom'][AtomIndex2-1][1:]
                IAn1 = \
                    int(self.BatcList[MoleIndex][4]['geom'][AtomIndex1-1][0])
                IAn2 = \
                    int(self.BatcList[MoleIndex][4]['geom'][AtomIndex2-1][0])
                TmpName = 'M%s(%s%d-' \
                          % (MoleIndex+1, AtomIndex[IAn1], AtomIndex1) + \
                          '%s%d)' % (AtomIndex[IAn2], AtomIndex2)
                TmpRef = self.GeomList[i][-2]
                TmpCalc = my_bond(Atom1, Atom2)*self.SGeom[0]
                TmpDev = my_substract(TmpRef, TmpCalc)
                TmpWeig = self.GeomList[i][-1]
                TmpList = [TmpName, TmpRef, TmpCalc, TmpDev, TmpWeig]
                BondResult.append(TmpList)
            if self.GeomList[i][1] == 2:
                MoleIndex = self.GeomList[i][0]
                AtomIndex1 = self.GeomList[i][2]
                AtomIndex2 = self.GeomList[i][3]
                AtomIndex3 = self.GeomList[i][4]
                Atom1 = self.BatcList[MoleIndex][4]['geom'][AtomIndex1-1][1:]
                Atom2 = self.BatcList[MoleIndex][4]['geom'][AtomIndex2-1][1:]
                Atom3 = self.BatcList[MoleIndex][4]['geom'][AtomIndex3-1][1:]
                IAn1 = \
                    int(self.BatcList[MoleIndex][4]['geom'][AtomIndex1-1][0])
                IAn2 = \
                    int(self.BatcList[MoleIndex][4]['geom'][AtomIndex2-1][0])
                IAn3 = \
                    int(self.BatcList[MoleIndex][4]['geom'][AtomIndex3-1][0])
                TmpName = 'M%s(%s%d-' \
                          % (MoleIndex+1, AtomIndex[IAn1], AtomIndex1) + \
                          '%s%d-' % (AtomIndex[IAn2], AtomIndex2) + \
                          '%s%d)' % (AtomIndex[IAn3], AtomIndex3)
                TmpRef = self.GeomList[i][-2]
                TmpCalc = my_angle(Atom1, Atom2, Atom3)*self.SGeom[1]
                TmpDev = my_substract(TmpRef, TmpCalc)
                TmpWeig = self.GeomList[i][-1]
                TmpList = [TmpName, TmpRef, TmpCalc, TmpDev, TmpWeig]
                AnglResult.append(TmpList)
            if self.GeomList[i][1] == 3:
                MoleIndex = self.GeomList[i][0]
                AtomIndex1 = self.GeomList[i][2]
                AtomIndex2 = self.GeomList[i][3]
                AtomIndex3 = self.GeomList[i][4]
                AtomIndex4 = self.GeomList[i][5]
                Atom1 =\
                    self.BatcList[MoleIndex][4]['geom'][AtomIndex1-1][1:]
                Atom2 =\
                    self.BatcList[MoleIndex][4]['geom'][AtomIndex2-1][1:]
                Atom3 =\
                    self.BatcList[MoleIndex][4]['geom'][AtomIndex3-1][1:]
                Atom4 =\
                    self.BatcList[MoleIndex][4]['geom'][AtomIndex4-1][1:]
                IAn1 =\
                    self.BatcList[MoleIndex][4]['geom'][AtomIndex1-1][0]
                IAn2 =\
                    self.BatcList[MoleIndex][4]['geom'][AtomIndex2-1][0]
                IAn3 =\
                    self.BatcList[MoleIndex][4]['geom'][AtomIndex3-1][0]
                IAn4 =\
                    self.BatcList[MoleIndex][4]['geom'][AtomIndex4-1][0]
                TmpName = 'M%s(%s%d-' % (MoleIndex+1, AtomIndex[IAn1],
                                         AtomIndex1) +\
                    '%s%d-' % (AtomIndex[IAn2], AtomIndex2) +\
                    '%s%d-' % (AtomIndex[IAn3], AtomIndex3) +\
                    '%s%d)' % (AtomIndex[IAn4], AtomIndex4)
                TmpRef = self.GeomList[i][-2]
                TmpCalc =\
                    my_dihedral(Atom1, Atom2, Atom3, Atom4)*self.SGeom[2]
                TmpDev = my_substract(TmpRef, TmpCalc)
                try:
                    TmpDev = abs(TmpDev)
                    if TmpDev >= 350.0 and TmpDev <= 360.0:
                        TmpDev = my_substract(abs(TmpRef), abs(TmpCalc))
                except ValueError:
                    pass
                TmpWeig = self.GeomList[i][-1]
                TmpList =\
                    [TmpName, TmpRef, TmpCalc, TmpDev, TmpWeig]
                DiheResult.append(TmpList)
        if len(BondResult) >= 1:
            tmpString = 'Statistic result of optimized bonds :'
            print_SList(self.IOut, BondResult, tmpString)
        if len(AnglResult) >= 1:
            tmpString = 'Statistic result of optimized angles :'
            print_SList(self.IOut, AnglResult, tmpString)
        if len(DiheResult) >= 1:
            tmpString = 'Statistic result of optimized dihedrals :'
            print_SList(self.IOut, DiheResult, tmpString)
        return

    def get_OptComp(self):
        # Get XYG3 components from "__xyg3 components__ ::"\
        from re import compile
        from my_io import print_Error
        p1 = compile('__xyg3 components__ *::')
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()
        else:
            print_Error(self.IOut,
                        'Error in accessing to xyg3 components set ' +
                        ' \"ConfigIO.get_XYG3Comp\"')
            return
        try:
            self.NComp = int(TmpLine.split('::')[1])
        except ValueError:
            print_Error(self.IOut, 'Error in obtain the molecular number' +
                        ' in the XYG3 components \"ConfigIO.get_XYG3Comp\"')
        for i in range(self.NComp):
            TmpLine = self.f.readline().strip()   # To ignore blank line
            if len(TmpLine) == 0:
                print_Error(self.IOut,
                            'Interlude of blank line is forbidden' +
                            ' \"ConfigIO.get_XYG3Comp\"')
            while TmpLine[0] == '#':
                TmpLine = self.f.readline().strip()
                if len(TmpLine) == 0:
                    print_Error(self.IOut,
                                'Interlude of blank line is forbidden')
            TmpList = \
                [x.strip() for x in TmpLine.split('#')[0].strip().split()]

            FlagType = TmpList[0].lower()
            for j in range(self.NBatc):   # To check the validation of Flags
                tmpFlagType = self.BatcList[j][0].strip().lower()
                if FlagType == tmpFlagType:
                    TmpType = j
                    break
            else:
                print_Error(self.IOut,
                            'Error in batch flag identifying of %s'
                            % FlagType +
                            '\"ConfigIO.get_XYG3Comp\"')

            self.CompDict[TmpType] = TmpList[1:]

            # Check the redundence of flag
            checkList = sorted(self.CompDict.keys())
            for i in checkList:
                if checkList.count(i) > 1:
                    tmpString = 'The flag (%s) appears' % FlagType +\
                        ' more than 1 times \"ConfigIO.get_XYG3Comp\"'
                    print_Error(self.IOut, tmpString)

            for i in range(len(self.CompDict[TmpType])):  # To initialize
                try:
                    self.CompDict[TmpType][i] =\
                        float(self.CompDict[TmpType][i])
                except ValueError:
                    tmpString = 'Error in obtain components for fitting' +\
                        ' \"ConfigIO.get_XYG3Comp\"'
                    print_Error(self.IOut, tmpString)

    def get_OptInit(self):
        '''Obtain initial parameters "InitPara" by "__initial guess__ ::'''
        from re import compile
        from my_io import print_List

        p1 = compile('__initial guess__ *::')
        p2 = compile(', *| +')
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()
        else:
            print_Error(self.IOut, 'Error in accessing to initial guess set ' +
                        ' \"ConfigIO.get_OptInit\"')
            return
        TmpLine = self.f.readline().strip()
        while len(TmpLine) != 0:
            while TmpLine[0] == '#':
                TmpLine = self.f.readline().strip()
            else:
                TmpList = p2.split(TmpLine.split('#')[0].strip())
            for init in TmpList:
                try:
                    self.InitGuess.append(float(init))
                except ValueError:
                    print_Error(self.IOut, 'Error in obtain the ' +
                                'initial guess for OPT' +
                                ' \"ConfigIO.get_OptInit\"')
            TmpLine = self.f.readline().strip()
        print_List(self.IOut, self.InitGuess, 4, 'Initial Guess')
        return

    def get_OptAlgo(self):
        # =============================
        # Get optimization algorithm OptAlgo by __optimization algorithm__ ::
        # =============================
        from re import compile
        from my_io import print_String

        p1 = compile('__optimization algorithm__ *::')
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()
        else:
            tmpString = 'Error in accessing to optimization algorithm ' +\
                ' \"ConfigIO.get_OptAlgo\"'
            print_Error(self.IOut, tmpString)
            return
        self.OptAlgo = TmpLine.split('::')[1].strip()
        tmpPrint = 'Optimization Algorithm employed is %s' % self.OptAlgo
        print_String(self.IOut, tmpPrint, 1)
        return

    def get_OptFunc(self):
        # =================================================================
        # build the module "opt_func.py" from "__optimization function__ ::"\
        #  which contains "opt_func()" for XYG3 type optimization;\
        #     or contains "update_qchem_xmp2()" for xMP2 type optimization;\
        # =================================================================
        from re import compile
        from my_io import print_List, print_Error
        from os.path import isfile

        p1 = compile('__optimization function__ *::')
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()
        else:
            print_Error(self.IOut, 'Error in accessing to the ' +
                        'function for optimizing' +
                        ' \"ConfigIO.get_OptFunc\"')

        tmpCode = []

        try:
            NCode = int(TmpLine.split('::')[1].strip())
            for i in range(NCode):  # Loading optimized function
                tmpCode.append(self.f.readline())
        except ValueError:
            NCode = TmpLine.split('::')[1].strip()
            if isfile(NCode):  # Check the existence of module file
                tf = file(NCode, 'r')  # and load it
                tmpCode = tf.readlines()
                tf.close()
            else:
                tmpString = 'Error in accessing to the line number of ' +\
                    'opt_func or the existing module name' +\
                    ' \"ConfigIO.get_OptFunc\"'
                print_Error(self.IOut, tmpString)

        tmpF = file('opt_func.py', 'w')  # Generate opt function module
        for tmpString in tmpCode:
            tmpF.write(tmpString)
        tmpF.close()

        if self.OptJob == 'xyg3':  # Check required functions
            try:
                from opt_func  import opt_func
            except:
                print_Error(self.IOut, 'Error in importing \"opt_func\"' +
                            ' \"ConfigIO.get_OptFunc\"')
        elif self.OptJob == 'xmp2':
            try:
                from opt_func   import update_qchem_xmp2
            except:
                print_Error(self.IOut, 'Error in importing ' +
                            '\"update_qchem_xmp2\"' +
                            ' \"ConfigIO.get_OptFunc\"')
        elif self.OptJob == 'scpt2':
            try:
                from opt_func import update_aims_scpt2
            except:
                print_Error(self.IOut, 'Error in importing ' +
                            '\"update_aims_scpt2\"' +
                            ' \"ConfigIO.get_OptFunc\"')
        elif self.OptJob == 'scsrpa':
            try:
                from opt_func import update_aims_scsrpa
            except:
                print_Error(self.IOut, 'Error in importing ' +
                            '\"update_aims_scsrpa\"' +
                            ' \"ConfigIO.get_OptFunc\"')

        if self.OptAlgo[:11] == 'fmin_cobyla':
            try:
                from opt_func import opt_func_constrained
            except:
                print_Error(self.IOut, 'Error in importing ' +
                            '\"opt_func_constrained\"' +
                            ' \"ConfigIO.get_OptFunc\"')
        print_List(self.IOut, tmpCode, 2, 'Function for optimizing')
        return

    def run_OptCalc(self, func, C=None):
        # ==================================
        # calculate the batch list based on the optimizing function "func",
        # which returns a numeric float number
        # ==================================
        index = 0
        for job in self.BatcList:
            if job[2] != 'XYG3_Comp':
                print_Error(self.IOut,
                            'Energy should be obtained from XYG3Comp'
                            + ' \"run_OptCalc\" (%s)' % job[2])
            if C is None:
                TmpResult = func(self.CompDict[index])
            else:
                try:
                    TmpResult = func(C, self.CompDict[index])
                except ValueError:
                    print(C)
                    print(index)
                    print(self.CompDict[index])
                    exit()
            job[4]['energy'] = [TmpResult]
            index += 1
        return

    def get_OptResu(self, iop=1):
        # =======================================#
        # Analysis results according to the training set
        # =======================================#
        from my_io import my_plus
        from my_io import my_substract
        from my_io import my_product
        from my_io import print_List_free
        # =======================================#
        # Analysis results based on self.EngyList#
        # =======================================#
        self.Result = []
        for i in range(self.NEngy):
            k = self.EngyList[i][0]*2 + 1
            TmpRef = self.EngyList[i][k]     # Then get the ref enegy
            TmpCalc = 0.0                    # Then get the energy

            # TmpPrint = ''
            for j in range(self.EngyList[i][0]):
                k = j*2+1
                en = self.BatcList[self.EngyList[i][k]][4]['energy'][0]
                ind = self.EngyList[i][k+1]
                # TmpPrint += '%16.8f%5i' %(en,ind)
                TmpCalc = my_plus(TmpCalc, my_product(en, ind))
            # scale result by self.SEngy
            TmpCalc = my_product(TmpCalc, self.SEngy)
            TmpDev = my_substract(TmpCalc, TmpRef)
            # TmpPrint += '%16.8f%16.8f' %(TmpCalc, TmpRef)
            # print_String(self.IOut,TmpPrint,1)
            self.Result.append(TmpDev)
        if iop == 2:
            FormList = ['  %16.8f', '  %16s']
            tmpString = 'Now print detail deviations for optimization'
            print_List_free(self.IOut, self.Result, 1, FormList, tmpString)
        return self.Result

    def run_Statistic(self):
        # ============================================================
        # Calculate statistic result based on SList, and print it.\n\
        # AD, MAD, RMS, and correspond weighted ones are obtained here.
        # ============================================================
        from math import sqrt
        from math import pow
        from my_io import print_String

        AD = 0.0
        MAD = 0.0
        RMS = 0.0
        wAD = 0.0
        wMAD = 0.0
        wRMS = 0.0
        NumData = 0
        for i in range(self.NEngy):
            try:
                dv = self.Result[i]
                adv = abs(dv)
                wdv = dv*self.EngyList[i][-1]
                awdv = abs(wdv)

                self.Result[i] = self.Result[i]*self.EngyList[i][-1]

                AD = AD + dv
                wAD = wAD + wdv
                MAD = MAD + adv
                wMAD = wMAD + awdv
                RMS = RMS + pow(dv, 2.0)
                wRMS = wRMS + pow(wdv, 2.0)

                NumData = NumData + 1
            except TypeError:
                print_String(self.IOut,
                             'An invalid result for the %5ith reaction' % i, 2)

        # if NumData > 0:
        if NumData == len(self.NEngy):
            AD = AD / float(NumData)
            wAD = wAD / float(NumData)
            MAD = MAD / float(NumData)
            wMAD = wMAD / float(NumData)
            RMS = sqrt(RMS / float(NumData))
            wRMS = sqrt(wRMS / float(NumData))
        else:
            AD = 10000.0
            wAD = 10000.0
            MAD = 10000.0
            wMAD = 10000.0
            RMS = 10000.0
            wRMS = 10000.0
        self.IOut.write('==%s==\n' % ('-'*76))
        print_String(self.IOut, '%10s = %16.8f; %10s = %16.8f'
                     % ('AD', AD, 'wAD', wAD), 1)
        print_String(self.IOut, '%10s = %16.8f; %10s = %16.8f'
                     % ('MAD', MAD, 'wMAD', wMAD), 1)
        print_String(self.IOut, '%10s = %16.8f; %10s = %16.8f'
                     % ('RMS', RMS, 'wRMS', wRMS), 1)
        self.IOut.write('==%s==\n' % ('-'*76))
        return (AD, wAD, MAD, wMAD, RMS, wRMS)

    def get_OptJob(self):
        # ==================================================================
        # Obtain optimization job type "OptJob" by "__optimization job__ ::"
        # ==================================================================
        from re import compile
        from my_io import print_String

        p1 = compile('__optimization job__ *::')
        self.f.seek(0)
        TmpFile = self.f.read().lower()
        if p1.search(TmpFile):
            LocPos = p1.search(TmpFile).start()
            self.f.seek(LocPos)
            TmpLine = self.f.readline().split('#')[0].strip()
        else:
            print_Error(self.IOut,
                        'Error in accessing to optimization job ' +
                        ' \"ConfigIO.get_OptJob\"')
            return
        self.OptJob = TmpLine.split('::')[1].strip().lower()
        tmpPrint = 'Optimization job is %s' % self.OptJob
        print_String(self.IOut, tmpPrint, 1)
        return
