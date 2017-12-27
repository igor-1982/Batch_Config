#!/usr/bin/env python2

import re
import os
import sys
WorkDir	= os.getcwd().strip()                                    # STRING, current DIR 
HomeDir	= os.getenv('HOME')                                      # STRING, Home DIR
if os.getenv('IGOR_MODULES_PATH'):                               # STRING, private module DIR
    ModuDir=os.getenv('IGOR_MODULES_PATH')
    sys.path.append(ModuDir)                                     # Append it into "sys.path"
    import gaussian_manage as gaum                               # Import private modules
    import cp2k_manage     as cp2k
    from my_io             import print_Error
    from my_io             import print_List
    from my_io             import print_String
else:
    print '\n'+\
        'Error in getting grobal environment '+\
        '\"$IGOR_MODULES_PATH\" which is the direction to private modules'
    sys.exit(1)

lf  = file('../chage.log','w')
p1  = re.compile(' *\d+[ \t]+[\d]+ *\n')
os.listdir('%s' %WorkDir)
for inp in os.listdir('./'):
    name, postfix   = os.path.splitext(inp)
    tmpGau  = gaum.GauIO(lf,inp,bugctrl=1)
    tmpGau.get_MachAndOpt()
    tmpGau.ctrl_Option()
    tmpGau.get_TCSGR()
    
    tmpCP2K     = cp2k.CP2KIO(lf,fn=None,bugctrl=1)
    tmpCP2K.JobName = name
    tmpCP2K.InpuDict={}
    tmpCP2K.InpuDict['force_eval'] = dict(index=['force_eval'],content=[],rest='')

    ProjName    = 'PROJECT %s' % name
    tmpCP2K.InpuDict['global']     = dict(index=['global'],    content=[ProjName],rest='')

    Spin        = 'MULTIPLICITY %i' % tmpGau.Spin
    Charge      = 'CHARGE %i'       % tmpGau.Charge
    tmpCP2K.InpuDict['dft'] = dict(index=['force_eval','dft'], content=[Spin,Charge],rest='')

    tmpCP2K.InpuDict['poisson'] = dict(index=['force_eval','dft','poisson'], content=['PERIODIC NONE', 'PSOLVER MT'],rest='')
    
    tmpCP2K.InpuDict['subsys']  = dict(index=['force_eval','subsys'],content=[],rest='')

    tmpCP2K.InpuDict['cell']    = dict(index=['force_eval','subsys','cell'],content=['PERIODIC NONE'],rest='')

    tmpCP2K.InpuDict['coord']   = dict(index=['force_eval','subsys','coord'],content=[],rest='')
    tmpCP2K.InpuDict['coord']['content']=tmpGau.GeomList[:]
    
    tmpCP2K.reform_Geom()
    tmpCP2K.form_Input()

    os.system('mv Job_%s.inp %s.inp' % (name,name))

    del tmpCP2K
    del tmpGau

