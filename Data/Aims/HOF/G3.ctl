# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G3           2		          aims

# The project description
__title__ ::
"============================= G3 set ================================"
"              There are  223 molecules in G3 set                     "
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
<PATH1> , './EAtom'
<PATH2> , './G3'

# The molecular set to batch: 
#               240 is the total number of jobs in this batch list
__batch__ ::  240
#"Flag"         "DIR"                         "InpName"       "JobType"
# Atoms  17
 H_0            <PATH1>                       H_0            energy 
 He_0           <PATH1>                      He_0            energy 
 Li_0           <PATH1>                       Li_0           energy 
 Be_0           <PATH1>                       Be_0           energy 
 B_0            <PATH1>                       B_0            energy 
 C_0            <PATH1>                       C_0            energy 
 N_0            <PATH1>                       N_0            energy 
 O_0            <PATH1>                       O_0            energy 
 F_0            <PATH1>                       F_0            energy 
 Ne_0           <PATH1>                      Ne_0            energy 
 Na_0           <PATH1>                       Na_0           energy 
 Mg_0           <PATH1>                       Mg_0           energy 
 Al_0           <PATH1>                       Al_0           energy 
 Si_0           <PATH1>                       Si_0           energy 
 P_0            <PATH1>                       P_0            energy 
 S_0            <PATH1>                       S_0            energy 
 Cl_0           <PATH1>                       Cl_0           energy 
