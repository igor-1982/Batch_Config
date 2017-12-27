# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./PES-He2plus           2     QChem

# The project description
__title__ ::
"=========================== He-He ============================"
"This is the set to generate potential energy surface of He-He."
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
#               25 is the total number of jobs in this batch list
__batch__ :: 25
#"Flag"         "DIR"                        "InpName"         "JobType"
# Atoms 2 
 He_0           <PATH1>/EAtom                He_0.in          energy 
 He_1           <PATH1>/EAtom                He_1.in          energy 
# He2 PES 23
 He_0_6         <PATH2>/PES-He2plus        He_0_6.in        energy
 He_0_8         <PATH2>/PES-He2plus        He_0_8.in        energy
 He_1_0         <PATH2>/PES-He2plus        He_1_0.in        energy
 He_1_2         <PATH2>/PES-He2plus        He_1_2.in        energy
 He_1_4         <PATH2>/PES-He2plus        He_1_4.in        energy
 He_1_6         <PATH2>/PES-He2plus        He_1_6.in        energy
 He_1_8         <PATH2>/PES-He2plus        He_1_8.in        energy
 He_2_0         <PATH2>/PES-He2plus        He_2_0.in        energy
 He_2_2         <PATH2>/PES-He2plus        He_2_2.in        energy
 He_2_4         <PATH2>/PES-He2plus        He_2_4.in        energy
 He_2_6         <PATH2>/PES-He2plus        He_2_6.in        energy
 He_2_8         <PATH2>/PES-He2plus        He_2_8.in        energy
 He_3_0         <PATH2>/PES-He2plus        He_3_0.in        energy
 He_3_2         <PATH2>/PES-He2plus        He_3_2.in        energy
 He_3_4         <PATH2>/PES-He2plus        He_3_4.in        energy
 He_3_6         <PATH2>/PES-He2plus        He_3_6.in        energy
 He_3_8         <PATH2>/PES-He2plus        He_3_8.in        energy
 He_4_0         <PATH2>/PES-He2plus        He_4_0.in        energy
 He_4_2         <PATH2>/PES-He2plus        He_4_2.in        energy
 He_4_4         <PATH2>/PES-He2plus        He_4_4.in        energy
 He_4_6         <PATH2>/PES-He2plus        He_4_6.in        energy
 He_4_8         <PATH2>/PES-He2plus        He_4_8.in        energy
 He_5_0         <PATH2>/PES-He2plus        He_5_0.in        energy

# Training set for the atomization energy
#		23 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 23  627.51
#"Number" "Flag"     "Scale"                                 "Ref"    "Weight"
 3        He_0_6     1      He_0  -1  He_1  -1          111.11131380   1.0
 3        He_0_8     1      He_0  -1  He_1  -1          -21.37478653   1.0
 3        He_1_0     1      He_0  -1  He_1  -1          -54.96204844   1.0
 3        He_1_2     1      He_0  -1  He_1  -1          -54.16376912   1.0
 3        He_1_4     1      He_0  -1  He_1  -1          -43.49199082   1.0
 3        He_1_6     1      He_0  -1  He_1  -1          -31.92974758   1.0
 3        He_1_8     1      He_0  -1  He_1  -1          -22.30500108   1.0
 3        He_2_0     1      He_0  -1  He_1  -1          -15.10800920   1.0
 3        He_2_2     1      He_0  -1  He_1  -1          -10.03149785   1.0
 3        He_2_4     1      He_0  -1  He_1  -1           -6.57832977   1.0
 3        He_2_6     1      He_0  -1  He_1  -1           -4.28492505   1.0
 3        He_2_8     1      He_0  -1  He_1  -1           -2.78518807   1.0
 3        He_3_0     1      He_0  -1  He_1  -1           -1.81289396   1.0
 3        He_3_2     1      He_0  -1  He_1  -1           -1.18486438   1.0
 3        He_3_4     1      He_0  -1  He_1  -1           -0.77928773   1.0
 3        He_3_6     1      He_0  -1  He_1  -1           -0.51669675   1.0
 3        He_3_8     1      He_0  -1  He_1  -1           -0.34576742   1.0
 3        He_4_0     1      He_0  -1  He_1  -1           -0.23355922   1.0
 3        He_4_2     1      He_0  -1  He_1  -1           -0.15903174   1.0
 3        He_4_4     1      He_0  -1  He_1  -1           -0.10879455   1.0
 3        He_4_6     1      He_0  -1  He_1  -1           -0.07433923   1.0
 3        He_4_8     1      He_0  -1  He_1  -1           -0.05025100   1.0
 3        He_5_0     1      He_0  -1  He_1  -1           -0.03306225   1.0


