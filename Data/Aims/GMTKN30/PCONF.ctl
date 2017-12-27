# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PCONF           2               Aims

# The project description
__title__ ::
"============================== PCONF set ============================="
"             This is PCONF subset from GMTKN30 proposed by Grimme     "

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
#                11 is the total number of jobs in this batch list
__batch__ :: 11
#"Flag"         "DIR"                        "InpName"       "JobType"
 99           <PATH1>/PCONF                   99            energy
 444          <PATH1>/PCONF                  444            energy
 357          <PATH1>/PCONF                  357            energy
 366          <PATH1>/PCONF                  366            energy
 215          <PATH1>/PCONF                  215            energy
 300          <PATH1>/PCONF                  300            energy
 114          <PATH1>/PCONF                  114            energy
 412          <PATH1>/PCONF                  412            energy
 691          <PATH1>/PCONF                  691            energy
 470          <PATH1>/PCONF                  470            energy
 224          <PATH1>/PCONF                  224            energy


# Training set for the atomization energy
#               10 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 10  627.51
#"Number" "Flag" "Scale"                   "Ref"      "Weight"
  2        99    -1     444       1         0.14      1.0
  2        99    -1     357       1         0.90      1.0
  2        99    -1     366       1         1.15      1.0
  2        99    -1     215       1         0.79      1.0
  2        99    -1     300       1         1.31      1.0
  2        99    -1     114       1         1.87      1.0
  2        99    -1     412       1         2.37      1.0
  2        99    -1     691       1         2.07      1.0
  2        99    -1     470       1         2.51      1.0
  2        99    -1     224       1         2.04      1.0
