# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./MR-MGM-BE4           2             Aims

# The project description
__title__ ::
"============================== MR-MGM-BE4 set ============================="
"        This is MG-MGM-BE4 subset including 4 reactions with strong        "
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
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/draco/u/igor1982/export/Batch_Config/Data/Aims/MR-All'

# The molecular set to batch: 
#               11 is the total number of jobs in this batch list
__batch__ :: 11
#"Flag"         "DIR"                       "InpName"       "JobType"
  # 4 molecules
  CaO           <PATH1>/MR-MGM-BE4          CaO             energy
  KO-           <PATH1>/MR-MGM-BE4          KO-             energy
  LiO-          <PATH1>/MR-MGM-BE4          LiO-            energy
  MgS           <PATH1>/MR-MGM-BE4          MgS             energy
  # 7 atoms or anions
  Ca            <PATH1>/MR-MGM-BE4          Ca              energy
  K             <PATH1>/MR-MGM-BE4          K               energy
  Li            <PATH1>/MR-MGM-BE4          Li              energy
  Mg            <PATH1>/MR-MGM-BE4          Mg              energy
  O             <PATH1>/MR-MGM-BE4          O               energy
  O-            <PATH1>/MR-MGM-BE4          O-              energy
  S             <PATH1>/MR-MGM-BE4          S               energy


# Training set for the atomization energy
#              4 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  4 627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  3     CaO    -1   Ca       1       O    1                   96.15      1.0000
  3     LiO-   -1   Li       1       O-   1                   57.59      1.0000
  3      KO-   -1    K       1       O-   1                   33.14      1.0000
  3     MgS    -1   Mg       1       S    1                   55.68      1.0000

