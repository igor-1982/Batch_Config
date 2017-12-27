# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default one)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./B3LYP           2              Gaussian

# The project description
__title__ ::
"============================ G2 set ==============================="
"All the geometries are optimized at the level of B3LYP/6-31+G(d)"


# To specify machine and option keywords of Gaussian package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) NoSymm Scf=Tight

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , '.'
<PATH2> , '.'

# The molecular set to batch: 
#               238 is the total number of jobs in this batch list
__batch__ ::  238
#"Flag"         "DIR"                         "InpName"       "JobType"
# Atoms  15
 H_0            <PATH1>/EAtom                 H_0.com         energy 
 Li_0           <PATH1>/EAtom                 Li_0.com        energy 
 Be_0           <PATH1>/EAtom                 Be_0.com        energy 
 B_0            <PATH1>/EAtom                 B_0.com         energy 
 C_0            <PATH1>/EAtom                 C_0.com         energy 
 N_0            <PATH1>/EAtom                 N_0.com         energy 
 O_0            <PATH1>/EAtom                 O_0.com         energy 
 F_0            <PATH1>/EAtom                 F_0.com         energy 
 Na_0           <PATH1>/EAtom                 Na_0.com        energy 
 Mg_0           <PATH1>/EAtom                 Mg_0.com        energy 
 Al_0           <PATH1>/EAtom                 Al_0.com        energy 
 Si_0           <PATH1>/EAtom                 Si_0.com        energy 
 P_0            <PATH1>/EAtom                 P_0.com         energy 
 S_0            <PATH1>/EAtom                 S_0.com         energy 
 Cl_0           <PATH1>/EAtom                 Cl_0.com        energy 
