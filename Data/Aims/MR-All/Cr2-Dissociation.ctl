# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"              "ProjCtrl"      "ProjTool"
__project__ ::   ./Cr2-Dissociation           2             Aims

# The project description
__title__ ::
"============================= Cr2-Dissociation ============================="
"        This is a Cr2 dissociaiton path including 34 points                "

# several global statements of control.in for aims Package
__aims_basis__ :: /eos/u/igor1982/BasisSet/Basis-4Z
__aims_batch_type__ :: queue  sbatch  aims_runscr_eos
__aims__ ::  32 171221.scalapack.mpi 
xc                       pbe
many_body_dispersion
total_energy_method      osrpa
frequency_points         60
frozen_core_postSCF      21
RI_method                V
KS_method                lapack_old
override_illconditioning .true.
occupation_type          gaussian 0.05
#switch_external_pert     6 safe
adjust_scf               always 60
mixer                    pulay
n_max_pulay              10
charge_mix_param         0.2
sc_accuracy_rho          1E-6
sc_accuracy_eev          1E-4
sc_accuracy_etot         1E-6
sc_iter_limit            2000
override_relativity      .true.
relativistic             atomic_zora scalar
printout_dft_components  pbe
printout_dft_components  blyp
printout_dft_components  scan
printout_dft_components  tpss
restart                  restart.0
end aims 


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/eos/u/igor1982/export/Batch_Config/Data/Aims/MR-All'

# The molecular set to batch: 
#               36 is the total number of jobs in this batch list
__batch__ :: 36
#"Flag"         "DIR"                     "InpName"                 "JobType"
  Cr           <PATH1>/Cr2-Dissociation   Cr                         energy|osrpa|vdw
  Cr2-100      <PATH1>/Cr2-Dissociation   Cr2-100                    energy|osrpa|vdw
  Cr2-120      <PATH1>/Cr2-Dissociation   Cr2-120                    energy|osrpa|vdw
  Cr2-130      <PATH1>/Cr2-Dissociation   Cr2-130                    energy|osrpa|vdw
  Cr2-140      <PATH1>/Cr2-Dissociation   Cr2-140                    energy|osrpa|vdw
  Cr2-150      <PATH1>/Cr2-Dissociation   Cr2-150                    energy|osrpa|vdw
  Cr2-160      <PATH1>/Cr2-Dissociation   Cr2-160                    energy|osrpa|vdw
  Cr2-165      <PATH1>/Cr2-Dissociation   Cr2-165                    energy|osrpa|vdw
  Cr2-168      <PATH1>/Cr2-Dissociation   Cr2-168                    energy|osrpa|vdw
  Cr2-170      <PATH1>/Cr2-Dissociation   Cr2-170                    energy|osrpa|vdw
  Cr2-175      <PATH1>/Cr2-Dissociation   Cr2-175                    energy|osrpa|vdw
  Cr2-180      <PATH1>/Cr2-Dissociation   Cr2-180                    energy|osrpa|vdw
  Cr2-190      <PATH1>/Cr2-Dissociation   Cr2-190                    energy|osrpa|vdw
  Cr2-200      <PATH1>/Cr2-Dissociation   Cr2-200                    energy|osrpa|vdw
  Cr2-210      <PATH1>/Cr2-Dissociation   Cr2-210                    energy|osrpa|vdw
  Cr2-220      <PATH1>/Cr2-Dissociation   Cr2-220                    energy|osrpa|vdw
  Cr2-230      <PATH1>/Cr2-Dissociation   Cr2-230                    energy|osrpa|vdw
  Cr2-240      <PATH1>/Cr2-Dissociation   Cr2-240                    energy|osrpa|vdw
  Cr2-250      <PATH1>/Cr2-Dissociation   Cr2-250                    energy|osrpa|vdw
  Cr2-260      <PATH1>/Cr2-Dissociation   Cr2-260                    energy|osrpa|vdw
  Cr2-270      <PATH1>/Cr2-Dissociation   Cr2-270                    energy|osrpa|vdw
  Cr2-280      <PATH1>/Cr2-Dissociation   Cr2-280                    energy|osrpa|vdw
  Cr2-290      <PATH1>/Cr2-Dissociation   Cr2-290                    energy|osrpa|vdw
  Cr2-300      <PATH1>/Cr2-Dissociation   Cr2-300                    energy|osrpa|vdw
  Cr2-320      <PATH1>/Cr2-Dissociation   Cr2-320                    energy|osrpa|vdw
  Cr2-340      <PATH1>/Cr2-Dissociation   Cr2-340                    energy|osrpa|vdw
  Cr2-360      <PATH1>/Cr2-Dissociation   Cr2-360                    energy|osrpa|vdw
  Cr2-380      <PATH1>/Cr2-Dissociation   Cr2-380                    energy|osrpa|vdw
  Cr2-400      <PATH1>/Cr2-Dissociation   Cr2-400                    energy|osrpa|vdw
  Cr2-420      <PATH1>/Cr2-Dissociation   Cr2-420                    energy|osrpa|vdw
  Cr2-460      <PATH1>/Cr2-Dissociation   Cr2-460                    energy|osrpa|vdw
  Cr2-480      <PATH1>/Cr2-Dissociation   Cr2-480                    energy|osrpa|vdw
  Cr2-500      <PATH1>/Cr2-Dissociation   Cr2-500                    energy|osrpa|vdw
  Cr2-540      <PATH1>/Cr2-Dissociation   Cr2-540                    energy|osrpa|vdw
  Cr2-580      <PATH1>/Cr2-Dissociation   Cr2-580                    energy|osrpa|vdw
  Cr2-620      <PATH1>/Cr2-Dissociation   Cr2-620                    energy|osrpa|vdw
