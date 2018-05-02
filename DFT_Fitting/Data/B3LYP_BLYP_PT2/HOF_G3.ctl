# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./B3LYP           2		  QChem

# The project description
__title__ ::
"============================ G3 set ==============================="
"              There are 223 molecules in G3 set                    "
"All the geometries are optimized at the level of B3LYP/6-311+G(d,p)"

__initial guess__ ::
# For DDHDF
#    a1   ,    a2   ,    a3   ,    a4   ,    a5   ,    a6   ,    a7   ,    a8   ,    a9   ,   a10
  0.773066, 0.000000, 0.506260, 0.275376, 0.426352, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000

# "There are about algorithms at present:                                    "
# "   0) batch    :: just batch the results based on intital guess           "
# "   1) leastsq  :: least square fit algorithm                              "
# "   2) fmin_rms :: downhill simplex algorithm based on RMS                 "
# "   3) fmin_mad :: downhill simplex algorithm based on MAD                 "
# "   4) fmin_cobyla_rms :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on RMS                            "
# "   5) fmin_cobyla_mad :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on MAD                            "
__optimization algorithm__ :: fmin_rms

__optimization job__ :: xyg3

__optimization function__ :: 25
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    #a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 = C                           # for DDHDF
    a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 = C                           # for DDHDF
    #a2  = 1. - a1
    #a6  = 0.
    #a7  = 0.
    #a9  = 0.

    E_noXC, Ex_HF_1, Ex_B_1, Ec_LYP_1, Ec_PT22_1, Ex_HF_2, Ex_LDA_2, Ex_B_2, Ec_VWN_2, Ec_LYP_2, Ec_PT22_2 = P
    return E_noXC + a1*Ex_HF_1 + a2*Ex_B_1 + a3*Ec_LYP_1 + a4*Ec_PT22_1 +\
                    a5*Ex_HF_2 + a6*Ex_LDA_2 + a7*Ex_B_2 + a8*Ec_VWN_2 + a9*Ec_LYP_2 + a10*Ec_PT22_2

def opt_func_constrained(C,P):
    '''\
    The constrained function for optimization, where C is the parameters
    '''
    con = 0.5
    for a in C:
        if a<0 or a>1:
	    con = -1
            break
    return con


# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , '.'
<PATH2> , '.'

# The molecular set to batch: 
#               240 is the total number of jobs in this batch list
__batch__ ::  240
#"Flag"         "DIR"                         "InpName"       "JobType"
# Atoms  17
 H_0            <PATH1>/EAtom                XYG3_Comp      energy 
 He_0           <PATH1>/EAtom                XYG3_Comp      energy 
 Li_0           <PATH1>/EAtom                XYG3_Comp      energy 
 Be_0           <PATH1>/EAtom                XYG3_Comp      energy 
 B_0            <PATH1>/EAtom                XYG3_Comp      energy 
 C_0            <PATH1>/EAtom                XYG3_Comp      energy 
 N_0            <PATH1>/EAtom                XYG3_Comp      energy 
 O_0            <PATH1>/EAtom                XYG3_Comp      energy 
 F_0            <PATH1>/EAtom                XYG3_Comp      energy 
 Ne_0           <PATH1>/EAtom                XYG3_Comp      energy 
 Na_0           <PATH1>/EAtom                XYG3_Comp      energy 
 Mg_0           <PATH1>/EAtom                XYG3_Comp      energy 
 Al_0           <PATH1>/EAtom                XYG3_Comp      energy 
 Si_0           <PATH1>/EAtom                XYG3_Comp      energy 
 P_0            <PATH1>/EAtom                XYG3_Comp      energy 
 S_0            <PATH1>/EAtom                XYG3_Comp      energy 
 Cl_0           <PATH1>/EAtom                XYG3_Comp      energy 
