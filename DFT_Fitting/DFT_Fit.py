#!/usr/bin/env python
#Usage          :: hybrid_parameter_fit.py [AtomList] [MoleList] [AtomCode]
#Purpose        :: To optimize the hybrid parameter in DFT against the specified atomization set
#Authors        :: Igor Ying Zhang, and Xin Xu
__version__     = '0.3(20100731)'
#Interpretation :: to fluctuate the hybrid parameter in XYG3 form like this:
#History        ::  V0.1    1) implement simply DFT parameters optimization based on several complicated 
#                              input files
#                           2) parallel it
#                   V0.2    1) standardize input file by the class of "IGOR_MODULES_PATH/my_io.py/ConfigIO"
#                           2) XYG3 type functionals optimization
#                   V0.3    1) xMP2 optimization combined with Q-Chem package
#                           2) parallel it
#                   V0.4    1) SCMP2 optimization combined with FHI-aims package


__info__	= ['#Filename:  DFT_Fit',
    '#Author  :  Igor Ying Zhang, Xin Xu',
    '#Version :  %s' % __version__,
    '#Purpose :  DFT optimization using several algorithms']
iprint	= 1

import sys
import os
import re
import math
import multiprocessing
import multiprocessing.managers
import scipy.optimize as opt
from scipy          import array
from scipy          import reshape
from scipy          import arange
from scipy          import exp
from scipy          import power
from scipy.special  import erfc
from scipy.special  import erf

def calc_statistic(C,FitClass):
    '''\
    a wrapper for statistic calculations of different optimization jobs\
    '''
    if FitClass.OptJob == 'xyg3':
        return calc_statistic_xyg3(C,FitClass)
    elif FitClass.OptJob == 'xmp2':
        return calc_statistic_xmp2(C,FitClass)
    elif FitClass.OptJob == 'scpt2':
        return calc_statistic_scpt2(C,FitClass)
    elif FitClass.OptJob == 'scsrpa':
        return calc_statistic_scsrpa(C,FitClass)

def calc_statistic_xyg3(C,FitClass):
    '''\
    return statistic informations for "XYG3" type optimization\
    '''
    from my_io      import print_List
    from my_io      import print_Error

    from opt_func   import opt_func

    print_List(FitClass.IOut,C,
        4,Info='Testing parameters in this round')
    #for x,y in FitClass.CompDict.iteritems():
    #    print x,y
    FitClass.run_OptCalc(opt_func,C)
    if FitClass.OptAlgo[:5] == 'batch':
        FitClass.get_OptResu(iop=1)
        print_List(FitClass.IOut,FitClass.InitGuess,\
            4,Info='Batch corresponds to these parameters ::')
        FitClass.run_Statistic()
    else:
        FitClass.get_OptResu(iop=0)
        AD, wAD,  MAD, wMAD,  RMS, wRMS = FitClass.run_Statistic()
        if FitClass.OptAlgo == 'leastsq':
            return array(FitClass.Result)
        elif FitClass.OptAlgo[-3:] == 'rms':
            return wRMS
        elif FitClass.OptAlgo[-3:] == 'mad':
            return wMAD
        elif FitClass.OptAlgo[-2:] == 'ad':
            return wAD
        else:
            print_Error(FitClass.IOut,
                'Error in returning required type of statistic data'+\
                ' \"calc_statistic()->%s\"' % FitClass.OptAlgo)
    return

def calc_statistic_xmp2(C,FitClass):
    '''\
    return statistic informations for xMP2 type optimization\
    '''
    from my_io      import print_List
    from my_io      import print_Error

    from opt_func   import update_qchem_xmp2 

    print_List(FitClass.IOut,C,
        4,Info='Testing parameters in this round')
    update_qchem_xmp2(C,FitClass)
    FitClass.run_QcmBatch()
    if FitClass.OptAlgo[:5] == 'batch':
        FitClass.get_OptResu(iop=1)
        print_List(FitClass.IOut,FitClass.InitGuess,\
            4,Info='Batch corresponds to these parameters ::')
        FitClass.run_Statistic()
    else:
        FitClass.get_OptResu(iop=0)
        AD, wAD,  MAD, wMAD,  RMS, wRMS = FitClass.run_Statistic()
        if FitClass.OptAlgo == 'leastsq':
            return array(FitClass.Result)
        elif FitClass.OptAlgo[-3:] == 'rms':
            return wRMS
        elif FitClass.OptAlgo[-3:] == 'mad':
            return wMAD
        elif FitClass.OptAlgo[-2:] == 'ad':
            return wAD
        else:
            print_Error(FitClass.IOut,
                'Error in return required type of statistic data'+\
                ' \"calc_statistic()->%s\"' % FitClass.OptAlgo)
    return

