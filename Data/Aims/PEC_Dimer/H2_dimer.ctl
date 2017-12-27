# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./H2_dimer       2          Aims

# The project description
__title__ ::
"============================= H2-H2 ==============================="
" Reference data were calculated by CCSD(T)/aug-cc-pVQZ           "

# Machine and option keyword of FHI-aims Package
__aims_basis__ :: /u/igor1982/export/aims/my_basis_pool/gaussian_tight_770/aug-cc-pV5Z
__aims__ ::  64  030113.mpi
xc                      pbe0
total_energy_method     rpt2
en_shift                3
coupling_pt2_factor     2.0
coupling_pt2_screen     1.0
charge                  0.
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.2
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           200
radial_multiplier       6
frequency_points        480
override_illconditioning .true.
end aims

# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = '/u/igor1982/export/Batch_Config/Data/Aims/PEC_Dimer'

# The molecular set to batch: 
#               19 is the total number of jobs in this batch list
__batch__ :: 19
#"Flag"         "DIR"                         "InpName"       "JobType"
 H2             <PATH1>/H2_dimer              H2              energy|sosex
 H2_dimer_2_4   <PATH1>/H2_dimer              H2_dimer_2_4    energy|sosex
 H2_dimer_2_6   <PATH1>/H2_dimer              H2_dimer_2_6    energy|sosex
 H2_dimer_2_8   <PATH1>/H2_dimer              H2_dimer_2_8    energy|sosex
 H2_dimer_3_0   <PATH1>/H2_dimer              H2_dimer_3_0    energy|sosex
 H2_dimer_3_2   <PATH1>/H2_dimer              H2_dimer_3_2    energy|sosex
 H2_dimer_3_3   <PATH1>/H2_dimer              H2_dimer_3_3    energy|sosex
 H2_dimer_3_4   <PATH1>/H2_dimer              H2_dimer_3_4    energy|sosex
 H2_dimer_3_5   <PATH1>/H2_dimer              H2_dimer_3_5    energy|sosex
 H2_dimer_3_6   <PATH1>/H2_dimer              H2_dimer_3_6    energy|sosex
 H2_dimer_3_7   <PATH1>/H2_dimer              H2_dimer_3_7    energy|sosex
 H2_dimer_3_8   <PATH1>/H2_dimer              H2_dimer_3_8    energy|sosex
 H2_dimer_4_0   <PATH1>/H2_dimer              H2_dimer_4_0    energy|sosex
 H2_dimer_4_2   <PATH1>/H2_dimer              H2_dimer_4_2    energy|sosex
 H2_dimer_4_6   <PATH1>/H2_dimer              H2_dimer_4_6    energy|sosex
 H2_dimer_5_0   <PATH1>/H2_dimer              H2_dimer_5_0    energy|sosex
 H2_dimer_5_4   <PATH1>/H2_dimer              H2_dimer_5_4    energy|sosex
 H2_dimer_5_8   <PATH1>/H2_dimer              H2_dimer_5_8    energy|sosex
 H2_dimer_6_2   <PATH1>/H2_dimer              H2_dimer_6_2    energy|sosex

# Training set for the atomization energy
#       18 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 18 27.21138 
#"Number" "Flag"           "Scale"                                 "Ref"          "Weight"
 2         H2_dimer_2_4     1        H2   -2                        0.06164956    1.000
 2         H2_dimer_2_6     1        H2   -2                        0.02685246    1.000
 2         H2_dimer_2_8     1        H2   -2                        0.01024835    1.000
 2         H2_dimer_3_0     1        H2   -2                        0.00275951    1.000
 2         H2_dimer_3_2     1        H2   -2                       -0.00031946    1.000
 2         H2_dimer_3_3     1        H2   -2                       -0.00100410    1.000
 2         H2_dimer_3_4     1        H2   -2                       -0.00136438    1.000
 2         H2_dimer_3_5     1        H2   -2                       -0.00151595    1.000
 2         H2_dimer_3_6     1        H2   -2                       -0.00153635    1.000
 2         H2_dimer_3_7     1        H2   -2                       -0.00147867    1.000
 2         H2_dimer_3_8     1        H2   -2                       -0.00137771    1.000
 2         H2_dimer_4_0     1        H2   -2                       -0.00112818    1.000
 2         H2_dimer_4_2     1        H2   -2                       -0.00088437    1.000
 2         H2_dimer_4_6     1        H2   -2                       -0.00051593    1.000
 2         H2_dimer_5_0     1        H2   -2                       -0.00029769    1.000
 2         H2_dimer_5_4     1        H2   -2                       -0.00017470    1.000
 2         H2_dimer_5_8     1        H2   -2                       -0.00010476    1.000
 2         H2_dimer_6_2     1        H2   -2                       -0.00006449    1.000
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

