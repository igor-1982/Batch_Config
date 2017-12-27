# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#                "ProjDir"       "ProjCtrl"
__project__ ::   ./B3LYP-PES           2

# The project description
__title__ ::
"=========================== Ne-Ne ============================"
"This is the set to generate potential energy surface of Ne-Ne."
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
#               23 is the total number of jobs in this batch list
__batch__ :: 23
#"Flag"         "DIR"                      "InpName"          "JobType"
# Atoms 1 
 Ne_0           <PATH1>/EAtom              Ne_0.com           energy 
# Ne2 PES 22
 Ne_3_091       <PATH2>/PES-Ne2            Ne_3_091.com       energy
 Ne_2_0         <PATH2>/PES-Ne2            Ne_2_0.com         energy
 Ne_2_2         <PATH2>/PES-Ne2            Ne_2_2.com         energy
 Ne_2_4         <PATH2>/PES-Ne2            Ne_2_4.com         energy
 Ne_2_6         <PATH2>/PES-Ne2            Ne_2_6.com         energy
 Ne_2_8         <PATH2>/PES-Ne2            Ne_2_8.com         energy
 Ne_3_0         <PATH2>/PES-Ne2            Ne_3_0.com         energy
 Ne_3_2         <PATH2>/PES-Ne2            Ne_3_2.com         energy
 Ne_3_4         <PATH2>/PES-Ne2            Ne_3_4.com         energy
 Ne_3_6         <PATH2>/PES-Ne2            Ne_3_6.com         energy
 Ne_3_8         <PATH2>/PES-Ne2            Ne_3_8.com         energy
 Ne_4_0         <PATH2>/PES-Ne2            Ne_4_0.com         energy
 Ne_4_2         <PATH2>/PES-Ne2            Ne_4_2.com         energy
 Ne_4_4         <PATH2>/PES-Ne2            Ne_4_4.com         energy
 Ne_4_6         <PATH2>/PES-Ne2            Ne_4_6.com         energy
 Ne_4_8         <PATH2>/PES-Ne2            Ne_4_8.com         energy
 Ne_5_0         <PATH2>/PES-Ne2            Ne_5_0.com         energy
 Ne_5_2         <PATH2>/PES-Ne2            Ne_5_2.com         energy
 Ne_5_4         <PATH2>/PES-Ne2            Ne_5_4.com         energy
 Ne_5_6         <PATH2>/PES-Ne2            Ne_5_6.com         energy
 Ne_5_8         <PATH2>/PES-Ne2            Ne_5_8.com         energy
 Ne_6_0         <PATH2>/PES-Ne2            Ne_6_0.com         energy

# Training set for the atomization energy
#		22 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 22  627.51
#"Number" "Flag"     "Scale"                                 "Ref"    "Weight"
 2        Ne_3_091   1      Ne_0  -2                        -0.08400  1.0
 2        Ne_2_0     1      Ne_0  -2                         7.72979  1.0
 2        Ne_2_2     1      Ne_0  -2                         2.74070  1.0
 2        Ne_2_4     1      Ne_0  -2                         0.86533  1.0
 2        Ne_2_6     1      Ne_0  -2                         0.19285  1.0
 2        Ne_2_8     1      Ne_0  -2                        -0.02580  1.0
 2        Ne_3_0     1      Ne_0  -2                        -0.08047  1.0
 2        Ne_3_2     1      Ne_0  -2                        -0.08073  1.0
 2        Ne_3_4     1      Ne_0  -2                        -0.06639  1.0
 2        Ne_3_6     1      Ne_0  -2                        -0.05084  1.0
 2        Ne_3_8     1      Ne_0  -2                        -0.03786  1.0
 2        Ne_4_0     1      Ne_0  -2                        -0.02794  1.0
 2        Ne_4_2     1      Ne_0  -2                        -0.02064  1.0
 2        Ne_4_4     1      Ne_0  -2                        -0.01536  1.0
 2        Ne_4_6     1      Ne_0  -2                        -0.01156  1.0
 2        Ne_4_8     1      Ne_0  -2                        -0.00882  1.0
 2        Ne_5_0     1      Ne_0  -2                        -0.00684  1.0
 2        Ne_5_2     1      Ne_0  -2                        -0.00539  1.0
 2        Ne_5_4     1      Ne_0  -2                        -0.00432  1.0
 2        Ne_5_6     1      Ne_0  -2                        -0.00352  1.0
 2        Ne_5_8     1      Ne_0  -2                        -0.00291  1.0
 2        Ne_6_0     1      Ne_0  -2                        -0.00245  1.0



