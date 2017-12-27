# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BHPERI           2            QChem 

# The project description
__title__ ::
"============================== BHPERI set ============================="
"        This is BHPERI subset from GMTKN30 proposed by Grimme          "

# $rem group of Q-Chem Package
__qchem__ ::  1 rmp2  # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static      = 200
mem_total       = 7500
exchange        = b3lyp
basis           = g3large
max_scf_cycles  = 50
scf_convergence = 7
symmetry        = false
xc_grid         = 000075000302
$end



# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                61 is the total number of jobs in this batch list
__batch__ :: 61
#                        "Flag"         "DIR"                                    "InpName"       "JobType"
                           00r          <PATH1>/BHPERI                            00r.in         energy
                           01r          <PATH1>/BHPERI                            01r.in         energy
                          01ts          <PATH1>/BHPERI                           01ts.in         energy
                           02r          <PATH1>/BHPERI                            02r.in         energy
                          02ts          <PATH1>/BHPERI                           02ts.in         energy
                           03r          <PATH1>/BHPERI                            03r.in         energy
                          03ts          <PATH1>/BHPERI                           03ts.in         energy
                           04r          <PATH1>/BHPERI                            04r.in         energy
                          04ts          <PATH1>/BHPERI                           04ts.in         energy
                           05r          <PATH1>/BHPERI                            05r.in         energy
                          05ts          <PATH1>/BHPERI                           05ts.in         energy
                          06ts          <PATH1>/BHPERI                           06ts.in         energy
                           07r          <PATH1>/BHPERI                            07r.in         energy
                          07ts          <PATH1>/BHPERI                           07ts.in         energy
                          08ts          <PATH1>/BHPERI                           08ts.in         energy
                           09r          <PATH1>/BHPERI                            09r.in         energy
                          09ts          <PATH1>/BHPERI                           09ts.in         energy
                 1_3-Butadiene          <PATH1>/BHPERI                  1_3-Butadiene.in         energy
                       13_c2h4          <PATH1>/BHPERI                        13_c2h4.in         energy
            1_3-Cyclohexadiene          <PATH1>/BHPERI             1_3-Cyclohexadiene.in         energy
           1_3-Cyclopentadiene          <PATH1>/BHPERI            1_3-Cyclopentadiene.in         energy
                1_3-Pentadiene          <PATH1>/BHPERI                 1_3-Pentadiene.in         energy
                         13r_1          <PATH1>/BHPERI                          13r_1.in         energy
                         13r_2          <PATH1>/BHPERI                          13r_2.in         energy
                         13r_3          <PATH1>/BHPERI                          13r_3.in         energy
                         13r_4          <PATH1>/BHPERI                          13r_4.in         energy
                         13r_5          <PATH1>/BHPERI                          13r_5.in         energy
                         13r_6          <PATH1>/BHPERI                          13r_6.in         energy
                         13r_7          <PATH1>/BHPERI                          13r_7.in         energy
                         13r_8          <PATH1>/BHPERI                          13r_8.in         energy
                         13r_9          <PATH1>/BHPERI                          13r_9.in         energy
                       13ts_1a          <PATH1>/BHPERI                        13ts_1a.in         energy
                       13ts_2a          <PATH1>/BHPERI                        13ts_2a.in         energy
                       13ts_3a          <PATH1>/BHPERI                        13ts_3a.in         energy
                       13ts_4a          <PATH1>/BHPERI                        13ts_4a.in         energy
                       13ts_5a          <PATH1>/BHPERI                        13ts_5a.in         energy
                       13ts_6a          <PATH1>/BHPERI                        13ts_6a.in         energy
                       13ts_7a          <PATH1>/BHPERI                        13ts_7a.in         energy
                       13ts_8a          <PATH1>/BHPERI                        13ts_8a.in         energy
                       13ts_9a          <PATH1>/BHPERI                        13ts_9a.in         energy
                 1_5-Hexadiene          <PATH1>/BHPERI                  1_5-Hexadiene.in         energy
              Benzocyclobutane          <PATH1>/BHPERI               Benzocyclobutane.in         energy
          cis-1_3_5-Hexatriene          <PATH1>/BHPERI           cis-1_3_5-Hexatriene.in         energy
 Cis-triscyclopropacyclohexane          <PATH1>/BHPERI  Cis-triscyclopropacyclohexane.in         energy
                   Cyclobutene          <PATH1>/BHPERI                    Cyclobutene.in         energy
                   Cyclohexene          <PATH1>/BHPERI                    Cyclohexene.in         energy
        Cyclonona-1_4_7-triene          <PATH1>/BHPERI         Cyclonona-1_4_7-triene.in         energy
                      Ethylene          <PATH1>/BHPERI                       Ethylene.in         energy
                    Norbornene          <PATH1>/BHPERI                     Norbornene.in         energy
                ortho-xylylene          <PATH1>/BHPERI                 ortho-xylylene.in         energy
                          TS10          <PATH1>/BHPERI                           TS10.in         energy
                          TS11          <PATH1>/BHPERI                           TS11.in         energy
                           TS1          <PATH1>/BHPERI                            TS1.in         energy
                           TS2          <PATH1>/BHPERI                            TS2.in         energy
                           TS3          <PATH1>/BHPERI                            TS3.in         energy
                           TS4          <PATH1>/BHPERI                            TS4.in         energy
                           TS5          <PATH1>/BHPERI                            TS5.in         energy
                           TS6          <PATH1>/BHPERI                            TS6.in         energy
                           TS7          <PATH1>/BHPERI                            TS7.in         energy
                           TS8          <PATH1>/BHPERI                            TS8.in         energy
                           TS9          <PATH1>/BHPERI                            TS9.in         energy


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

