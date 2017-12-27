# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PES_bz_methane   2              Gaussian

# The project description
__title__ ::
"============================== bz-methane ==========================="
"             This is the set for PES of C6H6+CH4                     "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                19 is the total number of jobs in this batch list
__batch__ :: 19
#"Flag"         "DIR"                        "InpName"       "JobType"
  A0           <PATH1>/methane_dimer_scan     A0.com           energy
  D32          <PATH1>/methane_dimer_scan    17.com            energy
  D33          <PATH1>/methane_dimer_scan    16.com            energy
  D34          <PATH1>/methane_dimer_scan    15.com            energy
  D35          <PATH1>/methane_dimer_scan    14.com            energy
  D36          <PATH1>/methane_dimer_scan    13.com            energy
  D37          <PATH1>/methane_dimer_scan    12.com            energy
  D38          <PATH1>/methane_dimer_scan    11.com            energy
  D39          <PATH1>/methane_dimer_scan    10.com            energy
  D40          <PATH1>/methane_dimer_scan     9.com            energy
  D41          <PATH1>/methane_dimer_scan     8.com            energy
  D42          <PATH1>/methane_dimer_scan     7.com            energy
  D43          <PATH1>/methane_dimer_scan     6.com            energy
  D44          <PATH1>/methane_dimer_scan     5.com            energy
  D46          <PATH1>/methane_dimer_scan     4.com            energy
  D48          <PATH1>/methane_dimer_scan     3.com            energy
  D50          <PATH1>/methane_dimer_scan     2.com            energy
  D54          <PATH1>/methane_dimer_scan     1.com            energy
  D58          <PATH1>/methane_dimer_scan     0.com            energy

# Training set for the atomization energy
#               18 is the total number of the energy testing data
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 18  1.0
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
  1         A0    1                                       0.0        1.0
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

