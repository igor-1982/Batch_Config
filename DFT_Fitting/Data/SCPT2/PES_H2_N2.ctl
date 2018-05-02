# The project environment :
# "ProjDir" specifying the storage DIR of this project
# "ProjCtrl" = 0 : to run all the jobs
#   = 1 : to fetch result from existed log and chk files
#   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using FHI-aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PES            0              Aims

# The project description
__title__ ::
"======================== PES N2 and H2 ============================"
"              There are 56 molecules in G2-1 set                   "
"All the geometries are optimized at the level of B3LYP/6-311+G(d,p)"

__initial guess__ ::
# enhanced_factor,  screen_factor,  shift_factor
  1.0E0,            1.0E0           0.0E0

# "There are about algorithms at present:                                    "
# "   0) batch    :: just batch the results based on intital guess           "
# "   1) leastsq  :: least square fit algorithm                              "
# "   2) fmin_rms :: downhill simplex algorithm based on RMS                 "
# "   3) fmin_mad :: downhill simplex algorithm based on MAD                 "
# "   4) fmin_cobyla_rms :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on RMS                            "
# "   5) fmin_cobyla_mad :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on MAD                            "
__optimization algorithm__ :: batch

__optimization job__ :: scpt2

__optimization function__ :: update_aims_scpt2.py

# several global statements of control.in for aims Package
__aims_basis__ :: /home/zhang/Documents/Package-Pool/aims/my_basis_pool/gaussian/cc-pVDZ
__aims__ ::  2  030113.mpi
xc                      pbe0
total_energy_method     mp2
frozen_core_postSCF     1
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.6
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           200
end aims

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , '/home/zhang/Dropbox/SourceCode-Pool/Batch_Config/Data/Aims/PEC_Dimer'
<PATH2> , '/home/zhang/Dropbox/SourceCode-Pool/Batch_Config/Data/Aims/PEC_Dimer'

# The molecular set to batch: 
#               25 is the total number of jobs in this batch list
__batch__ ::  3
#"Flag"         "DIR"                         "InpName"       "JobType"
# H2  18
  H             <PATH1>/H2                          H         scpt2 
  H2_0_6        <PATH1>/H2                     H2_0_6         scpt2 
  H2_0_6_5      <PATH1>/H2                   H2_0_6_5         scpt2 
  H2_0_7        <PATH1>/H2                     H2_0_7         scpt2 
  H2_0_7_5      <PATH1>/H2                   H2_0_7_5         scpt2 
  H2_0_8        <PATH1>/H2                     H2_0_8         scpt2 
  H2_1_0        <PATH1>/H2                     H2_1_0         scpt2 
  H2_1_4        <PATH1>/H2                     H2_1_4         scpt2 
  H2_1_8        <PATH1>/H2                     H2_1_8         scpt2 
  H2_2_2        <PATH1>/H2                     H2_2_2         scpt2 
  H2_2_6        <PATH1>/H2                     H2_2_6         scpt2 
  H2_3_0        <PATH1>/H2                     H2_3_0         scpt2 
  H2_3_4        <PATH1>/H2                     H2_3_4         scpt2 
  H2_3_8        <PATH1>/H2                     H2_3_8         scpt2 
  H2_4_2        <PATH1>/H2                     H2_4_2         scpt2 
  H2_5_0        <PATH1>/H2                     H2_5_0         scpt2 
  H2_6_2        <PATH1>/H2                     H2_6_2         scpt2 
  H2_7_0        <PATH1>/H2                     H2_7_0         scpt2 
# N2 set 7
  N             <PATH2>/N2                          N         scpt2 
  N2_1_0_5      <PATH2>/N2                   N2_1_0_5         scpt2 
  N2_1_1        <PATH2>/N2                     N2_1_1         scpt2 
  N2_1_1_5      <PATH2>/N2                   N2_1_1_5         scpt2 
  N2_1_3        <PATH2>/N2                     N2_1_3         scpt2 
  N2_1_6        <PATH2>/N2                     N2_1_6         scpt2 
  N2_3_4        <PATH2>/N2                     N2_3_4         scpt2 

# Training set for the atomization energy
#               23 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "a.u."
#         27.21138 is the scale factor from "a.u." to "ev", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "ev"
__energy__ :: 2  1.0
#"Number" "Flag"      "Scale"                                      "Ref"         "Weight"
# H2 17 Refs are CCSD(T)/aug-cc-pV5Z
 2        H2_0_6      1         H  -2                              -0.15546645    1.0
 2        H2_0_6_5    1         H  -2                              -0.16798407    1.0
 2        H2_0_7      1         H  -2                              -0.17269549    1.0
 2        H2_0_7_5    1         H  -2                              -0.17392928    1.0
 2        H2_0_8      1         H  -2                              -0.17200743    1.0
 2        H2_1_0      1         H  -2                              -0.14735649    1.0
 2        H2_1_4      1         H  -2                              -0.08194259    1.0
 2        H2_1_8      1         H  -2                              -0.03584206    1.0
 2        H2_2_2      1         H  -2                              -0.01305196    1.0
 2        H2_2_6      1         H  -2                              -0.00427712    1.0
 2        H2_3_0      1         H  -2                              -0.00135465    1.0
 2        H2_3_4      1         H  -2                              -0.00043577    1.0
 2        H2_3_8      1         H  -2                              -0.00014935    1.0
 2        H2_4_2      1         H  -2                              -0.00005717    1.0
 2        H2_5_0      1         H  -2                              -0.00001272    1.0
 2        H2_6_2      1         H  -2                              -0.00000297    1.0
 2        H2_7_0      1         H  -2                              -0.00000134    1.0
# N2 6 Refs are CCSD(T)/aug-cc-pV5Z for 1.05,1.10,1.15,1.30,1.60
#               for 3.40, the reference is set to 0.0
 2        N2_1_0_5    1         N  -2                              -0.35175980    1.0
 2        N2_1_1      1         N  -2                              -0.35906080    1.0
 2        N2_1_1_5    1         N  -2                              -0.35312080    1.0
 2        N2_1_3      1         N  -2                              -0.29268780    1.0
 2        N2_1_6      1         N  -2                              -0.13745680    1.0
 2        N2_3_4      1         N  -2                              -0.00000000    1.0