# G2 set 223
 G2-1           <PATH2>                       G2-1           energy
 G2-2           <PATH2>                       G2-2           energy
 G2-3           <PATH2>                       G2-3           energy
 G2-4           <PATH2>                       G2-4           energy
 G2-5           <PATH2>                       G2-5           energy
 G2-6           <PATH2>                       G2-6           energy
 G2-7           <PATH2>                       G2-7           energy
 G2-8           <PATH2>                       G2-8           energy
 G2-9           <PATH2>                       G2-9           energy
 G2-10          <PATH2>                       G2-10   	     energy
 G2-11          <PATH2>                       G2-11   	     energy
 G2-12          <PATH2>                       G2-12   	     energy
 G2-13          <PATH2>                       G2-13   	     energy
 G2-14          <PATH2>                       G2-14   	     energy
 G2-15          <PATH2>                       G2-15   	     energy
 G2-16          <PATH2>                       G2-16   	     energy
 G2-17          <PATH2>                       G2-17   	     energy
 G2-18          <PATH2>                       G2-18   	     energy
 G2-19          <PATH2>                       G2-19   	     energy
 G2-20          <PATH2>                       G2-20   	     energy
 G2-21          <PATH2>                       G2-21   	     energy
 G2-22          <PATH2>                       G2-22   	     energy
 G2-23          <PATH2>                       G2-23   	     energy
 G2-24          <PATH2>                       G2-24   	     energy
 G2-25          <PATH2>                       G2-25   	     energy
 G2-26          <PATH2>                       G2-26   	     energy
 G2-27          <PATH2>                       G2-27   	     energy
 G2-28          <PATH2>                       G2-28   	     energy
 G2-29          <PATH2>                       G2-29   	     energy
 G2-30          <PATH2>                       G2-30   	     energy
 G2-31          <PATH2>                       G2-31   	     energy
 G2-32          <PATH2>                       G2-32   	     energy
 G2-33          <PATH2>                       G2-33   	     energy
 G2-34          <PATH2>                       G2-34   	     energy
 G2-35          <PATH2>                       G2-35   	     energy
 G2-36          <PATH2>                       G2-36   	     energy
 G2-37          <PATH2>                       G2-37   	     energy
 G2-38          <PATH2>                       G2-38   	     energy
 G2-39          <PATH2>                       G2-39   	     energy
 G2-40          <PATH2>                       G2-40   	     energy
 G2-41          <PATH2>                       G2-41   	     energy
 G2-42          <PATH2>                       G2-42   	     energy
 G2-43          <PATH2>                       G2-43   	     energy
 G2-44          <PATH2>                       G2-44   	     energy
 G2-45          <PATH2>                       G2-45   	     energy
 G2-46          <PATH2>                       G2-46   	     energy
 G2-47          <PATH2>                       G2-47   	     energy
 G2-48          <PATH2>                       G2-48   	     energy
 G2-49          <PATH2>                       G2-49   	     energy
 G2-50          <PATH2>                       G2-50   	     energy
 G2-51          <PATH2>                       G2-51   	     energy
 G2-52          <PATH2>                       G2-52   	     energy
 G2-53          <PATH2>                       G2-53   	     energy
 G2-54          <PATH2>                       G2-54   	     energy
 G2-55          <PATH2>                       G2-55   	     energy
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
 G2-149	        <PATH2>                       G2-149         energy
 G2-150	        <PATH2>                       G2-150         energy
 G2-151	        <PATH2>                       G2-151         energy
 G2-152	        <PATH2>                       G2-152         energy
 G2-153	        <PATH2>                       G2-153         energy
 G2-154	        <PATH2>                       G2-154         energy
 G2-155	        <PATH2>                       G2-155         energy
 G2-156	        <PATH2>                       G2-156         energy
 G2-157	        <PATH2>                       G2-157         energy
 G2-158	        <PATH2>                       G2-158         energy
 G2-159	        <PATH2>                       G2-159         energy
 G2-160	        <PATH2>                       G2-160         energy
 G2-161	        <PATH2>                       G2-161         energy
 G2-162	        <PATH2>                       G2-162         energy
 G2-163	        <PATH2>                       G2-163         energy
 G2-164	        <PATH2>                       G2-164         energy
 G2-165	        <PATH2>                       G2-165         energy
 G2-166	        <PATH2>                       G2-166         energy
 G2-167	        <PATH2>                       G2-167         energy
 G2-168	        <PATH2>                       G2-168         energy
 G2-169	        <PATH2>                       G2-169         energy
 G2-170	        <PATH2>                       G2-170         energy
 G2-171	        <PATH2>                       G2-171         energy
 G2-172	        <PATH2>                       G2-172         energy
 G2-173	        <PATH2>                       G2-173         energy
 G2-174	        <PATH2>                       G2-174         energy
 G2-175	        <PATH2>                       G2-175         energy
 G2-176	        <PATH2>                       G2-176         energy
 G2-177	        <PATH2>                       G2-177         energy
 G2-178	        <PATH2>                       G2-178         energy
 G2-179	        <PATH2>                       G2-179         energy
 G2-180	        <PATH2>                       G2-180         energy
 G2-181	        <PATH2>                       G2-181         energy
 G2-182	        <PATH2>                       G2-182         energy
 G2-183	        <PATH2>                       G2-183         energy
 G2-184	        <PATH2>                       G2-184         energy
 G2-185	        <PATH2>                       G2-185         energy
 G2-186	        <PATH2>                       G2-186         energy
 G2-187	        <PATH2>                       G2-187         energy
 G2-188	        <PATH2>                       G2-188         energy
 G2-189	        <PATH2>                       G2-189         energy
 G2-190	        <PATH2>                       G2-190         energy
 G2-191	        <PATH2>                       G2-191         energy
 G2-192	        <PATH2>                       G2-192         energy
 G2-193	        <PATH2>                       G2-193         energy
 G2-194	        <PATH2>                       G2-194         energy
 G2-195	        <PATH2>                       G2-195         energy
 G2-196	        <PATH2>                       G2-196         energy
 G2-197	        <PATH2>                       G2-197         energy
 G2-198	        <PATH2>                       G2-198         energy
 G2-199	        <PATH2>                       G2-199         energy
 G2-200	        <PATH2>                       G2-200         energy
 G2-201	        <PATH2>                       G2-201         energy
 G2-202	        <PATH2>                       G2-202         energy
 G2-203	        <PATH2>                       G2-203         energy
 G2-204	        <PATH2>                       G2-204         energy
 G2-205	        <PATH2>                       G2-205         energy
 G2-206	        <PATH2>                       G2-206         energy
 G2-207	        <PATH2>                       G2-207         energy
 G2-208	        <PATH2>                       G2-208         energy
 G2-209	        <PATH2>                       G2-209         energy
 G2-210	        <PATH2>                       G2-210         energy
 G2-211	        <PATH2>                       G2-211         energy
 G2-212	        <PATH2>                       G2-212         energy
 G2-213	        <PATH2>                       G2-213         energy
 G2-214	        <PATH2>                       G2-214         energy
 G2-215	        <PATH2>                       G2-215         energy
 G2-216	        <PATH2>                       G2-216         energy
 G2-217	        <PATH2>                       G2-217         energy
 G2-218	        <PATH2>                       G2-218         energy
 G2-219	        <PATH2>                       G2-219         energy
 G2-220	        <PATH2>                       G2-220         energy
 G2-221	        <PATH2>                       G2-221         energy
 G2-222	        <PATH2>                       G2-222         energy
 G2-223	        <PATH2>                       G2-223         energy

