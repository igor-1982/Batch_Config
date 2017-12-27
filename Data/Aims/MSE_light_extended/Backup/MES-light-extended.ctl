# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./MES-light           2                Aims

# The project description
__title__ ::
"============================== MES-light set ============================="
"                                                                          "

# several global statements of control.in for aims Package
__aims_basis__ :: /home/zhang/Documents/Package-Pool/aims/my_basis_pool/gaussian/cc-pVDZ
__aims__ ::  2  081912.mpi
xc                      pbe                  
total_energy_method     rpa
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.6
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           200
rpa_frozen_core         1
end aims          



# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/home/zhang/Dropbox/SourceCode-Pool/Batch_Config/Data/Aims/GMTKN30/'

# The molecular set to batch: 
#                56 is the total number of jobs in this batch list
__batch__ :: 8
#"Flag"         "DIR"                        "InpName"       "JobType"
 01             <PATH1>/S22                  01            energy|rpa
 01a            <PATH1>/S22                 01a            energy|rpa
 02             <PATH1>/S22                  02            energy|rpa
 02a            <PATH1>/S22                 02a            energy|rpa
 03             <PATH1>/S22                  03            energy|rpa
 03a            <PATH1>/S22                 03a            energy|rpa
 04             <PATH1>/S22                  04            energy|rpa
 04a            <PATH1>/S22                 04a            energy|rpa
 05             <PATH1>/S22                  05            energy|rpa
 05a            <PATH1>/S22                 05a            energy|rpa
 06             <PATH1>/S22                  06            energy|rpa
 06a            <PATH1>/S22                 06a            energy|rpa
 06b            <PATH1>/S22                 06b            energy|rpa
 07             <PATH1>/S22                  07            energy|rpa
 07a            <PATH1>/S22                 07a            energy|rpa
 07b            <PATH1>/S22                 07b            energy|rpa
 08             <PATH1>/S22                  08            energy|rpa
 08a            <PATH1>/S22                 08a            energy|rpa
 09             <PATH1>/S22                  09            energy|rpa
 09a            <PATH1>/S22                 09a            energy|rpa
 10             <PATH1>/S22                  10            energy|rpa
 10a            <PATH1>/S22                 10a            energy|rpa
 10b            <PATH1>/S22                 10b            energy|rpa
 11             <PATH1>/S22                  11            energy|rpa
 11a            <PATH1>/S22                 11a            energy|rpa
 12             <PATH1>/S22                  12            energy|rpa
 12a            <PATH1>/S22                 12a            energy|rpa
 13             <PATH1>/S22                  13            energy|rpa
 13a            <PATH1>/S22                 13a            energy|rpa
 14             <PATH1>/S22                  14            energy|rpa
 14a            <PATH1>/S22                 14a            energy|rpa
 14b            <PATH1>/S22                 14b            energy|rpa
 15             <PATH1>/S22                  15            energy|rpa
 15a            <PATH1>/S22                 15a            energy|rpa
 15b            <PATH1>/S22                 15b            energy|rpa
 16             <PATH1>/S22                  16            energy|rpa
 16a            <PATH1>/S22                 16a            energy|rpa
 16b            <PATH1>/S22                 16b            energy|rpa
 17             <PATH1>/S22                  17            energy|rpa
 17a            <PATH1>/S22                 17a            energy|rpa
 17b            <PATH1>/S22                 17b            energy|rpa
 18             <PATH1>/S22                  18            energy|rpa
 18a            <PATH1>/S22                 18a            energy|rpa
 18b            <PATH1>/S22                 18b            energy|rpa
 19             <PATH1>/S22                  19            energy|rpa
 19a            <PATH1>/S22                 19a            energy|rpa
 19b            <PATH1>/S22                 19b            energy|rpa
 20             <PATH1>/S22                  20            energy|rpa
 20a            <PATH1>/S22                 20a            energy|rpa
 20b            <PATH1>/S22                 20b            energy|rpa
 21             <PATH1>/S22                  21            energy|rpa
 21a            <PATH1>/S22                 21a            energy|rpa
 21b            <PATH1>/S22                 21b            energy|rpa
 22             <PATH1>/S22                  22            energy|rpa
 22a            <PATH1>/S22                 22a            energy|rpa
 22b            <PATH1>/S22                 22b            energy|rpa

# Training set for the atomization energy
#               22 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 4  627.51
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
