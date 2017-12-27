# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./DARC            2              Aims

# The project description
__title__ ::
"============================== DARC set ============================="
"        This is DARC subset from GMTKN30 proposed by Grimme          "

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
#              22 is the total number of jobs in this batch list
__batch__ :: 22
#  "Flag"         "DIR"                               "InpName"       "JobType"
   butadiene      <PATH1>/DARC                        butadiene    energy
     chdiene      <PATH1>/DARC                          chdiene    energy
     cpdiene      <PATH1>/DARC                          cpdiene    energy
      ethene      <PATH1>/DARC                           ethene    energy
      ethine      <PATH1>/DARC                           ethine    energy
      furane      <PATH1>/DARC                           furane    energy
      malein      <PATH1>/DARC                           malein    energy
    maleinNH      <PATH1>/DARC                         maleinNH    energy
         P10      <PATH1>/DARC                              P10    energy
        P10X      <PATH1>/DARC                             P10X    energy
          P1      <PATH1>/DARC                               P1    energy
          P2      <PATH1>/DARC                               P2    energy
          P3      <PATH1>/DARC                               P3    energy
          P4      <PATH1>/DARC                               P4    energy
          P5      <PATH1>/DARC                               P5    energy
          P6      <PATH1>/DARC                               P6    energy
          P7      <PATH1>/DARC                               P7    energy
         P7X      <PATH1>/DARC                              P7X    energy
          P8      <PATH1>/DARC                               P8    energy
         P8X      <PATH1>/DARC                              P8X    energy
          P9      <PATH1>/DARC                               P9    energy
         P9X      <PATH1>/DARC                              P9X    energy



# Training set for the atomization energy
#              14 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 14  627.51
#"Number" "Flag" "Scale"                                          "Ref"      "Weight"
   3     ethene   -1    butadiene     -1    P1     1              -43.8    1.0000
   3     ethine   -1    butadiene     -1    P2     1              -59.3    1.0000
   3     ethene   -1      cpdiene     -1    P3     1              -30.0    1.0000
   3     ethine   -1      cpdiene     -1    P4     1              -33.1    1.0000
   3     ethene   -1      chdiene     -1    P5     1              -36.5    1.0000
   3     ethine   -1      chdiene     -1    P6     1              -48.2    1.0000
   3     furane   -1       malein     -1    P7     1              -14.4    1.0000
   3     furane   -1       malein     -1    P7X    1              -16.2    1.0000
   3     furane   -1     maleinNH     -1    P8     1              -17.2    1.0000
   3     furane   -1     maleinNH     -1    P8X    1              -19.2    1.0000
   3    cpdiene   -1       malein     -1    P9     1              -31.6    1.0000
   3    cpdiene   -1       malein     -1    P9X    1              -32.1    1.0000
   3    cpdiene   -1     maleinNH     -1    P10    1              -34.1    1.0000
   3    cpdiene   -1     maleinNH     -1    P10X   1              -34.4    1.0000
