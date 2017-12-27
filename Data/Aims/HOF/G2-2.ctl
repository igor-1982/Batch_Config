# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G2-2           2		         Aims

# The project description
__title__ ::
"============================ G2-2 set ==============================="
"              There are  93 molecules in G2-2 set                    "
"All the geometries are optimized at the level of                     "
"G3    :   B3LYP/6-311+G(d,p)                                         "
"G3m   :   B3LYP/6-31G(2df,p)                                         "
"G3s   :   B3LYP/6-31G(d)                                             "

# several global statements of control.in for aims Package
__aims_basis__ :: /home/igor/Documents/Package-Pool/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  2  051512.mpi
xc                      pbe                                                                                                                 
total_energy_method     rpa
charge                  0.
relativistic            none
occupation_type         gaussian 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.2
sc_accuracy_rho  1E-6
sc_accuracy_eev  1E-4
sc_accuracy_etot 1E-6
sc_iter_limit    200
end aims


# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , '.'
<PATH2> , './G3'

# The molecular set to batch: 
#             93 is the total number of jobs in this batch list
__batch__ ::  93
#"Flag"         "DIR"                         "InpName"      "JobType"
# G2-2 set 93
 G2-56          <PATH2>                       G2-56   	     energy
 G2-57          <PATH2>                       G2-57   	     energy
 G2-58          <PATH2>                       G2-58   	     energy
 G2-59          <PATH2>                       G2-59   	     energy
 G2-60          <PATH2>                       G2-60   	     energy
 G2-61          <PATH2>                       G2-61   	     energy
 G2-62          <PATH2>                       G2-62   	     energy
 G2-63          <PATH2>                       G2-63   	     energy
 G2-64          <PATH2>                       G2-64   	     energy
 G2-65          <PATH2>                       G2-65   	     energy
 G2-66          <PATH2>                       G2-66   	     energy
 G2-67          <PATH2>                       G2-67   	     energy
 G2-68          <PATH2>                       G2-68   	     energy
 G2-69          <PATH2>                       G2-69   	     energy
 G2-70          <PATH2>                       G2-70   	     energy
 G2-71          <PATH2>                       G2-71   	     energy
 G2-72          <PATH2>                       G2-72   	     energy
 G2-73          <PATH2>                       G2-73   	     energy
 G2-74          <PATH2>                       G2-74   	     energy
 G2-75          <PATH2>                       G2-75   	     energy
 G2-76          <PATH2>                       G2-76   	     energy
 G2-77          <PATH2>                       G2-77   	     energy
 G2-78          <PATH2>                       G2-78   	     energy
 G2-79          <PATH2>                       G2-79   	     energy
 G2-80          <PATH2>                       G2-80   	     energy
 G2-81          <PATH2>                       G2-81   	     energy
 G2-82          <PATH2>                       G2-82   	     energy
 G2-83          <PATH2>                       G2-83   	     energy
 G2-84          <PATH2>                       G2-84   	     energy
 G2-85          <PATH2>                       G2-85   	     energy
 G2-86          <PATH2>                       G2-86   	     energy
 G2-87          <PATH2>                       G2-87   	     energy
 G2-88          <PATH2>                       G2-88   	     energy
 G2-89          <PATH2>                       G2-89   	     energy
 G2-90          <PATH2>                       G2-90   	     energy
 G2-91          <PATH2>                       G2-91   	     energy
 G2-92          <PATH2>                       G2-92   	     energy
 G2-93          <PATH2>                       G2-93   	     energy
 G2-94          <PATH2>                       G2-94   	     energy
 G2-95          <PATH2>                       G2-95   	     energy
 G2-96          <PATH2>                       G2-96   	     energy
 G2-97          <PATH2>                       G2-97   	     energy
 G2-98          <PATH2>                       G2-98   	     energy
 G2-99          <PATH2>                       G2-99   	     energy
 G2-100	        <PATH2>                       G2-100         energy
 G2-101	        <PATH2>                       G2-101         energy
 G2-102	        <PATH2>                       G2-102         energy
 G2-103	        <PATH2>                       G2-103         energy
 G2-104	        <PATH2>                       G2-104         energy
 G2-105	        <PATH2>                       G2-105         energy
 G2-106	        <PATH2>                       G2-106         energy
 G2-107	        <PATH2>                       G2-107         energy
 G2-108	        <PATH2>                       G2-108         energy
 G2-109	        <PATH2>                       G2-109         energy
 G2-110	        <PATH2>                       G2-110         energy
 G2-111	        <PATH2>                       G2-111         energy
 G2-112	        <PATH2>                       G2-112         energy
 G2-113	        <PATH2>                       G2-113         energy
 G2-114	        <PATH2>                       G2-114         energy
 G2-115	        <PATH2>                       G2-115         energy
 G2-116	        <PATH2>                       G2-116         energy
 G2-117	        <PATH2>                       G2-117         energy
 G2-118	        <PATH2>                       G2-118         energy
 G2-119	        <PATH2>                       G2-119         energy
 G2-120	        <PATH2>                       G2-120         energy
 G2-121	        <PATH2>                       G2-121         energy
 G2-122	        <PATH2>                       G2-122         energy
 G2-123	        <PATH2>                       G2-123         energy
 G2-124	        <PATH2>                       G2-124         energy
 G2-125	        <PATH2>                       G2-125         energy
 G2-126	        <PATH2>                       G2-126         energy
 G2-127	        <PATH2>                       G2-127         energy
 G2-128	        <PATH2>                       G2-128         energy
 G2-129	        <PATH2>                       G2-129         energy
 G2-130	        <PATH2>                       G2-130         energy
 G2-131	        <PATH2>                       G2-131         energy
 G2-132	        <PATH2>                       G2-132         energy
 G2-133	        <PATH2>                       G2-133         energy
 G2-134	        <PATH2>                       G2-134         energy
 G2-135	        <PATH2>                       G2-135         energy
 G2-136	        <PATH2>                       G2-136         energy
 G2-137	        <PATH2>                       G2-137         energy
 G2-138	        <PATH2>                       G2-138         energy
 G2-139	        <PATH2>                       G2-139         energy
 G2-140	        <PATH2>                       G2-140         energy
 G2-141	        <PATH2>                       G2-141         energy
 G2-142	        <PATH2>                       G2-142         energy
 G2-143	        <PATH2>                       G2-143         energy
 G2-144	        <PATH2>                       G2-144         energy
 G2-145	        <PATH2>                       G2-145         energy
 G2-146	        <PATH2>                       G2-146         energy
 G2-147	        <PATH2>                       G2-147         energy
 G2-148	        <PATH2>                       G2-148         energy

