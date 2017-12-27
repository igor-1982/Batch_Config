#!/bin/env python2
#Module 	:: QChem_Manage
#Authors	:: Ying Zhang and Xin Xu 
#Purpose	:: 1) Analysis the input file of QChem package;
#       	:: 2) Generate the input file of QChem package;
#       	:: 3) Collect results from QChem package;
#           :: All in all, a well-defined private interface with QChem series
#              package
#Version	:: 0.1(20100314)
#Revise     :: 2010-03-14
#History    :: 0.1(20100314) Completes basic functions for QChem IO.
#                            There is one classe:
#                                1) QChemIO     : manage QChem input and output
#              0.2(20100731) 1) Add an argument "iop" into the function "QChemIO.run_Job"
#                               to control parallel or series mode
#                            2) Add an argument "iop" into the function "QChemIO.get_Result"
#                               to control which type of results is required
#                               a) iop=0 for the total energy directly from log
#                                    (QChemIO.SCFReal,QChemIO.CCSD(T),...)
#                               b) iop=1 for the PT21 component (QChemIO.PT21Real)
#                               c) iop=2 for the PT22 component (QChemIO.PT22Real)
#                               d) iop=3 for the xMP2 energy (QChemIO.xMP2Real)
#                            3) Modify the structure of Input information. Group several lists
#                               into one dictionary:
#                               (RemList, MolList, XCFList, OccList, ...) to InpuDict
#                               It aims for simplifying "form_Input" when adding new group of input

