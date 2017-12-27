# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ISO34           2              Aims

# The project description
__title__ ::
"============================== ISO34 set ============================="
"             This is ISO34 subset from GMTKN30 proposed by Grimme     "

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
#                63 is the total number of jobs in this batch list
__batch__ :: 63
#"Flag"         "DIR"                        "InpName"       "JobType"
   E10          <PATH1>/ISO34                 E10          energy
   E11          <PATH1>/ISO34                 E11          energy
   E12          <PATH1>/ISO34                 E12          energy
   E13          <PATH1>/ISO34                 E13          energy
   E14          <PATH1>/ISO34                 E14          energy
   E15          <PATH1>/ISO34                 E15          energy
   E16          <PATH1>/ISO34                 E16          energy
   E17          <PATH1>/ISO34                 E17          energy
   E18          <PATH1>/ISO34                 E18          energy
   E19          <PATH1>/ISO34                 E19          energy
    E1          <PATH1>/ISO34                  E1          energy
   E20          <PATH1>/ISO34                 E20          energy
   E21          <PATH1>/ISO34                 E21          energy
   E22          <PATH1>/ISO34                 E22          energy
   E23          <PATH1>/ISO34                 E23          energy
   E24          <PATH1>/ISO34                 E24          energy
   E25          <PATH1>/ISO34                 E25          energy
   E26          <PATH1>/ISO34                 E26          energy
   E27          <PATH1>/ISO34                 E27          energy
   E28          <PATH1>/ISO34                 E28          energy
   E29          <PATH1>/ISO34                 E29          energy
   E30          <PATH1>/ISO34                 E30          energy
   E31          <PATH1>/ISO34                 E31          energy
   E32          <PATH1>/ISO34                 E32          energy
   E33          <PATH1>/ISO34                 E33          energy
   E34          <PATH1>/ISO34                 E34          energy
    E3          <PATH1>/ISO34                  E3          energy
    E4          <PATH1>/ISO34                  E4          energy
    E5          <PATH1>/ISO34                  E5          energy
    E7          <PATH1>/ISO34                  E7          energy
    E8          <PATH1>/ISO34                  E8          energy
    E9          <PATH1>/ISO34                  E9          energy
   P10          <PATH1>/ISO34                 P10          energy
   P11          <PATH1>/ISO34                 P11          energy
   P12          <PATH1>/ISO34                 P12          energy
   P13          <PATH1>/ISO34                 P13          energy
   P14          <PATH1>/ISO34                 P14          energy
   P15          <PATH1>/ISO34                 P15          energy
   P16          <PATH1>/ISO34                 P16          energy
   P17          <PATH1>/ISO34                 P17          energy
   P18          <PATH1>/ISO34                 P18          energy
    P1          <PATH1>/ISO34                  P1          energy
   P20          <PATH1>/ISO34                 P20          energy
   P21          <PATH1>/ISO34                 P21          energy
   P23          <PATH1>/ISO34                 P23          energy
   P24          <PATH1>/ISO34                 P24          energy
   P25          <PATH1>/ISO34                 P25          energy
   P26          <PATH1>/ISO34                 P26          energy
   P27          <PATH1>/ISO34                 P27          energy
   P28          <PATH1>/ISO34                 P28          energy
   P29          <PATH1>/ISO34                 P29          energy
    P2          <PATH1>/ISO34                  P2          energy
   P30          <PATH1>/ISO34                 P30          energy
   P31          <PATH1>/ISO34                 P31          energy
   P32          <PATH1>/ISO34                 P32          energy
   P33          <PATH1>/ISO34                 P33          energy
   P34          <PATH1>/ISO34                 P34          energy
    P3          <PATH1>/ISO34                  P3          energy
    P4          <PATH1>/ISO34                  P4          energy
    P6          <PATH1>/ISO34                  P6          energy
    P7          <PATH1>/ISO34                  P7          energy
    P8          <PATH1>/ISO34                  P8          energy
    P9          <PATH1>/ISO34                  P9          energy



# Training set for the atomization energy
#               34 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 34  627.51
#"Number" "Flag"      "Scale"                       "Ref"      "Weight"
   2     E1     -1     P1      1                     1.62    1.000
   2     E1     -1     P2      1                    21.88    1.000
   2     E3     -1     P3      1                     7.20    1.000
   2     E4     -1     P4      1                     0.99    1.000
   2     E5     -1     E4      1                     0.93    1.000
   2     E4     -1     P6      1                     2.62    1.000
   2     E7     -1     P7      1                    11.15    1.000
   2     E8     -1     P8      1                    22.90    1.000
   2     E9     -1     P9      1                     6.94    1.000
   2    E10     -1    P10      1                     3.58    1.000
   2    E11     -1    P11      1                     1.91    1.000
   2    E12     -1    P12      1                    46.95    1.000
   2    E13     -1    P13      1                    36.04    1.000
   2    E14     -1    P14      1                    24.20    1.000
   2    E15     -1    P15      1                     7.26    1.000
   2    E16     -1    P16      1                    10.81    1.000
   2    E17     -1    P17      1                    26.98    1.000
   2    E18     -1    P18      1                    11.16    1.000
   2    E19     -1    E20      1                     4.60    1.000
   2    E20     -1    P20      1                    20.23    1.000
   2    E21     -1    P21      1                     0.94    1.000
   2    E22     -1    E21      1                     3.23    1.000
   2    E23     -1    P23      1                     5.26    1.000
   2    E24     -1    P24      1                    12.52    1.000
   2    E25     -1    P25      1                    26.49    1.000
   2    E26     -1    P26      1                    18.16    1.000
   2    E27     -1    P27      1                    64.17    1.000
   2    E28     -1    P28      1                    31.22    1.000
   2    E29     -1    P29      1                    11.90    1.000
   2    E30     -1    P30      1                     9.50    1.000
   2    E31     -1    P31      1                    14.05    1.000
   2    E32     -1    P32      1                     7.10    1.000
   2    E33     -1    P33      1                     5.62    1.000
   2    E34     -1    P34      1                     7.26    1.000