# Training set for the atomization energy
#               93 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 93  1.0
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
 1         G2-56    1                                    0.0        1.0
 1         G2-57    1                                    0.0        1.0
 1         G2-58    1                                    0.0        1.0
 1         G2-59    1                                    0.0        1.0
 1         G2-60    1                                    0.0        1.0
 1         G2-61    1                                    0.0        1.0
 1         G2-62    1                                    0.0        1.0
 1         G2-63    1                                    0.0        1.0
 1         G2-64    1                                    0.0        1.0
 1         G2-65    1                                    0.0        1.0
 1         G2-66    1                                    0.0        1.0
 1         G2-67    1                                    0.0        1.0
 1         G2-68    1                                    0.0        1.0
 1         G2-69    1                                    0.0        1.0
 1         G2-70    1                                    0.0        1.0
 1         G2-71    1                                    0.0        1.0
 1         G2-72    1                                    0.0        1.0
 1         G2-73    1                                    0.0        1.0
 1         G2-74    1                                    0.0        1.0
 1         G2-75    1                                    0.0        1.0
 1         G2-76    1                                    0.0        1.0
 1         G2-77    1                                    0.0        1.0
 1         G2-78    1                                    0.0        1.0
 1         G2-79    1                                    0.0        1.0
 1         G2-80    1                                    0.0        1.0
 1         G2-81    1                                    0.0        1.0
 1         G2-82    1                                    0.0        1.0
 1         G2-83    1                                    0.0        1.0
 1         G2-84    1                                    0.0        1.0
 1         G2-85    1                                    0.0        1.0
 1         G2-86    1                                    0.0        1.0
 1         G2-87    1                                    0.0        1.0
 1         G2-88    1                                    0.0        1.0
 1         G2-89    1                                    0.0        1.0
 1         G2-90    1                                    0.0        1.0
 1         G2-91    1                                    0.0        1.0
 1         G2-92    1                                    0.0        1.0
 1         G2-93    1                                    0.0        1.0
 1         G2-94    1                                    0.0        1.0
 1         G2-95    1                                    0.0        1.0
 1         G2-96    1                                    0.0        1.0
 1         G2-97    1                                    0.0        1.0
 1         G2-98    1                                    0.0        1.0
 1         G2-99    1                                    0.0        1.0
 1         G2-100   1                                    0.0        1.0
 1         G2-101   1                                    0.0        1.0
 1         G2-102   1                                    0.0        1.0
 1         G2-103   1                                    0.0        1.0
 1         G2-104   1                                    0.0        1.0
 1         G2-105   1                                    0.0        1.0
 1         G2-106   1                                    0.0        1.0
 1         G2-107   1                                    0.0        1.0
 1         G2-108   1                                    0.0        1.0
 1         G2-109   1                                    0.0        1.0
 1         G2-110   1                                    0.0        1.0
 1         G2-111   1                                    0.0        1.0
 1         G2-112   1                                    0.0        1.0
 1         G2-113   1                                    0.0        1.0
 1         G2-114   1                                    0.0        1.0
 1         G2-115   1                                    0.0        1.0
 1         G2-116   1                                    0.0        1.0
 1         G2-117   1                                    0.0        1.0
 1         G2-118   1                                    0.0        1.0
 1         G2-119   1                                    0.0        1.0
 1         G2-120   1                                    0.0        1.0
 1         G2-121   1                                    0.0        1.0
 1         G2-122   1                                    0.0        1.0
 1         G2-123   1                                    0.0        1.0
 1         G2-124   1                                    0.0        1.0
 1         G2-125   1                                    0.0        1.0
 1         G2-126   1                                    0.0        1.0
 1         G2-127   1                                    0.0        1.0
 1         G2-128   1                                    0.0        1.0
 1         G2-129   1                                    0.0        1.0
 1         G2-130   1                                    0.0        1.0
 1         G2-131   1                                    0.0        1.0
 1         G2-132   1                                    0.0        1.0
 1         G2-133   1                                    0.0        1.0
 1         G2-134   1                                    0.0        1.0
 1         G2-135   1                                    0.0        1.0
 1         G2-136   1                                    0.0        1.0
 1         G2-137   1                                    0.0        1.0
 1         G2-138   1                                    0.0        1.0
 1         G2-139   1                                    0.0        1.0
 1         G2-140   1                                    0.0        1.0
 1         G2-141   1                                    0.0        1.0
 1         G2-142   1                                    0.0        1.0
 1         G2-143   1                                    0.0        1.0
 1         G2-144   1                                    0.0        1.0
 1         G2-145   1                                    0.0        1.0
 1         G2-146   1                                    0.0        1.0
 1         G2-147   1                                    0.0        1.0
 1         G2-148   1                                    0.0        1.0




