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
"================================ Total(330) ================================"
"There are about :                                                           " 
" 1)  223 HOFs from the G3 set                                               "
" 5)   76 Barrier Heights from Trulhar's set                                 "
" 6)   31 Non Bonding interactions from NCIE set                             "

__initial guess__ ::
# For XYG3
#0.773066, 0.226934, 0.0000, 0.50626, 0.275376, 0.0000, 0.0000, 0.426352, 0.0000
# For XYGJOS
#0.773066, 0.50626, 0.275376, 0.426352
# For XYGJOSD
0.773066, 0.50626, 0.275376, 0.426352, 1.0

# "There are several algorithms at present:                                  "
# "   0) batch           :: just batch the results based on intital guess    "
# "   1) leastsq         :: least square fit algorithm                       "
# "   2) fmin_rms        :: downhill simplex algorithm based on RMS          "
# "   3) fmin_mad        :: downhill simplex algorithm based on MAD          "
# "   4) fmin_cobyla_rms :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on RMS                            "
# "   5) fmin_cobyla_mad :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on MAD                            "
__optimization algorithm__ :: leastsq

__optimization job__ :: xyg3

__optimization function__ :: 25
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    #a1, a2, a3, a4, a5, a6, a7, a8, a9 = C                            # for XYG3RI
    a1, a4, a5, a8 = C                                                 # for XYGJOS
    a1, a4, a5, a8, a10 = C                                            # for XYGJOSD
    a2  = 1. - a1
    a3  = 0.
    a6  = 0.
    a7  = 0.
    a9  = 0.

    E_noXC, Ex_HF, Ex_LDA, dEx_B, Ec_VWN, dEc_LYP, Ec_PT21, aaaa, abab, bbbb,disp = P
    return E_noXC + a1*Ex_HF + a2*Ex_LDA + a3*dEx_B + a4*Ec_VWN + a5* dEc_LYP \
            + a6*Ec_PT21 + a7*aaaa + a8*abab + a9*bbbb + a10*disp

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
#               378 = 17+223+31+15+21+19+52 is the total number of jobs in this batch list
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
#              330 = 223+38+38+31 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 330  1.0
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
# "223 HOFs in the G3 set"
 3         G2-1    -1   Li_0  1  H_0  1                   0.092431429   1.0
 3         G2-2    -1   Be_0  1  H_0  1                   0.079565579   1.0
 3         G2-3    -1    C_0  1  H_0  1                   0.133832051   1.0
 3         G2-4    -1    C_0  1  H_0  2                   0.303489881   1.0
 3         G2-5    -1    C_0  1  H_0  2                   0.288318604   1.0
 3         G2-6    -1    C_0  1  H_0  3                   0.490112846   1.0
 3         G2-7    -1    C_0  1  H_0  4                   0.669743767   1.0
 3         G2-8    -1    N_0  1  H_0  1                   0.133158773   1.0
 3         G2-9    -1    N_0  1  H_0  2                   0.289624975   1.0
 3         G2-10   -1    N_0  1  H_0  3                   0.474848315   1.0
 3         G2-11   -1    O_0  1  H_0  1                   0.170008244   1.0
 3         G2-12   -1    O_0  1  H_0  2                   0.371001167   1.0
 3         G2-13   -1    F_0  1  H_0  1                   0.225382874   1.0
 3         G2-14   -1   Si_0  1  H_0  2                   0.242074834   1.0
 3         G2-15   -1   Si_0  1  H_0  2                   0.208950516   1.0
 3         G2-16   -1   Si_0  1  H_0  3                   0.359824453   1.0
 3         G2-17   -1   Si_0  1  H_0  4                   0.513626911   1.0
 3         G2-18   -1    P_0  1  H_0  2                   0.243697425   1.0
 3         G2-19   -1    P_0  1  H_0  3                   0.385516536   1.0
 3         G2-20   -1    S_0  1  H_0  2                   0.291652991   1.0
 3         G2-21   -1   Cl_0  1  H_0  1                   0.170902737   1.0
 2         G2-22   -1   Li_0  2                           0.038835444   1.0
 3         G2-23   -1   Li_0  1  F_0  1                   0.219897714   1.0
 3         G2-24   -1    C_0  2  H_0  2                   0.646519438   1.0
 3         G2-25   -1    C_0  2  H_0  4                   0.898163455   1.0
 3         G2-26   -1    C_0  2  H_0  6                   1.135131920   1.0
 3         G2-27   -1    C_0  1  N_0  1                   0.289238307   1.0
 4         G2-28   -1    H_0  1  C_0  1  N_0  1           0.498584465   1.0
 3         G2-29   -1    C_0  1  O_0  1                   0.413687450   1.0
 4         G2-30   -1    H_0  1  C_0  1  O_0  1           0.444661297   1.0
 4         G2-31   -1    H_0  2  C_0  1  O_0  1           0.596066357   1.0
 4         G2-32   -1    H_0  4  C_0  1  O_0  1           0.817217261   1.0
 2         G2-33   -1    N_0  2                           0.364103096   1.0
 3         G2-34   -1    N_0  2  H_0  4                   0.698451408   1.0
 3         G2-35   -1    N_0  1  O_0  1                   0.243751675   1.0
 2         G2-36   -1    O_0  2                           0.192463859   1.0
 3         G2-37   -1    H_0  2  O_0  2                   0.428912741   1.0
 2         G2-38   -1    F_0  2                           0.062484301   1.0
 3         G2-39   -1    C_0  1  O_0  2                   0.621124369   1.0
 2         G2-40   -1   Na_0  2                           0.027140969   1.0
 2         G2-41   -1   Si_0  2                           0.120445838   1.0
 2         G2-42   -1    P_0  2                           0.186810827   1.0
 2         G2-43   -1    S_0  2                           0.163735925   1.0
 2         G2-44   -1   Cl_0  2                           0.095020927   1.0
 3         G2-45   -1   Na_0  1 Cl_0  1                   0.157521553   1.0
 3         G2-46   -1   Si_0  1  O_0  1                   0.307488859   1.0
 3         G2-47   -1    S_0  1  C_0  1                   0.274089273   1.0
 3         G2-48   -1    S_0  1  O_0  1                   0.200553100   1.0
 3         G2-49   -1   Cl_0  1  O_0  1                   0.104573930   1.0
 3         G2-50   -1    F_0  1 Cl_0  1                   0.099778551   1.0
 3         G2-51   -1   Si_0  2  H_0  6                   0.846414199   1.0
 4         G2-52   -1    C_0  1  H_0  3 Cl_0  1           0.630045570   1.0
 4         G2-53   -1    H_0  4  C_0  1  S_0  1           0.755736298   1.0
 4         G2-54   -1    H_0  1  O_0  1 Cl_0  1           0.263767854   1.0
 3         G2-55   -1    S_0  1  O_0  2                   0.413237686   1.0
 3         G2-56   -1    F_0  3  B_0  1                   0.751165928   1.0
 3         G2-57   -1   Cl_0  3  B_0  1                   0.518300332   1.0
 3         G2-58   -1    F_0  3 Al_0  1                   0.682136256   1.0
 3         G2-59   -1   Cl_0  3 Al_0  1                   0.492378218   1.0
 3         G2-60   -1    F_0  4  C_0  1                   0.761286255   1.0
 3         G2-61   -1   Cl_0  4  C_0  1                   0.503505178   1.0
 4         G2-62   -1    C_0  1  O_0  1  S_0  1           0.532851447   1.0
 3         G2-63   -1    C_0  1  S_0  2                   0.444714252   1.0
 4         G2-64   -1    C_0  1  F_0  2  O_0  1           0.675960405   1.0
 3         G2-65   -1    F_0  4 Si_0  1                   0.916346424   1.0
 3         G2-66   -1   Cl_0  4 Si_0  1                   0.616905549   1.0
 3         G2-67   -1    N_0  2  O_0  1                   0.431523876   1.0
 4         G2-68   -1   Cl_0  1  N_0  1  O_0  1           0.306601893   1.0
 3         G2-69   -1    F_0  3  N_0  1                   0.327854738   1.0
 3         G2-70   -1    F_0  3  P_0  1                   0.581708965   1.0
 2         G2-71   -1    O_0  3                           0.235034654   1.0
 3         G2-72   -1    F_0  2  O_0  1                   0.149678568   1.0
 3         G2-73   -1    F_0  3 Cl_0  1                   0.202897915   1.0
 3         G2-74   -1    F_0  4  C_0  2                   0.933103732   1.0
 3         G2-75   -1   Cl_0  4  C_0  2                   0.749105429   1.0
 4         G2-76   -1    F_0  3  C_0  2  N_0  1           1.021196719   1.0
 3         G2-77   -1    H_0  4  C_0  3                   1.123644274   1.0
 3         G2-78   -1    H_0  4  C_0  3                   1.121114981   1.0
 3         G2-79   -1    H_0  4  C_0  3                   1.088681275   1.0
 3         G2-80   -1    H_0  6  C_0  3                   1.371676460   1.0
 3         G2-81   -1    H_0  6  C_0  3                   1.359959349   1.0
 3         G2-82   -1    H_0  8  C_0  3                   1.604217079   1.0
 3         G2-83   -1    H_0  6  C_0  4                   1.614046843   1.0
 3         G2-84   -1    H_0  6  C_0  4                   1.600416601   1.0
 3         G2-85   -1    H_0  6  C_0  4                   1.579229110   1.0
 3         G2-86   -1    H_0  6  C_0  4                   1.573484846   1.0
 3         G2-87   -1    H_0  6  C_0  4                   1.596779339   1.0
 3         G2-88   -1    H_0  8  C_0  4                   1.831024812   1.0
 3         G2-89   -1    H_0  8  C_0  4                   1.846531077   1.0
 3         G2-90   -1    H_0 10  C_0  4                   2.073430514   1.0
 3         G2-91   -1    H_0 10  C_0  4                   2.076197289   1.0
 3         G2-92   -1    H_0  8  C_0  5                   2.046869007   1.0
 3         G2-93   -1    H_0  6  C_0  6                   2.180328605   1.0
 4         G2-94   -1    H_0  2  F_0  2  C_0  1           0.696720736   1.0
 4         G2-95   -1    H_0  1  F_0  3  C_0  1           0.731330144   1.0
 4         G2-96   -1    H_0  2 Cl_0  2  C_0  1           0.591989779   1.0
 4         G2-97   -1    H_0  1 Cl_0  3  C_0  1           0.550900176   1.0
 4         G2-98   -1    H_0  5  C_0  1  N_0  1           0.927808938   1.0
 4         G2-99   -1    H_0  3  C_0  2  N_0  1           0.981388115   1.0
 5         G2-100  -1    H_0  3  C_0  1  N_0  1  O_0  2   0.958463411   1.0
 5         G2-101  -1    H_0  3  C_0  1  N_0  1  O_0  2   0.954121485   1.0
 4         G2-102  -1    H_0  6  C_0  1 Si_0  1           1.000284678   1.0
 4         G2-103  -1    H_0  2  C_0  1  O_0  2           0.799099057   1.0
 4         G2-104  -1    H_0  4  C_0  2  O_0  2           1.251333707   1.0
 5         G2-105  -1    H_0  5  C_0  2  N_0  1  O_0  1   1.383271654   1.0
 4         G2-106  -1    H_0  5  C_0  2  N_0  1           1.147446093   1.0
 3         G2-107  -1    N_0  2  C_0  2                   0.800728997   1.0
 4         G2-108  -1    H_0  7  C_0  2  N_0  1           1.386833567   1.0
 4         G2-109  -1    H_0  7  C_0  2  N_0  1           1.398166268   1.0
 4         G2-110  -1    H_0  2  C_0  2  O_0  1           0.849063305   1.0
 4         G2-111  -1    H_0  4  C_0  2  O_0  1           1.037196016   1.0
 4         G2-112  -1    H_0  4  C_0  2  O_0  1           1.079269419   1.0
 4         G2-113  -1    H_0  2  C_0  2  O_0  2           1.010360857   1.0
 4         G2-114  -1    H_0  6  C_0  2  O_0  1           1.291393693   1.0
 4         G2-115  -1    H_0  6  C_0  2  O_0  1           1.271712033   1.0
 4         G2-116  -1    H_0  4  C_0  2  S_0  1           0.994960952   1.0
 5         G2-117  -1    H_0  6  C_0  2  S_0  1  O_0  1   1.363982988   1.0
 4         G2-118  -1    H_0  6  C_0  2  S_0  1           1.226027090   1.0
 4         G2-119  -1    H_0  6  C_0  2  S_0  1           1.223503453   1.0
 4         G2-120  -1    H_0  3  C_0  2  F_0  1           0.912289487   1.0
 4         G2-121  -1    H_0  5  C_0  2 Cl_0  1           1.102886348   1.0
 4         G2-122  -1    H_0  3  C_0  2 Cl_0  1           0.860701230   1.0
 4         G2-123  -1    H_0  3  C_0  3  N_0  1           1.217831545   1.0
 4         G2-124  -1    H_0  6  C_0  3  O_0  1           1.559818211   1.0
 4         G2-125  -1    H_0  4  C_0  2  O_0  2           1.280444884   1.0
 5         G2-126  -1    H_0  3  C_0  2  O_0  1  F_0  1   1.126265942   1.0
 5         G2-127  -1    H_0  3  C_0  2  O_0  1 Cl_0  1   1.065623554   1.0
 4         G2-128  -1    H_0  7  C_0  3 Cl_0  1           1.571696232   1.0
 4         G2-129  -1    H_0  8  C_0  3  O_0  1           1.766359287   1.0
 4         G2-130  -1    H_0  8  C_0  3  O_0  1           1.745104809   1.0
 4         G2-131  -1    H_0  9  C_0  3  N_0  1           1.849245384   1.0
 4         G2-132  -1    H_0  4  C_0  4  O_0  1           1.584618816   1.0
 4         G2-133  -1    H_0  4  C_0  4  S_0  1           1.535855759   1.0
 4         G2-134  -1    H_0  5  C_0  4  N_0  1           1.708378761   1.0
 4         G2-135  -1    H_0  5  C_0  5  N_0  1           1.973170682   1.0
 2         G2-136  -1    H_0  2                           0.174664549   1.0
 3         G2-137  -1    H_0  1  S_0  1                   0.139370184   1.0
 3         G2-138  -1    H_0  1  C_0  2                   0.422965873   1.0
 3         G2-139  -1    H_0  3  C_0  2                   0.709174745   1.0
 4         G2-140  -1    H_0  3  C_0  2  O_0  1           0.927079159   1.0
 4         G2-141  -1    H_0  3  C_0  1  O_0  1           0.652942714   1.0
 4         G2-142  -1    H_0  3  C_0  1  O_0  1           0.638542111   1.0
 4         G2-143  -1    H_0  5  C_0  2  O_0  1           1.110805154   1.0
 4         G2-144  -1    H_0  3  C_0  1  S_0  1           0.608042032   1.0
 3         G2-145  -1    H_0  5  C_0  2                   0.961716219   1.0
 3         G2-146  -1    H_0  7  C_0  3                   1.434904820   1.0
 3         G2-147  -1    H_0  9  C_0  4                   1.910693901   1.0
 3         G2-148  -1    N_0  1  O_0  2                   0.363069330   1.0
 3         G2-149  -1    H_0  6  C_0  4                   1.593299551   1.0
 3         G2-150  -1    H_0  8  C_0  5                   2.088306334   1.0
 3         G2-151  -1    H_0 10  C_0  5                   2.333424213   1.0
 3         G2-152  -1    H_0 12  C_0  5                   2.542895550   1.0
 3         G2-153  -1    H_0 12  C_0  5                   2.550020678   1.0
 3         G2-154  -1    H_0  8  C_0  6                   2.355020105   1.0
 3         G2-155  -1    H_0  8  C_0  6                   2.355476063   1.0
 3         G2-156  -1    H_0 12  C_0  6                   2.812753231   1.0
 3         G2-157  -1    H_0 14  C_0  6                   3.011784741   1.0
 3         G2-158  -1    H_0 14  C_0  6                   3.013271091   1.0
 3         G2-159  -1    H_0  8  C_0  7                   2.653320908   1.0
 3         G2-160  -1    H_0 16  C_0  7                   3.481102578   1.0
 3         G2-161  -1    H_0  8  C_0  8                   2.835694299   1.0
 3         G2-162  -1    H_0 18  C_0  8                   3.950312043   1.0
 3         G2-163  -1    H_0  8  C_0 10                   3.446925051   1.0
 3         G2-164  -1    H_0  8  C_0 10                   3.393177041   1.0
 4         G2-165  -1    H_0  6  C_0  3  O_0  2           1.733396385   1.0
 4         G2-166  -1    H_0 10  C_0  4  O_0  1           2.241771253   1.0
 4         G2-167  -1    H_0  7  C_0  6  N_0  1           2.454809286   1.0
 4         G2-168  -1    H_0  6  C_0  6  O_0  1           2.346504025   1.0
 4         G2-169  -1    H_0  6  C_0  4  O_0  1           1.759053000   1.0
 4         G2-170  -1    H_0  8  C_0  4  O_0  1           2.011276077   1.0
 4         G2-171  -1    H_0  8  C_0  5  O_0  1           2.290025101   1.0
 4         G2-172  -1    H_0  4  C_0  6  O_0  2           2.269540898   1.0
 4         G2-173  -1    H_0  4  C_0  4  N_0  2           1.766857316   1.0
 5         G2-174  -1    H_0  6  C_0  2  O_0  2  S_0  1   1.547473758   1.0
 4         G2-175  -1    H_0  5  C_0  6 Cl_0  1           2.148340900   1.0                                             
 4         G2-176  -1    H_0  4  C_0  4  N_0  2           1.760062397   1.0
 4         G2-177  -1    H_0  4  C_0  4  N_0  2           1.766503642   1.0
 4         G2-178  -1    H_0  4  C_0  4  O_0  1           1.543808123   1.0
 4         G2-179  -1    H_0  6  C_0  4  O_0  1           1.792303201   1.0
 4         G2-180  -1    H_0  6  C_0  4  O_0  3           2.168296415   1.0
 4         G2-181  -1    H_0  6  C_0  4  S_0  1           1.730933183   1.0
 4         G2-182  -1    H_0  7  C_0  4  N_0  1           1.923636830   1.0
 4         G2-183  -1    H_0  8  C_0  4  O_0  1           2.029481697   1.0
 4         G2-184  -1    H_0  8  C_0  4  O_0  1           2.020746838   1.0
 4         G2-185  -1    H_0  8  C_0  4  O_0  2           2.159904956   1.0
 4         G2-186  -1    H_0  8  C_0  4  S_0  1           1.962778859   1.0
 4         G2-187  -1    H_0  9  C_0  4 Cl_0  1           2.050734860   1.0
 4         G2-188  -1    H_0  9  C_0  4 Cl_0  1           2.041822713   1.0
 4         G2-189  -1    H_0  9  C_0  4  N_0  1           2.120845446   1.0
 5         G2-190  -1    H_0  9  C_0  4  N_0  1  O_0  2   2.375913033   1.0
 4         G2-191  -1    H_0 10  C_0  4  O_0  1           2.219926760   1.0
 4         G2-192  -1    H_0 10  C_0  4  O_0  2           2.370492890   1.0
 4         G2-193  -1    H_0 10  C_0  4  S_0  1           2.171350900   1.0
 4         G2-194  -1    H_0 10  C_0  4  S_0  2           2.267868677   1.0
 4         G2-195  -1    H_0 11  C_0  4  N_0  1           2.347083590   1.0
 4         G2-196  -1    H_0 12  C_0  4 Si_0  1           2.463706213   1.0
 4         G2-197  -1    H_0  6  C_0  5  S_0  1           2.008730166   1.0                                                
 4         G2-198  -1    H_0  7  C_0  5  N_0  1           2.171187695   1.0
 4         G2-199  -1    H_0 10  C_0  5  O_0  1           2.487797227   1.0
 4         G2-200  -1    H_0 10  C_0  5  O_0  1           2.498069938   1.0
 4         G2-201  -1    H_0 10  C_0  5  O_0  2           2.681757750   1.0
 4         G2-202  -1    H_0 10  C_0  5  S_0  1           2.435146202   1.0
 4         G2-203  -1    H_0 11  C_0  5  N_0  1           2.598925075   1.0
 4         G2-204  -1    H_0 12  C_0  5  O_0  1           2.691838987   1.0
 4         G2-205  -1    H_0  4  C_0  6  F_0  2           2.210591390   1.0
 4         G2-206  -1    H_0  4  C_0  6  F_0  2           2.209594121   1.0
 4         G2-207  -1    H_0  5  C_0  6  F_0  1           2.196436942   1.0
 4         G2-208  -1    H_0 14  C_0  6  O_0  1           3.166737650   1.0
 3         G2-209  -1    F_0  5  P_0  1                   0.890351106   1.0
 3         G2-210  -1    F_0  6  S_0  1                   0.766091741   1.0
 2         G2-211  -1    P_0  4                           0.461630560   1.0
 3         G2-212  -1    O_0  3  S_0  1                   0.549280615   1.0
 3         G2-213  -1   Cl_0  2  S_0  1                   0.208352183   1.0
 4         G2-214  -1   Cl_0  3  P_0  1  O_0  1           0.575781014   1.0
 3         G2-215  -1   Cl_0  5  P_0  1                   0.498483255   1.0
 4         G2-216  -1   Cl_0  2  O_0  2  S_0  1           0.532837188   1.0
 3         G2-217  -1   Cl_0  3  P_0  1                   0.374366003   1.0
 3         G2-218  -1   Cl_0  2  S_0  2                   0.315097336   1.0
 3         G2-219  -1   Cl_0  2 Si_0  1                   0.331339243   1.0
 4         G2-220  -1    F_0  3 Cl_0  1  C_0  1           0.691190585   1.0
 3         G2-221  -1    F_0  6  C_0  2                   1.260208535   1.0
 3         G2-222  -1    F_0  3  C_0  1                   0.549528478   1.0
 3         G2-223  -1    H_0  5  C_0  6                   1.988882735   1.0
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

