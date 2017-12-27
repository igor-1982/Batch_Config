# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./HEAVY28           2             Gaussian 

# The project description
__title__ ::
"============================== HEAVY28 set ============================="
"             This is HEAVY28 subset from GMTKN30 proposed by Grimme     "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/G3Large NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                38 is the total number of jobs in this batch list
__batch__ :: 38
#"Flag"         "DIR"                        "InpName"       "JobType"
      bih3_2    <PATH1>/HEAVY28                bih3_2.com    energy
        bih3    <PATH1>/HEAVY28                  bih3.com    energy
    bih3_h2o    <PATH1>/HEAVY28              bih3_h2o.com    energy
    bih3_h2s    <PATH1>/HEAVY28              bih3_h2s.com    energy
    bih3_hbr    <PATH1>/HEAVY28              bih3_hbr.com    energy
    bih3_hcl    <PATH1>/HEAVY28              bih3_hcl.com    energy
     bih3_hi    <PATH1>/HEAVY28               bih3_hi.com    energy
    bih3_nh3    <PATH1>/HEAVY28              bih3_nh3.com    energy
         h2o    <PATH1>/HEAVY28                   h2o.com    energy
         h2s    <PATH1>/HEAVY28                   h2s.com    energy
         hbr    <PATH1>/HEAVY28                   hbr.com    energy
         hcl    <PATH1>/HEAVY28                   hcl.com    energy
          hi    <PATH1>/HEAVY28                    hi.com    energy
         nh3    <PATH1>/HEAVY28                   nh3.com    energy
      pbh4_2    <PATH1>/HEAVY28                pbh4_2.com    energy
   pbh4_bih3    <PATH1>/HEAVY28             pbh4_bih3.com    energy
        pbh4    <PATH1>/HEAVY28                  pbh4.com    energy
    pbh4_h2o    <PATH1>/HEAVY28              pbh4_h2o.com    energy
    pbh4_hbr    <PATH1>/HEAVY28              pbh4_hbr.com    energy
    pbh4_hcl    <PATH1>/HEAVY28              pbh4_hcl.com    energy
     pbh4_hi    <PATH1>/HEAVY28               pbh4_hi.com    energy
   pbh4_teh2    <PATH1>/HEAVY28             pbh4_teh2.com    energy
      sbh3_2    <PATH1>/HEAVY28                sbh3_2.com    energy
        sbh3    <PATH1>/HEAVY28                  sbh3.com    energy
    sbh3_h2o    <PATH1>/HEAVY28              sbh3_h2o.com    energy
    sbh3_h2s    <PATH1>/HEAVY28              sbh3_h2s.com    energy
    sbh3_hbr    <PATH1>/HEAVY28              sbh3_hbr.com    energy
    sbh3_hcl    <PATH1>/HEAVY28              sbh3_hcl.com    energy
     sbh3_hi    <PATH1>/HEAVY28               sbh3_hi.com    energy
    sbh3_nh3    <PATH1>/HEAVY28              sbh3_nh3.com    energy
      teh2_2    <PATH1>/HEAVY28                teh2_2.com    energy
        teh2    <PATH1>/HEAVY28                  teh2.com    energy
    teh2_h2o    <PATH1>/HEAVY28              teh2_h2o.com    energy
    teh2_h2s    <PATH1>/HEAVY28              teh2_h2s.com    energy
    teh2_hbr    <PATH1>/HEAVY28              teh2_hbr.com    energy
    teh2_hcl    <PATH1>/HEAVY28              teh2_hcl.com    energy
     teh2_hi    <PATH1>/HEAVY28               teh2_hi.com    energy
    teh2_nh3    <PATH1>/HEAVY28              teh2_nh3.com    energy



# Training set for the atomization energy
#               28 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 28  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  2    bih3_2       -1   bih3    2                            1.29       1.0000
  3    bih3_h2o     -1   bih3    1    h2o    1                2.42       1.0000
  3    bih3_h2s     -1   bih3    1    h2s    1                1.40       1.0000
  3    bih3_hcl     -1   bih3    1    hcl    1                0.85       1.0000
  3    bih3_hbr     -1   bih3    1    hbr    1                1.16       1.0000
  3    bih3_hi      -1   bih3    1    hi     1                1.42       1.0000
  3    bih3_nh3     -1   bih3    1    nh3    1                0.69       1.0000
  2    pbh4_2       -1   pbh4    2                            1.32       1.0000
  3    pbh4_bih3    -1   pbh4    1    bih3   1                0.68       1.0000
  3    pbh4_h2o     -1   pbh4    1    h2o    1                0.44       1.0000
  3    pbh4_hcl     -1   pbh4    1    hcl    1                0.80       1.0000
  3    pbh4_hbr     -1   pbh4    1    hbr    1                1.04       1.0000
  3    pbh4_hi      -1   pbh4    1    hi     1                1.29       1.0000
  3    pbh4_teh2    -1   pbh4    1    teh2   1                0.70       1.0000
  2    sbh3_2       -1   sbh3    2                            1.30       1.0000
  3    sbh3_h2o     -1   sbh3    1    h2o    1                1.70       1.0000
  3    sbh3_h2s     -1   sbh3    1    h2s    1                1.14       1.0000
  3    sbh3_hcl     -1   sbh3    1    hcl    1                2.20       1.0000
  3    sbh3_hbr     -1   sbh3    1    hbr    1                2.07       1.0000
  3    sbh3_hi      -1   sbh3    1    hi     1                1.64       1.0000
  3    sbh3_nh3     -1   sbh3    1    nh3    1                2.80       1.0000
  2    teh2_2       -1   teh2    2                            0.58       1.0000
  3    teh2_h2o     -1   teh2    1    h2o    1                0.68       1.0000
  3    teh2_h2s     -1   teh2    1    h2s    1                0.50       1.0000
  3    teh2_hcl     -1   teh2    1    hcl    1                1.24       1.0000
  3    teh2_hbr     -1   teh2    1    hbr    1                1.24       1.0000
  3    teh2_hi      -1   teh2    1    hi     1                0.84       1.0000
  3    teh2_nh3     -1   teh2    1    nh3    1                3.29       1.0000
