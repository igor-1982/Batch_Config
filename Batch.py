#!/bin/env python
#Filename:  Batch
#Author  :  Igor Ying Zhang, Xin Xu 
#Purpose :  Batch job based on the special config interface
#
#Usage   :  Batch.py Config
#
__version__	= '1.6(20120522)'
#
#Improve :  1.0) Complete basic batch function
#           1.1) Add energy and polarizability calculation batch
#           1.2) Add geometry optimization batch
#           1.3) 1. Support qchem job in batch
#                2. Show time consuming
#           1.4) 1. Replace ".my_modules_path" by the grobal environment of "IGOR_MODULES_PATH"
#                2. Replace ".batch_path" by the grobal environment of "BATCH_PATH"
#           1.5) Support cp2k job in batch
#           1.6) Support aims job in batch
#
#
__info__	= ['#Filename:  Batch',
    '#Author  :  Igor Ying Zhang, Xin Xu',
    '#Version :  %s' % __version__,
    '#Purpose :  Batch jobs based on the special config interface']
iprint	= 1

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
    else:
        print('Error in getting grobal environment '+\
            '\"$IGOR_MODULES_PATH\" which is the ' +\
            'direction to private modules')
        sys.exit(1)
    import gaussian_manage as gaum                                   # Import private modules
    import qchem_manage    as qchem
    import dft_d           as dftd
    from my_io             import print_Error
    from my_io             import print_List
    from my_io             import print_String
    from my_io             import ConfigIO
         
    filename	= argv[1]
    WorkPath, JobName   = split(filename)
    Name, Prefix        = splitext(JobName)
    if len(WorkPath)>0:
        chdir(WorkPath)
    iout	= open('%s.Batch' % Name,'w')                            # Open the output file
    print_String(iout,'Batch start from '+ctime(),1)
    TimeStart   = time()
    MainBatch   = ConfigIO(iout,fn=filename,bugctrl=iprint)
    MainBatch
    MainBatch.get_ProjEnvr()
    if MainBatch.ProjTool=='gaussian':
        MainBatch.get_GauIOCmd()
    elif MainBatch.ProjTool=='qchem' or \
        MainBatch.ProjTool=='q-chem':
        MainBatch.get_QcmIOCmd()
    elif MainBatch.ProjTool=='cp2k':
        MainBatch.get_CP2IOCmd()
    elif MainBatch.ProjTool=='aims':
        MainBatch.get_AimIOCmd()
    else:
        print_Error(iout,'At present, our batch is only incoperate'\
            + ' with "Gaussian", "Q-Chem", and "CP2K"')
    MainBatch.get_Batch()
    MainBatch.get_TrainSet()
    if MainBatch.ProjTool=='gaussian':
        MainBatch.run_GauBatch()
    elif MainBatch.ProjTool=='qchem' or \
        MainBatch.ProjTool=='q-chem':
        MainBatch.run_QcmBatch()
    elif MainBatch.ProjTool=='cp2k':
        MainBatch.run_CP2Batch()
    elif MainBatch.ProjTool=='aims':
        MainBatch.run_AimBatch()
    MainBatch.get_Result()
    TimeEnd = time() - TimeStart
    print_String(iout,'Total job time: %10.2f(wall)' % TimeEnd,1)
    print_String(iout,'Batch end at '+ctime(),1)
    print_List(iout,__info__,2,'%s' % '-'*76+'==')
    return
        

#//////////////////////////////#
#                              #
#                              #
#NOW START TO THE MAIN PROGRAM #
#                              #
#                              #
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
main()