#               378 = 17+223+31+15+21+19+52 is the total number of jobs in this batch list
__xyg3 components__ ::  378
#        E_noXC        E_K           Ex_LDA       dEx_Becke    Ec_VWN       dEc_LYP     PT2_1ST      PT2_aaaa     PT2_abab     PT2_bbbb
# 17 atoms
   H_0 -0.19120611 -0.30821898 -0.26483429 -0.04163631 -0.03979739 0.03979739 -0.00038878 0 0 0 0
  He_0 -1.84240054 -1.01649221 -0.87763047 -0.14148003 -0.14969531 0.10595107 -0.00113251 0 -0.0374955 0 0
  Li_0 -5.65066624 -1.78065765 -1.53861168 -0.23727194 -0.20630448 0.15246209 -0.00072862 -0.0003978 -0.03620243 0 0
  Be_0 -11.90161367 -2.66925722 -2.31662728 -0.34548651 -0.29865864 0.20353283 -0.00115219 -0.00056396 -0.09210284 -0.00056396 0
   B_0 -20.76330098 -3.76523119 -3.29760179 -0.46332109 -0.38254426 0.25664887 -0.00247694 -0.00644491 -0.10892006 -0.00067706 0
   C_0 -32.62137437 -5.06547527 -4.48380112 -0.58018981 -0.47031186 0.31115067 -0.00335243 -0.02057471 -0.12141319 -0.00072869 0
   N_0 -47.8067635 -6.58844445 -5.89213331 -0.69500165 -0.5602118 0.36781507 -0.00373636 -0.04360432 -0.12975644 -0.00076501 0
   O_0 -66.6149221 -8.18893666 -7.37011637 -0.83765675 -0.68765629 0.43017794 -0.00551802 -0.04538345 -0.18310823 -0.00756734 0
   F_0 -89.3889071 -10.00641197 -9.06942604 -0.97343214 -0.81668282 0.49540208 -0.00688315 -0.04707126 -0.23597065 -0.02358329 0
  Ne_0 -116.45861731 -12.06115025 -11.00696825 -1.10336478 -0.94568153 0.56258287 -0.00778558 -0.04864921 -0.28681273 -0.04864921 0
  Na_0 -147.84526783 -13.99419247 -12.77641624 -1.24324915 -1.0247219 0.61521097 -0.00680654 -0.0441197 -0.22589274 -0.04082458 0
  Mg_0 -183.62238884 -15.97784046 -14.61034606 -1.38721444 -1.13134066 0.67050079 -0.00661808 -0.04233917 -0.26323356 -0.04233917 0
  Al_0 -223.79423137 -18.07220501 -16.54923516 -1.53467067 -1.22396861 0.72872604 -0.0076577 -0.04993405 -0.28393329 -0.04459851 0
  Si_0 -268.56216241 -20.28182611 -18.60597094 -1.68085391 -1.31968336 0.7885078 -0.00829307 -0.06356023 -0.30512838 -0.04568955 0
   P_0 -318.07908139 -22.62528258 -20.79316977 -1.82692192 -1.41715427 0.84979107 -0.00727322 -0.08359643 -0.32268594 -0.04584095 0
   S_0 -372.48765908 -25.00763831 -23.01854245 -1.983317 -1.54305555 0.91316046 -0.00918706 -0.08533035 -0.3677579 -0.05265933 0
  Cl_0 -431.9528697 -27.51673591 -25.37185041 -2.13691877 -1.66967394 0.9784022 -0.00959541 -0.08667092 -0.41161172 -0.06652896 0
