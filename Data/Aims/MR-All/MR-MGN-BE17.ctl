# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./MR-MGN-BE17           2             Aims

# The project description
__title__ ::
"============================== MR-MGN-BE17 set ============================="
"        This is MG-MGN-BE17 subset including 17 reactions with strong        "
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
sc_iter_limit           800
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/draco/u/igor1982/export/Batch_Config/Data/Aims/MR-All'

# The molecular set to batch: 
#               27 is the total number of jobs in this batch list
__batch__ :: 27
#"Flag"         "DIR"                       "InpName"       "JobType"
  # 19 molecules
  NF3          <PATH1>/MR-MGN-BE17              NF3                     energy
  CO2          <PATH1>/MR-MGN-BE17              CO2                     energy
  SiO_sin      <PATH1>/MR-MGN-BE17              SiO_sin                 energy 
  SO2          <PATH1>/MR-MGN-BE17              SO2                     energy
  CO           <PATH1>/MR-MGN-BE17              CO                      energy
  SO_tri       <PATH1>/MR-MGN-BE17              SO_tri                  energy 
  ClO          <PATH1>/MR-MGN-BE17              ClO                     energy
  F2           <PATH1>/MR-MGN-BE17              F2                      energy
  N2           <PATH1>/MR-MGN-BE17              N2                      energy
  O2           <PATH1>/MR-MGN-BE17              O2                      energy
  NO           <PATH1>/MR-MGN-BE17              NO                      energy
  CN           <PATH1>/MR-MGN-BE17              CN                      energy
  B2           <PATH1>/MR-MGN-BE17              B2                      energy
  O3           <PATH1>/MR-MGN-BE17              O3                      energy
  C2           <PATH1>/MR-MGN-BE17              C2                      energy
  S4           <PATH1>/MR-MGN-BE17              S4                      energy
  Cl2O         <PATH1>/MR-MGN-BE17              Cl2O                    energy
  Cl2          <PATH1>/MR-MGN-BE17              Cl2                     energy
  S2           <PATH1>/MR-MGN-BE17              S2                      energy
  # 8 atoms or anions
  N            <PATH1>/MR-MGN-BE17               N                    energy
  F            <PATH1>/MR-MGN-BE17               F                    energy
  C            <PATH1>/MR-MGN-BE17               C                    energy
  Cl           <PATH1>/MR-MGN-BE17               Cl                   energy
  Si           <PATH1>/MR-MGN-BE17               Si                   energy
  O            <PATH1>/MR-MGN-BE17               O                    energy
  S            <PATH1>/MR-MGN-BE17               S                    energy
  B            <PATH1>/MR-MGN-BE17               B                    energy
# Training set for the atomization energy
#              17 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  17 627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  3      NF3      -1   N       1       F    3                   204.53      1.0000
  3      CO2      -1   C       1       O    2                   389.61      1.0000
  3      SiO_sin  -1   Si      1       O    1                   192.4       1.0000
  3      SO2      -1   S       1       O    2                   259.61      1.0000
  3      CO       -1   C       1       O    1                   259.42      1.0000   
  3      SO_tri   -1   S       1       O    1                   125.69      1.0000
  3      ClO      -1   Cl      1       O    1                   64.84       1.0000
  2      F2       -1   F       2                                38.27       1.0000       
  2      N2       -1   N       2                                228.48      1.0000
  2      O2       -1   O       2                                120.37      1.0000
  3      NO       -1   N       1       O    1                   152.7       1.0000
  3      CN       -1   N       1       C    1                   181.27      1.0000
  2      B2       -1   B       2                                67.4        1.0000
  3      O3       -1   O2      1       O    1                   26.61       1.0000
  2      C2       -1   C       2                                146.88      1.0000
  2      S4       -1   S2      2                                25.75       1.0000
  3      Cl2O     -1   Cl2     1       O    1                   41.71       1.0000
