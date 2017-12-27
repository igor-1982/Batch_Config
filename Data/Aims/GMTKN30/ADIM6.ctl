# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ADIM6           2               Aims

# The project description
__title__ ::
"============================== ADIM6 set ============================="
"             This is ADIM6 subset from GMTKN30 proposed by Grimme     "

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
#                12 is the total number of jobs in this batch list
__batch__ :: 12
#"Flag"         "DIR"                        "InpName"       "JobType"
 AM2           <PATH1>/ADIM6                  AM2            energy
 AD2           <PATH1>/ADIM6                  AD2            energy
 AM3           <PATH1>/ADIM6                  AM3            energy
 AD3           <PATH1>/ADIM6                  AD3            energy
 AM4           <PATH1>/ADIM6                  AM4            energy
 AD4           <PATH1>/ADIM6                  AD4            energy
 AM5           <PATH1>/ADIM6                  AM5            energy
 AD5           <PATH1>/ADIM6                  AD5            energy
 AM6           <PATH1>/ADIM6                  AM6            energy
 AD6           <PATH1>/ADIM6                  AD6            energy
 AM7           <PATH1>/ADIM6                  AM7            energy
 AD7           <PATH1>/ADIM6                  AD7            energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag" "Scale"                            "Ref"      "Weight"
  2         AM2    2        AD2          -1         1.30       1.0
  2         AM3    2        AD3          -1         1.97       1.0
  2         AM4    2        AD4          -1         2.79       1.0
  2         AM5    2        AD5          -1         3.68       1.0
  2         AM6    2        AD6          -1         4.61       1.0
  2         AM7    2        AD7          -1         5.60       1.0
