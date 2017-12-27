# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PA             2                Aims

# The project description
__title__ ::
"============================== PA set ============================="
"             This is PA subset from GMTKN30 proposed by Grimme     "

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
#                24 is the total number of jobs in this batch list
__batch__ :: 24
#"Flag"         "DIR"                        "InpName"       "JobType"
 c2h2           <PATH1>/PA                   c2h2         energy
c2h2p           <PATH1>/PA                  c2h2p         energy
   h2           <PATH1>/PA                     h2         energy
  h2o           <PATH1>/PA                    h2o         energy
 h2op           <PATH1>/PA                   h2op         energy
  h2p           <PATH1>/PA                    h2p         energy
  h2s           <PATH1>/PA                    h2s         energy
 h2sp           <PATH1>/PA                   h2sp         energy
  hcl           <PATH1>/PA                    hcl         energy
 hclp           <PATH1>/PA                   hclp         energy
  nh3           <PATH1>/PA                    nh3         energy
 nh3p           <PATH1>/PA                   nh3p         energy
   p2           <PATH1>/PA                     p2         energy
  p2p           <PATH1>/PA                    p2p         energy
   p4           <PATH1>/PA                     p4         energy
  p4p           <PATH1>/PA                    p4p         energy
   p6           <PATH1>/PA                     p6         energy
  p6p           <PATH1>/PA                    p6p         energy
   p8           <PATH1>/PA                     p8         energy
  p8p           <PATH1>/PA                    p8p         energy
  ph3           <PATH1>/PA                    ph3         energy
 ph3p           <PATH1>/PA                   ph3p         energy
 sih4           <PATH1>/PA                   sih4         energy
sih4p           <PATH1>/PA                  sih4p         energy


# Training set for the atomization energy
#               12 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 12  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  2        p2          1          p2p            -1           167.8       1.00
  2        p4          1          p4p            -1           193.4       1.00
  2        p6          1          p6p            -1           209.7       1.00
  2        p8          1          p8p            -1           219.7       1.00
  2        nh3         1          nh3p           -1           211.9       1.00
  2        h2o         1          h2op           -1           171.6       1.00
  2        c2h2        1          c2h2p          -1           157.4       1.00
  2        sih4        1          sih4p          -1           156.8       1.00
  2        ph3         1          ph3p           -1           192.7       1.00
  2        h2s         1          h2sp           -1           174.2       1.00
  2        hcl         1          hclp           -1           137.8       1.00
  2        h2          1          h2p            -1           106.3       1.00

 


