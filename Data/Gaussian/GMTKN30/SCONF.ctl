# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./SCONF           2                Gaussian

# The project description
__title__ ::
"============================== SCONF set ============================="
"             This is SCONF subset from GMTKN30 proposed by Grimme     "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/G3Large NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                19 is the total number of jobs in this batch list
__batch__ :: 19
#"Flag"         "DIR"                        "InpName"       "JobType"
   C10          <PATH1>/SCONF                 C10.com         energy
   C11          <PATH1>/SCONF                 C11.com         energy
   C12          <PATH1>/SCONF                 C12.com         energy
   C13          <PATH1>/SCONF                 C13.com         energy
   C14          <PATH1>/SCONF                 C14.com         energy
   C15          <PATH1>/SCONF                 C15.com         energy
    C1          <PATH1>/SCONF                  C1.com         energy
    C2          <PATH1>/SCONF                  C2.com         energy
    C3          <PATH1>/SCONF                  C3.com         energy
    C4          <PATH1>/SCONF                  C4.com         energy
    C5          <PATH1>/SCONF                  C5.com         energy
    C6          <PATH1>/SCONF                  C6.com         energy
    C7          <PATH1>/SCONF                  C7.com         energy
    C8          <PATH1>/SCONF                  C8.com         energy
    C9          <PATH1>/SCONF                  C9.com         energy
    G1          <PATH1>/SCONF                  G1.com         energy
    G2          <PATH1>/SCONF                  G2.com         energy
    G3          <PATH1>/SCONF                  G3.com         energy
    G4          <PATH1>/SCONF                  G4.com         energy

# Training set for the atomization energy
#               17 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 17  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
   2       C1         -1           C2     1                    0.83      1.0000
   2       C1         -1           C3     1                    2.60      1.0000
   2       C1         -1           C4     1                    3.37      1.0000
   2       C1         -1           C5     1                    4.87      1.0000
   2       C1         -1           C6     1                    5.18      1.0000
   2       C1         -1           C7     1                    4.47      1.0000
   2       C1         -1           C8     1                    4.68      1.0000
   2       C1         -1           C9     1                    6.69      1.0000
   2       C1         -1          C10     1                    6.75      1.0000
   2       C1         -1          C11     1                    6.08      1.0000
   2       C1         -1          C12     1                    6.05      1.0000
   2       C1         -1          C13     1                    6.17      1.0000
   2       C1         -1          C14     1                    6.75      1.0000
   2       C1         -1          C15     1                    6.71      1.0000
   2       G1         -1           G2     1                    0.27      1.0000
   2       G1         -1           G3     1                    5.92      1.0000
   2       G1         -1           G4     1                    5.29      1.0000