# Training set for the atomization energy
#              223 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 223  627.51
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
 3         G2-1    -1   Li_0  1  H_0  1                  0.0        1.0
 3         G2-2    -1   Be_0  1  H_0  1                  0.0        1.0
 3         G2-3    -1    C_0  1  H_0  1                  0.0        1.0
 3         G2-4    -1    C_0  1  H_0  2                  0.0        1.0
 3         G2-5    -1    C_0  1  H_0  2                  0.0        1.0
 3         G2-6    -1    C_0  1  H_0  3                  0.0        1.0
 3         G2-7    -1    C_0  1  H_0  4                  0.0        1.0
 3         G2-8    -1    N_0  1  H_0  1                  0.0        1.0
 3         G2-9    -1    N_0  1  H_0  2                  0.0        1.0
 3         G2-10   -1    N_0  1  H_0  3                  0.0        1.0
 3         G2-11   -1    O_0  1  H_0  1                  0.0        1.0
 3         G2-12   -1    O_0  1  H_0  2                  0.0        1.0
 3         G2-13   -1    F_0  1  H_0  1                  0.0        1.0
 3         G2-14   -1   Si_0  1  H_0  2                  0.0        1.0
 3         G2-15   -1   Si_0  1  H_0  2                  0.0        1.0
 3         G2-16   -1   Si_0  1  H_0  3                  0.0        1.0
 3         G2-17   -1   Si_0  1  H_0  4                  0.0        1.0
 3         G2-18   -1    P_0  1  H_0  2                  0.0        1.0
 3         G2-19   -1    P_0  1  H_0  3                  0.0        1.0
 3         G2-20   -1    S_0  1  H_0  2                  0.0        1.0
 3         G2-21   -1   Cl_0  1  H_0  1                  0.0        1.0
 2         G2-22   -1   Li_0  2                          0.0        1.0
 3         G2-23   -1   Li_0  1  F_0  1                  0.0        1.0
 3         G2-24   -1    C_0  2  H_0  2                  0.0        1.0
 3         G2-25   -1    C_0  2  H_0  4                  0.0        1.0
 3         G2-26   -1    C_0  2  H_0  6                  0.0        1.0
 3         G2-27   -1    C_0  1  N_0  1                  0.0        1.0
 4         G2-28   -1    H_0  1  C_0  1  N_0  1          0.0        1.0
 3         G2-29   -1    C_0  1  O_0  1                  0.0        1.0
 4         G2-30   -1    H_0  1  C_0  1  O_0  1          0.0        1.0
 4         G2-31   -1    H_0  2  C_0  1  O_0  1          0.0        1.0
 4         G2-32   -1    H_0  4  C_0  1  O_0  1          0.0        1.0
 2         G2-33   -1    N_0  2                          0.0        1.0
 3         G2-34   -1    N_0  2  H_0  4                  0.0        1.0
 3         G2-35   -1    N_0  1  O_0  1                  0.0        1.0
 2         G2-36   -1    O_0  2                          0.0        1.0
 3         G2-37   -1    H_0  2  O_0  2                  0.0        1.0
 2         G2-38   -1    F_0  2                          0.0        1.0
 3         G2-39   -1    C_0  1  O_0  2                  0.0        1.0
 2         G2-40   -1   Na_0  2                          0.0        1.0
 2         G2-41   -1   Si_0  2                          0.0        1.0
 2         G2-42   -1    P_0  2                          0.0        1.0
 2         G2-43   -1    S_0  2                          0.0        1.0
 2         G2-44   -1   Cl_0  2                          0.0        1.0
 3         G2-45   -1   Na_0  1 Cl_0  1                  0.0        1.0
 3         G2-46   -1   Si_0  1  O_0  1                  0.0        1.0
 3         G2-47   -1    S_0  1  C_0  1                  0.0        1.0
 3         G2-48   -1    S_0  1  O_0  1                  0.0        1.0
 3         G2-49   -1   Cl_0  1  O_0  1                  0.0        1.0
 3         G2-50   -1    F_0  1 Cl_0  1                  0.0        1.0
 3         G2-51   -1   Si_0  2  H_0  6                  0.0        1.0
 4         G2-52   -1    C_0  1  H_0  3 Cl_0  1          0.0        1.0
 4         G2-53   -1    H_0  4  C_0  1  S_0  1          0.0        1.0
 4         G2-54   -1    H_0  1  O_0  1 Cl_0  1          0.0        1.0
 3         G2-55   -1    S_0  1  O_0  2                  0.0        1.0
 3         G2-56   -1    F_0  3  B_0  1                  0.0        1.0
 3         G2-57   -1   Cl_0  3  B_0  1                  0.0        1.0
 3         G2-58   -1    F_0  3 Al_0  1                  0.0        1.0
 3         G2-59   -1   Cl_0  3 Al_0  1                  0.0        1.0
 3         G2-60   -1    F_0  4  C_0  1                  0.0        1.0
 3         G2-61   -1   Cl_0  4  C_0  1                  0.0        1.0
 4         G2-62   -1    C_0  1  O_0  1  S_0  1          0.0        1.0
 3         G2-63   -1    C_0  1  S_0  2                  0.0        1.0
 4         G2-64   -1    C_0  1  F_0  2  O_0  1          0.0        1.0
 3         G2-65   -1    F_0  4 Si_0  1                  0.0        1.0
 3         G2-66   -1   Cl_0  4 Si_0  1                  0.0        1.0
 3         G2-67   -1    N_0  2  O_0  1                  0.0        1.0
 4         G2-68   -1   Cl_0  1  N_0  1  O_0  1          0.0        1.0
 3         G2-69   -1    F_0  3  N_0  1                  0.0        1.0
 3         G2-70   -1    F_0  3  P_0  1                  0.0        1.0
 2         G2-71   -1    O_0  3                          0.0        1.0
 3         G2-72   -1    F_0  2  O_0  1                  0.0        1.0
 3         G2-73   -1    F_0  3 Cl_0  1                  0.0        1.0
 3         G2-74   -1    F_0  4  C_0  2                  0.0        1.0
 3         G2-75   -1   Cl_0  4  C_0  2                  0.0        1.0
 4         G2-76   -1    F_0  3  C_0  2  N_0  1          0.0        1.0
 3         G2-77   -1    H_0  4  C_0  3                  0.0        1.0
 3         G2-78   -1    H_0  4  C_0  3                  0.0        1.0
 3         G2-79   -1    H_0  4  C_0  3                  0.0        1.0
 3         G2-80   -1    H_0  6  C_0  3                  0.0        1.0
 3         G2-81   -1    H_0  6  C_0  3                  0.0        1.0
 3         G2-82   -1    H_0  8  C_0  3                  0.0        1.0
 3         G2-83   -1    H_0  6  C_0  4                  0.0        1.0
 3         G2-84   -1    H_0  6  C_0  4                  0.0        1.0
 3         G2-85   -1    H_0  6  C_0  4                  0.0        1.0
 3         G2-86   -1    H_0  6  C_0  4                  0.0        1.0
 3         G2-87   -1    H_0  6  C_0  4                  0.0        1.0
 3         G2-88   -1    H_0  8  C_0  4                  0.0        1.0
 3         G2-89   -1    H_0  8  C_0  4                  0.0        1.0
 3         G2-90   -1    H_0 10  C_0  4                  0.0        1.0
 3         G2-91   -1    H_0 10  C_0  4                  0.0        1.0
 3         G2-92   -1    H_0  8  C_0  5                  0.0        1.0
 3         G2-93   -1    H_0  6  C_0  6                  0.0        1.0
 4         G2-94   -1    H_0  2  F_0  2  C_0  1          0.0        1.0
 4         G2-95   -1    H_0  1  F_0  3  C_0  1          0.0        1.0
 4         G2-96   -1    H_0  2 Cl_0  2  C_0  1          0.0        1.0
 4         G2-97   -1    H_0  1 Cl_0  3  C_0  1          0.0        1.0
 4         G2-98   -1    H_0  5  C_0  1  N_0  1          0.0        1.0
 4         G2-99   -1    H_0  3  C_0  2  N_0  1          0.0        1.0
 5         G2-100  -1    H_0  3  C_0  1  N_0  1  O_0  2  0.0        1.0
 5         G2-101  -1    H_0  3  C_0  1  N_0  1  O_0  2  0.0        1.0
 4         G2-102  -1    H_0  6  C_0  1 Si_0  1          0.0        1.0
 4         G2-103  -1    H_0  2  C_0  1  O_0  2          0.0        1.0
 4         G2-104  -1    H_0  4  C_0  2  O_0  2          0.0        1.0
 5         G2-105  -1    H_0  5  C_0  2  N_0  1  O_0  1  0.0        1.0
 4         G2-106  -1    H_0  5  C_0  2  N_0  1          0.0        1.0
 3         G2-107  -1    N_0  2  C_0  2                  0.0        1.0
 4         G2-108  -1    H_0  7  C_0  2  N_0  1          0.0        1.0
 4         G2-109  -1    H_0  7  C_0  2  N_0  1          0.0        1.0
 4         G2-110  -1    H_0  2  C_0  2  O_0  1          0.0        1.0
 4         G2-111  -1    H_0  4  C_0  2  O_0  1          0.0        1.0
 4         G2-112  -1    H_0  4  C_0  2  O_0  1          0.0        1.0
 4         G2-113  -1    H_0  2  C_0  2  O_0  2          0.0        1.0
 4         G2-114  -1    H_0  6  C_0  2  O_0  1          0.0        1.0
 4         G2-115  -1    H_0  6  C_0  2  O_0  1          0.0        1.0
 4         G2-116  -1    H_0  4  C_0  2  S_0  1          0.0        1.0
 5         G2-117  -1    H_0  6  C_0  2  S_0  1  O_0  1  0.0        1.0
 4         G2-118  -1    H_0  6  C_0  2  S_0  1          0.0        1.0
 4         G2-119  -1    H_0  6  C_0  2  S_0  1          0.0        1.0
 4         G2-120  -1    H_0  3  C_0  2  F_0  1          0.0        1.0
 4         G2-121  -1    H_0  5  C_0  2 Cl_0  1          0.0        1.0
 4         G2-122  -1    H_0  3  C_0  2 Cl_0  1          0.0        1.0
 4         G2-123  -1    H_0  3  C_0  3  N_0  1          0.0        1.0
 4         G2-124  -1    H_0  6  C_0  3  O_0  1          0.0        1.0
 4         G2-125  -1    H_0  4  C_0  2  O_0  2          0.0        1.0
 5         G2-126  -1    H_0  3  C_0  2  O_0  1  F_0  1  0.0        1.0
 5         G2-127  -1    H_0  3  C_0  2  O_0  1 Cl_0  1  0.0        1.0
 4         G2-128  -1    H_0  7  C_0  3 Cl_0  1          0.0        1.0
 4         G2-129  -1    H_0  8  C_0  3  O_0  1          0.0        1.0
 4         G2-130  -1    H_0  8  C_0  3  O_0  1          0.0        1.0
 4         G2-131  -1    H_0  9  C_0  3  N_0  1          0.0        1.0
 4         G2-132  -1    H_0  4  C_0  4  O_0  1          0.0        1.0
 4         G2-133  -1    H_0  4  C_0  4  S_0  1          0.0        1.0
 4         G2-134  -1    H_0  5  C_0  4  N_0  1          0.0        1.0
 4         G2-135  -1    H_0  5  C_0  5  N_0  1          0.0        1.0
 2         G2-136  -1    H_0  2                          0.0        1.0
 3         G2-137  -1    H_0  1  S_0  1                  0.0        1.0
 3         G2-138  -1    H_0  1  C_0  2                  0.0        1.0
 3         G2-139  -1    H_0  3  C_0  2                  0.0        1.0
 4         G2-140  -1    H_0  3  C_0  2  O_0  1          0.0        1.0
 4         G2-141  -1    H_0  3  C_0  1  O_0  1          0.0        1.0
 4         G2-142  -1    H_0  3  C_0  1  O_0  1          0.0        1.0
 4         G2-143  -1    H_0  5  C_0  2  O_0  1          0.0        1.0
 4         G2-144  -1    H_0  3  C_0  1  S_0  1          0.0        1.0
 3         G2-145  -1    H_0  5  C_0  2                  0.0        1.0
 3         G2-146  -1    H_0  7  C_0  3                  0.0        1.0
 3         G2-147  -1    H_0  9  C_0  4                  0.0        1.0
 3         G2-148  -1    N_0  1  O_0  2                  0.0        1.0
 3         G2-149  -1    H_0  6  C_0  4                  0.0        1.0
 3         G2-150  -1    H_0  8  C_0  5                  0.0        1.0
 3         G2-151  -1    H_0 10  C_0  5                  0.0        1.0
 3         G2-152  -1    H_0 12  C_0  5                  0.0        1.0
 3         G2-153  -1    H_0 12  C_0  5                  0.0        1.0
 3         G2-154  -1    H_0  8  C_0  6                  0.0        1.0
 3         G2-155  -1    H_0  8  C_0  6                  0.0        1.0
 3         G2-156  -1    H_0 12  C_0  6                  0.0        1.0
 3         G2-157  -1    H_0 14  C_0  6                  0.0        1.0
 3         G2-158  -1    H_0 14  C_0  6                  0.0        1.0
 3         G2-159  -1    H_0  8  C_0  7                  0.0        1.0
 3         G2-160  -1    H_0 16  C_0  7                  0.0        1.0
 3         G2-161  -1    H_0  8  C_0  8                  0.0        1.0
 3         G2-162  -1    H_0 18  C_0  8                  0.0        1.0
 3         G2-163  -1    H_0  8  C_0 10                  0.0        1.0
 3         G2-164  -1    H_0  8  C_0 10                  0.0        1.0
 4         G2-165  -1    H_0  6  C_0  3  O_0  2          0.0        1.0
 4         G2-166  -1    H_0 10  C_0  4  O_0  1          0.0        1.0
 4         G2-167  -1    H_0  7  C_0  6  N_0  1          0.0        1.0
 4         G2-168  -1    H_0  6  C_0  6  O_0  1          0.0        1.0
 4         G2-169  -1    H_0  6  C_0  4  O_0  1          0.0        1.0
 4         G2-170  -1    H_0  8  C_0  4  O_0  1          0.0        1.0
 4         G2-171  -1    H_0  8  C_0  5  O_0  1          0.0        1.0
 4         G2-172  -1    H_0  4  C_0  6  O_0  2          0.0        1.0
 4         G2-173  -1    H_0  4  C_0  4  N_0  2          0.0        1.0
 5         G2-174  -1    H_0  6  C_0  2  O_0  2  S_0  1  0.0        1.0
 4         G2-175  -1    H_0  5  C_0  6 Cl_0  1          0.0        1.0         # Title error "C6H6Cl" in original input
 4         G2-176  -1    H_0  4  C_0  4  N_0  2          0.0        1.0
 4         G2-177  -1    H_0  4  C_0  4  N_0  2          0.0        1.0
 4         G2-178  -1    H_0  4  C_0  4  O_0  1          0.0        1.0
 4         G2-179  -1    H_0  6  C_0  4  O_0  1          0.0        1.0
 4         G2-180  -1    H_0  6  C_0  4  O_0  3          0.0        1.0
 4         G2-181  -1    H_0  6  C_0  4  S_0  1          0.0        1.0
 4         G2-182  -1    H_0  7  C_0  4  N_0  1          0.0        1.0
 4         G2-183  -1    H_0  8  C_0  4  O_0  1          0.0        1.0
 4         G2-184  -1    H_0  8  C_0  4  O_0  1          0.0        1.0
 4         G2-185  -1    H_0  8  C_0  4  O_0  2          0.0        1.0
 4         G2-186  -1    H_0  8  C_0  4  S_0  1          0.0        1.0
 4         G2-187  -1    H_0  9  C_0  4 Cl_0  1          0.0        1.0
 4         G2-188  -1    H_0  9  C_0  4 Cl_0  1          0.0        1.0
 4         G2-189  -1    H_0  9  C_0  4  N_0  1          0.0        1.0
 5         G2-190  -1    H_0  9  C_0  4  N_0  1  O_0  2  0.0        1.0
 4         G2-191  -1    H_0 10  C_0  4  O_0  1          0.0        1.0
 4         G2-192  -1    H_0 10  C_0  4  O_0  2          0.0        1.0
 4         G2-193  -1    H_0 10  C_0  4  S_0  1          0.0        1.0
 4         G2-194  -1    H_0 10  C_0  4  S_0  2          0.0        1.0
 4         G2-195  -1    H_0 11  C_0  4  N_0  1          0.0        1.0
 4         G2-196  -1    H_0 12  C_0  4 Si_0  1          0.0        1.0
 4         G2-197  -1    H_0  6  C_0  5  S_0  1          0.0        1.0         # Title inconsistency in the molecular label
 4         G2-198  -1    H_0  7  C_0  5  N_0  1          0.0        1.0
 4         G2-199  -1    H_0 10  C_0  5  O_0  1          0.0        1.0
 4         G2-200  -1    H_0 10  C_0  5  O_0  1          0.0        1.0
 4         G2-201  -1    H_0 10  C_0  5  O_0  2          0.0        1.0
 4         G2-202  -1    H_0 10  C_0  5  S_0  1          0.0        1.0
 4         G2-203  -1    H_0 11  C_0  5  N_0  1          0.0        1.0
 4         G2-204  -1    H_0 12  C_0  5  O_0  1          0.0        1.0
 4         G2-205  -1    H_0  4  C_0  6  F_0  2          0.0        1.0
 4         G2-206  -1    H_0  4  C_0  6  F_0  2          0.0        1.0
 4         G2-207  -1    H_0  5  C_0  6  F_0  1          0.0        1.0
 4         G2-208  -1    H_0 14  C_0  6  O_0  1          0.0        1.0
 3         G2-209  -1    F_0  5  P_0  1                  0.0        1.0
 3         G2-210  -1    F_0  6  S_0  1                  0.0        1.0
 2         G2-211  -1    P_0  4                          0.0        1.0
 3         G2-212  -1    O_0  3  S_0  1                  0.0        1.0
 3         G2-213  -1   Cl_0  2  S_0  1                  0.0        1.0
 4         G2-214  -1   Cl_0  3  P_0  1  O_0  1          0.0        1.0
 3         G2-215  -1   Cl_0  5  P_0  1                  0.0        1.0
 4         G2-216  -1   Cl_0  2  O_0  2  S_0  1          0.0        1.0
 3         G2-217  -1   Cl_0  3  P_0  1                  0.0        1.0
 3         G2-218  -1   Cl_0  2  S_0  2                  0.0        1.0
 3         G2-219  -1   Cl_0  2 Si_0  1                  0.0        1.0
 4         G2-220  -1    F_0  3 Cl_0  1  C_0  1          0.0        1.0
 3         G2-221  -1    F_0  6  C_0  2                  0.0        1.0
 3         G2-222  -1    F_0  3  C_0  1                  0.0        1.0
 3         G2-223  -1    H_0  5  C_0  6                  0.0        1.0




