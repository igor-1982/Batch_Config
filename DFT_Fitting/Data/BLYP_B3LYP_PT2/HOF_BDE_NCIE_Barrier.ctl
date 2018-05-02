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
#       17+223+31+15+21+19+52=378 is the total number of jobs in this batch list
__batch__ ::  378
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
# Non Hydrogon Local Minimums : 31
 NHL1           <PATH1>/.                    XYG3_Comp      energy 
 NHL2           <PATH1>/.                    XYG3_Comp      energy 
 NHL3           <PATH1>/.                    XYG3_Comp      energy 
 NHL4           <PATH1>/.                    XYG3_Comp      energy 
 NHL5           <PATH1>/.                    XYG3_Comp      energy 
 NHL6           <PATH1>/.                    XYG3_Comp      energy 
 NHL7           <PATH1>/.                    XYG3_Comp      energy 
 NHL8           <PATH1>/.                    XYG3_Comp      energy 
 NHL9           <PATH1>/.                    XYG3_Comp      energy 
 NHL10          <PATH1>/.                    XYG3_Comp      energy 
 NHL11          <PATH1>/.                    XYG3_Comp      energy 
 NHL12          <PATH1>/.                    XYG3_Comp      energy 
 NHL13          <PATH1>/.                    XYG3_Comp      energy 
 NHL14          <PATH1>/.                    XYG3_Comp      energy 
 NHL15          <PATH1>/.                    XYG3_Comp      energy 
 NHL16          <PATH1>/.                    XYG3_Comp      energy 
 NHL17          <PATH1>/.                    XYG3_Comp      energy 
 NHL18          <PATH2>/.                    XYG3_Comp      energy
 NHL19          <PATH2>/.                    XYG3_Comp      energy
 NHL20          <PATH2>/.                    XYG3_Comp      energy
 NHL21          <PATH2>/.                    XYG3_Comp      energy
 NHL22          <PATH2>/.                    XYG3_Comp      energy
 NHL23          <PATH2>/.                    XYG3_Comp      energy
 NHL24          <PATH2>/.                    XYG3_Comp      energy
 NHL25          <PATH2>/.                    XYG3_Comp      energy
 NHL26          <PATH2>/.                    XYG3_Comp      energy
 NHL27          <PATH2>/.                    XYG3_Comp      energy
 NHL28          <PATH2>/.                    XYG3_Comp      energy
 NHL29          <PATH2>/.                    XYG3_Comp      energy
 NHL30          <PATH2>/.                    XYG3_Comp      energy
 NHL31          <PATH2>/.                    XYG3_Comp      energy
# Non Hydrogon Transition States : 15
 NHT1           <PATH2>/.                    XYG3_Comp      energy
 NHT2           <PATH2>/.                    XYG3_Comp      energy
 NHT3           <PATH2>/.                    XYG3_Comp      energy
 NHT4           <PATH2>/.                    XYG3_Comp      energy
 NHT5           <PATH2>/.                    XYG3_Comp      energy
 NHT6           <PATH2>/.                    XYG3_Comp      energy
 NHT7           <PATH2>/.                    XYG3_Comp      energy
 NHT8           <PATH2>/.                    XYG3_Comp      energy
 NHT9           <PATH2>/.                    XYG3_Comp      energy
 NHT10          <PATH2>/.                    XYG3_Comp      energy
 NHT11          <PATH2>/.                    XYG3_Comp      energy
 NHT12          <PATH2>/.                    XYG3_Comp      energy
 NHT13          <PATH2>/.                    XYG3_Comp      energy
 NHT14          <PATH2>/.                    XYG3_Comp      energy
 NHT15          <PATH2>/.                    XYG3_Comp      energy
# Hydrogon Local Minimums : 21
 HL1            <PATH2>/.                    XYG3_Comp      energy
 HL2            <PATH2>/.                    XYG3_Comp      energy
 HL3            <PATH2>/.                    XYG3_Comp      energy
 HL4            <PATH2>/.                    XYG3_Comp      energy
 HL5            <PATH2>/.                    XYG3_Comp      energy
 HL6            <PATH2>/.                    XYG3_Comp      energy
 HL7            <PATH2>/.                    XYG3_Comp      energy
 HL8            <PATH2>/.                    XYG3_Comp      energy
 HL9            <PATH2>/.                    XYG3_Comp      energy
 HL10           <PATH2>/.                    XYG3_Comp      energy
 HL11           <PATH2>/.                    XYG3_Comp      energy
 HL12           <PATH2>/.                    XYG3_Comp      energy
 HL13           <PATH2>/.                    XYG3_Comp      energy
 HL14           <PATH2>/.                    XYG3_Comp      energy
 HL15           <PATH2>/.                    XYG3_Comp      energy
 HL16           <PATH2>/.                    XYG3_Comp      energy
 HL17           <PATH2>/.                    XYG3_Comp      energy
 HL18           <PATH2>/.                    XYG3_Comp      energy
 HL19           <PATH2>/.                    XYG3_Comp      energy
 HL20           <PATH2>/.                    XYG3_Comp      energy
 HL21           <PATH2>/.                    XYG3_Comp      energy
# Hydrogon Transition States : 19
 HT1            <PATH2>/.                    XYG3_Comp      energy
 HT2            <PATH2>/.                    XYG3_Comp      energy
 HT3            <PATH2>/.                    XYG3_Comp      energy
 HT4            <PATH2>/.                    XYG3_Comp      energy
 HT5            <PATH2>/.                    XYG3_Comp      energy
 HT6            <PATH2>/.                    XYG3_Comp      energy
 HT7            <PATH2>/.                    XYG3_Comp      energy
 HT8            <PATH2>/.                    XYG3_Comp      energy
 HT9            <PATH2>/.                    XYG3_Comp      energy
 HT10           <PATH2>/.                    XYG3_Comp      energy
 HT11           <PATH2>/.                    XYG3_Comp      energy
 HT12           <PATH2>/.                    XYG3_Comp      energy
 HT13           <PATH2>/.                    XYG3_Comp      energy
 HT14           <PATH2>/.                    XYG3_Comp      energy
 HT15           <PATH2>/.                    XYG3_Comp      energy
 HT16           <PATH2>/.                    XYG3_Comp      energy
 HT17           <PATH2>/.                    XYG3_Comp      energy
 HT18           <PATH2>/.                    XYG3_Comp      energy
 HT19           <PATH2>/.                    XYG3_Comp      energy
# Molecules for NCIE set : 52
 NB1            <PATH1>/.                    XYG3_Comp      energy 
 NB2            <PATH1>/.                    XYG3_Comp      energy 
 NB3            <PATH1>/.                    XYG3_Comp      energy 
 NB4            <PATH1>/.                    XYG3_Comp      energy 
 NB5            <PATH1>/.                    XYG3_Comp      energy 
 NB6            <PATH1>/.                    XYG3_Comp      energy 
 NB7            <PATH1>/.                    XYG3_Comp      energy 
 NB8            <PATH1>/.                    XYG3_Comp      energy 
 NB9            <PATH1>/.                    XYG3_Comp      energy 
 NB10           <PATH1>/.                    XYG3_Comp      energy 
 NB11           <PATH1>/.                    XYG3_Comp      energy 
 NB12           <PATH1>/.                    XYG3_Comp      energy 
 NB13           <PATH1>/.                    XYG3_Comp      energy 
 NB14           <PATH1>/.                    XYG3_Comp      energy 
 NB15           <PATH1>/.                    XYG3_Comp      energy 
 NB16           <PATH1>/.                    XYG3_Comp      energy 
 NB17           <PATH1>/.                    XYG3_Comp      energy 
 NB18           <PATH2>/.                    XYG3_Comp      energy
 NB19           <PATH2>/.                    XYG3_Comp      energy
 NB20           <PATH2>/.                    XYG3_Comp      energy
 NB21           <PATH2>/.                    XYG3_Comp      energy
 NB22           <PATH2>/.                    XYG3_Comp      energy
 NB23           <PATH2>/.                    XYG3_Comp      energy
 NB24           <PATH2>/.                    XYG3_Comp      energy
 NB25           <PATH2>/.                    XYG3_Comp      energy
 NB26           <PATH2>/.                    XYG3_Comp      energy
 NB27           <PATH2>/.                    XYG3_Comp      energy
 NB28           <PATH2>/.                    XYG3_Comp      energy
 NB29           <PATH2>/.                    XYG3_Comp      energy
 NB30           <PATH2>/.                    XYG3_Comp      energy
 NB31           <PATH2>/.                    XYG3_Comp      energy
 NB32           <PATH2>/.                    XYG3_Comp      energy
 NB33           <PATH2>/.                    XYG3_Comp      energy
 NB34           <PATH2>/.                    XYG3_Comp      energy
 NB35           <PATH2>/.                    XYG3_Comp      energy
 NB36           <PATH2>/.                    XYG3_Comp      energy
 NB37           <PATH2>/.                    XYG3_Comp      energy
 NB38           <PATH2>/.                    XYG3_Comp      energy
 NB39           <PATH2>/.                    XYG3_Comp      energy
 NB40           <PATH2>/.                    XYG3_Comp      energy
 NB41           <PATH2>/.                    XYG3_Comp      energy
 NB42           <PATH2>/.                    XYG3_Comp      energy
 NB43           <PATH2>/.                    XYG3_Comp      energy
 NB44           <PATH2>/.                    XYG3_Comp      energy
 NB45           <PATH2>/.                    XYG3_Comp      energy
 NB46           <PATH2>/.                    XYG3_Comp      energy
 NB47           <PATH2>/.                    XYG3_Comp      energy
 NB48           <PATH2>/.                    XYG3_Comp      energy
 NB49           <PATH2>/.                    XYG3_Comp      energy
 NB50           <PATH2>/.                    XYG3_Comp      energy
 NB51           <PATH2>/.                    XYG3_Comp      energy
 NB52           <PATH2>/.                    XYG3_Comp      energy

