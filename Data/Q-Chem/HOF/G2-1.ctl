# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G2-1           2		   QChem

# The project description
__title__ ::
"============================ G2-1 set ==============================="
"              There are  55 molecules in G2-1 set                    "
"All the geometries are optimized at the level of                     "
"G3    :   B3LYP/6-311+G(d,p)                                         "
"G3m   :   B3LYP/6-31G(2df,p)                                         "
"G3s   :   B3LYP/6-31G(d)                                             "                                                                    


# $rem group of Q-Chem Package
__qchem__ ::  1  rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
exchange = b3lyp
basis = 6-311+g(3df,2p)
scf_convergence = 8
xc_grid = 000075000194
$end

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , './EAtom'
<PATH2> , './G3'

# The molecular set to batch: 
#               55 is the total number of jobs in this batch list
__batch__ ::  55 
#"Flag"         "DIR"                         "InpName"       "JobType"
# G2-1 set 55
 G2-1           <PATH2>                       G2-1.in         energy
 G2-2           <PATH2>                       G2-2.in         energy
 G2-3           <PATH2>                       G2-3.in         energy
 G2-4           <PATH2>                       G2-4.in         energy
 G2-5           <PATH2>                       G2-5.in         energy
 G2-6           <PATH2>                       G2-6.in         energy
 G2-7           <PATH2>                       G2-7.in         energy
 G2-8           <PATH2>                       G2-8.in         energy
 G2-9           <PATH2>                       G2-9.in         energy
 G2-10          <PATH2>                       G2-10.in	      energy
 G2-11          <PATH2>                       G2-11.in	      energy
 G2-12          <PATH2>                       G2-12.in	      energy
 G2-13          <PATH2>                       G2-13.in	      energy
 G2-14          <PATH2>                       G2-14.in	      energy
 G2-15          <PATH2>                       G2-15.in	      energy
 G2-16          <PATH2>                       G2-16.in	      energy
 G2-17          <PATH2>                       G2-17.in	      energy
 G2-18          <PATH2>                       G2-18.in	      energy
 G2-19          <PATH2>                       G2-19.in	      energy
 G2-20          <PATH2>                       G2-20.in	      energy
 G2-21          <PATH2>                       G2-21.in	      energy
 G2-22          <PATH2>                       G2-22.in	      energy
 G2-23          <PATH2>                       G2-23.in	      energy
 G2-24          <PATH2>                       G2-24.in	      energy
 G2-25          <PATH2>                       G2-25.in	      energy
 G2-26          <PATH2>                       G2-26.in	      energy
 G2-27          <PATH2>                       G2-27.in	      energy
 G2-28          <PATH2>                       G2-28.in	      energy
 G2-29          <PATH2>                       G2-29.in	      energy
 G2-30          <PATH2>                       G2-30.in	      energy
 G2-31          <PATH2>                       G2-31.in	      energy
 G2-32          <PATH2>                       G2-32.in	      energy
 G2-33          <PATH2>                       G2-33.in	      energy
 G2-34          <PATH2>                       G2-34.in	      energy
 G2-35          <PATH2>                       G2-35.in	      energy
 G2-36          <PATH2>                       G2-36.in	      energy
 G2-37          <PATH2>                       G2-37.in	      energy
 G2-38          <PATH2>                       G2-38.in	      energy
 G2-39          <PATH2>                       G2-39.in	      energy
 G2-40          <PATH2>                       G2-40.in	      energy
 G2-41          <PATH2>                       G2-41.in	      energy
 G2-42          <PATH2>                       G2-42.in	      energy
 G2-43          <PATH2>                       G2-43.in	      energy
 G2-44          <PATH2>                       G2-44.in	      energy
 G2-45          <PATH2>                       G2-45.in	      energy
 G2-46          <PATH2>                       G2-46.in	      energy
 G2-47          <PATH2>                       G2-47.in	      energy
 G2-48          <PATH2>                       G2-48.in	      energy
 G2-49          <PATH2>                       G2-49.in	      energy
 G2-50          <PATH2>                       G2-50.in	      energy
 G2-51          <PATH2>                       G2-51.in	      energy
 G2-52          <PATH2>                       G2-52.in	      energy
 G2-53          <PATH2>                       G2-53.in	      energy
 G2-54          <PATH2>                       G2-54.in	      energy
 G2-55          <PATH2>                       G2-55.in	      energy

# Training set for the atomization energy
#               55 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ ::  55  1.0
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
 1         G2-1     1                                    0.0        1.0
 1         G2-2     1                                    0.0        1.0
 1         G2-3     1                                    0.0        1.0
 1         G2-4     1                                    0.0        1.0
 1         G2-5     1                                    0.0        1.0
 1         G2-6     1                                    0.0        1.0
 1         G2-7     1                                    0.0        1.0
 1         G2-8     1                                    0.0        1.0
 1         G2-9     1                                    0.0        1.0
 1         G2-10    1                                    0.0        1.0
 1         G2-11    1                                    0.0        1.0
 1         G2-12    1                                    0.0        1.0
 1         G2-13    1                                    0.0        1.0
 1         G2-14    1                                    0.0        1.0
 1         G2-15    1                                    0.0        1.0
 1         G2-16    1                                    0.0        1.0
 1         G2-17    1                                    0.0        1.0
 1         G2-18    1                                    0.0        1.0
 1         G2-19    1                                    0.0        1.0
 1         G2-20    1                                    0.0        1.0
 1         G2-21    1                                    0.0        1.0
 1         G2-22    1                                    0.0        1.0
 1         G2-23    1                                    0.0        1.0
 1         G2-24    1                                    0.0        1.0
 1         G2-25    1                                    0.0        1.0
 1         G2-26    1                                    0.0        1.0
 1         G2-27    1                                    0.0        1.0
 1         G2-28    1                                    0.0        1.0
 1         G2-29    1                                    0.0        1.0
 1         G2-30    1                                    0.0        1.0
 1         G2-31    1                                    0.0        1.0
 1         G2-32    1                                    0.0        1.0
 1         G2-33    1                                    0.0        1.0
 1         G2-34    1                                    0.0        1.0
 1         G2-35    1                                    0.0        1.0
 1         G2-36    1                                    0.0        1.0
 1         G2-37    1                                    0.0        1.0
 1         G2-38    1                                    0.0        1.0
 1         G2-39    1                                    0.0        1.0
 1         G2-40    1                                    0.0        1.0
 1         G2-41    1                                    0.0        1.0
 1         G2-42    1                                    0.0        1.0
 1         G2-43    1                                    0.0        1.0
 1         G2-44    1                                    0.0        1.0
 1         G2-45    1                                    0.0        1.0
 1         G2-46    1                                    0.0        1.0
 1         G2-47    1                                    0.0        1.0
 1         G2-48    1                                    0.0        1.0
 1         G2-49    1                                    0.0        1.0
 1         G2-50    1                                    0.0        1.0
 1         G2-51    1                                    0.0        1.0
 1         G2-52    1                                    0.0        1.0
 1         G2-53    1                                    0.0        1.0
 1         G2-54    1                                    0.0        1.0
 1         G2-55    1                                    0.0        1.0




