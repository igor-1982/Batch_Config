# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BSSE_PES_bz_methane   2            QChem 

# The project description
__title__ ::
"============================== bz-methane ==========================="
"         This is the set for PES of C6H6+CH4 in BSSE scheme          "

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
#                40 is the total number of jobs in this batch list
__batch__ :: 40
#"Flag"         "DIR"                            "InpName"         "JobType"
  0A           <PATH1>/BSSE_bz_methane_scan       0_a.in           energy
  1A           <PATH1>/BSSE_bz_methane_scan       1_a.in           energy
  2A           <PATH1>/BSSE_bz_methane_scan       2_a.in           energy
  3A           <PATH1>/BSSE_bz_methane_scan       3_a.in           energy
  4A           <PATH1>/BSSE_bz_methane_scan       4_a.in           energy
  5A           <PATH1>/BSSE_bz_methane_scan       5_a.in           energy
  6A           <PATH1>/BSSE_bz_methane_scan       6_a.in           energy
  7A           <PATH1>/BSSE_bz_methane_scan       7_a.in           energy
  8A           <PATH1>/BSSE_bz_methane_scan       8_a.in           energy
  9A           <PATH1>/BSSE_bz_methane_scan       9_a.in           energy
 10A           <PATH1>/BSSE_bz_methane_scan      10_a.in           energy
 11A           <PATH1>/BSSE_bz_methane_scan      11_a.in           energy
 12A           <PATH1>/BSSE_bz_methane_scan      12_a.in           energy
 13A           <PATH1>/BSSE_bz_methane_scan      13_a.in           energy
 14A           <PATH1>/BSSE_bz_methane_scan      14_a.in           energy
 15A           <PATH1>/BSSE_bz_methane_scan      15_a.in           energy
 16A           <PATH1>/BSSE_bz_methane_scan      16_a.in           energy
 17A           <PATH1>/BSSE_bz_methane_scan      17_a.in           energy
 18A           <PATH1>/BSSE_bz_methane_scan      18_a.in           energy
 19A           <PATH1>/BSSE_bz_methane_scan      19_a.in           energy
  0B           <PATH1>/BSSE_bz_methane_scan       0_b.in           energy
  1B           <PATH1>/BSSE_bz_methane_scan       1_b.in           energy
  2B           <PATH1>/BSSE_bz_methane_scan       2_b.in           energy
  3B           <PATH1>/BSSE_bz_methane_scan       3_b.in           energy
  4B           <PATH1>/BSSE_bz_methane_scan       4_b.in           energy
  5B           <PATH1>/BSSE_bz_methane_scan       5_b.in           energy
  6B           <PATH1>/BSSE_bz_methane_scan       6_b.in           energy
  7B           <PATH1>/BSSE_bz_methane_scan       7_b.in           energy
  8B           <PATH1>/BSSE_bz_methane_scan       8_b.in           energy
  9B           <PATH1>/BSSE_bz_methane_scan       9_b.in           energy
 10B           <PATH1>/BSSE_bz_methane_scan      10_b.in           energy
 11B           <PATH1>/BSSE_bz_methane_scan      11_b.in           energy
 12B           <PATH1>/BSSE_bz_methane_scan      12_b.in           energy
 13B           <PATH1>/BSSE_bz_methane_scan      13_b.in           energy
 14B           <PATH1>/BSSE_bz_methane_scan      14_b.in           energy
 15B           <PATH1>/BSSE_bz_methane_scan      15_b.in           energy
 16B           <PATH1>/BSSE_bz_methane_scan      16_b.in           energy
 17B           <PATH1>/BSSE_bz_methane_scan      17_b.in           energy
 18B           <PATH1>/BSSE_bz_methane_scan      18_b.in           energy
 19B           <PATH1>/BSSE_bz_methane_scan      19_b.in           energy

# Training set for the atomization energy
#               40 is the total number of the energy testing data
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 40  1.0
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
  1         0A    1                                       0.0        1.0
  1         1A    1                                       0.0        1.0
  1         2A    1                                       0.0        1.0
  1         3A    1                                       0.0        1.0
  1         4A    1                                       0.0        1.0
  1         5A    1                                       0.0        1.0
  1         6A    1                                       0.0        1.0
  1         7A    1                                       0.0        1.0
  1         8A    1                                       0.0        1.0
  1         9A    1                                       0.0        1.0
  1        10A    1                                       0.0        1.0
  1        11A    1                                       0.0        1.0
  1        12A    1                                       0.0        1.0
  1        13A    1                                       0.0        1.0
  1        14A    1                                       0.0        1.0
  1        15A    1                                       0.0        1.0
  1        16A    1                                       0.0        1.0
  1        17A    1                                       0.0        1.0
  1        18A    1                                       0.0        1.0
  1        19A    1                                       0.0        1.0
  1         0B    1                                       0.0        1.0
  1         1B    1                                       0.0        1.0
  1         2B    1                                       0.0        1.0
  1         3B    1                                       0.0        1.0
  1         4B    1                                       0.0        1.0
  1         5B    1                                       0.0        1.0
  1         6B    1                                       0.0        1.0
  1         7B    1                                       0.0        1.0
  1         8B    1                                       0.0        1.0
  1         9B    1                                       0.0        1.0
  1        10B    1                                       0.0        1.0
  1        11B    1                                       0.0        1.0
  1        12B    1                                       0.0        1.0
  1        13B    1                                       0.0        1.0
  1        14B    1                                       0.0        1.0
  1        15B    1                                       0.0        1.0
  1        16B    1                                       0.0        1.0
  1        17B    1                                       0.0        1.0
  1        18B    1                                       0.0        1.0
  1        19B    1                                       0.0        1.0
