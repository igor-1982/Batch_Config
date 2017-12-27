# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./HEAVY28           2            Aims 

# The project description
__title__ ::
"============================== HEAVY28 set ============================="
"             This is HEAVY28 subset from GMTKN30 proposed by Grimme     "
"     aug-cc-pVTZ-PP is used for the heavy atoms:: Pb, Sb, Bi, Te, Br, I "
"     Other atoms are treated at the basis set level of aug-cc-pVTZ      "
" Basis set info.                                                        "
"  aug-cc-pVTZ-PP  EMSL  Basis Set Exchange Library   1/14/12 12:13 AM   "
" Elements                             References                        "
" --------                             ----------                        "
" Ga-As,In-Sb, Tl-Bi   : K.A. Peterson, J. Chem. Phys. 119, 11099 (2003)."
" Se-Kr, Te-Xe, Po-Rn  : K.A. Peterson, D. Figgen, E. Goll, H. Stoll, and M. Dolg, J. Chem. Phys. 119, 11113 (2003)"
" Cu, Zn, Pd, Ag, Au, Hg: K.A. Peterson and C. Puzzarini, Theor. Chem. Acc., 114, 283 (2005)"
" Y Zr Nb Mo Tc Ru Rh Pd     : K.A. Peterson, D. Figgen, M. Dolg, H. Stoll, J. Chem. Phys., 126, 124101 (2007)"
" I    : K. A. Peterson, B. C. Shepler, D. Figgen, H. Stoll, J. Phys. Chem. A 110, 13877 (2006)"
" Hf Ta W Re Os Ir Pt: D. Figgen, K.A. Peterson, M. Dolg, and H. Stoll, J. Chem. Phys. 130, 164108 (2009)"

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
#                38 is the total number of jobs in this batch list
__batch__ :: 38
#"Flag"         "DIR"                        "InpName"       "JobType"
      bih3_2    <PATH1>/HEAVY28                bih3_2     energy
        bih3    <PATH1>/HEAVY28                  bih3     energy
    bih3_h2o    <PATH1>/HEAVY28              bih3_h2o     energy
    bih3_h2s    <PATH1>/HEAVY28              bih3_h2s     energy
    bih3_hbr    <PATH1>/HEAVY28              bih3_hbr     energy
    bih3_hcl    <PATH1>/HEAVY28              bih3_hcl     energy
     bih3_hi    <PATH1>/HEAVY28               bih3_hi     energy
    bih3_nh3    <PATH1>/HEAVY28              bih3_nh3     energy
         h2o    <PATH1>/HEAVY28                   h2o     energy
         h2s    <PATH1>/HEAVY28                   h2s     energy
         hbr    <PATH1>/HEAVY28                   hbr     energy
         hcl    <PATH1>/HEAVY28                   hcl     energy
          hi    <PATH1>/HEAVY28                    hi     energy
         nh3    <PATH1>/HEAVY28                   nh3     energy
      pbh4_2    <PATH1>/HEAVY28                pbh4_2     energy
   pbh4_bih3    <PATH1>/HEAVY28             pbh4_bih3     energy
        pbh4    <PATH1>/HEAVY28                  pbh4     energy
    pbh4_h2o    <PATH1>/HEAVY28              pbh4_h2o     energy
    pbh4_hbr    <PATH1>/HEAVY28              pbh4_hbr     energy
    pbh4_hcl    <PATH1>/HEAVY28              pbh4_hcl     energy
     pbh4_hi    <PATH1>/HEAVY28               pbh4_hi     energy
   pbh4_teh2    <PATH1>/HEAVY28             pbh4_teh2     energy
      sbh3_2    <PATH1>/HEAVY28                sbh3_2     energy
        sbh3    <PATH1>/HEAVY28                  sbh3     energy
    sbh3_h2o    <PATH1>/HEAVY28              sbh3_h2o     energy
    sbh3_h2s    <PATH1>/HEAVY28              sbh3_h2s     energy
    sbh3_hbr    <PATH1>/HEAVY28              sbh3_hbr     energy
    sbh3_hcl    <PATH1>/HEAVY28              sbh3_hcl     energy
     sbh3_hi    <PATH1>/HEAVY28               sbh3_hi     energy
    sbh3_nh3    <PATH1>/HEAVY28              sbh3_nh3     energy
      teh2_2    <PATH1>/HEAVY28                teh2_2     energy
        teh2    <PATH1>/HEAVY28                  teh2     energy
    teh2_h2o    <PATH1>/HEAVY28              teh2_h2o     energy
    teh2_h2s    <PATH1>/HEAVY28              teh2_h2s     energy
    teh2_hbr    <PATH1>/HEAVY28              teh2_hbr     energy
    teh2_hcl    <PATH1>/HEAVY28              teh2_hcl     energy
     teh2_hi    <PATH1>/HEAVY28               teh2_hi     energy
    teh2_nh3    <PATH1>/HEAVY28              teh2_nh3     energy



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