def calc_statistic_scpt2(C,FitClass):
    '''\
    return statistic informations for SCPT2 type optimization\
    '''
    from my_io      import print_List
    from my_io      import print_Error

    from opt_func   import update_aims_scpt2 

    print_List(FitClass.IOut,C,
        4,Info='Testing parameters in this round')
    update_aims_scpt2(C,FitClass)
    FitClass.run_AimBatch()
    if FitClass.OptAlgo[:5] == 'batch':
        FitClass.get_OptResu(iop=1)
        print_List(FitClass.IOut,FitClass.InitGuess,\
            4,Info='Batch corresponds to these parameters ::')
        FitClass.run_Statistic()
    else:
        FitClass.get_OptResu(iop=0)
        AD, wAD,  MAD, wMAD,  RMS, wRMS = FitClass.run_Statistic()
        if FitClass.OptAlgo == 'leastsq':
            return array(FitClass.Result)
        elif FitClass.OptAlgo[-3:] == 'rms':
            return wRMS
        elif FitClass.OptAlgo[-3:] == 'mad':
            return wMAD
        elif FitClass.OptAlgo[-2:] == 'ad':
            return wAD
        else:
            print_Error(FitClass.IOut,
                'Error in return required type of statistic data'+\
                ' \"calc_statistic()->%s\"' % FitClass.OptAlgo)
    return

def calc_statistic_scsrpa(C,FitClass):
    '''\
    return statistic informations for SCPT2 type optimization\
    '''
    import time
    from os.path import isdir, abspath, isfile
    from os import listdir, remove
    from my_io import print_List
    from my_io import print_String
    from my_io import print_Error

    from opt_func import update_aims_scsrpa

    print_List(FitClass.IOut,C,
        4,Info='Testing parameters in this round')
    # Initialize the running folder
    if isdir(FitClass.ProjDir):
        for xFile in listdir(FitClass.ProjDir):
            axFile = '%s/%s' %(FitClass.ProjDir, xFile)
            if isfile(axFile) and xFile[-4:]=='.log':
                remove(axFile)
            if isdir(axFile):
                for yFile in listdir(axFile):
                    ayFile = '%s/%s' %(axFile, yFile)
                    if isfile(ayFile) and\
                       yFile=='RUNNING' or\
                       yFile[-4:]=='.log':
                        remove(ayFile)
    update_aims_scsrpa(C,FitClass)
    if FitClass.BatchType == 'serial':
        FitClass.run_AimBatch()
    elif FitClass.BatchType == 'queue': 
        # we should not re-run all finished jobs during this check
        tmpProjCtrl = FitClass.ProjCtrl
        FitClass.ProjCtrl = 2
        # we would like to turn of detailed output during the check
        tmpIPrint = FitClass.IPrint
        FitClass.IPrint = 0
        FlagBatch = FitClass.run_AimBatch()
        interval = 0
        while not FlagBatch:
            time.sleep(2)
            FlagBatch = FitClass.run_AimBatch()
            interval = interval + 2
        FitClass.ProjType = tmpProjCtrl
        FitClass.IPrint = tmpIPrint
        # Print the results when all jobs are finished
        FlagBatch = FitClass.run_AimBatch()
        print_String(FitClass.IOut, 
                'This batch takes %i Seconds', 
                interval)
    if FitClass.OptAlgo[:5] == 'batch':
        FitClass.get_OptResu(iop=1)
        print_List(FitClass.IOut,FitClass.InitGuess,\
            4,Info='Batch corresponds to these parameters ::')
        FitClass.run_Statistic()
    else:
        FitClass.get_OptResu(iop=0)
        AD, wAD,  MAD, wMAD,  RMS, wRMS = FitClass.run_Statistic()
        if FitClass.OptAlgo == 'leastsq':
            return array(FitClass.Result)
        elif FitClass.OptAlgo[-3:] == 'rms':
            return wRMS
        elif FitClass.OptAlgo[-3:] == 'mad':
            return wMAD
        elif FitClass.OptAlgo[-2:] == 'ad':
            return wAD
        else:
            print_Error(FitClass.IOut,
                'Error in return required type of statistic data'+\
                ' \"calc_statistic()->%s\"' % FitClass.OptAlgo)
    return

