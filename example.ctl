# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job if none corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./example           2            QChem

# The project description
__title__ ::
"This is just an example of the batch"


# Machine and option keyword of Gaussian Package
__gaussian__ ::    # Following lines are machine and option keywords of Gau-Softs
%nproc=4
%mem=1000MB
#P BLYP/sto-3g nosymm


# $rem group of Q-Chem Package
__qchem__ ::    # Following lines are machine and option keywords of Gau-Softs
$rem
exchange = b3lyp
basis = 6-311+g(3df,2p)
scf_convergence = 8
xc_grid = 000075000194
$end

# Specify macro path in the batch list
__macro_path__ ::
<PATH1> = '~/example1'
<PATH2> = '~/example2'
<PATH3> = '~/example3'


# The molecular set to batch: 
#               3 is the total number of jobs in this batch list

__batch__ :: 3
#"Flag" 	"DIR"			"InpName" 	"JobType"
  PNA 		<PATH1>/Polar	 	PNA.com 	energy|polar 
  ANS		<PATH2>/Polar		ANS.com		energy|polar
  C2H2_5	<PATH3>/Polar		C2H2_5.com	energy|polar

# Training set for elec. resp. property
#               2 is the total number of data in this training set
#   "1.0 1.0 1.0" is the scale list to scales dipole, polarizability and
#                    hyperpolarizability from the unit of calc. data
#                    to the unit of ref. data
__polar__ :: 2  1.0 1.0 1.0
#"Number" "Flag"  "a)" "Ref" "Weight" "a)" "Ref" "Weight" "a)" "Ref"  "Weight"
  3       PNA     X    1.0   1.0      XX   1.0   1.0      XXX  1.0    1.0
  3       ANS     X    1.0   1.0      XX   1.0   1.0      XXX  1.0    1.0
# a): the response direction for elec. resp. property

# Training set for energy
#               1 is the total number of data in this training set	
#             1.0 is the scale factor from "a.u." to "a.u."
#                    which scales the calc. data in "a.u."
#                    to the ref. data in "a.u."
#          627.51 is the scale factor from "a.u." to "kcal/mol",
#                    which scales the calc. result in "a.u."
#                    to the ref. data in "kcal/mol"
#__energy__ :: 1     1.0
#__energy__ :: 1   627.5


__energy__ :: 1  627.5
#"Number" "Flag" "Scale" "Flag"  "Scale"  "Flag"  "Scale"  "Ref"   "Weight"
  3        PNA    1      C2H2_5  -1       ANS     2        30.23   1.0