# G2 set 223
 G2-1           <PATH2>/G2                   XYG3_Comp      energy
 G2-2           <PATH2>/G2                   XYG3_Comp      energy
 G2-3           <PATH2>/G2                   XYG3_Comp      energy
 G2-4           <PATH2>/G2                   XYG3_Comp      energy
 G2-5           <PATH2>/G2                   XYG3_Comp      energy
 G2-6           <PATH2>/G2                   XYG3_Comp      energy
 G2-7           <PATH2>/G2                   XYG3_Comp      energy
 G2-8           <PATH2>/G2                   XYG3_Comp      energy
 G2-9           <PATH2>/G2                   XYG3_Comp      energy
 G2-10          <PATH2>/G2                   XYG3_Comp      energy
 G2-11          <PATH2>/G2                   XYG3_Comp      energy
 G2-12          <PATH2>/G2                   XYG3_Comp      energy
 G2-13          <PATH2>/G2                   XYG3_Comp      energy
 G2-14          <PATH2>/G2                   XYG3_Comp      energy
 G2-15          <PATH2>/G2                   XYG3_Comp      energy
 G2-16          <PATH2>/G2                   XYG3_Comp      energy
 G2-17          <PATH2>/G2                   XYG3_Comp      energy
 G2-18          <PATH2>/G2                   XYG3_Comp      energy
 G2-19          <PATH2>/G2                   XYG3_Comp      energy
 G2-20          <PATH2>/G2                   XYG3_Comp      energy
 G2-21          <PATH2>/G2                   XYG3_Comp      energy
 G2-22          <PATH2>/G2                   XYG3_Comp      energy
 G2-23          <PATH2>/G2                   XYG3_Comp      energy
 G2-24          <PATH2>/G2                   XYG3_Comp      energy
 G2-25          <PATH2>/G2                   XYG3_Comp      energy
 G2-26          <PATH2>/G2                   XYG3_Comp      energy
 G2-27          <PATH2>/G2                   XYG3_Comp      energy
 G2-28          <PATH2>/G2                   XYG3_Comp      energy
 G2-29          <PATH2>/G2                   XYG3_Comp      energy
 G2-30          <PATH2>/G2                   XYG3_Comp      energy
 G2-31          <PATH2>/G2                   XYG3_Comp      energy
 G2-32          <PATH2>/G2                   XYG3_Comp      energy
 G2-33          <PATH2>/G2                   XYG3_Comp      energy
 G2-34          <PATH2>/G2                   XYG3_Comp      energy
 G2-35          <PATH2>/G2                   XYG3_Comp      energy
 G2-36          <PATH2>/G2                   XYG3_Comp      energy
 G2-37          <PATH2>/G2                   XYG3_Comp      energy
 G2-38          <PATH2>/G2                   XYG3_Comp      energy
 G2-39          <PATH2>/G2                   XYG3_Comp      energy
 G2-40          <PATH2>/G2                   XYG3_Comp      energy
 G2-41          <PATH2>/G2                   XYG3_Comp      energy
 G2-42          <PATH2>/G2                   XYG3_Comp      energy
 G2-43          <PATH2>/G2                   XYG3_Comp      energy
 G2-44          <PATH2>/G2                   XYG3_Comp      energy
 G2-45          <PATH2>/G2                   XYG3_Comp      energy
 G2-46          <PATH2>/G2                   XYG3_Comp      energy
 G2-47          <PATH2>/G2                   XYG3_Comp      energy
 G2-48          <PATH2>/G2                   XYG3_Comp      energy
 G2-49          <PATH2>/G2                   XYG3_Comp      energy
 G2-50          <PATH2>/G2                   XYG3_Comp      energy
 G2-51          <PATH2>/G2                   XYG3_Comp      energy
 G2-52          <PATH2>/G2                   XYG3_Comp      energy
 G2-53          <PATH2>/G2                   XYG3_Comp      energy
 G2-54          <PATH2>/G2                   XYG3_Comp      energy
 G2-55          <PATH2>/G2                   XYG3_Comp      energy
 G2-56          <PATH2>/G2                   XYG3_Comp      energy
 G2-57          <PATH2>/G2                   XYG3_Comp      energy
 G2-58          <PATH2>/G2                   XYG3_Comp      energy
 G2-59          <PATH2>/G2                   XYG3_Comp      energy
 G2-60          <PATH2>/G2                   XYG3_Comp      energy
 G2-61          <PATH2>/G2                   XYG3_Comp      energy
 G2-62          <PATH2>/G2                   XYG3_Comp      energy
 G2-63          <PATH2>/G2                   XYG3_Comp      energy
 G2-64          <PATH2>/G2                   XYG3_Comp      energy
 G2-65          <PATH2>/G2                   XYG3_Comp      energy
 G2-66          <PATH2>/G2                   XYG3_Comp      energy
 G2-67          <PATH2>/G2                   XYG3_Comp      energy
 G2-68          <PATH2>/G2                   XYG3_Comp      energy
 G2-69          <PATH2>/G2                   XYG3_Comp      energy
 G2-70          <PATH2>/G2                   XYG3_Comp      energy
 G2-71          <PATH2>/G2                   XYG3_Comp      energy
 G2-72          <PATH2>/G2                   XYG3_Comp      energy
 G2-73          <PATH2>/G2                   XYG3_Comp      energy
 G2-74          <PATH2>/G2                   XYG3_Comp      energy
 G2-75          <PATH2>/G2                   XYG3_Comp      energy
 G2-76          <PATH2>/G2                   XYG3_Comp      energy
 G2-77          <PATH2>/G2                   XYG3_Comp      energy
 G2-78          <PATH2>/G2                   XYG3_Comp      energy
 G2-79          <PATH2>/G2                   XYG3_Comp      energy
 G2-80          <PATH2>/G2                   XYG3_Comp      energy
 G2-81          <PATH2>/G2                   XYG3_Comp      energy
 G2-82          <PATH2>/G2                   XYG3_Comp      energy
 G2-83          <PATH2>/G2                   XYG3_Comp      energy
 G2-84          <PATH2>/G2                   XYG3_Comp      energy
 G2-85          <PATH2>/G2                   XYG3_Comp      energy
 G2-86          <PATH2>/G2                   XYG3_Comp      energy
 G2-87          <PATH2>/G2                   XYG3_Comp      energy
 G2-88          <PATH2>/G2                   XYG3_Comp      energy
 G2-89          <PATH2>/G2                   XYG3_Comp      energy
 G2-90          <PATH2>/G2                   XYG3_Comp      energy
 G2-91          <PATH2>/G2                   XYG3_Comp      energy
 G2-92          <PATH2>/G2                   XYG3_Comp      energy
 G2-93          <PATH2>/G2                   XYG3_Comp      energy
 G2-94          <PATH2>/G2                   XYG3_Comp      energy
 G2-95          <PATH2>/G2                   XYG3_Comp      energy
 G2-96          <PATH2>/G2                   XYG3_Comp      energy
 G2-97          <PATH2>/G2                   XYG3_Comp      energy
 G2-98          <PATH2>/G2                   XYG3_Comp      energy
 G2-99          <PATH2>/G2                   XYG3_Comp      energy
 G2-100	        <PATH2>/G2                   XYG3_Comp      energy
 G2-101	        <PATH2>/G2                   XYG3_Comp      energy
 G2-102	        <PATH2>/G2                   XYG3_Comp      energy
 G2-103	        <PATH2>/G2                   XYG3_Comp      energy
 G2-104	        <PATH2>/G2                   XYG3_Comp      energy
 G2-105	        <PATH2>/G2                   XYG3_Comp      energy
 G2-106	        <PATH2>/G2                   XYG3_Comp      energy
 G2-107	        <PATH2>/G2                   XYG3_Comp      energy
 G2-108	        <PATH2>/G2                   XYG3_Comp      energy
 G2-109	        <PATH2>/G2                   XYG3_Comp      energy
 G2-110	        <PATH2>/G2                   XYG3_Comp      energy
 G2-111	        <PATH2>/G2                   XYG3_Comp      energy
 G2-112	        <PATH2>/G2                   XYG3_Comp      energy
 G2-113	        <PATH2>/G2                   XYG3_Comp      energy
 G2-114	        <PATH2>/G2                   XYG3_Comp      energy
 G2-115	        <PATH2>/G2                   XYG3_Comp      energy
 G2-116	        <PATH2>/G2                   XYG3_Comp      energy
 G2-117	        <PATH2>/G2                   XYG3_Comp      energy
 G2-118	        <PATH2>/G2                   XYG3_Comp      energy
 G2-119	        <PATH2>/G2                   XYG3_Comp      energy
 G2-120	        <PATH2>/G2                   XYG3_Comp      energy
 G2-121	        <PATH2>/G2                   XYG3_Comp      energy
 G2-122	        <PATH2>/G2                   XYG3_Comp      energy
 G2-123	        <PATH2>/G2                   XYG3_Comp      energy
 G2-124	        <PATH2>/G2                   XYG3_Comp      energy
 G2-125	        <PATH2>/G2                   XYG3_Comp      energy
 G2-126	        <PATH2>/G2                   XYG3_Comp      energy
 G2-127	        <PATH2>/G2                   XYG3_Comp      energy
 G2-128	        <PATH2>/G2                   XYG3_Comp      energy
 G2-129	        <PATH2>/G2                   XYG3_Comp      energy
 G2-130	        <PATH2>/G2                   XYG3_Comp      energy
 G2-131	        <PATH2>/G2                   XYG3_Comp      energy
 G2-132	        <PATH2>/G2                   XYG3_Comp      energy
 G2-133	        <PATH2>/G2                   XYG3_Comp      energy
 G2-134	        <PATH2>/G2                   XYG3_Comp      energy
 G2-135	        <PATH2>/G2                   XYG3_Comp      energy
 G2-136	        <PATH2>/G2                   XYG3_Comp      energy
 G2-137	        <PATH2>/G2                   XYG3_Comp      energy
 G2-138	        <PATH2>/G2                   XYG3_Comp      energy
 G2-139	        <PATH2>/G2                   XYG3_Comp      energy
 G2-140	        <PATH2>/G2                   XYG3_Comp      energy
 G2-141	        <PATH2>/G2                   XYG3_Comp      energy
 G2-142	        <PATH2>/G2                   XYG3_Comp      energy
 G2-143	        <PATH2>/G2                   XYG3_Comp      energy
 G2-144	        <PATH2>/G2                   XYG3_Comp      energy
 G2-145	        <PATH2>/G2                   XYG3_Comp      energy
 G2-146	        <PATH2>/G2                   XYG3_Comp      energy
 G2-147	        <PATH2>/G2                   XYG3_Comp      energy
 G2-148	        <PATH2>/G2                   XYG3_Comp      energy
 G2-149	        <PATH2>/G2                   XYG3_Comp      energy
 G2-150	        <PATH2>/G2                   XYG3_Comp      energy
 G2-151	        <PATH2>/G2                   XYG3_Comp      energy
 G2-152	        <PATH2>/G2                   XYG3_Comp      energy
 G2-153	        <PATH2>/G2                   XYG3_Comp      energy
 G2-154	        <PATH2>/G2                   XYG3_Comp      energy
 G2-155	        <PATH2>/G2                   XYG3_Comp      energy
 G2-156	        <PATH2>/G2                   XYG3_Comp      energy
 G2-157	        <PATH2>/G2                   XYG3_Comp      energy
 G2-158	        <PATH2>/G2                   XYG3_Comp      energy
 G2-159	        <PATH2>/G2                   XYG3_Comp      energy
 G2-160	        <PATH2>/G2                   XYG3_Comp      energy
 G2-161	        <PATH2>/G2                   XYG3_Comp      energy
 G2-162	        <PATH2>/G2                   XYG3_Comp      energy
 G2-163	        <PATH2>/G2                   XYG3_Comp      energy
 G2-164	        <PATH2>/G2                   XYG3_Comp      energy
 G2-165	        <PATH2>/G2                   XYG3_Comp      energy
 G2-166	        <PATH2>/G2                   XYG3_Comp      energy
 G2-167	        <PATH2>/G2                   XYG3_Comp      energy
 G2-168	        <PATH2>/G2                   XYG3_Comp      energy
 G2-169	        <PATH2>/G2                   XYG3_Comp      energy
 G2-170	        <PATH2>/G2                   XYG3_Comp      energy
 G2-171	        <PATH2>/G2                   XYG3_Comp      energy
 G2-172	        <PATH2>/G2                   XYG3_Comp      energy
 G2-173	        <PATH2>/G2                   XYG3_Comp      energy
 G2-174	        <PATH2>/G2                   XYG3_Comp      energy
 G2-175	        <PATH2>/G2                   XYG3_Comp      energy
 G2-176	        <PATH2>/G2                   XYG3_Comp      energy
 G2-177	        <PATH2>/G2                   XYG3_Comp      energy
 G2-178	        <PATH2>/G2                   XYG3_Comp      energy
 G2-179	        <PATH2>/G2                   XYG3_Comp      energy
 G2-180	        <PATH2>/G2                   XYG3_Comp      energy
 G2-181	        <PATH2>/G2                   XYG3_Comp      energy
 G2-182	        <PATH2>/G2                   XYG3_Comp      energy
 G2-183	        <PATH2>/G2                   XYG3_Comp      energy
 G2-184	        <PATH2>/G2                   XYG3_Comp      energy
 G2-185	        <PATH2>/G2                   XYG3_Comp      energy
 G2-186	        <PATH2>/G2                   XYG3_Comp      energy
 G2-187	        <PATH2>/G2                   XYG3_Comp      energy
 G2-188	        <PATH2>/G2                   XYG3_Comp      energy
 G2-189	        <PATH2>/G2                   XYG3_Comp      energy
 G2-190	        <PATH2>/G2                   XYG3_Comp      energy
 G2-191	        <PATH2>/G2                   XYG3_Comp      energy
 G2-192	        <PATH2>/G2                   XYG3_Comp      energy
 G2-193	        <PATH2>/G2                   XYG3_Comp      energy
 G2-194	        <PATH2>/G2                   XYG3_Comp      energy
 G2-195	        <PATH2>/G2                   XYG3_Comp      energy
 G2-196	        <PATH2>/G2                   XYG3_Comp      energy
 G2-197	        <PATH2>/G2                   XYG3_Comp      energy
 G2-198	        <PATH2>/G2                   XYG3_Comp      energy
 G2-199	        <PATH2>/G2                   XYG3_Comp      energy
 G2-200	        <PATH2>/G2                   XYG3_Comp      energy
 G2-201	        <PATH2>/G2                   XYG3_Comp      energy
 G2-202	        <PATH2>/G2                   XYG3_Comp      energy
 G2-203	        <PATH2>/G2                   XYG3_Comp      energy
 G2-204	        <PATH2>/G2                   XYG3_Comp      energy
 G2-205	        <PATH2>/G2                   XYG3_Comp      energy
 G2-206	        <PATH2>/G2                   XYG3_Comp      energy
 G2-207	        <PATH2>/G2                   XYG3_Comp      energy
 G2-208	        <PATH2>/G2                   XYG3_Comp      energy
 G2-209	        <PATH2>/G2                   XYG3_Comp      energy
 G2-210	        <PATH2>/G2                   XYG3_Comp      energy
 G2-211	        <PATH2>/G2                   XYG3_Comp      energy
 G2-212	        <PATH2>/G2                   XYG3_Comp      energy
 G2-213	        <PATH2>/G2                   XYG3_Comp      energy
 G2-214	        <PATH2>/G2                   XYG3_Comp      energy
 G2-215	        <PATH2>/G2                   XYG3_Comp      energy
 G2-216	        <PATH2>/G2                   XYG3_Comp      energy
 G2-217	        <PATH2>/G2                   XYG3_Comp      energy
 G2-218	        <PATH2>/G2                   XYG3_Comp      energy
 G2-219	        <PATH2>/G2                   XYG3_Comp      energy
 G2-220	        <PATH2>/G2                   XYG3_Comp      energy
 G2-221	        <PATH2>/G2                   XYG3_Comp      energy
 G2-222	        <PATH2>/G2                   XYG3_Comp      energy
 G2-223	        <PATH2>/G2                   XYG3_Comp      energy

