# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./He2plus            2          Gaussian

# The project description
__title__ ::
"============================= He-He ==============================="
" Reference data were calculated by CCSD(T)/aug-cc-pVQZ           "

# Machine and option keyword of QChem Package
__gaussian__ ::
#p ccsd(t)/aug-cc-pVQZ scf=tight

# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .


# The molecular set to batch: 
#               50 is the total number of jobs in this batch list
__batch__ :: 50
#"Flag"         "DIR"                         "InpName"       "JobType"
 He             <PATH1>/He2plus                      He.com       energy
 Heplus         <PATH1>/He2plus                  Heplus.com       energy
 He2_0_6        <PATH1>/He2plus                 He2_0_6.com       energy
 He2_0_8        <PATH1>/He2plus                 He2_0_8.com       energy
 He2_0_9        <PATH1>/He2plus                 He2_0_9.com       energy
 He2_1_0        <PATH1>/He2plus                 He2_1_0.com       energy
 He2_1_0_5      <PATH1>/He2plus               He2_1_0_5.com       energy
 He2_1_1        <PATH1>/He2plus                 He2_1_1.com       energy
 He2_1_1_5      <PATH1>/He2plus               He2_1_1_5.com       energy
 He2_1_2        <PATH1>/He2plus                 He2_1_2.com       energy
 He2_1_2_5      <PATH1>/He2plus               He2_1_2_5.com       energy
 He2_1_3        <PATH1>/He2plus                 He2_1_3.com       energy
 He2_1_4        <PATH1>/He2plus                 He2_1_4.com       energy
 He2_1_5        <PATH1>/He2plus                 He2_1_5.com       energy
 He2_1_6        <PATH1>/He2plus                 He2_1_6.com       energy
 He2_1_8        <PATH1>/He2plus                 He2_1_8.com       energy
 He2_2_0        <PATH1>/He2plus                 He2_2_0.com       energy
 He2_2_2        <PATH1>/He2plus                 He2_2_2.com       energy
 He2_2_4        <PATH1>/He2plus                 He2_2_4.com       energy
 He2_2_6        <PATH1>/He2plus                 He2_2_6.com       energy
 He2_2_8        <PATH1>/He2plus                 He2_2_8.com       energy
 He2_3_0        <PATH1>/He2plus                 He2_3_0.com       energy
 He2_3_2        <PATH1>/He2plus                 He2_3_2.com       energy
 He2_3_4        <PATH1>/He2plus                 He2_3_4.com       energy
 He2_3_6        <PATH1>/He2plus                 He2_3_6.com       energy
 He2_3_8        <PATH1>/He2plus                 He2_3_8.com       energy
 He2_4_0        <PATH1>/He2plus                 He2_4_0.com       energy
 He2_4_2        <PATH1>/He2plus                 He2_4_2.com       energy
 He2_4_6        <PATH1>/He2plus                 He2_4_6.com       energy
 He2_5_0        <PATH1>/He2plus                 He2_5_0.com       energy
 He2_5_4        <PATH1>/He2plus                 He2_5_4.com       energy
 He2_5_8        <PATH1>/He2plus                 He2_5_8.com       energy
 He2_6_2        <PATH1>/He2plus                 He2_6_2.com       energy
 He2_6_6        <PATH1>/He2plus                 He2_6_6.com       energy
 He2_7_0        <PATH1>/He2plus                 He2_7_0.com       energy
 He2_7_4        <PATH1>/He2plus                 He2_7_4.com       energy
 He2_7_8        <PATH1>/He2plus                 He2_7_8.com       energy
 He2_8_2        <PATH1>/He2plus                 He2_8_2.com       energy
 He2_8_6        <PATH1>/He2plus                 He2_8_6.com       energy
 He2_9_0        <PATH1>/He2plus                 He2_9_0.com       energy
 He2_9_4        <PATH1>/He2plus                 He2_9_4.com       energy
 He2_9_8        <PATH1>/He2plus                 He2_9_8.com       energy
 He2_10_2       <PATH1>/He2plus                He2_10_2.com       energy
 He2_10_6       <PATH1>/He2plus                He2_10_6.com       energy
 He2_11_0       <PATH1>/He2plus                He2_11_0.com       energy
 He2_12_0       <PATH1>/He2plus                He2_12_0.com       energy
 He2_13_0       <PATH1>/He2plus                He2_13_0.com       energy
 He2_14_0       <PATH1>/He2plus                He2_14_0.com       energy
 He2_15_0       <PATH1>/He2plus                He2_15_0.com       energy
 He2_16_0       <PATH1>/He2plus                He2_16_0.com       energy

