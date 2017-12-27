# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./RSE43           2              Aims 

# The project description
__title__ ::
"============================== RSE43 set ============================="
"             This is RSE43 subset from GMTKN30 proposed by Grimme     "

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
#                88 is the total number of jobs in this batch list
__batch__ :: 88
#"Flag"         "DIR"                        "InpName"       "JobType"
   E10          <PATH1>/RSE43                E10          energy
   E11          <PATH1>/RSE43                E11          energy
   E12          <PATH1>/RSE43                E12          energy
   E13          <PATH1>/RSE43                E13          energy
   E15          <PATH1>/RSE43                E15          energy
   E16          <PATH1>/RSE43                E16          energy
   E17          <PATH1>/RSE43                E17          energy
   E18          <PATH1>/RSE43                E18          energy
   E19          <PATH1>/RSE43                E19          energy
    E1          <PATH1>/RSE43                 E1          energy
   E20          <PATH1>/RSE43                E20          energy
   E21          <PATH1>/RSE43                E21          energy
   E22          <PATH1>/RSE43                E22          energy
   E23          <PATH1>/RSE43                E23          energy
   E24          <PATH1>/RSE43                E24          energy
   E25          <PATH1>/RSE43                E25          energy
   E26          <PATH1>/RSE43                E26          energy
   E27          <PATH1>/RSE43                E27          energy
   E28          <PATH1>/RSE43                E28          energy
   E29          <PATH1>/RSE43                E29          energy
    E2          <PATH1>/RSE43                 E2          energy
   E30          <PATH1>/RSE43                E30          energy
   E31          <PATH1>/RSE43                E31          energy
   E32          <PATH1>/RSE43                E32          energy
   E33          <PATH1>/RSE43                E33          energy
   E34          <PATH1>/RSE43                E34          energy
   E35          <PATH1>/RSE43                E35          energy
   E36          <PATH1>/RSE43                E36          energy
   E37          <PATH1>/RSE43                E37          energy
   E38          <PATH1>/RSE43                E38          energy
   E39          <PATH1>/RSE43                E39          energy
    E3          <PATH1>/RSE43                 E3          energy
   E40          <PATH1>/RSE43                E40          energy
   E41          <PATH1>/RSE43                E41          energy
   E42          <PATH1>/RSE43                E42          energy
   E43          <PATH1>/RSE43                E43          energy
   E44          <PATH1>/RSE43                E44          energy
   E45          <PATH1>/RSE43                E45          energy
    E4          <PATH1>/RSE43                 E4          energy
    E5          <PATH1>/RSE43                 E5          energy
    E6          <PATH1>/RSE43                 E6          energy
    E7          <PATH1>/RSE43                 E7          energy
    E8          <PATH1>/RSE43                 E8          energy
    E9          <PATH1>/RSE43                 E9          energy
   P10          <PATH1>/RSE43                P10          energy
   P11          <PATH1>/RSE43                P11          energy
   P12          <PATH1>/RSE43                P12          energy
   P13          <PATH1>/RSE43                P13          energy
   P15          <PATH1>/RSE43                P15          energy
   P16          <PATH1>/RSE43                P16          energy
   P17          <PATH1>/RSE43                P17          energy
   P18          <PATH1>/RSE43                P18          energy
   P19          <PATH1>/RSE43                P19          energy
    P1          <PATH1>/RSE43                 P1          energy
   P20          <PATH1>/RSE43                P20          energy
   P21          <PATH1>/RSE43                P21          energy
   P22          <PATH1>/RSE43                P22          energy
   P23          <PATH1>/RSE43                P23          energy
   P24          <PATH1>/RSE43                P24          energy
   P25          <PATH1>/RSE43                P25          energy
   P26          <PATH1>/RSE43                P26          energy
   P27          <PATH1>/RSE43                P27          energy
   P28          <PATH1>/RSE43                P28          energy
   P29          <PATH1>/RSE43                P29          energy
    P2          <PATH1>/RSE43                 P2          energy
   P30          <PATH1>/RSE43                P30          energy
   P31          <PATH1>/RSE43                P31          energy
   P32          <PATH1>/RSE43                P32          energy
   P33          <PATH1>/RSE43                P33          energy
   P34          <PATH1>/RSE43                P34          energy
   P35          <PATH1>/RSE43                P35          energy
   P36          <PATH1>/RSE43                P36          energy
   P37          <PATH1>/RSE43                P37          energy
   P38          <PATH1>/RSE43                P38          energy
   P39          <PATH1>/RSE43                P39          energy
    P3          <PATH1>/RSE43                 P3          energy
   P40          <PATH1>/RSE43                P40          energy
   P41          <PATH1>/RSE43                P41          energy
   P42          <PATH1>/RSE43                P42          energy
   P43          <PATH1>/RSE43                P43          energy
   P44          <PATH1>/RSE43                P44          energy
   P45          <PATH1>/RSE43                P45          energy
    P4          <PATH1>/RSE43                 P4          energy
    P5          <PATH1>/RSE43                 P5          energy
    P6          <PATH1>/RSE43                 P6          energy
    P7          <PATH1>/RSE43                 P7          energy
    P8          <PATH1>/RSE43                 P8          energy
    P9          <PATH1>/RSE43                 P9          energy


