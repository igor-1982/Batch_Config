# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./ttf-tcnq         2          Aims

# The project description
__title__ ::
"============================= TTF-TCNQ ==============================="
"                                                                      "

# several global statements of control.in for aims Package
__aims_basis__ :: /u/igor1982/export/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  16  052512.scalapack.mpi
xc                       pbe
total_energy_method      rpa
relativistic             none
occupation_type          gaussian 0.0001
mixer                    pulay
n_max_pulay              5
charge_mix_param         0.2
sc_accuracy_rho          1E-6
sc_accuracy_eev          1E-4
sc_accuracy_etot         1E-6
sc_iter_limit            200
radial_multiplier        6
frequency_points         80
#override_illconditioning .true.
end aims


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/home/wenxinzy/export/softs/Batch_Config/Data/Aims/PEC_Dimer'

# The molecular set to batch: 
#               21 is the total number of jobs in this batch list
__batch__ :: 21
#"Flag"         "DIR"                         "InpName"       "JobType"
  ttf          <PATH1>/TTF-TCNQ               ttf         energy
  tcnq         <PATH1>/TTF-TCNQ               tcnq        energy
  dimer00      <PATH1>/TTF-TCNQ               dimer00     energy
  dimer01      <PATH1>/TTF-TCNQ               dimer01     energy
  dimer02      <PATH1>/TTF-TCNQ               dimer02     energy
  dimer03      <PATH1>/TTF-TCNQ               dimer03     energy
  dimer04      <PATH1>/TTF-TCNQ               dimer04     energy
  dimer05      <PATH1>/TTF-TCNQ               dimer05     energy
  dimer06      <PATH1>/TTF-TCNQ               dimer06     energy
  dimer07      <PATH1>/TTF-TCNQ               dimer07     energy
  dimer08      <PATH1>/TTF-TCNQ               dimer08     energy
  dimer09      <PATH1>/TTF-TCNQ               dimer09     energy
  dimer10      <PATH1>/TTF-TCNQ               dimer10     energy
  dimer11      <PATH1>/TTF-TCNQ               dimer11     energy
  dimer12      <PATH1>/TTF-TCNQ               dimer12     energy
  dimer13      <PATH1>/TTF-TCNQ               dimer13     energy
  dimer14      <PATH1>/TTF-TCNQ               dimer14     energy
  dimer15      <PATH1>/TTF-TCNQ               dimer15     energy
  dimer16      <PATH1>/TTF-TCNQ               dimer16     energy
  dimer17      <PATH1>/TTF-TCNQ               dimer17     energy
  dimer18      <PATH1>/TTF-TCNQ               dimer18     energy

# Training set for the atomization energy
#       21 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 21  1.0
#"Number" "Flag"     "Scale"                                 "Ref"       "Weight"
  1        ttf         1                                     0.00        1.0
  1        tcnq        1                                     0.00        1.0
  1        dimer00     1                                     0.00        1.0
  1        dimer01     1                                     0.00        1.0
  1        dimer02     1                                     0.00        1.0
  1        dimer03     1                                     0.00        1.0
  1        dimer04     1                                     0.00        1.0
  1        dimer05     1                                     0.00        1.0
  1        dimer06     1                                     0.00        1.0
  1        dimer07     1                                     0.00        1.0
  1        dimer08     1                                     0.00        1.0
  1        dimer09     1                                     0.00        1.0
  1        dimer10     1                                     0.00        1.0
  1        dimer11     1                                     0.00        1.0
  1        dimer12     1                                     0.00        1.0
  1        dimer13     1                                     0.00        1.0
  1        dimer14     1                                     0.00        1.0
  1        dimer15     1                                     0.00        1.0
  1        dimer16     1                                     0.00        1.0
  1        dimer17     1                                     0.00        1.0
  1        dimer18     1                                     0.00        1.0