# Training set for the atomization energy
#		48 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 48  1.0
#"Number" "Flag"     "Scale"                                              "Ref"       "Weight"
 3        He2_0_6      1         He  -1     Heplus   -1                   0.17706700   1.0
 3        He2_0_8      1         He  -1     Heplus   -1                  -0.03406287   1.0
 3        He2_0_9      1         He  -1     Heplus   -1                  -0.07185020   1.0
 3        He2_1_0      1         He  -1     Heplus   -1                  -0.08758753   1.0
 3        He2_1_0_5    1         He  -1     Heplus   -1                  -0.09022669   1.0
 3        He2_1_1      1         He  -1     Heplus   -1                  -0.09050297   1.0
 3        He2_1_1_5    1         He  -1     Heplus   -1                  -0.08903696   1.0
 3        He2_1_2      1         He  -1     Heplus   -1                  -0.08631539   1.0
 3        He2_1_2_5    1         He  -1     Heplus   -1                  -0.08271863   1.0
 3        He2_1_3      1         He  -1     Heplus   -1                  -0.07854222   1.0
 3        He2_1_4      1         He  -1     Heplus   -1                  -0.06930885   1.0
 3        He2_1_5      1         He  -1     Heplus   -1                  -0.05985892   1.0
 3        He2_1_6      1         He  -1     Heplus   -1                  -0.05088329   1.0
 3        He2_1_8      1         He  -1     Heplus   -1                  -0.03554531   1.0
 3        He2_2_0      1         He  -1     Heplus   -1                  -0.02407620   1.0
 3        He2_2_2      1         He  -1     Heplus   -1                  -0.01598628   1.0
 3        He2_2_4      1         He  -1     Heplus   -1                  -0.01048332   1.0
 3        He2_2_6      1         He  -1     Heplus   -1                  -0.00682859   1.0
 3        He2_2_8      1         He  -1     Heplus   -1                  -0.00443856   1.0
 3        He2_3_0      1         He  -1     Heplus   -1                  -0.00288911   1.0
 3        He2_3_2      1         He  -1     Heplus   -1                  -0.00188827   1.0
 3        He2_3_4      1         He  -1     Heplus   -1                  -0.00124194   1.0
 3        He2_3_6      1         He  -1     Heplus   -1                  -0.00082346   1.0
 3        He2_3_8      1         He  -1     Heplus   -1                  -0.00055106   1.0
 3        He2_4_0      1         He  -1     Heplus   -1                  -0.00037224   1.0
 3        He2_4_2      1         He  -1     Heplus   -1                  -0.00025346   1.0
 3        He2_4_6      1         He  -1     Heplus   -1                  -0.00011848   1.0
 3        He2_5_0      1         He  -1     Heplus   -1                  -0.00005270   1.0
 3        He2_5_4      1         He  -1     Heplus   -1                  -0.00001783   1.0
 3        He2_5_8      1         He  -1     Heplus   -1                   0.00000242   1.0
 3        He2_6_2      1         He  -1     Heplus   -1                   0.00001525   1.0
 3        He2_6_6      1         He  -1     Heplus   -1                   0.00002399   1.0
 3        He2_7_0      1         He  -1     Heplus   -1                   0.00003024   1.0
 3        He2_7_4      1         He  -1     Heplus   -1                   0.00003499   1.0
 3        He2_7_8      1         He  -1     Heplus   -1                   0.00003837   1.0
 3        He2_8_2      1         He  -1     Heplus   -1                   0.00004098   1.0
 3        He2_8_6      1         He  -1     Heplus   -1                   0.00004302   1.0
 3        He2_9_0      1         He  -1     Heplus   -1                   0.00004463   1.0
 3        He2_9_4      1         He  -1     Heplus   -1                   0.00004592   1.0
 3        He2_9_8      1         He  -1     Heplus   -1                   0.00004696   1.0
 3        He2_10_2     1         He  -1     Heplus   -1                   0.00004780   1.0
 3        He2_10_6     1         He  -1     Heplus   -1                   0.00004848   1.0
 3        He2_11_0     1         He  -1     Heplus   -1                   0.00004904   1.0
 3        He2_12_0     1         He  -1     Heplus   -1                   0.00005007   1.0
 3        He2_13_0     1         He  -1     Heplus   -1                   0.00005072   1.0
 3        He2_14_0     1         He  -1     Heplus   -1                   0.00005116   1.0
 3        He2_15_0     1         He  -1     Heplus   -1                   0.00005146   1.0
 3        He2_16_0     1         He  -1     Heplus   -1                   0.00005166   1.0
















































