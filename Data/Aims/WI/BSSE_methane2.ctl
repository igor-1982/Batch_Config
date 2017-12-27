# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BSSE_PES_methane2   2              QChem

# The project description
__title__ ::
"============================== bz-methane ==========================="
"             This is the set for PES of C6H6+CH4                     "


# Machine and option keyword of QChem Package
__qchem__ ::  1   rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static = 200
mem_total  = 7500
exchange = b3lyp
basis = 6-311+g(3df,2p)
scf_convergence = 7
symmetry = false
xc_grid = 000075000302
$end


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                19 is the total number of jobs in this batch list
__batch__ :: 18
#"Flag"         "DIR"                             "InpName"       "JobType"
  D32          <PATH1>/BSSE_methane_dimer_scan    17.in             energy
  D33          <PATH1>/BSSE_methane_dimer_scan    16.in             energy
  D34          <PATH1>/BSSE_methane_dimer_scan    15.in             energy
  D35          <PATH1>/BSSE_methane_dimer_scan    14.in             energy
  D36          <PATH1>/BSSE_methane_dimer_scan    13.in             energy
  D37          <PATH1>/BSSE_methane_dimer_scan    12.in             energy
  D38          <PATH1>/BSSE_methane_dimer_scan    11.in             energy
  D39          <PATH1>/BSSE_methane_dimer_scan    10.in             energy
  D40          <PATH1>/BSSE_methane_dimer_scan     9.in             energy
  D41          <PATH1>/BSSE_methane_dimer_scan     8.in             energy
  D42          <PATH1>/BSSE_methane_dimer_scan     7.in             energy
  D43          <PATH1>/BSSE_methane_dimer_scan     6.in             energy
  D44          <PATH1>/BSSE_methane_dimer_scan     5.in             energy
  D46          <PATH1>/BSSE_methane_dimer_scan     4.in             energy
  D48          <PATH1>/BSSE_methane_dimer_scan     3.in             energy
  D50          <PATH1>/BSSE_methane_dimer_scan     2.in             energy
  D54          <PATH1>/BSSE_methane_dimer_scan     1.in             energy
  D58          <PATH1>/BSSE_methane_dimer_scan     0.in             energy

# Training set for the atomization energy
#               19 is the total number of the energy testing data
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 18  1.0
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
  1         D32   1                                       0.0        1.0
  1         D33   1                                       0.0        1.0
  1         D34   1                                       0.0        1.0
  1         D35   1                                       0.0        1.0
  1         D36   1                                       0.0        1.0
  1         D37   1                                       0.0        1.0
  1         D38   1                                       0.0        1.0
  1         D39   1                                       0.0        1.0
  1         D40   1                                       0.0        1.0
  1         D41   1                                       0.0        1.0
  1         D42   1                                       0.0        1.0
  1         D43   1                                       0.0        1.0
  1         D44   1                                       0.0        1.0
  1         D46   1                                       0.0        1.0
  1         D48   1                                       0.0        1.0
  1         D50   1                                       0.0        1.0
  1         D54   1                                       0.0        1.0
  1         D58   1                                       0.0        1.0

