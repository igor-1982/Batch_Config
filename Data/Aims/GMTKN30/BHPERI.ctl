# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BHPERI           2             Aims 

# The project description
__title__ ::
"============================== BHPERI set ============================="
"        This is BHPERI subset from GMTKN30 proposed by Grimme          "

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
#                61 is the total number of jobs in this batch list
__batch__ :: 61
#                        "Flag"         "DIR"                                    "InpName"       "JobType"
                           00r          <PATH1>/BHPERI                            00r         energy
                           01r          <PATH1>/BHPERI                            01r         energy
                          01ts          <PATH1>/BHPERI                           01ts         energy
                           02r          <PATH1>/BHPERI                            02r         energy
                          02ts          <PATH1>/BHPERI                           02ts         energy
                           03r          <PATH1>/BHPERI                            03r         energy
                          03ts          <PATH1>/BHPERI                           03ts         energy
                           04r          <PATH1>/BHPERI                            04r         energy
                          04ts          <PATH1>/BHPERI                           04ts         energy
                           05r          <PATH1>/BHPERI                            05r         energy
                          05ts          <PATH1>/BHPERI                           05ts         energy
                          06ts          <PATH1>/BHPERI                           06ts         energy
                           07r          <PATH1>/BHPERI                            07r         energy
                          07ts          <PATH1>/BHPERI                           07ts         energy
                          08ts          <PATH1>/BHPERI                           08ts         energy
                           09r          <PATH1>/BHPERI                            09r         energy
                          09ts          <PATH1>/BHPERI                           09ts         energy
                 1_3-Butadiene          <PATH1>/BHPERI                  1_3-Butadiene         energy
                       13_c2h4          <PATH1>/BHPERI                        13_c2h4         energy
            1_3-Cyclohexadiene          <PATH1>/BHPERI             1_3-Cyclohexadiene         energy
           1_3-Cyclopentadiene          <PATH1>/BHPERI            1_3-Cyclopentadiene         energy
                1_3-Pentadiene          <PATH1>/BHPERI                 1_3-Pentadiene         energy
                         13r_1          <PATH1>/BHPERI                          13r_1         energy
                         13r_2          <PATH1>/BHPERI                          13r_2         energy
                         13r_3          <PATH1>/BHPERI                          13r_3         energy
                         13r_4          <PATH1>/BHPERI                          13r_4         energy
                         13r_5          <PATH1>/BHPERI                          13r_5         energy
                         13r_6          <PATH1>/BHPERI                          13r_6         energy
                         13r_7          <PATH1>/BHPERI                          13r_7         energy
                         13r_8          <PATH1>/BHPERI                          13r_8         energy
                         13r_9          <PATH1>/BHPERI                          13r_9         energy
                       13ts_1a          <PATH1>/BHPERI                        13ts_1a         energy
                       13ts_2a          <PATH1>/BHPERI                        13ts_2a         energy
                       13ts_3a          <PATH1>/BHPERI                        13ts_3a         energy
                       13ts_4a          <PATH1>/BHPERI                        13ts_4a         energy
                       13ts_5a          <PATH1>/BHPERI                        13ts_5a         energy
                       13ts_6a          <PATH1>/BHPERI                        13ts_6a         energy
                       13ts_7a          <PATH1>/BHPERI                        13ts_7a         energy
                       13ts_8a          <PATH1>/BHPERI                        13ts_8a         energy
                       13ts_9a          <PATH1>/BHPERI                        13ts_9a         energy
                 1_5-Hexadiene          <PATH1>/BHPERI                  1_5-Hexadiene         energy
              Benzocyclobutane          <PATH1>/BHPERI               Benzocyclobutane         energy
          cis-1_3_5-Hexatriene          <PATH1>/BHPERI           cis-1_3_5-Hexatriene         energy
 Cis-triscyclopropacyclohexane          <PATH1>/BHPERI  Cis-triscyclopropacyclohexane         energy
                   Cyclobutene          <PATH1>/BHPERI                    Cyclobutene         energy
                   Cyclohexene          <PATH1>/BHPERI                    Cyclohexene         energy
        Cyclonona-1_4_7-triene          <PATH1>/BHPERI         Cyclonona-1_4_7-triene         energy
                      Ethylene          <PATH1>/BHPERI                       Ethylene         energy
                    Norbornene          <PATH1>/BHPERI                     Norbornene         energy
                ortho-xylylene          <PATH1>/BHPERI                 ortho-xylylene         energy
                          TS10          <PATH1>/BHPERI                           TS10         energy
                          TS11          <PATH1>/BHPERI                           TS11         energy
                           TS1          <PATH1>/BHPERI                            TS1         energy
                           TS2          <PATH1>/BHPERI                            TS2         energy
                           TS3          <PATH1>/BHPERI                            TS3         energy
                           TS4          <PATH1>/BHPERI                            TS4         energy
                           TS5          <PATH1>/BHPERI                            TS5         energy
                           TS6          <PATH1>/BHPERI                            TS6         energy
                           TS7          <PATH1>/BHPERI                            TS7         energy
                           TS8          <PATH1>/BHPERI                            TS8         energy
                           TS9          <PATH1>/BHPERI                            TS9         energy


