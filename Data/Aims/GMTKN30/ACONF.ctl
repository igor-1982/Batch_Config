# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ACONF           2               Aims

# The project description
__title__ ::
"============================== ACONF set ============================="
"             This is ACONF subset from GMTKN30 proposed by Grimme     "

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
#                18 is the total number of jobs in this batch list
__batch__ :: 18
#"Flag"         "DIR"                        "InpName"       "JobType"
 B_T           <PATH1>/ACONF                 B_T            energy
 B_G           <PATH1>/ACONF                 B_G            energy
 P_TT          <PATH1>/ACONF                P_TT            energy
 P_TG          <PATH1>/ACONF                P_TG            energy
 P_GG          <PATH1>/ACONF                P_GG            energy
 P_GX          <PATH1>/ACONF                P_GX            energy
 H_ttt         <PATH1>/ACONF               H_ttt            energy
 H_gtt         <PATH1>/ACONF               H_gtt            energy
 H_tgt         <PATH1>/ACONF               H_tgt            energy
 H_tgg         <PATH1>/ACONF               H_tgg            energy
 H_gtg         <PATH1>/ACONF               H_gtg            energy
 H_ggg         <PATH1>/ACONF               H_ggg            energy
 H_g+t+g-      <PATH1>/ACONF            H_g+t+g-            energy
 H_g+x-t+      <PATH1>/ACONF            H_g+x-t+            energy
 H_t+g+x-      <PATH1>/ACONF            H_t+g+x-            energy
 H_g+x-g-      <PATH1>/ACONF            H_g+x-g-            energy
 H_x+g-g-      <PATH1>/ACONF            H_x+g-g-            energy
 H_x+g-x+      <PATH1>/ACONF            H_x+g-x+            energy


# Training set for the atomization energy
#               15 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 15  627.51
#"Number" "Flag" "Scale"                           "Ref"      "Weight"
  2       B_T     -1         B_G           1       0.598      1.0
  2       P_TT    -1         P_TG          1       0.614      1.0
  2       P_TT    -1         P_GG          1       0.961      1.0
  2       P_TT    -1         P_GX          1       2.813      1.0
  2       H_ttt   -1         H_gtt         1       0.595      1.0
  2       H_ttt   -1         H_tgt         1       0.604      1.0
  2       H_ttt   -1         H_tgg         1       0.934      1.0
  2       H_ttt   -1         H_gtg         1       1.178      1.0
  2       H_ttt   -1         H_g+t+g-      1       1.302      1.0
  2       H_ttt   -1         H_ggg         1       1.250      1.0
  2       H_ttt   -1         H_g+x-t+      1       2.632      1.0
  2       H_ttt   -1         H_t+g+x-      1       2.740      1.0
  2       H_ttt   -1         H_g+x-g-      1       3.283      1.0
  2       H_ttt   -1         H_x+g-g-      1       3.083      1.0
  2       H_ttt   -1         H_x+g-x+      1       4.925      1.0
