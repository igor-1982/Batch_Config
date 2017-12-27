# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BSSE_S22           2               QChem

# The project description
__title__ ::
"============================== S22 set ============================="
"             This is S22 subset from GMTKN30 proposed by Grimme     "

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
#                34 is the total number of jobs in this batch list
__batch__ :: 34
#"Flag"         "DIR"                        "InpName"       "JobType"
 01a            <PATH1>/BSSE_S22                 01a.in            energy
 02a            <PATH1>/BSSE_S22                 02a.in            energy
 03a            <PATH1>/BSSE_S22                 03a.in            energy
 04a            <PATH1>/BSSE_S22                 04a.in            energy
 05a            <PATH1>/BSSE_S22                 05a.in            energy
 06a            <PATH1>/BSSE_S22                 06a.in            energy
 06b            <PATH1>/BSSE_S22                 06b.in            energy
 07a            <PATH1>/BSSE_S22                 07a.in            energy
 07b            <PATH1>/BSSE_S22                 07b.in            energy
 08a            <PATH1>/BSSE_S22                 08a.in            energy
 09a            <PATH1>/BSSE_S22                 09a.in            energy
 10a            <PATH1>/BSSE_S22                 10a.in            energy
 10b            <PATH1>/BSSE_S22                 10b.in            energy
 11a            <PATH1>/BSSE_S22                 11a.in            energy
 12a            <PATH1>/BSSE_S22                 12a.in            energy
 13a            <PATH1>/BSSE_S22                 13a.in            energy
 14a            <PATH1>/BSSE_S22                 14a.in            energy
 14b            <PATH1>/BSSE_S22                 14b.in            energy
 15a            <PATH1>/BSSE_S22                 15a.in            energy
 15b            <PATH1>/BSSE_S22                 15b.in            energy
 16a            <PATH1>/BSSE_S22                 16a.in            energy
 16b            <PATH1>/BSSE_S22                 16b.in            energy
 17a            <PATH1>/BSSE_S22                 17a.in            energy
 17b            <PATH1>/BSSE_S22                 17b.in            energy
 18a            <PATH1>/BSSE_S22                 18a.in            energy
 18b            <PATH1>/BSSE_S22                 18b.in            energy
 19a            <PATH1>/BSSE_S22                 19a.in            energy
 19b            <PATH1>/BSSE_S22                 19b.in            energy
 20a            <PATH1>/BSSE_S22                 20a.in            energy
 20b            <PATH1>/BSSE_S22                 20b.in            energy
 21a            <PATH1>/BSSE_S22                 21a.in            energy
 21b            <PATH1>/BSSE_S22                 21b.in            energy
 22a            <PATH1>/BSSE_S22                 22a.in            energy
 22b            <PATH1>/BSSE_S22                 22b.in            energy

# Training set for the atomization energy
#               22 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 34  1.0
#"Number" "Flag" "Scale"                            "Ref"      "Weight"
  1      01a  1                                     0.000000 1.0
  1      02a  1                                     0.000000 1.0
  1      03a  1                                     0.000000 1.0
  1      04a  1                                     0.000000 1.0
  1      05a  1                                     0.000000 1.0
  1      06a  1                                     0.000000 1.0
  1      06b  1                                     0.000000 1.0
  1      07a  1                                     0.000000 1.0
  1      07b  1                                     0.000000 1.0
  1      08a  1                                     0.000000 1.0
  1      09a  1                                     0.000000 1.0
  1      10a  1                                     0.000000 1.0
  1      10b  1                                     0.000000 1.0
  1      11a  1                                     0.000000 1.0
  1      12a  1                                     0.000000 1.0
  1      13a  1                                     0.000000 1.0
  1      14a  1                                     0.000000 1.0
  1      14b  1                                     0.000000 1.0
  1      15a  1                                     0.000000 1.0
  1      15b  1                                     0.000000 1.0
  1      16a  1                                     0.000000 1.0
  1      16b  1                                     0.000000 1.0
  1      17a  1                                     0.000000 1.0
  1      17b  1                                     0.000000 1.0
  1      18a  1                                     0.000000 1.0
  1      18b  1                                     0.000000 1.0
  1      19a  1                                     0.000000 1.0
  1      19b  1                                     0.000000 1.0
  1      20a  1                                     0.000000 1.0
  1      20b  1                                     0.000000 1.0
  1      21a  1                                     0.000000 1.0
  1      21b  1                                     0.000000 1.0
  1      22a  1                                     0.000000 1.0
  1      22b  1                                     0.000000 1.0
