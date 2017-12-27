# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./H2_dimer       2          Gaussian

# The project description
__title__ ::
"============================= H2-H2 ==============================="
" Reference data were calculated by CCSD(T)/aug-cc-pVQZ           "

# Machine and option keyword of Gaussian Package
__gaussian__ ::
#p ccsd(t)/aug-cc-pVQZ scf=tight


# The molecular set to batch: 
#               19 is the total number of jobs in this batch list
__batch__ :: 19
#"Flag"         "DIR"                     "InpName"         "JobType"
 H2             <PATH1>/H2_dimer          H2.com             energy
 H2_dimer_2_4   <PATH1>/H2_dimer          H2_dimer_2_4.com   energy
 H2_dimer_2_6   <PATH1>/H2_dimer          H2_dimer_2_6.com   energy
 H2_dimer_2_8   <PATH1>/H2_dimer          H2_dimer_2_8.com   energy
 H2_dimer_3_0   <PATH1>/H2_dimer          H2_dimer_3_0.com   energy
 H2_dimer_3_2   <PATH1>/H2_dimer          H2_dimer_3_2.com   energy
 H2_dimer_3_3   <PATH1>/H2_dimer          H2_dimer_3_3.com   energy
 H2_dimer_3_4   <PATH1>/H2_dimer          H2_dimer_3_4.com   energy
 H2_dimer_3_5   <PATH1>/H2_dimer          H2_dimer_3_5.com   energy
 H2_dimer_3_6   <PATH1>/H2_dimer          H2_dimer_3_6.com   energy
 H2_dimer_3_7   <PATH1>/H2_dimer          H2_dimer_3_7.com   energy
 H2_dimer_3_8   <PATH1>/H2_dimer          H2_dimer_3_8.com   energy
 H2_dimer_4_0   <PATH1>/H2_dimer          H2_dimer_4_0.com   energy
 H2_dimer_4_2   <PATH1>/H2_dimer          H2_dimer_4_2.com   energy
 H2_dimer_4_6   <PATH1>/H2_dimer          H2_dimer_4_6.com   energy
 H2_dimer_5_0   <PATH1>/H2_dimer          H2_dimer_5_0.com   energy
 H2_dimer_5_4   <PATH1>/H2_dimer          H2_dimer_5_4.com   energy
 H2_dimer_5_8   <PATH1>/H2_dimer          H2_dimer_5_8.com   energy
 H2_dimer_6_2   <PATH1>/H2_dimer          H2_dimer_6_2.com   energy

# Training set for the atomization energy
#       18 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 18  1.0
#"Number" "Flag"           "Scale"                                 "Ref"       "Weight"
 2         H2_dimer_2_4     1        H2   -2                       -0.15546645    1.0
 2         H2_dimer_2_6     1        H2   -2                       -0.16798407    1.0
 2         H2_dimer_2_8     1        H2   -2                       -0.17269549    1.0
 2         H2_dimer_3_0     1        H2   -2                       -0.17392928    1.0
 2         H2_dimer_3_2     1        H2   -2                       -0.17200743    1.0
 2         H2_dimer_3_3     1        H2   -2                       -0.16199823    1.0
 2         H2_dimer_3_4     1        H2   -2                       -0.11375545    1.0
 2         H2_dimer_3_5     1        H2   -2                       -0.14735649    1.0
 2         H2_dimer_3_6     1        H2   -2                       -0.05565932    1.0
 2         H2_dimer_3_7     1        H2   -2                       -0.08194259    1.0
 2         H2_dimer_3_8     1        H2   -2                       -0.03584206    1.0
 2         H2_dimer_4_0     1        H2   -2                       -0.02203175    1.0
 2         H2_dimer_4_2     1        H2   -2                       -0.01305196    1.0
 2         H2_dimer_4_6     1        H2   -2                       -0.00753252    1.0
 2         H2_dimer_5_0     1        H2   -2                       -0.00427712    1.0
 2         H2_dimer_5_4     1        H2   -2                       -0.00240904    1.0
 2         H2_dimer_5_8     1        H2   -2                       -0.00135465    1.0
 2         H2_dimer_6_2     1        H2   -2                       -0.00076472    1.0