# Training set for the atomization energy
#  223+92+15+19+52 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 401  1.0
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
# BDE 92
 3         G2-12   -1   G2-11   1  H_0    1              0.20090616    1.0
 3         G2-54   -1   G2-49   1  H_0    1              0.15911326    1.0
 3         G2-32   -1   G2-142  1  H_0    1              0.17877475    1.0
 3         G2-114  -1   G2-143  1  H_0    1              0.17960830    1.0
 3         G2-20   -1   G2-137  1  H_0    1              0.15226298    1.0
 3         G2-53   -1   G2-144  1  H_0    1              0.14769100    1.0
 3         G2-10   -1   G2-9    1  H_0    1              0.18519272    1.0
 3         G2-9    -1   G2-8    1  H_0    1              0.15640003    1.0
 3         G2-19   -1   G2-18   1  H_0    1              0.14181578    1.0
 3         G2-7    -1   G2-6    1  H_0    1              0.17950526    1.0
 3         G2-6    -1   G2-4    1  H_0    1              0.18674160    1.0
 3         G2-4    -1   G2-3    1  H_0    1              0.16952193    1.0
 3         G2-26   -1   G2-145  1  H_0    1              0.17335318    1.0
 3         G2-82   -1   G2-146  1  H_0    1              0.16936242    1.0
 3         G2-91   -1   G2-147  1  H_0    1              0.16550414    1.0
 3         G2-25   -1   G2-139  1  H_0    1              0.18900913    1.0
 3         G2-24   -1   G2-138  1  H_0    1              0.22269850    1.0
 3         G2-93   -1   G2-223  1  H_0    1              0.19160998    1.0
 3         G2-32   -1   G2-141  1  H_0    1              0.16441926    1.0
 3         G2-28   -1   G2-27   1  H_0    1              0.20914815    1.0
 3         G2-95   -1   G2-222  1  H_0    1              0.18176005    1.0
 3         G2-31   -1   G2-30   1  H_0    1              0.15136527    1.0
 3         G2-30   -1   G2-29   1  H_0    1              0.03093685    1.0
 3         G2-112  -1   G2-140  1  H_0    1              0.15211016    1.0
 3         G2-142  -1   G2-6    1  O_0    1              0.14760098    1.0
 3         G2-143  -1   G2-145  1  O_0    1              0.14937604    1.0
 3         G2-144  -1   G2-6    1  S_0    1              0.11618168    1.0
 3         G2-60   -1   G2-222  1  F_0    1              0.21045242    1.0
 3         G2-120  -1   G2-139  1  F_0    1              0.20176916    1.0
 3         G2-207  -1   G2-223  1  F_0    1              0.20633985    1.0
 3         G2-126  -1   G2-140  1  F_0    1              0.19775247    1.0
 3         G2-52   -1   G2-6    1  Cl_0   1              0.13730143    1.0
 3         G2-121  -1   G2-145  1  Cl_0   1              0.13858478    1.0
 3         G2-187  -1   G2-147  1  Cl_0   1              0.13745214    1.0
 3         G2-220  -1   G2-222  1  Cl_0   1              0.13894333    1.0
 3         G2-122  -1   G2-139  1  Cl_0   1              0.14889610    1.0
 3         G2-175  -1   G2-223  1  Cl_0   1              0.15687427    1.0
 3         G2-127  -1   G2-140  1  Cl_0   1              0.13581972    1.0
 3         G2-54   -1   G2-11   1  Cl_0   1              0.09089421    1.0
 3         G2-68   -1   G2-35   1  Cl_0   1              0.06017035    1.0
 3         G2-16   -1   G2-15   1  H_0    1              0.15089109    1.0
 3         G2-26   -1   G2-6    1  G2-6   1              0.15484269    1.0
 3         G2-82   -1   G2-145  1  G2-6   1              0.15233768    1.0
 3         G2-90   -1   G2-145  1  G2-145 1              0.14996051    1.0
 3         G2-91   -1   G2-146  1  G2-6   1              0.15124877    1.0
 3         G2-153  -1   G2-147  1  G2-6   1              0.14924269    1.0
 3         G2-80   -1   G2-139  1  G2-6   1              0.17241643    1.0
 3         G2-83   -1   G2-139  1  G2-139 1              0.19572726    1.0
 3         G2-77   -1   G2-6    1  G2-138 1              0.20972197    1.0
 3         G2-159  -1   G2-223  1  G2-6   1              0.17447358    1.0
 3         G2-114  -1   G2-6    1  G2-141 1              0.14851736    1.0
 3         G2-113  -1   G2-30   1  G2-30  1              0.12100544    1.0
 3         G2-112  -1   G2-6    1  G2-30  1              0.14447107    1.0
 3         G2-184  -1   G2-146  1  G2-30  1              0.14127802    1.0
 3         G2-124  -1   G2-140  1  G2-6   1              0.14261043    1.0
 3         G2-183  -1   G2-140  1  G2-145 1              0.14065381    1.0
 3         G2-140  -1   G2-6    1  G2-29  1              0.02329776    1.0
 3         G2-107  -1   G2-27   1  G2-27  1              0.22221691    1.0
 3         G2-99   -1   G2-6    1  G2-27  1              0.20201121    1.0
 3         G2-182  -1   G2-146  1  G2-27  1              0.19961741    1.0
 3         G2-221  -1   G2-222  1  G2-222 1              0.16117972    1.0
 3         G2-76   -1   G2-222  1  G2-27  1              0.18238623    1.0
 3         G2-123  -1   G2-139  1  G2-27  1              0.21943345    1.0
 3         G2-32   -1   G2-6    1  G2-11  1              0.15704736    1.0
 3         G2-114  -1   G2-145  1  G2-11  1              0.15965596    1.0
 3         G2-129  -1   G2-146  1  G2-11  1              0.16156401    1.0
 3         G2-166  -1   G2-147  1  G2-11  1              0.16114236    1.0
 3         G2-103  -1   G2-30   1  G2-11  1              0.18429634    1.0
 3         G2-125  -1   G2-140  1  G2-11  1              0.18322220    1.0
 3         G2-115  -1   G2-142  1  G2-6   1              0.14311181    1.0
 3         G2-204  -1   G2-147  1  G2-142 1              0.14276344    1.0
 3         G2-168  -1   G2-223  1  G2-11  1              0.18754265    1.0
 3         G2-130  -1   G2-142  1  G2-145 1              0.14493712    1.0
 3         G2-130  -1   G2-6    1  G2-143 1              0.14316206    1.0
 3         G2-191  -1   G2-145  1  G2-143 1              0.14642520    1.0
 3         G2-165  -1   G2-140  1  G2-142 1              0.16782580    1.0
 3         G2-104  -1   G2-30   1  G2-142 1              0.16817481    1.0
 3         G2-98   -1   G2-6    1  G2-9   1              0.14809940    1.0
 3         G2-109  -1   G2-145  1  G2-9   1              0.14683675    1.0
 3         G2-167  -1   G2-223  1  G2-9   1              0.17640077    1.0
 3         G2-195  -1   G2-147  1  G2-9   1              0.14688045    1.0
 3         G2-105  -1   G2-140  1  G2-9   1              0.16750144    1.0
 3         G2-100  -1   G2-6    1  G2-148 1              0.10524946    1.0
 3         G2-53   -1   G2-6    1  G2-137 1              0.12631290    1.0
 3         G2-118  -1   G2-145  1  G2-137 1              0.12504287    1.0
 3         G2-193  -1   G2-147  1  G2-137 1              0.12137237    1.0
 3         G2-119  -1   G2-144  1  G2-6   1              0.12537849    1.0
 3         G2-37   -1   G2-11   1  G2-11  1              0.08879816    1.0
 3         G2-34   -1   G2-9    1  G2-9   1              0.11934729    1.0
 3         G2-101  -1   G2-142  1  G2-35  1              0.07177363    1.0
 3         G2-102  -1   G2-6    1  G2-16  1              0.15040381    1.0
 3         G2-51   -1   G2-16   1  G2-16  1              0.12682648    1.0
# 38 forward barrier heights
#   5 unimolecular and association reactions (UM)
 3         NHT1    1   NHL1  -1  NHL2  -1                 0.02340999   3.0
 3         NHT2    1   NHL1  -1  NHL4  -1                 0.00505171   3.0
 3         NHT3    1   NHL1  -1  NHL6  -1                 0.00274099   3.0
 3         NHT4    1   NHL8  -1  NHL6  -1                 0.01091616   3.0
 2         NHT5    1   NHL10 -1                           0.07674778   3.0
#   8 nucleophilic substitution reactions (NS) 
 3         NHT6    1   NHL12 -1  NHL13 -1                -0.00054182   3.0
 2         NHT6    1   NHL14 -1                           0.02132237   3.0
 3         NHT7    1   NHL15 -1  NHL16 -1                 0.00494016   3.0
 2         NHT7    1   NHL17 -1                           0.02168890   3.0
 3         NHT8    1   NHL12 -1  NHL16 -1                -0.01998375   3.0
 2         NHT8    1   NHL19 -1                           0.04718650   3.0
 3         NHT9    1   NHL20 -1  NHL13 -1                -0.00443021   3.0
 2         NHT9    1   NHL23 -1                           0.01746586   3.0
#   6 heavy-atom transfer reactions (HAT)
 3         NHT10   1   NHL1  -1  NHL24 -1                 0.02890791   3.0
 3         NHT15   1   NHL1  -1  NHL27 -1                 0.06721805   3.0
 3         NHT14   1   NHL1  -1  NHL29 -1                 0.02868480   3.0
 3         NHT11   1   NHL1  -1  NHL13 -1                 0.04841357   3.0
 3         NHT12   1   NHL1  -1  NHL26 -1                 0.00361747   3.0
 3         NHT13   1   NHL8  -1  NHL28 -1                 0.01184045   3.0
#  19 hydrogen transfer reactions (HT)
 3         HT1     1   HL1   -1  HL2   -1                 0.00908352   3.0
 3         HT2     1   HL5   -1  HL3   -1                 0.00812736   3.0
 3         HT3     1   HL7   -1  HL3   -1                 0.01928256   3.0
 3         HT4     1   HL5   -1  HL8   -1                 0.01067712   3.0
 3         HT5     1   HL1   -1  HL3   -1                 0.01529856   3.0
 3         HT6     1   HL5   -1  HL9   -1                 0.00509952   3.0
 3         HT7     1   HL2   -1  HL7   -1                 0.00270912   3.0
 3         HT8     1   HL5   -1  HL11  -1                 0.00541824   3.0
 3         HT9     1   HL13  -1  HL3   -1                 0.00286848   3.0
 3         HT10    1   HL15  -1  HL8   -1                 0.02183232   3.0
 3         HT11    1   HL1   -1  HL16  -1                 0.00494016   3.0
 3         HT12    1   HL1   -1  HL5   -1                 0.01705152   3.0
 3         HT13    1   HL1   -1  HL18  -1                 0.00557760   3.0
 3         HT14    1   HL15  -1  HL2   -1                 0.01561728   3.0
 3         HT15    1   HL10  -1  HL7   -1                 0.01274880   3.0
 3         HT16    1   HL10  -1  HL12  -1                 0.01195200   3.0
 3         HT17    1   HL11  -1  HL10  -1                 0.01657344   3.0
 3         HT18    1   HL10  -1  HL8   -1                 0.02310720   3.0
 2         HT19    1   HL21  -1                           0.06119424   3.0
# 38 reverse barrier heights
#   5 unimolecular and association reactions (UM)
 2         NHT1    1   NHL3  -1                           0.01708339   3.0
 2         NHT2    1   NHL5  -1                           0.03614285   3.0
 2         NHT3    1   NHL7  -1                           0.06653280   3.0
 2         NHT4    1   NHL9  -1                           0.05254100   3.0
 2         NHT5    1   NHL11 -1                           0.05276410   3.0
#   8 nucleophilic substitution reactions (NS) 
 3         NHT6    1   NHL12 -1  NHL13 -1                -0.00054182   3.0
 2         NHT6    1   NHL14 -1                           0.02132237   3.0
 3         NHT7    1   NHL15 -1  NHL16 -1                 0.00494016   3.0
 2         NHT7    1   NHL17 -1                           0.02168890   3.0
 3         NHT8    1   NHL13 -1  NHL15 -1                 0.03204730   3.0
 2         NHT8    1   NHL18 -1                           0.00460550   3.0
 3         NHT9    1   NHL21 -1  NHL12 -1                 0.02761709   3.0
 2         NHT9    1   NHL22 -1                           0.07521792   3.0
#   6 heavy-atom transfer reactions (HAT)
 3         NHT10   1   NHL25 -1  NHL2  -1                 0.13261940   3.0
 3         NHT15   1   NHL27 -1  NHL1  -1                 0.06721805   3.0
 3         NHT14   1   NHL29 -1  NHL1  -1                 0.02868480   3.0
 3         NHT11   1   NHL27 -1  NHL8  -1                 0.09086708   3.0
 3         NHT12   1   NHL27 -1  NHL30 -1                 0.16920846   3.0
 3         NHT13   1   NHL13 -1  NHL31 -1                 0.09588692   3.0
#  19 hydrogen transfer reactions (HT)
 3         HT1     1   HL3   -1  HL4   -1                 0.01386432   3.0
 3         HT2     1   HL1   -1  HL6   -1                 0.03378432   3.0
 3         HT3     1   HL1   -1  HL8   -1                 0.02438208   3.0
 3         HT4     1   HL7   -1  HL6   -1                 0.03123456   3.0
 3         HT5     1   HL1   -1  HL3   -1                 0.01529856   3.0
 3         HT6     1   HL6   -1  HL10  -1                 0.02023872   3.0
 3         HT7     1   HL4   -1  HL8   -1                 0.01258944   3.0
 3         HT8     1   HL6   -1  HL12  -1                 0.03171264   3.0
 3         HT9     1   HL14  -1  HL1   -1                 0.05322624   3.0
 3         HT10    1   HL5   -1  HL7   -1                 0.01290816   3.0
 3         HT11    1   HL17  -1  HL3   -1                 0.03697152   3.0
 3         HT12    1   HL3   -1  HL15  -1                 0.02087616   3.0
 3         HT13    1   HL3   -1  HL19  -1                 0.02756928   3.0
 3         HT14    1   HL5   -1  HL4   -1                 0.01657344   3.0
 3         HT15    1   HL8   -1  HL20  -1                 0.03569664   3.0
 3         HT16    1   HL11  -1  HL20  -1                 0.02916288   3.0
 3         HT17    1   HL9   -1  HL12  -1                 0.02772864   3.0
 3         HT18    1   HL7   -1  HL9   -1                 0.02836608   3.0
 2         HT19    1   HL21  -1                           0.06119424   3.0
# 31 Non bond interaction for NCIE set
# 6 Hydrogen bond complexes (HB)                : 
 2         NB21   -1   NB1    2                           0.00501984  30.0
 2         NB22   -1   NB2    2                           0.00728275  30.0
 2         NB23   -1   NB3    2                           0.00792019  30.0
 3         NB24   -1   NB3    1  NB1    1                 0.01021498  30.0
 2         NB25   -1   NB4    2                           0.02380839  30.0
 2         NB26   -1   NB5    2                           0.02573664  30.0
# 7 Charge transfer comlexes (CT)               : 
 3         NB27   -1   NB6    1  NB7    1                 0.00168922  30.0
 3         NB28   -1   NB1    1  NB7    1                 0.00288442  30.0
 3         NB29   -1   NB9    1  NB8    1                 0.00607162  30.0
 3         NB30   -1   NB10   1  NB8    1                 0.00774490  30.0
 3         NB31   -1   NB1    1  NB11   1                 0.00777677  30.0
 3         NB32   -1   NB3    1  NB8    1                 0.00854170  30.0
 3         NB33   -1   NB1    1  NB8    1                 0.01692403  30.0
# 6 Dipole interaction complexes (DI)           : 
 2         NB34   -1   NB12   2                           0.00264538  30.0
 2         NB35   -1   NB13   2                           0.00320314  30.0
 3         NB36   -1   NB12   1  NB13   1                 0.00533856  30.0
 3         NB37   -1   NB14   1  NB13   1                 0.00565728  30.0
 3         NB38   -1   NB15   1  NB10   1                 0.00572102  30.0
 3         NB39   -1   NB15   1  NB13   1                 0.00662938  30.0
