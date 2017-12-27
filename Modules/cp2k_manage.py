#!/bin/env python2
#Module 	:: CP2K_Manage
#Authors	:: Ying Zhang and Xin Xu 
#Purpose	:: 1) Analysis the input file of CP2K package;
#       	:: 2) Generate the input file of CP2K package;
#       	:: 3) Collect results from CP2K package;
#           :: All in all, a well-defined private interface with CP2K series
#              package
#Version	:: 0.1(20101228)
#Revise     :: 2010-12-28
#History    :: 0.1(20101228) Completes basic functions for CP2K IO.
#                            There is one classe:
#                                1) CP2KIO     : manage CP2K input and output

class CP2KIO:
    '''\
 Manage the input file of the CP2K package.\n\
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
 self.Charge         : INTEGER of input Chage\n\
 self.Spin           : INTEGER of input Spin\n\
 self.NAtom          : INTEGER of atoms number\n\
 self.MachineList    : LIST of machine commands\n\
 self.OptionList     : LIST of options\n\
 self.TitleList      : LIST of this job title \n\
 self.GeomList       : LIST of input geometry\n\
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
                'Error in getting the grobal environment '+\
                '\"$IGOR_MODULES_PATH\" which is the direction to private modules')
         
        if self.FileName==None:
            self.f  = 'None'
            if self.IPrint>=1:
                print_String(self.IOut,
                    'Do not open input file for CP2KIO class',1)
        else:
            try:
                self.f 	= file(self.FileName,'r')                    # Open it
            except IOError:
                self.f  = file('Error_%s' %self.FileName,'w')
            if self.IPrint>=1:
                print_String(self.IOut,
                    'Open CP2K-Input file "%s" for CP2KIO class'
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
                           }

        self.SCFReal    = 0.0                                        # REAL, SCF energy
        return

    def __del__(self):
        '''Close the document flow of input file'''
        from my_io   import print_String
        if self.f=='None':
            if self.IPrint>=2:
                print_String(self.IOut,
                    'Do not close input file for CK2KIO class',1)
        else:
            if self.IPrint>=2:
                print_String(self.IOut,
                    'Close CP2K-Input file "%s" for CP2KIO class'
                    % self.FileName,1)
            self.f.close()                                           # Close input file
        return

    def get_Input(self):
        '''Loading input dictionary from input file'''
        from re         import compile
        from my_io      import print_Error
        from my_io      import print_List
        from my_io      import print_String
        p1  = compile('^&')
        p2  = compile('^&end') 
        if self.IPrint >= 1:
            print_String(self.IOut, 'Now parsing CP2K input file',1)
        self.f.seek(0L)
        Lines       = self.f.readlines()
        BlockList   = []
        for tmpline in Lines:
            if p1.search(tmpline.strip().lower()):
                if p2.search(tmpline.strip().lower()):
                    BlockList   = BlockList[:-1]
                else:
                    tmpList     = tmpline.lower().strip().split('&')[1].split()
                    tmpFlag     = tmpList[0]
                    if tmpFlag == 'kind':
                        tmpFlag = ' '.join(tmpList[:2])
                        tmpList = tmpList[1:]
                    BlockList.append(tmpFlag)
                    self.InpuDict[tmpFlag]=dict(index=BlockList[:],content=[],rest='')
                    if tmpList>1:
                        self.InpuDict[tmpFlag]['rest']=' '.join(tmpList[1:])

            else:
                if len(BlockList)>=1:
                    self.InpuDict[BlockList[-1]]['content'].append(tmpline.strip())
                else:
                    pass
        return

    def form_Input(self):
        '''Form CP2K input file for given statements'''
        import re
        from copy   import deepcopy
        from my_io  import print_String
        from my_io  import print_List
        #
        # Now parse and generate the input file by self.InpuDict 
        #
        indent = '  '
        if self.IPrint>=1:
            print_String(self.IOut,'Now generating CP2K input file' +\
                    ' for the job of %s' %self.JobName,1)
        wf=file('Job_%s.inp' % self.JobName,'w')

        maxIndex = 1

        for x in sorted(self.InpuDict):
            if len(self.InpuDict[x]['index'])>maxIndex:
                maxIndex = len(self.InpuDict[x]['index'])

        tmpInput = ''
        for indx in range(maxIndex):                    
            for x in sorted(self.InpuDict):
                if len(self.InpuDict[x]['index'])==indx+1:
                    if indx==0:
                        tmpInput += indent*indx+'&%s' %x.upper() + ' %s\n' %self.InpuDict[x]['rest']
                        for line in self.InpuDict[x]['content']:
                            tmpInput += indent*(indx+1)+'%s\n' % line
                        tmpInput += indent*indx+'&END %s\n' %x.upper()
                        tmpInput += '\n'
                    else:
                        tmpString = ''
                        tmpString += indent*indx+'&%s' %x.upper() + ' %s\n' %self.InpuDict[x]['rest']
                        for line in self.InpuDict[x]['content']:
                            tmpString += indent*(indx+1)+'%s\n' % line
                        if x.split()[0]!= 'kind':
                            tmpString += indent*indx+'&END %s\n' %x.upper()
                        else:
                            tmpString += indent*indx+'&END %s\n' %x.upper().split()[0]


                        tmpFlag = indent*(indx-1)+'&END %s' %self.InpuDict[x]['index'][-2].upper()
                        p1 = re.compile(tmpFlag)
                        StartPos = p1.search(tmpInput).start()
                        tmpInput   = tmpInput[:StartPos]+tmpString+tmpInput[StartPos:]

        wf.write(tmpInput)
        wf.close()
        return

    def run_Job(self):
        '''run CP2K job through a specified csh named "CP2K_Environment"'''
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
        print 'Script is %s' %CurrScr
        if not exists('%s' % CurrScr):
            mkdir('%s' % CurrScr)
        system('mv Job_%s.inp %s/Job_%s.inp'
            %(self.JobName, CurrScr, self.JobName))
        chdir('%s' % CurrScr)
        if self.IPrint>=1:
            print_String(self.IOut,'Now run the job of '+\
                    'Job_%s.inp ' %self.JobName +\
                    'in %s' %CurrScr,1)
        system('%s/CP2K_Environment Job_%s.inp ../../mpd.hosts'
            % (self.ModuDir, self.JobName))
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
            p1 = compile('ENERGY\| Total FORCE_EVAL \( QS \) energy \(a.u.\):')
            p2 = compile('SCF run converged in')
            p3 = compile('MAXIMUM NUMBER OF OPTIMIZATION STEPS REACHED')
            lf.seek(0L)
            TmpFile = lf.read().strip()
            if  p2.search(TmpFile) and not p3.search(TmpFile) and\
                p1.search(TmpFile):                                  # Patch for dual basis guess
                LocPos  = 0
                for x in p1.finditer(TmpFile):
                    tmpPos  = x.end()
                    if tmpPos > LocPos:
                        LocPos = tmpPos
                #while TmpFile[LocPos-1:LocPos]!='\n':
                #    LocPos  = LocPos - 1
                lf.seek(LocPos+1)
                TmpString   = lf.readline().strip()
                TmpList     = TmpString.split()
                try:
                    self.SCFReal    = float(TmpList[0])
                    if self.IPrint>=1:
                        print_String(self.IOut,'SCF Energy     = '+\
                            '%18.8f' %self.SCFReal,1)
                except ValueError:
                    print_String(self.IOut,'Error occurss '+\
                        'in getting SCF Energy',1)
                    self.SCFReal = 'NAN'
                    if self.IPrint>=1:
                        print_String(self.IOut,'SCF Energy     = '+\
                            '       NAN',1)
            else:
                print_String(self.IOut,
                        'SCF Convergence is not found',1)
                self.SCFReal    = 'NAN'

        return

    def reform_Geom(self):
        '''reform molecular geometry, and calculate\
           the minimum cubic size of this molecules'''
        from my_io      import print_String
        from copy       import deepcopy
        mingeom  = [0.0,0.0,0.0]
        maxgeom  = [0.0,0.0,0.0]
        minbox   = [0.0,0.0,0.0]
        adpbox   = [0.0,0.0,0.0]
        shiftbox = [0.0,0.0,0.0]
        tmpList  = [[],[],[]]
        for xx in self.InpuDict['coord']['content']:
            xxx = xx.strip().split()
            try:
                tmpxxx = [xxx[0],float(xxx[1]),float(xxx[2]),float(xxx[3])]
                tmpList[0].append(tmpxxx[1])
                tmpList[1].append(tmpxxx[2])
                tmpList[2].append(tmpxxx[3])
            except ValueError:
                pass
        for tmpindex in [0,1,2]:                    
            mingeom[tmpindex]=min(tmpList[tmpindex])
            maxgeom[tmpindex]=max(tmpList[tmpindex])
            minbox[tmpindex]=maxgeom[tmpindex]-mingeom[tmpindex]
            adpbox[tmpindex]=minbox[tmpindex]

        print_String(self.IOut,
            'The min box size is (ABC%16.8f%16.8f%16.8f)'\
            % tuple(minbox), 1)

        for tmpindex in [0,1,2]:                      # increase the box size for practicle
            if adpbox[tmpindex]<10.0:
                adpbox[tmpindex] += 5.0
            adpbox[tmpindex] *= 2.0

        for x in self.InpuDict['poisson']['content']:
            xlist = x.strip().lower().split()
            print xlist
            if xlist[0]=='psolver' and xlist[1]=='mt':                         # reform box size for MT
                for tmpindex in [0,1,2]:                    
                    shiftbox[tmpindex]=mingeom[tmpindex]-\
                        (adpbox[tmpindex]-minbox[tmpindex])/2                  # get the shift number
                tmpList = []
                for xx in self.InpuDict['coord']['content']:                   # shift geometry
                    xxx = xx.strip().split()
                    try:
                        tmpxxx =[xxx[0],float(xxx[1])-shiftbox[0],\
                            float(xxx[2])-shiftbox[1],float(xxx[3])-shiftbox[2]]
                        tmpString='%5s%16.8f%16.8f%16.8f' % tuple(tmpxxx)
                        tmpList.append(tmpString)
                    except ValueError:
                        pass
                self.InpuDict['coord']['content']=tmpList[:]
                print_String(self.IOut,
                    'Recommaned ABC(MT) is (ABC%16.8f%16.8f%16.8f)'\
                    % tuple(adpbox), 1)
                for cellstr in self.InpuDict['cell']['content']:                # update the box size
                    celllist = cellstr.strip().lower().split()
                    if celllist[0]=='abc':
                        self.InpuDict['cell']['content'].remove(cellstr)
                self.InpuDict['cell']['content'].append(\
                    'ABC%16.8f%16.8f%16.8f'\
                    % tuple(adpbox))
                print self.InpuDict['cell']['content']
        return