# Training set for the atomization energy
#              223 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 223  1.0
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
 3         G2-1    -1   Li_0  1  H_0  1                  0.09240338    1.0
 3         G2-2    -1   Be_0  1  H_0  1                  0.07954580    1.0
 3         G2-3    -1    C_0  1  H_0  1                  0.13357373    1.0
 3         G2-4    -1    C_0  1  H_0  2                  0.30309566    1.0
 3         G2-5    -1    C_0  1  H_0  2                  0.28802930    1.0
 3         G2-6    -1    C_0  1  H_0  3                  0.48983726    1.0
 3         G2-7    -1    C_0  1  H_0  4                  0.66934252    1.0
 3         G2-8    -1    N_0  1  H_0  1                  0.13319060    1.0
 3         G2-9    -1    N_0  1  H_0  2                  0.28959063    1.0
 3         G2-10   -1    N_0  1  H_0  3                  0.47478335    1.0
 3         G2-11   -1    O_0  1  H_0  1                  0.16932837    1.0
 3         G2-12   -1    O_0  1  H_0  2                  0.37023453    1.0
 3         G2-13   -1    F_0  1  H_0  1                  0.22415183    1.0
 3         G2-14   -1   Si_0  1  H_0  2                  0.24072682    1.0
 3         G2-15   -1   Si_0  1  H_0  2                  0.20764966    1.0
 3         G2-16   -1   Si_0  1  H_0  3                  0.35854075    1.0
 3         G2-17   -1   Si_0  1  H_0  4                  0.51240758    1.0
 3         G2-18   -1    P_0  1  H_0  2                  0.24371235    1.0
 3         G2-19   -1    P_0  1  H_0  3                  0.38552813    1.0
 3         G2-20   -1    S_0  1  H_0  2                  0.28982275    1.0
 3         G2-21   -1   Cl_0  1  H_0  1                  0.16817893    1.0
 2         G2-22   -1   Li_0  2                          0.03883527    1.0
 3         G2-23   -1   Li_0  1  F_0  1                  0.21848754    1.0
 3         G2-24   -1    C_0  2  H_0  2                  0.64609991    1.0
 3         G2-25   -1    C_0  2  H_0  4                  0.89751528    1.0
 3         G2-26   -1    C_0  2  H_0  6                  1.13451720    1.0
 3         G2-27   -1    C_0  1  N_0  1                  0.28897941    1.0
 4         G2-28   -1    H_0  1  C_0  1  N_0  1          0.49812757    1.0
 3         G2-29   -1    C_0  1  O_0  1                  0.41271778    1.0
 4         G2-30   -1    H_0  1  C_0  1  O_0  1          0.44365463    1.0
 4         G2-31   -1    H_0  2  C_0  1  O_0  1          0.59501990    1.0
 4         G2-32   -1    H_0  4  C_0  1  O_0  1          0.81621300    1.0
 2         G2-33   -1    N_0  2                          0.36414644    1.0
 3         G2-34   -1    N_0  2  H_0  4                  0.69852855    1.0
 3         G2-35   -1    N_0  1  O_0  1                  0.24302825    1.0
 2         G2-36   -1    O_0  2                          0.19096246    1.0
 3         G2-37   -1    H_0  2  O_0  2                  0.42745491    1.0
 2         G2-38   -1    F_0  2                          0.05985550    1.0
 3         G2-39   -1    C_0  1  O_0  2                  0.61930732    1.0
 2         G2-40   -1   Na_0  2                          0.02714276    1.0
 2         G2-41   -1   Si_0  2                          0.11770782    1.0
 2         G2-42   -1    P_0  2                          0.18680322    1.0
 2         G2-43   -1    S_0  2                          0.16012255    1.0
 2         G2-44   -1   Cl_0  2                          0.08960975    1.0
 3         G2-45   -1   Na_0  1 Cl_0  1                  0.15483075    1.0
 3         G2-46   -1   Si_0  1  O_0  1                  0.30534934    1.0
 3         G2-47   -1    S_0  1  C_0  1                  0.27205482    1.0
 3         G2-48   -1    S_0  1  O_0  1                  0.19798705    1.0
 3         G2-49   -1   Cl_0  1  O_0  1                  0.10110933    1.0
 3         G2-50   -1    F_0  1 Cl_0  1                  0.09578412    1.0
 3         G2-51   -1   Si_0  2  H_0  6                  0.84390798    1.0
 4         G2-52   -1    C_0  1  H_0  3 Cl_0  1          0.62713868    1.0
 4         G2-53   -1    H_0  4  C_0  1  S_0  1          0.75370993    1.0
 4         G2-54   -1    H_0  1  O_0  1 Cl_0  1          0.26022258    1.0
 3         G2-55   -1    S_0  1  O_0  2                  0.40977415    1.0
 3         G2-56   -1    F_0  3  B_0  1                  0.74694868    1.0
 3         G2-57   -1   Cl_0  3  B_0  1                  0.51017942    1.0
 3         G2-58   -1    F_0  3 Al_0  1                  0.67753946    1.0
 3         G2-59   -1   Cl_0  3 Al_0  1                  0.48365767    1.0
 3         G2-60   -1    F_0  4  C_0  1                  0.75572254    1.0
 3         G2-61   -1   Cl_0  4  C_0  1                  0.49244831    1.0
 4         G2-62   -1    C_0  1  O_0  1  S_0  1          0.52995016    1.0
 3         G2-63   -1    C_0  1  S_0  2                  0.44080292    1.0
 4         G2-64   -1    C_0  1  F_0  2  O_0  1          0.67220091    1.0
 3         G2-65   -1    F_0  4 Si_0  1                  0.90971726    1.0
 3         G2-66   -1   Cl_0  4 Si_0  1                  0.60482198    1.0
 3         G2-67   -1    N_0  2  O_0  1                  0.43060819    1.0
 4         G2-68   -1   Cl_0  1  N_0  1  O_0  1          0.30319860    1.0
 3         G2-69   -1    F_0  3  N_0  1                  0.32386570    1.0
 3         G2-70   -1    F_0  3  P_0  1                  0.57763820    1.0
 2         G2-71   -1    O_0  3                          0.23267266    1.0
 3         G2-72   -1    F_0  2  O_0  1                  0.14627886    1.0
 3         G2-73   -1    F_0  3 Cl_0  1                  0.19614786    1.0
 3         G2-74   -1    F_0  4  C_0  2                  0.92736989    1.0
 3         G2-75   -1   Cl_0  4  C_0  2                  0.73777659    1.0
 4         G2-76   -1    F_0  3  C_0  2  N_0  1          1.01663576    1.0
 3         G2-77   -1    H_0  4  C_0  3                  1.12296063    1.0
 3         G2-78   -1    H_0  4  C_0  3                  1.12009989    1.0
 3         G2-79   -1    H_0  4  C_0  3                  1.08751170    1.0
 3         G2-80   -1    H_0  6  C_0  3                  1.37075983    1.0
 3         G2-81   -1    H_0  6  C_0  3                  1.35900783    1.0
 3         G2-82   -1    H_0  8  C_0  3                  1.60333895    1.0
 3         G2-83   -1    H_0  6  C_0  4                  1.61273955    1.0
 3         G2-84   -1    H_0  6  C_0  4                  1.59938800    1.0
 3         G2-85   -1    H_0  6  C_0  4                  1.57787558    1.0
 3         G2-86   -1    H_0  6  C_0  4                  1.57216644    1.0
 3         G2-87   -1    H_0  6  C_0  4                  1.59551550    1.0
 3         G2-88   -1    H_0  8  C_0  4                  1.82982714    1.0
 3         G2-89   -1    H_0  8  C_0  4                  1.84528080    1.0
 3         G2-90   -1    H_0 10  C_0  4                  2.07228855    1.0
 3         G2-91   -1    H_0 10  C_0  4                  2.07506255    1.0
 3         G2-92   -1    H_0  8  C_0  5                  2.04522760    1.0
 3         G2-93   -1    H_0  6  C_0  6                  2.17883457    1.0
 4         G2-94   -1    H_0  2  F_0  2  C_0  1          0.69382557    1.0
 4         G2-95   -1    H_0  1  F_0  3  C_0  1          0.72703017    1.0
 4         G2-96   -1    H_0  2 Cl_0  2  C_0  1          0.58647134    1.0
 4         G2-97   -1    H_0  1 Cl_0  3  C_0  1          0.54267582    1.0
 4         G2-98   -1    H_0  5  C_0  1  N_0  1          0.92752728    1.0
 4         G2-99   -1    H_0  3  C_0  2  N_0  1          0.98082788    1.0
 5         G2-100  -1    H_0  3  C_0  1  N_0  1  O_0  2  0.95668597    1.0
 5         G2-101  -1    H_0  3  C_0  1  N_0  1  O_0  2  0.95224012    1.0
 4         G2-102  -1    H_0  6  C_0  1 Si_0  1          0.99878182    1.0
 4         G2-103  -1    H_0  2  C_0  1  O_0  2          0.79727935    1.0
 4         G2-104  -1    H_0  4  C_0  2  O_0  2          1.24926768    1.0
 5         G2-105  -1    H_0  5  C_0  2  N_0  1  O_0  1  1.38294487    1.0
 4         G2-106  -1    H_0  5  C_0  2  N_0  1          1.14678879    1.0
 3         G2-107  -1    N_0  2  C_0  2                  0.80017573    1.0
 4         G2-108  -1    H_0  7  C_0  2  N_0  1          1.38625285    1.0
 4         G2-109  -1    H_0  7  C_0  2  N_0  1          1.39759140    1.0
 4         G2-110  -1    H_0  2  C_0  2  O_0  1          0.84767645    1.0
 4         G2-111  -1    H_0  4  C_0  2  O_0  1          1.03590961    1.0
 4         G2-112  -1    H_0  4  C_0  2  O_0  1          1.07796296    1.0
 4         G2-113  -1    H_0  2  C_0  2  O_0  2          1.00831471    1.0
 4         G2-114  -1    H_0  6  C_0  2  O_0  1          1.29014835    1.0
 4         G2-115  -1    H_0  6  C_0  2  O_0  1          1.27038731    1.0
 4         G2-116  -1    H_0  4  C_0  2  S_0  1          0.99267223    1.0
 5         G2-117  -1    H_0  6  C_0  2  S_0  1  O_0  1  1.36095891    1.0
 4         G2-118  -1    H_0  6  C_0  2  S_0  1          1.22376667    1.0
 4         G2-119  -1    H_0  6  C_0  2  S_0  1          1.22123469    1.0
 4         G2-120  -1    H_0  3  C_0  2  F_0  1          0.91027531    1.0
 4         G2-121  -1    H_0  5  C_0  2 Cl_0  1          1.09974880    1.0
 4         G2-122  -1    H_0  3  C_0  2 Cl_0  1          0.85740225    1.0
 4         G2-123  -1    H_0  3  C_0  3  N_0  1          1.21691900    1.0
 4         G2-124  -1    H_0  6  C_0  3  O_0  1          1.55830048    1.0
 4         G2-125  -1    H_0  4  C_0  2  O_0  2          1.27840337    1.0
 5         G2-126  -1    H_0  3  C_0  2  O_0  1  F_0  1  1.12360527    1.0
 5         G2-127  -1    H_0  3  C_0  2  O_0  1 Cl_0  1  1.06167252    1.0
 4         G2-128  -1    H_0  7  C_0  3 Cl_0  1          1.56832046    1.0
 4         G2-129  -1    H_0  8  C_0  3  O_0  1          1.76486891    1.0
 4         G2-130  -1    H_0  8  C_0  3  O_0  1          1.74353938    1.0
 4         G2-131  -1    H_0  9  C_0  3  N_0  1          1.84838186    1.0
 4         G2-132  -1    H_0  4  C_0  4  O_0  1          1.58274796    1.0
 4         G2-133  -1    H_0  4  C_0  4  S_0  1          1.53284857    1.0
 4         G2-134  -1    H_0  5  C_0  4  N_0  1          1.70722514    1.0
 4         G2-135  -1    H_0  5  C_0  5  N_0  1          1.97171610    1.0
 2         G2-136  -1    H_0  2                          0.17457832    1.0
 3         G2-137  -1    H_0  1  S_0  1                  0.13755977    1.0
 3         G2-138  -1    H_0  1  C_0  2                  0.42340140    1.0
 3         G2-139  -1    H_0  3  C_0  2                  0.70850615    1.0
 4         G2-140  -1    H_0  3  C_0  2  O_0  1          0.92585280    1.0
 4         G2-141  -1    H_0  3  C_0  1  O_0  1          0.65179374    1.0
 4         G2-142  -1    H_0  3  C_0  1  O_0  1          0.63743824    1.0
 4         G2-143  -1    H_0  5  C_0  2  O_0  1          1.11054006    1.0
 4         G2-144  -1    H_0  3  C_0  1  S_0  1          0.60601894    1.0
 3         G2-145  -1    H_0  5  C_0  2                  0.96116402    1.0
 3         G2-146  -1    H_0  7  C_0  3                  1.43397653    1.0
 3         G2-147  -1    H_0  9  C_0  4                  1.90955842    1.0
 3         G2-148  -1    N_0  1  O_0  2                  0.36159926    1.0
 3         G2-149  -1    H_0  6  C_0  4                  1.59205297    1.0
 3         G2-150  -1    H_0  8  C_0  5                  2.08673592    1.0
 3         G2-151  -1    H_0 10  C_0  5                  2.33204498    1.0
 3         G2-152  -1    H_0 12  C_0  5                  2.54149091    1.0
 3         G2-153  -1    H_0 12  C_0  5                  2.54863836    1.0
 3         G2-154  -1    H_0  8  C_0  6                  2.35336098    1.0
 3         G2-155  -1    H_0  8  C_0  6                  2.35386838    1.0
 3         G2-156  -1    H_0 12  C_0  6                  2.81109456    1.0
 3         G2-157  -1    H_0 14  C_0  6                  3.01012095    1.0
 3         G2-158  -1    H_0 14  C_0  6                  3.01159012    1.0
 3         G2-159  -1    H_0  8  C_0  7                  2.65153542    1.0
 3         G2-160  -1    H_0 16  C_0  7                  3.47918491    1.0
 3         G2-161  -1    H_0  8  C_0  8                  2.83349490    1.0
 3         G2-162  -1    H_0 18  C_0  8                  3.94812829    1.0
 3         G2-163  -1    H_0  8  C_0 10                  3.44440377    1.0
 3         G2-164  -1    H_0  8  C_0 10                  3.39028835    1.0
 4         G2-165  -1    H_0  6  C_0  3  O_0  2          1.73111684    1.0
 4         G2-166  -1    H_0 10  C_0  4  O_0  1          2.24002915    1.0
 4         G2-167  -1    H_0  7  C_0  6  N_0  1          2.45321599    1.0
 4         G2-168  -1    H_0  6  C_0  6  O_0  1          2.34409561    1.0
 4         G2-169  -1    H_0  6  C_0  4  O_0  1          1.75693771    1.0
 4         G2-170  -1    H_0  8  C_0  4  O_0  1          2.00952428    1.0
 4         G2-171  -1    H_0  8  C_0  5  O_0  1          2.28800836    1.0
 4         G2-172  -1    H_0  4  C_0  6  O_0  2          2.26630874    1.0
 4         G2-173  -1    H_0  4  C_0  4  N_0  2          1.76570905    1.0
 5         G2-174  -1    H_0  6  C_0  2  O_0  2  S_0  1  1.54362509    1.0
 4         G2-175  -1    H_0  5  C_0  6 Cl_0  1          2.14409885    1.0     # Title error "C6H6Cl" in original input
 4         G2-176  -1    H_0  4  C_0  4  N_0  2          1.75905227    1.0
 4         G2-177  -1    H_0  4  C_0  4  N_0  2          1.76530161    1.0
 4         G2-178  -1    H_0  4  C_0  4  O_0  1          1.54201931    1.0
 4         G2-179  -1    H_0  6  C_0  4  O_0  1          1.79040441    1.0
 4         G2-180  -1    H_0  6  C_0  4  O_0  3          2.16492882    1.0
 4         G2-181  -1    H_0  6  C_0  4  S_0  1          1.72815283    1.0
 4         G2-182  -1    H_0  7  C_0  4  N_0  1          1.92257336    1.0
 4         G2-183  -1    H_0  8  C_0  4  O_0  1          2.02767063    1.0
 4         G2-184  -1    H_0  8  C_0  4  O_0  1          2.01890919    1.0
 4         G2-185  -1    H_0  8  C_0  4  O_0  2          2.15750503    1.0
 4         G2-186  -1    H_0  8  C_0  4  S_0  1          1.96007688    1.0
 4         G2-187  -1    H_0  9  C_0  4 Cl_0  1          2.04701055    1.0
 4         G2-188  -1    H_0  9  C_0  4 Cl_0  1          2.03818723    1.0
 4         G2-189  -1    H_0  9  C_0  4  N_0  1          2.11980158    1.0
 5         G2-190  -1    H_0  9  C_0  4  N_0  1  O_0  2  2.37335355    1.0
 4         G2-191  -1    H_0 10  C_0  4  O_0  1          2.21812928    1.0
 4         G2-192  -1    H_0 10  C_0  4  O_0  2          2.36795405    1.0
 4         G2-193  -1    H_0 10  C_0  4  S_0  1          2.16849056    1.0
 4         G2-194  -1    H_0 10  C_0  4  S_0  2          2.26338171    1.0
 4         G2-195  -1    H_0 11  C_0  4  N_0  1          2.34602949    1.0
 4         G2-196  -1    H_0 12  C_0  4 Si_0  1          2.46140361    1.0
 4         G2-197  -1    H_0  6  C_0  5  S_0  1          2.00548689    1.0    # Title inconsistency in the molecular label
 4         G2-198  -1    H_0  7  C_0  5  N_0  1          2.16982749    1.0
 4         G2-199  -1    H_0 10  C_0  5  O_0  1          2.48581633    1.0
 4         G2-200  -1    H_0 10  C_0  5  O_0  1          2.49595703    1.0
 4         G2-201  -1    H_0 10  C_0  5  O_0  2          2.67892842    1.0
 4         G2-202  -1    H_0 10  C_0  5  S_0  1          2.43220660    1.0
 4         G2-203  -1    H_0 11  C_0  5  N_0  1          2.59763095    1.0
 4         G2-204  -1    H_0 12  C_0  5  O_0  1          2.68976010    1.0
 4         G2-205  -1    H_0  4  C_0  6  F_0  2          2.20636400    1.0
 4         G2-206  -1    H_0  4  C_0  6  F_0  2          2.20534490    1.0
 4         G2-207  -1    H_0  5  C_0  6  F_0  1          2.19356444    1.0
 4         G2-208  -1    H_0 14  C_0  6  O_0  1          3.16441770    1.0
 3         G2-209  -1    F_0  5  P_0  1                  0.88358498    1.0
 3         G2-210  -1    F_0  6  S_0  1                  0.75582233    1.0
 2         G2-211  -1    P_0  4                          0.46156839    1.0
 3         G2-212  -1    O_0  3  S_0  1                  0.54484235    1.0
 3         G2-213  -1   Cl_0  2  S_0  1                  0.20110480    1.0
 4         G2-214  -1   Cl_0  3  P_0  1  O_0  1          0.56689332    1.0
 3         G2-215  -1   Cl_0  5  P_0  1                  0.48488074    1.0
 4         G2-216  -1   Cl_0  2  O_0  2  S_0  1          0.52391177    1.0
 3         G2-217  -1   Cl_0  3  P_0  1                  0.36621229    1.0
 3         G2-218  -1   Cl_0  2  S_0  2                  0.30603388    1.0
 3         G2-219  -1   Cl_0  2 Si_0  1                  0.32457634    1.0
 4         G2-220  -1    F_0  3 Cl_0  1  C_0  1          0.68421344    1.0
 3         G2-221  -1    F_0  6  C_0  2                  1.25171994    1.0
 3         G2-222  -1    F_0  3  C_0  1                  0.54527011    1.0
 3         G2-223  -1    H_0  5  C_0  6                  1.98722459    1.0