# 7 Weak interaction complexes (WI)             : 
 3         NB40   -1   NB16   1  NB17   1                 0.00074899  30.0
 3         NB41   -1   NB16   1  NB18   1                 0.00035059  30.0
 2         NB46   -1   NB18   2                           0.00081274  30.0
 3         NB43   -1   NB19   1  NB16   1                 0.00006374  30.0
 3         NB42   -1   NB19   1  NB20   1                 0.00009562  30.0
 2         NB44   -1   NB16   2                           0.00012749  30.0
 3         NB45   -1   NB16   1  NB20   1                 0.00020717  30.0
# 5 Pi-Pi stacking complexes (PPS)              : 
 2         NB47   -1   NB9    2                           0.00213542  30.0
 2         NB48   -1   NB6    2                           0.00226291  30.0
 2         NB49   -1   NB52   2                           0.00288442  30.0
 2         NB50   -1   NB52   2                           0.00436646  30.0
 2         NB51   -1   NB52   2                           0.00443021  30.0

__xyg3 components__ ::  378
#           E_noXC       Ex_K       Ex_Becke     Ec_LYP     PT2_2ND_TZ     E_K         Ex_LDA      Ex_Becke     Ec_VWN      Ec_LYP   PT2_2ND_TZ
    H_0  -0.19061178  -0.30863053  -0.30694307  0.00000000  0.00000000  -0.30925638  -0.26560754  -0.30728525  -0.03986945  0.00000000  0.00000000
    He_0  -1.83948821  -1.01888300  -1.02134834  -0.04377087  -0.04017039  -1.02035674  -0.88042122  -1.02205462  -0.15000509  -0.04378062  -0.03731257
    Li_0  -5.65035418  -1.78060826  -1.77619379  -0.05388724  -0.01683655  -1.78065767  -1.53861170  -1.77588364  -0.20630448  -0.05384238  -0.01597278
    Be_0  -11.90095589  -2.66942478  -2.66281354  -0.09514713  -0.08986367  -2.66925722  -2.31662728  -2.66211379  -0.29865864  -0.09512581  -0.07128122
     B_0  -20.76382897  -3.76352895  -3.76049510  -0.12590755  -0.11213013  -3.76518213  -3.29748272  -3.76079681  -0.38253316  -0.12588525  -0.09409640
     C_0  -32.62361805  -5.06139132  -5.06190803  -0.15914848  -0.13764604  -5.06530125  -4.48351792  -5.06367947  -0.47028686  -0.15915004  -0.12100319
     N_0  -47.81107385  -6.58183504  -6.58299509  -0.19235825  -0.16658348  -6.58810724  -5.89167100  -6.58659748  -0.56018519  -0.19239219  -0.15234049
     O_0  -66.62110214  -8.17956749  -8.20175630  -0.25742487  -0.23322012  -8.18840153  -7.36929467  -8.20684928  -0.68762019  -0.25746977  -0.21424545
     F_0  -89.39745883  -9.99379855  -10.03449722  -0.32116638  -0.30823585  -10.00556900  -9.06820806  -10.04148998  -0.81664846  -0.32128149  -0.28495423
     Ne_0  -116.46971434  -12.04533601  -12.09946665  -0.38290764  -0.38990371  -12.06001029  -11.00542552  -12.10858843  -0.94565342  -0.38310732  -0.36291600
    Na_0  -147.85112257  -13.98442720  -14.01419062  -0.40959123  -0.20670034  -13.99419250  -12.77641627  -14.01966543  -1.02472190  -0.40951093  -0.19275870
    Mg_0  -183.62578673  -15.97097693  -15.99450138  -0.46089859  -0.23785455  -15.97784045  -14.61034605  -15.99756049  -1.13134066  -0.46083987  -0.21720888
    Al_0  -223.79786329  -18.06469537  -18.08059718  -0.49534217  -0.26976489  -18.07216385  -16.54919397  -18.08386230  -1.22397243  -0.49525145  -0.24741555
    Si_0  -268.56637509  -20.27334065  -20.28296362  -0.53127882  -0.30508172  -20.28180534  -18.60595594  -20.28680595  -1.31968700  -0.53118004  -0.28036843
     P_0  -318.08297399  -22.61514540  -22.61559384  -0.56755203  -0.34050822  -22.62314590  -20.79272856  -22.61930720  -1.41703827  -0.56751010  -0.31476684
     S_0  -372.49075832  -24.99841703  -24.99818868  -0.63018152  -0.38790559  -25.00770907  -23.01944995  -25.00252477  -1.54311784  -0.63002300  -0.35771778
    Cl_0  -431.98370912  -27.48120616  -27.47678485  -0.69163070  -0.36305894  -27.49563461  -25.35131277  -27.48667991  -1.66934338  -0.69152269  -0.33108035
    G2-1  -5.84912063  -2.13393142  -2.13269819  -0.08856621  -0.06495109  -2.13778552  -1.85100162  -2.13473787  -0.29109581  -0.08873603  -0.05647805
    G2-2  -12.07514955  -3.07217225  -3.06346788  -0.10879573  -0.07416536  -3.07484238  -2.67616704  -3.06443283  -0.35901241  -0.10863174  -0.06572012
    G2-3  -32.86625808  -5.40622148  -5.41533928  -0.19709641  -0.19862988  -5.41015628  -4.80091180  -5.41602771  -0.55436975  -0.19706243  -0.17185730
    G2-4  -33.07971809  -5.84679604  -5.84850409  -0.21448037  -0.20903365  -5.85189956  -5.21627906  -5.85003151  -0.61420759  -0.21427374  -0.18855320
    G2-5  -33.10901046  -5.77354724  -5.78492816  -0.23279631  -0.26453457  -5.77765543  -5.14425377  -5.78498494  -0.63506512  -0.23284395  -0.22359126
    G2-6  -33.35838056  -6.20800382  -6.21061011  -0.25762059  -0.26765415  -6.21213630  -5.54812023  -6.21061764  -0.70133792  -0.25762111  -0.24178546
    G2-7  -33.62429648  -6.57664497  -6.58037077  -0.29460579  -0.32698837  -6.58035200  -5.89378126  -6.57923754  -0.78222958  -0.29467630  -0.29540988
    G2-8  -48.06047967  -6.90982340  -6.92948422  -0.23675024  -0.23699954  -6.91616989  -6.20212471  -6.93183013  -0.64958938  -0.23669097  -0.21396525
    G2-9  -48.30983258  -7.26476808  -7.29518530  -0.27865563  -0.31165687  -7.27068365  -6.54323842  -7.29626292  -0.73555399  -0.27871959  -0.28056614
   G2-10  -48.55828055  -7.64846226  -7.68399828  -0.31766462  -0.38657949  -7.65434397  -6.91637840  -7.68446961  -0.81768186  -0.31786590  -0.34839118
   G2-11  -66.87868148  -8.52792846  -8.57400173  -0.30011753  -0.32753790  -8.53700860  -7.72032902  -8.57796204  -0.77456877  -0.30024015  -0.29712941
   G2-12  -67.13323364  -8.91155634  -8.97310929  -0.33998303  -0.42531895  -8.92043720  -8.10710904  -8.97603390  -0.85749075  -0.34023755  -0.38420377
   G2-13  -89.66641383  -10.37697536  -10.44731802  -0.36186471  -0.42778491  -10.38949429  -9.47198824  -10.45366100  -0.90057448  -0.36212999  -0.39043631
   G2-14  -269.04460235  -20.96497532  -20.97505569  -0.59803140  -0.39149346  -20.97461964  -19.22669837  -20.97763691  -1.47782908  -0.59794590  -0.35403151
   G2-15  -269.00220079  -20.99818635  -21.00166651  -0.57962356  -0.35216179  -21.00920281  -19.25847906  -21.00561938  -1.45761462  -0.57905155  -0.32292119
   G2-16  -269.25917915  -21.35814248  -21.35500943  -0.61635423  -0.38795555  -21.36941578  -19.57423731  -21.35847917  -1.53993758  -0.61604734  -0.35580044
   G2-17  -269.51180229  -21.72590574  -21.71507617  -0.64993683  -0.42435675  -21.73769624  -19.89852381  -21.71824815  -1.61950338  -0.64984522  -0.38892796
   G2-18  -318.58094812  -23.28270822  -23.28912535  -0.64271420  -0.42895360  -23.29206981  -21.40117150  -23.29148209  -1.58083375  -0.64254295  -0.39217024
   G2-19  -318.82961921  -23.63414858  -23.63995039  -0.67639827  -0.47760248  -23.64379719  -21.72412872  -23.64156189  -1.65876992  -0.67635822  -0.43542056
   G2-20  -373.00771357  -25.68364476  -25.69254836  -0.70209690  -0.50154820  -25.69254950  -23.66515483  -25.69446220  -1.70209314  -0.70212189  -0.45838027
   G2-21  -432.25351613  -27.83355588  -27.83583397  -0.72728001  -0.43021663  -27.84715821  -25.69161887  -27.84422607  -1.74792878  -0.72733007  -0.39112265
   G2-22  -11.31055336  -3.55598795  -3.54942163  -0.13413973  -0.09276505  -3.55842508  -3.07951737  -3.55032032  -0.44041895  -0.13412007  -0.07463681
   G2-23  -95.04898600  -11.91132748  -11.99190092  -0.41674514  -0.48143012  -11.93321368  -10.81906944  -12.00445607  -1.06968668  -0.41715512  -0.43173914
   G2-24  -65.84657335  -10.98231798  -11.03809720  -0.44553210  -0.58761184  -10.98391299  -9.88119031  -11.03199329  -1.15199289  -0.44536080  -0.51392984
   G2-25  -66.30645208  -11.73420147  -11.76793392  -0.49893710  -0.59236371  -11.73768361  -10.54826380  -11.76261552  -1.29304097  -0.49884699  -0.52767808
   G2-26  -66.75144043  -12.48367112  -12.49344994  -0.55227660  -0.61929259  -12.48917656  -11.21305032  -12.48953444  -1.43414277  -0.55230917  -0.55905876
   G2-27  -80.57960589  -11.60874148  -11.72747937  -0.42905851  -0.70966304  -11.61765943  -10.50544964  -11.72410597  -1.10452525  -0.42798692  -0.59059121
   G2-28  -80.84159649  -12.04481510  -12.13277718  -0.46520829  -0.65506326  -12.04724403  -10.88271849  -12.12658395  -1.18663352  -0.46506660  -0.57097785
   G2-29  -99.45412892  -13.30282274  -13.40415754  -0.48527001  -0.65845677  -13.30959556  -12.05347276  -13.40155913  -1.22430388  -0.48520349  -0.57809462
   G2-30  -99.60594922  -13.65895962  -13.76676003  -0.50856469  -0.67820667  -13.66831789  -12.38783342  -13.76517528  -1.28875407  -0.50841580  -0.59623443
   G2-31  -99.83295072  -14.05198613  -14.14951327  -0.54092254  -0.70081215  -14.06100047  -12.74011659  -14.14726614  -1.36720053  -0.54093391  -0.62132731
   G2-32  -100.25459578  -14.80824888  -14.87932326  -0.59617146  -0.71380437  -14.81866664  -13.41388647  -14.87855742  -1.50848574  -0.59630013  -0.64364906
   G2-33  -95.85515962  -13.10567618  -13.21611645  -0.48429136  -0.70012427  -13.10683182  -11.87359169  -13.20874994  -1.22007075  -0.48411479  -0.61196104
   G2-34  -96.59764661  -14.60181532  -14.68173530  -0.59688260  -0.73658007  -14.61049578  -13.23494931  -14.67944814  -1.50367519  -0.59708588  -0.66260679
   G2-35  -114.57168481  -14.69622099  -14.83279528  -0.52819571  -0.74000574  -14.70342208  -13.36065019  -14.82917374  -1.32249609  -0.52802978  -0.64837834
   G2-36  -133.33662546  -16.30544970  -16.46793541  -0.57217928  -0.78640573  -16.31358996  -14.86592865  -16.46416045  -1.42411435  -0.57186601  -0.69286729
   G2-37  -133.76430729  -17.03888361  -17.19505805  -0.63615244  -0.84673371  -17.05136785  -15.53821153  -17.19459387  -1.57813535  -0.63637385  -0.75492306
   G2-38  -178.82570386  -19.88710775  -20.08177789  -0.67541314  -0.88799775  -19.90304056  -18.19416402  -20.08449439  -1.65960187  -0.67551641  -0.78966966
   G2-39  -166.08412958  -21.57703403  -21.76881292  -0.79209064  -1.09891122  -21.59043759  -19.64614129  -21.76334296  -1.95634302  -0.79187244  -0.96789136
   G2-40  -295.71532860  -27.95206274  -28.01972491  -0.84366295  -0.46934767  -27.97342375  -25.55029343  -28.03095447  -2.07288096  -0.84356580  -0.42683724
   G2-41  -537.18088822  -40.55703235  -40.60275720  -1.09926330  -0.71787228  -40.51855752  -37.24415462  -40.57122578  -2.67345679  -1.09954654  -0.70290106
   G2-42  -636.28275521  -45.16509486  -45.22842884  -1.21591966  -0.95866253  -45.17597707  -41.61889883  -45.22680537  -2.91189079  -1.21554587  -0.84551837
   G2-43  -745.05759347  -49.99108503  -50.04434951  -1.30745727  -0.95840534  -50.00504873  -46.13297951  -50.04488046  -3.12696614  -1.30694036  -0.86294985
   G2-44  -863.99690369  -54.95514753  -54.98595090  -1.41359674  -0.85012971  -54.98058058  -50.77537661  -54.99975668  -3.36382146  -1.41343252  -0.76559203
   G2-45  -579.83616182  -41.57547699  -41.60520258  -1.13301401  -0.64342898  -41.60679935  -38.26494409  -41.62511920  -2.73117050  -1.13317613  -0.58668488
   G2-46  -335.30831612  -28.49522076  -28.61040957  -0.85272601  -0.85307754  -28.51265035  -26.14972844  -28.61408107  -2.07003721  -0.85283835  -0.74561654
   G2-47  -405.26000670  -30.05945016  -30.12923416  -0.84942964  -0.80950024  -30.06733467  -27.61955483  -30.12571359  -2.07036049  -0.84913327  -0.70352653
   G2-48  -439.18861220  -33.17228278  -33.28511052  -0.94063138  -0.89438097  -33.18624526  -30.52761939  -33.28525113  -2.27711120  -0.94026600  -0.79340982
   G2-49  -498.64616942  -35.60160186  -35.71293631  -0.99268263  -0.84641719  -35.62797384  -32.80373782  -35.72158041  -2.39420292  -0.99212900  -0.73809938
   G2-50  -521.40769584  -37.44838912  -37.55875786  -1.04600576  -0.86522912  -37.47198369  -34.51235212  -37.56895042  -2.51342501  -1.04601686  -0.77513835
   G2-51  -538.55079901  -42.77458492  -42.76068741  -1.26310831  -0.82801069  -42.79658369  -39.22457776  -42.76602745  -3.10883286  -1.26285253  -0.75743932
   G2-52  -465.38221019  -33.73250047  -33.74625692  -0.98312688  -0.72771472  -33.74811042  -31.00152582  -33.75160059  -2.39932540  -0.98306781  -0.65783967
   G2-53  -406.13375560  -31.58806596  -31.60699522  -0.95907587  -0.80135146  -31.59892028  -28.98250109  -31.60600511  -2.35414744  -0.95902442  -0.72754742
   G2-54  -498.88050935  -35.99835542  -36.09360199  -1.02518699  -0.85814292  -36.01777558  -33.16008519  -36.10032674  -2.47121237  -1.02521146  -0.76721242
   G2-55  -505.84167677  -41.38748134  -41.60644564  -1.25535093  -1.43641153  -41.40605675  -38.07473675  -41.60161643  -3.01875524  -1.25516094  -1.25789563
   G2-56  -289.12504436  -34.13766885  -34.33962708  -1.19388382  -1.37092827  -34.17527060  -31.12139501  -34.35327055  -2.92357311  -1.19388235  -1.24595490
   G2-57  -1316.83952432  -86.46439483  -86.47764058  -2.29074942  -1.44281484  -86.50705879  -79.76331887  -86.49929561  -5.46692660  -2.29025985  -1.30226106
   G2-58  -492.09170225  -48.43342053  -48.65760570  -1.55205266  -1.54756005  -48.48586078  -44.33643032  -48.68248951  -3.76504450  -1.55222277  -1.40571690
   G2-59  -1519.83156155  -100.81100631  -100.81235004  -2.65031414  -1.54195139  -100.86187995  -92.99952867  -100.84131936  -6.30750364  -2.64989597  -1.40372933
   G2-60  -390.35702425  -45.37023756  -45.67246244  -1.59236388  -1.87915102  -45.41016057  -41.44146564  -45.67907095  -3.85754036  -1.59216841  -1.70624496
   G2-61  -1760.66396975  -115.14910976  -115.21618660  -3.05436039  -2.01675995  -115.19948764  -106.31327862  -115.23667454  -7.25082169  -3.05370258  -1.81413581
   G2-62  -471.93837452  -38.35002048  -38.49799413  -1.15634476  -1.20770603  -38.36278741  -35.21643172  -38.49209743  -2.80239754  -1.15595810  -1.06782981
   G2-63  -777.77736092  -55.13416325  -55.23898563  -1.52153797  -1.32659087  -55.14607301  -50.79989577  -55.23278421  -3.64959067  -1.52099331  -1.17605020
   G2-64  -278.20914522  -33.45913591  -33.71407492  -1.19153844  -1.49192663  -33.48684362  -30.53656768  -33.71488862  -2.90646762  -1.19137078  -1.33894597
   G2-65  -626.31085853  -60.74633227  -61.01466257  -1.95476142  -1.98599883  -60.80064862  -55.63799604  -61.03547967  -4.71136996  -1.95460932  -1.81139647
   G2-66  -1996.60768166  -130.53272681  -130.53534730  -3.41855933  -2.04677802  -130.59281135  -120.50566795  -130.56652419  -8.10257064  -3.41782021  -1.86023038
   G2-67  -162.42823765  -21.27191921  -21.51013765  -0.78848953  -1.22645049  -21.27766217  -19.39666116  -21.49673811  -1.94715012  -0.78815667  -1.06261791
   G2-68  -546.60490693  -42.09552692  -42.31116617  -1.24388781  -1.34034805  -42.11544657  -38.74348819  -42.30690971  -3.01047114  -1.24347896  -1.14625938
   G2-69  -316.11533246  -36.47235180  -36.81871459  -1.27881833  -1.68180770  -36.50695193  -33.36937848  -36.81868337  -3.11168589  -1.27868271  -1.49100384
   G2-70  -586.41815699  -52.79153263  -53.03818976  -1.65173095  -1.68701121  -52.83628302  -48.45134985  -53.05211091  -3.97223244  -1.65164314  -1.52667236
   G2-71  -199.97333688  -24.31384843  -24.65928068  -0.87909893  -1.55134804  -24.32290260  -22.27340084  -24.64545586  -2.15672906  -0.87883879  -1.30093765
   G2-72  -245.48521927  -28.00399746  -28.30953373  -0.97314772  -1.34820136  -28.02987572  -25.63626617  -28.30894652  -2.38054853  -0.97310304  -1.18081403
   G2-73  -700.19632489  -57.34796209  -57.71436150  -1.74164219  -1.91647538  -57.39716699  -52.81836641  -57.72444536  -4.18418465  -1.74154400  -1.67989424
   G2-74  -423.00261025  -50.49998568  -50.85912043  -1.79648261  -2.17100942  -50.54355263  -46.09577991  -50.86324940  -4.36944407  -1.79622465  -1.95793363
   G2-75  -1793.32122378  -120.34885518  -120.44543897  -3.26330535  -2.28956490  -120.39975627  -111.01870530  -120.46253843  -7.76612266  -3.26250480  -2.05545650
   G2-76  -381.52575767  -47.01974756  -47.35316759  -1.69542401  -2.13746782  -47.05413027  -42.85001157  -47.35085708  -4.14424447  -1.69500214  -1.91110971
   G2-77  -98.97826804  -16.89631723  -16.95992350  -0.70421528  -0.87876653  -16.90053694  -15.21208091  -16.95144275  -1.80480886  -0.70399507  -0.77783218
   G2-78  -98.98565235  -16.88426003  -16.95692765  -0.70459340  -0.86769814  -16.88861307  -15.20956676  -16.94776702  -1.80459446  -0.70433517  -0.76899219
   G2-79  -98.91937314  -16.91231198  -16.97453218  -0.70953187  -0.87136982  -16.91605534  -15.24044492  -16.96551128  -1.80850299  -0.70934185  -0.77582229
   G2-80  -99.43939581  -17.64091075  -17.68196504  -0.75769535  -0.88968737  -17.64677850  -15.87210625  -17.67411836  -1.94530836  -0.75756309  -0.79585144
   G2-81  -99.38448352  -17.68207519  -17.71293780  -0.76438379  -0.88440538  -17.68756147  -15.91930588  -17.70525599  -1.95057392  -0.76429982  -0.79666058
   G2-82  -99.88238072  -18.38839061  -18.40374099  -0.81086738  -0.91644946  -18.39579767  -16.53243030  -18.39706198  -2.08606686  -0.81085876  -0.82691627
   G2-83  -132.12922469  -22.79970939  -22.87550950  -0.96311757  -1.16599486  -22.80568504  -20.53429118  -22.86300227  -2.45672966  -0.96280529  -1.03653726
   G2-84  -132.10752640  -22.81082673  -22.88202928  -0.96286501  -1.17157608  -22.81737167  -20.54275205  -22.87094592  -2.45769880  -0.96258780  -1.04287853
   G2-85  -132.06571452  -22.82973111  -22.89822233  -0.96918890  -1.16007233  -22.83602559  -20.57462651  -22.88665360  -2.46145484  -0.96893791  -1.03760693
   G2-86  -132.02139195  -22.85840881  -22.91584684  -0.97578004  -1.16490284  -22.86383728  -20.60969663  -22.90402993  -2.46557865  -0.97558069  -1.04638552
   G2-87  -132.07045591  -22.83481311  -22.89764652  -0.97160839  -1.16520746  -22.84171286  -20.57902653  -22.88632367  -2.46260914  -0.97137072  -1.04143726
   G2-88  -132.51597304  -23.58598458  -23.62110196  -1.02475769  -1.18496207  -23.59405186  -21.23955762  -23.61079498  -2.60343891  -1.02463786  -1.06699005
   G2-89  -132.57208464  -23.54782663  -23.59465646  -1.01722498  -1.19079450  -23.55550356  -21.19611526  -23.58383512  -2.59771203  -1.01704597  -1.06737752
   G2-90  -133.01276076  -24.29350582  -24.31434174  -1.06953831  -1.21437326  -24.30269380  -21.85214745  -24.30478844  -2.73806661  -1.06948254  -1.09545692
   G2-91  -133.01592540  -24.29091145  -24.31112285  -1.07042487  -1.21906094  -24.30003650  -21.85155460  -24.30145706  -2.73807921  -1.07037097  -1.09951065
   G2-92  -165.14701880  -28.77842771  -28.84113706  -1.23446591  -1.45274074  -28.78647240  -25.94294287  -28.82713563  -3.11865318  -1.23422346  -1.30702284
   G2-93  -197.47655947  -33.23771255  -33.34894606  -1.39064696  -1.69725174  -33.23972101  -29.97853373  -33.32721366  -3.49190234  -1.39005178  -1.51538355
   G2-94  -211.98624429  -25.95906603  -26.11921445  -0.94086012  -1.10614520  -25.98464583  -23.65428653  -26.12526029  -2.31937746  -0.94094944  -1.00171681
   G2-95  -301.17793901  -35.65877179  -35.89274563  -1.26636263  -1.49722726  -35.69338772  -32.54524421  -35.90036116  -3.08825269  -1.26634675  -1.35676017
   G2-96  -897.14368080  -60.87845693  -60.90752504  -1.67278906  -1.14480495  -60.90633879  -56.10833407  -60.91884019  -4.01640882  -1.67256132  -1.03304948
   G2-97  -1328.90475975  -88.01719209  -88.06457534  -2.36331428  -1.57528543  -88.05687658  -81.21300532  -88.08097497  -5.63359753  -2.36288127  -1.41896111
   G2-98  -81.67766657  -13.55126024  -13.59441558  -0.57482860  -0.67724271  -13.55870314  -12.23076218  -13.59156798  -1.46934467  -0.57493999  -0.61043716
   G2-99  -113.97481337  -17.96360234  -18.05852119  -0.72391724  -0.94254033  -17.96876771  -16.21717824  -18.04998437  -1.83961483  -0.72371281  -0.83194137
   G2-100  -214.53724495  -29.15472403  -29.41061595  -1.12327677  -1.56512502  -29.16805208  -26.54838752  -29.39798505  -2.77780008  -1.12304360  -1.37728672
   G2-101  -214.58009641  -29.10539863  -29.36718486  -1.11983665  -1.57549186  -29.12330714  -26.49736963  -29.35545180  -2.77430236  -1.11956488  -1.37606426
   G2-102  -302.64523103  -27.64315719  -27.63906884  -0.90840009  -0.72384417  -27.65695942  -25.22971039  -27.63995466  -2.27256672  -0.90829388  -0.65882374
   G2-103  -166.49686323  -22.29734352  -22.46640986  -0.84614844  -1.10649039  -22.31531972  -20.28875855  -22.46459393  -2.09502402  -0.84615752  -0.98309923
   G2-104  -199.62115526  -28.19457982  -28.37312855  -1.10362212  -1.40418173  -28.21383298  -25.59837163  -28.36734426  -2.74642447  -1.10347928  -1.25018078
   G2-105  -181.03912676  -26.96464073  -27.10968358  -1.08462330  -1.35617144  -26.98081422  -24.44342467  -27.10263016  -2.70918273  -1.08455624  -1.21044076
   G2-106  -114.32453538  -18.72922660  -18.79897021  -0.78503918  -0.95024429  -18.73608143  -16.91688154  -18.79127414  -1.98449699  -0.78498635  -0.85311672
   G2-107  -161.18728081  -23.41337597  -23.61215629  -0.89401903  -1.31267885  -23.41718882  -21.20357608  -23.59698626  -2.24399679  -0.89352935  -1.13704606
   G2-108  -114.80441160  -19.45018845  -19.50111396  -0.83313632  -0.97424954  -19.45978667  -17.54557924  -19.49526134  -2.12090489  -0.83317939  -0.87772916
   G2-109  -114.81335002  -19.45339767  -19.50305085  -0.83341289  -0.97549565  -19.46320138  -17.54901162  -19.49767557  -2.12109365  -0.83348137  -0.87886920
   G2-110  -132.52585065  -19.21771529  -19.35330402  -0.74812458  -0.98418998  -19.22720085  -17.41962016  -19.34643545  -1.87982853  -0.74791493  -0.86900654
   G2-111  -132.91099420  -19.97517961  -20.07800687  -0.80529284  -0.99469845  -19.98550141  -18.09103286  -20.07227611  -2.02298448  -0.80524240  -0.89116058
   G2-112  -132.97414857  -19.95982917  -20.06561222  -0.79991768  -0.99638187  -19.97229090  -18.06712777  -20.06137192  -2.01940151  -0.79988065  -0.88753743
   G2-113  -199.19203369  -27.42879330  -27.63089529  -1.04592627  -1.37903860  -27.44487369  -24.90744221  -27.62396810  -2.60384648  -1.04577321  -1.21959488
   G2-114  -133.39046258  -20.71291377  -20.78985377  -0.85486120  -1.01061955  -20.72557301  -18.73392783  -20.78654984  -2.16032749  -0.85494004  -0.91100198
   G2-115  -133.38395745  -20.70127640  -20.78187001  -0.85371191  -1.00951811  -20.71404178  -18.72187052  -20.77788775  -2.15942532  -0.85374608  -0.90900030
   G2-116  -438.78517492  -36.77980497  -36.82557556  -1.17055183  -1.08647013  -36.79033073  -33.68378467  -36.82024372  -2.87047147  -1.17034643  -0.97992395
   G2-117  -505.87520944  -45.70561480  -45.82809964  -1.52125386  -1.56579214  -45.72873595  -41.83283212  -45.82365032  -3.73444280  -1.52109698  -1.40005608
   G2-118  -439.26612279  -37.49153200  -37.51673039  -1.21762479  -1.10113008  -37.50443811  -34.30134856  -37.51302587  -3.00606253  -1.21752265  -0.99744966
   G2-119  -439.26295478  -37.49156368  -37.52014460  -1.21701595  -1.10585113  -37.50457112  -34.30161559  -37.51634015  -3.00629433  -1.21688885  -1.00077808
   G2-120  -155.48869291  -21.42220480  -21.53908006  -0.82298500  -0.98940278  -21.43766777  -19.43374895  -21.53775394  -2.06207891  -0.82293080  -0.88653708
   G2-121  -498.51751770  -39.63589962  -39.65632028  -1.24166871  -1.02675344  -39.65369950  -36.32076125  -39.65895920  -3.05118162  -1.24155821  -0.92701169
   G2-122  -498.06719399  -38.88854563  -38.93741338  -1.18914852  -1.00787766  -38.90489703  -35.66478443  -38.93863966  -2.91094518  -1.18891247  -0.90204959
   G2-123  -146.66010746  -23.11799215  -23.24906178  -0.92863334  -1.22164130  -23.12339280  -20.87466032  -23.23605353  -2.35075509  -0.92825264  -1.07437892
   G2-124  -166.10922946  -25.87155499  -25.98246195  -1.05934973  -1.29259612  -25.88552086  -23.39434951  -25.97497830  -2.67191964  -1.05923734  -1.15507192
   G2-125  -199.62979377  -28.21387401  -28.38607934  -1.10545077  -1.39571426  -28.23290809  -25.61789060  -28.38088207  -2.74763329  -1.10537965  -1.24555963
   G2-126  -222.17181246  -29.66165439  -29.84849193  -1.12519833  -1.40023895  -29.68385968  -26.96480734  -29.84599051  -2.78917279  -1.12507364  -1.25197166
   G2-127  -564.75676836  -47.10432724  -47.23305272  -1.48999967  -1.43236697  -47.12817576  -43.17983581  -47.23290821  -3.63675398  -1.48971275  -1.27599787
   G2-128  -531.64731989  -45.54183554  -45.56761488  -1.50028658  -1.32512530  -45.56132454  -41.64082889  -45.56729406  -3.70321993  -1.50012772  -1.19590322
   G2-129  -166.52786126  -26.61514850  -26.69760083  -1.11436338  -1.31270971  -26.62984769  -24.05343285  -26.69146488  -2.81226452  -1.11438911  -1.18281045
   G2-130  -166.51897602  -26.60677308  -26.69305554  -1.11244005  -1.30716380  -26.62155954  -24.04244905  -26.68636661  -2.81135065  -1.11241856  -1.17711483
   G2-131  -147.93543566  -25.34636439  -25.40459349  -1.09272994  -1.27900872  -25.35821705  -22.86087772  -25.39571684  -2.77256642  -1.09271872  -1.15142996
   G2-132  -198.28916920  -30.35717584  -30.51234809  -1.22674965  -1.54541098  -30.36466419  -27.48677541  -30.49672681  -3.05195824  -1.22635398  -1.37851138
   G2-133  -504.15498023  -47.15718195  -47.26027194  -1.59146731  -1.65408779  -47.16642411  -43.07672417  -47.24572674  -3.90018276  -1.59090621  -1.47931122
   G2-134  -179.70478350  -29.12363103  -29.24503561  -1.20742481  -1.50109054  -29.12710676  -26.32578381  -29.22732283  -3.01436993  -1.20703635  -1.34204704
   G2-135  -212.41688189  -34.29242654  -34.44128195  -1.41134865  -1.76325764  -34.29603442  -30.98206634  -34.41956903  -3.52629426  -1.41077094  -1.57137191
   G2-136  -0.47612538  -0.65544939  -0.65530822  -0.03816400  -0.04614246  -0.65647041  -0.56617948  -0.65557951  -0.13018973  -0.03820601  -0.04140059
   G2-137  -372.74964739  -25.33380460  -25.33956313  -0.66733659  -0.44238740  -25.34313841  -23.33486056  -25.34274956  -1.62395437  -0.66721982  -0.40571774
   G2-138  -65.54248671  -10.60392983  -10.66407070  -0.40484764  -0.54081612  -10.60848611  -9.53504033  -10.66050404  -1.06638864  -0.40404048  -0.46650378
   G2-139  -66.04067315  -11.34964380  -11.39069572  -0.46294518  -0.54842631  -11.35671921  -10.20053332  -11.38819945  -1.21192918  -0.46241924  -0.48390935
   G2-140  -132.74509921  -19.56887762  -19.68569984  -0.76712343  -0.97193128  -19.58317730  -17.71658027  -19.68323712  -1.94153755  -0.76689677  -0.86049575
   G2-141  -100.00434939  -14.42921891  -14.50798808  -0.56301122  -0.67329440  -14.44269192  -13.07413770  -14.50976844  -1.42995605  -0.56285262  -0.60422260
   G2-142  -100.02141452  -14.40567805  -14.48177363  -0.56042257  -0.65276166  -14.42492524  -13.03854636  -14.48485525  -1.42819024  -0.55995878  -0.57875295
   G2-143  -133.15936091  -20.30526322  -20.39112237  -0.81921764  -0.95563723  -20.32913365  -18.35836987  -20.39258975  -2.08017904  -0.81861273  -0.84859345
   G2-144  -405.88416669  -31.23116880  -31.25181106  -0.92577688  -0.75013057  -31.24484049  -28.65364071  -31.25330342  -2.27690094  -0.92544874  -0.68011062
   G2-145  -66.49178251  -12.11038702  -12.12388168  -0.51712090  -0.56645600  -12.11838134  -10.87107862  -12.12225076  -1.35456385  -0.51692093  -0.50991547
   G2-146  -99.62656255  -18.01329044  -18.03595867  -0.77668892  -0.86703704  -18.02421966  -16.19371914  -18.03208500  -2.00743048  -0.77636201  -0.78011305
   G2-147  -132.76181746  -23.91615385  -23.94662648  -1.03648496  -1.17073972  -23.92979239  -21.51634950  -23.94031108  -2.66002420  -1.03606127  -1.05311326
   G2-148  -181.19968184  -22.85512615  -23.12136791  -0.83286514  -1.28124560  -22.86669390  -20.87665439  -23.11174099  -2.04999465  -0.83251738  -1.10712721
   G2-149  -132.11622486  -22.79189106  -22.87173592  -0.96291179  -1.16626842  -22.79834787  -20.53248003  -22.85986547  -2.45682194  -0.96260946  -1.03803182
   G2-150  -165.25881265  -28.70817391  -28.78869301  -1.22344260  -1.46919398  -28.71578519  -25.86041093  -28.77308630  -3.10952157  -1.22307458  -1.30996426
   G2-151  -165.65318045  -29.51556976  -29.54959106  -1.28704069  -1.48245186  -29.52519248  -26.58291610  -29.53629888  -3.25776115  -1.28687083  -1.33598944
   G2-152  -166.14304737  -30.19862459  -30.22497695  -1.32819475  -1.51241154  -30.20957249  -27.17182526  -30.21253058  -3.39006932  -1.32809111  -1.36409605
   G2-153  -166.14818823  -30.19407800  -30.21816846  -1.33101803  -1.52689657  -30.20453791  -27.17250858  -30.20513777  -3.39043492  -1.33091419  -1.37666460
   G2-154  -197.89687533  -33.94153702  -34.03397553  -1.44154660  -1.73482071  -33.94950137  -30.60216577  -34.01489211  -3.63000144  -1.44108233  -1.54904154
   G2-155  -197.89439673  -33.94657531  -34.03569297  -1.44149388  -1.72493680  -33.95472434  -30.60392479  -34.01680010  -3.63018073  -1.44101565  -1.54135400
   G2-156  -198.78192252  -35.43098773  -35.46667731  -1.54832362  -1.78215048  -35.44222673  -31.91388708  -35.45010184  -3.91099278  -1.54809098  -1.60654432
   G2-157  -199.27330650  -36.10377904  -36.13563311  -1.58686416  -1.81052352  -36.11648954  -32.49155805  -36.12029576  -4.04207827  -1.58671229  -1.63279918
   G2-158  -199.27107166  -36.10207730  -36.13303805  -1.58913073  -1.82046586  -36.11449987  -32.49410454  -36.11726436  -4.04276327  -1.58895284  -1.64134101
   G2-159  -230.60820873  -39.14313383  -39.26123419  -1.64990518  -2.00093833  -39.14724756  -35.30180079  -39.23675503  -4.14429664  -1.64926220  -1.78892818
   G2-160  -232.40320241  -42.00930761  -42.04660696  -1.84555551  -2.10862302  -42.02377496  -37.81162413  -42.02837571  -4.69410663  -1.84535535  -1.90149971
   G2-161  -263.26971271  -44.26060937  -44.42051591  -1.85385023  -2.29373738  -44.26949168  -39.93053881  -44.39291911  -4.65366181  -1.85303997  -2.03674046
   G2-162  -265.53375698  -47.91414577  -47.95699073  -2.10420047  -2.40676760  -47.93036993  -43.13105392  -47.93586266  -5.34609212  -2.10395191  -2.17022615
   G2-163  -328.64113456  -54.72476146  -54.91827256  -2.28262814  -2.82258922  -54.72657283  -49.39882105  -54.88006095  -5.69026812  -2.28149931  -2.51782620
   G2-164  -328.62289288  -54.67045232  -54.89065423  -2.28002050  -2.87624144  -54.67250680  -49.36712937  -54.85132420  -5.68775314  -2.27885122  -2.55506681
   G2-165  -232.75324006  -34.11109381  -34.29244844  -1.36306863  -1.69400339  -34.13135222  -30.92754253  -34.28324145  -3.39906144  -1.36284471  -1.51321267
   G2-166  -199.66256068  -32.51882482  -32.60520265  -1.37468507  -1.61857480  -32.53463588  -29.37404873  -32.59549605  -3.46449253  -1.37464490  -1.45823916
   G2-167  -245.53298336  -40.21937254  -40.37420027  -1.67395728  -2.06332232  -40.22599606  -36.33493314  -40.35047029  -4.18050477  -1.67335163  -1.84305997
   G2-168  -264.11577943  -41.47056367  -41.65355777  -1.69491826  -2.09930709  -41.48046344  -37.51258143  -41.63207049  -4.21917213  -1.69433953  -1.87531996
   G2-169  -198.76299351  -31.02038485  -31.17062792  -1.26605891  -1.56448962  -31.03404431  -28.05544586  -31.15793159  -3.18270584  -1.26572659  -1.39287535
   G2-170  -199.16243030  -31.83185870  -31.93115131  -1.32965953  -1.57438287  -31.84677686  -28.77481183  -31.92042478  -3.33120465  -1.32950918  -1.41670213
   G2-171  -231.87947060  -37.00287698  -37.13264120  -1.53540740  -1.85763928  -37.01901701  -33.44866112  -37.11842970  -3.84384382  -1.53511598  -1.66322233
   G2-172  -330.35220306  -48.90474063  -49.19724308  -1.93691402  -2.51027731  -48.92390462  -44.32116935  -49.17367795  -4.80154319  -1.93616479  -2.21778663
   G2-173  -227.35901159  -35.35014294  -35.53408166  -1.43204115  -1.82502721  -35.35558517  -31.98624099  -35.51255240  -3.56067700  -1.43147016  -1.62388315
   G2-174  -572.45878155  -54.00463834  -54.19176333  -1.82976691  -1.98360720  -54.03279148  -49.42581142  -54.18469079  -4.46685665  -1.82946617  -1.77388738
   G2-175  -629.23689417  -60.39103209  -60.51696445  -2.08125513  -2.12043561  -60.40550003  -55.09435405  -60.50139495  -5.10990509  -2.08049946  -1.89644373
   G2-176  -227.45714701  -35.24924624  -35.44242096  -1.41133957  -1.86330583  -35.25732670  -31.85383524  -35.42325457  -3.54848689  -1.41078938  -1.64249500
   G2-177  -227.35779096  -35.34213041  -35.52984555  -1.43177355  -1.83102541  -35.34640429  -31.98094835  -35.50758316  -3.56033100  -1.43120495  -1.62877640
   G2-178  -198.33308509  -30.27350043  -30.44652999  -1.21003829  -1.57121277  -30.28589785  -27.38568570  -30.43325301  -3.04214725  -1.20962218  -1.38628970
   G2-179  -198.79372076  -31.02740769  -31.17534461  -1.26421984  -1.57186326  -31.04212282  -28.05461068  -31.16353131  -3.18334892  -1.26393805  -1.39734653
   G2-180  -332.11710067  -47.50178348  -47.78754032  -1.87010646  -2.37890098  -47.52932233  -43.11386250  -47.77297809  -4.63697116  -1.86965288  -2.11760060
   G2-181  -504.59830217  -47.87463583  -47.94918044  -1.64039305  -1.65280753  -47.88857476  -43.69731868  -47.93754270  -4.03766682  -1.63997866  -1.48445429
   G2-182  -180.23782421  -29.77249565  -29.87837258  -1.24094123  -1.54096160  -29.78117519  -26.85415425  -29.86399228  -3.14342758  -1.24063372  -1.37097689
   G2-183  -199.23700383  -31.77941694  -31.89533573  -1.31849750  -1.59094011  -31.79494890  -28.71681180  -31.88473479  -3.32427026  -1.31831023  -1.42397589
   G2-184  -199.23515296  -31.76979429  -31.88652964  -1.31758816  -1.59693688  -31.78559980  -28.70667492  -31.87622707  -3.32353013  -1.31743547  -1.42840102
   G2-185  -265.80208420  -40.05235727  -40.22165023  -1.63342473  -1.96987061  -40.07515770  -36.29057280  -40.21072135  -4.05718791  -1.63323060  -1.77006612
   G2-186  -505.04208115  -48.61848092  -48.66600812  -1.69386140  -1.67880389  -48.63385758  -44.35363510  -48.65549072  -4.17816612  -1.69356619  -1.51528570
   G2-187  -564.78870512  -51.43992143  -51.47046327  -1.76144396  -1.63959710  -51.46071690  -46.95955833  -51.46644297  -4.35540183  -1.76121165  -1.47845243
   G2-188  -564.77774544  -51.44681215  -51.47816629  -1.75890263  -1.62342536  -51.46805441  -46.96027934  -51.47493330  -4.35521299  -1.75869573  -1.46472855
   G2-189  -180.58191887  -30.57706495  -30.64651907  -1.30919525  -1.54025072  -30.58917584  -27.59570834  -30.63422170  -3.29243869  -1.30907284  -1.38644144
   G2-190  -313.93193372  -46.87286836  -47.14408205  -1.90114702  -2.46855494  -46.89152295  -42.51275817  -47.12246275  -4.73450109  -1.90072670  -2.19087936
   G2-191  -199.65371225  -32.51244727  -32.60434651  -1.37115453  -1.60487835  -32.52918030  -29.36303277  -32.59490300  -3.46328134  -1.37107651  -1.44529517
   G2-192  -266.28764250  -40.73804264  -40.89893722  -1.67526118  -2.00656610  -40.76061922  -36.88209187  -40.88767888  -4.18986007  -1.67506521  -1.80441621
   G2-193  -505.53556521  -49.29329836  -49.32880539  -1.73771649  -1.71721115  -49.30926889  -44.93917118  -49.31851367  -4.31034512  -1.73750177  -1.55162897
   G2-194  -878.04831274  -74.30470040  -74.37160453  -2.39928978  -2.20763047  -74.32979889  -68.03240588  -74.36183010  -5.88293791  -2.39881838  -1.99296168
   G2-195  -181.08195576  -31.25998322  -31.31788599  -1.35353452  -1.58481788  -31.27256124  -28.18912714  -31.30593954  -3.42539537  -1.35348813  -1.42769480
   G2-196  -402.04773801  -45.39230477  -45.40656337  -1.68546714  -1.63279957  -45.41189100  -41.22354975  -45.40041314  -4.23186900  -1.68528539  -1.47759784
   G2-197  -537.28705908  -53.06350920  -53.17329808  -1.85021026  -1.95584404  -53.07480200  -48.39915609  -53.15588356  -4.55248144  -1.84959335  -1.75117337
   G2-198  -212.83193952  -35.02480171  -35.15409935  -1.46569544  -1.80299783  -35.02991407  -31.64207361  -35.13313564  -3.66615967  -1.46522172  -1.61383091
   G2-199  -232.29233219  -37.74253510  -37.84495954  -1.59095176  -1.87576231  -37.75960329  -34.10325060  -37.83127081  -3.98415296  -1.59074386  -1.68817532
   G2-200  -232.36451725  -37.68751917  -37.80831249  -1.57763581  -1.88929669  -37.70452424  -34.03923000  -37.79453310  -3.97662728  -1.57737158  -1.69292253
   G2-201  -299.02195884  -45.92085427  -46.11324127  -1.88155242  -2.29638223  -45.94465380  -41.56919404  -46.09800520  -4.70320903  -1.88120849  -2.05533978
   G2-202  -538.16815381  -54.52973948  -54.58060672  -1.95471546  -1.97908459  -54.54711715  -49.68161974  -54.56707371  -4.83118768  -1.95435407  -1.78609129
   G2-203  -213.70926626  -36.49095446  -36.56322551  -1.57045300  -1.84126955  -36.50456819  -32.92603779  -36.54747467  -3.94567283  -1.57025287  -1.65788469
   G2-204  -232.78094615  -38.41574308  -38.51096004  -1.63351234  -1.92056973  -38.43285306  -34.68635652  -38.49710548  -4.11635671  -1.63332870  -1.72906563
   G2-205  -375.83722856  -52.61725337  -52.89297090  -2.03941608  -2.48893239  -52.64175805  -47.75167005  -52.87804017  -5.03021397  -2.03880465  -2.23177182
   G2-206  -375.83536576  -52.61782952  -52.89384485  -2.03934830  -2.48896729  -52.64214893  -47.75208776  -52.87890085  -5.03025602  -2.03874656  -2.23174368
   G2-207  -286.65741870  -42.92731073  -43.12104816  -1.71503287  -2.09367534  -42.94078384  -38.86526199  -43.10290033  -4.26108547  -1.71443759  -1.87393224
   G2-208  -265.92037099  -44.31943390  -44.42152849  -1.89094893  -2.21454312  -44.33924839  -40.00394387  -44.40557404  -4.76774720  -1.89071430  -1.99371962
   G2-209  -765.14414083  -73.04169027  -73.39629246  -2.36094833  -2.49522431  -73.10042166  -66.97630181  -73.41143591  -5.65777177  -2.36058215  -2.26998812
   G2-210  -908.82768997  -85.31485672  -85.79885522  -2.76362326  -3.05922247  -85.37483549  -78.32389506  -85.80438957  -6.60180044  -2.76304226  -2.77093073
   G2-211  -1272.49176328  -90.46497674  -90.56434895  -2.46376819  -1.89526149  -90.48914529  -83.41602344  -90.56152468  -5.84691886  -2.46298044  -1.70168428
   G2-212  -572.41253356  -49.65153118  -49.94455220  -1.56096289  -1.84487754  -49.67636932  -45.63770647  -49.93615763  -3.74917002  -1.56058545  -1.62363130
   G2-213  -1236.52854790  -79.95977227  -80.02088189  -2.07857707  -1.35276899  -79.99501707  -73.87099369  -80.03477215  -4.93656989  -2.07818733  -1.21630588
   G2-214  -1680.74381322  -113.44316701  -113.56092208  -3.05504964  -2.16460802  -113.49739245  -104.70027443  -113.58024836  -7.24858670  -3.05437066  -1.94528280
   G2-215  -2478.05986292  -160.18310191  -160.25115926  -4.18452291  -2.63942587  -160.25355882  -148.00075742  -160.28172777  -9.89331886  -4.18354960  -2.38122087
   G2-216  -1369.74062120  -96.44301975  -96.67986804  -2.69033663  -2.27945777  -96.48798340  -88.97967809  -96.68561791  -6.39579241  -2.68970749  -2.02838922
   G2-217  -1614.15629465  -105.12643350  -105.18402530  -2.74677708  -1.73566780  -105.17475152  -97.09705593  -105.20477160  -6.51486939  -2.74617006  -1.56434505
   G2-218  -1609.06575194  -104.94158314  -105.05230739  -2.74373521  -1.90455226  -104.98797927  -96.96272543  -105.06458972  -6.50906149  -2.74304044  -1.69662407
   G2-219  -1132.64973164  -75.33999502  -75.37436008  -1.98103317  -1.21959322  -75.37702616  -69.51759602  -75.39246097  -4.71828239  -1.98071065  -1.10138281
   G2-220  -732.93664574  -62.80590454  -63.05439605  -1.95751883  -1.91470783  -62.84996641  -57.65508702  -63.06539969  -4.70548404  -1.95724632  -1.73327577
   G2-221  -601.86121940  -70.64421032  -71.11157161  -2.49907838  -2.96839761  -70.70598341  -64.51466712  -71.11997376  -6.04591391  -2.49858821  -2.69013945
   G2-222  -300.92051982  -35.26972926  -35.51650892  -1.23125325  -1.46305745  -35.30832235  -32.19928149  -35.52681768  -3.00776516  -1.23070480  -1.32080308
   G2-223  -197.21006260  -32.84856062  -32.97108710  -1.35442548  -1.66252744  -32.85596566  -29.63000629  -32.95288700  -3.41090904  -1.35329067  -1.47688318