class QChemIO:
    '''\
 Manage the input file of the Gaussian package.\n\
   INPUT VARIABLES    ::\n\
 iout                : FLOW of output file\n\
 fn                  : STRING of the input file name\n\
                       fn = None -> default, bypass the action to open the file\n\
 bugctrl             : INTEGER to control the bebug information print\n\
                       0: default\n\
                       1: more results \n\
                       2: more results add detail debugging info.\n\
    MANAGE VARIABLES   :: \n\
       (***Note***: if need, all the strings following have to be specified in lower style\n\
 self.IOut           : FLOW of output file\n\
 self.FileName       : STRING of the input file name\n\
 self.ModuDir        : STRING of the path name to reach the gaussian environment
 self.JobName        : STRING of this job name\n\
 self.ChkName        : STRING, the name of the check file\n\
 self.CartesianFlag  : LOGICAL to state geomerty input is Cartesian coordinate or not\n\
 self.IPrint         : INTEGER of print level\n\
 self.Charge         : INTEGER of input Chage   \n\
 self.Spin           : INTEGER of input Spin    \n\
 self.NAtom          : INTEGER of atoms number \n\
 self.MachineList    : LIST of machine commands\n\
 self.OptionList     : LIST of options\n\
 self.TitleList      : LIST of this job title \n\
 self.GeomList       : LIST of input geometry   \n\
 self.IAn            : LIST of Atom index\n\
 self.AtLabel        : LIST of Atom label\n\
 self.CList          : LIST of geometry coordinate\n\
 self.ZList          : LIST of geometry Z-matrix\n\
 self.ZListR         : LIST of Z-matrix parameters\n\
 --------------------------Results Collected--------------------------------------\n\
 self.SCFReal        : FLOAT, the SCF energy of the quesion\n\
 self.CCSDTReal      : FLOAT, the CCSD(T) energy of the quesion\n\
 self.R5DFTReal      : FLOAT, the Post-DFT energy of the quesion\n\
 self.PT21Real       : FLOAT, the singly-excited contribution for PT2\n\
 self.PT22Real       : FLOAT, the doubly-excited contribution for PT2\n\
 self.xMP2Real       : FLOAT, the xMP2 energy of the quesion\n\
 ----------------------------------------------------------------------------------------\
 '''

    AtDict	= {\
   'x':0  ,
   'h':1  , 'he':2  ,\
  'li':3  , 'be':4  ,  'b':5  ,  'c':6  ,  'n':7  ,  'o':8  ,  'f':9  , 'ne':10 ,\
  'na':11 , 'mg':12 , 'al':13 , 'si':14 ,  'p':15 ,  's':16 , 'cl':17 , 'ar':18 ,\
   'k':19 , 'ca':20 , 'ga':31 , 'ge':32 , 'as':33 , 'se':34 , 'br':35 , 'kr':36 ,\
  'sc':21 , 'ti':22 ,  'v':23 , 'cr':24 , 'mn':25 ,\
  'fe':26 , 'co':27 , 'ni':28 , 'cu':29 , 'zn':30 ,\
  'rb':37 , 'sr':38 , 'in':49 , 'sn':50 , 'sb':51 , 'te':52 ,  'i':53 , 'xe':54 ,\
   'y':39 , 'zr':40 , 'nb':41 , 'mo':42 , 'tc':43 ,\
  'ru':44 , 'rh':45 , 'pd':46 , 'ag':47 , 'cd':48 \
                  }
    def __init__(self,iout,fn=None,bugctrl=0):
        '''\
        Initialize variables belonged to GauIO\
        '''
        from os      import getcwd
        from os      import getenv
        from os.path import isfile

        from my_io   import print_Error
        from my_io   import print_String

        self.IOut	    = iout                                       # Flow of the output file
        self.IPrint	    = bugctrl                                    # to control the printing out
        self.FileName	= fn                                         # Name of the input file

        self.WorkDir    = getcwd().strip()                           # STRING, current DIR 
        self.HomeDir    = getenv('HOME')                             # STRING, Home DIR
        if getenv('IGOR_MODULES_PATH'):                              # STRING, private module DIR
            self.ModuDir=getenv('IGOR_MODULES_PATH')
        else:
            print_Error(self.IOut,
                'Error in getting grobal environment '+\
                '\"$IGOR_MODULES_PATH\" which is the direction to private modules')
         
        if self.FileName==None:
            self.f  = 'None'
            if self.IPrint>=1:
                print_String(self.IOut,
                    'Do not open input file for QChemIO class',1)
        else:
            try:
                self.f 	= file(self.FileName,'r')                    # Open it
            except IOError:
                self.f  = file('Error_%s' %self.FileName,'w')
            if self.IPrint>=1:
                print_String(self.IOut,
                    'Open QChem-Input file "%s" for QChemIO class'
                    % self.FileName,1)
            #
            #Generating "self.JobName" which is head of "self.FileName"
            #For example, if    self.FileName  = 'g03_1.gjf'
            #             then  self.JobName   = 'g03_1'
            TmpList		= self.FileName.split('.')
            if len(TmpList)<=2:                         
                self.JobName= TmpList[0]
            else:
                self.JobName= '.'.join(TmpList[0:-1])                 # Name of this job
            del TmpList
            if bugctrl>=1:
                print_String(iout,'Enter the job : \"%s\"'
                    % self.JobName,2)


        self.InpuDict    = {
 #              'RemList' : [],                                      # List, options for rem group
 #              'MolList' : [],                                      # List, info. for geom. group
 #              'XCFList' : [],                                      # List, options for xc_func.
 #              'OccList' : [],                                      # List, info. for occupied group
                           }

        self.Charge     = ''                                         # Input Chage
        self.Spin	    = ''                                         # Input Spin
        self.AtLabel	= []                                         # List, Atom labels

 #       self.GeomList	= []                                         # Input Geometry
 #       self.IAn	= []                                             # List, Atom indexs
 #       self.CList	= []                                             # List, Atom coordinates
 #       self.CartesianFlag=False                                     # "True"  : Cartesian
 #       self.ZList  = []                                             # List, Atom Z-matrix
 #       self.ZListR = []                                             # List, Z-matrix parameters
 #                                                                    # "False" : Z-Matrix;
 #       self.NAtom	= 0                                              # Number of atoms
 #       self.RestList	= []                                         # Rest content after Geometry

        self.SCFReal    = 0.0                                        # REAL, SCF energy
        self.CCSDTReal  = 0.0                                        # REAL, CCSD(T) energy
        self.R5DFTReal  = 0.0                                        # REAL, R5DFT energy
        self.PT21Real   = 0.0                                        # REAL, the 1st term for PT2
        self.PT22Real   = 0.0                                        # REAL, the 2nd term for PT2
        self.xMP2Real   = 0.0                                        # REAL, xMP2 energy
        return

    def __del__(self):
        '''Close the document flow of input file'''
        from my_io   import print_String
        if self.f=='None':
            if self.IPrint>=2:
                print_String(self.IOut,
                    'Do not close input file for QChemIO class',1)
        else:
            if self.IPrint>=2:
                print_String(self.IOut,
                    'Close QChem-Input file "%s" for QChemIO class'
                    % self.FileName,1)
            self.f.close()                                           # Close input file
        return

    def get_Input(self):
        '''Loading molecule group from input file'''
        from re         import compile
        from my_io      import print_Error
        from my_io      import print_List
        from my_io      import print_String
        p1  = compile('\$molecule')                                   # Now loading molecule group
        p2  = compile('\$end') 
        if self.IPrint >= 1:
            print_String(self.IOut, 'Now reading molecule group',1)
        self.f.seek(0)
        TmpFile=self.f.read().lower()
        if p1.search(TmpFile):
            self.InpuDict['MolList']=[]
            self.InpuDict['MolList'].append('$molecule')
            LocPos  = p1.search(TmpFile).start() 
            self.f.seek(LocPos)
            self.f.readline()
            TmpLine = self.f.readline().strip()
            if len(TmpLine.split())!=2:
                print_Error(self.IOut,'Error occures in loading'+\
                        ' [Charge] and [Spin]')
            else:
                try:
                    self.Charge = int(TmpLine.split()[0])
                    self.Spin   = int(TmpLine.split()[1])
                except ValueError:
                    print_Error(self.IOut,'Error occures in'+\
                            ' loading [Charge] and [Spin]')
            while not p2.search(TmpLine.lower()):
                self.InpuDict['MolList'].append(TmpLine)
                if len(TmpLine.strip())==4:
                    elem_name = TmpLine.lower().split()[0]
                    if elem_name in QChemIO.AtDict:
                        self.AtLabel.append(elem_name)
                TmpLine = self.f.readline().strip()
            else:
                self.InpuDict['MolList'].append('$end')
            print(self.AtLabel)
        else:
            print_String(self.IOut,
                'No molecule group in INPUT file',1)

        p1  = compile('\$rem')                                        # Now loading rem group
        p2  = compile('\$end') 
        if self.IPrint >= 1:
            print_String(self.IOut, 'Now reading rem group',1)
        self.f.seek(0)
        TmpFile=self.f.read().lower()
        if p1.search(TmpFile):
            self.InpuDict['RemList']=[]
            self.InpuDict['RemList'].append('$rem')
            LocPos  = p1.search(TmpFile).start() 
            self.f.seek(LocPos)
            self.f.readline()
            TmpLine = self.f.readline().strip()
            while not p2.search(TmpLine.lower()):
                self.InpuDict['RemList'].append(TmpLine)
                TmpLine = self.f.readline().strip()
            else:
                self.InpuDict['RemList'].append('$end')
        else:
            print_String(self.IOut,
                'No rem group in INPUT file',1)

        p1  = compile('\$xc_functional')                             # Now loading xc_functional
        p2  = compile('\$end') 
        if self.IPrint >= 1:
            print_String(self.IOut, 'Now reading xc_functional group',1)
        self.f.seek(0)
        TmpFile=self.f.read().lower()
        if p1.search(TmpFile):
            self.InpuDict['XCFList']=[]
            self.InpuDict['XCFList'].append('$xc_functional')
            LocPos  = p1.search(TmpFile).start() 
            self.f.seek(LocPos)
            self.f.readline()
            TmpLine = self.f.readline().strip()
            while not p2.search(TmpLine.lower()):
                self.InpuDict['XCFList'].append(TmpLine)
                TmpLine = self.f.readline().strip()
            else:
                self.InpuDict['XCFList'].append('$end')
        else:
            print_String(self.IOut,
                'No xc_functional group in INPUT file',1)

        p1  = compile('\$occupied')                                  # Now loading occupied
        p2  = compile('\$end') 
        if self.IPrint >= 1:
            print_String(self.IOut, 'Now reading occupied group',1)
        self.f.seek(0)
        TmpFile=self.f.read().lower()
        if p1.search(TmpFile):
            self.InpuDict['OccList']=[]
            self.InpuDict['OccList'].append('$occupied')
            LocPos  = p1.search(TmpFile).start() 
            self.f.seek(LocPos)
            self.f.readline()
            TmpLine = self.f.readline().strip()
            while not p2.search(TmpLine.lower()):
                self.InpuDict['OccList'].append(TmpLine)
                TmpLine = self.f.readline().strip()
            else:
                self.InpuDict['OccList'].append('$end')
        else:
            print_String(self.IOut,
                'No occupied group in INPUT file',1)

        p1  = compile('\$basis')                                  # Now loading basis
        p2  = compile('\$end') 
        if self.IPrint >= 1:
            print_String(self.IOut, 'Now reading basis group',1)
        self.f.seek(0)
        TmpFile=self.f.read().lower()
        if p1.search(TmpFile):
            self.InpuDict['BasList']=[]
            self.InpuDict['BasList'].append('$basis')
            LocPos  = p1.search(TmpFile).start() 
            self.f.seek(LocPos)
            self.f.readline()
            TmpLine = self.f.readline().strip()
            while not p2.search(TmpLine.lower()):
                self.InpuDict['BasList'].append(TmpLine)
                TmpLine = self.f.readline().strip()
            else:
                self.InpuDict['BasList'].append('$end')
        else:
            print_String(self.IOut,
                'No basis group in INPUT file',1)

        p1  = compile('\$basis2')                                  # Now loading basis2
        p2  = compile('\$end') 
        if self.IPrint >= 1:
            print_String(self.IOut, 'Now reading basis group',1)
        self.f.seek(0)
        TmpFile=self.f.read().lower()
        if p1.search(TmpFile):
            self.InpuDict['Bas2List']=[]
            self.InpuDict['Bas2List'].append('$basis2')
            LocPos  = p1.search(TmpFile).start() 
            self.f.seek(LocPos)
            self.f.readline()
            TmpLine = self.f.readline().strip()
            while not p2.search(TmpLine.lower()):
                self.InpuDict['Bas2List'].append(TmpLine)
                TmpLine = self.f.readline().strip()
            else:
                self.InpuDict['Bas2List'].append('$end')
        else:
            print_String(self.IOut,
                'No basis2 group in INPUT file',1)

        p1  = compile('\$ecp')                                  # Now loading basis
        p2  = compile('\$end') 
        if self.IPrint >= 1:
            print_String(self.IOut, 'Now reading ecp group',1)
        self.f.seek(0)
        TmpFile=self.f.read().lower()
        if p1.search(TmpFile):
            self.InpuDict['ECPList']=[]
            self.InpuDict['ECPList'].append('$ecp')
            LocPos  = p1.search(TmpFile).start() 
            self.f.seek(LocPos)
            self.f.readline()
            TmpLine = self.f.readline().strip()
            while not p2.search(TmpLine.lower()):
                self.InpuDict['ECPList'].append(TmpLine)
                TmpLine = self.f.readline().strip()
            else:
                self.InpuDict['ECPList'].append('$end')
        else:
            print_String(self.IOut,
                'No ecp group in INPUT file',1)

        p1  = compile('\$aux_basis')                                  # Now loading aux_basis
        p2  = compile('\$end') 
        if self.IPrint >= 1:
            print_String(self.IOut, 'Now reading aux_basis group',1)
        self.f.seek(0)
        TmpFile=self.f.read().lower()
        if p1.search(TmpFile):
            self.InpuDict['AUXBList']=[]
            self.InpuDict['AUXBList'].append('$aux_basis')
            LocPos  = p1.search(TmpFile).start() 
            self.f.seek(LocPos)
            self.f.readline()
            TmpLine = self.f.readline().strip()
            while not p2.search(TmpLine.lower()):
                self.InpuDict['AUXBList'].append(TmpLine)
                TmpLine = self.f.readline().strip()
            else:
                self.InpuDict['AUXBList'].append('$end')
        else:
            print_String(self.IOut,
                'No aux_basis group in INPUT file',1)
        return

    def form_Input(self):
        '''Form qchem input file for given statements'''
        from my_io  import print_String
        from my_io  import print_List
        #
        # Now creat a new qchem input file
        #
        if self.IPrint>=1:
            print_String(self.IOut,'Now generating input file' +\
                    ' for the job of %s' %self.JobName,1)
        wf=file('Job_%s.in' % self.JobName,'w')
        for x in self.InpuDict.keys():
            for line in self.InpuDict[x]:
                wf.write('%s\n' % line)
            wf.write(' \n')
        wf.close()
        return

    def run_Job(self,iop=0,cfg=None):
        '''run qchem job through a specified csh named "QChem_Environment"'''
        from os         import system
        from os         import mkdir
        from os         import removedirs
        from os         import remove
        from os         import chdir
        from os.path    import exists
        from os.path    import isfile
        from os         import getpid                                # To make more then 2 jobs
                                                                     # running in one DIR
        from my_io      import print_String
        CurrScr = './.script%s' % getpid()
        if cfg == None:
            cfg = 'rmp2'
        print('Script is %s' %CurrScr)
        if not exists('%s' % CurrScr):
            mkdir('%s' % CurrScr)
        system('mv Job_%s.in %s/Job_%s.in'
            %(self.JobName, CurrScr, self.JobName))
        chdir('%s' % CurrScr)
        if self.IPrint>=1:
            print_String(self.IOut,'Now run the job of '+\
                    'Job_%s.in ' %self.JobName +\
                    'in %s' %CurrScr,1)
        if iop==0:                                                   # serial version qchem
            system('%s/QChem_Environment.ser %s Job_%s.in'
                % (self.ModuDir, cfg, self.JobName))
        elif iop==1:                                                 # parallel version qchem
            system('%s/QChem_Environment.par %s Job_%s.in'
                % (self.ModuDir, cfg, self.JobName))
        system('mv Job_%s.log ../Job_%s.log'
            %(self.JobName, self.JobName))
        chdir('../')
        #if self.IPrint<=1:
        #    remove('%s/Job_%s.in' % (CurrScr, self.JobName))
        #    removedirs('%s' %CurrScr)
        return

    def get_Result(self,iop=0):
        '''Collect results'''
        from re         import compile
        from os.path    import isfile
        from my_io      import my_plus
        from my_io      import print_String
        from my_io      import print_Error

        if isfile('Job_%s.log' % self.JobName):
            lf  = file('Job_%s.log' % self.JobName,'r')
            if self.IPrint>=1:
                print_String(self.IOut,'Now open Job_%s.log'
                        % self.JobName,1)
        else:
            print_Error(self.IOut,'Error in finding Output file')

        if iop==0:                                                   # For SCF energy
            p1 = compile(' *\d+ *([+-]\d*.\d*) *\d.\d+E[+-]\d\d *\d+ Convergence criterion met')
            p2 = compile('Convergence failure')
            p3 = compile('Including correction')
            p4 = compile('Empirical dispersion =( *-[0-9]+.[0-9]*) hartree')
            lf.seek(0)
            TmpFile = lf.read().strip()
            if p4.search(TmpFile):
                print_String(self.IOut,'Empirical dispersion = %s hartree' 
                        % (p4.search(TmpFile).group(1)),1)
            if p3.search(TmpFile):                                   # Patch for dual basis scheme
                LocPos      = p3.search(TmpFile).start()
                while TmpFile[LocPos-1:LocPos]!='\n':
                    LocPos  = LocPos - 1
                lf.seek(LocPos)
                TmpString   = lf.readline().strip()
                TmpList     = TmpString.split()
                try:
                    self.SCFReal    = float(TmpList[1])
                except ValueError:
                    print_Error(self.IOut,'Error occurss '+\
                        'in getting SCF Energy')
                if self.IPrint>=1:
                    print_String(self.IOut,'SCF Energy     = '+\
                        '%18.8f' %self.SCFReal,1)
            elif not p2.search(TmpFile) and\
                p1.search(TmpFile):                                  # Patch for dual basis guess
                LocPos  = 0
                for x in p1.finditer(TmpFile):
                    tmpPos  = x.start()
                    if tmpPos > LocPos:
                        LocPos = tmpPos
                        try:
                            self.SCFReal    = float(x.group(1))
                        except ValueError:
                            print_Error(self.IOut,'Error occurss '+\
                                'in getting SCF Energy')
                if self.IPrint>=1:
                    print_String(self.IOut,'SCF Energy     = '+\
                        '%18.8f' %self.SCFReal,1)
            else:
                print_String(self.IOut,
                        'SCF Convergence is not found',1)
                self.SCFReal    = 'NAN'

            # ----------------------------------
            # Now for post-HF or post-KS results
            # ----------------------------------
            p1 = compile('CCSD\(\w\) Total Energy   =')              # for ccsd(t) result
            p2 = compile('Total Local XYGJ-OS energy *=')            # for LXYGJOS result
            p3 = compile(' +MP2 *total energy *=')                   # for     MP2 result
            p4 = compile(' +RIMP2 *total energy *= *([+-]\d+.\d+)')  # for   RIMP2 result
            p5 = compile('Total *XYG3-RI *total energy *=')          # for  XYG3RI result
            p6 = compile('Total *XYGJ-OS *energy *=')                # for  XYGJOS result
            if p1.search(TmpFile):
                (Srt,End) = p1.search(TmpFile).span()
                LocPos  = End
                lf.seek(LocPos)
                TmpString   = lf.readline().strip()
                try:
                    self.CCSDTReal  = float(TmpString)
                except ValueError:
                    print_String(self.IOut,'Error occurss '+\
                        'in getting CCSD(T) Energy',1)
                    self.CCSDTReal   = 'NAN'
                if self.IPrint>=1:
                    try:
                        print_String(self.IOut,'CCSD(T) energy = '+\
                            '%18.8f' %self.CCSDTReal,1)
                    except TypeError:
                        print_String(self.IOut,'CCSD(T) energy = '+\
                            '%18s' %self.CCSDTReal,1)
            elif p2.search(TmpFile):
                (Srt,End) = p2.search(TmpFile).span()
                LocPos  = End
                lf.seek(LocPos)
                TmpString   = lf.readline().strip()
                try:
                    self.R5DFTReal  = float(TmpString)
                except ValueError:
                    print_String(self.IOut,'Error occurss '+\
                        'in getting LXYGJOS Energy',1)
                    self.R5DFTReal   = 'NAN'
                if self.IPrint>=1:
                    try:
                        print_String(self.IOut,'LXYGJOS energy = '+\
                            '%18.8f' %self.R5DFTReal,1)
                    except TypeError:
                        print_String(self.IOut,'LXYGJOS energy = '+\
                            '%18s' %self.R5DFTReal,1)
            elif p3.search(TmpFile):
                (Srt,End) = p3.search(TmpFile).span()
                LocPos  = End
                lf.seek(LocPos)
                TmpString1  = lf.readline().strip()
                TmpString   = TmpString1.split()[0]
                try:
                    self.R5DFTReal  = float(TmpString)
                except ValueError:
                    print_String(self.IOut,'Error occurss '+\
                        'in getting MP2 Energy',1)
                    self.R5DFTReal   = 'NAN'
                if self.IPrint>=1:
                    try:
                        print_String(self.IOut,'MP2 Energy     = '+\
                            '%18.8f' %self.R5DFTReal,1)
                    except TypeError:
                        print_String(self.IOut,'MP2 Energy     = '+\
                            '%18s' %self.R5DFTReal,1)
            elif p4.search(TmpFile):
                try:
                    self.R5DFTReal  = float(p4.search(TmpFile).group(1))
                except ValueError:
                    print_String(self.IOut,p4.search(TmpFile).group(0),1)
                    print_String(self.IOut,'Error occurss '+\
                        'in getting RIMP2 Energy',1)
                    self.R5DFTReal   = 'NAN'
                if self.IPrint>=1:
                    try:
                        print_String(self.IOut,'RIMP2 Energy   = '+\
                            '%18.8f' %self.R5DFTReal,1)
                    except TypeError:
                        print_String(self.IOut,'RIMP2 Energy   = '+\
                            '%18s' %self.R5DFTReal,1)
            elif p5.search(TmpFile):
                (Srt,End) = p5.search(TmpFile).span()
                LocPos  = End
                lf.seek(LocPos)
                TmpString   = lf.readline().strip().split()[0]
                try:
                    self.R5DFTReal  = float(TmpString)
                except ValueError:
                    print_String(self.IOut,'Error occurss '+\
                        'in getting LXYG3RI Energy',1)
                    self.R5DFTReal   = 'NAN'
                if self.IPrint>=1:
                    try:
                        print_String(self.IOut,'XYG3RI energy = '+\
                            '%18.8f' %self.R5DFTReal,1)
                    except TypeError:
                        print_String(self.IOut,'XYG3RI energy = '+\
                            '%18s' %self.R5DFTReal,1)
            elif p6.search(TmpFile):
                (Srt,End) = p6.search(TmpFile).span()
                LocPos  = End
                lf.seek(LocPos)
                TmpString   = lf.readline().strip()
                try:
                    self.R5DFTReal  = float(TmpString)
                except ValueError:
                    print_String(self.IOut,'Error occurss '+\
                        'in getting XYGJOS Energy',1)
                    self.R5DFTReal   = 'NAN'
                if self.IPrint>=1:
                    try:
                        print_String(self.IOut,'XYGJOS energy = '+\
                            '%18.8f' %self.R5DFTReal,1)
                    except TypeError:
                        print_String(self.IOut,'XYGJOS energy = '+\
                            '%18s' %self.R5DFTReal,1)

        elif iop==1:                                                 # For PT21 term
            p1 = compile('E_DFTPT2_1ST =')
            lf.seek(0)
            TmpFile = lf.read().strip()
            if p1.search(TmpFile):
                (Srt,End) = p1.search(TmpFile).span()
                LocPos  = End
                lf.seek(LocPos)
                TmpString   = lf.readline().strip()
                TmpList     = TmpString.split()
                try:
                    self.PT21Real   = float(TmpList[0])
                except ValueError:
                    print_Error(self.IOut,'Error occurss '+\
                        'in getting 1st PT2 Energy')
                    self.PT21Real   = 'NAN'
                if self.IPrint>=1:
                    print_String(self.IOut,'1st PT2 Energy = '+\
                        '%18.8f' %self.PT21Real,1)
            else:
                print_String(self.IOut,'the 1st excitation '+\
                    'contribution for PT2 is not found',1)
                self.PT21Real   = 'NAN'
        elif iop==2:                                                 # For PT22 term
            p1 = compile('aaaa *correlation energy = *([+-]*\d+.\d+)')
            p2 = compile('abab *correlation energy = *([+-]*\d+.\d+)')
            p3 = compile('bbbb *correlation energy = *([+-]*\d+.\d+)')
            p4 = compile('OS-MP2 correlation energy *= *([+-]*\d+.\d+)')
            lf.seek(0)
            TmpFile = lf.read().strip()
            if p4.search(TmpFile):
                try:
                    self.PT22Real   = float(p4.search(TmpFile).group(1))
                    print_String(self.IOut,'OS-MP2 correlation '+\
                        'is %16.8f' %self.PT22Real,1)
                except ValueError:
                    self.PT22Real   = 'NAN'
                    print_String(self.IOut,'OS-MP2 correlation '+\
                        'is %18s' %self.PT22Real,1)
            else:
                if p1.search(TmpFile):
                    try:
                        self.PT22Real   = float(p1.search(TmpFile).group(1))
                        print_String(self.IOut,'aaaa correlation '+\
                            'is %16.8f' %self.PT22Real,1)
                    except ValueError:
                        print_String(self.IOut,'aaaa correlation '+\
                            'is not found',1)
                        self.PT22Real   = 'NAN'
                else:
                    print_String(self.IOut,'aaaa correlation '+\
                        'is not found',1)
                    self.PT22Real   = 'NAN'

                if p2.search(TmpFile):
                    try:
                        tmpValue        = float(p2.search(TmpFile).group(1))
                        self.PT22Real   += tmpValue
                        print_String(self.IOut,'abab correlation '+\
                            'is %16.8f' %tmpValue,1)
                    except ValueError:
                        print_String(self.IOut,'abab correlation '+\
                            'is not found',1)
                        self.PT22Real = 'NAN'
                else:
                    print_String(self.IOut,'abab correlation '+\
                        'is not found',1)
                    self.PT22Real = 'NAN'

                if p3.search(TmpFile):
                    try:
                        tmpValue        = float(p3.search(TmpFile).group(1))
                        self.PT22Real   += tmpValue
                        print_String(self.IOut,'bbbb correlation '+\
                            'is %16.8f' %tmpValue,1)
                        if self.IPrint>=1:
                            print_String(self.IOut,'2nd PT2 Energy'+\
                                ' = %18.8f' %self.PT22Real,1)
                    except ValueError:
                        print_String(self.IOut,'bbbb correlation '+\
                            'is not found',1)
                        self.PT22Real = 'NAN'
                else:
                    print_String(self.IOut,'the 2nd excitation '+\
                        'contribution for PT2 is not found',1)
                    self.PT22Real   = 'NAN'
                    if self.IPrint>=1:
                        print_String(self.IOut,'2nd PT2 Energy = '+\
                            '%18s' %self.PT22Real,1)

            # Now for seperated DFT parts
            p1 = compile('exchange functionals invoked ::')
            lf.seek(0)
            TmpFile = lf.read().strip()
            if p1.search(TmpFile):
                print_String(self.IOut,'Now print information ' +\
                        'about separated Xs and Cs',1)
                (LocPos,EndPos) = p1.search(TmpFile).span()
                while TmpFile[LocPos-1:LocPos]!='\n':
                    LocPos  = LocPos - 1
                lf.seek(LocPos)
                p2 = compile('E_no_XC')
                TmpString = lf.readline()
                while not p2.search(TmpString):
                    self.IOut.write(TmpString)
                    TmpString = lf.readline()
                else:
                    self.IOut.write(TmpString)
            else:
                print_String(self.IOut,'Information about '+\
                    'separated Xs and Cs is not found',1)
        elif iop==3:                                                 # For xMP2 energy 
            plist = [compile('E_no_XC      ='),
                     compile('E_nBrillouin ='),
                     compile('EK           ='),
                     compile('aaaa *correlation energy ='),
                     compile('abab *correlation energy ='),
                     compile('bbbb *correlation energy =')]
            lf.seek(0)
            TmpFile         = lf.read().strip()
            self.xMP2Real   = 0.0
            for p in plist:
                if p.search(TmpFile):
                    (Srt,End) = p.search(TmpFile).span()
                    LocPos  = End
                    lf.seek(LocPos)
                    TmpString   = lf.readline().strip()
                    TmpList     = TmpString.split()
                    try:
                        self.xMP2Real   += float(TmpList[0])
                    except ValueError:
                        print_Error(self.IOut,'Error occurss '+\
                            'in getting one portion of xMP2 Energy')
                        self.xMP2Real   = 'NAN'
                        return
                else:
                    print_String(self.IOut,'one important '+\
                        'portion of xMP2 could not be found',1)
                    self.xMP2Real   = 'NAN'
                    return
            if self.IPrint>=1:
                print_String(self.IOut,'xMP2 Energy    = '+\
                    '%18.8f' %self.xMP2Real,1)
        return

