# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#                "ProjDir"       "ProjCtrl"
__project__ ::   ./pccp1           2

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
<PATH2> = .


# The molecular set to batch: 
#               23 is the total number of jobs in this batch list
__batch__ :: 23
#"Flag"         "DIR"                         "InpName"       "JobType"
# Fraction 2
 pccp1_a        <PATH1>/pccp1              pccp1_a.com         energy 
 pccp1_b        <PATH1>/pccp1              pccp1_b.com         energy 
# pccp1 PES 21
 pccp1_eq       <PATH2>/pccp1             pccp1_eq.com         energy
 pccp1_15       <PATH2>/pccp1             pccp1_15.com         energy
 pccp1_16       <PATH2>/pccp1             pccp1_16.com         energy
 pccp1_17       <PATH2>/pccp1             pccp1_17.com         energy
 pccp1_18       <PATH2>/pccp1             pccp1_18.com         energy
 pccp1_19       <PATH2>/pccp1             pccp1_19.com         energy
 pccp1_20       <PATH2>/pccp1             pccp1_20.com         energy
 pccp1_21       <PATH2>/pccp1             pccp1_21.com         energy
 pccp1_22       <PATH2>/pccp1             pccp1_22.com         energy
 pccp1_23       <PATH2>/pccp1             pccp1_23.com         energy
 pccp1_24       <PATH2>/pccp1             pccp1_24.com         energy
 pccp1_26       <PATH2>/pccp1             pccp1_26.com         energy
 pccp1_28       <PATH2>/pccp1             pccp1_28.com         energy
 pccp1_30       <PATH2>/pccp1             pccp1_30.com         energy
 pccp1_32       <PATH2>/pccp1             pccp1_32.com         energy
 pccp1_34       <PATH2>/pccp1             pccp1_34.com         energy
 pccp1_36       <PATH2>/pccp1             pccp1_36.com         energy
 pccp1_38       <PATH2>/pccp1             pccp1_38.com         energy
 pccp1_42       <PATH2>/pccp1             pccp1_42.com         energy
 pccp1_46       <PATH2>/pccp1             pccp1_46.com         energy
 pccp1_50       <PATH2>/pccp1             pccp1_50.com         energy

# Training set for the atomization energy
#		21 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 21  627.51
#"Number" "Flag"     "Scale"                                 "Ref"    "Weight"
 3        pccp1_eq    1      pccp1_a  -1  pccp1_b  -1        -16.37    1.0
 3        pccp1_15    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_16    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_17    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_18    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_19    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_20    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_21    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_22    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_23    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_24    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_26    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_28    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_30    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_32    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_34    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_36    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_38    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_42    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_46    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0
 3        pccp1_50    1      pccp1_a  -1  pccp1_b  -1        0.0000    1.0