# Training set for the atomization energy
#               26 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 26  627.51
#"Number" "Flag"                         "Scale"                                     "Ref"      "Weight"
  2       Cyclobutene                       -1   TS1         1                        35.34000  1.000 
  2       cis-1_3_5-Hexatriene              -1   TS2         1                        30.92000  1.000 
  2       ortho-xylylene                    -1   TS3         1                        28.30000  1.000 
  2       1_3-Pentadiene                    -1   TS4         1                        39.56000  1.000 
  2       1_3-Cyclopentadiene               -1   TS5         1                        28.18000  1.000 
  2       1_5-Hexadiene                     -1   TS6         1                        35.64000  1.000 
  3       1_3-Butadiene                     -1   Ethylene   -1     TS7          1     22.14000  1.000 
  3       1_3-Cyclopentadiene               -1   Ethylene   -1     TS8          1     18.26000  1.000 
  2       1_3-Cyclopentadiene               -2   TS11        1                        9.800000  1.000 
  2       Cis-triscyclopropacyclohexane     -1   TS9         1                        23.55000  1.000 
  3       13r_1                             -1   13_c2h4    -1    13ts_1a       1     26.30000  1.000 
  3       13r_2                             -1   13_c2h4    -1    13ts_2a       1     18.10000  1.000 
  3       13r_3                             -1   13_c2h4    -1    13ts_3a       1     12.20000  1.000 
  3       13r_4                             -1   13_c2h4    -1    13ts_4a       1     11.10000  1.000 
  3       13r_5                             -1   13_c2h4    -1    13ts_5a       1     5.300000  1.000 
  3       13r_6                             -1   13_c2h4    -1    13ts_6a       1     4.000000  1.000 
  3       13r_7                             -1   13_c2h4    -1    13ts_7a       1     11.50000  1.000 
  3       13r_8                             -1   13_c2h4    -1    13ts_8a       1     4.000000  1.000 
  3       13r_9                             -1   13_c2h4    -1    13ts_9a       1     -1.40000  1.000 
  3       02r                               -1   00r        -1    02ts          1     14.98367  1.000 
  3       03r                               -1   00r        -1    03ts          1     13.52973  1.000 
  3       04r                               -1   00r        -1    04ts          1     19.80797  1.000 
  3       05r                               -1   00r        -1    06ts          1     25.35452  1.000 
  3       07r                               -1   00r        -1    07ts          1     18.10114  1.000 
  3       07r                               -1   00r        -1    08ts          1     18.19276  1.000 
  3       09r                               -1   00r        -1    09ts          1     28.07415  1.000 

