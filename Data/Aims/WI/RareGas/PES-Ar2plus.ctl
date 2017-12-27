# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./PES-Ar2plus           2     QChem

# The project description
__title__ ::
"============================= Ar-Ar ==============================="
"This is the set to generate potential energy surface of Ar-Ar."
"Reference data from J. F. Ogilvie J. Mole. Stru. 273(1992) 277-290."

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


# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .
<PATH2> = .


# The molecular set to batch: 
#               23 is the total number of jobs in this batch list
__batch__ :: 23
#"Flag"         "DIR"                         "InpName"       "JobType"
# Atoms 2 
 Ar_0           <PATH1>/EAtom                 Ar_0.in        energy 
 Ar_1           <PATH1>/EAtom                 Ar_1.in        energy 
# Ar2 PES 21
 Ar_2_0         <PATH2>/PES-Ar2plus         Ar_2_0.in         energy
 Ar_2_2         <PATH2>/PES-Ar2plus         Ar_2_2.in         energy
 Ar_2_4         <PATH2>/PES-Ar2plus         Ar_2_4.in         energy
 Ar_2_6         <PATH2>/PES-Ar2plus         Ar_2_6.in         energy
 Ar_2_8         <PATH2>/PES-Ar2plus         Ar_2_8.in         energy
 Ar_3_0         <PATH2>/PES-Ar2plus         Ar_3_0.in         energy
 Ar_3_2         <PATH2>/PES-Ar2plus         Ar_3_2.in         energy
 Ar_3_4         <PATH2>/PES-Ar2plus         Ar_3_4.in         energy
 Ar_3_6         <PATH2>/PES-Ar2plus         Ar_3_6.in         energy
 Ar_3_8         <PATH2>/PES-Ar2plus         Ar_3_8.in         energy
 Ar_4_0         <PATH2>/PES-Ar2plus         Ar_4_0.in         energy
 Ar_4_2         <PATH2>/PES-Ar2plus         Ar_4_2.in         energy
 Ar_4_4         <PATH2>/PES-Ar2plus         Ar_4_4.in         energy
 Ar_4_6         <PATH2>/PES-Ar2plus         Ar_4_6.in         energy
 Ar_4_8         <PATH2>/PES-Ar2plus         Ar_4_8.in         energy
 Ar_5_0         <PATH2>/PES-Ar2plus         Ar_5_0.in         energy
 Ar_5_2         <PATH2>/PES-Ar2plus         Ar_5_2.in         energy
 Ar_5_4         <PATH2>/PES-Ar2plus         Ar_5_4.in         energy
 Ar_5_6         <PATH2>/PES-Ar2plus         Ar_5_6.in         energy
 Ar_5_8         <PATH2>/PES-Ar2plus         Ar_5_8.in         energy
 Ar_6_0         <PATH2>/PES-Ar2plus         Ar_6_0.in         energy

# Training set for the atomization energy
#		21 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 21  627.51
#"Number" "Flag"     "Scale"                                 "Ref"    "Weight"
 3        Ar_2_0     1      Ar_0  -1   Ar_1  -1            116.16898  1.0
 3        Ar_2_2     1      Ar_0  -1   Ar_1  -1             55.77574  1.0
 3        Ar_2_4     1      Ar_0  -1   Ar_1  -1             26.05376  1.0
 3        Ar_2_6     1      Ar_0  -1   Ar_1  -1             11.68774  1.0
 3        Ar_2_8     1      Ar_0  -1   Ar_1  -1              4.90340  1.0
 3        Ar_3_0     1      Ar_0  -1   Ar_1  -1              1.80210  1.0
 3        Ar_3_2     1      Ar_0  -1   Ar_1  -1              0.45384  1.0
 3        Ar_3_4     1      Ar_0  -1   Ar_1  -1             -0.08267  1.0
 3        Ar_3_6     1      Ar_0  -1   Ar_1  -1             -0.25814  1.0
 3        Ar_3_8     1      Ar_0  -1   Ar_1  -1             -0.28318  1.0
 3        Ar_4_0     1      Ar_0  -1   Ar_1  -1             -0.25295  1.0
 3        Ar_4_2     1      Ar_0  -1   Ar_1  -1             -0.20827  1.0
 3        Ar_4_4     1      Ar_0  -1   Ar_1  -1             -0.16512  1.0
 3        Ar_4_6     1      Ar_0  -1   Ar_1  -1             -0.12865  1.0
 3        Ar_4_8     1      Ar_0  -1   Ar_1  -1             -0.09958  1.0
 3        Ar_5_0     1      Ar_0  -1   Ar_1  -1             -0.07704  1.0
 3        Ar_5_2     1      Ar_0  -1   Ar_1  -1             -0.05980  1.0
 3        Ar_5_4     1      Ar_0  -1   Ar_1  -1             -0.04666  1.0
 3        Ar_5_6     1      Ar_0  -1   Ar_1  -1             -0.03659  1.0
 3        Ar_5_8     1      Ar_0  -1   Ar_1  -1             -0.02877  1.0
 3        Ar_6_0     1      Ar_0  -1   Ar_1  -1             -0.02249  1.0

