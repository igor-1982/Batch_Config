# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./HC7           2             Aims

# The project description
__title__ ::
"============================== HC7 set ============================="
"        This is  HC7 subset including 7 reactions with strong        "
"           multi-reference character                                       "

# several global statements of control.in for aims Package
__aims_basis__ :: /draco/u/igor1982/export/species_defaults/tight
__aims__ ::  32 160916.scalapack.mpi 
xc                      pbe
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.2
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           600
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/draco/u/igor1982/export/Batch_Config/Data/Aims/MR-All'

# The molecular set to batch: 
#               12 is the total number of jobs in this batch list
__batch__ :: 12
#"Flag"         "DIR"                   "InpName"                 "JobType"
  # 12 molecules
  E1           <PATH1>/HC7              E1                         energy
  E22          <PATH1>/HC7              E22                        energy
  E31          <PATH1>/HC7              E31                        energy 
  octane-a     <PATH1>/HC7              octane-a                   energy
  octane-b     <PATH1>/HC7              octane-b                   energy
  hexane       <PATH1>/HC7              hexane                     energy 
  methane      <PATH1>/HC7              methane                    energy
  ethane       <PATH1>/HC7              ethane                     energy
  adamantane   <PATH1>/HC7              adamantane                 energy
  ethylene     <PATH1>/HC7              ethylene                   energy
  ethyne       <PATH1>/HC7              ethyne                     energy
  bicycoct     <PATH1>/HC7              bicycoct                   energy
# Training set for the HC7 atomization energy
#              7 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  7 627.51
#"Number" "Flag"      "Scale"                                      "Ref"      "Weight"
  2       E22         1  E1         -1                                 14.34      1.0000
  2       E31         1  E1         -1                                 25.02      1.0000
  2       octane-a   -1  octane-b    1                                 1.90       1.0000   
  3       hexane     -1  methane     -4     ethane   5                 9.81       1.0000
  3       octane-b   -1  methane     -6     ethane   7                 14.84      1.0000
  3       adamantane -1  ethylene    3      ethyne   2                 193.99     1.0000
  3       bicycoct   -1  ethylene    3      ethyne   1                 127.22     1.0000
