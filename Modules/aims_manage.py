#!/bin/env python2
# Module     :: Aims_Manage
# Authors    :: Igor Ying Zhang
# Purpose    :: 1) Analysis the input file of aims package;
#            :: 2) Generate the input file of aims package;
#            :: 3) Collect results from Aims package;
#            :: All in all, a well-defined private interface with FHI-aims
# Version    :: 0.1(20120521)
# Revise     :: 2012-05-21
# History    :: 0.1(20120521) Completes basic functions for QChem IO.
#                             There is one classe:
#                             1) AimsIO : manage Aims input, output and running


class AimsIO:
    AtDict = {'x': 0, 'h': 1, 'he': 2, 'li': 3, 'be': 4, 'b': 5, 'c': 6,
              'n': 7, 'o': 8, 'f': 9, 'ne': 10,
              'na': 11, 'mg': 12, 'al': 13, 'si': 14, 'p': 15,
              's': 16, 'cl': 17, 'ar': 18,
              'k': 19, 'ca': 20, 'ga': 31, 'ge': 32, 'as': 33,
              'se': 34, 'br': 35, 'kr': 36,
              'sc': 21, 'ti': 22,  'v': 23, 'cr': 24, 'mn': 25,
              'fe': 26, 'co': 27, 'ni': 28, 'cu': 29, 'zn': 30,
              'rb': 37, 'sr': 38, 'in': 49, 'sn': 50, 'sb': 51,
              'te': 52,  'i': 53, 'xe': 54,
              'y': 39, 'zr': 40, 'nb': 41, 'mo': 42, 'tc': 43,
              'ru': 44, 'rh': 45, 'pd': 46, 'ag': 47, 'cd': 48,
              'pb': 82, 'bi': 83, 'rn': 86
              }

    def __init__(self, iout, proj=None, bugctrl=0):
        '''Initialize variables belonged to GauIO'''
        from os import getcwd, getenv
        from os.path import splitext
        from my_io import print_String, print_Error

        if getenv('IGOR_MODULES_PATH'):   # STRING, DIR to private modules
            self.ModuDir = getenv('IGOR_MODULES_PATH')
        else:
            print_Error(self.IOut,
                        'Error in getting grobal environment ' +
                        '\"$IGOR_MODULES_PATH\" which is the ' +
                        'direction to private modules')

        self.IOut = iout        # Flow of the output file
        self.IPrint = bugctrl   # to control the printing out
        fn, fe = splitext(proj)
        self.Proj = fn          # Name of the project

        self.WorkDir = getcwd().strip()  # STRING, current DIR
        self.HomeDir = getenv('HOME')    # STRING, home DIR
        self.BasisDir = ''
        print_String(self.IOut, 'The direction of basis set is required', 1)

        self.BasisDir = ''   # basis set direction

        self.Charge = 0
        self.Spin = 0
        self.ElemNum = 0
        self.Elems = []
        # SCF, EcRPA, RPA, RPA+SE, RPA+rSEd, RPA+rSEf, RPA+, and ExHF
        self.Energy = {}
        self.Basis = {}
        self.add_CMD = []   # additional commands for the control.in
        return

    def __del__(self):
        '''Close the document flow of input file'''
        return

    def qchem2aims(self, qchem_input=None):
        '''generate aims project direction and concequently '''
        '''  "geomtry.in" and "elec_state" from qchem_input'''
        import re
        import os
        from my_io import print_String
        from my_io import print_Error
        if qchem_input is None:
            qchem_input = "%s.in" % (self.Proj)
        fn = self.Proj

        # if os.path.isdir(fn) or os.path.isfile(fn):
        #    index = 0
        #    while os.path.isdir("%s.trace.%i" %(fn,index)):
        #        index += 1
        #    print_String(self.IOut,"direction or file named as %s exists," +
        #                 " now rename as %s.trace.%i" %(fn,fn,index), 1)
        #    os.rename(fn, "%s.trace.%i" % (fn, index))
        if len(fn) != 0:
            if not os.path.isdir(fn):
                os.mkdir(fn)
        if not os.path.isfile("%s/geometry.in" % fn) or \
                not os.path.isfile("%s/elec_state" % fn):
            wff = open("%s/geometry.in" % fn, 'w')
            sff = open("%s/elec_state" % fn, 'w')
        else:
            return

        ff = open(qchem_input, 'r')
        fs = ff.readlines()
        ff.close()

        p1 = re.compile('$molecule')
        p2 = re.compile('$end')

        num_atom = -1
        mol_flag = False
        for line in fs:
            if not mol_flag:    # whether enter the molecule block
                mol_flag = p1.match(line.strip())
            else:
                if num_atom == -1:
                    charge, spin = line.strip().split()
                    try:
                        charge = int(charge)
                        spin = int(spin)
                    except ValueError:
                        print_Error(self.IOut,
                                    "Error happens in getting charge and spin")
                    num_atom += 1
                    sff.write('charge   %6i\n' % charge)
                    sff.write('spin     %6i\n' % spin)
                elif p2.match(line.strip()):
                    wff.close()
                    print_String(self.IOut,
                                 "There is(are) %i atom(s) in this case"
                                 % num_atom, 1)
                    sff.write('electron %6i\n' % num_atom)
                    sff.close()
                    self.ElemNum = num_atom
                    break
                else:
                    tl = line.strip().split()
                    if len(tl) == 4:
                        wff.write("atom%16s%16s%16s%5s\n"
                                  % (tl[1], tl[2], tl[3], tl[0]))
                        num_atom += 1
                        self.Elems.append(tl[0].lower())
                    else:
                        print_Error(self.IOut,
                                    "Unknown geometry input (elements " +
                                    "are not equal 4)")
        return

    def form_Control(self):
        import os
        from my_io import print_String, print_Error
        #
        # check several files required
        #
        if not os.path.isdir(self.Proj):
            print_Error(self.IOut, "Error :: No %s direction" % self.Proj)
        elif not os.path.isfile("%s/%s" % (self.Proj, "geometry.in")):
            print_Error(self.IOut,
                        "Error :: No 'geometry.in' in %s direction"
                        % self.Proj)
        elif not os.path.isfile("%s/%s" % (self.Proj, "elec_state")):
            print_Error(self.IOut,
                        "Error :: No 'elec_state' in %s direction" % self.Proj)
        elif not os.path.isfile("control.in"):
            print_Error(self.IOut,
                        "Error :: No 'control.in' in the current direction")
        #
        # get charge and spin info. from "elec_state"
        #
        ff = open("%s/%s" % (self.Proj, "elec_state"), 'r')
        fl = ff.readlines()
        ff.close()
        self.Alpha_ex = 0.0
        for x in fl:
            if len(x.strip()) == 0:
                continue
            xl = x.strip().split()
            if xl[0] == 'charge':
                try:
                    self.Charge = int(xl[-1])
                except ValueError:
                    print_Error(self.IOut,
                                "Error in getting charge info. " +
                                "from 'elec_state'")
            elif xl[0] == 'spin':
                try:
                    self.Spin = int(xl[-1])
                except ValueError:
                    print_Error(self.IOut,
                                "Error in getting spin info. " +
                                "from 'elec_state'")
            elif xl[0] == 'atoms':
                try:
                    self.Atoms = int(xl[-1])
                except ValueError:
                    print_Error(self.IOut,
                                "Error in getting atom info. " +
                                "from 'elec_state'")
            elif xl[0].lower() == 'alpha_ex':
                try:
                    self.Alpha_ex = float(xl[-1])
                except ValueError:
                    print_Error(self.IOut,
                                "Error in getting the factor of " +
                                "the exact exchange from 'elec_state'")
        #
        # get info. from standard "control.in"
        #
        ff = open("control.in", 'r')
        nff = open("%s/control.in" % self.Proj, 'w')
        fl = ff.readlines()
        ff.close()
        tmpSpin = {'spin': None,
                   'fixed_spin_moment': None,
                   }
        tmpAlpha_dog = False
        for x in fl:
            if x.split('#')[0].lower().find('charge ') != -1:
                pass
            elif x.split('#')[0].lower().find('spin') != -1:
                try:
                    tmpSpin['spin'] = \
                        [x.split('#')[0].split()[1], '%-16s%16s\n']
                except ValueError:
                    print_Error(self.IOut, 'Error in getting spin')
            elif x.split('#')[0].lower().find('fixed_spin_moment') != -1:
                try:
                    tmpSpin['fixed_spin_moment'] =\
                        [x.split('#')[0].split()[1], '%-16s%16s\n']
                except ValueError:
                    print_Error(self.IOut,
                                'Error in getting fixed_spin_moment')
            elif x.split('#')[0].lower().find('radial_multiplier') != -1:
                try:
                    self.Basis['radial_multiplier'] =\
                            [int(x.split('#')[0].split()[1]), '%-16s%16i\n']
                except ValueError:
                    print_Error(self.IOut,
                                'Error in getting radial_multiplier')
            elif x.split('#')[0].lower().find('alpha_dog') != -1:
                # IGOR Mark here
                tmpAlpha_dog = True
            else:
                nff.write("%s" % x)
        nff.write("charge                  %-6i\n" % self.Charge)
        if tmpAlpha_dog:
            nff.write('hybrid_xc_coeff %-6.2f\n' % self.Alpha_ex)
            print_String(self.IOut,
                         'hybrid_xc_coeff %-6.2f' % self.Alpha_ex, 1)
        if self.Spin != 1:
            if tmpSpin['spin'] is None:
                nff.write("spin                    collinear\n")
            else:
                nff.write(tmpSpin['spin'][1] % tuple(tmpSpin['spin'][0]))
            if tmpSpin['fixed_spin_moment'] is None:
                nff.write("fixed_spin_moment       %-5i\n" % (self.Spin-1))
            else:
                nff.write(tmpSpin['fixed_spin_moment'][1]
                          % tuple(tmpSpin['fixed_spin_moment'][0]))
            if self.Atoms == 1:
                nff.write("default_initial_moment  hund\n")
            else:
                nff.write("default_initial_moment  %-5i\n" % (0))
        if len(self.add_CMD) != 0:
            for cmd in self.add_CMD:
                nff.write("%s\n" % cmd)
        nff.close()
        return

    def form_Basis(self):
        '''parse the elements and relate to the correct basis set'''
        import os
        from my_io import print_String
        from my_io import print_Error

        if not os.path.isfile("%s/geometry.in" % self.Proj):
            print_Error(self.IOut,
                        "Error :: No 'geometry.in' in %s direction"
                        % self.Proj)
        else:
            gff = open("%s/geometry.in" % self.Proj, 'r')
            gfl = gff.readlines()
            gff.close()
            self.ElemNum = 0
            self.Elems = []
            for x in gfl:
                xl = x.strip().split('#')[0].strip().split()
                if len(xl) == 5 and xl[0].lower() == 'atom':
                    self.Elems.append(xl[-1].lower())
                    self.ElemNum += 1
                elif len(xl) == 5 and xl[0].lower() == 'empty':
                    self.Elems.append(xl[-1].lower())
                    self.ElemNum += 1
            else:
                print_String(self.IOut,
                             "There is(are) %i atom(s) in this case"
                             % self.ElemNum, 1)

        if not os.path.isfile("%s/control.in" % self.Proj):
            print_Error(self.IOut,
                        "Error :: No 'control.in' in %s direction" % self.Proj)
        else:
            nff = open("%s/control.in" % self.Proj, 'a')

        tmp_elems = []
        AtFlag = list(AimsIO.AtDict.keys())
        for x in self.Elems:
            if AtFlag.count(x) == 0:
                print_Error(self.IOut,
                            "Error :: Unknown element %s " % x)
            if len(x) == 1:
                if tmp_elems.count(x.upper()) == 0:
                    tmp_elems.append(x.upper())
            elif len(x) == 2:
                if tmp_elems.count(x[0].upper()+x[1:]) == 0:
                    tmp_elems.append(x[0].upper()+x[1:])
        for x in tmp_elems:
            if os.path.isfile("%s/%02i_%s_default"
                              % (self.BasisDir, AimsIO.AtDict[x.lower()], x)):
                bff = open("%s/%02i_%s_default"
                           % (self.BasisDir, AimsIO.AtDict[x.lower()], x), 'r')
                for line in bff:
                    for x, y in self.Basis.items():
                        if line.lower().find(x) != -1:
                            nff.write(y[-1] % tuple([x]+y[:-1]))
                            break
                    else:
                        nff.write(line)
                bff.close()
            else:
                print_Error(self.IOut,
                            "Error :: No '%02i_%s_default' in %s direction"
                            % (AimsIO.AtDict[x.lower()], x, self.BasisDir))
        nff.close()
        return

    def run_Job(self, nproc=None, cfg=None, script=None):
        '''run aims through a specified csh named "Aims_Environment"'''
        from os import system, chdir
        from os.path import exists
        from my_io import print_Error

        if nproc is None:
            nproc = 1
        if cfg is None:
            cfg = 'scalapack.mpi'
        if script is None:
            script = 'Aims_Environment'
        if not exists('%s' % self.Proj):
            print_Error(self.IOut,
                        "Error :: No %s direction" % (self.Proj))
        chdir(self.Proj)
        system('%s/%s %s %s %s.log'
               % (self.ModuDir, script, nproc, cfg, self.Proj))
        system('mv %s.log ../%s.log' % (self.Proj, self.Proj))
        # if self.IPrint<=1:
        #     remove('%s/Job_%s.in' % (CurrScr, self.JobName))
        #     removedirs('%s' %CurrScr)
        chdir(self.WorkDir)
        return

    def run_Job_v02(self,
                    nproc=1, nthread=1, ntaskpernode=1,
                    cfg=None, script=None, cmd=None, qname=None):
        '''run aims through a specified csh named "Aims_Environment"'''
        from os import system, chdir
        from os.path import exists, isfile
        from my_io import print_Error, print_String

        if cfg is None:
            cfg = 'scalapack.mpi'
        if script is None:
            script = 'aims_runscr'
        if cmd is None:
            cmd = 'sbatch'
        elif cmd == 'bsub':
            cmd = 'bsub <'
        elif cmd == 'qsub_langchao':
            cmd = 'qsub -l nodes=<nodes>:ppn=<ntaskspernode>' +\
                ' -q <qname> -N <jobname>'
        if qname is None:
            qname = 'default'
        if not exists('%s' % self.Proj):
            print_Error(self.IOut,
                        "Error :: No %s direction" % (self.Proj))
        chdir(self.Proj)
        if isfile('RUNNING'):
            return False
        elif isfile('%s.log' % self.Proj):
            system('mv %s.log ../%s.log' % (self.Proj, self.Proj))
            chdir(self.WorkDir)
            return True
        else:
            if not isfile('%s/%s' % (self.ModuDir, script)):
                tmpString = 'To submit the jobs to the %s, ' % cmd
                tmpString += 'you need the script file named ' +\
                    '\"%s\" in the module folder of %s' \
                    % (script, self.ModuDir) + ', which does not exist\n' + \
                    'Please check if the file name (%s) is correct' \
                    % (script) + ' or it is simply missing'
                print_Error(self.IOut, tmpString)
            iof = open('%s/%s' % (self.ModuDir, script), 'r')
            iFile1 = iof.read()
            iof.close()
            ntasks = nproc/nthread
            if not ntasks*nthread == nproc:
                ntasks = ntasks+1
            # evaluate how many nodes needed for scripts
            nnode = ntasks/ntaskpernode
            if not nnode*ntaskpernode == ntasks:
                nnode = nnode+1
            iFile2 = iFile1.replace('<jobname>', 'job-%s' % self.Proj)
            iFile1 = iFile2.replace('<version>', cfg)
            iFile2 = iFile1.replace('<joblog>', '%s.log' % self.Proj)
            iFile1 = iFile2.replace('<nodes>', '%i' % nnode)
            iFile2 = iFile1.replace('<ntaskspernode>', '%i' % ntaskpernode)
            iFile1 = iFile2.replace('<nproc>', '%i' % nproc)
            iFile2 = iFile1.replace('<nthread>', '%i' % nthread)
            iFile1 = iFile2.replace('<ntasks>', '%i' % ntasks)
            iFile2 = iFile1.replace('<qname>', '%s' % qname)
            iFile1 = iFile2
            iof = open('runscr', 'w')
            iof.write(iFile1)
            iof.close()
            # evaluate how many nodes needed for cmd
            Cmd1 = cmd
            Cmd2 = Cmd1.replace('<jobname>', 'job-%s' % self.Proj)
            Cmd1 = Cmd2.replace('<version>', cfg)
            Cmd2 = Cmd1.replace('<joblog>', '%s.log' % self.Proj)
            Cmd1 = Cmd2.replace('<nodes>', '%i' % nnode)
            Cmd2 = Cmd1.replace('<ntaskspernode>', '%i' % ntaskpernode)
            Cmd1 = Cmd2.replace('<nproc>', '%i' % nproc)
            Cmd2 = Cmd1.replace('<nthread>', '%i' % nthread)
            Cmd1 = Cmd2.replace('<ntasks>', '%i' % ntasks)
            Cmd2 = Cmd1.replace('<qname>', '%s' % qname)
            Cmd1 = Cmd2
            jobId = system('%s runscr' % Cmd1)
            system('echo %s > %s' % (jobId, 'RUNNING'))
            chdir(self.WorkDir)
            return False

    def get_Result(self, iop=0):
        '''Collect results'''
        import re
        import os
        from my_io import print_String, print_Error

        if os.path.isfile('%s.log' % self.Proj):
            lf = open('%s.log' % self.Proj, 'r')
            lfs = lf.read()
        else:
            print_Error(self.IOut,
                        'Error :: No %s.log in current direction' % self.Proj)

        if iop == 0:    # for scf energy
            # At first, check whether the SCF is converged
            p0 = re.compile('Self-consistency cycle converged.')
            p0p = p0.search(lfs)
            if not p0p:
                print_String(self.IOut, 'Error :: SCF doesn\'t sucess in %s'
                             % self.Proj, 1)
                print_String(self.IOut, 'SCF energy                  : %16s'
                             % 'NAN', 1)
                self.Energy['SCF'] = 'NAN'
                print('Error :: SCF doesn\'t sucess in %s' % self.Proj)
            else:
                # to find the SCF energy with fractional occupation
                tmpString = \
                    'Total energy *: *(?P<iters>-?\d+.\d+) Ha'
                p1 = re.compile(tmpString)
                # to find the SCF energy with interger occupation
                # tmpString = \
                #     'Total energy, T -> 0  *:\s*(?P<iters>-?\d+.\d+) Ha'
                # p2 = re.compile(tmpString)
                p1p = p1.findall(lfs)
                if len(p1p) != 0:
                    self.Energy['SCF'] = float(p1p[-1])
                    print_String(self.IOut,
                                 'SCF energy                  : %16.8f'
                                 % self.Energy['SCF'], 1)
                else:
                    print_String(self.IOut,
                                 'Error :: SCF result was not found in %s'
                                 % self.Proj, 1)
                    print_String(self.IOut,
                                 'SCF energy                  : %16s'
                                 % 'NAN', 1)
                    self.Energy['SCF'] = 'NAN'
        elif iop == 1:  # for RPA energy
            # to find the RPA correlation energy
            p0 = re.compile(
                'RPA correlation energy :\s*(?P<iters>-?\d+.\d+)  Ha')
            p0p = p0.search(lfs)
            if p0p:
                self.Energy['EcRPA'] = float(p0p.group('iters'))
                print_String(self.IOut,
                             'RPA correlation energy      : %16.8f'
                             % self.Energy['EcRPA'], 1)
            else:
                print_String(self.IOut,
                             'Error :: EcRPA result was not found in %s'
                             % self.Proj, 1)
                print_String(self.IOut,
                             'RPA correlation energy      : %16s'
                             % 'NAN', 1)
                self.Energy['EcRPA'] = 'NAN'
            # to find the RPA total energy
            tmpString = \
                'RPA total energy                  :\s*(?P<iters>-?\d+.\d+) Ha'
            p1 = re.compile(tmpString)
            p1p = p1.search(lfs)
            if p1p:
                self.Energy['RPA'] = float(p1p.group('iters'))
                print_String(self.IOut,
                             'RPA total energy            : %16.8f'
                             % self.Energy['RPA'], 1)
            else:
                print_String(self.IOut,
                             'Error :: RPA result was not found in %s'
                             % self.Proj, 1)
                self.Energy['RPA'] = 'NAN'
                print_String(self.IOut,
                             'RPA correlation energy      : %16s'
                             % self.Energy['RPA'], 1)
            tmpString = \
                'RPA\+SE total energy *:\s*(?P<iters>-?\d+.\d+) Ha'
            p2 = re.compile(tmpString)  # to find the RPA+SE total energy
            p2p = p2.search(lfs)
            if p2p:
                self.Energy['RPA+SE'] = float(p2p.group('iters'))
                print_String(self.IOut,
                             'RPA+SE total energy         : %16.8f'
                             % self.Energy['RPA+SE'], 1)
            else:
                print_String(self.IOut,
                             'Error :: RPA+SE result was not found in %s'
                             % self.Proj, 1)
                self.Energy['RPA+SE'] = 'NAN'
                print_String(self.IOut,
                             'RPA+SE total energy         : %16s'
                             % self.Energy['RPA+SE'], 1)
            # to find the RPA+rSE (diag) total energy
            tmpString = \
                'RPA\+rSE \(diag\) total energy *:\s*(?P<iters>-?\d+.\d+) Ha'
            p3 = re.compile(tmpString)
            p3p = p3.search(lfs)
            if p3p:
                self.Energy['RPA+rSEd'] = float(p3p.group('iters'))
                print_String(self.IOut,
                             'RPA+rSE (diag) total energy : %16.8f'
                             % self.Energy['RPA+rSEd'], 1)
            else:
                print_String(self.IOut,
                             'Error :: RPA+rSEd result was not found in %s'
                             % self.Proj, 1)
                self.Energy['RPA+rSEd'] = 'NAN'
                print_String(self.IOut,
                             'RPA+rSE (diag) total energy : %16s'
                             % self.Energy['RPA+rSEd'], 1)
            # to find the RPA+rSE (full) total energy
            tmpString =\
                'RPA\+rSE \(full\) total energy &:\s*(?P<iters>-?\d+.\d+) Ha'
            p4 = re.compile(tmpString)
            p4p = p4.search(lfs)
            if p4p:
                self.Energy['RPA+rSEf'] = float(p4p.group('iters'))
                print_String(self.IOut,
                             'RPA+rSE (full) total energy : %16.8f'
                             % self.Energy['RPA+rSEf'], 1)
            else:
                print_String(self.IOut,
                             'Error :: RPA+rSEf result was not found in %s'
                             % self.Proj, 1)
                self.Energy['RPA+rSEf'] = 'NAN'
                print_String(self.IOut,
                             'RPA+rSE (diag) total energy : %16s'
                             % self.Energy['RPA+rSEf'], 1)

            tmpString =\
                'RPA\+ total energy *:\s*(?P<iters>-?\d+.\d+) Ha'
            p5 = re.compile(tmpString)
            p5p = p5.search(lfs)
            if p5p:
                self.Energy['RPA+'] = float(p5p.group('iters'))
                print_String(self.IOut,
                             'RPA+ total energy           : %16.8f'
                             % self.Energy['RPA+'], 1)
            else:
                print_String(self.IOut,
                             'Error :: RPA+ result was not found in %s'
                             % self.Proj, 1)
                self.Energy['RPA+'] = 'NAN'
                print_String(self.IOut,
                             'RPA+ total energy           : %16s'
                             % self.Energy['RPA+'], 1)

            tmpString =\
                'Exact exchange energy *:\s*(?P<iters>-?\d+.\d+) Ha'
            p6 = re.compile(tmpString)
            p6p = p6.search(lfs)
            if p6p:
                self.Energy['ExHF'] = float(p6p.group('iters'))
                print_String(self.IOut,
                             'Exact exchange energy       : %16.8f'
                             % self.Energy['ExHF'], 1)
            else:
                print_String(self.IOut,
                             'Error :: ExHF result was not found in %s'
                             % self.Proj, 1)
                self.Energy['ExHF'] = 'NAN'
                print_String(self.IOut,
                             'Exact exchange energy       : %16s'
                             % self.Energy['ExHF'], 1)

        elif iop == 2:   # for SOSEX related energy
            tmpString =\
                'RPA\+2OX total energy *:\s*(?P<iters>-?\d+.\d+) Ha'
            p7 = re.compile(tmpString)
            p7p = p7.search(lfs)
            if p7p:
                self.Energy['RPA+2OX'] = float(p7p.group('iters'))
                print_String(self.IOut,
                             'RPA+2OX total energy        : %16.8f'
                             % self.Energy['RPA+2OX'], 1)
            else:
                print_String(self.IOut,
                             'Error :: PRA+2OX result was not found in %s'
                             % self.Proj, 1)
                self.Energy['RPA+2OX'] = 'NAN'
                print_String(self.IOut,
                             'RPA+2OX total energy        : %16s'
                             % self.Energy['RPA+2OX'], 1)

            tmpString =\
                'RPA\+SOSEX total energy *:\s*(?P<iters>-?\d+.\d+) Ha'
            p8 = re.compile(tmpString)
            p8p = p8.search(lfs)
            if p8p:
                self.Energy['RPA+SOSEX'] = float(p8p.group('iters'))
                print_String(self.IOut,
                             'RPA+SOSEX total energy      : %16.8f'
                             % self.Energy['RPA+SOSEX'], 1)
            else:
                print_String(self.IOut,
                             'Error :: PRA+SOSEX result was not found in %s'
                             % self.Proj, 1)
                self.Energy['RPA+SOSEX'] = 'NAN'
                print_String(self.IOut,
                             'RPA+SOSEX total energy      : %16s'
                             % self.Energy['RPA+SOSEX'], 1)

            tmpString =\
                'rPT2\(=RPA\+SOSEX\+rSE\) total energy ' +\
                ': *(?P<iters>-?\d+.\d+) Ha'
            p9 = re.compile(tmpString)
            p9p = p9.search(lfs)
            if p9p:
                self.Energy['RPA+SOSEX+rSE'] = float(p9p.group('iters'))
                print_String(self.IOut,
                             'rPT2 total energy           : %16.8f'
                             % self.Energy['RPA+SOSEX+rSE'], 1)
            else:
                print_String(self.IOut, 'Error :: PRA+SOSEX+rSE result ' +
                             'was not found in %s' % self.Proj, 1)
                self.Energy['RPA+SOSEX+rSE'] = 'NAN'
                print_String(self.IOut,
                             'rPT2 total energy           : %16s'
                             % self.Energy['RPA+SOSEX+rSE'], 1)
        elif iop == 3:   # for MP2 related energy
            tmpString =\
                'Total Energy \+ MP2 correction  :\s*(?P<iters>-?\d+.\d+) Ha'
            p10 = re.compile(tmpString)
            p10p = p10.search(lfs)
            if p10p:
                print p10p.group('iters')
                self.Energy['MP2'] = float(p10p.group('iters'))
                print_String(self.IOut,
                             'MP2 total energy            : %16.8f'
                             % self.Energy['MP2'], 1)
            else:
                print_String(self.IOut,
                             'Error :: MP2 result was not found in %s'
                             % self.Proj, 1)
                self.Energy['MP2'] = 'NAN'
                print_String(self.IOut,
                             'MP2 total energy            : %16s'
                             % self.Energy['MP2'], 1)
            tmpString =\
                'MP2 correction                 :\s*(?P<iters>-?\d+.\d+) Ha'
            p11 = re.compile(tmpString)
            p11p = p11.search(lfs)
            if p11p:
                self.Energy['MP2c'] = float(p11p.group('iters'))
                print_String(self.IOut,
                             'MP2 correlation             : %16.8f'
                             % self.Energy['MP2c'], 1)
            else:
                print_String(self.IOut,
                             'Error :: MP2 result was not found in %s'
                             % self.Proj, 1)
                self.Energy['MP2c'] = 'NAN'
                print_String(self.IOut,
                             'MP2 correlation             : %16s'
                             % self.Energy['MP2c'], 1)
            tmpString =\
                'HF Energy                      :\s*(?P<iters>-?\d+.\d+) Ha'
            p12 = re.compile(tmpString)
            p12p = p12.search(lfs)
            if p12p:
                self.Energy['HF'] = float(p12p.group('iters'))
                print_String(self.IOut,
                             'HF Energy                   : %16.8f'
                             % self.Energy['HF'], 1)
            else:
                print_String(self.IOut,
                             'Error :: MP2 result was not found in %s'
                             % self.Proj, 1)
                self.Energy['HF'] = 'NAN'
                print_String(self.IOut,
                             'HF energy                   : %16s'
                             % self.Energy['HF'], 1)
        elif iop == 4:   # for DHDFT related energy
            p13 = re.compile('Total DHDF energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p13p = p13.search(lfs)
            if p13p:
                self.Energy['DHDF'] = float(p13p.group('iters'))
                print_String(self.IOut,
                             'DHDF total energy            : %16.8f'
                             % self.Energy['DHDF'], 1)
            else:
                print_String(self.IOut,
                             'Error :: DHDF result was not found in %s'
                             % self.Proj, 1)
                self.Energy['DHDF'] = 'NAN'
                print_String(self.IOut,
                             'DHDF total energy            : %16s'
                             % self.Energy['DHDF'], 1)
            p14 = re.compile('PT2 contribution *:\s*(?P<iters>-?\d+.\d+) Ha')
            p14p = p14.search(lfs)
            if p14p:
                print_String(self.IOut,
                             'PT2 in DHDF                  : %16.8f'
                             % self.Energy['DHDF'], 1)
            else:
                print_String(self.IOut,
                             'Error :: PT2 in DHDF result was not found in %s'
                             % self.Proj, 1)
                print_String(self.IOut,
                             'PT2 in DHDF                  : %16s'
                             % self.Energy['DHDF'], 1)
            p15 = re.compile('DHDF/DFT Energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p15p = p15.search(lfs)
            if p15p:
                print_String(self.IOut,
                             'DFT in DHDF                  : %16.8f'
                             % self.Energy['DHDF'], 1)
            else:
                print_String(self.IOut,
                             'Error :: PT2 in DHDF result was not found in %s'
                             % self.Proj, 1)
                print_String(self.IOut,
                             'DFT in DHDF                  : %16s'
                             % self.Energy['DHDF'], 1)
        elif iop == 5:   # for CMP2 related energy
            p13 = re.compile('Total SCPT2 energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p13p = p13.search(lfs)
            if p13p:
                self.Energy['CMP2'] = float(p13p.group('iters'))
                print_String(self.IOut,
                             'Total SCPT2 energy          : %16.8f'
                             % self.Energy['CMP2'], 1)
            else:
                print_String(self.IOut,
                             'Error :: SCPT2 result was not found in %s'
                             % self.Proj, 1)
                self.Energy['CMP2'] = 'NAN'
                print_String(self.IOut,
                             'Total SCPT2 energy          : %16s'
                             % self.Energy['CMP2'], 1)
            p14 = re.compile('SCPT2 contribution *:\s*(?P<iters>-?\d+.\d+) Ha')
            p14p = p14.search(lfs)
            if p14p:
                self.Energy['CPT2'] = float(p14p.group('iters'))
                print_String(self.IOut,
                             'C Energy CPT2               : %16.8f'
                             % self.Energy['CPT2'], 1)
            else:
                print_String(self.IOut,
                             'Error :: SCPT2 correlation was not found in %s'
                             % self.Proj, 1)
                self.Energy['CPT2'] = 'NAN'
                print_String(self.IOut,
                             'C Energy CPT2               : %16s'
                             % self.Energy['CPT2'], 1)
            tmpString =\
                'SCPT2 contribution \(ss\) *:\s*(?P<iters>-?\d+.\d+) Ha'
            p14 = re.compile(tmpString)
            p14p = p14.search(lfs)
            if p14p:
                self.Energy['CPT2ss'] = float(p14p.group('iters'))
                print_String(self.IOut,
                             'C Energy CPT2ss             : %16.8f'
                             % self.Energy['CPT2ss'], 1)
            else:
                print_String(self.IOut,
                             'Error :: SCPT2ss correlation was not found in %s'
                             % self.Proj, 1)
                self.Energy['CPT2ss'] = 'NAN'
                print_String(self.IOut, 'C Energy CPT2ss             : %16s'
                             % self.Energy['CPT2ss'], 1)
            p14 = re.compile(
                'SCPT2 contribution \(os\) *:\s*(?P<iters>-?\d+.\d+) Ha')
            p14p = p14.search(lfs)
            if p14p:
                self.Energy['CPT2os'] = float(p14p.group('iters'))
                print_String(self.IOut,
                             'C Energy CPT2os             : %16.8f'
                             % self.Energy['CPT2os'], 1)
            else:
                print_String(self.IOut,
                             'Error :: SCPT2os correlation was not found in %s'
                             % self.Proj, 1)
                self.Energy['CPT2os'] = 'NAN'
                print_String(self.IOut, 'C Energy CPT2os             : %16s'
                             % self.Energy['CPT2os'], 1)
            p12 = re.compile(
                'Exact Echange Energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p12p = p12.search(lfs)
            if p12p:
                self.Energy['ExHF'] = float(p12p.group('iters'))
                print_String(self.IOut, 'X Energy HF                 : %16.8f'
                             % self.Energy['ExHF'], 1)
            else:
                print_String(self.IOut,
                             'Error :: Exact exchange was not found in %s'
                             % self.Proj, 1)
                self.Energy['ExHF'] = 'NAN'
                print_String(self.IOut, 'X Energy HF                 : %16s'
                             % self.Energy['ExHF'], 1)
            p15  = re.compile('DFT Energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p15p = p15.search(lfs)
            if p15p:
                self.Energy['DFT'] = float(p15p.group('iters'))
                print_String(self.IOut, 'DFT Energy                  : %16.8f'
                             % self.Energy['DFT'], 1)
            else:
                print_String(self.IOut,
                             'Error :: Exact exchange was not found in %s'
                             % self.Proj, 1)
                self.Energy['DFT'] = 'NAN'
                print_String(self.IOut, 'Exact Exchange Energy       : %16s'
                             % self.Energy['DFT'], 1)
            p16  = re.compile('X Energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p16p = p16.search(lfs)
            if p16p:
                self.Energy['ExDFT'] = float(p16p.group('iters'))
                print_String(self.IOut,
                             'X Energy DFT                : %16.8f'
                             % self.Energy['ExDFT'], 1)
            else:
                print_String(self.IOut,
                             'Error :: Exact exchange was not found in %s'
                             % self.Proj, 1)
                self.Energy['ExDFT'] = 'NAN'
                print_String(self.IOut, 'X Energy DFT                : %16s'
                             % self.Energy['ExDFT'], 1)
            p17  = re.compile('C Energy GGA *:\s*(?P<iters>-?\d+.\d+) Ha')
            p17p = p17.search(lfs)
            if p17p:
                self.Energy['EcDFT'] = float(p17p.group('iters'))
                print_String(self.IOut,
                             'C Energy GGA                : %16.8f'
                             % self.Energy['EcDFT'], 1)
            else:
                print_String(self.IOut,
                             'Error :: DFT correlation was not found in %s'
                             % self.Proj, 1)
                self.Energy['EcDFT'] = 'NAN'
                print_String(self.IOut, 'C Energy GGA                : %16s'
                             % self.Energy['EcDFT'], 1)
            p18  = re.compile('X Energy LDA *:\s*(?P<iters>-?\d+.\d+) Ha')
            p18p = p18.search(lfs)
            if p18p:
                self.Energy['ExLDA'] = float(p18p.group('iters'))
                print_String(self.IOut, 'X Energy LDA                : %16.8f'
                             % self.Energy['ExLDA'], 1)
            else:
                print_String(self.IOut,
                             'Error :: LDA exchange was not found in %s'
                             %self.Proj, 1)
                self.Energy['ExLDA'] = 'NAN'
                print_String(self.IOut, 'X Energy LDA                : %16s'
                             % self.Energy['ExLDA'], 1)
            p19  = re.compile('C Energy LDA *:\s*(?P<iters>-?\d+.\d+) Ha')
            p19p = p19.search(lfs)
            if p19p:
                self.Energy['EcLDA'] = float(p19p.group('iters'))
                print_String(self.IOut,
                             'C Energy LDA                : %16.8f'
                             % self.Energy['EcLDA'], 1)
            else:
                print_String(self.IOut,
                             'Error :: LDA correlation was not found in %s'
                             % self.Proj, 1)
                self.Energy['EcLDA'] = 'NAN'
                print_String(self.IOut, 'C Energy LDA                : %16s'
                             % self.Energy['EcLDA'], 1)
            p20  = re.compile('MP2 correction *:\s*(?P<iters>-?\d+.\d+) Ha')
            p20p = p20.search(lfs)
            if p20p:
                self.Energy['EcPT2'] = float(p20p.group('iters'))
                print_String(self.IOut,
                             'C Energy PT2                : %16.8f'
                             % self.Energy['EcPT2'], 1)
            else:
                print_String(self.IOut,
                             'Error :: MP2 correlation was not found in %s'
                             % self.Proj, 1)
                self.Energy['EcPT2'] = 'NAN'
                print_String(self.IOut, 'C Energy PT2                : %16s'
                             % self.Energy['EcPT2'], 1)
            p20  = re.compile(
                'MP2 correction \(ss\) *:\s*(?P<iters>-?\d+.\d+) Ha')
            p20p = p20.search(lfs)
            if p20p:
                self.Energy['EcPT2ss'] = float(p20p.group('iters'))
                print_String(self.IOut,
                             'C Energy PT2ss              : %16.8f'
                             % self.Energy['EcPT2ss'], 1)
            else:
                print_String(self.IOut,
                             'Error :: PT2ss correlation was not found in %s'
                             % self.Proj, 1)
                self.Energy['EcPT2ss'] = 'NAN'
                print_String(self.IOut, 'C Energy PT2ss              : %16s'
                             % self.Energy['EcPT2ss'], 1)
            p20  = re.compile(
                'MP2 correction \(os\) *:\s*(?P<iters>-?\d+.\d+) Ha')
            p20p = p20.search(lfs)
            if p20p:
                self.Energy['EcPT2os'] = float(p20p.group('iters'))
                print_String(self.IOut, 'C Energy PT2os              : %16.8f'
                             % self.Energy['EcPT2os'], 1)
            else:
                print_String(self.IOut,
                             'Error :: PT2os correlation was not found in %s'
                             % self.Proj, 1)
                self.Energy['EcPT2os'] = 'NAN'
                print_String(self.IOut, 'C Energy PT2ss              : %16s'
                             %self.Energy['EcPT2os'], 1)
            p13  = re.compile('XC contributuion for \s*(?P<iters>\w+)')
            p13p = p13.findall(lfs)
            if p13p:
                for x in p13p:
                    xlenght = len(x)
                    p14 = re.compile('X %s *:\s*(?P<iters>-?\d+.\d+) Ha' % x)
                    p14p = p14.search(lfs)
                    if p14p:
                        tmpv = float(p14p.group('iters'))
                        print_String(self.IOut, 'X %s%s: %16.8f'
                                     % (x, ' '*(26-xlenght), tmpv), 1)
                    p14 = re.compile('C %s *:\s*(?P<iters>-?\d+.\d+) Ha' % x)
                    p14p = p14.search(lfs)
                    if p14p:
                        tmpv = float(p14p.group('iters'))
                        print_String(self.IOut, 'C %s%s: %16.8f'
                                     % (x, ' '*(26-xlenght), tmpv), 1)
        elif iop == 6:          # for CMP2 related energy
            p13 = re.compile(
                'Total coupled DHDF energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p13p = p13.search(lfs)
            if p13p:
                self.Energy['CDHDF'] = float(p13p.group('iters'))
                print_String(self.IOut, 'Coupled DHDF total energy   : %16.8f'
                             % self.Energy['CDHDF'], 1)
            else:
                print_String(self.IOut,
                             'Error :: Coupled DHDF result was not found in %s'
                             % self.Proj, 1)
                self.Energy['CDHDF'] = 'NAN'
                print_String(self.IOut, 'Coupled DHDF total energy   : %16s'
                             % self.Energy['CDHDF'], 1)
            p14 = re.compile(
                'Coupled PT2 contribution *:\s*(?P<iters>-?\d+.\d+) Ha')
            p14p = p14.search(lfs)
            if p14p:
                self.Energy['CPT2'] = float(p14p.group('iters'))
                print_String(self.IOut, 'Coupled PT2 in DHDF         : %16.8f'
                             % self.Energy['CPT2'], 1)
            else:
                print_String(self.IOut, 'Error :: Coupled PT2 in DHDF' +
                             ' result was not found in %s' % self.Proj, 1)
                print_String(self.IOut, 'Coupled PT2 in DHDF         : %16s'
                             % self.Energy['CPT2'], 1)
            p15  = re.compile('DHDF\/DFT Energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p15p = p15.search(lfs)
            if p15p:
                self.Energy['DFT'] = float(p15p.group('iters'))
                print_String(self.IOut,
                             'DFT in DHDF                 : %16.8f'
                             % self.Energy['DFT'], 1)
            else:
                print_String(self.IOut,
                             'Error :: DFT in DHDF result was not found in %s'
                             % self.Proj, 1)
                print_String(self.IOut, 'DFT in DHDF                 : %16s'
                             % self.Energy['DFT'], 1)
            p13  = re.compile('XC contributuion for \s*(?P<iters>\w+)')
            p13p = p13.findall(lfs)
            if p13p:
                for x in p13p:
                    xlenght = len(x)
                    p14 = re.compile('X %s *:\s*(?P<iters>-?\d+.\d+) Ha' % x)
                    p14p = p14.search(lfs)
                    if p14p:
                        tmpv = float(p14p.group('iters'))
                        print_String(self.IOut, 'X %s%s: %16.8f'
                                     % (x, ' '*(26-xlenght), tmpv), 1)
                    p14 = re.compile('C %s *:\s*(?P<iters>-?\d+.\d+) Ha' % x)
                    p14p = p14.search(lfs)
                    if p14p:
                        tmpv = float(p14p.group('iters'))
                        print_String(self.IOut, 'C %s%s: %16.8f'
                                     % (x, ' '*(26-xlenght), tmpv), 1)
        elif iop == 7:  # for RPA potentials along AC path
            p16 = re.compile(
                'Lambda, RPA potential :\s*(?P<iters1>\d+.\d+)' +
                ',\s*(?P<iters2>-?\d+.\d+)')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                p16p = [(float(x[0]), float(x[1])) for x in p16p]
                self.Energy['WRPA'] = p16p[:]
                for x in range(len(p16p)):
                    print_String(self.IOut,
                                 'P Energy RPA                : %16.8f,%16.8f'
                                 % self.Energy['WRPA'][x], 1)
        elif iop == 8:   # for HOMO-LUMO gap
            p17 = re.compile('Overall HOMO-LUMO gap:\s*(?P<iters>\d+.\d+) eV')
            p17p = p17.findall(lfs)
            if p17p:
                self.Energy['HLG'] = float(p17p[-1])
                print_String(self.IOut,
                             'Overall HOMO-LUMO gap       : %16.8f'
                             % self.Energy['HLG'], 1)
        elif iop == 9:   # for truncated CI results
            p16 = re.compile(
                'E\[CI\] = :\s*(?P<iters1>\d+.\d+),\s*(?P<iters2>-?\d+.\d+)')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['CI'] = float(p16p[-1])
                print_String(self.IOut, 'CI Energy                   : %16.8f'
                             % self.Energy['CI'], 1)
        elif iop == 10:    # for TS vdw correction
            p16 = re.compile(
                'vdW energy correction *:\s*(?P<iters>-?\d+.\d+) Ha')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['vdw'] = float(p16p[-1])
                print_String(self.IOut, 'TS vdw correction           : %16.8f'
                             % self.Energy['vdw'], 1)
            p16 = re.compile('MBD@rsSCS energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['vdw'] = float(p16p[-1])
                print_String(self.IOut,
                             'MBD@rsSCS vdw correction    : %16.8f'
                             % self.Energy['vdw'], 1)
        elif iop == 11:   # for meta-GGA total energy
            p16 = re.compile(
                'Meta-gga total energy \s*(?P<iters>-?\d+.\d+) Ha')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['metaGGA'] = float(p16p[-1])
                print_String(self.IOut, 'Meta-GGA total energy       : %16.8f'
                             % self.Energy['metaGGA'], 1)
        elif iop == 12:     # for ZRPS energy
            p16 = re.compile(
                'sBGE2 contribution *:\s*(?P<iters>-?\d+.\d+) Ha')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                tmpValue = float(p16p[-1])
                print_String(self.IOut, 'sBGE2 correlation energy    : %16.8f'
                             % tmpValue, 1)
            p16 = re.compile(
                'Total ZRPS energy              :\s*(?P<iters>-?\d+.\d+) Ha')
            p16 = re.compile(
                'Total ZRPS\(DH\) energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                tmpValue = float(p16p[-1])
                print_String(self.IOut, 'ZRPS(DH) total energy       : %16.8f'
                             % tmpValue, 1)
            p16 = re.compile(
                'Total ZRPS energy              :\s*(?P<iters>-?\d+.\d+) Ha')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['ZRPS'] = float(p16p[-1])
                print_String(self.IOut,
                             'ZRPS total energy           : %16.8f'
                             % self.Energy['ZRPS'], 1)
        elif iop == 16:   # for XYG3 energy
            p16 = re.compile('Total XYG3 energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['XYG3'] = float(p16p[-1])
                print_String(self.IOut,
                             'XYG3 total energy           : %16.8f'
                             % self.Energy['XYG3'], 1)
            p16 = re.compile(
                'Total XYGJOS energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['XYG3'] = float(p16p[-1])
                print_String(self.IOut,
                             'XYGJOS total energy         : %16.8f'
                             % self.Energy['XYG3'], 1)
        elif iop == 17:    # for osRPA
            p16 = re.compile('osRPA total energy *:\s*(?P<iters>-?\d+.\d+) Ha')
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['osrpa'] = float(p16p[-1])
                print_String(self.IOut,
                             'osRPA total energy          : %16.8f'
                             % self.Energy['osrpa'], 1)
            tmpString =\
                'OS-RPA correlation energy *:\s*(?P<iters>-?\d+.\d+)  Ha'
            p16 = re.compile(tmpString)
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['EcosRPA'] = float(p16p[-1])
                print_String(self.IOut,
                             'osRPA correlation energy    : %16.8f'
                             % self.Energy['EcosRPA'], 1)
            tmpString =\
                ' RPA correlation energy *:\s*(?P<iters>-?\d+.\d+)  Ha'
            p16 = re.compile(tmpString)
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['EcRPA'] = float(p16p[-1])
                print_String(self.IOut,
                             'RPA correlation energy      : %16.8f'
                             % self.Energy['EcRPA'], 1)
            tmpString =\
                'OS-MP2 correlation energy *:\s*(?P<iters>-?\d+.\d+)  Ha'
            p16 = re.compile(tmpString)
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['EcosMP2'] = float(p16p[-1])
                print_String(self.IOut,
                             'osMP2 correlation energy    : %16.8f'
                             % self.Energy['EcosMP2'], 1)
            tmpString =\
                'Exact exchange energy *:\s*(?P<iters>-?\d+.\d+) Ha'
            p16 = re.compile(tmpString)
            p16p = p16.findall(lfs)
            if len(p16p) != 0:
                self.Energy['Exx'] = float(p16p[-1])
                print_String(self.IOut,
                             'Exact exchange energy       : %16.8f'
                             % self.Energy['Exx'], 1)
            p13 = re.compile('XC contributuion for \s*(?P<iters>\w+)')
            p13p = p13.findall(lfs)
            if p13p:
                for x in p13p[-4:]:
                    xlenght = len(x)
                    p14 = re.compile('X %s *:\s*(?P<iters>-?\d+.\d+) Ha' % x)
                    # p14p = p14.search(lfs)
                    p14p = p14.findall(lfs)
                    if p14p:
                        # tmpv = float(p14p.group('iters'))
                        tmpv = float(p14p[-1])
                        print_String(self.IOut, 'X %s%s: %16.8f'
                                     % (x, ' '*(26-xlenght), tmpv), 1)
                    p14 = re.compile('C %s *:\s*(?P<iters>-?\d+.\d+) Ha' % x)
                    p14p = p14.findall(lfs)
                    if p14p:
                        tmpv = float(p14p[-1])
                        print_String(self.IOut, 'C %s%s: %16.8f'
                                     % (x, ' '*(26-xlenght), tmpv), 1)
        return

    def parse_Control(self):
        '''parse control.in'''
        import os
        # open elec_state
        if os.path.isfile("%s/elec_state" % self.Proj):
            sff = open("%s/elec_state" % self.Proj, 'a')
        else:
            sff = open("%s/elec_state" % self.Proj, 'w')
        # open control.in
        if os.path.isfile("%s/control.in" % self.Proj):
            wff = open("%s/control.in" % self.Proj, 'r')
        else:
            print("No control.in")

        sff.close()
        wff.close()
        return

    def parse_Geometry(self):
        '''parse geometry.in'''
        import os
        # open elec_state
        if os.path.isfile("%s/elec_state" % self.Proj):
            sff = open("%s/elec_state" % self.Proj, 'a')
        else:
            sff = open("%s/elec_state" % self.Proj, 'w')
        # open geometry.in
        if os.path.isfile("%s/geometry.in" % self.Proj):
            sff = open("%s/geometry.in" % self.Proj, 'r')
        else:
            print("No geometry.in")

        sff.close()
        return
