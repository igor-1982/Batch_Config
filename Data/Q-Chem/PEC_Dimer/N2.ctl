# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./N2              2          QChem

# The project description
__title__ ::
"============================= N-N ==============================="
" Reference data were calculated by CCSD(T)/aug-cc-pV5Z           "

# Machine and option keyword of QChem Package
__qchem__ ::   1 rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
exchange = b3lyp
basis = 6-311+g(3df,2p)
scf_convergence = 8
xc_grid = 000075000194
$end


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/home/wenxinzy/export/softs/Batch_Config/Data/QChem/PEC_Dimer'


# The molecular set to batch: 
#               27 is the total number of jobs in this batch list
__batch__ :: 27
#"Flag"         "DIR"                         "InpName"       "JobType"
  N             <PATH1>/N2                    N.in           energy
  N2_0_6        <PATH1>/N2                    N2_0_6.in      energy
  N2_0_7        <PATH1>/N2                    N2_0_7.in      energy
  N2_0_8        <PATH1>/N2                    N2_0_8.in      energy
  N2_0_9        <PATH1>/N2                    N2_0_9.in      energy
  N2_0_9_5      <PATH1>/N2                    N2_0_9_5.in    energy
  N2_1_0        <PATH1>/N2                    N2_1_0.in      energy
  N2_1_0_5      <PATH1>/N2                    N2_1_0_5.in    energy
  N2_1_1        <PATH1>/N2                    N2_1_1.in      energy
  N2_1_1_5      <PATH1>/N2                    N2_1_1_5.in    energy
  N2_1_2        <PATH1>/N2                    N2_1_2.in      energy
  N2_1_3        <PATH1>/N2                    N2_1_3.in      energy
  N2_1_4        <PATH1>/N2                    N2_1_4.in      energy
  N2_1_5        <PATH1>/N2                    N2_1_5.in      energy
  N2_1_6        <PATH1>/N2                    N2_1_6.in      energy
  N2_1_8        <PATH1>/N2                    N2_1_8.in      energy
  N2_2_0        <PATH1>/N2                    N2_2_0.in      energy
  N2_2_2        <PATH1>/N2                    N2_2_2.in      energy
  N2_2_4        <PATH1>/N2                    N2_2_4.in      energy
  N2_2_6        <PATH1>/N2                    N2_2_6.in      energy
  N2_2_8        <PATH1>/N2                    N2_2_8.in      energy
  N2_3_0        <PATH1>/N2                    N2_3_0.in      energy
  N2_3_4        <PATH1>/N2                    N2_3_4.in      energy
  N2_3_8        <PATH1>/N2                    N2_3_8.in      energy
  N2_4_2        <PATH1>/N2                    N2_4_2.in      energy
  N2_4_6        <PATH1>/N2                    N2_4_6.in      energy
  N2_5_0        <PATH1>/N2                    N2_5_0.in      energy

# Training set for the atomization energy
#       26 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 26  1.0
#"Number" "Flag"     "Scale"                                 "Ref"       "Weight"
 2         N2_0_6     1         N  -2                        -0.16798407    1.0
 2         N2_0_7     1         N  -2                        -0.17269549    1.0
 2         N2_0_8     1         N  -2                        -0.17392928    1.0
 2         N2_0_9     1         N  -2                        -0.17200743    1.0
 2         N2_0_9_5   1         N  -2                        -0.16199823    1.0
 2         N2_1_0     1         N  -2                        -0.14735649    1.0
 2         N2_1_0_5   1         N  -2                        -0.11375545    1.0
 2         N2_1_1     1         N  -2                        -0.08194259    1.0
 2         N2_1_1_5   1         N  -2                        -0.05565932    1.0
 2         N2_1_2     1         N  -2                        -0.03584206    1.0
 2         N2_1_3     1         N  -2                        -0.02203175    1.0
 2         N2_1_4     1         N  -2                        -0.01305196    1.0
 2         N2_1_5     1         N  -2                        -0.00753252    1.0
 2         N2_1_6     1         N  -2                        -0.00427712    1.0
 2         N2_1_8     1         N  -2                        -0.00240904    1.0
 2         N2_2_0     1         N  -2                        -0.00135465    1.0
 2         N2_2_2     1         N  -2                        -0.00076472    1.0
 2         N2_2_4     1         N  -2                        -0.00043577    1.0
 2         N2_2_6     1         N  -2                        -0.00025228    1.0
 2         N2_2_8     1         N  -2                        -0.00014935    1.0
 2         N2_3_0     1         N  -2                        -0.00009094    1.0
 2         N2_3_4     1         N  -2                        -0.00005717    1.0
 2         N2_3_8     1         N  -2                        -0.00002508    1.0
 2         N2_4_2     1         N  -2                        -0.00001272    1.0
 2         N2_4_6     1         N  -2                        -0.00000730    1.0
 2         N2_5_0     1         N  -2                        -0.00000451    1.0
