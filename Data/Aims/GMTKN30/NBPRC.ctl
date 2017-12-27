# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./NBPRC           2              Aims 

# The project description
__title__ ::
"============================== NBPRC set ============================="
"             This is NBPRC subset from GMTKN30 proposed by Grimme     "

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
#                21 is the total number of jobs in this batch list
__batch__ :: 21
#"Flag"         "DIR"                        "InpName"       "JobType"
      BCl3      <PATH1>/NBPRC                 BCl3        energy
  BCl3PMe3      <PATH1>/NBPRC             BCl3PMe3        energy
       BF3      <PATH1>/NBPRC                  BF3        energy
   BF3PMe3      <PATH1>/NBPRC              BF3PMe3        energy
       bh3      <PATH1>/NBPRC                  bh3        energy
       BH3      <PATH1>/NBPRC                  BH3        energy
    BH3PH3      <PATH1>/NBPRC               BH3PH3        energy
        bz      <PATH1>/NBPRC                   bz        energy
      cbut      <PATH1>/NBPRC                 cbut        energy
        ch      <PATH1>/NBPRC                   ch        energy
        h2      <PATH1>/NBPRC                   h2        energy
        H2      <PATH1>/NBPRC                   H2        energy
      K_Cl      <PATH1>/NBPRC                 K_Cl        energy
       K_F      <PATH1>/NBPRC                  K_F        energy
       K_H      <PATH1>/NBPRC                  K_H        energy
   nh2-bh2      <PATH1>/NBPRC              nh2-bh2        energy
   nh3-bh3      <PATH1>/NBPRC              nh3-bh3        energy
       nh3      <PATH1>/NBPRC                  nh3        energy
     nh-bh      <PATH1>/NBPRC                nh-bh        energy
       PH3      <PATH1>/NBPRC                  PH3        energy
      PMe3      <PATH1>/NBPRC                 PMe3        energy



# Training set for the atomization energy
#               12 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 12  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  3    nh3        -1    bh3         -1     nh3-bh3      1     -31.84     1.000
  3    nh3-bh3    -1    nh2-bh2      1     h2           1      -0.06     1.000
  3    nh2-bh2    -1    nh-bh        1     h2           1      37.27     1.000
  2    nh2-bh2    -2    cbut         1                        -18.94     1.000
  3    nh2-bh2    -3    bz           1     h2           3     -48.27     1.000
  2    nh2-bh2    -3    ch           1                        -45.06     1.000
  3    BH3PH3      1    BH3         -1     PH3         -1     -24.40     1.000
  3    K_H         1    BH3PH3      -1     H2          -1      40.40     1.000
  3    BF3PMe3     1    BF3         -1     PMe3        -1     -14.60     1.000
  3    K_F         1    BF3PMe3     -1     H2          -1      18.80     1.000
  3    BCl3PMe3    1    BCl3        -1     PMe3        -1     -30.80     1.000
  3    K_Cl        1    BCl3PMe3    -1     H2          -1      17.60     1.000

