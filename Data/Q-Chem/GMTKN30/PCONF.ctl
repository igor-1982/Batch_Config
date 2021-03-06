# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PCONF           2              QChem

# The project description
__title__ ::
"============================== PCONF set ============================="
"             This is PCONF subset from GMTKN30 proposed by Grimme     "

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
$basis

$end


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                11 is the total number of jobs in this batch list
__batch__ :: 11
#"Flag"         "DIR"                        "InpName"       "JobType"
 99           <PATH1>/PCONF                   99.in            energy
 444          <PATH1>/PCONF                  444.in            energy
 357          <PATH1>/PCONF                  357.in            energy
 366          <PATH1>/PCONF                  366.in            energy
 215          <PATH1>/PCONF                  215.in            energy
 300          <PATH1>/PCONF                  300.in            energy
 114          <PATH1>/PCONF                  114.in            energy
 412          <PATH1>/PCONF                  412.in            energy
 691          <PATH1>/PCONF                  691.in            energy
 470          <PATH1>/PCONF                  470.in            energy
 224          <PATH1>/PCONF                  224.in            energy


# Training set for the atomization energy
#               10 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 10  627.51
#"Number" "Flag" "Scale"                   "Ref"      "Weight"
  2        99    -1     444       1         0.14      1.0
  2        99    -1     357       1         0.90      1.0
  2        99    -1     366       1         1.15      1.0
  2        99    -1     215       1         0.79      1.0
  2        99    -1     300       1         1.31      1.0
  2        99    -1     114       1         1.87      1.0
  2        99    -1     412       1         2.37      1.0
  2        99    -1     691       1         2.07      1.0
  2        99    -1     470       1         2.51      1.0
  2        99    -1     224       1         2.04      1.0
