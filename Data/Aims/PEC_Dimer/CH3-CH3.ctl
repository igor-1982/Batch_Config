# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./CH3-CH3              2    QChem 

# The project description
__title__ ::
"============================= CH3-CH3 ==============================="
"     Reference data were calculated by CCSD(T)/aug-cc-pV5Z           "

#several global statements of control.in for aims Package
__aims_basis__ :: /u/igor1982/export/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  4  030113.mpi
xc                      pbe0
total_energy_method     mp2
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


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/home/wenxinzy/export/softs/Batch_Config/Data/Aims/PEC_Dimer'


# The molecular set to batch: 
#               17 is the total number of jobs in this batch list
__batch__ :: 17
#"Flag"         "DIR"                         "InpName"       "JobType"
 CH3           <PATH1>/CH3-CH3                 CH3            energy
 C2H6-0.4      <PATH1>/CH3-CH3                 C2H60.0        energy
 C2H6-0.2      <PATH1>/CH3-CH3                 C2H6-0.2       energy
 C2H60.0       <PATH1>/CH3-CH3                 C2H60.2        energy
 C2H60.2       <PATH1>/CH3-CH3                 C2H6-0.4       energy
 C2H60.4       <PATH1>/CH3-CH3                 C2H60.4        energy
 C2H60.6       <PATH1>/CH3-CH3                 C2H60.6        energy
 C2H60.8       <PATH1>/CH3-CH3                 C2H60.8        energy
 C2H61.0       <PATH1>/CH3-CH3                 C2H61.0        energy
 C2H61.4       <PATH1>/CH3-CH3                 C2H61.4        energy
 C2H61.8       <PATH1>/CH3-CH3                 C2H61.8        energy
 C2H62.2       <PATH1>/CH3-CH3                 C2H62.2        energy
 C2H62.6       <PATH1>/CH3-CH3                 C2H62.6        energy
 C2H63.0       <PATH1>/CH3-CH3                 C2H63.0        energy
 C2H63.5       <PATH1>/CH3-CH3                 C2H63.5        energy
 C2H64.0       <PATH1>/CH3-CH3                 C2H64.0        energy
 C2H65.0       <PATH1>/CH3-CH3                 C2H65.0        energy

# Training set for the atomization energy
#       16 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 16  1.0
#"Number" "Flag"     "Scale"                                 "Ref"       "Weight"
 2         C2H6-0.4   1         CH3    -2                    0.00        1.0
 2         C2H6-0.2   1         CH3    -2                    0.00        1.0
 2         C2H60.0    1         CH3    -2                    0.00        1.0
 2         C2H60.2    1         CH3    -2                    0.00        1.0
 2         C2H60.4    1         CH3    -2                    0.00        1.0
 2         C2H60.6    1         CH3    -2                    0.00        1.0
 2         C2H60.8    1         CH3    -2                    0.00        1.0
 2         C2H61.0    1         CH3    -2                    0.00        1.0
 2         C2H61.4    1         CH3    -2                    0.00        1.0
 2         C2H61.8    1         CH3    -2                    0.00        1.0
 2         C2H62.2    1         CH3    -2                    0.00        1.0
 2         C2H62.6    1         CH3    -2                    0.00        1.0
 2         C2H63.0    1         CH3    -2                    0.00        1.0
 2         C2H63.5    1         CH3    -2                    0.00        1.0
 2         C2H64.0    1         CH3    -2                    0.00        1.0
 2         C2H65.0    1         CH3    -2                    0.00        1.0
