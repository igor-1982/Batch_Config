# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./RSE43           2             QChem 

# The project description
__title__ ::
"============================== RSE43 set ============================="
"             This is RSE43 subset from GMTKN30 proposed by Grimme     "

# Machine and option keyword of Gaussian Package
__qchem__ :: 1 rmp2 # Following lines are machine and option keywords of Gau-Softs
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
#                88 is the total number of jobs in this batch list
__batch__ :: 88
#"Flag"         "DIR"                        "InpName"       "JobType"
   E10          <PATH1>/RSE43                E10.in          energy
   E11          <PATH1>/RSE43                E11.in          energy
   E12          <PATH1>/RSE43                E12.in          energy
   E13          <PATH1>/RSE43                E13.in          energy
   E15          <PATH1>/RSE43                E15.in          energy
   E16          <PATH1>/RSE43                E16.in          energy
   E17          <PATH1>/RSE43                E17.in          energy
   E18          <PATH1>/RSE43                E18.in          energy
   E19          <PATH1>/RSE43                E19.in          energy
    E1          <PATH1>/RSE43                 E1.in          energy
   E20          <PATH1>/RSE43                E20.in          energy
   E21          <PATH1>/RSE43                E21.in          energy
   E22          <PATH1>/RSE43                E22.in          energy
   E23          <PATH1>/RSE43                E23.in          energy
   E24          <PATH1>/RSE43                E24.in          energy
   E25          <PATH1>/RSE43                E25.in          energy
   E26          <PATH1>/RSE43                E26.in          energy
   E27          <PATH1>/RSE43                E27.in          energy
   E28          <PATH1>/RSE43                E28.in          energy
   E29          <PATH1>/RSE43                E29.in          energy
    E2          <PATH1>/RSE43                 E2.in          energy
   E30          <PATH1>/RSE43                E30.in          energy
   E31          <PATH1>/RSE43                E31.in          energy
   E32          <PATH1>/RSE43                E32.in          energy
   E33          <PATH1>/RSE43                E33.in          energy
   E34          <PATH1>/RSE43                E34.in          energy
   E35          <PATH1>/RSE43                E35.in          energy
   E36          <PATH1>/RSE43                E36.in          energy
   E37          <PATH1>/RSE43                E37.in          energy
   E38          <PATH1>/RSE43                E38.in          energy
   E39          <PATH1>/RSE43                E39.in          energy
    E3          <PATH1>/RSE43                 E3.in          energy
   E40          <PATH1>/RSE43                E40.in          energy
   E41          <PATH1>/RSE43                E41.in          energy
   E42          <PATH1>/RSE43                E42.in          energy
   E43          <PATH1>/RSE43                E43.in          energy
   E44          <PATH1>/RSE43                E44.in          energy
   E45          <PATH1>/RSE43                E45.in          energy
    E4          <PATH1>/RSE43                 E4.in          energy
    E5          <PATH1>/RSE43                 E5.in          energy
    E6          <PATH1>/RSE43                 E6.in          energy
    E7          <PATH1>/RSE43                 E7.in          energy
    E8          <PATH1>/RSE43                 E8.in          energy
    E9          <PATH1>/RSE43                 E9.in          energy
   P10          <PATH1>/RSE43                P10.in          energy
   P11          <PATH1>/RSE43                P11.in          energy
   P12          <PATH1>/RSE43                P12.in          energy
   P13          <PATH1>/RSE43                P13.in          energy
   P15          <PATH1>/RSE43                P15.in          energy
   P16          <PATH1>/RSE43                P16.in          energy
   P17          <PATH1>/RSE43                P17.in          energy
   P18          <PATH1>/RSE43                P18.in          energy
   P19          <PATH1>/RSE43                P19.in          energy
    P1          <PATH1>/RSE43                 P1.in          energy
   P20          <PATH1>/RSE43                P20.in          energy
   P21          <PATH1>/RSE43                P21.in          energy
   P22          <PATH1>/RSE43                P22.in          energy
   P23          <PATH1>/RSE43                P23.in          energy
   P24          <PATH1>/RSE43                P24.in          energy
   P25          <PATH1>/RSE43                P25.in          energy
   P26          <PATH1>/RSE43                P26.in          energy
   P27          <PATH1>/RSE43                P27.in          energy
   P28          <PATH1>/RSE43                P28.in          energy
   P29          <PATH1>/RSE43                P29.in          energy
    P2          <PATH1>/RSE43                 P2.in          energy
   P30          <PATH1>/RSE43                P30.in          energy
   P31          <PATH1>/RSE43                P31.in          energy
   P32          <PATH1>/RSE43                P32.in          energy
   P33          <PATH1>/RSE43                P33.in          energy
   P34          <PATH1>/RSE43                P34.in          energy
   P35          <PATH1>/RSE43                P35.in          energy
   P36          <PATH1>/RSE43                P36.in          energy
   P37          <PATH1>/RSE43                P37.in          energy
   P38          <PATH1>/RSE43                P38.in          energy
   P39          <PATH1>/RSE43                P39.in          energy
    P3          <PATH1>/RSE43                 P3.in          energy
   P40          <PATH1>/RSE43                P40.in          energy
   P41          <PATH1>/RSE43                P41.in          energy
   P42          <PATH1>/RSE43                P42.in          energy
   P43          <PATH1>/RSE43                P43.in          energy
   P44          <PATH1>/RSE43                P44.in          energy
   P45          <PATH1>/RSE43                P45.in          energy
    P4          <PATH1>/RSE43                 P4.in          energy
    P5          <PATH1>/RSE43                 P5.in          energy
    P6          <PATH1>/RSE43                 P6.in          energy
    P7          <PATH1>/RSE43                 P7.in          energy
    P8          <PATH1>/RSE43                 P8.in          energy
    P9          <PATH1>/RSE43                 P9.in          energy


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