# Training set for the atomization energy
#               43 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 43  627.51
#"Number" "Flag"      "Scale"                            "Ref"   "Weight"
  4    E2      -1   P1    -1   E1    1    P2      1      -15.2   1.00
  4    E3      -1   P1    -1   E1    1    P3      1        1.9   1.00
  4    E4      -1   P1    -1   E1    1    P4      1        6.8   1.00
  4    E5      -1   P1    -1   E1    1    P5      1        7.0   1.00
  4    E6      -1   P1    -1   E1    1    P6      1        0.1   1.00
  4    E7      -1   P1    -1   E1    1    P7      1        1.4   1.00
  4    E8      -1   P1    -1   E1    1    P8      1       -3.2   1.00
  4    E9      -1   P1    -1   E1    1    P9      1       -1.3   1.00
  4    E10     -1   P1    -1   E1    1    P10     1       -1.8   1.00
  4    E11     -1   P1    -1   E1    1    P11     1      -17.5   1.00
  4    E12     -1   P1    -1   E1    1    P12     1      -10.0   1.00
  4    E13     -1   P1    -1   E1    1    P13     1       -8.6   1.00
  4    E15     -1   P1    -1   E1    1    P15     1       -6.3   1.00
  4    E16     -1   P1    -1   E1    1    P16     1       -6.3   1.00
  4    E17     -1   P1    -1   E1    1    P17     1       -6.6   1.00
  4    E18     -1   P1    -1   E1    1    P18     1       -6.4   1.00
  4    E19     -1   P1    -1   E1    1    P19     1       -3.0   1.00
  4    E20     -1   P1    -1   E1    1    P20     1       -3.9   1.00
  4    E21     -1   P1    -1   E1    1    P21     1      -12.0   1.00
  4    E22     -1   P1    -1   E1    1    P22     1        4.7   1.00
  4    E23     -1   P1    -1   E1    1    P23     1      -12.6   1.00
  4    E24     -1   P1    -1   E1    1    P24     1      -11.1   1.00
  4    E25     -1   P1    -1   E1    1    P25     1       -8.6   1.00
  4    E26     -1   P1    -1   E1    1    P26     1      -12.8   1.00
  4    E27     -1   P1    -1   E1    1    P27     1       -3.3   1.00
  4    E28     -1   P1    -1   E1    1    P28     1       -3.9   1.00
  4    E29     -1   P1    -1   E1    1    P29     1       -2.7   1.00
  4    E30     -1   P1    -1   E1    1    P30     1       -5.9   1.00
  4    E31     -1   P1    -1   E1    1    P31     1       -6.2   1.00
  4    E32     -1   P1    -1   E1    1    P32     1       -4.2   1.00
  4    E33     -1   P1    -1   E1    1    P33     1        0.7   1.00
  4    E34     -1   P1    -1   E1    1    P34     1      -10.8   1.00
  4    E35     -1   P1    -1   E1    1    P35     1       -8.4   1.00
  4    E36     -1   P1    -1   E1    1    P36     1        2.7   1.00
  4    E37     -1   P1    -1   E1    1    P37     1       -9.4   1.00
  4    E38     -1   P1    -1   E1    1    P38     1        0.0   1.00
  4    E39     -1   P1    -1   E1    1    P39     1       -2.9   1.00
  4    E40     -1   P1    -1   E1    1    P40     1      -22.5   1.00
  4    E41     -1   P1    -1   E1    1    P41     1      -24.1   1.00
  4    E42     -1   P1    -1   E1    1    P42     1      -25.4   1.00
  4    E43     -1   P1    -1   E1    1    P43     1      -13.1   1.00
  4    E44     -1   P1    -1   E1    1    P44     1       -6.4   1.00
  4    E45     -1   P1    -1   E1    1    P45     1       -2.3   1.00


