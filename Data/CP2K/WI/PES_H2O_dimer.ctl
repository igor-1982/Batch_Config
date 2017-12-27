# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "CP2K"     : to run jobs using CP2K package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PES_H2O_dimer   2            CP2K 

# The project description
__title__ ::
"==================================== H2O dimer ================================="
"Geometry of H2O is collected from J. Phys. Chem. A 2004, 108 2305-2313"
"It was optimized at the theoretical level of CCSD(T)/TZ2P(f,d)+dif."
"H2O flagments in H2O dimers using the same geometry of H2O molecule."
"Two parameters (alpha, beta) which represent the relative positions of two "
"flagments are also obtained from J. Phys. Chem. A 2004, 108 2305-2313."
"It was optimized at the theoretical level of CCSD(T)/(FULL)/IO275"

# Input statements of CP2K package
__cp2k__ ::  # Following lines are input statements of CP2K package
&FORCE_EVAL
  METHOD Quickstep
  &DFT
    BASIS_SET_FILE_NAME /share/apps/cp2k/tests/QS/EMSL_BASIS_SETS
    POTENTIAL_FILE_NAME /share/apps/cp2k/tests/QS/POTENTIAL
    &MGRID
      CUTOFF 280
      REL_CUTOFF 30
    &END MGRID
    &QS
      METHOD GAPW
      EPS_FILTER_MATRIX 1.0E-32
      EPS_PGF_ORB       1.0E-32
    &END QS
    &POISSON
      PERIODIC NONE
      PSOLVER  MT
      &MT
          REL_CUTOFF 1.0
      &END MT
    &END
    &SCF
      EPS_SCF 1.0E-5
      SCF_GUESS RESTART
      MAX_SCF 30
      &OT T
          PRECONDITIONER FULL_ALL
          ENERGY_GAP     0.001          # 0.001 is suitable for FULL_ALL
                                        # 0.200, which is default value, is suitable for other preconditioners.
          LINESEARCH     2PNT
          MAX_TAYLOR     5
          MINIMIZER      DIIS
          STEPSIZE       0.2            # initial stepsize used for the line search
      &END OT
      &OUTER_SCF
          EPS_SCF 1.0E-5
          MAX_SCF 20
      &END OUTER_SCF
    &END SCF
    &XC
      &XC_FUNCTIONAL
       &LYP
         SCALE_C 0.81
       &END
       &BECKE88
         SCALE_X 0.72
       &END
       &VWN
         FUNCTIONAL_TYPE VWN3                 # VWN3 is employed as in Gaussian package
         SCALE_C 0.19
       &END
       &XALPHA
         SCALE_X 0.08
       &END
      &END XC_FUNCTIONAL
      &HF
          FRACTION 0.20
          &MEMORY
              MAX_MEMORY 800                  # The memory available to one MPI process.
              EPS_STORAGE_SCALING 1.0E-1
          &END MEMORY
          &SCREENING
              EPS_SCHWARZ 1.0E-8
          &END SCREENING
      &END HF
    &END XC
  &END DFT
  &SUBSYS
    &CELL
      PERIODIC NONE
    &END CELL
    &KIND H
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND O
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
  &END SUBSYS
&END FORCE_EVAL

&GLOBAL
  RUN_TYPE ENERGY
  PRINT_LEVEL MEDIUM
&END GLOBAL
#=====================================================================

# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                36 is the total number of jobs in this batch list
__batch__ :: 36
#"Flag"         "DIR"                        "InpName"       "JobType"
  A0           <PATH1>/H2O_dimer_scan          H2O_monomer.inp            energy
  0            <PATH1>/H2O_dimer_scan     H2O_dimer_1dot60.inp            energy
  1            <PATH1>/H2O_dimer_scan     H2O_dimer_1dot80.inp            energy
  2            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot00.inp            energy
  3            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot20.inp            energy
  4            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot40.inp            energy
  5            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot50.inp            energy
  6            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot60.inp            energy
  7            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot70.inp            energy
  8            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot80.inp            energy
  9            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot85.inp            energy
 10            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot86.inp            energy
 11            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot87.inp            energy
 12            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot88.inp            energy
 13            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot89.inp            energy
 14            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot90.inp            energy
 15            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot91.inp            energy
 16            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot92.inp            energy
 17            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot93.inp            energy
 18            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot94.inp            energy
 19            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot95.inp            energy
 20            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot00.inp            energy
 21            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot10.inp            energy
 22            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot20.inp            energy
 23            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot30.inp            energy
 24            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot40.inp            energy
 25            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot60.inp            energy
 26            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot80.inp            energy
 27            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot00.inp            energy
 28            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot20.inp            energy
 29            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot40.inp            energy
 30            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot60.inp            energy
 31            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot80.inp            energy
 32            <PATH1>/H2O_dimer_scan     H2O_dimer_5dot00.inp            energy
 33            <PATH1>/H2O_dimer_scan     H2O_dimer_5dot20.inp            energy
 34            <PATH1>/H2O_dimer_scan     H2O_dimer_5dot40.inp            energy

# Training set for the atomization energy
#               35 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol"
__energy__ :: 35  627.51
#"Number" "Flag" "Scale"  "Flag" "Scale"    "Ref"      "Weight"
  2         0     1       A0      -2        0.0        1.0
  2         1     1       A0      -2        0.0        1.0
  2         2     1       A0      -2        0.0        1.0
  2         3     1       A0      -2        0.0        1.0
  2         4     1       A0      -2        0.0        1.0
  2         5     1       A0      -2        0.0        1.0
  2         6     1       A0      -2        0.0        1.0
  2         7     1       A0      -2        0.0        1.0
  2         8     1       A0      -2        0.0        1.0
  2         9     1       A0      -2        0.0        1.0
  2        10     1       A0      -2        0.0        1.0
  2        11     1       A0      -2        0.0        1.0
  2        12     1       A0      -2        0.0        1.0
  2        13     1       A0      -2        0.0        1.0
  2        14     1       A0      -2        0.0        1.0
  2        15     1       A0      -2        0.0        1.0
  2        16     1       A0      -2        0.0        1.0
  2        17     1       A0      -2        0.0        1.0
  2        18     1       A0      -2        0.0        1.0
  2        19     1       A0      -2        0.0        1.0
  2        20     1       A0      -2        0.0        1.0
  2        21     1       A0      -2        0.0        1.0
  2        22     1       A0      -2        0.0        1.0
  2        23     1       A0      -2        0.0        1.0
  2        24     1       A0      -2        0.0        1.0
  2        25     1       A0      -2        0.0        1.0
  2        26     1       A0      -2        0.0        1.0
  2        27     1       A0      -2        0.0        1.0
  2        28     1       A0      -2        0.0        1.0
  2        29     1       A0      -2        0.0        1.0
  2        30     1       A0      -2        0.0        1.0
  2        31     1       A0      -2        0.0        1.0
  2        32     1       A0      -2        0.0        1.0
  2        33     1       A0      -2        0.0        1.0
  2        34     1       A0      -2        0.0        1.0

