# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#                "ProjDir"       "ProjCtrl"
__project__ ::   ./S22           2

# The project description
__title__ ::
"=========================1_adenine_thymine_wc =========================="
"This is the set to generate potential energy along specified coordinate."
"  1_adenine_thymine_wc    c1   -16.37 kcal/mol                          "
"========================================================================"

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) Scf=Tight


# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .


# The molecular set to batch: 
#               N is the total number of jobs in this batch list
__batch__ :: N
#"Flag"         "DIR"                         "InpName"       "JobType"
# Fraction 2
 pccp1_a        <PATH1>/pccp1              pccp1_a.com         energy 
 pccp1_b        <PATH1>/pccp1              pccp1_b.com         energy 
# s22 22
 pccp1_eq       <PATH1>/pccp1              pccp1_eq.com        energy

# Training set for the atomization energy
#		22 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 22  627.51
#"Number" "Flag"     "Scale"                                 "Ref"    "Weight"
 3        pccp1_eq    1      pccp1_a  -1  pccp1_b  -1        -16.37    1.0
