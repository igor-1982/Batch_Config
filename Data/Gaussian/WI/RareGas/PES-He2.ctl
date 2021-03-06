# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#                "ProjDir"       "ProjCtrl"
__project__ ::   ./B3LYP-PES           2

# The project description
__title__ ::
"=========================== He-He ============================"
"This is the set to generate potential energy surface of He-He."
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
#               18 is the total number of jobs in this batch list
__batch__ :: 18
#"Flag"         "DIR"                        "InpName"         "JobType"
# Atoms 1 
 He_0           <PATH1>/EAtom                He_0.com          energy 
# He2 PES 17
 He_2_9695      <PATH2>/PES-He2              He_2_9695.com     energy
 He_2_0         <PATH2>/PES-He2              He_2_0.com        energy
 He_2_2         <PATH2>/PES-He2              He_2_2.com        energy
 He_2_4         <PATH2>/PES-He2              He_2_4.com        energy
 He_2_6         <PATH2>/PES-He2              He_2_6.com        energy
 He_2_8         <PATH2>/PES-He2              He_2_8.com        energy
 He_3_0         <PATH2>/PES-He2              He_3_0.com        energy
 He_3_2         <PATH2>/PES-He2              He_3_2.com        energy
 He_3_4         <PATH2>/PES-He2              He_3_4.com        energy
 He_3_6         <PATH2>/PES-He2              He_3_6.com        energy
 He_3_8         <PATH2>/PES-He2              He_3_8.com        energy
 He_4_0         <PATH2>/PES-He2              He_4_0.com        energy
 He_4_2         <PATH2>/PES-He2              He_4_2.com        energy
 He_4_4         <PATH2>/PES-He2              He_4_4.com        energy
 He_4_6         <PATH2>/PES-He2              He_4_6.com        energy
 He_4_8         <PATH2>/PES-He2              He_4_8.com        energy
 He_5_0         <PATH2>/PES-He2              He_5_0.com        energy

# Training set for the atomization energy
#		17 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 17  627.51
#"Number" "Flag"     "Scale"                                 "Ref"    "Weight"
 2        He_2_9695  1      He_0  -2                        -0.02180  1.0
 2        He_2_0     1      He_0  -2                         1.06988  1.0
 2        He_2_2     1      He_0  -2                         0.36682  1.0
 2        He_2_4     1      He_0  -2                         0.10123  1.0
 2        He_2_6     1      He_0  -2                         0.00895  1.0
 2        He_2_8     1      He_0  -2                        -0.01784  1.0
 2        He_3_0     1      He_0  -2                        -0.02172  1.0
 2        He_3_2     1      He_0  -2                        -0.01875  1.0
 2        He_3_4     1      He_0  -2                        -0.01455  1.0
 2        He_3_6     1      He_0  -2                        -0.01085  1.0
 2        He_3_8     1      He_0  -2                        -0.00798  1.0
 2        He_4_0     1      He_0  -2                        -0.00586  1.0
 2        He_4_2     1      He_0  -2                        -0.00435  1.0
 2        He_4_4     1      He_0  -2                        -0.00329  1.0
 2        He_4_6     1      He_0  -2                        -0.00260  1.0
 2        He_4_8     1      He_0  -2                        -0.00221  1.0
 2        He_5_0     1      He_0  -2                        -0.00211  1.0