def run_optimization(FitClass):
    '''\
    run optimization based on FitClass\
    '''
    from my_io      import print_List

    if FitClass.OptAlgo == 'leastsq':                                # leastsq algorithm
        plsq    = opt.leastsq(calc_statistic,FitClass.InitGuess,\
            args=tuple([FitClass]))
        tmpresult   = [float(x) for x in plsq[0]]
        print_List(FitClass.IOut,tmpresult,
            4,Info='Optimized result by leastsq algorithm')
        FitClass.InitGuess  = tmpresult[:]
    elif FitClass.OptAlgo[:11] == 'fmin_cobyla':                     # fmin algorithm
        try:
            from opt_func   import opt_func_constrained
        except:
            print_Error(FitClass.IOut,'\"opt_func_constrained\"'+\
                ' is required for \"fmin_cobyla\"')
        interval = 1.0                                               #   Set initial changes
        for i in FitClass.InitGuess:
            if abs(i)<interval:
                interval = abs(i)
            if i == 0.0:
                interval = 1.0
                break
        plsq    = opt.fmin_cobyla(calc_statistic,FitClass.InitGuess,\
            cons=opt_func_constrained,
            args=tuple([FitClass]),rhobeg=interval)
        print_List(FitClass.IOut,plsq,
            4,Info='Optimized result by fmin_cobyla algorithm')
        FitClass.InitGuess  = plsq[:]
    elif FitClass.OptAlgo[:4] == 'fmin':                             # fmin algorithm
        plsq    = opt.fmin(calc_statistic,FitClass.InitGuess,\
            args=tuple([FitClass]))
        print_List(FitClass.IOut,plsq,
            4,Info='Optimized result by fmin algorithm')
        FitClass.InitGuess  = plsq[:]
    elif FitClass.OptAlgo[:5] == 'brute':                            # brute algorithm
        plsq    = opt.brute(calc_statistic,\
                ((-4.,-2.),(-1.,1.),(-4.,-2.),(-1.,1.)),\
            args=(FitClass))
        print_List(FitClass.IOut,plsq,
            4,Info='Optimized result by brute algorithm')
        FitClass.InitGuess  = plsq[:]
    elif FitClass.OptAlgo[:6] == 'anneal':                           # anneal algorithm
        plsq    = opt.anneal(calc_statistic,FitClass.InitGuess,\
            args=tuple([FitClass]),dwell=200,maxiter=2000,lower=0.0,upper=1.0, T0=200.0)
        print_List(FitClass.IOut,plsq[0],
            4,Info='Optimized result by anneal algorithm')
        FitClass.InitGuess  = plsq[0][:]
    elif FitClass.OptAlgo[:5] == 'batch':                            # Just DEBUGING
        calc_statistic(FitClass.InitGuess,FitClass)
    return

def main(argv=None):
    from os      import getcwd
    from os      import getenv
    from os      import chdir
    from os.path import isfile
    from os.path import split
    from os.path import splitext
    from time    import ctime
    from time    import time
    import sys
    if argv is None: argv=sys.argv
    WorkDir	= getcwd().strip()                                       # STRING, current DIR 
    HomeDir	= getenv('HOME')                                         # STRING, Home DIR
    if getenv('IGOR_MODULES_PATH'):                                  # STRING, private module DIR
        ModuDir=getenv('IGOR_MODULES_PATH')
        sys.path.append(ModuDir)                                     # Append it into "sys.path"
        sys.path.append(WorkDir)                                     # Append it into "sys.path"
    else:
        print 'Error in getting grobal environment '+\
            '\"$IGOR_MODULES_PATH\" which is the ' +\
            'direction to private modules'
        sys.exit(1)
    from my_io             import print_Error                        # Import private modules
    from my_io             import print_List
    from my_io             import print_String
    from my_io             import ConfigIO
         
    filename	= argv[1]
    WorkPath, JobName   = split(filename)
    Name, Prefix        = splitext(JobName)
    if len(WorkPath)>0:
        chdir(WorkPath)
    iout	= file('%s.Fit' % Name,'w')                              # Open the output file

    print_String(iout,'Fitting start from '+ctime(),1)               # Count time consuming
    TimeStart   = time()

    MainFit   = ConfigIO(iout,fn=filename,bugctrl=iprint)       # Analysis config file
    MainFit.get_ProjEnvr()
    MainFit.get_Batch()
    MainFit.get_TrainSet()
    MainFit.get_OptJob()
    if MainFit.OptJob == 'xyg3':                                # XYG3-like optimization job
        MainFit.get_OptInit()
        MainFit.get_OptAlgo()
        MainFit.get_OptComp()
        MainFit.get_OptFunc()

        run_optimization(MainFit)                               #  Run optimization based on MainFit

    elif MainFit.OptJob.lower() == 'xmp2':                      # extend MP2 optimization job
        if MainFit.ProjTool != 'qchem':
            print_String(iout,'At present, the optimization for'+\
                'could only be combined with Q-Chem package',1)
            return
        MainFit.get_QcmIOCmd()
        MainFit.get_OptInit()
        MainFit.get_OptAlgo()
        MainFit.get_OptFunc()

        run_optimization(MainFit)                               #  Run optimization based on MainFit

    elif MainFit.OptJob.lower() == 'scpt2' or\
            MainFit.OptJob.lower() == 'scsrpa':
        if MainFit.ProjTool != 'aims':
            print_String(iout,'At present, the optimization for'+\
                'could only be combined with FHI-aims package',1)
            return
        MainFit.get_AimIOCmd()
        MainFit.get_OptInit()
        MainFit.get_OptAlgo()
        MainFit.get_OptFunc()

        run_optimization(MainFit)                               #  Run optimization based on MainFit


    if MainFit.OptAlgo != 'batch':
        MainFit.OptAlgo = 'batch'
        run_optimization(MainFit)                                    # Print details for final one

    TimeEnd = time() - TimeStart                                     # Count time consuming
    print_String(iout,'Total job time: %10.2f(wall)' % TimeEnd,1)
    print_String(iout,'Fitting end at '+ctime(),1)
    print_List(iout,__info__,2,'%s' % '-'*76+'==')                   # Print Authors Info.

    iout.close()
    return

main()
