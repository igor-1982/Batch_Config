# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G2-1           2		         Aims

# The project description
__title__ ::
"============================ G2-1 set ==============================="
"              There are  55 molecules in G2-1 set                    "
"All the geometries are optimized at the level of                     "
"G3    :   B3LYP/6-311+G(d,p)                                         "
"G3m   :   B3LYP/6-31G(2df,p)                                         "
"G3s   :   B3LYP/6-31G(d)                                             "                                                                    

# several global statements of control.in for aims Package
__aims_basis__ :: /home/igor/Documents/Package-Pool/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  2  051512.mpi
xc                      pbe                                                                                                                 
total_energy_method     rpa
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.6
sc_accuracy_rho  1E-6
sc_accuracy_eev  1E-4
sc_accuracy_etot 1E-6
sc_iter_limit    200
end aims

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , './EAtom'
<PATH2> , './G3'

# The molecular set to batch: 
#               55 is the total number of jobs in this batch list
__batch__ ::  55 
#"Flag"         "DIR"                         "InpName"       "JobType"
# G2-1 set 55
 G2-1           <PATH2>                       G2-1            energy
 G2-2           <PATH2>                       G2-2            energy
 G2-3           <PATH2>                       G2-3            energy
 G2-4           <PATH2>                       G2-4            energy
 G2-5           <PATH2>                       G2-5            energy
 G2-6           <PATH2>                       G2-6            energy
 G2-7           <PATH2>                       G2-7            energy
 G2-8           <PATH2>                       G2-8            energy
 G2-9           <PATH2>                       G2-9            energy
 G2-10          <PATH2>                       G2-10   	      energy
 G2-11          <PATH2>                       G2-11   	      energy
 G2-12          <PATH2>                       G2-12   	      energy
 G2-13          <PATH2>                       G2-13   	      energy
 G2-14          <PATH2>                       G2-14   	      energy
 G2-15          <PATH2>                       G2-15   	      energy
 G2-16          <PATH2>                       G2-16   	      energy
 G2-17          <PATH2>                       G2-17   	      energy
 G2-18          <PATH2>                       G2-18   	      energy
 G2-19          <PATH2>                       G2-19   	      energy
 G2-20          <PATH2>                       G2-20   	      energy
 G2-21          <PATH2>                       G2-21   	      energy
 G2-22          <PATH2>                       G2-22   	      energy
 G2-23          <PATH2>                       G2-23   	      energy
 G2-24          <PATH2>                       G2-24   	      energy
 G2-25          <PATH2>                       G2-25   	      energy
 G2-26          <PATH2>                       G2-26   	      energy
 G2-27          <PATH2>                       G2-27   	      energy
 G2-28          <PATH2>                       G2-28   	      energy
 G2-29          <PATH2>                       G2-29   	      energy
 G2-30          <PATH2>                       G2-30   	      energy
 G2-31          <PATH2>                       G2-31   	      energy
 G2-32          <PATH2>                       G2-32   	      energy
 G2-33          <PATH2>                       G2-33   	      energy
 G2-34          <PATH2>                       G2-34   	      energy
 G2-35          <PATH2>                       G2-35   	      energy
 G2-36          <PATH2>                       G2-36   	      energy
 G2-37          <PATH2>                       G2-37   	      energy
 G2-38          <PATH2>                       G2-38   	      energy
 G2-39          <PATH2>                       G2-39   	      energy
 G2-40          <PATH2>                       G2-40   	      energy
 G2-41          <PATH2>                       G2-41   	      energy
 G2-42          <PATH2>                       G2-42   	      energy
 G2-43          <PATH2>                       G2-43   	      energy
 G2-44          <PATH2>                       G2-44   	      energy
 G2-45          <PATH2>                       G2-45   	      energy
 G2-46          <PATH2>                       G2-46   	      energy
 G2-47          <PATH2>                       G2-47   	      energy
 G2-48          <PATH2>                       G2-48   	      energy
 G2-49          <PATH2>                       G2-49   	      energy
 G2-50          <PATH2>                       G2-50   	      energy
 G2-51          <PATH2>                       G2-51   	      energy
 G2-52          <PATH2>                       G2-52   	      energy
 G2-53          <PATH2>                       G2-53   	      energy
 G2-54          <PATH2>                       G2-54   	      energy
 G2-55          <PATH2>                       G2-55   	      energy

