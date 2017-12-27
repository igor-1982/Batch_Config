# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "CP2K"     : to run jobs using CP2K package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./H2O_cluster   2               CP2K 

# The project description
__title__ ::
"==================================== H2O cluster ================================="
"H2O cluster geometries in thi set are collected from J. Phys. Chem. A 2004, 108 10519"

# Input statements of CP2K Package
__cp2k__ ::  # Following lines are input statements of CP2K-Softs
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
#                27 is the total number of jobs in this batch list
__batch__ :: 27
#"Flag"         "DIR"                        "InpName"       "JobType"
  A0           <PATH1>/H2O_clusters         H2O_1.com                energy
  0            <PATH1>/H2O_clusters         H2O_2-Linear.com         energy
  1            <PATH1>/H2O_clusters         H2O_3-Cyclic.com         energy
  2            <PATH1>/H2O_clusters         H2O_4-Cyclic.com         energy
  3            <PATH1>/H2O_clusters         H2O_5-Cyclic.com         energy
  4            <PATH1>/H2O_clusters         H2O_6-Cyclic.com         energy
  5            <PATH1>/H2O_clusters         H2O_6-Cyclic-2.com       energy
  6            <PATH1>/H2O_clusters         H2O_6-Prism.com          energy
  7            <PATH1>/H2O_clusters         H2O_6-Cage.com           energy
  8            <PATH1>/H2O_clusters         H2O_6-Book.com           energy
  9            <PATH1>/H2O_clusters         H2O_6-Bag.com            energy
 10            <PATH1>/H2O_clusters         H2O_7-Prism-2.com        energy
 11            <PATH1>/H2O_clusters         H2O_8-D2d.com            energy
 12            <PATH1>/H2O_clusters         H2O_8-S4.com             energy
 13            <PATH1>/H2O_clusters         H2O_9-D2dDD.com          energy
 14            <PATH1>/H2O_clusters         H2O_10-Prism.com         energy
 15            <PATH1>/H2O_clusters         H2O_10-Prism-2.com       energy
 16            <PATH1>/H2O_clusters         H2O_10-Butterfly.com     energy
 17            <PATH1>/H2O_clusters         H2O_11-Pr443.com         energy
 18            <PATH1>/H2O_clusters         H2O_12-Pr444.com         energy
 19            <PATH1>/H2O_clusters         H2O_13-Pr454.com         energy
 20            <PATH1>/H2O_clusters         H2O_14-Pr2444.com        energy
 21            <PATH1>/H2O_clusters         H2O_15-Pr555.com         energy
 22            <PATH1>/H2O_clusters         H2O_16-Pr4444.com        energy
 23            <PATH1>/H2O_clusters         H2O_17-Pr454.com         energy
 24            <PATH1>/H2O_clusters         H2O_18-Pr44244.com       energy
 25            <PATH1>/H2O_clusters         H2O_19-Globular.com      energy

# Training set for the atomization energy
#               26 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol"
__energy__ :: 26  627.51
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

