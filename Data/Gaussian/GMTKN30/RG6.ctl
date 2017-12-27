# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./RG6           2              Gaussian

# The project description
__title__ ::
"============================== RG6 set ============================="
"             This is RG6 subset from GMTKN30 proposed by Grimme     "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/G3Large NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                13 is the total number of jobs in this batch list
__batch__ :: 13
#"Flag"         "DIR"                        "InpName"       "JobType"
 ne_2           <PATH1>/RG6                 ne_2.com            energy
 ne             <PATH1>/RG6                   ne.com            energy
 ar_2           <PATH1>/RG6                 ar_2.com            energy
 ar             <PATH1>/RG6                   ar.com            energy
 ar_2           <PATH1>/RG6                 ar_2.com            energy
 kr             <PATH1>/RG6                   kr.com            energy
 kr_2           <PATH1>/RG6                 kr_2.com            energy
 kr             <PATH1>/RG6                   kr.com            energy
 rn_2           <PATH1>/RG6                 rn_2.com            energy
 rn             <PATH1>/RG6                   rn.com            energy
 xe             <PATH1>/RG6                   xe.com            energy
 xe_2           <PATH1>/RG6                 xe_2.com            energy
 rnxe           <PATH1>/RG6                 rnxe.com            energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag" "Scale"                                           "Ref"      "Weight"
  2        ne_2       -1       ne        2                         0.08       1.0
  2        ar_2       -1       ar        2                         0.28       1.0
  2        kr_2       -1       kr        2                         0.40       1.0
  2        xe_2       -1       xe        2                         0.56       1.0
  3        rnxe       -1       rn        1         xe      1       0.65       1.0
  2        rn_2       -1       rn        2                         0.79       1.0 
