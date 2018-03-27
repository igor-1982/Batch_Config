# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./3DAEE7           2             Aims

# The project description
__title__ ::
"============================== 3dAEE7 set ============================="
"        This is  3dAEE7 subset including 3 reactions with strong        "
"           multi-reference character                                       "

# several global statements of control.in for aims Package
__aims_basis__ :: /share/home/wenxinzy/export/Batch_Config/Data/Aims/MR-All/BasisSet/Basis-4Z
__aims_batch_type__ :: queue bsub aims_runscr_xhpc1 debug
__aims__ ::  4 1 4 180319.scalapack.mpi
xc                       pbe0
occupation_type          integer 0.0001
restart                  restart
#force_occupation_projector 23 2 0.0 22 25
#force_occupation_projector 24 2 1.0 22 25
total_energy_method      osrpa
frequency_points         60
frozen_core_postSCF      21
RI_method                V
KS_method                serial
override_illconditioning .true.
mixer                    pulay
n_max_pulay              10
charge_mix_param         0.2
adjust_scf               always 60
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
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/share/home/wenxinzy/export/Batch_Config/Data/Aims/MR-All'

# The molecular set to batch: 
#               14 is the total number of jobs in this batch list
__batch__ :: 14
#"Flag"         "DIR"                   "InpName"                 "JobType"
  # 7 ground states
  Sc_G           <PATH1>/3dAEE7            Sc_G                   energy|osrpa
  Mn+_G          <PATH1>/3dAEE7            Mn+_G                  energy|osrpa
  Fe_G           <PATH1>/3dAEE7            Fe_G                   energy|osrpa 
  Ni+_G          <PATH1>/3dAEE7            Ni+_G                  energy|osrpa 
  Zn_G           <PATH1>/3dAEE7            Zn_G                   energy|osrpa 
  Ca+_G          <PATH1>/3dAEE7            Ca+_G                  energy|osrpa 
  V_G            <PATH1>/3dAEE7            V_G                    energy|osrpa 
  # 7 excited states
  Sc_E           <PATH1>/3dAEE7            Sc_E                   energy|osrpa
  Mn+_E          <PATH1>/3dAEE7            Mn+_E                  energy|osrpa
  Fe_E           <PATH1>/3dAEE7            Fe_E                   energy|osrpa 
  Ni+_E          <PATH1>/3dAEE7            Ni+_E                  energy|osrpa 
  Zn_E           <PATH1>/3dAEE7            Zn_E                   energy|osrpa 
  Ca+_E          <PATH1>/3dAEE7            Ca+_E                  energy|osrpa 
  V_E            <PATH1>/3dAEE7            V_E                    energy|osrpa 
# Training set for the atomic excitation energies
#              7 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  7 627.51
#"Number" "Flag"      "Scale"                            "Ref"      "Weight"
  2     Sc_G           -1    Sc_E        1                32.91      1.0000
  2     Mn+_G          -1    Mn+_E       1                27.08      1.0000
  2     Fe_G           -1    Fe_E        1                34.32      1.0000   
  2     Ni+_G          -1    Ni+_E       1                25.02      1.0000   
  2     Zn_G           -1    Zn_E        1                93.48      1.0000   
  2     Ca+_G          -1    Ca+_E       1                39.10      1.0000   
  2     V_G            -1    V_E         1                 5.60      1.0000   
