# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ISOL22           2            Gaussian

# The project description
__title__ ::
"============================== ISOL22 set ============================="
"             This is ISOL22 subset from GMTKN30 proposed by Grimme     "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/G3Large NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#               44 is the total number of jobs in this batch list
__batch__ :: 44
#"Flag"         "DIR"                        "InpName"       "JobType"
   i10e          <PATH1>/ISOL22                  i10e.com    energy
   i10p          <PATH1>/ISOL22                  i10p.com    energy
   i11e          <PATH1>/ISOL22                  i11e.com    energy
   i11p          <PATH1>/ISOL22                  i11p.com    energy
   i12e          <PATH1>/ISOL22                  i12e.com    energy
   i12p          <PATH1>/ISOL22                  i12p.com    energy
   i13e          <PATH1>/ISOL22                  i13e.com    energy
   i13p          <PATH1>/ISOL22                  i13p.com    energy
   i14e          <PATH1>/ISOL22                  i14e.com    energy
   i14p          <PATH1>/ISOL22                  i14p.com    energy
   i15e          <PATH1>/ISOL22                  i15e.com    energy
   i15p          <PATH1>/ISOL22                  i15p.com    energy
   i16e          <PATH1>/ISOL22                  i16e.com    energy
   i16p          <PATH1>/ISOL22                  i16p.com    energy
   i17e          <PATH1>/ISOL22                  i17e.com    energy
   i17p          <PATH1>/ISOL22                  i17p.com    energy
   i18e          <PATH1>/ISOL22                  i18e.com    energy
   i18p          <PATH1>/ISOL22                  i18p.com    energy
   i19e          <PATH1>/ISOL22                  i19e.com    energy
   i19p          <PATH1>/ISOL22                  i19p.com    energy
   i20e          <PATH1>/ISOL22                  i20e.com    energy
   i20p          <PATH1>/ISOL22                  i20p.com    energy
   i21e          <PATH1>/ISOL22                  i21e.com    energy
   i21p          <PATH1>/ISOL22                  i21p.com    energy
   i22e          <PATH1>/ISOL22                  i22e.com    energy
   i22p          <PATH1>/ISOL22                  i22p.com    energy
   i23e          <PATH1>/ISOL22                  i23e.com    energy
   i23p          <PATH1>/ISOL22                  i23p.com    energy
   i24e          <PATH1>/ISOL22                  i24e.com    energy
   i24p          <PATH1>/ISOL22                  i24p.com    energy
    i2e          <PATH1>/ISOL22                   i2e.com    energy
    i2p          <PATH1>/ISOL22                   i2p.com    energy
    i3e          <PATH1>/ISOL22                   i3e.com    energy
    i3p          <PATH1>/ISOL22                   i3p.com    energy
    i5e          <PATH1>/ISOL22                   i5e.com    energy
    i5p          <PATH1>/ISOL22                   i5p.com    energy
    i6e          <PATH1>/ISOL22                   i6e.com    energy
    i6p          <PATH1>/ISOL22                   i6p.com    energy
    i7e          <PATH1>/ISOL22                   i7e.com    energy
    i7p          <PATH1>/ISOL22                   i7p.com    energy
    i8e          <PATH1>/ISOL22                   i8e.com    energy
    i8p          <PATH1>/ISOL22                   i8p.com    energy
    i9e          <PATH1>/ISOL22                   i9e.com    energy
    i9p          <PATH1>/ISOL22                   i9p.com    energy



# Training set for the atomization energy
#              22 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  22 627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  2     i2e    -1   i2p      1                                40.59      1.0000
  2     i3e    -1   i3p      1                                11.68      1.0000
  2     i5e    -1   i5p      1                                34.94      1.0000
  2     i6e    -1   i6p      1                                25.89      1.0000
  2     i7e    -1   i7p      1                                18.79      1.0000
  2     i8e    -1   i8p      1                                18.30      1.0000
  2     i9e    -1   i9p      1                                22.31      1.0000
  2    i10e    -1   i10p     1                                7.910      1.0000
  2    i11e    -1   i11p     1                                38.13      1.0000
  2    i12e    -1   i12p     1                                0.960      1.0000
  2    i13e    -1   i13p     1                                35.08      1.0000
  2    i14e    -1   i14p     1                                5.200      1.0000
  2    i15e    -1   i15p     1                                3.870      1.0000
  2    i16e    -1   i16p     1                                22.59      1.0000
  2    i17e    -1   i17p     1                                11.07      1.0000
  2    i18e    -1   i18p     1                                26.08      1.0000
  2    i19e    -1   i19p     1                                17.02      1.0000
  2    i20e    -1   i20p     1                                4.520      1.0000
  2    i21e    -1   i21p     1                                13.38      1.0000
  2    i22e    -1   i22p     1                                0.480      1.0000
  2    i23e    -1   i23p     1                                27.61      1.0000
  2    i24e    -1   i24p     1                                16.05      1.0000

