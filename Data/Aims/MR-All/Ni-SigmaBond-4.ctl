# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"              "ProjCtrl"      "ProjTool"
__project__ ::   ./Ni-SigmaBond-4         2             Aims

# The project description
__title__ ::
"============================= Cr2-Dissociation ============================="
"        This is a Cr2 dissociaiton path including 34 points                "

# several global statements of control.in for aims Package
__aims_basis__ :: /eos/u/igor1982/BasisSet/Basis-4Z
__aims_batch_type__ :: queue  sbatch  aims_runscr_eos
__aims__ ::  32 171221.scalapack.mpi 
xc                       pbe
total_energy_method      osrpa
frequency_points         60
frozen_core_postSCF      21
RI_method                V
KS_method                serial
override_illconditioning .true.
occupation_type          gaussian 0.05
switch_external_pert     6 safe
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
#               12 is the total number of jobs in this batch list
__batch__ :: 12
#"Flag"         "DIR"                     "InpName"                 "JobType"
  Ni-H2-RC      <PATH1>/Ni-SigmaBond-4     Ni-H2-RC                 energy|osrpa|vdw
  Ni-CH4-RC     <PATH1>/Ni-SigmaBond-4     Ni-CH4-RC                energy|osrpa|vdw
  Ni-CH3Cl-RC   <PATH1>/Ni-SigmaBond-4     Ni-CH3Cl-RC              energy|osrpa|vdw
  Ni-C2H6-RC    <PATH1>/Ni-SigmaBond-4     Ni-C2H6-RC               energy|osrpa|vdw
  Ni-H2-TS      <PATH1>/Ni-SigmaBond-4     Ni-H2-TS                 energy|osrpa|vdw
  Ni-CH4-TS     <PATH1>/Ni-SigmaBond-4     Ni-CH4-TS                energy|osrpa|vdw
  Ni-CH3Cl-TS   <PATH1>/Ni-SigmaBond-4     Ni-CH3Cl-TS              energy|osrpa|vdw
  Ni-C2H6-TS    <PATH1>/Ni-SigmaBond-4     Ni-C2H6-TS               energy|osrpa|vdw
  Ni-H2-PC      <PATH1>/Ni-SigmaBond-4     Ni-H2-PC                 energy|osrpa|vdw
  Ni-CH4-PC     <PATH1>/Ni-SigmaBond-4     Ni-CH4-PC                energy|osrpa|vdw
  Ni-CH3Cl-PC   <PATH1>/Ni-SigmaBond-4     Ni-CH3Cl-PC              energy|osrpa|vdw
  Ni-C2H6-PC    <PATH1>/Ni-SigmaBond-4     Ni-C2H6-PC               energy|osrpa|vdw
# Training set for the HC7 atomization energy
#              6 is the total number of the energy testing data
#            1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ ::  8  627.51
#"Number" "Flag"      "Scale"                                      "Ref"      "Weight"
  2       Ni-H2-RC    -1        Ni-H2-TS     1                     1.750      1.0000
  2       Ni-CH4-RC   -1        Ni-CH4-TS    1                     4.370      1.0000
  2       Ni-CH3Cl-RC -1        Ni-CH3Cl-TS  1                     9.970      1.0000
  2       Ni-C2H6-RC  -1        Ni-C2H6-TS   1                    11.200      1.0000
  2       Ni-H2-RC    -1        Ni-H2-PC     1                    -0.480      1.0000
  2       Ni-CH4-RC   -1        Ni-CH4-PC    1                    -5.150      1.0000
  2       Ni-CH3Cl-RC -1        Ni-CH3Cl-PC  1                   -35.430      1.0000
  2       Ni-C2H6-RC  -1        Ni-C2H6-PC   1                   -15.950      1.0000
