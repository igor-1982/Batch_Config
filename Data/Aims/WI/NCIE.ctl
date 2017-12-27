# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./NCIE           2              QChem

# The project description
__title__ ::
"============================== Bond3 set ==========================="
"             This is the set for non-bond interaction               "

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
#                52 is the total number of jobs in this batch list
__batch__ :: 52
#"Flag"         "DIR"                        "InpName"       "JobType"
 S1             <PATH1>/NCIE                 1.in             energy
 S2             <PATH1>/NCIE                 2.in             energy
 S3             <PATH1>/NCIE                 3.in             energy
 S4             <PATH1>/NCIE                 4.in             energy
 S5             <PATH1>/NCIE                 5.in             energy
 S6             <PATH1>/NCIE                 6.in             energy
 S7             <PATH1>/NCIE                 7.in             energy
 S8             <PATH1>/NCIE                 8.in             energy
 S9             <PATH1>/NCIE                 9.in             energy
S10             <PATH1>/NCIE                10.in             energy
S11             <PATH1>/NCIE                11.in             energy
S12             <PATH1>/NCIE                12.in             energy
S13             <PATH1>/NCIE                13.in             energy
S14             <PATH1>/NCIE                14.in             energy
S15             <PATH1>/NCIE                15.in             energy
S16             <PATH1>/NCIE                16.in             energy
S17             <PATH1>/NCIE                17.in             energy
S18             <PATH1>/NCIE                18.in             energy
S19             <PATH1>/NCIE                19.in             energy
S20             <PATH1>/NCIE                20.in             energy
D21             <PATH1>/NCIE                21.in             energy
D22             <PATH1>/NCIE                22.in             energy
D23             <PATH1>/NCIE                23.in             energy
D24             <PATH1>/NCIE                24.in             energy
D25             <PATH1>/NCIE                25.in             energy
D26             <PATH1>/NCIE                26.in             energy
D27             <PATH1>/NCIE                27.in             energy
D28             <PATH1>/NCIE                28.in             energy
D29             <PATH1>/NCIE                29.in             energy
D30             <PATH1>/NCIE                30.in             energy
D31             <PATH1>/NCIE                31.in             energy
D32             <PATH1>/NCIE                32.in             energy
D33             <PATH1>/NCIE                33.in             energy
D34             <PATH1>/NCIE                34.in             energy
D35             <PATH1>/NCIE                35.in             energy
D36             <PATH1>/NCIE                36.in             energy
D37             <PATH1>/NCIE                37.in             energy
D38             <PATH1>/NCIE                38.in             energy
D39             <PATH1>/NCIE                39.in             energy
D40             <PATH1>/NCIE                40.in             energy
D41             <PATH1>/NCIE                41.in             energy
D42             <PATH1>/NCIE                42.in             energy
D43             <PATH1>/NCIE                43.in             energy
D44             <PATH1>/NCIE                44.in             energy
D45             <PATH1>/NCIE                45.in             energy
D46             <PATH1>/NCIE                46.in             energy
D47             <PATH1>/NCIE                47.in             energy
D48             <PATH1>/NCIE                48.in             energy
D49             <PATH1>/NCIE                49.in             energy
D50             <PATH1>/NCIE                50.in             energy
D51             <PATH1>/NCIE                51.in             energy
D52             <PATH1>/NCIE                52.in             energy

# Training set for the atomization energy
#               52 is the total number of the energy testing data
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 52  1.0
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
  1        S1     1                                       0.0        1.0
  1        S2     1                                       0.0        1.0
  1        S3     1                                       0.0        1.0
  1        S4     1                                       0.0        1.0
  1        S5     1                                       0.0        1.0
  1        S6     1                                       0.0        1.0
  1        S7     1                                       0.0        1.0
  1        S8     1                                       0.0        1.0
  1        S9     1                                       0.0        1.0
  1       S10     1                                       0.0        1.0
  1       S11     1                                       0.0        1.0
  1       S12     1                                       0.0        1.0
  1       S13     1                                       0.0        1.0
  1       S14     1                                       0.0        1.0
  1       S15     1                                       0.0        1.0
  1       S16     1                                       0.0        1.0
  1       S17     1                                       0.0        1.0
  1       S18     1                                       0.0        1.0
  1       S19     1                                       0.0        1.0
  1       S20     1                                       0.0        1.0
  1       D21     1                                       0.0        1.0
  1       D22     1                                       0.0        1.0
  1       D23     1                                       0.0        1.0
  1       D24     1                                       0.0        1.0
  1       D25     1                                       0.0        1.0
  1       D26     1                                       0.0        1.0
  1       D27     1                                       0.0        1.0
  1       D28     1                                       0.0        1.0
  1       D29     1                                       0.0        1.0
  1       D30     1                                       0.0        1.0
  1       D31     1                                       0.0        1.0
  1       D32     1                                       0.0        1.0
  1       D33     1                                       0.0        1.0
  1       D34     1                                       0.0        1.0
  1       D35     1                                       0.0        1.0
  1       D36     1                                       0.0        1.0
  1       D37     1                                       0.0        1.0
  1       D38     1                                       0.0        1.0
  1       D39     1                                       0.0        1.0
  1       D40     1                                       0.0        1.0
  1       D41     1                                       0.0        1.0
  1       D42     1                                       0.0        1.0
  1       D43     1                                       0.0        1.0
  1       D44     1                                       0.0        1.0
  1       D45     1                                       0.0        1.0
  1       D46     1                                       0.0        1.0
  1       D47     1                                       0.0        1.0
  1       D48     1                                       0.0        1.0
  1       D49     1                                       0.0        1.0
  1       D50     1                                       0.0        1.0
  1       D51     1                                       0.0        1.0
  1       D52     1                                       0.0        1.0

