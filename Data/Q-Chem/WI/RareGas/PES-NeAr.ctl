# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./PES-NeAr           2     QChem

# The project description
__title__ ::
"=========================== Ne-Ar ============================"
"This is the set to generate potential energy surface of He-Ne."
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
#               24 is the total number of jobs in this batch list
__batch__ :: 24
#"Flag"           "DIR"                        "InpName"       "JobType"
# Atoms 2 
 Ne_0             <PATH1>/EAtom                Ne_0.in         energy 
 Ar_0             <PATH1>/EAtom                Ar_0.in         energy 
# NeAr2 PES 22
 NeAr_3_4889      <PATH2>/PES-NeAr             NeAr_3_4889.in  energy
 NeAr_2_0         <PATH2>/PES-NeAr             NeAr_2_0.in     energy
 NeAr_2_2         <PATH2>/PES-NeAr             NeAr_2_2.in     energy
 NeAr_2_4         <PATH2>/PES-NeAr             NeAr_2_4.in     energy
 NeAr_2_6         <PATH2>/PES-NeAr             NeAr_2_6.in     energy
 NeAr_2_8         <PATH2>/PES-NeAr             NeAr_2_8.in     energy
 NeAr_3_0         <PATH2>/PES-NeAr             NeAr_3_0.in     energy
 NeAr_3_2         <PATH2>/PES-NeAr             NeAr_3_2.in     energy
 NeAr_3_4         <PATH2>/PES-NeAr             NeAr_3_4.in     energy
 NeAr_3_6         <PATH2>/PES-NeAr             NeAr_3_6.in     energy
 NeAr_3_8         <PATH2>/PES-NeAr             NeAr_3_8.in     energy
 NeAr_4_0         <PATH2>/PES-NeAr             NeAr_4_0.in     energy
 NeAr_4_2         <PATH2>/PES-NeAr             NeAr_4_2.in     energy
 NeAr_4_4         <PATH2>/PES-NeAr             NeAr_4_4.in     energy
 NeAr_4_6         <PATH2>/PES-NeAr             NeAr_4_6.in     energy
 NeAr_4_8         <PATH2>/PES-NeAr             NeAr_4_8.in     energy
 NeAr_5_0         <PATH2>/PES-NeAr             NeAr_5_0.in     energy
 NeAr_5_2         <PATH2>/PES-NeAr             NeAr_5_2.in     energy
 NeAr_5_4         <PATH2>/PES-NeAr             NeAr_5_4.in     energy
 NeAr_5_6         <PATH2>/PES-NeAr             NeAr_5_6.in     energy
 NeAr_5_8         <PATH2>/PES-NeAr             NeAr_5_8.in     energy
 NeAr_6_0         <PATH2>/PES-NeAr             NeAr_6_0.in     energy

# Training set for the atomization energy
#		22 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 22  627.51
#"Number" "Flag"     "Scale"                              "Ref"       "Weight"
 3        NeAr_3_4889  1      Ar_0  -1  Ne_0  -1         -0.13431     1.0
 3        NeAr_2_0     1      Ar_0  -1  Ne_0  -1         30.56674     1.0
 3        NeAr_2_2     1      Ar_0  -1  Ne_0  -1         13.43273     1.0
 3        NeAr_2_4     1      Ar_0  -1  Ne_0  -1          5.70293     1.0
 3        NeAr_2_6     1      Ar_0  -1  Ne_0  -1          2.26053     1.0
 3        NeAr_2_8     1      Ar_0  -1  Ne_0  -1          0.76969     1.0
 3        NeAr_3_0     1      Ar_0  -1  Ne_0  -1          0.15778     1.0
 3        NeAr_3_2     1      Ar_0  -1  Ne_0  -1         -0.06750     1.0
 3        NeAr_3_4     1      Ar_0  -1  Ne_0  -1         -0.13008     1.0
 3        NeAr_3_6     1      Ar_0  -1  Ne_0  -1         -0.12978     1.0
 3        NeAr_3_8     1      Ar_0  -1  Ne_0  -1         -0.10944     1.0
 3        NeAr_4_0     1      Ar_0  -1  Ne_0  -1         -0.08617     1.0
 3        NeAr_4_2     1      Ar_0  -1  Ne_0  -1         -0.06587     1.0
 3        NeAr_4_4     1      Ar_0  -1  Ne_0  -1         -0.04985     1.0
 3        NeAr_4_6     1      Ar_0  -1  Ne_0  -1         -0.03775     1.0
 3        NeAr_4_8     1      Ar_0  -1  Ne_0  -1         -0.02874     1.0
 3        NeAr_5_0     1      Ar_0  -1  Ne_0  -1         -0.02205     1.0
 3        NeAr_5_2     1      Ar_0  -1  Ne_0  -1         -0.01705     1.0
 3        NeAr_5_4     1      Ar_0  -1  Ne_0  -1         -0.01326     1.0
 3        NeAr_5_6     1      Ar_0  -1  Ne_0  -1         -0.01036     1.0
 3        NeAr_5_8     1      Ar_0  -1  Ne_0  -1         -0.00813     1.0
 3        NeAr_6_0     1      Ar_0  -1  Ne_0  -1         -0.00641     1.0

