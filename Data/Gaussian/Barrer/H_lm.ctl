# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./B3LYP           2              Gaussian

# The project description
__title__ ::
"This is the set of SPs in Hydrogen transfer reaction"

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) NoSymm Scf=Tight


# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1>   '.'


# The atomic set to batch: 
#                21 is the total number of jobs in this batch list
__batch__ :: 21
#"Flag"           "DIR"            "InpName"     "JobType"
1             <PATH1>/H_lm           1.com        energy 
2             <PATH1>/H_lm           2.com        energy 
3             <PATH1>/H_lm           3.com        energy 
4             <PATH1>/H_lm           4.com        energy 
5             <PATH1>/H_lm           5.com        energy 
6             <PATH1>/H_lm           6.com        energy 
7             <PATH1>/H_lm           7.com        energy 
8             <PATH1>/H_lm           8.com        energy 
9             <PATH1>/H_lm           9.com        energy 
10            <PATH1>/H_lm          10.com        energy 
11            <PATH1>/H_lm          11.com        energy 
12            <PATH1>/H_lm          12.com        energy 
13            <PATH1>/H_lm          13.com        energy 
14            <PATH1>/H_lm          14.com        energy 
15            <PATH1>/H_lm          15.com        energy 
16            <PATH1>/H_lm          16.com        energy 
17            <PATH1>/H_lm          17.com        energy 
18            <PATH1>/H_lm          18.com        energy 
19            <PATH1>/H_lm          19.com        energy 
20            <PATH1>/H_lm          20.com        energy 
21            <PATH1>/H_lm          21.com        energy 


# Training set for experimental atomic energy
#                21 is the total number of the testing energy data
#               1.0 is the scale factor from "a.u." to "a.u."
#                      which scales the calc. data in "a.u."
#                      to the ref. data in "a.u."
__energy__ ::   21     1.0
#"Number" "Flag" "Scale"  "Ref"  "Weight"
  1       1      1        0.0000   1.0 
  1       2      1        0.0000   1.0
  1       3      1        0.0000   1.0
  1       4      1        0.0000   1.0
  1       5      1        0.0000   1.0
  1       6      1        0.0000   1.0
  1       7      1        0.0000   1.0
  1       8      1        0.0000   1.0
  1       9      1        0.0000   1.0
  1       10     1        0.0000   1.0
  1       11     1        0.0000   1.0
  1       12     1        0.0000   1.0
  1       13     1        0.0000   1.0
  1       14     1        0.0000   1.0
  1       15     1        0.0000   1.0
  1       16     1        0.0000   1.0
  1       17     1        0.0000   1.0
  1       18     1        0.0000   1.0
  1       19     1        0.0000   1.0
  1       20     1        0.0000   1.0
  1       21     1        0.0000   1.0


