# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./S22           2                Aims

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
#                56 is the total number of jobs in this batch list
__batch__ :: 56
#"Flag"         "DIR"                        "InpName"       "JobType"
 01             <PATH1>/S22                  01            energy
 01a            <PATH1>/S22                 01a            energy
 02             <PATH1>/S22                  02            energy
 02a            <PATH1>/S22                 02a            energy
 03             <PATH1>/S22                  03            energy
 03a            <PATH1>/S22                 03a            energy
 04             <PATH1>/S22                  04            energy
 04a            <PATH1>/S22                 04a            energy
 05             <PATH1>/S22                  05            energy
 05a            <PATH1>/S22                 05a            energy
 06             <PATH1>/S22                  06            energy
 06a            <PATH1>/S22                 06a            energy
 06b            <PATH1>/S22                 06b            energy
 07             <PATH1>/S22                  07            energy
 07a            <PATH1>/S22                 07a            energy
 07b            <PATH1>/S22                 07b            energy
 08             <PATH1>/S22                  08            energy
 08a            <PATH1>/S22                 08a            energy
 09             <PATH1>/S22                  09            energy
 09a            <PATH1>/S22                 09a            energy
 10             <PATH1>/S22                  10            energy
 10a            <PATH1>/S22                 10a            energy
 10b            <PATH1>/S22                 10b            energy
 11             <PATH1>/S22                  11            energy
 11a            <PATH1>/S22                 11a            energy
 12             <PATH1>/S22                  12            energy
 12a            <PATH1>/S22                 12a            energy
 13             <PATH1>/S22                  13            energy
 13a            <PATH1>/S22                 13a            energy
 14             <PATH1>/S22                  14            energy
 14a            <PATH1>/S22                 14a            energy
 14b            <PATH1>/S22                 14b            energy
 15             <PATH1>/S22                  15            energy
 15a            <PATH1>/S22                 15a            energy
 15b            <PATH1>/S22                 15b            energy
 16             <PATH1>/S22                  16            energy
 16a            <PATH1>/S22                 16a            energy
 16b            <PATH1>/S22                 16b            energy
 17             <PATH1>/S22                  17            energy
 17a            <PATH1>/S22                 17a            energy
 17b            <PATH1>/S22                 17b            energy
 18             <PATH1>/S22                  18            energy
 18a            <PATH1>/S22                 18a            energy
 18b            <PATH1>/S22                 18b            energy
 19             <PATH1>/S22                  19            energy
 19a            <PATH1>/S22                 19a            energy
 19b            <PATH1>/S22                 19b            energy
 20             <PATH1>/S22                  20            energy
 20a            <PATH1>/S22                 20a            energy
 20b            <PATH1>/S22                 20b            energy
 21             <PATH1>/S22                  21            energy
 21a            <PATH1>/S22                 21a            energy
 21b            <PATH1>/S22                 21b            energy
 22             <PATH1>/S22                  22            energy
 22a            <PATH1>/S22                 22a            energy
 22b            <PATH1>/S22                 22b            energy

# Training set for the atomization energy
#               22 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 22  627.51
#"Number" "Flag" "Scale"                            "Ref"      "Weight"
  2       01         -1     01a   2                   3.17     1.0
  2       02         -1     02a   2                   5.02     1.0
  2       03         -1     03a   2                  18.80     1.0
  2       04         -1     04a   2                  16.12     1.0
  2       05         -1     05a   2                  20.69     1.0
  3       06         -1     06a   1   06b        1   17.00     1.0
  3       07         -1     07a   1   07b        1   16.74     1.0
  2       08         -1     08a   2                   0.53     1.0
  2       09         -1     09a   2                   1.50     1.0
  3       10         -1     10a   1   10b        1    1.45     1.0
  2       11         -1     11a   2                   2.62     1.0
  2       12         -1     12a   2                   4.20     1.0
  2       13         -1     13a   2                   9.74     1.0
  3       14         -1     14a   1   14b        1    4.59     1.0
  3       15         -1     15a   1   15b        1   11.66     1.0
  3       16         -1     16a   1   16b        1    1.51     1.0
  3       17         -1     17a   1   17b        1    3.29     1.0
  3       18         -1     18a   1   18b        1    2.32     1.0
  3       19         -1     19a   1   19b        1    4.55     1.0
  3       20         -1     20a   1   20b        1    2.71     1.0
  3       21         -1     21a   1   21b        1    5.62     1.0
  3       22         -1     22a   1   22b        1    7.09     1.0
