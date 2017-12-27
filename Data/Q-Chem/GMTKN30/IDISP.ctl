# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./IDISP           2              QChem

# The project description
__title__ ::
"============================== IDISP set ============================="
"             This is IDISP subset from GMTKN30 proposed by Grimme     "

# $rem group of Q-Chem Package
__qchem__ ::  1 rmp2  # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
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
#                13 is the total number of jobs in this batch list
__batch__ :: 13
#"Flag"         "DIR"                        "InpName"       "JobType"
     ant          <PATH1>/IDISP                    ant.in            energy
antdimer          <PATH1>/IDISP               antdimer.in            energy
    F14f          <PATH1>/IDISP                   F14f.in            energy
    F14l          <PATH1>/IDISP                   F14l.in            energy
    F22f          <PATH1>/IDISP                   F22f.in            energy
    F22l          <PATH1>/IDISP                   F22l.in            energy
      h2          <PATH1>/IDISP                     h2.in            energy
 octane1          <PATH1>/IDISP                octane1.in            energy
 octane2          <PATH1>/IDISP                octane2.in            energy
    pc22          <PATH1>/IDISP                   pc22.in            energy
 pxylene          <PATH1>/IDISP                pxylene.in            energy
undecan1          <PATH1>/IDISP               undecan1.in            energy
undecan2          <PATH1>/IDISP               undecan2.in            energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  2       antdimer     1       ant        -2                  -9.0        1.0
  3       pxylene      2       pc22       -1   h2     -2     -58.5        1.0
  2       octane1      1       octane2    -1                  -1.9        1.0
  2       undecan1     1       undecan2   -1                   8.2        1.0
  2       F14f        -1       F14l        1                  -3.1        1.0
  2       F22f        -1       F22l        1                   0.4        1.0
