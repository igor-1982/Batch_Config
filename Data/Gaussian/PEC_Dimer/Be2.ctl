# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./Be2              2         Gaussian

# The project description
__title__ ::
"============================= Be-Be ==============================="
" Reference data were calculated by CCSD(T)/aug-cc-pVQZ           "

# Machine and option keyword of Gaussian Package                                                                                                               
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=56000MB
#P ccsd(t)/aug-cc-pV5Z NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/home/wenxinzy/export/softs/Batch_Config/Data/Gaussian/PEC_Dimer'


# The molecular set to batch: 
#               32 is the total number of jobs in this batch list
__batch__ :: 32
#"Flag"         "DIR"                         "InpName"       "JobType"
 Be             <PATH1>/Be2                      Be.com       energy
 Be2_1_8        <PATH1>/Be2                 Be2_1_8.com       energy
 Be2_2_0        <PATH1>/Be2                 Be2_2_0.com       energy
 Be2_2_2        <PATH1>/Be2                 Be2_2_2.com       energy
 Be2_2_3        <PATH1>/Be2                 Be2_2_3.com       energy
 Be2_2_4        <PATH1>/Be2                 Be2_2_4.com       energy
 Be2_2_5        <PATH1>/Be2                 Be2_2_5.com       energy
 Be2_2_6        <PATH1>/Be2                 Be2_2_6.com       energy
 Be2_2_6_5      <PATH1>/Be2               Be2_2_6_5.com       energy
 Be2_2_7        <PATH1>/Be2                 Be2_2_7.com       energy
 Be2_2_7_5      <PATH1>/Be2               Be2_2_7_5.com       energy
 Be2_2_8        <PATH1>/Be2                 Be2_2_8.com       energy
 Be2_2_9        <PATH1>/Be2                 Be2_2_9.com       energy
 Be2_3_0        <PATH1>/Be2                 Be2_3_0.com       energy
 Be2_3_1        <PATH1>/Be2                 Be2_3_1.com       energy
 Be2_3_2        <PATH1>/Be2                 Be2_3_2.com       energy
 Be2_3_4        <PATH1>/Be2                 Be2_3_4.com       energy
 Be2_3_6        <PATH1>/Be2                 Be2_3_6.com       energy
 Be2_3_8        <PATH1>/Be2                 Be2_3_8.com       energy
 Be2_4_0        <PATH1>/Be2                 Be2_4_0.com       energy
 Be2_4_2        <PATH1>/Be2                 Be2_4_2.com       energy
 Be2_4_4        <PATH1>/Be2                 Be2_4_4.com       energy
 Be2_4_6        <PATH1>/Be2                 Be2_4_6.com       energy
 Be2_4_8        <PATH1>/Be2                 Be2_4_8.com       energy
 Be2_5_0        <PATH1>/Be2                 Be2_5_0.com       energy
 Be2_5_4        <PATH1>/Be2                 Be2_5_4.com       energy
 Be2_5_8        <PATH1>/Be2                 Be2_5_8.com       energy
 Be2_6_2        <PATH1>/Be2                 Be2_6_2.com       energy
 Be2_6_6        <PATH1>/Be2                 Be2_6_6.com       energy
 Be2_7_0        <PATH1>/Be2                 Be2_7_0.com       energy
 Be2_7_4        <PATH1>/Be2                 Be2_7_4.com       energy
 Be2_7_8        <PATH1>/Be2                 Be2_7_8.com       energy

# Training set for the atomization energy
#       31 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 31  1.0
#"Number" "Flag"     "Scale"                                 "Ref"       "Weight"
 2         Be2_1_8     1        Be   -2                       -0.15546645    1.0
 2         Be2_2_0     1        Be   -2                       -0.16798407    1.0
 2         Be2_2_2     1        Be   -2                       -0.17269549    1.0
 2         Be2_2_3     1        Be   -2                       -0.17392928    1.0
 2         Be2_2_4     1        Be   -2                       -0.17200743    1.0
 2         Be2_2_5     1        Be   -2                       -0.16199823    1.0
 2         Be2_2_6     1        Be   -2                       -0.11375545    1.0
 2         Be2_2_6_5   1        Be   -2                       -0.14735649    1.0
 2         Be2_2_7     1        Be   -2                       -0.05565932    1.0
 2         Be2_2_7_5   1        Be   -2                       -0.08194259    1.0
 2         Be2_2_8     1        Be   -2                       -0.03584206    1.0
 2         Be2_2_9     1        Be   -2                       -0.02203175    1.0
 2         Be2_3_0     1        Be   -2                       -0.01305196    1.0
 2         Be2_3_1     1        Be   -2                       -0.00753252    1.0
 2         Be2_3_2     1        Be   -2                       -0.00427712    1.0
 2         Be2_3_4     1        Be   -2                       -0.00240904    1.0
 2         Be2_3_6     1        Be   -2                       -0.00135465    1.0
 2         Be2_3_8     1        Be   -2                       -0.00076472    1.0
 2         Be2_4_0     1        Be   -2                       -0.00043577    1.0
 2         Be2_4_2     1        Be   -2                       -0.00025228    1.0
 2         Be2_4_4     1        Be   -2                       -0.00014935    1.0
 2         Be2_4_6     1        Be   -2                       -0.00009094    1.0
 2         Be2_4_8     1        Be   -2                       -0.00005717    1.0
 2         Be2_5_0     1        Be   -2                       -0.00002508    1.0
 2         Be2_5_4     1        Be   -2                       -0.00001272    1.0
 2         Be2_5_8     1        Be   -2                       -0.00000730    1.0
 2         Be2_6_2     1        Be   -2                       -0.00000451    1.0
 2         Be2_6_6     1        Be   -2                       -0.00000297    1.0
 2         Be2_7_0     1        Be   -2                       -0.00000197    1.0
 2         Be2_7_4     1        Be   -2                       -0.00000134    1.0
 2         Be2_7_8     1        Be   -2                       -0.00000095    1.0
