# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#                "ProjDir"       "ProjCtrl"
__project__ ::   ./B3LYP-PES           2

# The project description
__title__ ::
"=========================== He-Ne ============================"
"This is the set to generate potential energy surface of He-Ne."
"Reference data from J. F. Ogilvie J. Mole. Stru. 273(1992) 277-290."


# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
#P B3LYP/6-311++G(3df,2p) Scf=Tight

# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .
<PATH2> = .

# The molecular set to batch: 
#               24 is the total number of jobs in this batch list
__batch__ :: 24
#"Flag"           "DIR"                        "InpName"       "JobType"
# Atoms 2 
 He_0             <PATH1>/EAtom                He_0.com         energy 
 Ne_0             <PATH1>/EAtom                Ne_0.com         energy 
# HeNe2 PES 22
 HeNe_3_0309      <PATH2>/PES-HeNe             HeNe_3_0309.com  energy
 HeNe_2_0         <PATH2>/PES-HeNe             HeNe_2_0.com     energy
 HeNe_2_2         <PATH2>/PES-HeNe             HeNe_2_2.com     energy
 HeNe_2_4         <PATH2>/PES-HeNe             HeNe_2_4.com     energy
 HeNe_2_6         <PATH2>/PES-HeNe             HeNe_2_6.com     energy
 HeNe_2_8         <PATH2>/PES-HeNe             HeNe_2_8.com     energy
 HeNe_3_0         <PATH2>/PES-HeNe             HeNe_3_0.com     energy
 HeNe_3_2         <PATH2>/PES-HeNe             HeNe_3_2.com     energy
 HeNe_3_4         <PATH2>/PES-HeNe             HeNe_3_4.com     energy
 HeNe_3_6         <PATH2>/PES-HeNe             HeNe_3_6.com     energy
 HeNe_3_8         <PATH2>/PES-HeNe             HeNe_3_8.com     energy
 HeNe_4_0         <PATH2>/PES-HeNe             HeNe_4_0.com     energy
 HeNe_4_2         <PATH2>/PES-HeNe             HeNe_4_2.com     energy
 HeNe_4_4         <PATH2>/PES-HeNe             HeNe_4_4.com     energy
 HeNe_4_6         <PATH2>/PES-HeNe             HeNe_4_6.com     energy
 HeNe_4_8         <PATH2>/PES-HeNe             HeNe_4_8.com     energy
 HeNe_5_0         <PATH2>/PES-HeNe             HeNe_5_0.com     energy
 HeNe_5_2         <PATH2>/PES-HeNe             HeNe_5_2.com     energy
 HeNe_5_4         <PATH2>/PES-HeNe             HeNe_5_4.com     energy
 HeNe_5_6         <PATH2>/PES-HeNe             HeNe_5_6.com     energy
 HeNe_5_8         <PATH2>/PES-HeNe             HeNe_5_8.com     energy
 HeNe_6_0         <PATH2>/PES-HeNe             HeNe_6_0.com     energy

# Training set for the atomization energy
#		22 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 22  627.51
#"Number" "Flag"     "Scale"                                 "Ref"    "Weight"
 3        HeNe_3_0309  1      Ne_0  -1  He_0  -1         -0.04113     1.0
 3        HeNe_2_0     1      Ne_0  -1  He_0  -1          2.70060     1.0
 3        HeNe_2_2     1      Ne_0  -1  He_0  -1          0.95019     1.0
 3        HeNe_2_4     1      Ne_0  -1  He_0  -1          0.28563     1.0
 3        HeNe_2_6     1      Ne_0  -1  He_0  -1          0.04865     1.0
 3        HeNe_2_8     1      Ne_0  -1  He_0  -1         -0.02544     1.0
 3        HeNe_3_0     1      Ne_0  -1  He_0  -1         -0.04095     1.0
 3        HeNe_3_2     1      Ne_0  -1  He_0  -1         -0.03767     1.0
 3        HeNe_3_4     1      Ne_0  -1  He_0  -1         -0.02999     1.0
 3        HeNe_3_6     1      Ne_0  -1  He_0  -1         -0.02260     1.0
 3        HeNe_3_8     1      Ne_0  -1  He_0  -1         -0.01668     1.0
 3        HeNe_4_0     1      Ne_0  -1  He_0  -1         -0.01226     1.0
 3        HeNe_4_2     1      Ne_0  -1  He_0  -1         -0.00905     1.0
 3        HeNe_4_4     1      Ne_0  -1  He_0  -1         -0.00675     1.0
 3        HeNe_4_6     1      Ne_0  -1  He_0  -1         -0.00509     1.0
 3        HeNe_4_8     1      Ne_0  -1  He_0  -1         -0.00390     1.0
 3        HeNe_5_0     1      Ne_0  -1  He_0  -1         -0.00303     1.0
 3        HeNe_5_2     1      Ne_0  -1  He_0  -1         -0.00239     1.0
 3        HeNe_5_4     1      Ne_0  -1  He_0  -1         -0.00190     1.0
 3        HeNe_5_6     1      Ne_0  -1  He_0  -1         -0.00153     1.0
 3        HeNe_5_8     1      Ne_0  -1  He_0  -1         -0.00124     1.0
 3        HeNe_6_0     1      Ne_0  -1  He_0  -1         -0.00101     1.0