# Training set for the atomization energy
#               55 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ ::  55  627.51
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
 3         G2-1    -1   Li_0  1  H_0  1                                                 -57.98        1.0
 3         G2-2    -1   Be_0  1  H_0  1                                                 -49.92        1.0
 3         G2-3    -1    C_0  1  H_0  1                                                 -83.99        1.0
 3         G2-4    -1    C_0  1  H_0  2                                                -190.37        1.0
 3         G2-5    -1    C_0  1  H_0  2                                                -180.92        1.0
 3         G2-6    -1    C_0  1  H_0  3                                                -307.55        1.0
 3         G2-7    -1    C_0  1  H_0  4                                                -420.19        1.0
 3         G2-8    -1    N_0  1  H_0  1                                                 -83.58        1.0
 3         G2-9    -1    N_0  1  H_0  2                                                -181.72        1.0
 3         G2-10   -1    N_0  1  H_0  3                                                -297.93        1.0
 3         G2-11   -1    O_0  1  H_0  1                                                -106.71        1.0
 3         G2-12   -1    O_0  1  H_0  2                                                -232.78        1.0
 3         G2-13   -1    F_0  1  H_0  1                                                -141.42        1.0
 3         G2-14   -1   Si_0  1  H_0  2                                                -151.91        1.0
 3         G2-15   -1   Si_0  1  H_0  2                                                -131.16        1.0
 3         G2-16   -1   Si_0  1  H_0  3                                                -225.84        1.0
 3         G2-17   -1   Si_0  1  H_0  4                                                -322.39        1.0
 3         G2-18   -1    P_0  1  H_0  2                                                -152.93        1.0
 3         G2-19   -1    P_0  1  H_0  3                                                -241.92        1.0
 3         G2-20   -1    S_0  1  H_0  2                                                -182.98        1.0
 3         G2-21   -1   Cl_0  1  H_0  1                                                -107.22        1.0
 2         G2-22   -1   Li_0  2                                                         -24.37        1.0
 3         G2-23   -1   Li_0  1  F_0  1                                                -137.87        1.0
 3         G2-24   -1    C_0  2  H_0  2                                                -405.79        1.0
 3         G2-25   -1    C_0  2  H_0  4                                                -563.55        1.0
 3         G2-26   -1    C_0  2  H_0  6                                                -712.27        1.0
 3         G2-27   -1    C_0  1  N_0  1                                                -181.51        1.0
 4         G2-28   -1    H_0  1  C_0  1  N_0  1                                        -312.76        1.0
 3         G2-29   -1    C_0  1  O_0  1                                                -259.61        1.0
 4         G2-30   -1    H_0  1  C_0  1  O_0  1                                        -279.03        1.0
 4         G2-31   -1    H_0  2  C_0  1  O_0  1                                        -374.01        1.0
 4         G2-32   -1    H_0  4  C_0  1  O_0  1                                        -512.81        1.0
 2         G2-33   -1    N_0  2                                                        -228.51        1.0
 3         G2-34   -1    N_0  2  H_0  4                                                -438.33        1.0
 3         G2-35   -1    N_0  1  O_0  1                                                -152.95        1.0
 2         G2-36   -1    O_0  2                                                        -120.73        1.0
 3         G2-37   -1    H_0  2  O_0  2                                                -269.14        1.0
 2         G2-38   -1    F_0  2                                                         -39.09        1.0
 3         G2-39   -1    C_0  1  O_0  2                                                -389.70        1.0
 2         G2-40   -1   Na_0  2                                                         -17.03        1.0
 2         G2-41   -1   Si_0  2                                                         -75.57        1.0
 2         G2-42   -1    P_0  2                                                        -117.22        1.0
 2         G2-43   -1    S_0  2                                                        -102.71        1.0
 2         G2-44   -1   Cl_0  2                                                         -59.59        1.0
 3         G2-45   -1   Na_0  1 Cl_0  1                                                 -98.84        1.0
 3         G2-46   -1   Si_0  1  O_0  1                                                -192.91        1.0
 3         G2-47   -1    S_0  1  C_0  1                                                -172.01        1.0
 3         G2-48   -1    S_0  1  O_0  1                                                -125.81        1.0
 3         G2-49   -1   Cl_0  1  O_0  1                                                 -65.58        1.0
 3         G2-50   -1    F_0  1 Cl_0  1                                                 -62.55        1.0
 3         G2-51   -1   Si_0  2  H_0  6                                                -531.27        1.0
 4         G2-52   -1    C_0  1  H_0  3 Cl_0  1                                        -395.39        1.0
 4         G2-53   -1    H_0  4  C_0  1  S_0  1                                        -474.25        1.0
 4         G2-54   -1    H_0  1  O_0  1 Cl_0  1                                        -165.43        1.0
 3         G2-55   -1    S_0  1  O_0  2                                                -259.16        1.0
