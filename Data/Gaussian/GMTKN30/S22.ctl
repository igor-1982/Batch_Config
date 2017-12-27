# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./S22           2              Gaussian

# The project description
__title__ ::
"============================== S22 set ============================="
"             This is S22 subset from GMTKN30 proposed by Grimme     "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/G3Large NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                56 is the total number of jobs in this batch list
__batch__ :: 56
#"Flag"         "DIR"                        "InpName"       "JobType"
 01             <PATH1>/S22                  01.com            energy
 01a            <PATH1>/S22                 01a.com            energy
 02             <PATH1>/S22                  02.com            energy
 02a            <PATH1>/S22                 02a.com            energy
 03             <PATH1>/S22                  03.com            energy
 03a            <PATH1>/S22                 03a.com            energy
 04             <PATH1>/S22                  04.com            energy
 04a            <PATH1>/S22                 04a.com            energy
 05             <PATH1>/S22                  05.com            energy
 05a            <PATH1>/S22                 05a.com            energy
 06             <PATH1>/S22                  06.com            energy
 06a            <PATH1>/S22                 06a.com            energy
 06b            <PATH1>/S22                 06b.com            energy
 07             <PATH1>/S22                  07.com            energy
 07a            <PATH1>/S22                 07a.com            energy
 07b            <PATH1>/S22                 07b.com            energy
 08             <PATH1>/S22                  08.com            energy
 08a            <PATH1>/S22                 08a.com            energy
 09             <PATH1>/S22                  09.com            energy
 09a            <PATH1>/S22                 09a.com            energy
 10             <PATH1>/S22                  10.com            energy
 10a            <PATH1>/S22                 10a.com            energy
 10b            <PATH1>/S22                 10b.com            energy
 11             <PATH1>/S22                  11.com            energy
 11a            <PATH1>/S22                 11a.com            energy
 12             <PATH1>/S22                  12.com            energy
 12a            <PATH1>/S22                 12a.com            energy
 13             <PATH1>/S22                  13.com            energy
 13a            <PATH1>/S22                 13a.com            energy
 14             <PATH1>/S22                  14.com            energy
 14a            <PATH1>/S22                 14a.com            energy
 14b            <PATH1>/S22                 14b.com            energy
 15             <PATH1>/S22                  15.com            energy
 15a            <PATH1>/S22                 15a.com            energy
 15b            <PATH1>/S22                 15b.com            energy
 16             <PATH1>/S22                  16.com            energy
 16a            <PATH1>/S22                 16a.com            energy
 16b            <PATH1>/S22                 16b.com            energy
 17             <PATH1>/S22                  17.com            energy
 17a            <PATH1>/S22                 17a.com            energy
 17b            <PATH1>/S22                 17b.com            energy
 18             <PATH1>/S22                  18.com            energy
 18a            <PATH1>/S22                 18a.com            energy
 18b            <PATH1>/S22                 18b.com            energy
 19             <PATH1>/S22                  19.com            energy
 19a            <PATH1>/S22                 19a.com            energy
 19b            <PATH1>/S22                 19b.com            energy
 20             <PATH1>/S22                  20.com            energy
 20a            <PATH1>/S22                 20a.com            energy
 20b            <PATH1>/S22                 20b.com            energy
 21             <PATH1>/S22                  21.com            energy
 21a            <PATH1>/S22                 21a.com            energy
 21b            <PATH1>/S22                 21b.com            energy
 22             <PATH1>/S22                  22.com            energy
 22a            <PATH1>/S22                 22a.com            energy
 22b            <PATH1>/S22                 22b.com            energy

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
