# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./MR-TMD-BE3           2             Aims

# The project description
__title__ ::
"============================== MR-TMD-BE3 set ============================="
"        This is  MR-TMD-BE3 subset including 3 reactions with strong        "
"           multi-reference character                                       "

# several global statements of control.in for aims Package
__aims_basis__ :: /draco/u/igor1982/export/species_defaults/tight
__aims__ ::  32 160916.scalapack.mpi 
xc                      pbe
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.2
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           600
#override_relativity     .true.
relativistic             atomic_zora scalar
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/draco/u/igor1982/export/Batch_Config/Data/Aims/MR-All'

# The molecular set to batch: 
#               6 is the total number of jobs in this batch list
__batch__ :: 6
#"Flag"         "DIR"                   "InpName"                 "JobType"
  # 3 molecules
  Cr2          <PATH1>/MR-TMD-BE3            Cr2                        energy
  V2           <PATH1>/MR-TMD-BE3            V2                         energy
  Fe2          <PATH1>/MR-TMD-BE3            Fe2                        energy 
  #3 atoms or ions
  Cr           <PATH1>/MR-TMD-BE3            Cr                         energy
  V            <PATH1>/MR-TMD-BE3            V                          energy
  Fe           <PATH1>/MR-TMD-BE3            Fe                         energy
# Training set for the HC7 atomization energy
#              3 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  3 627.51
#"Number" "Flag"      "Scale"                                      "Ref"      "Weight"
  2       Cr2        -1  Cr          2                             36.00      1.0000
  2       V2         -1  V           2                             64.20      1.0000
  2       Fe2        -1  Fe          2                              2          1.0000   
