# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PES_bz_methane   2            QChem 

# The project description
__title__ ::
"============================== bz-methane ==========================="
"             This is the set for PES of C6H6+CH4                     "

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
#                20 is the total number of jobs in this batch list
__batch__ :: 20
#"Flag"         "DIR"                        "InpName"       "JobType"
  0            <PATH1>/bz_methane_scan       0.in            energy
  1            <PATH1>/bz_methane_scan       1.in            energy
  2            <PATH1>/bz_methane_scan       2.in            energy
  3            <PATH1>/bz_methane_scan       3.in            energy
  4            <PATH1>/bz_methane_scan       4.in            energy
  5            <PATH1>/bz_methane_scan       5.in            energy
  6            <PATH1>/bz_methane_scan       6.in            energy
  7            <PATH1>/bz_methane_scan       7.in            energy
  8            <PATH1>/bz_methane_scan       8.in            energy
  9            <PATH1>/bz_methane_scan       9.in            energy
 10            <PATH1>/bz_methane_scan      10.in            energy
 11            <PATH1>/bz_methane_scan      11.in            energy
 12            <PATH1>/bz_methane_scan      12.in            energy
 13            <PATH1>/bz_methane_scan      13.in            energy
 14            <PATH1>/bz_methane_scan      14.in            energy
 15            <PATH1>/bz_methane_scan      15.in            energy
 16            <PATH1>/bz_methane_scan      16.in            energy
 17            <PATH1>/bz_methane_scan      17.in            energy
 18            <PATH1>/bz_methane_scan      18.in            energy
 19            <PATH1>/bz_methane_scan      19.in            energy

# Training set for the atomization energy
#               20 is the total number of the energy testing data
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 20  1.0
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
  1         0     1                                       0.0        1.0
  1         1     1                                       0.0        1.0
  1         2     1                                       0.0        1.0
  1         3     1                                       0.0        1.0
  1         4     1                                       0.0        1.0
  1         5     1                                       0.0        1.0
  1         6     1                                       0.0        1.0
  1         7     1                                       0.0        1.0
  1         8     1                                       0.0        1.0
  1         9     1                                       0.0        1.0
  1        10     1                                       0.0        1.0
  1        11     1                                       0.0        1.0
  1        12     1                                       0.0        1.0
  1        13     1                                       0.0        1.0
  1        14     1                                       0.0        1.0
  1        15     1                                       0.0        1.0
  1        16     1                                       0.0        1.0
  1        17     1                                       0.0        1.0
  1        18     1                                       0.0        1.0
  1        19     1                                       0.0        1.0

