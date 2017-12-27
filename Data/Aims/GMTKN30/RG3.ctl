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
"============================== RG3 set ============================="
"             This is RG3 subset modified from RG6                   "
"             which is a subset of GMTKN30 proposed by Grimme        "

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
<PATH1> = '/home/wenxinzy/export/softs/Batch_Config/Data/Q-Chem/GMTKN30'

# The molecular set to batch: 
#               9 is the total number of jobs in this batch list
__batch__ :: 9
#"Flag"         "DIR"                        "InpName"       "JobType"
 ne_2           <PATH1>/RG6                 ne_2            energy
 ne             <PATH1>/RG6                   ne            energy
 ne_cp          <PATH1>/RG6                ne_cp            energy
 ar_2           <PATH1>/RG6                 ar_2            energy
 ar             <PATH1>/RG6                   ar            energy
 ar_cp          <PATH1>/RG6                ar_cp            energy
 kr_2           <PATH1>/RG6                 kr_2            energy
 kr             <PATH1>/RG6                   kr            energy
 kr_cp          <PATH1>/RG6                kr_cp            energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag" "Scale"                                           "Ref"      "Weight"
  2        ne_2       -1       ne        2                         0.08       1.0
  2        ar_2       -1       ar        2                         0.28       1.0
  2        kr_2       -1       kr        2                         0.40       1.0
