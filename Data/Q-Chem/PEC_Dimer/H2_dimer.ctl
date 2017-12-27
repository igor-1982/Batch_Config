# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./H2_dimer       2          QChem

# The project description
__title__ ::
"============================= H2-H2 ==============================="
" Reference data were calculated by CCSD(T)/aug-cc-pVQZ           "

# Machine and option keyword of Gaussian Package
__gaussian__ ::
#p ccsd(t)/aug-cc-pVQZ scf=tight

# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .


# The molecular set to batch: 
#               33 is the total number of jobs in this batch list
__batch__ :: 33
#"Flag"         "DIR"                         "InpName"       "JobType"
 H2             <PATH1>/H2_dimer              H2.com          energy
 H2_0_2         <PATH1>/H2_dimer              H2_0_2.in       energy
 H2_0_3         <PATH1>/H2_dimer              H2_0_3.in       energy
 H2_0_4         <PATH1>/H2_dimer              H2_0_4.in       energy
 H2_0_5         <PATH1>/H2_dimer              H2_0_5.in       energy
 H2_0_6         <PATH1>/H2_dimer              H2_0_6.in       energy
 H2_0_7         <PATH1>/H2_dimer              H2_0_7.in       energy
 H2_0_8         <PATH1>/H2_dimer              H2_0_8.in       energy
 H2_0_9         <PATH1>/H2_dimer              H2_0_9.in       energy
 H2_1_0         <PATH1>/H2_dimer              H2_1_0.in       energy
 H2_1_1         <PATH1>/H2_dimer              H2_1_1.in       energy
 H2_1_2         <PATH1>/H2_dimer              H2_1_2.in       energy
 H2_1_3         <PATH1>/H2_dimer              H2_1_3.in       energy
 H2_1_4         <PATH1>/H2_dimer              H2_1_4.in       energy
 H2_1_5         <PATH1>/H2_dimer              H2_1_5.in       energy
 H2_1_6         <PATH1>/H2_dimer              H2_1_6.in       energy
 H2_1_7         <PATH1>/H2_dimer              H2_1_7.in       energy
 H2_1_8         <PATH1>/H2_dimer              H2_1_8.in       energy
 H2_1_9         <PATH1>/H2_dimer              H2_1_9.in       energy
 H2_2_0         <PATH1>/H2_dimer              H2_2_0.in       energy
 H2_2_2         <PATH1>/H2_dimer              H2_2_2.in       energy
 H2_2_4         <PATH1>/H2_dimer              H2_2_4.in       energy
 H2_2_6         <PATH1>/H2_dimer              H2_2_6.in       energy
 H2_2_8         <PATH1>/H2_dimer              H2_2_8.in       energy
 H2_3_0         <PATH1>/H2_dimer              H2_3_0.in       energy
 H2_3_2         <PATH1>/H2_dimer              H2_3_2.in       energy
 H2_3_4         <PATH1>/H2_dimer              H2_3_4.in       energy
 H2_3_6         <PATH1>/H2_dimer              H2_3_6.in       energy
 H2_3_8         <PATH1>/H2_dimer              H2_3_8.in       energy
 H2_4_2         <PATH1>/H2_dimer              H2_4_2.in       energy
 H2_4_6         <PATH1>/H2_dimer              H2_4_6.in       energy
 H2_5_0         <PATH1>/H2_dimer              H2_5_0.in       energy
 H2_6_0         <PATH1>/H2_dimer              H2_6_0.in       energy

# Training set for the atomization energy
#       33 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 33  1.0
#"Number" "Flag"     "Scale"                                 "Ref"       "Weight"
 2         H2_0_2     1        H2   -2                       -0.15546645    1.0
 2         H2_0_3     1        H2   -2                       -0.16798407    1.0
 2         H2_0_4     1        H2   -2                       -0.17269549    1.0
 2         H2_0_5     1        H2   -2                       -0.17392928    1.0
 2         H2_0_6     1        H2   -2                       -0.17200743    1.0
 2         H2_0_7     1        H2   -2                       -0.16199823    1.0
 2         H2_0_8     1        H2   -2                       -0.11375545    1.0
 2         H2_0_9     1        H2   -2                       -0.14735649    1.0
 2         H2_1_0     1        H2   -2                       -0.05565932    1.0
 2         H2_1_1     1        H2   -2                       -0.08194259    1.0
 2         H2_1_2     1        H2   -2                       -0.03584206    1.0
 2         H2_1_3     1        H2   -2                       -0.02203175    1.0
 2         H2_1_4     1        H2   -2                       -0.01305196    1.0
 2         H2_1_5     1        H2   -2                       -0.00753252    1.0
 2         H2_1_6     1        H2   -2                       -0.00427712    1.0
 2         H2_1_7     1        H2   -2                       -0.00240904    1.0
 2         H2_1_8     1        H2   -2                       -0.00135465    1.0
 2         H2_1_9     1        H2   -2                       -0.00076472    1.0
 2         H2_2_0     1        H2   -2                       -0.00043577    1.0
 2         H2_2_2     1        H2   -2                       -0.00025228    1.0
 2         H2_2_4     1        H2   -2                       -0.00014935    1.0
 2         H2_2_6     1        H2   -2                       -0.00009094    1.0
 2         H2_2_8     1        H2   -2                       -0.00005717    1.0
 2         H2_3_0     1        H2   -2                       -0.00002508    1.0
 2         H2_3_2     1        H2   -2                       -0.00001272    1.0
 2         H2_3_4     1        H2   -2                       -0.00000730    1.0
 2         H2_3_6     1        H2   -2                       -0.00000451    1.0
 2         H2_3_8     1        H2   -2                       -0.00000297    1.0
 2         H2_4_2     1        H2   -2                       -0.00000197    1.0
 2         H2_4_6     1        H2   -2                       -0.00000134    1.0
 2         H2_5_0     1        H2   -2                       -0.00000095    1.0
 2         H2_6_0     1        H2   -2                       -0.00000070    1.0