# Non Hydrogon Local Minimums : 31
NHL1    -0.19061175   -0.30863055   -0.30694310   0.00000000   0.00000000   -0.30925638   -0.26560754   -0.30728525  -0.03986945   0.00000000   0.00000000
NHL2   -95.85712042  -13.10337947  -13.21429136  -0.48421118  -0.70153512  -13.10450460  -11.87167057  -13.20687979  -1.21997025  -0.48403359  -0.61298923
NHL3   -95.98899802  -13.44644580  -13.56132964  -0.50776187  -0.70052480  -13.45396976  -12.19278854  -13.55715035  -1.28380695  -0.50750859  -0.61081661
NHL4   -99.45627887  -13.30034193  -13.40216770  -0.48517634  -0.65974325  -13.30711124  -12.05138184  -13.39954028  -1.22419369  -0.48510918  -0.57900567
NHL5   -99.60509384  -13.65975709  -13.76755390  -0.50857056  -0.67882090  -13.66916592  -12.38849852  -13.76601758  -1.28882251  -0.50841869  -0.59664885
NHL6   -66.30258022  -11.73820985  -11.77156679  -0.49908641  -0.59222699  -11.74170819  -10.55174034  -11.76628527  -1.29328044  -0.49899526  -0.52757121
NHL7   -66.48500158  -12.11759734  -12.13025559  -0.51733594  -0.56557882  -12.12561996  -10.87720956  -12.12870350  -1.35494940  -0.51713810  -0.50928094
NHL8   -33.35473633   -6.21179502   -6.21403719  -0.25777439  -0.26733040   -6.21595692   -5.55147105   -6.21408864  -0.70157202  -0.25777535  -0.24156474
NHL9   -99.61176221  -18.02551559  -18.04420288  -0.77579334  -0.86364513  -18.03597719  -16.19944137  -18.04018896  -2.00714895  -0.77553636  -0.77741563
NHL10  -80.84552447  -12.04027608  -12.12911965  -0.46503673  -0.65779111  -12.04264862  -10.87887433  -12.12283839  -1.18641965  -0.46489263  -0.57292112
NHL11  -80.82795836  -12.04225808  -12.12294692  -0.46496246  -0.62431565  -12.04638173  -10.87645495  -12.11820278  -1.18547318  -0.46487509  -0.54668647
NHL12  -89.22646591  -10.20299813  -10.29811697  -0.35932060  -0.47516889  -10.22413688   -9.33951822  -10.31097358  -0.89024646  -0.35989548  -0.42405621
NHL13 -122.78644872  -16.27942125  -16.35955605  -0.61740414  -0.71016148  -16.29380529  -14.78113911  -16.36230225  -1.55142154  -0.61751538  -0.64397820
NHL14 -212.02903240  -26.47959042  -26.65847913  -0.98211280  -1.20438639  -26.51981299  -24.13254751  -26.67509348  -2.44360695  -0.98270385  -1.07882041
NHL15 -431.87434123  -27.67815810  -27.68467140  -0.72431141  -0.43537728  -27.69834876  -25.56234461  -27.69888574  -1.73558087  -0.72468785  -0.39396241
NHL16 -465.37063850  -33.74464645  -33.75668348  -0.98387941  -0.72638567  -33.76029606  -31.01286724  -33.76215018  -2.40011599  -0.98382184  -0.65708467
NHL17 -897.25440054  -61.42309868  -61.44312411  -1.71222034  -1.17441197  -61.46004860  -56.58389033  -61.46162485  -4.13743988  -1.71236340  -1.05952751
NHL18 -554.62680610  -43.93033291  -44.04774278  -1.34823973  -1.23127961  -43.97474179  -40.35723045  -44.06701114  -3.29155690  -1.34867598  -1.09540529
NHL19 -554.66359911  -43.96448323  -44.04986087  -1.34588852  -1.15546883  -43.99896903  -40.35568348  -44.06587101  -3.28911283  -1.34621694  -1.04555272
NHL20  -66.69725524   -8.69537731   -8.78713429  -0.33552205  -0.49160385   -8.71147769   -7.93893069   -8.79531595  -0.84366639  -0.33608606  -0.43162474
NHL21 -100.24421852  -14.81929937  -14.88887896  -0.59664227  -0.71200540  -14.82975579  -13.42359154  -14.88821804  -1.50910871  -0.59676965  -0.64235963
NHL22 -189.49667249  -25.03230579  -25.19952861  -0.96595628  -1.20426807  -25.06471781  -22.79753486  -25.21039160  -2.40327586  -0.96650096  -1.08098239
NHL23 -189.49504512  -24.97859392  -25.15033993  -0.95831521  -1.21548447  -25.01207182  -22.73462839  -25.16207699  -2.39727495  -0.95895220  -1.08438073
NHL24 -162.42388470  -21.27728803  -21.51404631  -0.78865240  -1.22163085  -21.28319722  -19.40078313  -21.50081185  -1.94736661  -0.78832256  -1.05905708
NHL25  -66.87538390   -8.53158392   -8.57703433  -0.30023209  -0.32675338   -8.54066843   -7.72333097   -8.58102442  -0.77475316  -0.30035390  -0.29654440
NHL26 -178.81855687  -19.89616166  -20.08797212  -0.67587192  -0.88097961  -19.91206786  -18.20135055  -20.09076260  -1.66000723  -0.67597597  -0.78492643
NHL27  -89.66286561  -10.38093364  -10.45055529  -0.36197501  -0.42676503  -10.39343679   -9.47519577  -10.45691181  -0.90075604  -0.36223819  -0.38966131
NHL28 -521.38624237  -37.47415789  -37.57785621  -1.04746089  -0.85320437  -37.49776589  -34.53419309  -37.58826374  -2.51475206  -1.04747064  -0.76689907
NHL29 -432.24915877  -27.83824361  -27.83988986  -0.72745465  -0.42960191  -27.85185391  -25.69563718  -27.84832611  -1.74819435  -0.72750312  -0.39069350
NHL30  -89.39745883   -9.99379854  -10.03449722  -0.32116638  -0.30823586  -10.00556900   -9.06820806  -10.04148998  -0.81664846  -0.32128149  -0.28495424
NHL31 -431.98370901  -27.48120629  -27.47678494  -0.69163070  -0.36305892  -27.49563461  -25.35131277  -27.48667991  -1.66934338  -0.69152269  -0.33108033
# Non Hydrogon Transition States : 15
NHT1   -96.02294895  -13.38737863  -13.51914327  -0.50225780  -0.72735308  -13.39245383  -12.14818877  -13.51239295  -1.27550786  -0.50168216  -0.63189101
NHT2   -99.64402742  -13.58720559  -13.70216903  -0.49799051  -0.67949194  -13.59924444  -12.32071346  -13.70136176  -1.27445248  -0.49712722  -0.59349943
NHT3   -66.49534061  -12.02692152  -12.06600812  -0.51043164  -0.60394613  -12.03615341  -10.81413964  -12.06326646  -1.34252124  -0.50960038  -0.53466633
NHT4   -99.64089409  -17.92976000  -17.98238770  -0.76893782  -0.90426762  -17.94469665  -16.12272246  -17.97867350  -2.00130332  -0.76816732  -0.79913096
NHT5   -80.82768619  -11.97973568  -12.07364213  -0.46377583  -0.65652215  -11.98367998  -10.82858747  -12.06785046  -1.18271505  -0.46362456  -0.56912359
NHT6  -212.04093617  -26.42564451  -26.63570055  -0.98333630  -1.26613661  -26.46918660  -24.11083910  -26.65230059  -2.44314781  -0.98386920  -1.12202403
NHT7  -897.27187277  -61.36869308  -61.41677835  -1.71215036  -1.21691520  -61.40741657  -56.55521000  -61.43372273  -4.13603654  -1.71216956  -1.08683543
NHT8  -554.65035683  -43.89517766  -44.02769923  -1.34783242  -1.25418559  -43.93873943  -40.33537726  -44.04555352  -3.29001977  -1.34816935  -1.11117152
NHT9  -189.50010681  -24.93159656  -25.13808106  -0.96047295  -1.28334452  -24.96939943  -22.72356136  -25.14959504  -2.39816742  -0.96101023  -1.13137040
NHT10 -162.61696061  -21.52761914  -21.78786777  -0.80514562  -1.24243041  -21.53610189  -19.64457142  -21.77520475  -2.00029144  -0.80443258  -1.07611414
NHT11 -122.99858495  -16.48103948  -16.60573726  -0.63013217  -0.77380062  -16.49580722  -14.98948020  -16.60693463  -1.60105314  -0.62978980  -0.69388587
NHT12 -179.02036427  -20.16127591  -20.38930829  -0.68864534  -0.92168714  -20.18953798  -18.47167641  -20.39495492  -1.70895135  -0.68797398  -0.80554957
NHT13 -554.76388083  -43.61974599  -43.77090198  -1.31437035  -1.18642660  -43.64812818  -40.07344682  -43.77872544  -3.22082357  -1.31394287  -1.05963133
NHT14 -432.42061214  -28.10770729  -28.13181870  -0.74502637  -0.46943696  -28.12312060  -25.95944560  -28.13971285  -1.80196816  -0.74479442  -0.42239502
NHT15  -89.85459699  -10.58942143  -10.69866958  -0.37682317  -0.47097936  -10.59946589   -9.69470744  -10.70128526  -0.94861296  -0.37677004  -0.42672295
# Hydrogon Local Minimums : 21
HL1     -0.19061175   -0.30863055   -0.30694310   0.00000000   0.00000000   -0.30925638   -0.26560754   -0.30728525  -0.03986945   0.00000000   0.00000000
HL2   -432.24915877  -27.83824361  -27.83988986  -0.72745465  -0.42960191  -27.85185391  -25.69563718  -27.84832611  -1.74819435  -0.72750312  -0.39069350
HL3     -0.47530414   -0.65630684   -0.65609729  -0.03818462  -0.04608446   -0.65733652   -0.56688834   -0.65637970  -0.13024466  -0.03822653  -0.04136057
HL4   -431.98370901  -27.48120629  -27.47678494  -0.69163070  -0.36305892  -27.49563461  -25.35131277  -27.48667991  -1.66934338  -0.69152269  -0.33108033
HL5    -66.87538390   -8.53158392   -8.57703433  -0.30023209  -0.32675338   -8.54066843   -7.72333097   -8.58102442  -0.77475316  -0.30035390  -0.29654440
HL6    -67.12804732   -8.91719775   -8.97789453  -0.34016054  -0.42415806   -8.92608608   -8.11184393   -8.98085908  -0.85777597  -0.34041317  -0.38333367
HL7    -33.35473633   -6.21179502   -6.21403719  -0.25777439  -0.26733040   -6.21595692   -5.55147105   -6.21408864  -0.70157202  -0.25777535  -0.24156474
HL8    -33.61928548   -6.58183420   -6.58507727  -0.29482456  -0.32655679   -6.58558085   -5.89843291   -6.58400467  -0.78254792  -0.29489510  -0.29511841
HL9    -48.55262462   -7.65442089   -7.68932220  -0.31786852  -0.38591692   -7.66031190   -6.92153326   -7.68982115  -0.81802003  -0.31806770  -0.34791125
HL10   -48.30501424   -7.26997442   -7.29965488  -0.27884362  -0.31080852   -7.27592502   -6.54767086   -7.30079825  -0.73584415  -0.27890768  -0.27995092
HL11   -66.74192887  -12.49351473  -12.50230355  -0.55273701  -0.61842091  -12.49909446  -11.22198279  -12.49850337  -1.43475091  -0.55276989  -0.55847621
HL12   -66.48510945  -12.11746615  -12.13015703  -0.51734291  -0.56562055  -12.12549294  -10.87714417  -12.12860458  -1.35494780  -0.51714466  -0.50931447
HL13   -89.39745883   -9.99379854  -10.03449722  -0.32116638  -0.30823586  -10.00556900   -9.06820806  -10.04148998  -0.81664846  -0.32128149  -0.28495424
HL14   -89.66286561  -10.38093364  -10.45055529  -0.36197501  -0.42676503  -10.39343679   -9.47519577  -10.45691181  -0.90075604  -0.36223819  -0.38966131
HL15   -66.62110218   -8.17956745   -8.20175626  -0.25742487  -0.23322012   -8.18840153   -7.36929467   -8.20684928  -0.68762019  -0.25746977  -0.21424547
HL16  -318.82080173  -23.64352503  -23.64811265  -0.67679816  -0.47656993  -23.65326364  -21.73221907  -23.64987924  -1.65935184  -0.67675864  -0.43471507
HL17  -318.57495740  -23.28909405  -23.29467474  -0.64298463  -0.42826082  -23.29851038  -21.40666647  -23.29713091  -1.58123348  -0.64281403  -0.39170026
HL18  -373.00030744  -25.69155922  -25.69942872  -0.70241730  -0.50059672  -25.70051005  -23.67198107  -25.70144487  -1.70256458  -0.70244134  -0.45772633
HL19  -372.74556880  -25.33818091  -25.34335446  -0.66751282  -0.44185777  -25.34753708  -23.33861852  -25.34659500  -1.62421686  -0.66739567  -0.40535457
HL20   -48.05780703   -6.91274197   -6.93196106  -0.23685315  -0.23653310   -6.91910400   -6.20455432   -6.93434198  -0.64975714  -0.23679479  -0.21363178
HL21  -165.24418910  -28.72171879  -28.80323134  -1.22319081  -1.46475937  -28.72991595  -25.87280670  -28.78809127  -3.11028377  -1.22281626  -1.30622104
# Hydrogon Transition States : 19
HT1   -432.42112963  -28.13740101  -28.15367137  -0.74357662  -0.44935289  -28.15404828  -25.96577026  -28.16277610  -1.80649151  -0.74343268  -0.40589838
HT2    -67.34341998   -9.14652775   -9.23125228  -0.35260885  -0.45087260   -9.16089147   -8.31874062   -9.23462378  -0.91092784  -0.35247704  -0.39715137
HT3    -33.81403987   -6.84276162   -6.86207467  -0.30833043  -0.34972502   -6.84876628   -6.13613527   -6.86109544  -0.83654411  -0.30820931  -0.31250771
HT4   -100.48675072  -15.06486429  -15.15944171  -0.60953843  -0.74799927  -15.08084081  -13.64705467  -15.16053221  -1.56520830  -0.60942582  -0.66505801
HT5     -0.66202571   -0.93661325   -0.94758778  -0.05280403  -0.06376943   -0.93844925   -0.82655471   -0.94734348  -0.18173521  -0.05268374  -0.05583425
HT6   -115.43062701  -16.12069154  -16.26278595  -0.63334308  -0.83636862  -16.13730838  -14.66741541  -16.26269688  -1.60091842  -0.63328697  -0.73873228
HT7   -465.60142177  -34.02435741  -34.04949271  -0.99776385  -0.74137994  -34.04382150  -31.26226532  -34.05658175  -2.45739156  -0.99750530  -0.66753653
HT8   -133.61592288  -20.97087951  -21.07515809  -0.86786313  -1.04764460  -20.99132095  -18.97038164  -21.07442417  -2.21759299  -0.86759226  -0.93256357
HT9    -89.87838063  -10.59595616  -10.69009798  -0.37214113  -0.43701005  -10.61814713   -9.65921999  -10.69700780  -0.95283389  -0.37166182  -0.38410024
HT10  -100.23014364  -14.70165425  -14.77760148  -0.56877738  -0.64519836  -14.71776904  -13.28273345  -14.78031056  -1.48095422  -0.56850203  -0.57588042
HT11  -319.02181906  -23.91747525  -23.93602574  -0.68952336  -0.50035909  -23.93104517  -21.98708061  -23.93892482  -1.71029950  -0.68892132  -0.45271271
HT12   -67.08020368   -8.78817001   -8.85515955  -0.31243390  -0.35482929   -8.80051900   -7.96388234   -8.85910847  -0.82575095  -0.31223068  -0.31555266
HT13  -373.19765792  -25.96750632  -25.98984932  -0.71567862  -0.52523465  -25.97939365  -23.92851367  -25.99247668  -1.75415657  -0.71526200  -0.47687335
HT14  -498.88601356  -35.89356701  -36.01970217  -1.00462681  -0.91460253  -35.95390438  -33.07611509  -36.03767107  -2.44690764  -1.00264414  -0.71115750
HT15   -81.65797197  -13.44013551  -13.49910789  -0.54731633  -0.63217471  -13.45262242  -12.10753314  -13.49883875  -1.44200913  -0.54701606  -0.56269059
HT16  -114.78363691  -19.35006013  -19.41673911  -0.80621503  -0.93014628  -19.36515056  -17.43364553  -19.41402501  -2.09479743  -0.80580001  -0.83076983
HT17  -115.03334967  -19.71762866  -19.79228205  -0.84634334  -1.01046166  -19.73203491  -17.78934737  -19.78813823  -2.17835510  -0.84613059  -0.90237070
HT18   -81.90708397  -13.80813313  -13.87499790  -0.58770963  -0.71221005  -13.81963631  -12.46398706  -13.87318179  -1.52574812  -0.58760065  -0.63441419
HT19  -165.20460309  -28.67014614  -28.77878440  -1.23007142  -1.53160789  -28.67395521  -25.86832740  -28.76039016  -3.11168738  -1.22973824  -1.36444019
# 52 molecules for Non bond interactions
NB1    -48.55787059   -7.64879829   -7.68444861  -0.31766090  -0.38688516   -7.65464385   -6.91665446   -7.68487106  -0.81771367  -0.31786028  -0.34862161
NB2    -89.66570665  -10.37777381  -10.44797027  -0.36188702  -0.42757763  -10.39028950   -9.47263467  -10.45431598  -0.90061115  -0.36215188  -0.39027890
NB3    -67.13277907   -8.91196114   -8.97351891  -0.33999269  -0.42544607   -8.92083036   -8.10746711   -8.97642995  -0.85751798  -0.34024648  -0.38430862
NB4   -147.90487850  -21.05267586  -21.19437541  -0.82534458  -1.06491955  -21.06799956  -19.11829291  -21.19083942  -2.05678548  -0.82536177  -0.94617969
NB5   -166.49682278  -22.29720295  -22.46642134  -0.84616253  -1.10729575  -22.31517381  -20.28870228  -22.46458920  -2.09504717  -0.84616985  -0.98366540
NB6    -66.31025990  -11.73005968  -11.76434015  -0.49872839  -0.59369975  -11.73348356  -10.54443704  -11.75894559  -1.29279936  -0.49863583  -0.52858553
NB7   -178.82864334  -19.88327648  -20.07917174  -0.67521737  -0.89107138  -19.89922086  -18.19113476  -20.08185689  -1.65942996  -0.67532031  -0.79173736
NB8   -521.39209578  -37.46742932  -37.57282190  -1.04708622  -0.85618121  -37.49103454  -34.52845683  -37.58317424  -2.51440753  -1.04709628  -0.76895059
NB9    -65.85733156  -10.97037738  -11.02789332  -0.44506059  -0.59229018  -10.97184473   -9.87081826  -11.02159301  -1.15134802  -0.44488457  -0.51720083
NB10   -80.85208700  -12.03273201  -12.12289768  -0.46475498  -0.66157410  -12.03502869  -10.87246841  -12.11648684  -1.18604617  -0.46460833  -0.57560820
NB11  -863.98287899  -54.97130834  -54.99864403  -1.41472026  -0.84635123  -54.99685854  -50.79010931  -55.01265608  -3.36487051  -1.41455648  -0.76329337
NB12  -373.00335422  -25.68822190  -25.69661102  -0.70230177  -0.50121076  -25.69714617  -23.66922487  -25.69857776  -1.70237894  -0.70232641  -0.45818344
NB13  -432.25080761  -27.83649409  -27.83837380  -0.72738965  -0.42982812  -27.85010140  -25.69413583  -27.84679370  -1.74809537  -0.72743871  -0.39085144
NB14  -465.37433527  -33.74079821  -33.75325601  -0.98370749  -0.72679891  -33.75642438  -31.00942575  -33.75867923  -2.39988256  -0.98365014  -0.65736519
NB15  -406.12472859  -31.59758121  -31.61513946  -0.95967298  -0.80034478  -31.60849609  -28.99135058  -31.61427219  -2.35477750  -0.95962308  -0.72696156
NB16  -116.46971434  -12.04533601  -12.09946665  -0.38290764  -0.38990371  -12.06001029  -11.00542552  -12.10858843  -0.94565342  -0.38310732  -0.36291600
NB17  -197.47931999  -33.23479242  -33.34640062  -1.39048059  -1.69784324  -33.23676888  -29.97576989  -33.32462239  -3.49172877  -1.38988397  -1.51577924
NB18   -33.62221703   -6.57880643   -6.58233050  -0.29469696  -0.32680771   -6.58253010   -5.89571839   -6.58122268  -0.78236223  -0.29476748  -0.29528783
NB19    -1.83948821   -1.01888300   -1.02134834  -0.04377087  -0.04017039   -1.02035674   -0.88042122   -1.02205462  -0.15000509  -0.04378062  -0.03731257
NB20  -496.67226702  -30.12529740  -30.11161726  -0.75134017  -0.42676483  -30.14007147  -27.83584358  -30.12261885  -1.79617121  -0.75137478  -0.39249096
NB21   -97.11396909  -15.30095656  -15.37103807  -0.63848347  -0.77890698  -15.31251340  -13.84160449  -15.37139736  -1.63674303  -0.63880479  -0.70161700
NB22  -179.33015384  -20.76177929  -20.90041695  -0.72757974  -0.85803228  -20.78685780  -18.95646994  -20.91268282  -1.80261071  -0.72798567  -0.78314562
NB23  -134.26316794  -17.83114538  -17.95236207  -0.68411320  -0.85545406  -17.84895519  -16.22802518  -17.95776204  -1.71671058  -0.68452050  -0.77259525
NB24  -115.68850845  -16.56830600  -16.66475227  -0.66237508  -0.81956530  -16.58314952  -15.03983364  -16.66751945  -1.67735906  -0.66273284  -0.73907988
NB25  -295.79803160  -42.13082304  -42.40937698  -1.66102953  -2.14157445  -42.15924736  -38.27485023  -42.39961414  -4.11834758  -1.66083716  -1.90409656
NB26  -332.97198765  -44.63230391  -44.96427034  -1.70478952  -2.22224557  -44.66633058  -40.63073228  -44.95778207  -4.19604792  -1.70455865  -1.97632437
NB27  -245.13396538  -31.60562753  -31.84993953  -1.17680309  -1.50499028  -31.62824536  -28.74222532  -31.84258877  -2.95323256  -1.17653583  -1.33098281
NB28  -227.38682441  -27.51344565  -27.76757743  -0.99637428  -1.31666373  -27.54176188  -25.11330517  -27.76631171  -2.47821646  -0.99630536  -1.15904053
NB29  -587.24559130  -48.43411273  -48.60539727  -1.49831167  -1.46919091  -48.46174292  -44.41588521  -48.60837944  -3.66844890  -1.49803795  -1.30253315
NB30  -602.24229258  -49.49951292  -49.69958302  -1.51749287  -1.53793271  -49.52874215  -45.41642686  -49.70383394  -3.70273871  -1.51724838  -1.35943805
NB31  -912.54592352  -62.60892150  -62.68331249  -1.73785920  -1.26107094  -62.64323165  -57.71755194  -62.69649634  -4.18464066  -1.73777044  -1.13137118
NB32  -588.52571897  -46.37578833  -46.54919988  -1.39297484  -1.30169439  -46.41139887  -42.65026210  -46.56191056  -3.37413361  -1.39310491  -1.16731138
NB33  -569.94793921  -45.11233207  -45.27289611  -1.37439530  -1.29321412  -45.14441510  -41.47858624  -45.28191146  -3.33664568  -1.37447259  -1.15506598
NB34  -746.00505539  -51.37712236  -51.39368888  -1.40707406  -1.00855223  -51.39504838  -47.34421879  -51.39724184  -3.40588349  -1.40706346  -0.92149802
NB35  -864.49935937  -55.67481871  -55.67818031  -1.45765928  -0.86562086  -55.70214451  -51.39558260  -55.69465332  -3.49742210  -1.45768599  -0.78679291
NB36  -805.25258620  -53.52610468  -53.53757792  -1.43346306  -0.94000923  -53.54892398  -49.37368937  -53.54738695  -3.45222225  -1.43346101  -0.85659216
NB37  -897.62205610  -61.57980408  -61.59339666  -1.71570582  -1.16714650  -61.60920893  -56.71486190  -61.60664855  -4.14986370  -1.71560271  -1.05710342
NB38  -486.97451840  -43.63429177  -43.74019820  -1.42806531  -1.46818378  -43.64719942  -39.87322961  -43.73221945  -3.54240734  -1.42778578  -1.30820977
NB39  -838.37272059  -59.43620194  -59.45700718  -1.69251097  -1.24448560  -59.46105450  -54.70035254  -59.46372354  -4.10528737  -1.69241423  -1.12984622
NB40  -313.94686932  -45.28188196  -45.44572708  -1.77516806  -2.09052434  -45.29815096  -40.98427326  -45.43269625  -4.43796533  -1.77472465  -1.88119011
NB41  -150.09126573  -18.62483027  -18.68169269  -0.67824253  -0.71745877  -18.64301261  -16.90214108  -18.68953469  -1.72822712  -0.67846838  -0.65890629
NB42  -498.51252890  -31.14323158  -31.13193393  -0.79538593  -0.46719642  -31.15962747  -28.71604120  -31.14374069  -1.94620519  -0.79541421  -0.43002850
NB43  -118.30964341  -13.06370183  -13.12014911  -0.42692983  -0.43022501  -13.07990646  -11.88574935  -13.13002257  -1.09568490  -0.42711797  -0.40036979
NB44  -232.93906605  -24.09107020  -24.19881272  -0.76629840  -0.78016238  -24.12029793  -22.01145318  -24.21697217  -1.89142872  -0.76664854  -0.72617452
NB45  -613.14128244  -42.17124232  -42.21107092  -1.13482846  -0.81726644  -42.20050692  -38.84221321  -42.23104762  -2.74201199  -1.13501963  -0.75597168
NB46   -67.24134354  -13.15971097  -13.16484082  -0.59098729  -0.65639031  -13.16658049  -11.79470631  -13.16207471  -1.56537054  -0.59107586  -0.59303578
NB47  -131.71258269  -21.94303286  -22.05612233  -0.89201091  -1.18766262  -21.94565192  -19.74589882  -22.04308248  -2.30350717  -0.89161343  -1.03722391
NB48  -132.61453095  -23.46441906  -23.52950887  -1.00090848  -1.19412320  -23.47054228  -21.09664392  -23.51791981  -2.58699629  -1.00064986  -1.06307478
NB49  -394.90203150  -66.52321131  -66.73766850  -2.78678976  -3.40779915  -66.52653665  -60.00537509  -66.69361569  -6.98813276  -2.78556645  -3.04334892
NB50  -394.90248436  -66.52690683  -66.73982736  -2.78740819  -3.40108265  -66.53057280  -60.00850568  -66.69605302  -6.98824561  -2.78617632  -3.03791852
NB51  -394.90102838  -66.52500930  -66.73789311  -2.78799924  -3.41053980  -66.52830717  -60.00828703  -66.69368585  -6.98855684  -2.78678157  -3.04597001
NB52  -197.45554480  -33.25971034  -33.36844315  -1.39168550  -1.69381457  -33.26188929  -29.99852352  -33.34699358  -3.49320168  -1.39109316  -1.51300010

