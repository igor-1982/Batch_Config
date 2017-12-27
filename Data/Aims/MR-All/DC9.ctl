# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./DC9           2             Aims

# The project description
__title__ ::
"============================== DC9 set ============================="
"        This is  DC9 subset including 9 reactions with strong        "
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
#               23 is the total number of jobs in this batch list
__batch__ :: 23
#"Flag"         "DIR"                   "InpName"                 "JobType"
  # 15 molecules
  HCN-BF3      <PATH1>/DC9           HCN-BF3                    energy
  HCN          <PATH1>/DC9           HCN                        energy
  BF3          <PATH1>/DC9           BF3                        energy 
  C6Cl6        <PATH1>/DC9           C6Cl6                      energy
  HCl          <PATH1>/DC9           HCl                        energy
  Cl2          <PATH1>/DC9           Cl2                        energy 
  C6H6         <PATH1>/DC9           C6H6                       energy
  P4           <PATH1>/DC9           P4                         energy
  SF6          <PATH1>/DC9           SF6                        energy
  PF5          <PATH1>/DC9           PF5                        energy
  P4O10        <PATH1>/DC9           P4O10                      energy
  O2           <PATH1>/DC9           O2                         energy
  C6F6         <PATH1>/DC9           C6F6                       energy
  SiO4C4H12    <PATH1>/DC9           SiO4C4H12                  energy
  urotropin    <PATH1>/DC9           urotropin                  energy
  # 8 atoms or anions
  P            <PATH1>/DC9           P                          energy
  S            <PATH1>/DC9           S                          energy
  F            <PATH1>/DC9           F                          energy
  C            <PATH1>/DC9           C                          energy
  O            <PATH1>/DC9           O                          energy
  N            <PATH1>/DC9           N                          energy
  H            <PATH1>/DC9           H                          energy
  Si           <PATH1>/DC9           Si                         energy
# Training set for the atomization energy
#              9 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  9 627.51
#"Number" "Flag"      "Scale"                                      "Ref"      "Weight"
  3       HCN-BF3    -1  HCN      1      BF3   1                    5.70      1.0000
  4       C6Cl6      -1  HCl     -6      Cl2   6   C6H6   1         148.30    1.0000
  2       P4         -1  P        4                                 289.90    1.0000   
  3       SF6        -1  S        1      F     6                    477.5     1.0000
  3       PF5        -1  P        1      F     5                    556.40    1.0000
  3       P4O10      -1  P4       1      O2    5                    719.70    1.0000
  3       C6F6       -1  C        6      F     6                    1388.10   1.0000
  5       SiO4C4H12  -1  Si       1      C     4    O    4   H  12  2023.50   1.0000
  4       urotropin  -1  N        4      C     6    H    12         2151.10   1.0000
