# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./CYCONF            2            Aims

# The project description
__title__ ::
"============================== CYCONF set ============================="
"        This is CYCONF subset from GMTKN30 proposed by Grimme          "

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
#              11 is the total number of jobs in this batch list
__batch__ :: 11
#  "Flag"         "DIR"                               "InpName"       "JobType"
    10            <PATH1>/CYCONF                       10          energy
    11            <PATH1>/CYCONF                       11          energy
     1            <PATH1>/CYCONF                        1          energy
     2            <PATH1>/CYCONF                        2          energy
     3            <PATH1>/CYCONF                        3          energy
     4            <PATH1>/CYCONF                        4          energy
     5            <PATH1>/CYCONF                        5          energy
     6            <PATH1>/CYCONF                        6          energy
     7            <PATH1>/CYCONF                        7          energy
     8            <PATH1>/CYCONF                        8          energy
     9            <PATH1>/CYCONF                        9          energy

# Training set for the atomization energy
#              10 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 10  627.51
#"Number" "Flag" "Scale"                                          "Ref"      "Weight"
  2        1      -1       2     1                                1.522      1.0000
  2        1      -1       3     1                                1.609      1.0000
  2        1      -1       4     1                                1.948      1.0000
  2        1      -1       5     1                                1.795      1.0000
  2        1      -1       6     1                                2.098      1.0000
  2        1      -1       7     1                                1.933      1.0000
  2        1      -1       8     1                                2.177      1.0000
  2        1      -1       9     1                                2.359      1.0000
  2        1      -1       10    1                                2.562      1.0000
  2        1      -1       11    1                                2.674      1.0000
