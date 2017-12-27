# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./O3ADD6           2             Aims 

# The project description
__title__ ::
"============================== O3ADD6 set ============================="
"             This is O3ADD6 subset from GMTKN30 proposed by Grimme     "

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
#                9 is the total number of jobs in this batch list
__batch__ :: 9
#"Flag"         "DIR"                        "InpName"       "JobType"
        c2h2    <PATH1>/O3ADD6             c2h2          energy
        c2h4    <PATH1>/O3ADD6             c2h4          energy
 o3_c2h2_add    <PATH1>/O3ADD6      o3_c2h2_add          energy
  o3_c2h2_ts    <PATH1>/O3ADD6       o3_c2h2_ts          energy
 o3_c2h2_vdw    <PATH1>/O3ADD6      o3_c2h2_vdw          energy
 o3_c2h4_add    <PATH1>/O3ADD6      o3_c2h4_add          energy
  o3_c2h4_ts    <PATH1>/O3ADD6       o3_c2h4_ts          energy
 o3_c2h4_vdw    <PATH1>/O3ADD6      o3_c2h4_vdw          energy
          o3    <PATH1>/O3ADD6               o3          energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
 3    o3     -1    c2h2     -1  o3_c2h2_vdw      1           -1.90       1.0
 3    o3     -1    c2h2     -1  o3_c2h2_ts       1            7.74       1.0
 3    o3     -1    c2h2     -1  o3_c2h2_add      1          -63.80       1.0
 3    o3     -1    c2h4     -1  o3_c2h4_vdw      1           -1.94       1.0
 3    o3     -1    c2h4     -1  o3_c2h4_ts       1            3.37       1.0
 3    o3     -1    c2h4     -1  o3_c2h4_add      1          -57.15       1.0


