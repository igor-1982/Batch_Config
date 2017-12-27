# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./IDISP           2             Gaussian 

# The project description
__title__ ::
"============================== IDISP set ============================="
"             This is IDISP subset from GMTKN30 proposed by Grimme     "

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
     ant          <PATH1>/IDISP                    ant.com            energy
antdimer          <PATH1>/IDISP               antdimer.com            energy
    F14f          <PATH1>/IDISP                   F14f.com            energy
    F14l          <PATH1>/IDISP                   F14l.com            energy
    F22f          <PATH1>/IDISP                   F22f.com            energy
    F22l          <PATH1>/IDISP                   F22l.com            energy
      h2          <PATH1>/IDISP                     h2.com            energy
 octane1          <PATH1>/IDISP                octane1.com            energy
 octane2          <PATH1>/IDISP                octane2.com            energy
    pc22          <PATH1>/IDISP                   pc22.com            energy
 pxylene          <PATH1>/IDISP                pxylene.com            energy
undecan1          <PATH1>/IDISP               undecan1.com            energy
undecan2          <PATH1>/IDISP               undecan2.com            energy


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