# G2 set 223
 G2-1           <PATH2>/G2s                   G2-1.com        energy
 G2-2           <PATH2>/G2s                   G2-2.com        energy
 G2-3           <PATH2>/G2s                   G2-3.com        energy
 G2-4           <PATH2>/G2s                   G2-4.com        energy
 G2-5           <PATH2>/G2s                   G2-5.com        energy
 G2-6           <PATH2>/G2s                   G2-6.com        energy
 G2-7           <PATH2>/G2s                   G2-7.com        energy
 G2-8           <PATH2>/G2s                   G2-8.com        energy
 G2-9           <PATH2>/G2s                   G2-9.com        energy
 G2-10          <PATH2>/G2s                   G2-10.com	      energy
 G2-11          <PATH2>/G2s                   G2-11.com	      energy
 G2-12          <PATH2>/G2s                   G2-12.com	      energy
 G2-13          <PATH2>/G2s                   G2-13.com	      energy
 G2-14          <PATH2>/G2s                   G2-14.com	      energy
 G2-15          <PATH2>/G2s                   G2-15.com	      energy
 G2-16          <PATH2>/G2s                   G2-16.com	      energy
 G2-17          <PATH2>/G2s                   G2-17.com	      energy
 G2-18          <PATH2>/G2s                   G2-18.com	      energy
 G2-19          <PATH2>/G2s                   G2-19.com	      energy
 G2-20          <PATH2>/G2s                   G2-20.com	      energy
 G2-21          <PATH2>/G2s                   G2-21.com	      energy
 G2-22          <PATH2>/G2s                   G2-22.com	      energy
 G2-23          <PATH2>/G2s                   G2-23.com	      energy
 G2-24          <PATH2>/G2s                   G2-24.com	      energy
 G2-25          <PATH2>/G2s                   G2-25.com	      energy
 G2-26          <PATH2>/G2s                   G2-26.com	      energy
 G2-27          <PATH2>/G2s                   G2-27.com	      energy
 G2-28          <PATH2>/G2s                   G2-28.com	      energy
 G2-29          <PATH2>/G2s                   G2-29.com	      energy
 G2-30          <PATH2>/G2s                   G2-30.com	      energy
 G2-31          <PATH2>/G2s                   G2-31.com	      energy
 G2-32          <PATH2>/G2s                   G2-32.com	      energy
 G2-33          <PATH2>/G2s                   G2-33.com	      energy
 G2-34          <PATH2>/G2s                   G2-34.com	      energy
 G2-35          <PATH2>/G2s                   G2-35.com	      energy
 G2-36          <PATH2>/G2s                   G2-36.com	      energy
 G2-37          <PATH2>/G2s                   G2-37.com	      energy
 G2-38          <PATH2>/G2s                   G2-38.com	      energy
 G2-39          <PATH2>/G2s                   G2-39.com	      energy
 G2-40          <PATH2>/G2s                   G2-40.com	      energy
 G2-41          <PATH2>/G2s                   G2-41.com	      energy
 G2-42          <PATH2>/G2s                   G2-42.com	      energy
 G2-43          <PATH2>/G2s                   G2-43.com	      energy
 G2-44          <PATH2>/G2s                   G2-44.com	      energy
 G2-45          <PATH2>/G2s                   G2-45.com	      energy
 G2-46          <PATH2>/G2s                   G2-46.com	      energy
 G2-47          <PATH2>/G2s                   G2-47.com	      energy
 G2-48          <PATH2>/G2s                   G2-48.com	      energy
 G2-49          <PATH2>/G2s                   G2-49.com	      energy
 G2-50          <PATH2>/G2s                   G2-50.com	      energy
 G2-51          <PATH2>/G2s                   G2-51.com	      energy
 G2-52          <PATH2>/G2s                   G2-52.com	      energy
 G2-53          <PATH2>/G2s                   G2-53.com	      energy
 G2-54          <PATH2>/G2s                   G2-54.com	      energy
 G2-55          <PATH2>/G2s                   G2-55.com	      energy
 G2-56          <PATH2>/G2s                   G2-56.com	      energy
 G2-57          <PATH2>/G2s                   G2-57.com	      energy
 G2-58          <PATH2>/G2s                   G2-58.com	      energy
 G2-59          <PATH2>/G2s                   G2-59.com	      energy
 G2-60          <PATH2>/G2s                   G2-60.com	      energy
 G2-61          <PATH2>/G2s                   G2-61.com	      energy
 G2-62          <PATH2>/G2s                   G2-62.com	      energy
 G2-63          <PATH2>/G2s                   G2-63.com	      energy
 G2-64          <PATH2>/G2s                   G2-64.com	      energy
 G2-65          <PATH2>/G2s                   G2-65.com	      energy
 G2-66          <PATH2>/G2s                   G2-66.com	      energy
 G2-67          <PATH2>/G2s                   G2-67.com	      energy
 G2-68          <PATH2>/G2s                   G2-68.com	      energy
 G2-69          <PATH2>/G2s                   G2-69.com	      energy
 G2-70          <PATH2>/G2s                   G2-70.com	      energy
 G2-71          <PATH2>/G2s                   G2-71.com	      energy
 G2-72          <PATH2>/G2s                   G2-72.com	      energy
 G2-73          <PATH2>/G2s                   G2-73.com	      energy
 G2-74          <PATH2>/G2s                   G2-74.com	      energy
 G2-75          <PATH2>/G2s                   G2-75.com	      energy
 G2-76          <PATH2>/G2s                   G2-76.com	      energy
 G2-77          <PATH2>/G2s                   G2-77.com	      energy
 G2-78          <PATH2>/G2s                   G2-78.com	      energy
 G2-79          <PATH2>/G2s                   G2-79.com	      energy
 G2-80          <PATH2>/G2s                   G2-80.com	      energy
 G2-81          <PATH2>/G2s                   G2-81.com	      energy
 G2-82          <PATH2>/G2s                   G2-82.com	      energy
 G2-83          <PATH2>/G2s                   G2-83.com	      energy
 G2-84          <PATH2>/G2s                   G2-84.com	      energy
 G2-85          <PATH2>/G2s                   G2-85.com	      energy
 G2-86          <PATH2>/G2s                   G2-86.com	      energy
 G2-87          <PATH2>/G2s                   G2-87.com	      energy
 G2-88          <PATH2>/G2s                   G2-88.com	      energy
 G2-89          <PATH2>/G2s                   G2-89.com	      energy
 G2-90          <PATH2>/G2s                   G2-90.com	      energy
 G2-91          <PATH2>/G2s                   G2-91.com	      energy
 G2-92          <PATH2>/G2s                   G2-92.com	      energy
 G2-93          <PATH2>/G2s                   G2-93.com	      energy
 G2-94          <PATH2>/G2s                   G2-94.com	      energy
 G2-95          <PATH2>/G2s                   G2-95.com	      energy
 G2-96          <PATH2>/G2s                   G2-96.com	      energy
 G2-97          <PATH2>/G2s                   G2-97.com	      energy
 G2-98          <PATH2>/G2s                   G2-98.com	      energy
 G2-99          <PATH2>/G2s                   G2-99.com	      energy
 G2-100	        <PATH2>/G2s                   G2-100.com      energy
 G2-101	        <PATH2>/G2s                   G2-101.com      energy
 G2-102	        <PATH2>/G2s                   G2-102.com      energy
 G2-103	        <PATH2>/G2s                   G2-103.com      energy
 G2-104	        <PATH2>/G2s                   G2-104.com      energy
 G2-105	        <PATH2>/G2s                   G2-105.com      energy
 G2-106	        <PATH2>/G2s                   G2-106.com      energy
 G2-107	        <PATH2>/G2s                   G2-107.com      energy
 G2-108	        <PATH2>/G2s                   G2-108.com      energy
 G2-109	        <PATH2>/G2s                   G2-109.com      energy
 G2-110	        <PATH2>/G2s                   G2-110.com      energy
 G2-111	        <PATH2>/G2s                   G2-111.com      energy
 G2-112	        <PATH2>/G2s                   G2-112.com      energy
 G2-113	        <PATH2>/G2s                   G2-113.com      energy
 G2-114	        <PATH2>/G2s                   G2-114.com      energy
 G2-115	        <PATH2>/G2s                   G2-115.com      energy
 G2-116	        <PATH2>/G2s                   G2-116.com      energy
 G2-117	        <PATH2>/G2s                   G2-117.com      energy
 G2-118	        <PATH2>/G2s                   G2-118.com      energy
 G2-119	        <PATH2>/G2s                   G2-119.com      energy
 G2-120	        <PATH2>/G2s                   G2-120.com      energy
 G2-121	        <PATH2>/G2s                   G2-121.com      energy
 G2-122	        <PATH2>/G2s                   G2-122.com      energy
 G2-123	        <PATH2>/G2s                   G2-123.com      energy
 G2-124	        <PATH2>/G2s                   G2-124.com      energy
 G2-125	        <PATH2>/G2s                   G2-125.com      energy
 G2-126	        <PATH2>/G2s                   G2-126.com      energy
 G2-127	        <PATH2>/G2s                   G2-127.com      energy
 G2-128	        <PATH2>/G2s                   G2-128.com      energy
 G2-129	        <PATH2>/G2s                   G2-129.com      energy
 G2-130	        <PATH2>/G2s                   G2-130.com      energy
 G2-131	        <PATH2>/G2s                   G2-131.com      energy
 G2-132	        <PATH2>/G2s                   G2-132.com      energy
 G2-133	        <PATH2>/G2s                   G2-133.com      energy
 G2-134	        <PATH2>/G2s                   G2-134.com      energy
 G2-135	        <PATH2>/G2s                   G2-135.com      energy
 G2-136	        <PATH2>/G2s                   G2-136.com      energy
 G2-137	        <PATH2>/G2s                   G2-137.com      energy
 G2-138	        <PATH2>/G2s                   G2-138.com      energy
 G2-139	        <PATH2>/G2s                   G2-139.com      energy
 G2-140	        <PATH2>/G2s                   G2-140.com      energy
 G2-141	        <PATH2>/G2s                   G2-141.com      energy
 G2-142	        <PATH2>/G2s                   G2-142.com      energy
 G2-143	        <PATH2>/G2s                   G2-143.com      energy
 G2-144	        <PATH2>/G2s                   G2-144.com      energy
 G2-145	        <PATH2>/G2s                   G2-145.com      energy
 G2-146	        <PATH2>/G2s                   G2-146.com      energy
 G2-147	        <PATH2>/G2s                   G2-147.com      energy
 G2-148	        <PATH2>/G2s                   G2-148.com      energy
 G2-149	        <PATH2>/G2s                   G3-149.com      energy
 G2-150	        <PATH2>/G2s                   G3-150.com      energy
 G2-151	        <PATH2>/G2s                   G3-151.com      energy
 G2-152	        <PATH2>/G2s                   G3-152.com      energy
 G2-153	        <PATH2>/G2s                   G3-153.com      energy
 G2-154	        <PATH2>/G2s                   G3-154.com      energy
 G2-155	        <PATH2>/G2s                   G3-155.com      energy
 G2-156	        <PATH2>/G2s                   G3-156.com      energy
 G2-157	        <PATH2>/G2s                   G3-157.com      energy
 G2-158	        <PATH2>/G2s                   G3-158.com      energy
 G2-159	        <PATH2>/G2s                   G3-159.com      energy
 G2-160	        <PATH2>/G2s                   G3-160.com      energy
 G2-161	        <PATH2>/G2s                   G3-161.com      energy
 G2-162	        <PATH2>/G2s                   G3-162.com      energy
 G2-163	        <PATH2>/G2s                   G3-163.com      energy
 G2-164	        <PATH2>/G2s                   G3-164.com      energy
 G2-165	        <PATH2>/G2s                   G3-165.com      energy
 G2-166	        <PATH2>/G2s                   G3-166.com      energy
 G2-167	        <PATH2>/G2s                   G3-167.com      energy
 G2-168	        <PATH2>/G2s                   G3-168.com      energy
 G2-169	        <PATH2>/G2s                   G3-169.com      energy
 G2-170	        <PATH2>/G2s                   G3-170.com      energy
 G2-171	        <PATH2>/G2s                   G3-171.com      energy
 G2-172	        <PATH2>/G2s                   G3-172.com      energy
 G2-173	        <PATH2>/G2s                   G3-173.com      energy
 G2-174	        <PATH2>/G2s                   G3-174.com      energy
 G2-175	        <PATH2>/G2s                   G3-175.com      energy
 G2-176	        <PATH2>/G2s                   G3-176.com      energy
 G2-177	        <PATH2>/G2s                   G3-177.com      energy
 G2-178	        <PATH2>/G2s                   G3-178.com      energy
 G2-179	        <PATH2>/G2s                   G3-179.com      energy
 G2-180	        <PATH2>/G2s                   G3-180.com      energy
 G2-181	        <PATH2>/G2s                   G3-181.com      energy
 G2-182	        <PATH2>/G2s                   G3-182.com      energy
 G2-183	        <PATH2>/G2s                   G3-183.com      energy
 G2-184	        <PATH2>/G2s                   G3-184.com      energy
 G2-185	        <PATH2>/G2s                   G3-185.com      energy
 G2-186	        <PATH2>/G2s                   G3-186.com      energy
 G2-187	        <PATH2>/G2s                   G3-187.com      energy
 G2-188	        <PATH2>/G2s                   G3-188.com      energy
 G2-189	        <PATH2>/G2s                   G3-189.com      energy
 G2-190	        <PATH2>/G2s                   G3-190.com      energy
 G2-191	        <PATH2>/G2s                   G3-191.com      energy
 G2-192	        <PATH2>/G2s                   G3-192.com      energy
 G2-193	        <PATH2>/G2s                   G3-193.com      energy
 G2-194	        <PATH2>/G2s                   G3-194.com      energy
 G2-195	        <PATH2>/G2s                   G3-195.com      energy
 G2-196	        <PATH2>/G2s                   G3-196.com      energy
 G2-197	        <PATH2>/G2s                   G3-197.com      energy
 G2-198	        <PATH2>/G2s                   G3-198.com      energy
 G2-199	        <PATH2>/G2s                   G3-199.com      energy
 G2-200	        <PATH2>/G2s                   G3-200.com      energy
 G2-201	        <PATH2>/G2s                   G3-201.com      energy
 G2-202	        <PATH2>/G2s                   G3-202.com      energy
 G2-203	        <PATH2>/G2s                   G3-203.com      energy
 G2-204	        <PATH2>/G2s                   G3-204.com      energy
 G2-205	        <PATH2>/G2s                   G3-205.com      energy
 G2-206	        <PATH2>/G2s                   G3-206.com      energy
 G2-207	        <PATH2>/G2s                   G3-207.com      energy
 G2-208	        <PATH2>/G2s                   G3-208.com      energy
 G2-209	        <PATH2>/G2s                   G3-209.com      energy
 G2-210	        <PATH2>/G2s                   G3-210.com      energy
 G2-211	        <PATH2>/G2s                   G3-211.com      energy
 G2-212	        <PATH2>/G2s                   G3-212.com      energy
 G2-213	        <PATH2>/G2s                   G3-213.com      energy
 G2-214	        <PATH2>/G2s                   G3-214.com      energy
 G2-215	        <PATH2>/G2s                   G3-215.com      energy
 G2-216	        <PATH2>/G2s                   G3-216.com      energy
 G2-217	        <PATH2>/G2s                   G3-217.com      energy
 G2-218	        <PATH2>/G2s                   G3-218.com      energy
 G2-219	        <PATH2>/G2s                   G3-219.com      energy
 G2-220	        <PATH2>/G2s                   G3-220.com      energy
 G2-221	        <PATH2>/G2s                   G3-221.com      energy
 G2-222	        <PATH2>/G2s                   G3-222.com      energy
 G2-223	        <PATH2>/G2s                   G3-223.com      energy

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




