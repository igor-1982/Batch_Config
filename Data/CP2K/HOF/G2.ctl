# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default one)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "CP2K"     : to run jobs using CP2K package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./B3LYP           2              CP2K

# The project description
__title__ ::
"============================ G2 set ==============================="
"All the geometries are optimized at the level of B3LYP/6-311+G(d,p)"


# To specify input statement of CP2K package
__cp2k__ ::  # Following lines are input statements of CP2K-Softs
&FORCE_EVAL
  METHOD Quickstep
  &DFT
    BASIS_SET_FILE_NAME /share/apps/cp2k/tests/QS/EMSL_BASIS_SETS
    POTENTIAL_FILE_NAME /share/apps/cp2k/tests/QS/POTENTIAL
    &MGRID
      CUTOFF 250
      REL_CUTOFF 30
    &END MGRID
    &QS
      METHOD GAPW
      EPS_FILTER_MATRIX 1.0E-32
      EPS_PGF_ORB       1.0E-32
    &END QS
    &POISSON
      PERIODIC NONE
      PSOLVER  MT
      &MT
          REL_CUTOFF 1.2
      &END MT
    &END
    &SCF
      EPS_SCF 1.0E-5
      SCF_GUESS RESTART
      MAX_SCF 30
      &OT T
          PRECONDITIONER FULL_ALL
          ENERGY_GAP     0.001          # 0.001 is suitable for FULL_ALL
                                        # 0.200, which is default value, is suitable for other preconditioners.
          LINESEARCH     2PNT
          MAX_TAYLOR     5
          MINIMIZER      DIIS
          STEPSIZE       0.2            # initial stepsize used for the line search
      &END OT
      &OUTER_SCF
          EPS_SCF 1.0E-5
          MAX_SCF 20
      &END OUTER_SCF
    &END SCF
    &XC
      &XC_FUNCTIONAL
       &LYP
         SCALE_C 0.81
       &END
       &BECKE88
         SCALE_X 0.72
       &END
       &VWN
         FUNCTIONAL_TYPE VWN3                 # VWN3 is employed as in Gaussian package
         SCALE_C 0.19
       &END
       &XALPHA
         SCALE_X 0.08
       &END
      &END XC_FUNCTIONAL
      &HF
          FRACTION 0.20
          &MEMORY
              MAX_MEMORY 800                  # The memory available to one MPI process.
              EPS_STORAGE_SCALING 1.0E-1
          &END MEMORY
          &SCREENING
              EPS_SCHWARZ 1.0E-8
          &END SCREENING
      &END HF
    &END XC
  &END DFT
  &SUBSYS
    &CELL
      PERIODIC NONE
    &END CELL
    &KIND H
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND Li
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND B
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND Be
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND C
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND N
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND O
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND F
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND Na
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND Mg
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND Al
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND Si
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND P
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND S
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
    &KIND Cl
      BASIS_SET 6-311G**
      POTENTIAL ALL
    &END KIND
  &END SUBSYS
&END FORCE_EVAL

&GLOBAL
  RUN_TYPE ENERGY
  PRINT_LEVEL MEDIUM
&END GLOBAL
#=====================================================================

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , '.'
<PATH2> , '.'

# The molecular set to batch: 
#               238 is the total number of jobs in this batch list
__batch__ ::  238
#"Flag"         "DIR"                         "InpName"       "JobType"
# Atoms  15
 H_0            <PATH1>/EAtom                 H_0.inp         energy 
 Li_0           <PATH1>/EAtom                 Li_0.inp        energy 
 Be_0           <PATH1>/EAtom                 Be_0.inp        energy 
 B_0            <PATH1>/EAtom                 B_0.inp         energy 
 C_0            <PATH1>/EAtom                 C_0.inp         energy 
 N_0            <PATH1>/EAtom                 N_0.inp         energy 
 O_0            <PATH1>/EAtom                 O_0.inp         energy 
 F_0            <PATH1>/EAtom                 F_0.inp         energy 
 Na_0           <PATH1>/EAtom                 Na_0.inp        energy 
 Mg_0           <PATH1>/EAtom                 Mg_0.inp        energy 
 Al_0           <PATH1>/EAtom                 Al_0.inp        energy 
 Si_0           <PATH1>/EAtom                 Si_0.inp        energy 
 P_0            <PATH1>/EAtom                 P_0.inp         energy 
 S_0            <PATH1>/EAtom                 S_0.inp         energy 
 Cl_0           <PATH1>/EAtom                 Cl_0.inp        energy 
