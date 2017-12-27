# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./SIE11           2              Aims

# The project description
__title__ ::
"============================== SIE11 set ============================="
"             This is SIE11 subset from GMTKN30 proposed by Grimme     "


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
#                29 is the total number of jobs in this batch list
__batch__ :: 29
#"Flag"         "DIR"                        "InpName"       "JobType"
  aceton+       <PATH1>/SIE11                aceton+      energy
   acetyl       <PATH1>/SIE11                 acetyl      energy
     but+       <PATH1>/SIE11                   but+      energy
       bz       <PATH1>/SIE11                     bz      energy
    bz_li       <PATH1>/SIE11                  bz_li      energy
     c2h4       <PATH1>/SIE11                   c2h4      energy
  c2h4_f2       <PATH1>/SIE11                c2h4_f2      energy
      ch3       <PATH1>/SIE11                    ch3      energy
    clclf       <PATH1>/SIE11                  clclf      energy
    clfcl       <PATH1>/SIE11                  clfcl      energy
      clf       <PATH1>/SIE11                    clf      energy
    ethyl       <PATH1>/SIE11                  ethyl      energy
   ethyl+       <PATH1>/SIE11                 ethyl+      energy
       f2       <PATH1>/SIE11                     f2      energy
    h2o2+       <PATH1>/SIE11                  h2o2+      energy
      h2o       <PATH1>/SIE11                    h2o      energy
     h2o+       <PATH1>/SIE11                   h2o+      energy
     he2+       <PATH1>/SIE11                   he2+      energy
       he       <PATH1>/SIE11                     he      energy
      he+       <PATH1>/SIE11                    he+      energy
       li       <PATH1>/SIE11                     li      energy
    li_f2       <PATH1>/SIE11                  li_f2      energy
      mgo       <PATH1>/SIE11                    mgo      energy
       na       <PATH1>/SIE11                     na      energy
    naomg       <PATH1>/SIE11                  naomg      energy
    nh32+       <PATH1>/SIE11                  nh32+      energy
  nh3_clf       <PATH1>/SIE11                nh3_clf      energy
      nh3       <PATH1>/SIE11                    nh3      energy
     nh3+       <PATH1>/SIE11                   nh3+      energy


# Training set for the atomization energy
#               11 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 11  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  3   he      1   he+       1      he2+       -1               57.44      1.000
  3   nh3     1   nh3+      1      nh32+      -1               35.34      1.000
  3   h2o     1   h2o+      1      h2o2+      -1               37.25      1.000
  3   but+   -1   ethyl     1      ethyl+      1               35.28      1.000
  3   ch3     1   acetyl    1      aceton+    -1               22.57      1.000
  2   clclf   1   clfcl    -1                                 -1.010      1.000
  3   c2h4    1   f2        1      c2h4_f2    -1               1.080      1.000
  3   li      1   bz        1      bz_li      -1               9.500      1.000
  3   nh3     1   clf       1      nh3_clf    -1               10.50      1.000
  3   mgo     1   na        1      naomg      -1               69.56      1.000
  3   li      1   f2        1      li_f2      -1               94.36      1.000
 


