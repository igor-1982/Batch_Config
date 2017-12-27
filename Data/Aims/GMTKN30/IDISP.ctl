# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./IDISP           2               Aims

# The project description
__title__ ::
"============================== IDISP set ============================="
"             This is IDISP subset from GMTKN30 proposed by Grimme     "

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
#                13 is the total number of jobs in this batch list
__batch__ :: 13
#"Flag"         "DIR"                        "InpName"       "JobType"
     ant          <PATH1>/IDISP                    ant            energy
antdimer          <PATH1>/IDISP               antdimer            energy
    F14f          <PATH1>/IDISP                   F14f            energy
    F14l          <PATH1>/IDISP                   F14l            energy
    F22f          <PATH1>/IDISP                   F22f            energy
    F22l          <PATH1>/IDISP                   F22l            energy
      h2          <PATH1>/IDISP                     h2            energy
 octane1          <PATH1>/IDISP                octane1            energy
 octane2          <PATH1>/IDISP                octane2            energy
    pc22          <PATH1>/IDISP                   pc22            energy
 pxylene          <PATH1>/IDISP                pxylene            energy
undecan1          <PATH1>/IDISP               undecan1            energy
undecan2          <PATH1>/IDISP               undecan2            energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  2       antdimer     1       ant        -2                  -9.0        1.0
  3       pxylene      2       pc22       -1   h2     -2     -58.5        1.0
  2       octane1      1       octane2    -1                  -1.9        1.0
  2       undecan1     1       undecan2   -1                   8.2        1.0
  2       F14f        -1       F14l        1                  -3.1        1.0
  2       F22f        -1       F22l        1                   0.4        1.0
