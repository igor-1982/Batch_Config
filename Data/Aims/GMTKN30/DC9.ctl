# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./DC9            2               Aims

# The project description
__title__ ::
"============================== DC9 set ============================="
"        This is DC9 subset from GMTKN30 proposed by Grimme          "


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
#              19 is the total number of jobs in this batch list
__batch__ :: 19
#  "Flag"         "DIR"                               "InpName"       "JobType"
        13dip     <PATH1>/DC9                         13dip        energy
          be4     <PATH1>/DC9                           be4        energy
           be     <PATH1>/DC9                            be        energy
      c20bowl     <PATH1>/DC9                       c20bowl        energy
      c20cage     <PATH1>/DC9                       c20cage        energy
    carbooxo1     <PATH1>/DC9                     carbooxo1        energy
    carbooxo2     <PATH1>/DC9                     carbooxo2        energy
        ch2n2     <PATH1>/DC9                         ch2n2        energy
        ethen     <PATH1>/DC9                         ethen        energy
 heptahexaene     <PATH1>/DC9                  heptahexaene        energy
  heptatriyne     <PATH1>/DC9                   heptatriyne        energy
      ISO_E35     <PATH1>/DC9                       ISO_E35        energy
      ISO_E36     <PATH1>/DC9                       ISO_E36        energy
      ISO_P35     <PATH1>/DC9                       ISO_P35        energy
      ISO_P36     <PATH1>/DC9                       ISO_P36        energy
         omcb     <PATH1>/DC9                          omcb        energy
           s2     <PATH1>/DC9                            s2        energy
           s8     <PATH1>/DC9                            s8        energy
      tmethen     <PATH1>/DC9                       tmethen        energy



# Training set for the atomization energy
#               9 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 9  627.51
#"Number" "Flag" "Scale"                                          "Ref"      "Weight"
  2        ISO_E36     1          ISO_P36     -1                   -1.0       1.0000
  2        c20cage    -1          c20bowl      1                  -13.3       1.0000
  2    heptatriyne     1     heptahexaene     -1                  -14.3       1.0000
  2        tmethen    -2             omcb      1                  -19.2       1.0000
  2        ISO_E35     1          ISO_P35     -1                  -19.5       1.0000
  2      carbooxo2    -1        carbooxo1      1                  -26.9       1.0000
  3          ethen    -1            ch2n2     -1     13dip    1   -38.1       1.0000
  2            be4     1               be     -4                  -88.4       1.0000
  2             s2    -4               s8      1                 -101.0       1.0000