# 223 molecules in G3 set
  G2-1 -5.84909896 -2.13540694 -1.84886325 -0.28369946 -0.29087432 0.20232552 -0.00171141 -0.00032382 -0.07630595 -0.00032382 -0.00091674
  G2-2 -12.07377137 -3.0752625 -2.67648384 -0.3883299 -0.35901742 0.25042506 -0.00302274 -0.003317 -0.0834782 -0.00040586 -0.00000442
  G2-3 -32.86605146 -5.40897595 -4.80015337 -0.61514264 -0.5543184 0.35731397 -0.00537754 -0.01927304 -0.16847121 -0.00555181 -0.00000187
  G2-4 -33.07798712 -5.85197249 -5.21642591 -0.63391283 -0.61415596 0.40000857 -0.00642723 -0.03777986 -0.16732392 -0.0041621 -0.00040586
  G2-5 -33.10991146 -5.77539996 -5.14268101 -0.6408281 -0.63495664 0.40227403 -0.00629751 -0.01671983 -0.21134028 -0.01671983 -0.00011373
  G2-6 -33.35835145 -6.21166382 -5.54798765 -0.66256623 -0.70131827 0.44373905 -0.00681529 -0.03406342 -0.21548978 -0.01278886 -0.00080526
  G2-7 -33.62574391 -6.57944248 -5.89333676 -0.68555945 -0.78215978 0.48756908 -0.00787271 -0.0282408 -0.25904967 -0.0282408 -0.00101109
  G2-8 -48.05739658 -6.91606991 -6.20231517 -0.72980537 -0.64962675 0.41292834 -0.0064357 -0.04397522 -0.18545299 -0.00613277 -0.00000152
  G2-9 -48.30764191 -7.27038105 -6.54337553 -0.75322611 -0.73557176 0.45690209 -0.00745789 -0.04262556 -0.24024528 -0.01910517 -0.00005988
 G2-10 -48.55672034 -7.65377749 -6.916364 -0.76849569 -0.81766949 0.49993381 -0.00795865 -0.03961757 -0.29063432 -0.03961757 -0.00019248
 G2-11 -66.8726526 -8.53796664 -7.72154912 -0.8578095 -0.77462602 0.47437962 -0.00742107 -0.04747265 -0.24792491 -0.0231441 -0.00000118
 G2-12 -67.12730965 -8.92180825 -8.10875994 -0.86921538 -0.85754644 0.51733627 -0.0082548 -0.04774582 -0.31028937 -0.04774582 -0.0000357
 G2-13 -89.65572749 -10.39247669 -9.47502114 -0.98200055 -0.90066049 0.53851088 -0.00847079 -0.05079921 -0.30929957 -0.05079921 -0.0000013
 G2-14 -269.0407096 -20.97601009 -19.22773027 -1.75104881 -1.47789142 0.87991001 -0.01158173 -0.05599988 -0.37664902 -0.05599988 -0.00043436
 G2-15 -268.99761306 -21.01036678 -19.25933116 -1.74723874 -1.45764509 0.8786059 -0.01313833 -0.07070381 -0.34011981 -0.04671931 -0.00020014
 G2-16 -269.25389415 -21.37179829 -19.57598699 -1.78444159 -1.54002954 0.92397373 -0.01346872 -0.06456407 -0.3748177 -0.05130703 -0.00075114
 G2-17 -269.50615903 -21.74075636 -19.90068906 -1.8199905 -1.61965083 0.9697593 -0.01380524 -0.05826815 -0.40755936 -0.05826815 -0.00158502
 G2-18 -318.57712015 -23.29529552 -21.40240969 -1.89073191 -1.58095103 0.93853171 -0.01200871 -0.07524342 -0.39720024 -0.05750313 -0.0004491
 G2-19 -318.82530903 -23.64791249 -21.72613862 -1.91784776 -1.65896394 0.98261942 -0.01289698 -0.06952506 -0.43444364 -0.06952506 -0.00135796
 G2-20 -373.00470321 -25.69477361 -23.66612017 -2.02959999 -1.70222416 1.00003758 -0.01128473 -0.07859451 -0.44958099 -0.07859451 -0.00035728
 G2-21 -432.22280743 -27.86907635 -25.71276672 -2.15416767 -1.74838074 1.02118558 -0.00981531 -0.0846093 -0.45557281 -0.0846093 -0.00000247
 G2-22 -11.31019344 -3.55774448 -3.07896341 -0.4708116 -0.44033346 0.30625974 -0.00249508 -0.00056178 -0.1148499 -0.00056178 -0.00151064
 G2-23 -95.0280236 -11.93966863 -10.82542588 -1.18544735 -1.07005183 0.65261938 -0.01315704 -0.05627057 -0.35850062 -0.05627057 -0.00015779
 G2-24 -65.84749049 -10.98895769 -9.88550413 -1.15136262 -1.15216485 0.70684242 -0.01413784 -0.05950422 -0.43493506 -0.05950422 -0.00053237
 G2-25 -66.30878129 -11.74001208 -10.55065161 -1.21466128 -1.29309633 0.79430245 -0.01532717 -0.05638379 -0.4554056 -0.05638379 -0.00155049
 G2-26 -66.75553014 -12.48786256 -11.21270761 -1.27665954 -1.43403377 0.88187103 -0.01559213 -0.05790808 -0.48398815 -0.05790808 -0.00332704
 G2-27 -80.58330236 -11.61568984 -10.50431897 -1.21919603 -1.10435382 0.67656911 -0.02346376 -0.07470013 -0.47999655 -0.07930464 -0.00000166
 G2-28 -80.84660978 -12.04666946 -10.88268947 -1.24440608 -1.18652265 0.72164996 -0.01544788 -0.07023883 -0.4729928 -0.07023883 -0.0002452
 G2-29 -99.45580605 -13.30701525 -12.05216377 -1.34867445 -1.224106 0.7391211 -0.0170578 -0.07344698 -0.47459654 -0.07344698 -0.00000136
 G2-30 -99.60619123 -13.66653137 -12.38727175 -1.3778159 -1.28859368 0.78036811 -0.02012754 -0.0750344 -0.48574249 -0.07772468 -0.0001166
 G2-31 -99.83193117 -14.06148452 -12.74151855 -1.4074823 -1.36712844 0.82631428 -0.01935004 -0.07502174 -0.51237296 -0.07502174 -0.00048961
 G2-32 -100.25109457 -14.82023109 -13.41654613 -1.46465645 -1.50852066 0.91219625 -0.01766304 -0.07535006 -0.53401075 -0.07535006 -0.00168439
 G2-33 -95.86237529 -13.10496033 -11.87270156 -1.33571801 -1.2199034 0.73598945 -0.01537653 -0.07845635 -0.49899433 -0.07845635 -0.00000143
 G2-34 -96.59874901 -14.6087268 -13.23422688 -1.44541617 -1.50354714 0.90679338 -0.01686516 -0.07875541 -0.54810702 -0.07875541 -0.00146598
 G2-35 -114.57439118 -14.70112817 -13.35980908 -1.46907476 -1.3223565 0.79450011 -0.01938099 -0.08207797 -0.51998233 -0.09005856 -0.0000014
 G2-36 -133.33691072 -16.31489543 -14.86829463 -1.59862549 -1.42415232 0.85232105 -0.01980528 -0.08746763 -0.52478551 -0.12330679 -0.00000143
 G2-37 -133.75576192 -17.05876586 -15.54537173 -1.65638006 -1.57844873 0.94188697 -0.01917177 -0.09419242 -0.60759643 -0.09419242 -0.00038549
 G2-38 -178.80766634 -19.92024379 -18.20868343 -1.88953304 -1.66026481 0.98414383 -0.01959527 -0.09817284 -0.62779675 -0.09817284 -0.00000398
 G2-39 -166.08702294 -21.58779122 -19.64501807 -2.11802857 -1.95609563 1.16447567 -0.03451619 -0.13093167 -0.76923951 -0.13093167 -0.00011188
 G2-40 -295.70227291 -27.97411601 -25.5513185 -2.48051355 -2.07305108 1.22923394 -0.01541269 -0.08607102 -0.49217653 -0.08607102 -0.0028939
 G2-41 -537.20429015 -40.52074129 -37.24614486 -3.32682654 -2.67362487 1.57392579 -0.02230326 -0.15389776 -0.70614327 -0.11124826 -0.00002947
 G2-42 -636.28235003 -45.18070167 -41.62039889 -3.6085787 -2.91218405 1.69680866 -0.02258055 -0.15421146 -0.81364977 -0.15421146 -0.00000893
 G2-43 -745.05189579 -50.01354652 -46.13863809 -3.9118689 -3.12738773 1.82014959 -0.0242526 -0.16807283 -0.82241399 -0.16689358 -0.00000769
 G2-44 -863.93012893 -55.0351314 -50.82787778 -4.22541743 -3.36542292 1.95128431 -0.02251617 -0.17017304 -0.89185954 -0.17017304 -0.00001307
 G2-45 -579.79172475 -41.62953059 -38.28749704 -3.36134518 -2.7317054 1.59841012 -0.01748192 -0.12994825 -0.68134406 -0.12994825 -0.00054434
 G2-46 -335.29610061 -28.52252226 -26.15828351 -2.46415005 -2.07047244 1.21728306 -0.02416608 -0.11878775 -0.66156985 -0.11878775 -0.0000033
 G2-47 -405.26373834 -30.06706564 -27.61885518 -2.50653319 -2.0703414 1.22131969 -0.02212492 -0.11435604 -0.64489859 -0.11435604 -0.0000034
 G2-48 -439.17812157 -33.19915082 -30.5379234 -2.75765116 -2.27764088 1.33701521 -0.02417947 -0.12967016 -0.68559537 -0.14346036 -0.00000274
 G2-49 -498.60340027 -35.66169485 -32.83682466 -2.91812989 -2.39546891 1.40260795 -0.02846692 -0.13321141 -0.72170389 -0.13587613 -0.00000396
 G2-50 -521.35792839 -37.51222496 -34.54984879 -3.0566609 -2.51477748 1.46790596 -0.0233376 -0.13477981 -0.75441869 -0.13477981 -0.00000587
 G2-51 -538.54171831 -42.80127436 -39.22791172 -3.54185132 -3.10907934 1.84615118 -0.02692378 -0.12130546 -0.78527661 -0.12130546 -0.0042038
 G2-52 -465.35430385 -33.7692265 -31.02268157 -2.75120621 -2.39972985 1.41674183 -0.01893585 -0.11398843 -0.68348187 -0.11398843 -0.00117912
 G2-53 -406.13295066 -31.60121637 -28.98409619 -2.623674 -2.35428198 1.39520808 -0.01975903 -0.1090393 -0.67817502 -0.1090393 -0.00184758
 G2-54 -498.83966847 -36.05145788 -33.19218467 -2.94073865 -2.4723032 1.44652496 -0.02152753 -0.13324411 -0.75314936 -0.13324411 -0.00007969
 G2-55 -505.81854646 -41.43986343 -38.10251231 -3.52647028 -3.02021648 1.76392999 -0.04042376 -0.19474094 -1.04633939 -0.19474094 -0.00021757
 G2-56 -289.08587333 -34.1969928 -31.14212267 -3.23239655 -2.92447234 1.72992074 -0.0383189 -0.16728698 -0.99461673 -0.16728698 -0.00054104
 G2-57 -1316.75433162 -86.56580411 -79.82147245 -6.74005551 -5.46783881 3.1780295 -0.04176188 -0.28034467 -1.46109868 -0.28034467 -0.00138907
 G2-58 -492.03049169 -48.52612561 -44.37359966 -4.34390919 -3.76700821 2.21266713 -0.04246486 -0.20897031 -1.17988655 -0.20897031 -0.00149926
 G2-59 -1519.73704924 -100.92506818 -93.06136125 -7.84619639 -6.30872939 3.65919539 -0.04129886 -0.31396904 -1.61270164 -0.31396904 -0.0023979
 G2-60 -390.31839176 -45.43291254 -41.46555553 -4.23737065 -3.85850086 2.26535042 -0.05496038 -0.23117614 -1.34582212 -0.23117614 -0.00065529
 G2-61 -1760.54840141 -115.28960453 -106.40135043 -8.92814048 -7.25275428 4.19886781 -0.05811018 -0.38607192 -1.99463981 -0.38607192 -0.00188237
 G2-62 -471.94016055 -38.36498041 -35.21835644 -3.27630392 -2.80244606 1.64653903 -0.03609216 -0.16784894 -0.92263148 -0.16784894 -0.00022707
 G2-63 -777.77708617 -55.15377964 -50.80544149 -4.43339759 -3.64995566 2.12878129 -0.03656647 -0.20660777 -1.07942117 -0.20660777 -0.00043097
 G2-64 -278.18981023 -33.49883713 -30.54937161 -3.17857976 -2.90690345 1.71514524 -0.04587463 -0.18062516 -1.05938277 -0.18062516 -0.00029126
 G2-65 -626.24454546 -60.85445184 -55.68638276 -5.39562614 -4.71389891 2.75689925 -0.05353218 -0.2664101 -1.49726515 -0.2664101 -0.00287419
 G2-66 -1996.49189392 -130.67536266 -120.58597548 -10.06689927 -8.10399367 4.68673783 -0.05655321 -0.41505001 -2.10444689 -0.41505001 -0.00498929
 G2-67 -162.4376049 -21.27813296 -19.39830119 -2.10087796 -1.94705558 1.1590772 -0.03708916 -0.1453036 -0.8353814 -0.1453036 -0.00010174
 G2-68 -546.57933207 -42.14161015 -38.7697629 -3.56449613 -3.01124561 1.76747976 -0.04570255 -0.18849463 -1.04434939 -0.18849463 -0.00022725
 G2-69 -316.08891377 -36.52929935 -33.39037702 -3.44861184 -3.11256639 1.83301147 -0.05454549 -0.19777238 -1.17185697 -0.19777238 -0.00029635
 G2-70 -586.3542102 -52.89145114 -48.49869222 -4.5991002 -3.97474299 2.3208735 -0.0496099 -0.22689638 -1.26649095 -0.22689638 -0.00085093
 G2-71 -199.97774577 -24.32878135 -22.28008969 -2.37259305 -2.15690518 1.27805484 -0.03785737 -0.1729665 -1.01662933 -0.1729665 -0.00005313
 G2-72 -245.46556252 -28.05011722 -25.65395812 -2.67197012 -2.38133174 1.40754942 -0.03914661 -0.1515135 -0.93286853 -0.1515135 -0.00013544
 G2-73 -700.09826836 -57.49296071 -52.9021943 -4.9011884 -4.18825294 2.44267197 -0.06419714 -0.25816106 -1.42731691 -0.25816106 -0.00062215
 G2-74 -422.96679693 -50.56700133 -46.11966221 -4.7677582 -4.37036538 2.57341859 -0.06626684 -0.26121579 -1.55733415 -0.26121579 -0.00210978
 G2-75 -1793.2067026 -120.49177367 -111.10923953 -9.44863775 -7.76811602 4.505419 -0.06555747 -0.41779388 -2.1908162 -0.41779388 -0.00343779
 G2-76 -381.5012213 -47.07249162 -42.86943566 -4.50102213 -4.14487793 2.44923615 -0.06228655 -0.25484757 -1.52415686 -0.25484757 -0.00179529
 G2-77 -98.98143291 -16.90522295 -15.21653562 -1.73998951 -1.80492239 1.10103611 -0.02249539 -0.09018884 -0.65740105 -0.09018884 -0.00199475
 G2-78 -98.98721533 -16.89566484 -15.21610508 -1.73879551 -1.80483165 1.10049738 -0.02392936 -0.08788473 -0.65319068 -0.08788473 -0.0018055
 G2-79 -98.9215473 -16.92154671 -15.24604405 -1.72544862 -1.80871329 1.09934213 -0.02212137 -0.08991466 -0.65547214 -0.08991466 -0.0029135
 G2-80 -99.44385808 -17.648963 -15.87477788 -1.80237667 -1.94533614 1.18786769 -0.02347008 -0.08754452 -0.68124872 -0.08754452 -0.00421118
 G2-81 -99.3891276 -17.68852444 -15.92133726 -1.78630599 -1.95056127 1.18636714 -0.02213796 -0.0898321 -0.67706057 -0.0898321 -0.00481021
 G2-82 -99.88918094 -18.39387529 -16.53197082 -1.86492088 -2.08590742 1.27526225 -0.02339485 -0.08863039 -0.71068781 -0.08863039 -0.0069982
 G2-83 -132.13354908 -22.81261938 -20.54118496 -2.32920423 -2.45698103 1.49414087 -0.03192766 -0.11815551 -0.8804206 -0.11815551 -0.00527669
 G2-84 -132.11336172 -22.82143541 -20.54722033 -2.32885282 -2.45775002 1.49532545 -0.03078391 -0.12099457 -0.88105656 -0.12099457 -0.00357593
 G2-85 -132.06892431 -22.84259326 -20.58157697 -2.31252989 -2.46169758 1.49274111 -0.03062588 -0.12033282 -0.87638671 -0.12033282 -0.00512268
 G2-86 -132.02604857 -22.86815439 -20.61505776 -2.29471084 -2.46574354 1.49015051 -0.02931956 -0.12373389 -0.87755985 -0.12373389 -0.00658645
 G2-87 -132.07619811 -22.84519092 -20.5833973 -2.30773448 -2.46269466 1.49140662 -0.03099475 -0.12048563 -0.88041719 -0.12048563 -0.00614865
 G2-88 -132.52382283 -23.59369629 -21.24098901 -2.37169215 -2.60334155 1.57890219 -0.03059678 -0.12019348 -0.90728824 -0.12019348 -0.00944864
 G2-89 -132.57887001 -23.55775624 -21.1992382 -2.38818443 -2.59772007 1.58081765 -0.03143277 -0.11936871 -0.90887762 -0.11936871 -0.00837316
 G2-90 -133.02182313 -24.30080161 -21.85214589 -2.45300638 -2.73789297 1.66865811 -0.03119182 -0.11946227 -0.93763774 -0.11946227 -0.01089667
 G2-91 -133.0246329 -24.29850126 -21.85179865 -2.45036306 -2.73792604 1.66780029 -0.03123543 -0.12040071 -0.93953654 -0.12040071 -0.01220689
 G2-92 -165.15329927 -28.79097371 -25.9488859 -2.88472118 -3.11880131 1.88461218 -0.03710438 -0.15352802 -1.09913613 -0.15352802 -0.00978785
 G2-93 -197.48712674 -33.24967951 -29.98838411 -3.34921955 -3.49224655 2.1021367 -0.04269385 -0.18909429 -1.25729932 -0.18909429 -0.00705192
 G2-94 -211.96141193 -25.99944811 -23.66948262 -2.4701943 -2.31999768 1.37837973 -0.03140192 -0.12812005 -0.8045996 -0.12812005 -0.00091477
 G2-95 -301.14373351 -35.71365464 -32.56609274 -3.35452831 -3.08911307 1.82187422 -0.04373178 -0.18012055 -1.07660217 -0.18012055 -0.00077171
 G2-96 -897.08748138 -60.94891835 -56.15039088 -4.81293756 -4.01723402 2.34480409 -0.03137023 -0.20269706 -1.1146007 -0.20269706 -0.00137994
 G2-97 -1328.81962467 -88.12220678 -81.27711504 -6.87161584 -5.63491773 3.27209187 -0.04462129 -0.29360885 -1.5517824 -0.29360885 -0.00160313
 G2-98 -81.67852616 -13.55842347 -12.23155417 -1.36108437 -1.46929862 0.89447115 -0.0164325 -0.06833786 -0.51495542 -0.06833786 -0.00236934
 G2-99 -113.98324578 -17.96651048 -16.21596058 -1.83353537 -1.83936877 1.11597313 -0.02407285 -0.10051653 -0.69351151 -0.10051653 -0.00160358
