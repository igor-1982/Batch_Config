# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "CP2K"     : to run jobs using CP2K package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PES_Water_2   2                QChem

# The project description
__title__ ::
"==================================== H2O dimer ================================="
"Geometry of H2O is collected from J. Phys. Chem. A 2004, 108 2305-2313"
"It was optimized at the theoretical level of CCSD(T)/TZ2P(f,d)+dif."
"H2O flagments in H2O dimers using the same geometry of H2O molecule."
"Two parameters (alpha, beta) which represent the relative positions of two "
"flagments are also obtained from J. Phys. Chem. A 2004, 108 2305-2313."
"It was optimized at the theoretical level of CCSD(T)/(FULL)/IO275"

# Machine and option keyword of QChem Package
__qchem__ ::  1   # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static = 200
mem_total  = 7500
exchange = b3lyp
basis = 6-311+g(3df,2p)
scf_convergence = 7
symmetry = false
xc_grid = 000075000302
$end


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                36 is the total number of jobs in this batch list
__batch__ :: 36
#"Flag"         "DIR"                        "InpName"       "JobType"
  A0           <PATH1>/H2O_dimer_scan          H2O_monomer.in             energy
  0            <PATH1>/H2O_dimer_scan     H2O_dimer_1dot60.in             energy
  1            <PATH1>/H2O_dimer_scan     H2O_dimer_1dot80.in             energy
  2            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot00.in             energy
  3            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot20.in             energy
  4            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot40.in             energy
  5            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot50.in             energy
  6            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot60.in             energy
  7            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot70.in             energy
  8            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot80.in             energy
  9            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot85.in             energy
 10            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot86.in             energy
 11            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot87.in             energy
 12            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot88.in             energy
 13            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot89.in             energy
 14            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot90.in             energy
 15            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot91.in             energy
 16            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot92.in             energy
 17            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot93.in             energy
 18            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot94.in             energy
 19            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot95.in             energy
 20            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot00.in             energy
 21            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot10.in             energy
 22            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot20.in             energy
 23            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot30.in             energy
 24            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot40.in             energy
 25            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot60.in             energy
 26            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot80.in             energy
 27            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot00.in             energy
 28            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot20.in             energy
 29            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot40.in             energy
 30            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot60.in             energy
 31            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot80.in             energy
 32            <PATH1>/H2O_dimer_scan     H2O_dimer_5dot00.in             energy
 33            <PATH1>/H2O_dimer_scan     H2O_dimer_5dot20.in             energy
 34            <PATH1>/H2O_dimer_scan     H2O_dimer_5dot40.in             energy

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
  2        35     1       A0      -2        0.0        1.0

