# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./AL2X           2               Aims

# The project description
__title__ ::
"============================== AL2X set ============================="
"        This is AL2X subset from GMTKN30 proposed by Grimme          "

# several global statements of control.in for aims Package
__aims_basis__ :: /home/igor/Documents/Package-Pool/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  2  051512.mpi
xc                      pbe                                                                                                                 
total_energy_method     rpa
relativistic            none                                                                                                                            
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.6
sc_accuracy_rho  1E-6
sc_accuracy_eev  1E-4
sc_accuracy_etot 1E-6
sc_iter_limit    200
end aims



# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#              13 is the total number of jobs in this batch list
__batch__ :: 13
#  "Flag"         "DIR"                        "InpName"       "JobType"
  al2br6          <PATH1>/AL2X                 al2br6       energy
  al2cl6          <PATH1>/AL2X                 al2cl6       energy
   al2f6          <PATH1>/AL2X                  al2f6       energy
   al2h6          <PATH1>/AL2X                  al2h6       energy
  al2me4          <PATH1>/AL2X                 al2me4       energy
  al2me5          <PATH1>/AL2X                 al2me5       energy
  al2me6          <PATH1>/AL2X                 al2me6       energy
   albr3          <PATH1>/AL2X                  albr3       energy
   alcl3          <PATH1>/AL2X                  alcl3       energy
    alf3          <PATH1>/AL2X                   alf3       energy
    alh3          <PATH1>/AL2X                   alh3       energy
   alme2          <PATH1>/AL2X                  alme2       energy
   alme3          <PATH1>/AL2X                  alme3       energy


# Training set for the atomization energy
#               7 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 7  627.51
#"Number" "Flag" "Scale"                             "Ref"      "Weight"
  2    al2h6     -1     alh3    2                    35.8       1.000
  2    al2f6     -1     alf3    2                    52.6       1.000
  2    al2cl6    -1    alcl3    2                    31.4       1.000
  2    al2br6    -1    albr3    2                    28.4       1.000
  2    al2me4    -1    alme2    2                    37.8       1.000
  3    al2me5    -1    alme2    1     alme3      1   30.0       1.000
  2    al2me6    -1    alme3    2                    21.4       1.000