G2-100 -214.54023368 -29.1730133 -26.55483789 -2.84998258 -2.77793174 1.65483709 -0.0456312 -0.17774446 -1.10249863 -0.17774446 -0.00273517
G2-101 -214.58003662 -29.1293436 -26.50514327 -2.85782245 -2.77459522 1.65467537 -0.05026925 -0.1781045 -1.10166672 -0.1781045 -0.00302321
G2-102 -302.64140943 -27.66001179 -25.23242731 -2.41054078 -2.27271128 1.3643892 -0.02092149 -0.090064 -0.63468332 -0.090064 -0.00376658
G2-103 -166.49046878 -22.31862986 -20.29335562 -2.17629248 -2.09510104 1.24893785 -0.03281797 -0.12752732 -0.7901487 -0.12752732 -0.00079217
G2-104 -199.61678578 -28.21837513 -25.60476595 -2.76900482 -2.74657549 1.64292677 -0.04245069 -0.15706405 -1.01775891 -0.15706405 -0.00359529
G2-105 -181.0368642 -26.98604242 -24.44957278 -2.65979482 -2.70931057 1.6247676 -0.03894585 -0.15015142 -0.99045198 -0.15015142 -0.00463803
G2-106 -114.32766272 -18.73745024 -16.91944891 -1.87475039 -1.98451356 1.19961013 -0.02410909 -0.10017279 -0.71333089 -0.10017279 -0.00362377
G2-107 -161.20213829 -23.41335653 -21.20130643 -2.39463149 -2.2436144 1.35053759 -0.03458853 -0.14810953 -0.92680834 -0.14810953 -0.0006071
G2-108 -114.80729236 -19.45979522 -17.54723805 -1.94976973 -2.12085221 1.28773071 -0.02516343 -0.09861118 -0.74149278 -0.09861118 -0.00593952
G2-109 -114.81635997 -19.46270403 -17.55006712 -1.94898786 -2.12103057 1.28768138 -0.02449924 -0.09931615 -0.74187186 -0.09931615 -0.0058376
G2-110 -132.52780377 -19.229084 -17.42207478 -1.92746596 -1.87983349 1.1320287 -0.02977771 -0.1097825 -0.71149644 -0.1097825 -0.00089083
G2-111 -132.91033402 -19.98842682 -18.0950977 -1.98133301 -2.02304681 1.21779322 -0.02670714 -0.10746412 -0.73637736 -0.10746412 -0.00251257
G2-112 -132.97509952 -19.97234033 -18.06835703 -1.9947287 -2.0192755 1.21959338 -0.02818416 -0.10635996 -0.73593646 -0.10635996 -0.00245072
G2-113 -199.19096876 -27.44742429 -24.91161028 -2.71717113 -2.60384174 1.55815954 -0.03972406 -0.15403806 -0.99388595 -0.15403806 -0.0017877
G2-114 -133.3888502 -20.72749778 -18.73728706 -2.05264805 -2.16035405 1.30541036 -0.02564651 -0.10609977 -0.76012408 -0.10609977 -0.00451654
G2-115 -133.382444 -20.71595044 -18.72557525 -2.0557155 -2.15945408 1.3056021 -0.02738669 -0.10483635 -0.76027152 -0.10483635 -0.00475744
G2-116 -438.78777946 -36.79236043 -33.6856377 -3.13666835 -2.87056743 1.70022602 -0.02733147 -0.14347899 -0.88133308 -0.14347899 -0.00287709
G2-117 -505.85909399 -45.75110563 -41.85343947 -3.98988354 -3.73559754 2.213508 -0.04626161 -0.19739369 -1.21068983 -0.19739369 -0.00622667
G2-118 -439.26778546 -37.50622738 -34.3029785 -3.2119165 -3.00614664 1.78862978 -0.02770729 -0.14019947 -0.90610099 -0.14019947 -0.00490044
G2-119 -439.26500021 -37.50603025 -34.30312228 -3.21477101 -3.00637903 1.78947318 -0.0283468 -0.14071892 -0.90843493 -0.14071892 -0.00428392
G2-120 -155.47685305 -21.44860775 -19.44454093 -2.10385703 -2.06251397 1.23925147 -0.02823165 -0.10780228 -0.73093637 -0.10780228 -0.00165767
G2-121 -498.49250813 -39.67373186 -36.34137281 -3.33949665 -3.05149616 1.81010617 -0.02710722 -0.14513446 -0.91077724 -0.14513446 -0.00406459
G2-122 -498.04030855 -38.92876752 -35.68837202 -3.27530436 -2.91143664 1.72257543 -0.02770556 -0.14528573 -0.88506522 -0.14528573 -0.00194856
G2-123 -146.66861419 -23.1254229 -20.87731825 -2.36222885 -2.3507169 1.42266622 -0.03264255 -0.13091513 -0.89529509 -0.13091513 -0.00252814
G2-124 -166.11300231 -25.88560208 -23.39580451 -2.58126597 -2.67177369 1.61279041 -0.0362071 -0.13756184 -0.9606649 -0.13756184 -0.00571876
G2-125 -199.62676814 -28.2360561 -25.62256675 -2.76353802 -2.74766693 1.6423443 -0.04039496 -0.157763 -1.01200678 -0.157763 -0.00321285
G2-126 -222.16056522 -29.69331602 -26.97455613 -2.88113621 -2.78948511 1.66413183 -0.04180999 -0.15981296 -1.01196528 -0.15981296 -0.00273385
G2-127 -564.73128888 -47.14919467 -43.20161214 -4.05486943 -3.63705658 2.14757707 -0.04336496 -0.19867999 -1.17313367 -0.19867999 -0.00317345
G2-128 -531.62506867 -45.58085189 -41.66144989 -3.92789166 -3.7034896 2.2035967 -0.03487829 -0.17600288 -1.13789421 -0.17600288 -0.00791489
G2-129 -166.52816015 -26.63215173 -24.05752235 -2.63812062 -2.81229746 1.69790471 -0.03372476 -0.1378657 -0.98857312 -0.1378657 -0.00892891
G2-130 -166.51949973 -26.62385072 -24.04684585 -2.6436684 -2.81137561 1.69887564 -0.03532091 -0.13573272 -0.98669695 -0.13573272 -0.00777663
G2-131 -147.94034571 -25.35845477 -22.86320662 -2.5348741 -2.77250151 1.67983901 -0.03398143 -0.13045093 -0.97123068 -0.13045093 -0.0111423
G2-132 -198.29135328 -30.37474985 -27.49733364 -3.01035843 -3.05233925 1.82582661 -0.04055325 -0.17531026 -1.12825906 -0.17531026 -0.0033836
G2-133 -504.15771897 -47.17827702 -43.08763037 -4.16909277 -3.90073973 2.30950318 -0.0421319 -0.21402956 -1.27915194 -0.21402956 -0.00363185
G2-134 -179.70801345 -29.13926835 -26.33801755 -2.90189717 -3.01489033 1.8076202 -0.03728411 -0.16896141 -1.10298651 -0.16896141 -0.00452397
G2-135 -212.4268994 -34.30509182 -30.99141573 -3.43807351 -3.52658251 2.11575857 -0.04502817 -0.19967918 -1.29255889 -0.19967918 -0.00580058
G2-136 -0.47516985 -0.65705261 -0.56664999 -0.08945789 -0.13022993 0.09200804 -0.00075406 0 -0.04139019 0 -0.00000109
G2-137 -372.74641124 -25.34441608 -23.33507725 -2.00816604 -1.62398931 0.95681121 -0.01072602 -0.08250869 -0.40829669 -0.06314989 -0.00000268
G2-138 -65.54321207 -10.61152891 -9.53771434 -1.12597708 -1.06643088 0.66250676 -0.01563924 -0.06346599 -0.39479807 -0.04884426 -0.00025401
G2-139 -66.04084305 -11.35866344 -10.20246181 -1.18805782 -1.21195164 0.74963505 -0.01705648 -0.06120197 -0.41691679 -0.04652313 -0.00088546
G2-140 -132.74752706 -19.57950131 -17.71444454 -1.96743249 -1.94124324 1.17471274 -0.02931347 -0.1076927 -0.70863544 -0.10650202 -0.00168212
G2-141 -99.99892798 -14.44385365 -13.07606093 -1.4360299 -1.42990895 0.86720102 -0.01947314 -0.07930398 -0.49832818 -0.06824305 -0.00110162
G2-142 -100.01610673 -14.42444793 -13.03948371 -1.44645612 -1.42814121 0.86823721 -0.02421649 -0.07474373 -0.48362414 -0.06160051 -0.00086987
G2-143 -133.15556738 -20.32838203 -18.35922322 -2.03458443 -2.08007125 1.26160986 -0.03360788 -0.10546642 -0.71126948 -0.09335225 -0.00334544
G2-144 -405.88234007 -31.24573482 -28.6540945 -2.59985211 -2.27691424 1.3515465 -0.02087471 -0.11284303 -0.63953616 -0.09641292 -0.00109813
G2-145 -66.49346157 -12.11737603 -10.87083838 -1.25136961 -1.35446805 0.83769202 -0.01616006 -0.06361849 -0.4424957 -0.04464287 -0.00237917
G2-146 -99.63011681 -18.02304445 -16.1936586 -1.83874194 -2.00726846 1.23115748 -0.02487271 -0.09418544 -0.67005721 -0.07662348 -0.00511682
G2-147 -132.7674959 -23.92803661 -21.51637043 -2.42448689 -2.65992157 1.6240868 -0.03334023 -0.12576209 -0.89904202 -0.10899674 -0.00922802
G2-148 -181.20647531 -22.86470277 -20.87659966 -2.2359454 -2.04981277 1.21753995 -0.03926481 -0.14427762 -0.86234613 -0.16486489 -0.00006626
G2-149 -132.12027653 -22.80504708 -20.53913902 -2.32801258 -2.45702017 1.49445471 -0.03188067 -0.11897321 -0.88000616 -0.11897321 -0.00429364
G2-150 -165.26541586 -28.72302269 -25.86800422 -2.91319088 -3.10977844 1.88667979 -0.0398819 -0.15044126 -1.1091255 -0.15044126 -0.01019763
G2-151 -165.6651658 -29.52332218 -26.58334513 -2.95388802 -3.25756272 1.97099183 -0.03819391 -0.15234027 -1.13254345 -0.15234027 -0.01343307
G2-152 -166.15464596 -30.20745125 -27.17203626 -3.04116736 -3.38986299 2.06207303 -0.03899104 -0.15030145 -1.1646743 -0.15030145 -0.01484237
G2-153 -166.15986133 -30.20270003 -27.17276065 -3.03324925 -3.39024175 2.05963577 -0.03909045 -0.15315566 -1.17090529 -0.15315566 -0.01906224
G2-154 -197.90772447 -33.95533031 -30.60867921 -3.41363337 -3.63012486 2.18922521 -0.04648647 -0.18374384 -1.30162871 -0.18374384 -0.01077817
G2-155 -197.90501383 -33.9608762 -30.61086294 -3.41350975 -3.63032667 2.18942027 -0.04656377 -0.18179903 -1.29833551 -0.18179903 -0.01012231
G2-156 -198.79621617 -35.44082595 -31.91516654 -3.53678672 -3.91081804 2.36301365 -0.04651855 -0.18375604 -1.35987636 -0.18375604 -0.01994604
G2-157 -199.28736332 -36.11421012 -32.49204085 -3.62930275 -4.04184337 2.45548243 -0.04678927 -0.18115322 -1.39172637 -0.18115322 -0.01880988
G2-158 -199.28471649 -36.11304292 -32.49524633 -3.62375294 -4.042586 2.45393644 -0.04705879 -0.1830448 -1.39596614 -0.1830448 -0.02221033
G2-159 -230.62105639 -39.1570024 -35.31189939 -3.93559384 -4.14461217 2.49535014 -0.05073513 -0.22114194 -1.48646497 -0.22114194 -0.01110335
G2-160 -232.42012098 -42.02092913 -37.81198686 -4.21745615 -4.69381555 2.8488936 -0.05458764 -0.21200449 -1.61878656 -0.21200449 -0.02277869
G2-161 -263.28101022 -44.28338036 -39.94419454 -4.46357064 -4.65412908 2.80109119 -0.06329448 -0.24663713 -1.70240701 -0.24663713 -0.0146637
G2-162 -265.55285215 -47.92767758 -43.13198029 -4.80558776 -5.34579377 3.2423027 -0.06238704 -0.24285952 -1.84585387 -0.24285952 -0.02674851
G2-163 -328.65872362 -54.74510546 -49.41716375 -5.48207787 -5.6909849 3.40927621 -0.07192065 -0.32221708 -2.07233069 -0.32221708 -0.01547165
G2-164 -328.63781806 -54.69479109 -49.3888381 -5.48505817 -5.68865848 3.40945791 -0.07462739 -0.3282467 -2.09614781 -0.3282467 -0.01659405
G2-165 -232.75224133 -34.13575107 -30.93405979 -3.35579622 -3.3991756 2.03621495 -0.05000718 -0.18744388 -1.23996256 -0.18744388 -0.00627259
G2-166 -199.66574608 -32.53703678 -29.37849953 -3.22176875 -3.46451339 2.08993095 -0.04163619 -0.17025147 -1.21896147 -0.17025147 -0.01481528
G2-167 -245.54222695 -40.23808753 -36.3470459 -4.01629248 -4.18093951 2.50750654 -0.05324097 -0.23265692 -1.51805915 -0.23265692 -0.009913
G2-168 -264.12126365 -41.49337621 -37.525761 -4.12002512 -4.21964478 2.5251282 -0.05471478 -0.23951002 -1.5372595 -0.23951002 -0.00850423
G2-169 -198.76131913 -31.04491043 -28.06668602 -3.10289297 -3.18313141 1.91720101 -0.04529089 -0.16697796 -1.15975531 -0.16697796 -0.00562998
G2-170 -199.16549009 -31.84991944 -28.7802585 -3.14557181 -3.33124659 2.0017089 -0.04233793 -0.16845933 -1.18067212 -0.16845933 -0.00977277
G2-171 -231.88873633 -37.01891986 -33.45087689 -3.67057026 -3.84365241 2.30886988 -0.05146309 -0.20135526 -1.38205235 -0.20135526 -0.01163773
G2-172 -330.35901394 -48.93463314 -44.33294337 -4.85352127 -4.80185046 2.86565982 -0.07411632 -0.28224029 -1.81499936 -0.28224029 -0.00815833
G2-173 -227.36909832 -35.36301535 -31.99445637 -3.52691898 -3.5608738 2.12938973 -0.04778713 -0.20975344 -1.32558436 -0.20975344 -0.00461708
G2-174 -572.42742914 -54.07658401 -49.46535066 -4.75711535 -4.46904441 2.63767696 -0.05970945 -0.25139567 -1.49409673 -0.25139567 -0.00754766
G2-175 -629.21838418 -60.43688582 -55.12525086 -5.40879678 -5.11067475 3.03011453 -0.05495206 -0.27907604 -1.6903914 -0.27907604 -0.00814727
G2-176 -227.47475195 -35.25409958 -31.85272534 -3.57082606 -3.54809884 2.13785906 -0.04816054 -0.20446271 -1.35896949 -0.20446271 -0.0063913
G2-177 -227.36834803 -35.35404594 -31.98942644 -3.52725566 -3.56053381 2.12931062 -0.04667755 -0.21045805 -1.32905205 -0.21045805 -0.00460976
G2-178 -198.3366737 -30.29238473 -27.39246967 -3.04854592 -3.04227988 1.83279446 -0.04476737 -0.17151556 -1.14388052 -0.17151556 -0.00426766
G2-179 -198.79756726 -31.0463616 -28.05989213 -3.10952515 -3.18339834 1.91957016 -0.04530007 -0.16828195 -1.16171685 -0.16828195 -0.00637268
G2-180 -332.11715051 -47.53576313 -43.12260655 -4.65961914 -4.63710699 2.76736477 -0.0721457 -0.26945039 -1.72077769 -0.26945039 -0.00792865
G2-181 -504.60257729 -47.8949886 -43.70355032 -4.24046529 -4.03794354 2.39789204 -0.04359108 -0.20510084 -1.30320497 -0.20510084 -0.00611177
G2-182 -180.2505448 -29.77920928 -26.85410224 -3.0107153 -3.14319185 1.90292116 -0.03978136 -0.16252325 -1.14888395 -0.16252325 -0.00939046
G2-183 -199.24298806 -31.79544651 -28.71912731 -3.1684878 -3.32416472 2.00605859 -0.04420439 -0.16858729 -1.18785294 -0.16858729 -0.00940471
G2-184 -199.24038023 -31.78607562 -28.70921282 -3.17014757 -3.32340863 2.00618683 -0.04392989 -0.16886177 -1.19181419 -0.16886177 -0.01083303
G2-185 -265.80031944 -40.08122847 -36.29959778 -3.91975201 -4.05736067 2.42386206 -0.05542598 -0.21627018 -1.45892492 -0.21627018 -0.01195893
G2-186 -505.04855265 -48.6359483 -44.35652562 -4.30227692 -4.17821942 2.48474273 -0.04349555 -0.20582076 -1.33290742 -0.20582076 -0.0104232
G2-187 -564.76778714 -51.48147625 -46.98147807 -4.50853761 -4.35571112 2.59469765 -0.04333375 -0.20996425 -1.37178064 -0.20996425 -0.01424997
G2-188 -564.75768929 -51.48770041 -46.98141166 -4.51621454 -4.35546847 2.5970562 -0.0426775 -0.20684019 -1.36500284 -0.20684019 -0.01185593
G2-189 -180.58957242 -30.58967673 -27.59855716 -3.03889232 -3.29236558 1.9834569 -0.04009259 -0.16234894 -1.16298626 -0.16234894 -0.01160755
G2-190 -313.94151522 -46.89715437 -42.5212432 -4.60999076 -4.73469072 2.83383359 -0.06970852 -0.27242368 -1.7871967 -0.27242368 -0.01608648
G2-191 -199.6562933 -32.53190845 -29.36813342 -3.23168156 -3.46330414 2.09217124 -0.04322546 -0.16663569 -1.21317803 -0.16663569 -0.01088058
G2-192 -266.28456204 -40.76869831 -36.89305429 -4.00475973 -4.1902137 2.51463385 -0.05591116 -0.21589191 -1.49361771 -0.21589191 -0.01450664
G2-193 -505.54114825 -49.31208122 -44.94251056 -4.3798066 -4.31044283 2.57296337 -0.0437935 -0.20563898 -1.36884735 -0.20563898 -0.01576064
G2-194 -878.04833539 -74.33891873 -68.04166887 -6.32887702 -5.88355077 3.48421958 -0.05868607 -0.28855459 -1.79413038 -0.28855459 -0.01183491
G2-195 -181.08961976 -31.27284679 -28.19159478 -3.117417 -3.42533133 2.07204171 -0.04016357 -0.16366955 -1.20147723 -0.16366955 -0.0171139
G2-196 -402.04988988 -45.41444701 -41.22745143 -4.17725754 -4.23199059 2.54673524 -0.04225299 -0.18761033 -1.32075575 -0.18761033 -0.01432686
G2-197 -537.29196414 -53.08660967 -48.41046278 -4.7569318 -4.55300403 2.70314181 -0.05028486 -0.24558032 -1.50752399 -0.24558032 -0.00691668
G2-198 -212.8383829 -35.04138823 -31.65428338 -3.49128465 -3.66663773 2.2011812 -0.04572149 -0.20009659 -1.3322602 -0.20009659 -0.0084937
G2-199 -232.29868871 -37.7617825 -34.10831121 -3.72803173 -3.98414986 2.39340096 -0.05095287 -0.20011815 -1.40931183 -0.20011815 -0.01589344
G2-200 -232.3730204 -37.70513797 -34.04221695 -3.75579466 -3.97654163 2.3993443 -0.05218669 -0.19961857 -1.41511898 -0.19961857 -0.0131607
G2-201 -299.0247562 -45.95055383 -41.57775924 -4.52884804 -4.70339567 2.8219885 -0.06601333 -0.25046111 -1.69587801 -0.25046111 -0.01451198
G2-202 -538.17702891 -54.54919207 -49.68508764 -4.8858176 -4.83124406 2.87695226 -0.05192446 -0.23721114 -1.56075029 -0.23721114 -0.01653064
G2-203 -213.72029968 -36.50460197 -32.92886947 -3.62186142 -3.94559324 2.37550578 -0.04858747 -0.19400241 -1.39119027 -0.19400241 -0.0182411
G2-204 -232.78608904 -38.43682056 -34.69274422 -3.81073275 -4.11645227 2.48304747 -0.05138648 -0.2006836 -1.4479055 -0.2006836 -0.02013724
G2-205 -375.82176404 -52.66793474 -47.77705245 -5.12619078 -5.03121796 2.99164445 -0.06835557 -0.29139746 -1.80764081 -0.29139746 -0.0079828
G2-206 -375.82049451 -52.66778034 -47.77708898 -5.12654602 -5.03126204 2.99174221 -0.06803131 -0.29134708 -1.80820718 -0.29134708 -0.00797588
G2-207 -286.65481438 -42.95886073 -38.88288609 -4.2377586 -4.26175939 2.54690019 -0.05547643 -0.2403008 -1.53269366 -0.2403008 -0.00751504
G2-208 -265.92745022 -44.34315487 -40.01053783 -4.40171548 -4.76780343 2.87707241 -0.05936439 -0.23087255 -1.67241572 -0.23087255 -0.02187241
G2-209 -765.04995845 -73.18418022 -67.05046247 -6.43262979 -5.66166603 3.29756611 -0.07110889 -0.3311629 -1.84242176 -0.3311629 -0.00274497
G2-210 -908.69561 -85.5132861 -78.44404302 -7.47329955 -6.60824912 3.83873303 -0.08958614 -0.4012594 -2.21510837 -0.4012594 -0.00267501
G2-211 -1272.48261067 -90.50661009 -83.42642273 -7.1458368 -5.84799889 3.38465673 -0.04628735 -0.32182155 -1.60988381 -0.32182155 -0.00013534
G2-212 -572.37867547 -49.72584565 -45.67938936 -4.29757044 -3.75132756 2.18899881 -0.05756677 -0.24673094 -1.32732441 -0.24673094 -0.00062417
G2-213 -1236.45387217 -80.0586859 -73.93097267 -6.16404104 -4.93880557 2.85925091 -0.0384722 -0.25588317 -1.31962154 -0.25588317 -0.00074314
G2-214 -1680.63985672 -113.58445393 -104.78210938 -8.88295827 -7.25109928 4.19585288 -0.06566122 -0.39426755 -2.01751419 -0.39426755 -0.00350337
G2-215 -2477.89065692 -160.39439971 -148.13494262 -12.28352075 -9.89768403 5.71184411 -0.07719248 -0.52567491 -2.6411482 -0.52567491 -0.00510206
G2-216 -1369.64791948 -96.58398749 -89.06651477 -7.70547766 -6.39941856 3.70719121 -0.07206518 -0.37319743 -1.92869857 -0.37319743 -0.00242706
G2-217 -1614.05666816 -105.25560772 -97.17326143 -8.11018952 -6.51719067 3.77020215 -0.05158813 -0.33903016 -1.7267408 -0.33903016 -0.00211712
G2-218 -1608.9839264 -105.06301142 -97.0309732 -8.10133156 -6.51199233 3.7669154 -0.05714184 -0.3468823 -1.76344495 -0.3468823 -0.00182339
G2-219 -1132.58541195 -75.42269854 -69.56175963 -5.87732335 -4.71931476 2.73856684 -0.0355852 -0.23747765 -1.23050803 -0.23747765 -0.0007964
G2-220 -732.87837916 -62.88954148 -57.69494007 -5.41119874 -4.70659197 2.74868533 -0.05697335 -0.26921223 -1.50740651 -0.26921223 -0.00091907
G2-221 -601.80049256 -70.74486414 -64.55519611 -6.60410967 -6.0476101 3.54709144 -0.08906506 -0.36399377 -2.12396289 -0.36399377 -0.00520633
G2-222 -300.88906885 -35.32276618 -32.2147025 -3.3277689 -3.00837657 1.7771625 -0.04781545 -0.1809932 -1.04334864 -0.17798949 -0.0003617
G2-223 -197.21778177 -32.86544556 -29.63930366 -3.32352871 -3.41119476 2.05790815 -0.04566391 -0.19456587 -1.22213796 -0.18002681 -0.00594806
# Non Hydrogon Local Minimums : 31
NHL1  -0.19120611 -0.30821898 -0.26483429 -0.04163631 -0.03979739 0.03979739 -0.00038878 0 0 0 0
NHL2  -95.86022082 -13.10748315 -11.87478047 -1.33566441 -1.22001205 0.73601057 -0.01533727 -0.07829047 -0.49820946 -0.07829047 -0.00000143
NHL3  -95.98929594 -13.45591667 -12.1952962 -1.36474803 -1.28384958 0.77638607 -0.01934632 -0.07820333 -0.49729637 -0.07708043 -0.00005333
NHL4  -99.45442324 -13.30860146 -12.05349737 -1.34862903 -1.2241762 0.73913117 -0.01701513 -0.07335924 -0.474186 -0.07335924 -0.00000136
NHL5  -99.60262727 -13.67041051 -12.39047389 -1.37795375 -1.28880029 0.7804718 -0.02010215 -0.07504307 -0.48537528 -0.07762263 -0.00011683
NHL6  -66.30486471 -11.7440584 -10.55411175 -1.21489826 -1.29333975 0.79440032 -0.01530171 -0.05640653 -0.45541461 -0.05640653 -0.00155842
NHL7  -66.48451512 -12.12679787 -10.87891051 -1.25172383 -1.3549987 0.83789744 -0.01604036 -0.06357708 -0.44187957 -0.04456646 -0.00236125
NHL8  -33.35386723 -6.21632102 -5.55206682 -0.66271379 -0.701603 0.44383613 -0.00678238 -0.03404284 -0.21524828 -0.01278888 -0.00077953
NHL9  -99.6125789 -18.03765854 -16.20202358 -1.84113616 -2.00721069 1.2317409 -0.02393343 -0.09489426 -0.66878295 -0.07463829 -0.00565045
NHL10 -80.84792541 -12.04514588 -10.88141806 -1.24444276 -1.18645281 0.72163784 -0.01547516 -0.07033626 -0.47347054 -0.07033626 -0.00024603
NHL11 -80.82892409 -12.0486572 -10.87882964 -1.24222371 -1.18549474 0.72068078 -0.01540967 -0.06621747 -0.45533467 -0.06621747 -0.00016208
NHL12 -89.21110878 -10.22515602 -9.34093164 -0.97166098 -0.89026502 0.53038471 -0.01160679 -0.05715219 -0.32601026 -0.05715219 0
NHL13 -122.77950531 -16.29532787 -14.78355409 -1.58163582 -1.551438 0.93398793 -0.01889936 -0.07695651 -0.53104153 -0.07695651 -0.0009789
NHL14 -212.00720967 -26.52050402 -24.13515047 -2.54319133 -2.44348031 1.4609563 -0.03686023 -0.13647772 -0.86399152 -0.13647772 -0.00282456
NHL15 -431.83911967 -27.71797786 -25.58185457 -2.13820544 -1.73571053 1.0113322 -0.00968163 -0.08792758 -0.45441633 -0.08792758 0
NHL16 -465.34307814 -33.7809 -31.03337504 -2.75073302 -2.4004694 1.41682672 -0.01878764 -0.11400934 -0.6826244 -0.11400934 -0.00111036
NHL17 -897.19261038 -61.50017607 -56.62382443 -4.88092255 -4.13794334 2.42607541 -0.03186405 -0.20400166 -1.14139078 -0.20400166 -0.00318816
NHL18 -554.5836127 -43.99478804 -40.37815191 -3.71149406 -3.29178164 1.9434026 -0.04227066 -0.17454094 -1.01783865 -0.17454094 -0.00301191
NHL19 -554.62225793 -44.02026918 -40.37764457 -3.71236486 -3.28930364 1.94345337 -0.03013253 -0.16648283 -0.98937099 -0.16648283 -0.00292231
NHL20 -66.68636548 -8.71233842 -7.94012634 -0.8566422 -0.84366706 0.50762481 -0.01066322 -0.05635107 -0.33662511 -0.05635107 -0.00000114
NHL21 -100.24081768 -14.83126175 -13.4258956 -1.4650406 -1.509136 0.9124233 -0.01753948 -0.07523081 -0.53306329 -0.07523081 -0.00166112
NHL22 -189.48052945 -25.06553303 -22.80017194 -2.41354026 -2.40313291 1.43682287 -0.03283607 -0.13677032 -0.86709889 -0.13677032 -0.00264156
NHL23 -189.48011458 -25.0107856 -22.73577787 -2.42807235 -2.39690677 1.43826415 -0.03319102 -0.13550659 -0.87339206 -0.13550659 -0.00261707
NHL24 -162.42982772 -21.28759536 -19.40553026 -2.10072501 -1.94743695 1.15915826 -0.03695936 -0.14443038 -0.83149989 -0.14443038 -0.00009918
NHL25 -66.86933502 -8.54161315 -7.72454119 -0.85786889 -0.77481058 0.47445014 -0.00738481 -0.0474061 -0.24746204 -0.02310125 -0.00000116
NHL26 -178.81157347 -19.91550074 -18.20488347 -1.89001527 -1.66005232 0.98417101 -0.019683 -0.09831576 -0.62989157 -0.09831576 -0.00000408
NHL27 -89.65346898 -10.39496553 -9.47704739 -0.98202752 -0.90077501 0.53855692 -0.00844414 -0.05074317 -0.30892833 -0.05074317 -0.00000129
NHL28 -521.35167562 -37.51938647 -34.55593969 -3.05597976 -2.51514314 1.46787447 -0.02322905 -0.13464058 -0.75255265 -0.13464058 -0.00000563
NHL29 -432.21959463 -27.87249316 -25.71568117 -2.15423088 -1.74857387 1.02125285 -0.00978179 -0.08459429 -0.45529774 -0.08459429 -0.00000241
NHL30 -89.3889071 -10.00641197 -9.06942604 -0.97343214 -0.81668282 0.49540208 -0.00688315 -0.04707126 -0.23597065 -0.02358329 0
NHL31 -431.9528697 -27.51673591 -25.37185041 -2.13691877 -1.66967394 0.9784022 -0.00959541 -0.08667092 -0.41161172 -0.06652896 0
# Non Hydrogon Transition States : 15
NHT1  -96.02742396 -13.39349837 -12.149824 -1.36460431 -1.27538739 0.77385201 -0.02125998 -0.08423651 -0.51125613 -0.07851796 -0.00022143
NHT2  -99.64157774 -13.60009801 -12.32236327 -1.38107712 -1.27438195 0.77734726 -0.02343251 -0.07599705 -0.48433257 -0.07509405 -0.00039904
NHT3  -66.49672676 -12.0372236 -10.81553432 -1.24947088 -1.34248689 0.83298961 -0.02053762 -0.0600175 -0.4600464 -0.05541088 -0.00300644
NHT4  -99.64115688 -17.9469605 -16.12546233 -1.85644698 -2.00137347 1.23329389 -0.02971677 -0.0972913 -0.68712122 -0.07616015 -0.00664544
NHT5  -80.82909987 -11.98590586 -10.8311284 -1.23972832 -1.1827275 0.71916252 -0.01657608 -0.07042802 -0.46948248 -0.07042802 -0.00000887
NHT6  -212.01712851 -26.47145324 -24.11452247 -2.54209689 -2.44323653 1.45944524 -0.04660231 -0.1431806 -0.89406513 -0.1431806 -0.00237153
NHT7  -897.21066164 -61.44837219 -56.5957732 -4.88169069 -4.13661123 2.42491791 -0.04169705 -0.20874453 -1.16186548 -0.20874453 -0.00341475
NHT8  -554.60730106 -43.95989516 -40.35713948 -3.71200971 -3.29032851 1.94243906 -0.0477388 -0.17705558 -1.03130103 -0.17705558 -0.00285626
NHT9  -189.48309244 -24.96998294 -22.7258683 -2.42671354 -2.39805342 1.43723885 -0.04432996 -0.14314656 -0.90552062 -0.14314656 -0.00335505
NHT10 -162.62431651 -21.53873806 -19.64778972 -2.13137429 -2.00017371 1.19592095 -0.03961749 -0.15770715 -0.84299793 -0.13686423 -0.00057031
NHT11 -122.99608872 -16.49573779 -14.99022803 -1.61777076 -1.60086086 0.971244 -0.02412753 -0.09624475 -0.56335282 -0.07434893 -0.00202724
NHT12 -179.01057939 -20.19248958 -18.47486911 -1.92389213 -1.70896242 1.02110626 -0.03352068 -0.1107789 -0.63636246 -0.09872392 -0.00016505
NHT13 -554.73115342 -43.66998062 -40.09565317 -3.70718918 -3.22118449 1.90746268 -0.03474639 -0.18620757 -0.99753517 -0.15003841 -0.00274786
NHT14 -432.39500882 -28.14071669 -25.97722475 -2.18161442 -1.80205829 1.05756153 -0.0141661 -0.09198878 -0.47790886 -0.08655808 -0.00008695
NHT15 -89.8558862 -10.59555859 -9.69161173 -1.00657931 -0.94809662 0.57153883 -0.01143577 -0.06237603 -0.33205227 -0.05212622 -0.0003663
# Hydrogon Local Minimums : 21
HL1  -0.19120611 -0.30821898 -0.26483429 -0.04163631 -0.03979739 0.03979739 -0.00038878 0 0 0 0
HL2  -432.21959463 -27.87249316 -25.71568117 -2.15423088 -1.74857387 1.02125285 -0.00978179 -0.08459429 -0.45529774 -0.08459429 -0.00000241
HL3  -0.47485431 -0.65738015 -0.56691797 -0.08949237 -0.13025076 0.09202108 -0.00075277 0 -0.04137515 0 -0.00000109
HL4  -431.9528697 -27.51673591 -25.37185041 -2.13691877 -1.66967394 0.9784022 -0.00959541 -0.08667092 -0.41161172 -0.06652896 0
HL5  -66.86933502 -8.54161315 -7.72454119 -0.85786889 -0.77481058 0.47445014 -0.00738481 -0.0474061 -0.24746204 -0.02310125 -0.00000116
HL6  -67.1223619 -8.92726764 -8.11330338 -0.86926458 -0.85781425 0.51743005 -0.00820219 -0.04762938 -0.30948241 -0.04762938 -0.00003569
HL7  -33.35386723 -6.21632102 -5.55206682 -0.66271379 -0.701603 0.44383613 -0.00678238 -0.03404284 -0.21524828 -0.01278888 -0.00077953
HL8  -33.61929962 -6.58610864 -5.8992588 -0.68570747 -0.78256525 0.4876957 -0.0078203 -0.0282412 -0.25868923 -0.0282412 -0.00097087
HL9  -48.55010153 -7.6611305 -6.92265284 -0.76850063 -0.81805363 0.50003655 -0.00787092 -0.03952314 -0.2896581 -0.03952314 -0.00020033
HL10 -48.30182918 -7.27676433 -6.54870368 -0.75333352 -0.73591336 0.4570201 -0.00738871 -0.04253039 -0.23949469 -0.01904805 -0.00006077
HL11 -66.74362923 -12.50017706 -11.22373954 -1.27676471 -1.4347853 0.88206586 -0.01549017 -0.05789854 -0.48328729 -0.05789854 -0.00329269
HL12 -66.4846185 -12.12667651 -10.878849 -1.25169079 -1.35499721 0.83788946 -0.0160482 -0.06357979 -0.44189692 -0.04457657 -0.00235702
HL13 -89.3889071 -10.00641197 -9.06942604 -0.97343214 -0.81668282 0.49540208 -0.00688315 -0.04707126 -0.23597065 -0.02358329 0
HL14 -89.65346898 -10.39496553 -9.47704739 -0.98202752 -0.90077501 0.53855692 -0.00844414 -0.05074317 -0.30892833 -0.05074317 -0.00000129
HL15 -66.6149221 -8.18893666 -7.37011637 -0.83765675 -0.68765629 0.43017794 -0.00551802 -0.04538345 -0.18310823 -0.00756734 0
HL16 -318.81759371 -23.65614707 -21.73302731 -1.91809542 -1.65945504 0.98278306 -0.01281005 -0.06948347 -0.43381438 -0.06948347 -0.00135525
HL17 -318.57161041 -23.30114007 -21.40736784 -1.89088397 -1.58130986 0.93864934 -0.01194673 -0.07523643 -0.3968147 -0.05748518 -0.0004466
HL18 -372.99877423 -25.7010641 -23.67149378 -2.02973385 -1.70259389 1.00015817 -0.01122277 -0.07857325 -0.44911096 -0.07857325 -0.00034612
HL19 -372.74325743 -25.34776649 -23.33793748 -2.00823537 -1.62418834 0.95687692 -0.01069136 -0.08250311 -0.40804874 -0.0631415 -0.0000026
HL20 -48.05415118 -6.91959608 -6.20523367 -0.72990444 -0.64982901 0.4130054 -0.00639742 -0.04392825 -0.18511116 -0.00612297 -0.00000149
HL21 -165.25215139 -28.73537029 -25.87856643 -2.91608925 -3.11042952 1.88774086 -0.04004647 -0.14988627 -1.10702104 -0.14988627 -0.00897437
# Hydrogon Transition States : 19
HT1  -432.39072249 -28.17446655 -25.98577196 -2.19850697 -1.80684122 1.06358668 -0.01388615 -0.09079036 -0.47034998 -0.07859853 -0.0001729
HT2  -67.33768851 -9.16180409 -8.31990101 -0.91614834 -0.910952 0.55851136 -0.01611206 -0.05203836 -0.32392653 -0.04267547 -0.00060531
HT3  -33.81523822 -6.84792944 -6.13588894 -0.72503215 -0.83645358 0.52831752 -0.01144475 -0.03635969 -0.27421553 -0.02239365 -0.00234797
HT4  -100.48203598 -15.08257345 -13.64929133 -1.5138919 -1.56525915 0.95590045 -0.02254599 -0.08354666 -0.55063439 -0.07218074 -0.00265583
HT5  -0.66346334 -0.93713661 -0.82557093 -0.12074475 -0.18161607 0.12898853 -0.0033844 -0.00318237 -0.05277395 0 -0.00025337
HT6  -115.42621735 -16.13900471 -14.66981687 -1.59578341 -1.60097551 0.96777489 -0.02412803 -0.09368854 -0.59444932 -0.09276747 -0.00187472
HT7  -465.57208086 -34.06440395 -31.28278934 -2.79594315 -2.45774765 1.46044726 -0.02184778 -0.12388748 -0.69266247 -0.1051127 -0.00288063
HT8  -133.61201963 -20.99357112 -18.97353536 -2.10454743 -2.21765596 1.35015206 -0.03245476 -0.11295255 -0.77707903 -0.10431882 -0.00517767
HT9  -89.86913739 -10.61937772 -9.66060233 -1.03806895 -0.95286721 0.58124062 -0.02374857 -0.05051448 -0.31150886 -0.04290163 -0.00033351
HT10 -100.22446738 -14.71938129 -13.28483389 -1.49790678 -1.48101252 0.91256005 -0.02075519 -0.0829839 -0.48611214 -0.04795405 -0.00219142
HT11 -319.01839654 -23.93308551 -21.98729649 -1.95224795 -1.71034772 1.02151579 -0.01751646 -0.07511905 -0.44740588 -0.06831076 -0.00203135
HT12 -67.07474979 -8.8012027 -7.96480731 -0.89540964 -0.825778 0.51356782 -0.01254395 -0.05093671 -0.26310958 -0.02293699 -0.00015982
HT13 -373.19595849 -25.97946639 -23.92771937 -2.06419279 -1.75414088 1.03889248 -0.01551211 -0.08473336 -0.46360931 -0.07707013 -0.00085305
HT14 -498.84442085 -35.97531807 -33.09733364 -2.96322275 -2.44731558 1.44485959 -0.04510858 -0.13781075 -0.70047734 -0.1282661 -0.00011144
HT15 -81.65550106 -13.45374054 -12.10922473 -1.39161267 -1.44208005 0.89511192 -0.02046441 -0.0810925 -0.48018564 -0.04287132 -0.00316248
HT16 -114.78259343 -19.36683472 -17.43626111 -1.98078035 -2.09488461 1.28914675 -0.02880716 -0.11130905 -0.70692965 -0.07439778 -0.00558085
HT17 -115.03347959 -19.73373246 -17.79205958 -1.99923701 -2.17841969 1.33238912 -0.02944496 -0.1087537 -0.76076966 -0.09444122 -0.00624009
HT18 -81.90585699 -13.82082479 -12.46580875 -1.40954907 -1.52580236 0.93828038 -0.02084402 -0.07878639 -0.53404508 -0.06269709 -0.0036224
HT19 -165.2157221 -28.67935292 -25.87408833 -2.89281671 -3.11182165 1.88220404 -0.03872975 -0.16588725 -1.13343811 -0.16588725 -0.01046636
# 52 molecules for Non bond interactions
NB1  -48.55539966 -7.65546685 -6.91777714 -0.76843095 -0.8177473 0.49993836 -0.00792218 -0.0395809 -0.2902471 -0.0395809 -0.00020397
NB2  -89.65632053 -10.39181536 -9.47448316 -0.98199354 -0.90063003 0.53849867 -0.00847794 -0.05081416 -0.30939897 -0.05081416 -0.00000131
NB3  -67.12713229 -8.92202638 -8.10893628 -0.86921297 -0.85755603 0.51733857 -0.0082515 -0.04773731 -0.31023532 -0.04773731 -0.00003604
NB4  -147.90217343 -21.07026282 -19.12158493 -2.0731081 -2.05680191 1.23151301 -0.03140218 -0.11968184 -0.76798561 -0.11968184 -0.00154179
NB5  -166.49160909 -22.31734342 -20.29211106 -2.17655363 -2.09505664 1.24897467 -0.03287193 -0.12760397 -0.79063319 -0.12760397 -0.00078984
NB6  -66.31267752 -11.73579958 -10.54679017 -1.21485784 -1.29285815 0.79427801 -0.01538649 -0.05648413 -0.45626133 -0.05648413 -0.00157907
NB7  -178.82179022 -19.90263499 -18.19462964 -1.89133717 -1.65947435 0.98425026 -0.01992333 -0.09870901 -0.63582614 -0.09870901 -0.00000436
NB8  -521.35757639 -37.51263415 -34.55019612 -3.05662171 -2.51479841 1.46790409 -0.02333135 -0.13477182 -0.75431006 -0.13477182 -0.00000586
NB9  -65.85978825 -10.97545311 -9.87389593 -1.15129668 -1.151441 0.70664766 -0.01431815 -0.05995861 -0.43750971 -0.05995861 -0.00055824
NB10 -80.85462849 -12.03750808 -10.87499969 -1.24449259 -1.18607925 0.72154825 -0.01559627 -0.07071454 -0.47539766 -0.07071454 -0.00025429
NB11 -863.92801051 -55.03744543 -50.82998682 -4.22516021 -3.36557248 1.95127453 -0.0224962 -0.17019269 -0.89149088 -0.17019269 -0.00001283
NB12 -373.00187544 -25.6976843 -23.66872922 -2.02961924 -1.70240792 1.00008699 -0.01125371 -0.07861606 -0.44946367 -0.07861606 -0.00033373
NB13 -432.22125217 -27.87074398 -25.71418822 -2.15419821 -1.74847508 1.02121839 -0.00979884 -0.08460192 -0.45543727 -0.08460192 -0.00000244
NB14 -465.3468177 -33.77702213 -31.02993166 -2.7507035 -2.40023582 1.41676516 -0.01882568 -0.11401896 -0.68288719 -0.11401896 -0.00113221
NB15 -406.1249326 -31.60956663 -28.99176608 -2.62330034 -2.35482308 1.3952601 -0.01966624 -0.1090638 -0.67762007 -0.1090638 -0.001802
NB16 -116.45861731 -12.06115025 -11.00696825 -1.10336478 -0.94568153 0.56258287 -0.00778558 -0.04864921 -0.28681273 -0.04864921 0
NB17 -197.49267946 -33.24384588 -29.98287354 -3.3496411 -3.49190625 2.1021422 -0.04277035 -0.18917323 -1.25797059 -0.18917323 -0.00707466
NB18 -33.62226527 -6.58305417 -5.89654441 -0.68563952 -0.78237953 0.48763769 -0.00784422 -0.02824092 -0.25885345 -0.02824092 -0.00098911
NB19 -1.84240054 -1.01649221 -0.87763047 -0.14148003 -0.14969531 0.10595107 -0.00113251 0 -0.0374955 0 0
NB20 -496.6317026 -30.16304169 -27.85921339 -2.28914074 -1.79632398 1.04518669 -0.00829399 -0.08769684 -0.45141355 -0.08769684 0
NB21 -97.10999871 -15.31388704 -13.84367717 -1.53013984 -1.63679605 0.99806491 -0.01646968 -0.08028329 -0.58270964 -0.08028329 -0.00185416
NB22 -179.31191976 -20.7898505 -18.96013451 -1.95677971 -1.80264464 1.07469423 -0.0179851 -0.1023999 -0.61983607 -0.1023999 -0.0009443
NB23 -134.25268336 -17.85113721 -16.23085935 -1.73017473 -1.71676835 1.03230205 -0.017421 -0.09662254 -0.62216305 -0.09662254 -0.00120996
NB24 -115.68134969 -16.58488159 -15.04228427 -1.62808113 -1.677412 1.01473442 -0.01725855 -0.08892951 -0.60336973 -0.08892951 -0.00169357
NB25 -295.79539542 -42.16389104 -38.28142498 -4.12594305 -4.11840492 2.4577336 -0.06464939 -0.24267444 -1.54131596 -0.24267444 -0.00718201
NB26 -332.96440423 -44.67056649 -40.63741856 -4.32845258 -4.19606992 2.49171625 -0.0683109 -0.25857152 -1.5838103 -0.25857152 -0.00552757
NB27 -245.13383958 -31.63369341 -28.74789942 -3.10132594 -2.95332948 1.77693939 -0.04315603 -0.15763518 -1.09736589 -0.15763518 -0.00307519
NB28 -227.38155994 -27.54566073 -25.1177961 -2.65369706 -2.47828583 1.48208238 -0.04202041 -0.14171363 -0.93731449 -0.14171363 -0.00115126
NB29 -587.21458524 -48.48656614 -44.44045328 -4.19493016 -3.66890412 2.17115688 -0.04194755 -0.19892352 -1.1996297 -0.19892352 -0.00200239
NB30 -602.20973415 -49.55280573 -45.44078824 -4.28979176 -3.70315469 2.18620015 -0.04264088 -0.20883403 -1.23711977 -0.20883403 -0.00092743
NB31 -912.48904949 -62.68427728 -57.75850507 -4.98173757 -4.18534425 2.44787246 -0.03710243 -0.21397342 -1.19288927 -0.21397342 -0.00146364
NB32 -588.48596778 -46.43409029 -42.67353297 -3.91377834 -3.37455342 1.98169605 -0.0370373 -0.18573167 -1.07189011 -0.18573167 -0.0010338
NB33 -569.91223811 -45.16691956 -41.50170878 -3.80546836 -3.33706492 1.96285225 -0.03878125 -0.18213463 -1.06602021 -0.18213463 -0.00194083
NB34 -746.00224847 -51.39610114 -47.34324213 -4.05357657 -3.40592873 1.998883 -0.02315942 -0.15857396 -0.90160671 -0.15857396 -0.00191122
NB35 -864.44052495 -55.74314358 -51.43542774 -4.30219908 -3.49814969 2.04083364 -0.02035854 -0.17054692 -0.91351691 -0.17054692 -0.00120221
NB36 -805.22185502 -53.56989637 -49.39307169 -4.17554917 -3.45259864 2.01933723 -0.02226386 -0.1652413 -0.90871063 -0.1652413 -0.00165407
NB37 -897.56562518 -61.64994092 -56.75503417 -4.89481037 -4.15055342 2.43531048 -0.02984238 -0.20097795 -1.14286643 -0.20097795 -0.00352882
NB38 -486.97807685 -43.65054769 -39.8760471 -3.85984418 -3.54248095 2.11483565 -0.03601708 -0.18137509 -1.15550531 -0.18137509 -0.00431204
NB39 -838.34406388 -59.48234328 -54.72052157 -4.7653164 -4.10567074 2.41350181 -0.03113693 -0.19686257 -1.13911853 -0.19686257 -0.0044234
NB40 -313.94955796 -45.30624734 -40.99280405 -4.44947828 -4.43815972 2.66358601 -0.05071297 -0.23826774 -1.5460652 -0.23826774 -0.00850792
NB41 -150.08046516 -18.64467576 -16.90449004 -1.78773721 -1.72827038 1.0498413 -0.01573401 -0.07700918 -0.54606355 -0.07700918 -0.0014926
NB42 -498.47371853 -31.17983263 -28.73742146 -2.42992574 -1.94613852 1.1509764 -0.00945056 -0.08774739 -0.48902707 -0.08774739 -0.00013007
NB43 -118.3008072 -13.07783991 -11.88497696 -1.24432736 -1.09545632 0.66837091 -0.00895418 -0.04867097 -0.32436976 -0.04867097 -0.00011016
NB44 -232.91699731 -24.12257104 -22.01452172 -2.20592361 -1.89148288 1.1248521 -0.01568119 -0.09735235 -0.57382549 -0.09735235 -0.00027303
NB45 -613.08982933 -42.22461743 -38.86712814 -3.39138402 -2.74219448 1.60741504 -0.01617185 -0.13644202 -0.73852954 -0.13644202 -0.00035621
NB46 -67.24201863 -13.16767782 -11.79637811 -1.36765508 -1.56540902 0.97438881 -0.01584387 -0.05701525 -0.51896274 -0.05701525 -0.00354438
NB47 -131.7180516 -21.95272222 -19.75195476 -2.29827058 -2.30368532 1.41226592 -0.02884171 -0.1206619 -0.87627933 -0.1206619 -0.0026165
NB48 -132.62025348 -23.47515569 -21.10128339 -2.42202597 -2.58711183 1.58658134 -0.03102771 -0.11442664 -0.91555975 -0.11442664 -0.00658252
NB49 -394.92996737 -66.54009462 -60.01904368 -6.68984024 -6.98847136 4.20316978 -0.08505195 -0.38146301 -2.52087047 -0.38146301 -0.01956647
NB50 -394.92946432 -66.54449984 -60.02242153 -6.68925024 -6.98857863 4.20266928 -0.08522063 -0.3805761 -2.51756081 -0.3805761 -0.01922505
NB51 -394.9289311 -66.5416936 -60.02184486 -6.68705466 -6.98888004 4.20236882 -0.0851528 -0.3821425 -2.52204463 -0.3821425 -0.02080521
NB52 -197.46851433 -33.26907205 -30.00568391 -3.3492672 -3.49338075 2.10240733 -0.0425046 -0.1889247 -1.25571374 -0.1889247 -0.00702824
