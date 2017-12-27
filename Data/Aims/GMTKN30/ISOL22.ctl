# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ISOL22           2             Aims

# The project description
__title__ ::
"============================== ISOL22 set ============================="
"             This is ISOL22 subset from GMTKN30 proposed by Grimme     "

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
#               44 is the total number of jobs in this batch list
__batch__ :: 44
#"Flag"         "DIR"                        "InpName"       "JobType"
   i10e          <PATH1>/ISOL22              i10e         energy
   i10p          <PATH1>/ISOL22              i10p         energy
   i11e          <PATH1>/ISOL22              i11e         energy
   i11p          <PATH1>/ISOL22              i11p         energy
   i12e          <PATH1>/ISOL22              i12e         energy
   i12p          <PATH1>/ISOL22              i12p         energy
   i13e          <PATH1>/ISOL22              i13e         energy
   i13p          <PATH1>/ISOL22              i13p         energy
   i14e          <PATH1>/ISOL22              i14e         energy
   i14p          <PATH1>/ISOL22              i14p         energy
   i15e          <PATH1>/ISOL22              i15e         energy
   i15p          <PATH1>/ISOL22              i15p         energy
   i16e          <PATH1>/ISOL22              i16e         energy
   i16p          <PATH1>/ISOL22              i16p         energy
   i17e          <PATH1>/ISOL22              i17e         energy
   i17p          <PATH1>/ISOL22              i17p         energy
   i18e          <PATH1>/ISOL22              i18e         energy
   i18p          <PATH1>/ISOL22              i18p         energy
   i19e          <PATH1>/ISOL22              i19e         energy
   i19p          <PATH1>/ISOL22              i19p         energy
   i20e          <PATH1>/ISOL22              i20e         energy
   i20p          <PATH1>/ISOL22              i20p         energy
   i21e          <PATH1>/ISOL22              i21e         energy
   i21p          <PATH1>/ISOL22              i21p         energy
   i22e          <PATH1>/ISOL22              i22e         energy
   i22p          <PATH1>/ISOL22              i22p         energy
   i23e          <PATH1>/ISOL22              i23e         energy
   i23p          <PATH1>/ISOL22              i23p         energy
   i24e          <PATH1>/ISOL22              i24e         energy
   i24p          <PATH1>/ISOL22              i24p         energy
    i2e          <PATH1>/ISOL22               i2e         energy
    i2p          <PATH1>/ISOL22               i2p         energy
    i3e          <PATH1>/ISOL22               i3e         energy
    i3p          <PATH1>/ISOL22               i3p         energy
    i5e          <PATH1>/ISOL22               i5e         energy
    i5p          <PATH1>/ISOL22               i5p         energy
    i6e          <PATH1>/ISOL22               i6e         energy
    i6p          <PATH1>/ISOL22               i6p         energy
    i7e          <PATH1>/ISOL22               i7e         energy
    i7p          <PATH1>/ISOL22               i7p         energy
    i8e          <PATH1>/ISOL22               i8e         energy
    i8p          <PATH1>/ISOL22               i8p         energy
    i9e          <PATH1>/ISOL22               i9e         energy
    i9p          <PATH1>/ISOL22               i9p         energy



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

