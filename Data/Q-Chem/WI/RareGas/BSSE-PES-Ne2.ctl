# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./BSSE-PES-Ne2           2     QChem

# The project description
__title__ ::
"=========================== Ne-Ne ============================"
"This is the set to generate potential energy surface of Ne-Ne."
"Reference data from J. F. Ogilvie J. Mole. Stru. 273(1992) 277-290."


# Machine and option keyword of QChem Package
__qchem__ ::  1   rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static = 200
mem_total  = 7500
exchange = b3lyp
basis = G3Large
scf_convergence = 7
symmetry = false
xc_grid = 000075000302
$end

# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .
<PATH2> = .

# The molecular set to batch: 
#               23 is the total number of jobs in this batch list
__batch__ :: 22
#"Flag"         "DIR"                      "InpName"          "JobType"
# Ne2 PES 22
 Ne_3_091       <PATH2>/BSSE-PES-Ne2       Ne_3_091.in       energy
 Ne_2_0         <PATH2>/BSSE-PES-Ne2       Ne_2_0.in         energy
 Ne_2_2         <PATH2>/BSSE-PES-Ne2       Ne_2_2.in         energy
 Ne_2_4         <PATH2>/BSSE-PES-Ne2       Ne_2_4.in         energy
 Ne_2_6         <PATH2>/BSSE-PES-Ne2       Ne_2_6.in         energy
 Ne_2_8         <PATH2>/BSSE-PES-Ne2       Ne_2_8.in         energy
 Ne_3_0         <PATH2>/BSSE-PES-Ne2       Ne_3_0.in         energy
 Ne_3_2         <PATH2>/BSSE-PES-Ne2       Ne_3_2.in         energy
 Ne_3_4         <PATH2>/BSSE-PES-Ne2       Ne_3_4.in         energy
 Ne_3_6         <PATH2>/BSSE-PES-Ne2       Ne_3_6.in         energy
 Ne_3_8         <PATH2>/BSSE-PES-Ne2       Ne_3_8.in         energy
 Ne_4_0         <PATH2>/BSSE-PES-Ne2       Ne_4_0.in         energy
 Ne_4_2         <PATH2>/BSSE-PES-Ne2       Ne_4_2.in         energy
 Ne_4_4         <PATH2>/BSSE-PES-Ne2       Ne_4_4.in         energy
 Ne_4_6         <PATH2>/BSSE-PES-Ne2       Ne_4_6.in         energy
 Ne_4_8         <PATH2>/BSSE-PES-Ne2       Ne_4_8.in         energy
 Ne_5_0         <PATH2>/BSSE-PES-Ne2       Ne_5_0.in         energy
 Ne_5_2         <PATH2>/BSSE-PES-Ne2       Ne_5_2.in         energy
 Ne_5_4         <PATH2>/BSSE-PES-Ne2       Ne_5_4.in         energy
 Ne_5_6         <PATH2>/BSSE-PES-Ne2       Ne_5_6.in         energy
 Ne_5_8         <PATH2>/BSSE-PES-Ne2       Ne_5_8.in         energy
 Ne_6_0         <PATH2>/BSSE-PES-Ne2       Ne_6_0.in         energy

# Training set for the atomization energy
#		22 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 22  1.0
#"Number" "Flag"     "Scale"                                 "Ref"    "Weight"
 1        Ne_3_091   1                                       0.0000  1.0
 1        Ne_2_0     1                                       0.0000  1.0
 1        Ne_2_2     1                                       0.0000  1.0
 1        Ne_2_4     1                                       0.0000  1.0
 1        Ne_2_6     1                                       0.0000  1.0
 1        Ne_2_8     1                                       0.0000  1.0
 1        Ne_3_0     1                                       0.0000  1.0
 1        Ne_3_2     1                                       0.0000  1.0
 1        Ne_3_4     1                                       0.0000  1.0
 1        Ne_3_6     1                                       0.0000  1.0
 1        Ne_3_8     1                                       0.0000  1.0
 1        Ne_4_0     1                                       0.0000  1.0
 1        Ne_4_2     1                                       0.0000  1.0
 1        Ne_4_4     1                                       0.0000  1.0
 1        Ne_4_6     1                                       0.0000  1.0
 1        Ne_4_8     1                                       0.0000  1.0
 1        Ne_5_0     1                                       0.0000  1.0
 1        Ne_5_2     1                                       0.0000  1.0
 1        Ne_5_4     1                                       0.0000  1.0
 1        Ne_5_6     1                                       0.0000  1.0
 1        Ne_5_8     1                                       0.0000  1.0
 1        Ne_6_0     1                                       0.0000  1.0



