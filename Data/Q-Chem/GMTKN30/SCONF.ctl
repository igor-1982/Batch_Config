# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./SCONF           2              QChem 

# The project description
__title__ ::
"============================== SCONF set ============================="
"             This is SCONF subset from GMTKN30 proposed by Grimme     "

# $rem group of Q-Chem Package
__qchem__ ::  1  rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static      = 200
mem_total       = 7500
exchange        = b3lyp
basis           = g3large
max_scf_cycles  = 50
scf_convergence = 7
symmetry        = false
xc_grid         = 000075000302                                                               
$end

# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                19 is the total number of jobs in this batch list
__batch__ :: 19
#"Flag"         "DIR"                        "InpName"       "JobType"
   C10          <PATH1>/SCONF                 C10.in          energy
   C11          <PATH1>/SCONF                 C11.in          energy
   C12          <PATH1>/SCONF                 C12.in          energy
   C13          <PATH1>/SCONF                 C13.in          energy
   C14          <PATH1>/SCONF                 C14.in          energy
   C15          <PATH1>/SCONF                 C15.in          energy
    C1          <PATH1>/SCONF                  C1.in          energy
    C2          <PATH1>/SCONF                  C2.in          energy
    C3          <PATH1>/SCONF                  C3.in          energy
    C4          <PATH1>/SCONF                  C4.in          energy
    C5          <PATH1>/SCONF                  C5.in          energy
    C6          <PATH1>/SCONF                  C6.in          energy
    C7          <PATH1>/SCONF                  C7.in          energy
    C8          <PATH1>/SCONF                  C8.in          energy
    C9          <PATH1>/SCONF                  C9.in          energy
    G1          <PATH1>/SCONF                  G1.in          energy
    G2          <PATH1>/SCONF                  G2.in          energy
    G3          <PATH1>/SCONF                  G3.in          energy
    G4          <PATH1>/SCONF                  G4.in          energy

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
