# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BSSE_S22           2                Aims

# The project description
__title__ ::
"============================== S22 set ============================="
"             This is S22 subset from GMTKN30 proposed by Grimme     "

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
#                34 is the total number of jobs in this batch list
__batch__ :: 34
#"Flag"         "DIR"                        "InpName"       "JobType"
 01a            <PATH1>/BSSE_S22                 01a            energy
 02a            <PATH1>/BSSE_S22                 02a            energy
 03a            <PATH1>/BSSE_S22                 03a            energy
 04a            <PATH1>/BSSE_S22                 04a            energy
 05a            <PATH1>/BSSE_S22                 05a            energy
 06a            <PATH1>/BSSE_S22                 06a            energy
 06b            <PATH1>/BSSE_S22                 06b            energy
 07a            <PATH1>/BSSE_S22                 07a            energy
 07b            <PATH1>/BSSE_S22                 07b            energy
 08a            <PATH1>/BSSE_S22                 08a            energy
 09a            <PATH1>/BSSE_S22                 09a            energy
 10a            <PATH1>/BSSE_S22                 10a            energy
 10b            <PATH1>/BSSE_S22                 10b            energy
 11a            <PATH1>/BSSE_S22                 11a            energy
 12a            <PATH1>/BSSE_S22                 12a            energy
 13a            <PATH1>/BSSE_S22                 13a            energy
 14a            <PATH1>/BSSE_S22                 14a            energy
 14b            <PATH1>/BSSE_S22                 14b            energy
 15a            <PATH1>/BSSE_S22                 15a            energy
 15b            <PATH1>/BSSE_S22                 15b            energy
 16a            <PATH1>/BSSE_S22                 16a            energy
 16b            <PATH1>/BSSE_S22                 16b            energy
 17a            <PATH1>/BSSE_S22                 17a            energy
 17b            <PATH1>/BSSE_S22                 17b            energy
 18a            <PATH1>/BSSE_S22                 18a            energy
 18b            <PATH1>/BSSE_S22                 18b            energy
 19a            <PATH1>/BSSE_S22                 19a            energy
 19b            <PATH1>/BSSE_S22                 19b            energy
 20a            <PATH1>/BSSE_S22                 20a            energy
 20b            <PATH1>/BSSE_S22                 20b            energy
 21a            <PATH1>/BSSE_S22                 21a            energy
 21b            <PATH1>/BSSE_S22                 21b            energy
 22a            <PATH1>/BSSE_S22                 22a            energy
 22b            <PATH1>/BSSE_S22                 22b            energy

# Training set for the atomization energy
#               22 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 34  1.0
#"Number" "Flag" "Scale"                            "Ref"      "Weight"
  1      01a  1                                     0.000000 1.0
  1      02a  1                                     0.000000 1.0
  1      03a  1                                     0.000000 1.0
  1      04a  1                                     0.000000 1.0
  1      05a  1                                     0.000000 1.0
  1      06a  1                                     0.000000 1.0
  1      06b  1                                     0.000000 1.0
  1      07a  1                                     0.000000 1.0
  1      07b  1                                     0.000000 1.0
  1      08a  1                                     0.000000 1.0
  1      09a  1                                     0.000000 1.0
  1      10a  1                                     0.000000 1.0
  1      10b  1                                     0.000000 1.0
  1      11a  1                                     0.000000 1.0
  1      12a  1                                     0.000000 1.0
  1      13a  1                                     0.000000 1.0
  1      14a  1                                     0.000000 1.0
  1      14b  1                                     0.000000 1.0
  1      15a  1                                     0.000000 1.0
  1      15b  1                                     0.000000 1.0
  1      16a  1                                     0.000000 1.0
  1      16b  1                                     0.000000 1.0
  1      17a  1                                     0.000000 1.0
  1      17b  1                                     0.000000 1.0
  1      18a  1                                     0.000000 1.0
  1      18b  1                                     0.000000 1.0
  1      19a  1                                     0.000000 1.0
  1      19b  1                                     0.000000 1.0
  1      20a  1                                     0.000000 1.0
  1      20b  1                                     0.000000 1.0
  1      21a  1                                     0.000000 1.0
  1      21b  1                                     0.000000 1.0
  1      22a  1                                     0.000000 1.0
  1      22b  1                                     0.000000 1.0
