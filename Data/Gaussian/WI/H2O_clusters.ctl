# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "CP2K"     : to run jobs using CP2K package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./H2O_cluster   2              Gaussian

# The project description
__title__ ::
"==================================== H2O cluster ================================="
"H2O cluster geometries in this set are collected from J. Phys. Chem. A 2004, 108 10519"

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                27 is the total number of jobs in this batch list
__batch__ :: 27
#"Flag"         "DIR"                        "InpName"       "JobType"
  A0           <PATH1>/H2O_clusters         H2O_1.com                energy
  0            <PATH1>/H2O_clusters         H2O_2-Linear.com         energy
  1            <PATH1>/H2O_clusters         H2O_3-Cyclic.com         energy
  2            <PATH1>/H2O_clusters         H2O_4-Cyclic.com         energy
  3            <PATH1>/H2O_clusters         H2O_5-Cyclic.com         energy
  4            <PATH1>/H2O_clusters         H2O_6-Cyclic.com         energy
  5            <PATH1>/H2O_clusters         H2O_6-Cyclic-2.com       energy
  6            <PATH1>/H2O_clusters         H2O_6-Prism.com          energy
  7            <PATH1>/H2O_clusters         H2O_6-Cage.com           energy
  8            <PATH1>/H2O_clusters         H2O_6-Book.com           energy
  9            <PATH1>/H2O_clusters         H2O_6-Bag.com            energy
 10            <PATH1>/H2O_clusters         H2O_7-Prism-2.com        energy
 11            <PATH1>/H2O_clusters         H2O_8-D2d.com            energy
 12            <PATH1>/H2O_clusters         H2O_8-S4.com             energy
 13            <PATH1>/H2O_clusters         H2O_9-D2dDD.com          energy
 14            <PATH1>/H2O_clusters         H2O_10-Prism.com         energy
 15            <PATH1>/H2O_clusters         H2O_10-Prism-2.com       energy
 16            <PATH1>/H2O_clusters         H2O_10-Butterfly.com     energy
 17            <PATH1>/H2O_clusters         H2O_11-Pr443.com         energy
 18            <PATH1>/H2O_clusters         H2O_12-Pr444.com         energy
 19            <PATH1>/H2O_clusters         H2O_13-Pr454.com         energy
 20            <PATH1>/H2O_clusters         H2O_14-Pr2444.com        energy
 21            <PATH1>/H2O_clusters         H2O_15-Pr555.com         energy
 22            <PATH1>/H2O_clusters         H2O_16-Pr4444.com        energy
 23            <PATH1>/H2O_clusters         H2O_17-Pr454.com         energy
 24            <PATH1>/H2O_clusters         H2O_18-Pr44244.com       energy
 25            <PATH1>/H2O_clusters         H2O_19-Globular.com      energy

# Training set for the atomization energy
#               26 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol"
__energy__ :: 26  627.51
#"Number" "Flag" "Scale"  "Flag" "Scale"    "Ref"      "Weight"
  2         0     1       A0      -2        0.0        1.0
  2         1     1       A0      -3        0.0        1.0
  2         2     1       A0      -4        0.0        1.0
  2         3     1       A0      -5        0.0        1.0
  2         4     1       A0      -6        0.0        1.0
  2         5     1       A0      -6        0.0        1.0
  2         6     1       A0      -6        0.0        1.0
  2         7     1       A0      -6        0.0        1.0
  2         8     1       A0      -6        0.0        1.0
  2         9     1       A0      -6        0.0        1.0
  2        10     1       A0      -7        0.0        1.0
  2        11     1       A0      -8        0.0        1.0
  2        12     1       A0      -8        0.0        1.0
  2        13     1       A0      -9        0.0        1.0
  2        14     1       A0      -10       0.0        1.0
  2        15     1       A0      -10       0.0        1.0
  2        16     1       A0      -10       0.0        1.0
  2        17     1       A0      -11       0.0        1.0
  2        18     1       A0      -12       0.0        1.0
  2        19     1       A0      -13       0.0        1.0
  2        20     1       A0      -14       0.0        1.0
  2        21     1       A0      -15       0.0        1.0
  2        22     1       A0      -16       0.0        1.0
  2        23     1       A0      -17       0.0        1.0
  2        24     1       A0      -18       0.0        1.0
  2        25     1       A0      -19       0.0        1.0
  

