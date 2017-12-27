# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ALK6           2               Aims

# The project description
__title__ ::
"============================== ALK6 set ============================="
"        This is ALK6 subset from GMTKN30 proposed by Grimme          "

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
#              13 is the total number of jobs in this batch list
__batch__ :: 13
#  "Flag"         "DIR"                        "InpName"       "JobType"
     bz          <PATH1>/ALK6                    bz         energy
  bz_k+          <PATH1>/ALK6                 bz_k+         energy
 bz_li+          <PATH1>/ALK6                bz_li+         energy
 bz_na+          <PATH1>/ALK6                bz_na+         energy
     k2          <PATH1>/ALK6                    k2         energy
     k8          <PATH1>/ALK6                    k8         energy
     k+          <PATH1>/ALK6                    k+         energy
    li2          <PATH1>/ALK6                   li2         energy
    li8          <PATH1>/ALK6                   li8         energy
    li+          <PATH1>/ALK6                   li+         energy
    na2          <PATH1>/ALK6                   na2         energy
    na8          <PATH1>/ALK6                   na8         energy
    na+          <PATH1>/ALK6                   na+         energy



# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag" "Scale"                             "Ref"      "Weight"
  3     li+     1     bz     1    bz_li+     -1      38.4       1.000
  3     na+     1     bz     1    bz_na+     -1      25.0       1.000
  3      k+     1     bz     1     bz_k+     -1      19.2       1.000
  2     li2     4    li8    -1                       83.2       1.000
  2     na2     4    na8    -1                       54.6       1.000
  2      k2     4     k8    -1                       47.1       1.000
