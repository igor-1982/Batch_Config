# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./H2_MP2              2         Aims

# The project description
__title__ ::
"============================= H-H ==============================="
" Reference data were calculated by CCSD(T)/aug-cc-pVQZ           "

#several global statements of control.in for aims Package
#__aims_basis__ :: /u/igor1982/export/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims_basis__ :: /home/zhang/Documents/Package-Pool/aims/aimsfiles/species_defaults/non-standard/NAO-VCC-nZ/NAO-VCC-4Z
__aims__ ::  4  072414.mpi
xc                      hf
total_energy_method     mp2
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.6
sc_iter_limit           600
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
radial_multiplier       6
override_illconditioning .true.
end aims


# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = '/home/zhang/Dropbox/SourceCode-Pool/Batch_Config/Data/Aims/PEC_Dimer'
<PATH2> = .


# The molecular set to batch: 
#               39 is the total number of jobs in this batch list
__batch__ :: 32
#"Flag"         "DIR"                         "InpName"       "JobType"
 H             <PATH1>/H2                          H          energy|mp2
 H2_0_6        <PATH1>/H2                     H2_0_6          energy|mp2
 H2_0_6_5      <PATH1>/H2                   H2_0_6_5          energy|mp2
 H2_0_7        <PATH1>/H2                     H2_0_7          energy|mp2
 H2_0_7_5      <PATH1>/H2                   H2_0_7_5          energy|mp2
 H2_0_8        <PATH1>/H2                     H2_0_8          energy|mp2
 H2_0_9        <PATH1>/H2                     H2_0_9          energy|mp2
 H2_1_0        <PATH1>/H2                     H2_1_0          energy|mp2
 H2_1_2        <PATH1>/H2                     H2_1_2          energy|mp2
 H2_1_4        <PATH1>/H2                     H2_1_4          energy|mp2
 H2_1_6        <PATH1>/H2                     H2_1_6          energy|mp2
 H2_1_8        <PATH1>/H2                     H2_1_8          energy|mp2
 H2_2_0        <PATH1>/H2                     H2_2_0          energy|mp2
 H2_2_2        <PATH1>/H2                     H2_2_2          energy|mp2
 H2_2_4        <PATH1>/H2                     H2_2_4          energy|mp2
 H2_2_6        <PATH1>/H2                     H2_2_6          energy|mp2
 H2_2_8        <PATH1>/H2                     H2_2_8          energy|mp2
 H2_3_0        <PATH1>/H2                     H2_3_0          energy|mp2
 H2_3_2        <PATH1>/H2                     H2_3_2          energy|mp2
 H2_3_4        <PATH1>/H2                     H2_3_4          energy|mp2
 H2_3_6        <PATH1>/H2                     H2_3_6          energy|mp2
 H2_3_8        <PATH1>/H2                     H2_3_8          energy|mp2
 H2_4_0        <PATH1>/H2                     H2_4_0          energy|mp2
 H2_4_2        <PATH1>/H2                     H2_4_2          energy|mp2
 H2_4_6        <PATH1>/H2                     H2_4_6          energy|mp2
 H2_5_0        <PATH1>/H2                     H2_5_0          energy|mp2
 H2_5_4        <PATH1>/H2                     H2_5_4          energy|mp2
 H2_5_8        <PATH1>/H2                     H2_5_8          energy|mp2
 H2_6_2        <PATH1>/H2                     H2_6_2          energy|mp2
 H2_6_6        <PATH1>/H2                     H2_6_6          energy|mp2
 H2_7_0        <PATH1>/H2                     H2_7_0          energy|mp2
 H2_7_4        <PATH1>/H2                     H2_7_4          energy|mp2
 H2_7_8        <PATH1>/H2                     H2_7_8          energy|mp2
 H2_8_2        <PATH1>/H2                     H2_8_2          energy|mp2
 H2_8_6        <PATH1>/H2                     H2_8_6          energy|mp2
 H2_9_0        <PATH1>/H2                     H2_9_0          energy|mp2
 H2_9_4        <PATH1>/H2                     H2_9_4          energy|mp2
 H2_9_8        <PATH1>/H2                     H2_9_8          energy|mp2
 H2_10_2       <PATH1>/H2                    H2_10_2          energy|mp2

# Training set for the atomization energy
#       38 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 31  1.0
#"Number" "Flag"     "Scale"                                 "Ref"       "Weight"
 2        H2_0_6      1         H  -2                              -0.15546645    1.0
 2        H2_0_6_5    1         H  -2                              -0.16798407    1.0
 2        H2_0_7      1         H  -2                              -0.17269549    1.0
 2        H2_0_7_5    1         H  -2                              -0.17392928    1.0
 2        H2_0_8      1         H  -2                              -0.17200743    1.0
 2        H2_0_9      1         H  -2                              -0.16199823    1.0
 2        H2_1_0      1         H  -2                              -0.14735649    1.0
 2        H2_1_2      1         H  -2                              -0.11375545    1.0
 2        H2_1_4      1         H  -2                              -0.08194259    1.0
 2        H2_1_6      1         H  -2                              -0.05565932    1.0
 2        H2_1_8      1         H  -2                              -0.03584206    1.0
 2        H2_2_0      1         H  -2                              -0.02203175    1.0
 2        H2_2_2      1         H  -2                              -0.01305196    1.0
 2        H2_2_4      1         H  -2                              -0.00753252    1.0
 2        H2_2_6      1         H  -2                              -0.00427712    1.0
 2        H2_2_8      1         H  -2                              -0.00240904    1.0
 2        H2_3_0      1         H  -2                              -0.00135465    1.0
 2        H2_3_2      1         H  -2                              -0.00076472    1.0
 2        H2_3_4      1         H  -2                              -0.00043577    1.0
 2        H2_3_6      1         H  -2                              -0.00025228    1.0
 2        H2_3_8      1         H  -2                              -0.00014935    1.0
 2        H2_4_0      1         H  -2                              -0.00009094    1.0
 2        H2_4_2      1         H  -2                              -0.00005717    1.0
 2        H2_4_6      1         H  -2                              -0.00002508    1.0
 2        H2_5_0      1         H  -2                              -0.00001272    1.0
 2        H2_5_4      1         H  -2                              -0.00000730    1.0
 2        H2_5_8      1         H  -2                              -0.00000451    1.0
 2        H2_6_2      1         H  -2                              -0.00000297    1.0
 2        H2_6_6      1         H  -2                              -0.00000197    1.0
 2        H2_7_0      1         H  -2                              -0.00000134    1.0
 2        H2_7_4      1         H  -2                              -0.00000095    1.0
 2        H2_7_8      1         H  -2                              -0.00000070    1.0
 2        H2_8_2      1         H  -2                              -0.00000051    1.0
 2        H2_8_6      1         H  -2                              -0.00000037    1.0
 2        H2_9_0      1         H  -2                              -0.00000027    1.0
 2        H2_9_4      1         H  -2                              -0.00000022    1.0
 2        H2_9_8      1         H  -2                              -0.00000017    1.0
 2        H2_10_2     1         H  -2                              -0.00000013    1.0