# Training set for the HC7 atomization energy
#              36 is the total number of the energy testing data
#            1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ ::  36  1.0
#"Number" "Flag"      "Scale"                                      "Ref"      "Weight"
  1       Cr           1                                            0.000      1.0000
  1       Cr2-100      1                                            0.000      1.0000
  1       Cr2-120      1                                            0.000      1.0000
  1       Cr2-130      1                                            0.000      1.0000
  1       Cr2-140      1                                            0.000      1.0000
  1       Cr2-150      1                                            0.000      1.0000
  1       Cr2-160      1                                            0.000      1.0000
  1       Cr2-165      1                                            0.000      1.0000
  1       Cr2-168      1                                            0.000      1.0000
  1       Cr2-170      1                                            0.000      1.0000
  1       Cr2-175      1                                            0.000      1.0000
  1       Cr2-180      1                                            0.000      1.0000
  1       Cr2-190      1                                            0.000      1.0000
  1       Cr2-200      1                                            0.000      1.0000
  1       Cr2-210      1                                            0.000      1.0000
  1       Cr2-220      1                                            0.000      1.0000
  1       Cr2-230      1                                            0.000      1.0000
  1       Cr2-240      1                                            0.000      1.0000
  1       Cr2-250      1                                            0.000      1.0000
  1       Cr2-260      1                                            0.000      1.0000
  1       Cr2-270      1                                            0.000      1.0000
  1       Cr2-280      1                                            0.000      1.0000
  1       Cr2-290      1                                            0.000      1.0000
  1       Cr2-300      1                                            0.000      1.0000
  1       Cr2-320      1                                            0.000      1.0000
  1       Cr2-340      1                                            0.000      1.0000
  1       Cr2-360      1                                            0.000      1.0000
  1       Cr2-380      1                                            0.000      1.0000
  1       Cr2-400      1                                            0.000      1.0000
  1       Cr2-420      1                                            0.000      1.0000
  1       Cr2-460      1                                            0.000      1.0000
  1       Cr2-480      1                                            0.000      1.0000
  1       Cr2-500      1                                            0.000      1.0000
  1       Cr2-540      1                                            0.000      1.0000
  1       Cr2-580      1                                            0.000      1.0000
  1       Cr2-620      1                                            0.000      1.0000
