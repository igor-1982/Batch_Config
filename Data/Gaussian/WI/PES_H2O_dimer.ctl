# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "CP2K"     : to run jobs using CP2K package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PES_bz_methane   2              Gaussian

# The project description
__title__ ::
"==================================== H2O dimer ================================="
"Geometry of H2O is collected from J. Phys. Chem. A 2004, 108 2305-2313"
"It was optimized at the theoretical level of CCSD(T)/TZ2P(f,d)+dif."
"H2O flagments in H2O dimers using the same geometry of H2O molecule."
"Two parameters (alpha, beta) which represent the relative positions of two "
"flagments are also obtained from J. Phys. Chem. A 2004, 108 2305-2313."
"It was optimized at the theoretical level of CCSD(T)/(FULL)/IO275"

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                36 is the total number of jobs in this batch list
__batch__ :: 36
#"Flag"         "DIR"                        "InpName"       "JobType"
  A0           <PATH1>/H2O_dimer_scan          H2O_monomer.com            energy
  0            <PATH1>/H2O_dimer_scan     H2O_dimer_1dot60.com            energy
  1            <PATH1>/H2O_dimer_scan     H2O_dimer_1dot80.com            energy
  2            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot00.com            energy
  3            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot20.com            energy
  4            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot40.com            energy
  5            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot50.com            energy
  6            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot60.com            energy
  7            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot70.com            energy
  8            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot80.com            energy
  9            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot85.com            energy
 10            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot86.com            energy
 11            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot87.com            energy
 12            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot88.com            energy
 13            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot89.com            energy
 14            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot90.com            energy
 15            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot91.com            energy
 16            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot92.com            energy
 17            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot93.com            energy
 18            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot94.com            energy
 19            <PATH1>/H2O_dimer_scan     H2O_dimer_2dot95.com            energy
 20            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot00.com            energy
 21            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot10.com            energy
 22            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot20.com            energy
 23            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot30.com            energy
 24            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot40.com            energy
 25            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot60.com            energy
 26            <PATH1>/H2O_dimer_scan     H2O_dimer_3dot80.com            energy
 27            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot00.com            energy
 28            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot20.com            energy
 29            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot40.com            energy
 30            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot60.com            energy
 31            <PATH1>/H2O_dimer_scan     H2O_dimer_4dot80.com            energy
 32            <PATH1>/H2O_dimer_scan     H2O_dimer_5dot00.com            energy
 33            <PATH1>/H2O_dimer_scan     H2O_dimer_5dot20.com            energy
 34            <PATH1>/H2O_dimer_scan     H2O_dimer_5dot40.com            energy

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