__xyg3 components__ ::  240
#           E_noXC       Ex_K       Ex_Becke     Ec_LYP     PT2_2ND_TZ     E_K         Ex_LDA      Ex_Becke     Ec_VWN      Ec_LYP   PT2_2ND_TZ
   H_0   -0.19023547    -0.30863053  -0.30694307  0.00000000  0.00000000  -0.30925638  -0.26560754  -0.30728525  -0.03986945  0.00000000  0.00000000
   He_0  -1.83868023    -1.01888300  -1.02134834  -0.04377087  -0.04017039  -1.02035674  -0.88042122  -1.02205462  -0.15000509  -0.04378062  -0.03731257
   Li_0  -5.65066622    -1.78060826  -1.77619379  -0.05388724  -0.01683655  -1.78065767  -1.53861170  -1.77588364  -0.20630448  -0.05384238  -0.01597278
   Be_0  -11.90161367   -2.66942478  -2.66281354  -0.09514713  -0.08986367  -2.66925722  -2.31662728  -2.66211379  -0.29865864  -0.09512581  -0.07128122
   B_0   -20.76340054   -3.76352895  -3.76049510  -0.12590755  -0.11213013  -3.76518213  -3.29748272  -3.76079681  -0.38253316  -0.12588525  -0.09409640
   C_0   -32.62161385   -5.06139132  -5.06190803  -0.15914848  -0.13764604  -5.06530125  -4.48351792  -5.06367947  -0.47028686  -0.15915004  -0.12100319
   N_0   -47.80714519   -6.58183504  -6.58299509  -0.19235825  -0.16658348  -6.58810724  -5.89167100  -6.58659748  -0.56018519  -0.19239219  -0.15234049
   O_0   -66.61555928   -8.17956749  -8.20175630  -0.25742487  -0.23322012  -8.18840153  -7.36929467  -8.20684928  -0.68762019  -0.25746977  -0.21424545
   F_0   -89.38983573   -9.99379855  -10.03449722  -0.32116638  -0.30823585  -10.00556900  -9.06820806  -10.04148998  -0.81664846  -0.32128149  -0.28495423
   Ne_0  -116.45978994  -12.04533601  -12.09946665  -0.38290764  -0.38990371  -12.06001029  -11.00542552  -12.10858843  -0.94565342  -0.38310732  -0.36291600
   Na_0  -147.84526780  -13.98442720  -14.01419062  -0.40959123  -0.20670034  -13.99419250  -12.77641627  -14.01966543  -1.02472190  -0.40951093  -0.19275870
   Mg_0  -183.62238886  -15.97097693  -15.99450138  -0.46089859  -0.23785455  -15.97784045  -14.61034605  -15.99756049  -1.13134066  -0.46083987  -0.21720888
   Al_0  -223.79425279  -18.06469537  -18.08059718  -0.49534217  -0.26976489  -18.07216385  -16.54919397  -18.08386230  -1.22397243  -0.49525145  -0.24741555
   Si_0  -268.56215720  -20.27334065  -20.28296362  -0.53127882  -0.30508172  -20.28180534  -18.60595594  -20.28680595  -1.31968700  -0.53118004  -0.28036843
    P_0  -318.07886136  -22.61514540  -22.61559384  -0.56755203  -0.34050822  -22.62314590  -20.79272856  -22.61930720  -1.41703827  -0.56751010  -0.31476684
    S_0  -372.48607119  -24.99841703  -24.99818868  -0.63018152  -0.38790559  -25.00770907  -23.01944995  -25.00252477  -1.54311784  -0.63002300  -0.35771778
   Cl_0  -431.97345606  -27.48120616  -27.47678485  -0.69163070  -0.36305894  -27.49563461  -25.35131277  -27.48667991  -1.66934338  -0.69152269  -0.33108035
   G2-1  -5.84669654    -2.13393142  -2.13269819  -0.08856621  -0.06495109  -2.13778552  -1.85100162  -2.13473787  -0.29109581  -0.08873603  -0.05647805
   G2-2  -12.07415689   -3.07217225  -3.06346788  -0.10879573  -0.07416536  -3.07484238  -2.67616704  -3.06443283  -0.35901241  -0.10863174  -0.06572012
   G2-3  -32.86525513   -5.40622148  -5.41533928  -0.19709641  -0.19862988  -5.41015628  -4.80091180  -5.41602771  -0.55436975  -0.19706243  -0.17185730
   G2-4  -33.07800512   -5.84679604  -5.84850409  -0.21448037  -0.20903365  -5.85189956  -5.21627906  -5.85003151  -0.61420759  -0.21427374  -0.18855320
   G2-5  -33.10846773   -5.77354724  -5.78492816  -0.23279631  -0.26453457  -5.77765543  -5.14425377  -5.78498494  -0.63506512  -0.23284395  -0.22359126
   G2-6  -33.35792260   -6.20800382  -6.21061011  -0.25762059  -0.26765415  -6.21213630  -5.54812023  -6.21061764  -0.70133792  -0.25762111  -0.24178546
   G2-7  -33.62483285   -6.57664497  -6.58037077  -0.29460579  -0.32698837  -6.58035200  -5.89378126  -6.57923754  -0.78222958  -0.29467630  -0.29540988
   G2-8  -48.05776235   -6.90982340  -6.92948422  -0.23675024  -0.23699954  -6.91616989  -6.20212471  -6.93183013  -0.64958938  -0.23669097  -0.21396525
   G2-9  -48.30816827   -7.26476808  -7.29518530  -0.27865563  -0.31165687  -7.27068365  -6.54323842  -7.29626292  -0.73555399  -0.27871959  -0.28056614
  G2-10  -48.55701684   -7.64846226  -7.68399828  -0.31766462  -0.38657949  -7.65434397  -6.91637840  -7.68446961  -0.81768186  -0.31786590  -0.34839118
  G2-11  -66.87404696   -8.52792846  -8.57400173  -0.30011753  -0.32753790  -8.53700860  -7.72032902  -8.57796204  -0.77456877  -0.30024015  -0.29712941
  G2-12  -67.12940705   -8.91155634  -8.97310929  -0.33998303  -0.42531895  -8.92043720  -8.10710904  -8.97603390  -0.85749075  -0.34023755  -0.38420377
  G2-13  -89.65913680   -10.37697536  -10.44731802  -0.36186471  -0.42778491  -10.38949429  -9.47198824  -10.45366100  -0.90057448  -0.36212999  -0.39043631
  G2-14  -269.04137722  -20.96497532  -20.97505569  -0.59803140  -0.39149346  -20.97461964  -19.22669837  -20.97763691  -1.47782908  -0.59794590  -0.35403151
  G2-15  -268.99808457  -20.99818635  -21.00166651  -0.57962356  -0.35216179  -21.00920281  -19.25847906  -21.00561938  -1.45761462  -0.57905155  -0.32292119
  G2-16  -269.25520991  -21.35814248  -21.35500943  -0.61635423  -0.38795555  -21.36941578  -19.57423731  -21.35847917  -1.53993758  -0.61604734  -0.35580044
  G2-17  -269.50783201  -21.72590574  -21.71507617  -0.64993683  -0.42435675  -21.73769624  -19.89852381  -21.71824815  -1.61950338  -0.64984522  -0.38892796
  G2-18  -318.57804216  -23.28270822  -23.28912535  -0.64271420  -0.42895360  -23.29206981  -21.40117150  -23.29148209  -1.58083375  -0.64254295  -0.39217024
  G2-19  -318.82721742  -23.63414858  -23.63995039  -0.67639827  -0.47760248  -23.64379719  -21.72412872  -23.64156189  -1.65876992  -0.67635822  -0.43542056
  G2-20  -373.00504769  -25.68364476  -25.69254836  -0.70209690  -0.50154820  -25.69254950  -23.66515483  -25.69446220  -1.70209314  -0.70212189  -0.45838027
  G2-21  -432.24452899  -27.83355588  -27.83583397  -0.72728001  -0.43021663  -27.84715821  -25.69161887  -27.84422607  -1.74792878  -0.72733007  -0.39112265
  G2-22  -11.30949408   -3.55598795  -3.54942163  -0.13413973  -0.09276505  -3.55842508  -3.07951737  -3.55032032  -0.44041895  -0.13412007  -0.07463681
  G2-23  -95.03500940   -11.91132748  -11.99190092  -0.41674514  -0.48143012  -11.93321368  -10.81906944  -12.00445607  -1.06968668  -0.41715512  -0.43173914
  G2-24  -65.85204333   -10.98231798  -11.03809720  -0.44553210  -0.58761184  -10.98391299  -9.88119031  -11.03199329  -1.15199289  -0.44536080  -0.51392984
  G2-25  -66.31093504   -11.73420147  -11.76793392  -0.49893710  -0.59236371  -11.73768361  -10.54826380  -11.76261552  -1.29304097  -0.49884699  -0.52767808
  G2-26  -66.75431502   -12.48367112  -12.49344994  -0.55227660  -0.61929259  -12.48917656  -11.21305032  -12.48953444  -1.43414277  -0.55230917  -0.55905876
  G2-27  -80.58277564   -11.60874148  -11.72747937  -0.42905851  -0.70966304  -11.61765943  -10.50544964  -11.72410597  -1.10452525  -0.42798692  -0.59059121
  G2-28  -80.84703436   -12.04481510  -12.13277718  -0.46520829  -0.65506326  -12.04724403  -10.88271849  -12.12658395  -1.18663352  -0.46506660  -0.57097785
  G2-29  -99.45582007   -13.30282274  -13.40415754  -0.48527001  -0.65845677  -13.30959556  -12.05347276  -13.40155913  -1.22430388  -0.48520349  -0.57809462
  G2-30  -99.60655287   -13.65895962  -13.76676003  -0.50856469  -0.67820667  -13.66831789  -12.38783342  -13.76517528  -1.28875407  -0.50841580  -0.59623443
  G2-31  -99.83401413   -14.05198613  -14.14951327  -0.54092254  -0.70081215  -14.06100047  -12.74011659  -14.14726614  -1.36720053  -0.54093391  -0.62132731
  G2-32  -100.25404790  -14.80824888  -14.87932326  -0.59617146  -0.71380437  -14.81866664  -13.41388647  -14.87855742  -1.50848574  -0.59630013  -0.64364906
  G2-33  -95.86181782   -13.10567618  -13.21611645  -0.48429136  -0.70012427  -13.10683182  -11.87359169  -13.20874994  -1.22007075  -0.48411479  -0.61196104
  G2-34  -96.59856041   -14.60181532  -14.68173530  -0.59688260  -0.73658007  -14.61049578  -13.23494931  -14.67944814  -1.50367519  -0.59708588  -0.66260679
  G2-35  -114.57435884  -14.69622099  -14.83279528  -0.52819571  -0.74000574  -14.70342208  -13.36065019  -14.82917374  -1.32249609  -0.52802978  -0.64837834
  G2-36  -133.33949349  -16.30544970  -16.46793541  -0.57217928  -0.78640573  -16.31358996  -14.86592865  -16.46416045  -1.42411435  -0.57186601  -0.69286729
  G2-37  -133.76318404  -17.03888361  -17.19505805  -0.63615244  -0.84673371  -17.05136785  -15.53821153  -17.19459387  -1.57813535  -0.63637385  -0.75492306
  G2-38  -178.82150068  -19.88710775  -20.08177789  -0.67541314  -0.88799775  -19.90304056  -18.19416402  -20.08449439  -1.65960187  -0.67551641  -0.78966966
  G2-39  -166.08788579  -21.57703403  -21.76881292  -0.79209064  -1.09891122  -21.59043759  -19.64614129  -21.76334296  -1.95634302  -0.79187244  -0.96789136
  G2-40  -295.70311293  -27.95206274  -28.01972491  -0.84366295  -0.46934767  -27.97342375  -25.55029343  -28.03095447  -2.07288096  -0.84356580  -0.42683724
  G2-41  -537.20535560  -40.55703235  -40.60275720  -1.09926330  -0.71787228  -40.51855752  -37.24415462  -40.57122578  -2.67345679  -1.09954654  -0.70290106
  G2-42  -636.28349019  -45.16509486  -45.22842884  -1.21591966  -0.95866253  -45.17597707  -41.61889883  -45.22680537  -2.91189079  -1.21554587  -0.84551837
  G2-43  -745.05623729  -49.99108503  -50.04434951  -1.30745727  -0.95840534  -50.00504873  -46.13297951  -50.04488046  -3.12696614  -1.30694036  -0.86294985
  G2-44  -863.98208210  -54.95514753  -54.98595090  -1.41359674  -0.85012971  -54.98058058  -50.77537661  -54.99975668  -3.36382146  -1.41343252  -0.76559203
  G2-45  -579.81486493  -41.57547699  -41.60520258  -1.13301401  -0.64342898  -41.60679935  -38.26494409  -41.62511920  -2.73117050  -1.13317613  -0.58668488
  G2-46  -335.30311709  -28.49522076  -28.61040957  -0.85272601  -0.85307754  -28.51265035  -26.14972844  -28.61408107  -2.07003721  -0.85283835  -0.74561654
  G2-47  -405.26266793  -30.05945016  -30.12923416  -0.84942964  -0.80950024  -30.06733467  -27.61955483  -30.12571359  -2.07036049  -0.84913327  -0.70352653
  G2-48  -439.18744437  -33.17228278  -33.28511052  -0.94063138  -0.89438097  -33.18624526  -30.52761939  -33.28525113  -2.27711120  -0.94026600  -0.79340982
  G2-49  -498.63629157  -35.60160186  -35.71293631  -0.99268263  -0.84641719  -35.62797384  -32.80373782  -35.72158041  -2.39420292  -0.99212900  -0.73809938
  G2-50  -521.39611565  -37.44838912  -37.55875786  -1.04600576  -0.86522912  -37.47198369  -34.51235212  -37.56895042  -2.51342501  -1.04601686  -0.77513835
  G2-51  -538.54401058  -42.77458492  -42.76068741  -1.26310831  -0.82801069  -42.79658369  -39.22457776  -42.76602745  -3.10883286  -1.26285253  -0.75743932
  G2-52  -465.37585671  -33.73250047  -33.74625692  -0.98312688  -0.72771472  -33.74811042  -31.00152582  -33.75160059  -2.39932540  -0.98306781  -0.65783967
  G2-53  -406.13356482  -31.58806596  -31.60699522  -0.95907587  -0.80135146  -31.59892028  -28.98250109  -31.60600511  -2.35414744  -0.95902442  -0.72754742
  G2-54  -498.87244833  -35.99835542  -36.09360199  -1.02518699  -0.85814292  -36.01777558  -33.16008519  -36.10032674  -2.47121237  -1.02521146  -0.76721242
  G2-55  -505.84431643  -41.38748134  -41.60644564  -1.25535093  -1.43641153  -41.40605675  -38.07473675  -41.60161643  -3.01875524  -1.25516094  -1.25789563
  G2-56  -289.10892932  -34.13766885  -34.33962708  -1.19388382  -1.37092827  -34.17527060  -31.12139501  -34.35327055  -2.92357311  -1.19388235  -1.24595490
 G2-57   -1316.81624395 -86.46439483  -86.47764058  -2.29074942  -1.44281484  -86.50705879  -79.76331887  -86.49929561  -5.46692660  -2.29025985  -1.30226106
  G2-58  -492.06378335  -48.43342053  -48.65760570  -1.55205266  -1.54756005  -48.48586078  -44.33643032  -48.68248951  -3.76504450  -1.55222277  -1.40571690
 G2-59   -1519.80079111 -100.81100631  -100.81235004  -2.65031414  -1.54195139  -100.86187995  -92.99952867  -100.84131936  -6.30750364  -2.64989597  -1.40372933
  G2-60  -390.34719750  -45.37023756  -45.67246244  -1.59236388  -1.87915102  -45.41016057  -41.44146564  -45.67907095  -3.85754036  -1.59216841  -1.70624496
 G2-61   -1760.64113690 -115.14910976  -115.21618660  -3.05436039  -2.01675995  -115.19948764  -106.31327862  -115.23667454  -7.25082169  -3.05370258  -1.81413581
  G2-62  -471.94276236  -38.35002048  -38.49799413  -1.15634476  -1.20770603  -38.36278741  -35.21643172  -38.49209743  -2.80239754  -1.15595810  -1.06782981
  G2-63  -777.78227861  -55.13416325  -55.23898563  -1.52153797  -1.32659087  -55.14607301  -50.79989577  -55.23278421  -3.64959067  -1.52099331  -1.17605020
  G2-64  -278.20574669  -33.45913591  -33.71407492  -1.19153844  -1.49192663  -33.48684362  -30.53656768  -33.71488862  -2.90646762  -1.19137078  -1.33894597
  G2-65  -626.28675605  -60.74633227  -61.01466257  -1.95476142  -1.98599883  -60.80064862  -55.63799604  -61.03547967  -4.71136996  -1.95460932  -1.81139647
 G2-66   -1996.57434586 -130.53272681  -130.53534730  -3.41855933  -2.04677802  -130.59281135  -120.50566795  -130.56652419  -8.10257064  -3.41782021  -1.86023038
  G2-67  -162.44001102  -21.27191921  -21.51013765  -0.78848953  -1.22645049  -21.27766217  -19.39666116  -21.49673811  -1.94715012  -0.78815667  -1.06261791
  G2-68  -546.60713947  -42.09552692  -42.31116617  -1.24388781  -1.34034805  -42.11544657  -38.74348819  -42.30690971  -3.01047114  -1.24347896  -1.14625938
  G2-69  -316.11198895  -36.47235180  -36.81871459  -1.27881833  -1.68180770  -36.50695193  -33.36937848  -36.81868337  -3.11168589  -1.27868271  -1.49100384
  G2-70  -586.40118684  -52.79153263  -53.03818976  -1.65173095  -1.68701121  -52.83628302  -48.45134985  -53.05211091  -3.97223244  -1.65164314  -1.52667236
  G2-71  -199.98509020  -24.31384843  -24.65928068  -0.87909893  -1.55134804  -24.32290260  -22.27340084  -24.64545586  -2.15672906  -0.87883879  -1.30093765
  G2-72  -245.48314275  -28.00399746  -28.30953373  -0.97314772  -1.34820136  -28.02987572  -25.63626617  -28.30894652  -2.38054853  -0.97310304  -1.18081403
  G2-73  -700.18240236  -57.34796209  -57.71436150  -1.74164219  -1.91647538  -57.39716699  -52.81836641  -57.72444536  -4.18418465  -1.74154400  -1.67989424
  G2-74  -422.99470828  -50.49998568  -50.85912043  -1.79648261  -2.17100942  -50.54355263  -46.09577991  -50.86324940  -4.36944407  -1.79622465  -1.95793363
 G2-75   -1793.30152373 -120.34885518  -120.44543897  -3.26330535  -2.28956490  -120.39975627  -111.01870530  -120.46253843  -7.76612266  -3.26250480  -2.05545650
  G2-76  -381.52475323  -47.01974756  -47.35316759  -1.69542401  -2.13746782  -47.05413027  -42.85001157  -47.35085708  -4.14424447  -1.69500214  -1.91110971
  G2-77  -98.98564393   -16.89631723  -16.95992350  -0.70421528  -0.87876653  -16.90053694  -15.21208091  -16.95144275  -1.80480886  -0.70399507  -0.77783218
  G2-78  -98.99367233   -16.88426003  -16.95692765  -0.70459340  -0.86769814  -16.88861307  -15.20956676  -16.94776702  -1.80459446  -0.70433517  -0.76899219
  G2-79  -98.92724698   -16.91231198  -16.97453218  -0.70953187  -0.87136982  -16.91605534  -15.24044492  -16.96551128  -1.80850299  -0.70934185  -0.77582229
  G2-80  -99.44593856   -17.64091075  -17.68196504  -0.75769535  -0.88968737  -17.64677850  -15.87210625  -17.67411836  -1.94530836  -0.75756309  -0.79585144
  G2-81  -99.39085654   -17.68207519  -17.71293780  -0.76438379  -0.88440538  -17.68756147  -15.91930588  -17.70525599  -1.95057392  -0.76429982  -0.79666058
  G2-82  -99.88757304   -18.38839061  -18.40374099  -0.81086738  -0.91644946  -18.39579767  -16.53243030  -18.39706198  -2.08606686  -0.81085876  -0.82691627
  G2-83  -132.14013337  -22.79970939  -22.87550950  -0.96311757  -1.16599486  -22.80568504  -20.53429118  -22.86300227  -2.45672966  -0.96280529  -1.03653726
  G2-84  -132.11704930  -22.81082673  -22.88202928  -0.96286501  -1.17157608  -22.81737167  -20.54275205  -22.87094592  -2.45769880  -0.96258780  -1.04287853
  G2-85  -132.07567126  -22.82973111  -22.89822233  -0.96918890  -1.16007233  -22.83602559  -20.57462651  -22.88665360  -2.46145484  -0.96893791  -1.03760693
  G2-86  -132.03159684  -22.85840881  -22.91584684  -0.97578004  -1.16490284  -22.86383728  -20.60969663  -22.90402993  -2.46557865  -0.97558069  -1.04638552
  G2-87  -132.08011784  -22.83481311  -22.89764652  -0.97160839  -1.16520746  -22.84171286  -20.57902653  -22.88632367  -2.46260914  -0.97137072  -1.04143726
  G2-88  -132.52445610  -23.58598458  -23.62110196  -1.02475769  -1.18496207  -23.59405186  -21.23955762  -23.61079498  -2.60343891  -1.02463786  -1.06699005
  G2-89  -132.58115077  -23.54782663  -23.59465646  -1.01722498  -1.19079450  -23.55550356  -21.19611526  -23.58383512  -2.59771203  -1.01704597  -1.06737752
  G2-90  -133.02038929  -24.29350582  -24.31434174  -1.06953831  -1.21437326  -24.30269380  -21.85214745  -24.30478844  -2.73806661  -1.06948254  -1.09545692
  G2-91  -133.02365987  -24.29091145  -24.31112285  -1.07042487  -1.21906094  -24.30003650  -21.85155460  -24.30145706  -2.73807921  -1.07037097  -1.09951065
  G2-92  -165.15895162  -28.77842771  -28.84113706  -1.23446591  -1.45274074  -28.78647240  -25.94294287  -28.82713563  -3.11865318  -1.23422346  -1.30702284
  G2-93  -197.49643287  -33.23771255  -33.34894606  -1.39064696  -1.69725174  -33.23972101  -29.97853373  -33.32721366  -3.49190234  -1.39005178  -1.51538355
  G2-94  -211.97808445  -25.95906603  -26.11921445  -0.94086012  -1.10614520  -25.98464583  -23.65428653  -26.12526029  -2.31937746  -0.94094944  -1.00171681
  G2-95  -301.16756366  -35.65877179  -35.89274563  -1.26636263  -1.49722726  -35.69338772  -32.54524421  -35.90036116  -3.08825269  -1.26634675  -1.35676017
  G2-96  -897.13090107  -60.87845693  -60.90752504  -1.67278906  -1.14480495  -60.90633879  -56.10833407  -60.91884019  -4.01640882  -1.67256132  -1.03304948
 G2-97   -1328.88644014 -88.01719209  -88.06457534  -2.36331428  -1.57528543  -88.05687658  -81.21300532  -88.08097497  -5.63359753  -2.36288127  -1.41896111
  G2-98  -81.67930479   -13.55126024  -13.59441558  -0.57482860  -0.67724271  -13.55870314  -12.23076218  -13.59156798  -1.46934467  -0.57493999  -0.61043716
  G2-99  -113.98213133  -17.96360234  -18.05852119  -0.72391724  -0.94254033  -17.96876771  -16.21717824  -18.04998437  -1.83961483  -0.72371281  -0.83194137
 G2-100  -214.54743889  -29.15472403  -29.41061595  -1.12327677  -1.56512502  -29.16805208  -26.54838752  -29.39798505  -2.77780008  -1.12304360  -1.37728672
 G2-101  -214.58906952  -29.10539863  -29.36718486  -1.11983665  -1.57549186  -29.12330714  -26.49736963  -29.35545180  -2.77430236  -1.11956488  -1.37606426
 G2-102  -302.64310812  -27.64315719  -27.63906884  -0.90840009  -0.72384417  -27.65695942  -25.22971039  -27.63995466  -2.27256672  -0.90829388  -0.65882374
 G2-103  -166.49662846  -22.29734352  -22.46640986  -0.84614844  -1.10649039  -22.31531972  -20.28875855  -22.46459393  -2.09502402  -0.84615752  -0.98309923
 G2-104  -199.62450651  -28.19457982  -28.37312855  -1.10362212  -1.40418173  -28.21383298  -25.59837163  -28.36734426  -2.74642447  -1.10347928  -1.25018078
 G2-105  -181.04384135  -26.96464073  -27.10968358  -1.08462330  -1.35617144  -26.98081422  -24.44342467  -27.10263016  -2.70918273  -1.08455624  -1.21044076
 G2-106  -114.33075219  -18.72922660  -18.79897021  -0.78503918  -0.95024429  -18.73608143  -16.91688154  -18.79127414  -1.98449699  -0.78498635  -0.85311672
 G2-107  -161.20100799  -23.41337597  -23.61215629  -0.89401903  -1.31267885  -23.41718882  -21.20357608  -23.59698626  -2.24399679  -0.89352935  -1.13704606
 G2-108  -114.80858900  -19.45018845  -19.50111396  -0.83313632  -0.97424954  -19.45978667  -17.54557924  -19.49526134  -2.12090489  -0.83317939  -0.87772916
 G2-109  -114.81704954  -19.45339767  -19.50305085  -0.83341289  -0.97549565  -19.46320138  -17.54901162  -19.49767557  -2.12109365  -0.83348137  -0.87886920
 G2-110  -132.53124669  -19.21771529  -19.35330402  -0.74812458  -0.98418998  -19.22720085  -17.41962016  -19.34643545  -1.87982853  -0.74791493  -0.86900654
 G2-111  -132.91509816  -19.97517961  -20.07800687  -0.80529284  -0.99469845  -19.98550141  -18.09103286  -20.07227611  -2.02298448  -0.80524240  -0.89116058
 G2-112  -132.97669339  -19.95982917  -20.06561222  -0.79991768  -0.99638187  -19.97229090  -18.06712777  -20.06137192  -2.01940151  -0.79988065  -0.88753743
 G2-113  -199.19675076  -27.42879330  -27.63089529  -1.04592627  -1.37903860  -27.44487369  -24.90744221  -27.62396810  -2.60384648  -1.04577321  -1.21959488
 G2-114  -133.39200421  -20.71291377  -20.78985377  -0.85486120  -1.01061955  -20.72557301  -18.73392783  -20.78654984  -2.16032749  -0.85494004  -0.91100198
 G2-115  -133.38615181  -20.70127640  -20.78187001  -0.85371191  -1.00951811  -20.71404178  -18.72187052  -20.77788775  -2.15942532  -0.85374608  -0.90900030
 G2-116  -438.78906952  -36.77980497  -36.82557556  -1.17055183  -1.08647013  -36.79033073  -33.68378467  -36.82024372  -2.87047147  -1.17034643  -0.97992395
 G2-117  -505.87698470  -45.70561480  -45.82809964  -1.52125386  -1.56579214  -45.72873595  -41.83283212  -45.82365032  -3.73444280  -1.52109698  -1.40005608
 G2-118  -439.26819992  -37.49153200  -37.51673039  -1.21762479  -1.10113008  -37.50443811  -34.30134856  -37.51302587  -3.00606253  -1.21752265  -0.99744966
 G2-119  -439.26513798  -37.49156368  -37.52014460  -1.21701595  -1.10585113  -37.50457112  -34.30161559  -37.51634015  -3.00629433  -1.21688885  -1.00077808
 G2-120  -155.48833623  -21.42220480  -21.53908006  -0.82298500  -0.98940278  -21.43766777  -19.43374895  -21.53775394  -2.06207891  -0.82293080  -0.88653708
 G2-121  -498.51341004  -39.63589962  -39.65632028  -1.24166871  -1.02675344  -39.65369950  -36.32076125  -39.65895920  -3.05118162  -1.24155821  -0.92701169
 G2-122  -498.06465039  -38.88854563  -38.93741338  -1.18914852  -1.00787766  -38.90489703  -35.66478443  -38.93863966  -2.91094518  -1.18891247  -0.90204959
 G2-123  -146.67160403  -23.11799215  -23.24906178  -0.92863334  -1.22164130  -23.12339280  -20.87466032  -23.23605353  -2.35075509  -0.92825264  -1.07437892
 G2-124  -166.11459867  -25.87155499  -25.98246195  -1.05934973  -1.29259612  -25.88552086  -23.39434951  -25.97497830  -2.67191964  -1.05923734  -1.15507192
 G2-125  -199.63256018  -28.21387401  -28.38607934  -1.10545077  -1.39571426  -28.23290809  -25.61789060  -28.38088207  -2.74763329  -1.10537965  -1.24555963
 G2-126  -222.17189683  -29.66165439  -29.84849193  -1.12519833  -1.40023895  -29.68385968  -26.96480734  -29.84599051  -2.78917279  -1.12507364  -1.25197166
 G2-127  -564.75474949  -47.10432724  -47.23305272  -1.48999967  -1.43236697  -47.12817576  -43.17983581  -47.23290821  -3.63675398  -1.48971275  -1.27599787
 G2-128  -531.64573657  -45.54183554  -45.56761488  -1.50028658  -1.32512530  -45.56132454  -41.64082889  -45.56729406  -3.70321993  -1.50012772  -1.19590322
 G2-129  -166.53178465  -26.61514850  -26.69760083  -1.11436338  -1.31270971  -26.62984769  -24.05343285  -26.69146488  -2.81226452  -1.11438911  -1.18281045
 G2-130  -166.52343896  -26.60677308  -26.69305554  -1.11244005  -1.30716380  -26.62155954  -24.04244905  -26.68636661  -2.81135065  -1.11241856  -1.17711483
 G2-131  -147.94214419  -25.34636439  -25.40459349  -1.09272994  -1.27900872  -25.35821705  -22.86087772  -25.39571684  -2.77256642  -1.09271872  -1.15142996
 G2-132  -198.30279810  -30.35717584  -30.51234809  -1.22674965  -1.54541098  -30.36466419  -27.48677541  -30.49672681  -3.05195824  -1.22635398  -1.37851138
 G2-133  -504.16764705  -47.15718195  -47.26027194  -1.59146731  -1.65408779  -47.16642411  -43.07672417  -47.24572674  -3.90018276  -1.59090621  -1.47931122
 G2-134  -179.72068282  -29.12363103  -29.24503561  -1.20742481  -1.50109054  -29.12710676  -26.32578381  -29.22732283  -3.01436993  -1.20703635  -1.34204704
 G2-135  -212.43656160  -34.29242654  -34.44128195  -1.41134865  -1.76325764  -34.29603442  -30.98206634  -34.41956903  -3.52629426  -1.41077094  -1.57137191
 G2-136  -0.47572256    -0.65544939  -0.65530822  -0.03816400  -0.04614246  -0.65647041  -0.56617948  -0.65557951  -0.13018973  -0.03820601  -0.04140059
 G2-137  -372.74594381  -25.33380460  -25.33956313  -0.66733659  -0.44238740  -25.34313841  -23.33486056  -25.34274956  -1.62395437  -0.66721982  -0.40571774
 G2-138  -65.54601462   -10.60392983  -10.66407070  -0.40484764  -0.54081612  -10.60848611  -9.53504033  -10.66050404  -1.06638864  -0.40404048  -0.46650378
 G2-139  -66.04270445   -11.34964380  -11.39069572  -0.46294518  -0.54842631  -11.35671921  -10.20053332  -11.38819945  -1.21192918  -0.46241924  -0.48390935
 G2-140  -132.74606022  -19.56887762  -19.68569984  -0.76712343  -0.97193128  -19.58317730  -17.71658027  -19.68323712  -1.94153755  -0.76689677  -0.86049575
 G2-141  -100.00150455  -14.42921891  -14.50798808  -0.56301122  -0.67329440  -14.44269192  -13.07413770  -14.50976844  -1.42995605  -0.56285262  -0.60422260
 G2-142  -100.01717498  -14.40567805  -14.48177363  -0.56042257  -0.65276166  -14.42492524  -13.03854636  -14.48485525  -1.42819024  -0.55995878  -0.57875295
 G2-143  -133.15625113  -20.30526322  -20.39112237  -0.81921764  -0.95563723  -20.32913365  -18.35836987  -20.39258975  -2.08017904  -0.81861273  -0.84859345
 G2-144  -405.88175657  -31.23116880  -31.25181106  -0.92577688  -0.75013057  -31.24484049  -28.65364071  -31.25330342  -2.27690094  -0.92544874  -0.68011062
 G2-145  -66.49259908   -12.11038702  -12.12388168  -0.51712090  -0.56645600  -12.11838134  -10.87107862  -12.12225076  -1.35456385  -0.51692093  -0.50991547
 G2-146  -99.62921558   -18.01329044  -18.03595867  -0.77668892  -0.86703704  -18.02421966  -16.19371914  -18.03208500  -2.00743048  -0.77636201  -0.78011305
 G2-147  -132.76647631  -23.91615385  -23.94662648  -1.03648496  -1.17073972  -23.92979239  -21.51634950  -23.94031108  -2.66002420  -1.03606127  -1.05311326
 G2-148  -181.20749590  -22.85512615  -23.12136791  -0.83286514  -1.28124560  -22.86669390  -20.87665439  -23.11174099  -2.04999465  -0.83251738  -1.10712721
 G2-149  -132.12649681  -22.79189106  -22.87173592  -0.96291179  -1.16626842  -22.79834787  -20.53248003  -22.85986547  -2.45682194  -0.96260946  -1.03803182
 G2-150  -165.27238313  -28.70817391  -28.78869301  -1.22344260  -1.46919398  -28.71578519  -25.86041093  -28.77308630  -3.10952157  -1.22307458  -1.30996426
 G2-151  -165.66423211  -29.51556976  -29.54959106  -1.28704069  -1.48245186  -29.52519248  -26.58291610  -29.53629888  -3.25776115  -1.28687083  -1.33598944
 G2-152  -166.15313156  -30.19862459  -30.22497695  -1.32819475  -1.51241154  -30.20957249  -27.17182526  -30.21253058  -3.39006932  -1.32809111  -1.36409605
 G2-153  -166.15885107  -30.19407800  -30.21816846  -1.33101803  -1.52689657  -30.20453791  -27.17250858  -30.20513777  -3.39043492  -1.33091419  -1.37666460
 G2-154  -197.91362204  -33.94153702  -34.03397553  -1.44154660  -1.73482071  -33.94950137  -30.60216577  -34.01489211  -3.63000144  -1.44108233  -1.54904154
 G2-155  -197.91096890  -33.94657531  -34.03569297  -1.44149388  -1.72493680  -33.95472434  -30.60392479  -34.01680010  -3.63018073  -1.44101565  -1.54135400
 G2-156  -198.79580760  -35.43098773  -35.46667731  -1.54832362  -1.78215048  -35.44222673  -31.91388708  -35.45010184  -3.91099278  -1.54809098  -1.60654432
 G2-157  -199.28584329  -36.10377904  -36.13563311  -1.58686416  -1.81052352  -36.11648954  -32.49155805  -36.12029576  -4.04207827  -1.58671229  -1.63279918
 G2-158  -199.28405972  -36.10207730  -36.13303805  -1.58913073  -1.82046586  -36.11449987  -32.49410454  -36.11726436  -4.04276327  -1.58895284  -1.64134101
 G2-159  -230.63036966  -39.14313383  -39.26123419  -1.64990518  -2.00093833  -39.14724756  -35.30180079  -39.23675503  -4.14429664  -1.64926220  -1.78892818
 G2-160  -232.41819472  -42.00930761  -42.04660696  -1.84555551  -2.10862302  -42.02377496  -37.81162413  -42.02837571  -4.69410663  -1.84535535  -1.90149971
 G2-161  -263.29437655  -44.26060937  -44.42051591  -1.85385023  -2.29373738  -44.26949168  -39.93053881  -44.39291911  -4.65366181  -1.85303997  -2.03674046
 G2-162  -265.55120633  -47.91414577  -47.95699073  -2.10420047  -2.40676760  -47.93036993  -43.13105392  -47.93586266  -5.34609212  -2.10395191  -2.17022615
 G2-163  -328.67636447  -54.72476146  -54.91827256  -2.28262814  -2.82258922  -54.72657283  -49.39882105  -54.88006095  -5.69026812  -2.28149931  -2.51782620
 G2-164  -328.65915032  -54.67045232  -54.89065423  -2.28002050  -2.87624144  -54.67250680  -49.36712937  -54.85132420  -5.68775314  -2.27885122  -2.55506681
 G2-165  -232.75963538  -34.11109381  -34.29244844  -1.36306863  -1.69400339  -34.13135222  -30.92754253  -34.28324145  -3.39906144  -1.36284471  -1.51321267
 G2-166  -199.66963356  -32.51882482  -32.60520265  -1.37468507  -1.61857480  -32.53463588  -29.37404873  -32.59549605  -3.46449253  -1.37464490  -1.45823916
 G2-167  -245.55418669  -40.21937254  -40.37420027  -1.67395728  -2.06332232  -40.22599606  -36.33493314  -40.35047029  -4.18050477  -1.67335163  -1.84305997
 G2-168  -264.13460995  -41.47056367  -41.65355777  -1.69491826  -2.09930709  -41.48046344  -37.51258143  -41.63207049  -4.21917213  -1.69433953  -1.87531996
 G2-169  -198.77330831  -31.02038485  -31.17062792  -1.26605891  -1.56448962  -31.03404431  -28.05544586  -31.15793159  -3.18270584  -1.26572659  -1.39287535
 G2-170  -199.17063306  -31.83185870  -31.93115131  -1.32965953  -1.57438287  -31.84677686  -28.77481183  -31.92042478  -3.33120465  -1.32950918  -1.41670213
 G2-171  -231.89082852  -37.00287698  -37.13264120  -1.53540740  -1.85763928  -37.01901701  -33.44866112  -37.11842970  -3.84384382  -1.53511598  -1.66322233
 G2-172  -330.37216804  -48.90474063  -49.19724308  -1.93691402  -2.51027731  -48.92390462  -44.32116935  -49.17367795  -4.80154319  -1.93616479  -2.21778663
 G2-173  -227.37833912  -35.35014294  -35.53408166  -1.43204115  -1.82502721  -35.35558517  -31.98624099  -35.51255240  -3.56067700  -1.43147016  -1.62388315
 G2-174  -572.46255674  -54.00463834  -54.19176333  -1.82976691  -1.98360720  -54.03279148  -49.42581142  -54.18469079  -4.46685665  -1.82946617  -1.77388738
 G2-175  -629.25014269  -60.39103209  -60.51696445  -2.08125513  -2.12043561  -60.40550003  -55.09435405  -60.50139495  -5.10990509  -2.08049946  -1.89644373
 G2-176  -227.47405642  -35.24924624  -35.44242096  -1.41133957  -1.86330583  -35.25732670  -31.85383524  -35.42325457  -3.54848689  -1.41078938  -1.64249500
 G2-177  -227.37789444  -35.34213041  -35.52984555  -1.43177355  -1.83102541  -35.34640429  -31.98094835  -35.50758316  -3.56033100  -1.43120495  -1.62877640
 G2-178  -198.34414844  -30.27350043  -30.44652999  -1.21003829  -1.57121277  -30.28589785  -27.38568570  -30.43325301  -3.04214725  -1.20962218  -1.38628970
 G2-179  -198.80308432  -31.02740769  -31.17534461  -1.26421984  -1.57186326  -31.04212282  -28.05461068  -31.16353131  -3.18334892  -1.26393805  -1.39734653
 G2-180  -332.12780671  -47.50178348  -47.78754032  -1.87010646  -2.37890098  -47.52932233  -43.11386250  -47.77297809  -4.63697116  -1.86965288  -2.11760060
 G2-181  -504.60772048  -47.87463583  -47.94918044  -1.64039305  -1.65280753  -47.88857476  -43.69731868  -47.93754270  -4.03766682  -1.63997866  -1.48445429
 G2-182  -180.25011218  -29.77249565  -29.87837258  -1.24094123  -1.54096160  -29.78117519  -26.85415425  -29.86399228  -3.14342758  -1.24063372  -1.37097689
 G2-183  -199.24508021  -31.77941694  -31.89533573  -1.31849750  -1.59094011  -31.79494890  -28.71681180  -31.88473479  -3.32427026  -1.31831023  -1.42397589
 G2-184  -199.24289582  -31.76979429  -31.88652964  -1.31758816  -1.59693688  -31.78559980  -28.70667492  -31.87622707  -3.32353013  -1.31743547  -1.42840102
 G2-185  -265.80972205  -40.05235727  -40.22165023  -1.63342473  -1.96987061  -40.07515770  -36.29057280  -40.21072135  -4.05718791  -1.63323060  -1.77006612
 G2-186  -505.05020796  -48.61848092  -48.66600812  -1.69386140  -1.67880389  -48.63385758  -44.35363510  -48.65549072  -4.17816612  -1.69356619  -1.51528570
 G2-187  -564.79037748  -51.43992143  -51.47046327  -1.76144396  -1.63959710  -51.46071690  -46.95955833  -51.46644297  -4.35540183  -1.76121165  -1.47845243
 G2-188  -564.77863502  -51.44681215  -51.47816629  -1.75890263  -1.62342536  -51.46805441  -46.96027934  -51.47493330  -4.35521299  -1.75869573  -1.46472855
 G2-189  -180.59178192  -30.57706495  -30.64651907  -1.30919525  -1.54025072  -30.58917584  -27.59570834  -30.63422170  -3.29243869  -1.30907284  -1.38644144
 G2-190  -313.94981632  -46.87286836  -47.14408205  -1.90114702  -2.46855494  -46.89152295  -42.51275817  -47.12246275  -4.73450109  -1.90072670  -2.19087936
 G2-191  -199.66049735  -32.51244727  -32.60434651  -1.37115453  -1.60487835  -32.52918030  -29.36303277  -32.59490300  -3.46328134  -1.37107651  -1.44529517
 G2-192  -266.29559115  -40.73804264  -40.89893722  -1.67526118  -2.00656610  -40.76061922  -36.88209187  -40.88767888  -4.18986007  -1.67506521  -1.80441621
 G2-193  -505.54333931  -49.29329836  -49.32880539  -1.73771649  -1.71721115  -49.30926889  -44.93917118  -49.31851367  -4.31034512  -1.73750177  -1.55162897
 G2-194  -878.05497146  -74.30470040  -74.37160453  -2.39928978  -2.20763047  -74.32979889  -68.03240588  -74.36183010  -5.88293791  -2.39881838  -1.99296168
 G2-195  -181.09137033  -31.25998322  -31.31788599  -1.35353452  -1.58481788  -31.27256124  -28.18912714  -31.30593954  -3.42539537  -1.35348813  -1.42769480
 G2-196  -402.05137639  -45.39230477  -45.40656337  -1.68546714  -1.63279957  -45.41189100  -41.22354975  -45.40041314  -4.23186900  -1.68528539  -1.47759784
 G2-197  -537.30213939  -53.06350920  -53.17329808  -1.85021026  -1.95584404  -53.07480200  -48.39915609  -53.15588356  -4.55248144  -1.84959335  -1.75117337
 G2-198  -212.85066858  -35.02480171  -35.15409935  -1.46569544  -1.80299783  -35.02991407  -31.64207361  -35.13313564  -3.66615967  -1.46522172  -1.61383091
 G2-199  -232.30302999  -37.74253510  -37.84495954  -1.59095176  -1.87576231  -37.75960329  -34.10325060  -37.83127081  -3.98415296  -1.59074386  -1.68817532
 G2-200  -232.37536622  -37.68751917  -37.80831249  -1.57763581  -1.88929669  -37.70452424  -34.03923000  -37.79453310  -3.97662728  -1.57737158  -1.69292253
 G2-201  -299.03350843  -45.92085427  -46.11324127  -1.88155242  -2.29638223  -45.94465380  -41.56919404  -46.09800520  -4.70320903  -1.88120849  -2.05533978
 G2-202  -538.17884528  -54.52973948  -54.58060672  -1.95471546  -1.97908459  -54.54711715  -49.68161974  -54.56707371  -4.83118768  -1.95435407  -1.78609129
 G2-203  -213.72215081  -36.49095446  -36.56322551  -1.57045300  -1.84126955  -36.50456819  -32.92603779  -36.54747467  -3.94567283  -1.57025287  -1.65788469
 G2-204  -232.79175568  -38.41574308  -38.51096004  -1.63351234  -1.92056973  -38.43285306  -34.68635652  -38.49710548  -4.11635671  -1.63332870  -1.72906563
 G2-205  -375.84872872  -52.61725337  -52.89297090  -2.03941608  -2.48893239  -52.64175805  -47.75167005  -52.87804017  -5.03021397  -2.03880465  -2.23177182
 G2-206  -375.84688578  -52.61782952  -52.89384485  -2.03934830  -2.48896729  -52.64214893  -47.75208776  -52.87890085  -5.03025602  -2.03874656  -2.23174368
 G2-207  -286.67291096  -42.92731073  -43.12104816  -1.71503287  -2.09367534  -42.94078384  -38.86526199  -43.10290033  -4.26108547  -1.71443759  -1.87393224
 G2-208  -265.93283093  -44.31943390  -44.42152849  -1.89094893  -2.21454312  -44.33924839  -40.00394387  -44.40557404  -4.76774720  -1.89071430  -1.99371962
 G2-209  -765.12493158  -73.04169027  -73.39629246  -2.36094833  -2.49522431  -73.10042166  -66.97630181  -73.41143591  -5.65777177  -2.36058215  -2.26998812
 G2-210  -908.81722217  -85.31485672  -85.79885522  -2.76362326  -3.05922247  -85.37483549  -78.32389506  -85.80438957  -6.60180044  -2.76304226  -2.77093073
 G2-211  -1272.49265321 -90.46497674  -90.56434895  -2.46376819  -1.89526149  -90.48914529  -83.41602344  -90.56152468  -5.84691886  -2.46298044  -1.70168428
 G2-212  -572.41794423  -49.65153118  -49.94455220  -1.56096289  -1.84487754  -49.67636932  -45.63770647  -49.93615763  -3.74917002  -1.56058545  -1.62363130
 G2-213  -1236.51290829 -79.95977227  -80.02088189  -2.07857707  -1.35276899  -79.99501707  -73.87099369  -80.03477215  -4.93656989  -2.07818733  -1.21630588
 G2-214  -1680.72166604 -113.44316701  -113.56092208  -3.05504964  -2.16460802  -113.49739245  -104.70027443  -113.58024836  -7.24858670  -3.05437066  -1.94528280
 G2-215  -2478.02628347 -160.18310191  -160.25115926  -4.18452291  -2.63942587  -160.25355882  -148.00075742  -160.28172777  -9.89331886  -4.18354960  -2.38122087
 G2-216  -1369.73155553 -96.44301975  -96.67986804  -2.69033663  -2.27945777  -96.48798340  -88.97967809  -96.68561791  -6.39579241  -2.68970749  -2.02838922
 G2-217  -1614.13339800 -105.12643350  -105.18402530  -2.74677708  -1.73566780  -105.17475152  -97.09705593  -105.20477160  -6.51486939  -2.74617006  -1.56434505
 G2-218  -1609.05077695 -104.94158314  -105.05230739  -2.74373521  -1.90455226  -104.98797927  -96.96272543  -105.06458972  -6.50906149  -2.74304044  -1.69662407
 G2-219  -1132.63004975 -75.33999502  -75.37436008  -1.98103317  -1.21959322  -75.37702616  -69.51759602  -75.39246097  -4.71828239  -1.98071065  -1.10138281
 G2-220  -732.92254574  -62.80590454  -63.05439605  -1.95751883  -1.91470783  -62.84996641  -57.65508702  -63.06539969  -4.70548404  -1.95724632  -1.73327577
 G2-221  -601.84786060  -70.64421032  -71.11157161  -2.49907838  -2.96839761  -70.70598341  -64.51466712  -71.11997376  -6.04591391  -2.49858821  -2.69013945
 G2-222  -300.90787271  -35.26972926  -35.51650892  -1.23125325  -1.46305745  -35.30832235  -32.19928149  -35.52681768  -3.00776516  -1.23070480  -1.32080308
 G2-223  -197.22677780  -32.84856062  -32.97108710  -1.35442548  -1.66252744  -32.85596566  -29.63000629  -32.95288700  -3.41090904  -1.35329067  -1.47688318