# G2 set 223
 G2-1           <PATH2>/G2                    G2-1.inp        energy
 G2-2           <PATH2>/G2                    G2-2.inp        energy
 G2-3           <PATH2>/G2                    G2-3.inp        energy
 G2-4           <PATH2>/G2                    G2-4.inp        energy
 G2-5           <PATH2>/G2                    G2-5.inp        energy
 G2-6           <PATH2>/G2                    G2-6.inp        energy
 G2-7           <PATH2>/G2                    G2-7.inp        energy
 G2-8           <PATH2>/G2                    G2-8.inp        energy
 G2-9           <PATH2>/G2                    G2-9.inp        energy
 G2-10          <PATH2>/G2                    G2-10.inp	      energy
 G2-11          <PATH2>/G2                    G2-11.inp	      energy
 G2-12          <PATH2>/G2                    G2-12.inp	      energy
 G2-13          <PATH2>/G2                    G2-13.inp	      energy
 G2-14          <PATH2>/G2                    G2-14.inp	      energy
 G2-15          <PATH2>/G2                    G2-15.inp	      energy
 G2-16          <PATH2>/G2                    G2-16.inp	      energy
 G2-17          <PATH2>/G2                    G2-17.inp	      energy
 G2-18          <PATH2>/G2                    G2-18.inp	      energy
 G2-19          <PATH2>/G2                    G2-19.inp	      energy
 G2-20          <PATH2>/G2                    G2-20.inp	      energy
 G2-21          <PATH2>/G2                    G2-21.inp	      energy
 G2-22          <PATH2>/G2                    G2-22.inp	      energy
 G2-23          <PATH2>/G2                    G2-23.inp	      energy
 G2-24          <PATH2>/G2                    G2-24.inp	      energy
 G2-25          <PATH2>/G2                    G2-25.inp	      energy
 G2-26          <PATH2>/G2                    G2-26.inp	      energy
 G2-27          <PATH2>/G2                    G2-27.inp	      energy
 G2-28          <PATH2>/G2                    G2-28.inp	      energy
 G2-29          <PATH2>/G2                    G2-29.inp	      energy
 G2-30          <PATH2>/G2                    G2-30.inp	      energy
 G2-31          <PATH2>/G2                    G2-31.inp	      energy
 G2-32          <PATH2>/G2                    G2-32.inp	      energy
 G2-33          <PATH2>/G2                    G2-33.inp	      energy
 G2-34          <PATH2>/G2                    G2-34.inp	      energy
 G2-35          <PATH2>/G2                    G2-35.inp	      energy
 G2-36          <PATH2>/G2                    G2-36.inp	      energy
 G2-37          <PATH2>/G2                    G2-37.inp	      energy
 G2-38          <PATH2>/G2                    G2-38.inp	      energy
 G2-39          <PATH2>/G2                    G2-39.inp	      energy
 G2-40          <PATH2>/G2                    G2-40.inp	      energy
 G2-41          <PATH2>/G2                    G2-41.inp	      energy
 G2-42          <PATH2>/G2                    G2-42.inp	      energy
 G2-43          <PATH2>/G2                    G2-43.inp	      energy
 G2-44          <PATH2>/G2                    G2-44.inp	      energy
 G2-45          <PATH2>/G2                    G2-45.inp	      energy
 G2-46          <PATH2>/G2                    G2-46.inp	      energy
 G2-47          <PATH2>/G2                    G2-47.inp	      energy
 G2-48          <PATH2>/G2                    G2-48.inp	      energy
 G2-49          <PATH2>/G2                    G2-49.inp	      energy
 G2-50          <PATH2>/G2                    G2-50.inp	      energy
 G2-51          <PATH2>/G2                    G2-51.inp	      energy
 G2-52          <PATH2>/G2                    G2-52.inp	      energy
 G2-53          <PATH2>/G2                    G2-53.inp	      energy
 G2-54          <PATH2>/G2                    G2-54.inp	      energy
 G2-55          <PATH2>/G2                    G2-55.inp	      energy
 G2-56          <PATH2>/G2                    G2-56.inp	      energy
 G2-57          <PATH2>/G2                    G2-57.inp	      energy
 G2-58          <PATH2>/G2                    G2-58.inp	      energy
 G2-59          <PATH2>/G2                    G2-59.inp	      energy
 G2-60          <PATH2>/G2                    G2-60.inp	      energy
 G2-61          <PATH2>/G2                    G2-61.inp	      energy
 G2-62          <PATH2>/G2                    G2-62.inp	      energy
 G2-63          <PATH2>/G2                    G2-63.inp	      energy
 G2-64          <PATH2>/G2                    G2-64.inp	      energy
 G2-65          <PATH2>/G2                    G2-65.inp	      energy
 G2-66          <PATH2>/G2                    G2-66.inp	      energy
 G2-67          <PATH2>/G2                    G2-67.inp	      energy
 G2-68          <PATH2>/G2                    G2-68.inp	      energy
 G2-69          <PATH2>/G2                    G2-69.inp	      energy
 G2-70          <PATH2>/G2                    G2-70.inp	      energy
 G2-71          <PATH2>/G2                    G2-71.inp	      energy
 G2-72          <PATH2>/G2                    G2-72.inp	      energy
 G2-73          <PATH2>/G2                    G2-73.inp	      energy
 G2-74          <PATH2>/G2                    G2-74.inp	      energy
 G2-75          <PATH2>/G2                    G2-75.inp	      energy
 G2-76          <PATH2>/G2                    G2-76.inp	      energy
 G2-77          <PATH2>/G2                    G2-77.inp	      energy
 G2-78          <PATH2>/G2                    G2-78.inp	      energy
 G2-79          <PATH2>/G2                    G2-79.inp	      energy
 G2-80          <PATH2>/G2                    G2-80.inp	      energy
 G2-81          <PATH2>/G2                    G2-81.inp	      energy
 G2-82          <PATH2>/G2                    G2-82.inp	      energy
 G2-83          <PATH2>/G2                    G2-83.inp	      energy
 G2-84          <PATH2>/G2                    G2-84.inp	      energy
 G2-85          <PATH2>/G2                    G2-85.inp	      energy
 G2-86          <PATH2>/G2                    G2-86.inp	      energy
 G2-87          <PATH2>/G2                    G2-87.inp	      energy
 G2-88          <PATH2>/G2                    G2-88.inp	      energy
 G2-89          <PATH2>/G2                    G2-89.inp	      energy
 G2-90          <PATH2>/G2                    G2-90.inp	      energy
 G2-91          <PATH2>/G2                    G2-91.inp	      energy
 G2-92          <PATH2>/G2                    G2-92.inp	      energy
 G2-93          <PATH2>/G2                    G2-93.inp	      energy
 G2-94          <PATH2>/G2                    G2-94.inp	      energy
 G2-95          <PATH2>/G2                    G2-95.inp	      energy
 G2-96          <PATH2>/G2                    G2-96.inp	      energy
 G2-97          <PATH2>/G2                    G2-97.inp	      energy
 G2-98          <PATH2>/G2                    G2-98.inp	      energy
 G2-99          <PATH2>/G2                    G2-99.inp	      energy
 G2-100	        <PATH2>/G2                    G2-100.inp      energy
 G2-101	        <PATH2>/G2                    G2-101.inp      energy
 G2-102	        <PATH2>/G2                    G2-102.inp      energy
 G2-103	        <PATH2>/G2                    G2-103.inp      energy
 G2-104	        <PATH2>/G2                    G2-104.inp      energy
 G2-105	        <PATH2>/G2                    G2-105.inp      energy
 G2-106	        <PATH2>/G2                    G2-106.inp      energy
 G2-107	        <PATH2>/G2                    G2-107.inp      energy
 G2-108	        <PATH2>/G2                    G2-108.inp      energy
 G2-109	        <PATH2>/G2                    G2-109.inp      energy
 G2-110	        <PATH2>/G2                    G2-110.inp      energy
 G2-111	        <PATH2>/G2                    G2-111.inp      energy
 G2-112	        <PATH2>/G2                    G2-112.inp      energy
 G2-113	        <PATH2>/G2                    G2-113.inp      energy
 G2-114	        <PATH2>/G2                    G2-114.inp      energy
 G2-115	        <PATH2>/G2                    G2-115.inp      energy
 G2-116	        <PATH2>/G2                    G2-116.inp      energy
 G2-117	        <PATH2>/G2                    G2-117.inp      energy
 G2-118	        <PATH2>/G2                    G2-118.inp      energy
 G2-119	        <PATH2>/G2                    G2-119.inp      energy
 G2-120	        <PATH2>/G2                    G2-120.inp      energy
 G2-121	        <PATH2>/G2                    G2-121.inp      energy
 G2-122	        <PATH2>/G2                    G2-122.inp      energy
 G2-123	        <PATH2>/G2                    G2-123.inp      energy
 G2-124	        <PATH2>/G2                    G2-124.inp      energy
 G2-125	        <PATH2>/G2                    G2-125.inp      energy
 G2-126	        <PATH2>/G2                    G2-126.inp      energy
 G2-127	        <PATH2>/G2                    G2-127.inp      energy
 G2-128	        <PATH2>/G2                    G2-128.inp      energy
 G2-129	        <PATH2>/G2                    G2-129.inp      energy
 G2-130	        <PATH2>/G2                    G2-130.inp      energy
 G2-131	        <PATH2>/G2                    G2-131.inp      energy
 G2-132	        <PATH2>/G2                    G2-132.inp      energy
 G2-133	        <PATH2>/G2                    G2-133.inp      energy
 G2-134	        <PATH2>/G2                    G2-134.inp      energy
 G2-135	        <PATH2>/G2                    G2-135.inp      energy
 G2-136	        <PATH2>/G2                    G2-136.inp      energy
 G2-137	        <PATH2>/G2                    G2-137.inp      energy
 G2-138	        <PATH2>/G2                    G2-138.inp      energy
 G2-139	        <PATH2>/G2                    G2-139.inp      energy
 G2-140	        <PATH2>/G2                    G2-140.inp      energy
 G2-141	        <PATH2>/G2                    G2-141.inp      energy
 G2-142	        <PATH2>/G2                    G2-142.inp      energy
 G2-143	        <PATH2>/G2                    G2-143.inp      energy
 G2-144	        <PATH2>/G2                    G2-144.inp      energy
 G2-145	        <PATH2>/G2                    G2-145.inp      energy
 G2-146	        <PATH2>/G2                    G2-146.inp      energy
 G2-147	        <PATH2>/G2                    G2-147.inp      energy
 G2-148	        <PATH2>/G2                    G2-148.inp      energy
 G2-149	        <PATH2>/G2                    G2-149.inp      energy
 G2-150	        <PATH2>/G2                    G2-150.inp      energy
 G2-151	        <PATH2>/G2                    G2-151.inp      energy
 G2-152	        <PATH2>/G2                    G2-152.inp      energy
 G2-153	        <PATH2>/G2                    G2-153.inp      energy
 G2-154	        <PATH2>/G2                    G2-154.inp      energy
 G2-155	        <PATH2>/G2                    G2-155.inp      energy
 G2-156	        <PATH2>/G2                    G2-156.inp      energy
 G2-157	        <PATH2>/G2                    G2-157.inp      energy
 G2-158	        <PATH2>/G2                    G2-158.inp      energy
 G2-159	        <PATH2>/G2                    G2-159.inp      energy
 G2-160	        <PATH2>/G2                    G2-160.inp      energy
 G2-161	        <PATH2>/G2                    G2-161.inp      energy
 G2-162	        <PATH2>/G2                    G2-162.inp      energy
 G2-163	        <PATH2>/G2                    G2-163.inp      energy
 G2-164	        <PATH2>/G2                    G2-164.inp      energy
 G2-165	        <PATH2>/G2                    G2-165.inp      energy
 G2-166	        <PATH2>/G2                    G2-166.inp      energy
 G2-167	        <PATH2>/G2                    G2-167.inp      energy
 G2-168	        <PATH2>/G2                    G2-168.inp      energy
 G2-169	        <PATH2>/G2                    G2-169.inp      energy
 G2-170	        <PATH2>/G2                    G2-170.inp      energy
 G2-171	        <PATH2>/G2                    G2-171.inp      energy
 G2-172	        <PATH2>/G2                    G2-172.inp      energy
 G2-173	        <PATH2>/G2                    G2-173.inp      energy
 G2-174	        <PATH2>/G2                    G2-174.inp      energy
 G2-175	        <PATH2>/G2                    G2-175.inp      energy
 G2-176	        <PATH2>/G2                    G2-176.inp      energy
 G2-177	        <PATH2>/G2                    G2-177.inp      energy
 G2-178	        <PATH2>/G2                    G2-178.inp      energy
 G2-179	        <PATH2>/G2                    G2-179.inp      energy
 G2-180	        <PATH2>/G2                    G2-180.inp      energy
 G2-181	        <PATH2>/G2                    G2-181.inp      energy
 G2-182	        <PATH2>/G2                    G2-182.inp      energy
 G2-183	        <PATH2>/G2                    G2-183.inp      energy
 G2-184	        <PATH2>/G2                    G2-184.inp      energy
 G2-185	        <PATH2>/G2                    G2-185.inp      energy
 G2-186	        <PATH2>/G2                    G2-186.inp      energy
 G2-187	        <PATH2>/G2                    G2-187.inp      energy
 G2-188	        <PATH2>/G2                    G2-188.inp      energy
 G2-189	        <PATH2>/G2                    G2-189.inp      energy
 G2-190	        <PATH2>/G2                    G2-190.inp      energy
 G2-191	        <PATH2>/G2                    G2-191.inp      energy
 G2-192	        <PATH2>/G2                    G2-192.inp      energy
 G2-193	        <PATH2>/G2                    G2-193.inp      energy
 G2-194	        <PATH2>/G2                    G2-194.inp      energy
 G2-195	        <PATH2>/G2                    G2-195.inp      energy
 G2-196	        <PATH2>/G2                    G2-196.inp      energy
 G2-197	        <PATH2>/G2                    G2-197.inp      energy
 G2-198	        <PATH2>/G2                    G2-198.inp      energy
 G2-199	        <PATH2>/G2                    G2-199.inp      energy
 G2-200	        <PATH2>/G2                    G2-200.inp      energy
 G2-201	        <PATH2>/G2                    G2-201.inp      energy
 G2-202	        <PATH2>/G2                    G2-202.inp      energy
 G2-203	        <PATH2>/G2                    G2-203.inp      energy
 G2-204	        <PATH2>/G2                    G2-204.inp      energy
 G2-205	        <PATH2>/G2                    G2-205.inp      energy
 G2-206	        <PATH2>/G2                    G2-206.inp      energy
 G2-207	        <PATH2>/G2                    G2-207.inp      energy
 G2-208	        <PATH2>/G2                    G2-208.inp      energy
 G2-209	        <PATH2>/G2                    G2-209.inp      energy
 G2-210	        <PATH2>/G2                    G2-210.inp      energy
 G2-211	        <PATH2>/G2                    G2-211.inp      energy
 G2-212	        <PATH2>/G2                    G2-212.inp      energy
 G2-213	        <PATH2>/G2                    G2-213.inp      energy
 G2-214	        <PATH2>/G2                    G2-214.inp      energy
 G2-215	        <PATH2>/G2                    G2-215.inp      energy
 G2-216	        <PATH2>/G2                    G2-216.inp      energy
 G2-217	        <PATH2>/G2                    G2-217.inp      energy
 G2-218	        <PATH2>/G2                    G2-218.inp      energy
 G2-219	        <PATH2>/G2                    G2-219.inp      energy
 G2-220	        <PATH2>/G2                    G2-220.inp      energy
 G2-221	        <PATH2>/G2                    G2-221.inp      energy
 G2-222	        <PATH2>/G2                    G2-222.inp      energy
 G2-223	        <PATH2>/G2                    G2-223.inp      energy

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




