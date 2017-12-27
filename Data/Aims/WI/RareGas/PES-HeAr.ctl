# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./PES-HeAr           2     QChem

# The project description
__title__ ::
"=========================== He-Ar ============================"
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
 He_0             <PATH1>/EAtom                He_0.in         energy 
 Ar_0             <PATH1>/EAtom                Ar_0.in         energy 
# HeAr2 PES 22
 HeAr_3_4804      <PATH2>/PES-HeAr             HeAr_3_4804.in  energy
 HeAr_2_0         <PATH2>/PES-HeAr             HeAr_2_0.in     energy
 HeAr_2_2         <PATH2>/PES-HeAr             HeAr_2_2.in     energy
 HeAr_2_4         <PATH2>/PES-HeAr             HeAr_2_4.in     energy
 HeAr_2_6         <PATH2>/PES-HeAr             HeAr_2_6.in     energy
 HeAr_2_8         <PATH2>/PES-HeAr             HeAr_2_8.in     energy
 HeAr_3_0         <PATH2>/PES-HeAr             HeAr_3_0.in     energy
 HeAr_3_2         <PATH2>/PES-HeAr             HeAr_3_2.in     energy
 HeAr_3_4         <PATH2>/PES-HeAr             HeAr_3_4.in     energy
 HeAr_3_6         <PATH2>/PES-HeAr             HeAr_3_6.in     energy
 HeAr_3_8         <PATH2>/PES-HeAr             HeAr_3_8.in     energy
 HeAr_4_0         <PATH2>/PES-HeAr             HeAr_4_0.in     energy
 HeAr_4_2         <PATH2>/PES-HeAr             HeAr_4_2.in     energy
 HeAr_4_4         <PATH2>/PES-HeAr             HeAr_4_4.in     energy
 HeAr_4_6         <PATH2>/PES-HeAr             HeAr_4_6.in     energy
 HeAr_4_8         <PATH2>/PES-HeAr             HeAr_4_8.in     energy
 HeAr_5_0         <PATH2>/PES-HeAr             HeAr_5_0.in     energy
 HeAr_5_2         <PATH2>/PES-HeAr             HeAr_5_2.in     energy
 HeAr_5_4         <PATH2>/PES-HeAr             HeAr_5_4.in     energy
 HeAr_5_6         <PATH2>/PES-HeAr             HeAr_5_6.in     energy
 HeAr_5_8         <PATH2>/PES-HeAr             HeAr_5_8.in     energy
 HeAr_6_0         <PATH2>/PES-HeAr             HeAr_6_0.in     energy

# Training set for the atomization energy
#		22 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 22  627.51
#"Number" "Flag"     "Scale"                              "Ref"       "Weight"
 3        HeAr_3_4804  1      Ar_0  -1  He_0  -1         -0.05748     1.0
 3        HeAr_2_0     1      Ar_0  -1  He_0  -1         15.68741     1.0
 3        HeAr_2_2     1      Ar_0  -1  He_0  -1          6.57726     1.0
 3        HeAr_2_4     1      Ar_0  -1  He_0  -1          2.66445     1.0
 3        HeAr_2_6     1      Ar_0  -1  He_0  -1          1.00939     1.0
 3        HeAr_2_8     1      Ar_0  -1  He_0  -1          0.32844     1.0
 3        HeAr_3_0     1      Ar_0  -1  He_0  -1          0.06226     1.0
 3        HeAr_3_2     1      Ar_0  -1  He_0  -1         -0.03135     1.0
 3        HeAr_3_4     1      Ar_0  -1  He_0  -1         -0.05606     1.0
 3        HeAr_3_6     1      Ar_0  -1  He_0  -1         -0.05535     1.0
 3        HeAr_3_8     1      Ar_0  -1  He_0  -1         -0.04684     1.0
 3        HeAr_4_0     1      Ar_0  -1  He_0  -1         -0.03725     1.0
 3        HeAr_4_2     1      Ar_0  -1  He_0  -1         -0.02883     1.0
 3        HeAr_4_4     1      Ar_0  -1  He_0  -1         -0.02207     1.0
 3        HeAr_4_6     1      Ar_0  -1  He_0  -1         -0.01687     1.0
 3        HeAr_4_8     1      Ar_0  -1  He_0  -1         -0.01294     1.0
 3        HeAr_5_0     1      Ar_0  -1  He_0  -1         -0.01000     1.0
 3        HeAr_5_2     1      Ar_0  -1  He_0  -1         -0.00780     1.0
 3        HeAr_5_4     1      Ar_0  -1  He_0  -1         -0.00615     1.0
 3        HeAr_5_6     1      Ar_0  -1  He_0  -1         -0.00490     1.0
 3        HeAr_5_8     1      Ar_0  -1  He_0  -1         -0.00394     1.0
 3        HeAr_6_0     1      Ar_0  -1  He_0  -1         -0.00320     1.0

