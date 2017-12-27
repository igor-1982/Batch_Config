# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BSSE_NCIE           2              QChem

# The project description
__title__ ::
"============================== Bond3 set ==========================="
"             This is the set for non-bond interaction               "

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
#                48 is the total number of jobs in this batch list
__batch__ :: 48
#"Flag"         "DIR"                        "InpName"       "JobType"
  1-1           <PATH1>/BSSE_NCIE            1-1.in         energy
  2-1           <PATH1>/BSSE_NCIE            2-1.in         energy
  3-1           <PATH1>/BSSE_NCIE            3-1.in         energy
  4-1           <PATH1>/BSSE_NCIE            4-1.in         energy
  4-2           <PATH1>/BSSE_NCIE            4-2.in         energy
  5-1           <PATH1>/BSSE_NCIE            5-1.in         energy
  6-1           <PATH1>/BSSE_NCIE            6-1.in         energy
  7-1           <PATH1>/BSSE_NCIE            7-1.in         energy
  7-2           <PATH1>/BSSE_NCIE            7-2.in         energy
  8-1           <PATH1>/BSSE_NCIE            8-1.in         energy
  8-2           <PATH1>/BSSE_NCIE            8-2.in         energy
  9-1           <PATH1>/BSSE_NCIE            9-1.in         energy
  9-2           <PATH1>/BSSE_NCIE            9-2.in         energy
 10-1           <PATH1>/BSSE_NCIE           10-1.in         energy
 10-2           <PATH1>/BSSE_NCIE           10-2.in         energy
 11-1           <PATH1>/BSSE_NCIE           11-1.in         energy
 11-2           <PATH1>/BSSE_NCIE           11-2.in         energy
 12-1           <PATH1>/BSSE_NCIE           12-1.in         energy
 12-2           <PATH1>/BSSE_NCIE           12-2.in         energy
 13-1           <PATH1>/BSSE_NCIE           13-1.in         energy
 13-2           <PATH1>/BSSE_NCIE           13-2.in         energy
 14-1           <PATH1>/BSSE_NCIE           14-1.in         energy
 15-1           <PATH1>/BSSE_NCIE           15-1.in         energy
 16-1           <PATH1>/BSSE_NCIE           16-1.in         energy
 16-2           <PATH1>/BSSE_NCIE           16-2.in         energy
 17-1           <PATH1>/BSSE_NCIE           17-1.in         energy
 17-2           <PATH1>/BSSE_NCIE           17-2.in         energy
 18-1           <PATH1>/BSSE_NCIE           18-1.in         energy
 18-2           <PATH1>/BSSE_NCIE           18-2.in         energy
 19-1           <PATH1>/BSSE_NCIE           19-1.in         energy
 19-2           <PATH1>/BSSE_NCIE           19-2.in         energy
 20-1           <PATH1>/BSSE_NCIE           20-1.in         energy
 20-2           <PATH1>/BSSE_NCIE           20-2.in         energy
 21-1           <PATH1>/BSSE_NCIE           21-1.in         energy
 21-2           <PATH1>/BSSE_NCIE           21-2.in         energy
 22-1           <PATH1>/BSSE_NCIE           22-1.in         energy
 22-2           <PATH1>/BSSE_NCIE           22-2.in         energy
 23-1           <PATH1>/BSSE_NCIE           23-1.in         energy
 23-2           <PATH1>/BSSE_NCIE           23-2.in         energy
 24-1           <PATH1>/BSSE_NCIE           24-1.in         energy
 25-1           <PATH1>/BSSE_NCIE           25-1.in         energy
 25-2           <PATH1>/BSSE_NCIE           25-2.in         energy
 26-1           <PATH1>/BSSE_NCIE           26-1.in         energy
 27-1           <PATH1>/BSSE_NCIE           27-1.in         energy
 28-1           <PATH1>/BSSE_NCIE           28-1.in         energy
 29-1           <PATH1>/BSSE_NCIE           29-1.in         energy
 30-1           <PATH1>/BSSE_NCIE           30-1.in         energy
 31-1           <PATH1>/BSSE_NCIE           31-1.in         energy

# Training set for the atomization energy
#               48 is the total number of the energy testing data
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 48  1.0
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
  1         1-1  1                                       0.0        1.0
  1         2-1  1                                       0.0        1.0
  1         3-1  1                                       0.0        1.0
  1         4-1  1                                       0.0        1.0
  1         4-2  1                                       0.0        1.0
  1         5-1  1                                       0.0        1.0
  1         6-1  1                                       0.0        1.0
  1         7-1  1                                       0.0        1.0
  1         7-2  1                                       0.0        1.0
  1         8-1  1                                       0.0        1.0
  1         8-2  1                                       0.0        1.0
  1         9-1  1                                       0.0        1.0
  1         9-2  1                                       0.0        1.0
  1        10-1  1                                       0.0        1.0
  1        10-2  1                                       0.0        1.0
  1        11-1  1                                       0.0        1.0
  1        11-2  1                                       0.0        1.0
  1        12-1  1                                       0.0        1.0
  1        12-2  1                                       0.0        1.0
  1        13-1  1                                       0.0        1.0
  1        13-2  1                                       0.0        1.0
  1        14-1  1                                       0.0        1.0
  1        15-1  1                                       0.0        1.0
  1        16-1  1                                       0.0        1.0
  1        16-2  1                                       0.0        1.0
  1        17-1  1                                       0.0        1.0
  1        17-2  1                                       0.0        1.0
  1        18-1  1                                       0.0        1.0
  1        18-2  1                                       0.0        1.0
  1        19-1  1                                       0.0        1.0
  1        19-2  1                                       0.0        1.0
  1        20-1  1                                       0.0        1.0
  1        20-2  1                                       0.0        1.0
  1        21-1  1                                       0.0        1.0
  1        21-2  1                                       0.0        1.0
  1        22-1  1                                       0.0        1.0
  1        22-2  1                                       0.0        1.0
  1        23-1  1                                       0.0        1.0
  1        23-2  1                                       0.0        1.0
  1        24-1  1                                       0.0        1.0
  1        25-1  1                                       0.0        1.0
  1        25-2  1                                       0.0        1.0
  1        26-1  1                                       0.0        1.0
  1        27-1  1                                       0.0        1.0
  1        28-1  1                                       0.0        1.0
  1        29-1  1                                       0.0        1.0
  1        30-1  1                                       0.0        1.0
  1        31-1  1                                       0.0        1.0

