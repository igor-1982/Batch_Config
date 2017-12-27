# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./RG6           2               Aims

# The project description
__title__ ::
"============================== RG6 set ============================="
"             This is RG6 subset from GMTKN30 proposed by Grimme     "
"             ECP = aug-cc-pvTZ-PP from EMSL for Kr Xe and Rn        "

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
 ne_2           <PATH1>/RG6                 ne_2            energy
 ne             <PATH1>/RG6                   ne            energy
 ar_2           <PATH1>/RG6                 ar_2            energy
 ar             <PATH1>/RG6                   ar            energy
 ar_2           <PATH1>/RG6                 ar_2            energy
 kr             <PATH1>/RG6                   kr            energy
 kr_2           <PATH1>/RG6                 kr_2            energy
 kr             <PATH1>/RG6                   kr            energy
 rn_2           <PATH1>/RG6                 rn_2            energy
 rn             <PATH1>/RG6                   rn            energy
 xe             <PATH1>/RG6                   xe            energy
 xe_2           <PATH1>/RG6                 xe_2            energy


# Training set for the atomization energy
#               5 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 5  627.51
#"Number" "Flag" "Scale"                                           "Ref"      "Weight"
  2        ne_2       -1       ne        2                         0.08       1.0
  2        ar_2       -1       ar        2                         0.28       1.0
  2        kr_2       -1       kr        2                         0.40       1.0
  2        xe_2       -1       xe        2                         0.56       1.0
  2        rn_2       -1       rn        2                         0.79       1.0 
