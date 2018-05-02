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
"================================ Total(358) ================================"
"There are about :                                                           " 
" 1)  223 HOFs from the G3 set                                               "
" 2)   76 Barrier Heights from Trulhar's set                                 "
" 3)   31 Non Bonding interactions from NCIE set                             "
" 4)   22 Non Bonding interactions from S22  set                             "
" 5)    6 n-alkane dimers from ADIM6                                         "
" NOTE :: "
" 1) G3 atomization is generated using freq scale factor 0.9877 and          "
"    correct SO contribution                                                 "
" 2) G3Large basis set is used here                                          "
" 3) BSSE is considered                                                      "
" 4) w=200 range-seperate PT2 used                                           "

__initial guess__ ::
# For XYG3
0.8033, 0.2107, 0.6667

# "There are several algorithms at present:                                  "
# "   0) batch           :: just batch the results based on intital guess    "
# "   1) leastsq         :: least square fit algorithm                       "
# "   2) fmin_rms        :: downhill simplex algorithm based on RMS          "
# "   3) fmin_mad        :: downhill simplex algorithm based on MAD          "
# "   4) fmin_cobyla_rms :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on RMS                            "
# "   5) fmin_cobyla_mad :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on MAD                            "
__optimization algorithm__ :: fmin_mad

__optimization job__ :: xyg3

__optimization function__ :: 31
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a1, a3, a4 = C
    a2  = 1. - a1
    a5  = a4
    a6  = 0.
    a7  = 1. - a4
    a8  = 1. - a4
    a9  = 1. - a4
    a10 = a4
    a11 = a4
    a12 = a4

    E_noXC, Ex_HF, Ex_LDA, dEx_B, Ec_VWN, dEc_LYP, Ec_PT21, aaaa, abab, bbbb,\
    aaaa_erf200, abab_erf200, bbbb_erf200 = P
    return E_noXC + a1*Ex_HF + a2*Ex_LDA + a3*dEx_B + a4*Ec_VWN + a5* dEc_LYP \
           + a6*Ec_PT21 + a7*aaaa + a8*abab + a9*bbbb\
    	   + a10*aaaa_erf200 + a11*abab_erf200 + a12*bbbb_erf200

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
#               912 = 17+223+31+15+21+19+52+48+56+34+18+180+111+29+9+19+30 is the total number of jobs in this batch list
__batch__ ::  912
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
# Molecules for NCIE-BSSE :: 48
 1-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 2-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 3-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 4-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 4-2_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 5-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 6-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 7-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 7-2_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 8-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 8-2_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 9-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
 9-2_NCIE       <PATH1>/.                    XYG3_Comp      energy 
10-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
10-2_NCIE       <PATH1>/.                    XYG3_Comp      energy 
11-1_NCIE       <PATH1>/.                    XYG3_Comp      energy 
11-2_NCIE       <PATH1>/.                    XYG3_Comp      energy 
12-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
12-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
13-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
13-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
14-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
15-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
16-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
16-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
17-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
17-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
18-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
18-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
19-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
19-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
20-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
20-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
21-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
21-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
22-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
22-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
23-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
23-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
24-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
25-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
25-2_NCIE       <PATH2>/.                    XYG3_Comp      energy
26-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
27-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
28-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
29-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
30-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
31-1_NCIE       <PATH2>/.                    XYG3_Comp      energy
# Molecules for S22 :: 56
 S22_1          <PATH1>/.                    XYG3_Comp      energy 
 S22_01a        <PATH1>/.                    XYG3_Comp      energy 
 S22_2          <PATH1>/.                    XYG3_Comp      energy 
 S22_02a        <PATH1>/.                    XYG3_Comp      energy 
 S22_3          <PATH1>/.                    XYG3_Comp      energy 
 S22_03a        <PATH1>/.                    XYG3_Comp      energy 
 S22_4          <PATH1>/.                    XYG3_Comp      energy 
 S22_04a        <PATH1>/.                    XYG3_Comp      energy 
 S22_5          <PATH1>/.                    XYG3_Comp      energy 
 S22_05a        <PATH1>/.                    XYG3_Comp      energy 
 S22_6          <PATH1>/.                    XYG3_Comp      energy 
 S22_06a        <PATH1>/.                    XYG3_Comp      energy 
 S22_06b        <PATH1>/.                    XYG3_Comp      energy 
 S22_7          <PATH1>/.                    XYG3_Comp      energy 
 S22_07a        <PATH1>/.                    XYG3_Comp      energy 
 S22_07b        <PATH1>/.                    XYG3_Comp      energy 
 S22_8          <PATH1>/.                    XYG3_Comp      energy 
 S22_08a        <PATH2>/.                    XYG3_Comp      energy
 S22_9          <PATH2>/.                    XYG3_Comp      energy
 S22_09a        <PATH2>/.                    XYG3_Comp      energy
 S22_10         <PATH2>/.                    XYG3_Comp      energy
 S22_10a        <PATH2>/.                    XYG3_Comp      energy
 S22_10b        <PATH2>/.                    XYG3_Comp      energy
 S22_11         <PATH2>/.                    XYG3_Comp      energy
 S22_11a        <PATH2>/.                    XYG3_Comp      energy
 S22_12         <PATH2>/.                    XYG3_Comp      energy
 S22_12a        <PATH2>/.                    XYG3_Comp      energy
 S22_13         <PATH2>/.                    XYG3_Comp      energy
 S22_13a        <PATH2>/.                    XYG3_Comp      energy
 S22_14         <PATH2>/.                    XYG3_Comp      energy
 S22_14a        <PATH2>/.                    XYG3_Comp      energy
 S22_14b        <PATH2>/.                    XYG3_Comp      energy
 S22_15         <PATH2>/.                    XYG3_Comp      energy
 S22_15a        <PATH2>/.                    XYG3_Comp      energy
 S22_15b        <PATH2>/.                    XYG3_Comp      energy
 S22_16         <PATH2>/.                    XYG3_Comp      energy
 S22_16a        <PATH2>/.                    XYG3_Comp      energy
 S22_16b        <PATH2>/.                    XYG3_Comp      energy
 S22_17         <PATH2>/.                    XYG3_Comp      energy
 S22_17a        <PATH2>/.                    XYG3_Comp      energy
 S22_17b        <PATH2>/.                    XYG3_Comp      energy
 S22_18         <PATH2>/.                    XYG3_Comp      energy
 S22_18a        <PATH2>/.                    XYG3_Comp      energy
 S22_18b        <PATH2>/.                    XYG3_Comp      energy
 S22_19         <PATH2>/.                    XYG3_Comp      energy
 S22_19a        <PATH2>/.                    XYG3_Comp      energy
 S22_19b        <PATH2>/.                    XYG3_Comp      energy
 S22_20         <PATH2>/.                    XYG3_Comp      energy
 S22_20a        <PATH2>/.                    XYG3_Comp      energy
 S22_20b        <PATH2>/.                    XYG3_Comp      energy
 S22_21         <PATH2>/.                    XYG3_Comp      energy
 S22_21a        <PATH2>/.                    XYG3_Comp      energy
 S22_21b        <PATH2>/.                    XYG3_Comp      energy
 S22_22         <PATH2>/.                    XYG3_Comp      energy
 S22_22a        <PATH2>/.                    XYG3_Comp      energy
 S22_22b        <PATH2>/.                    XYG3_Comp      energy
# Molecules for S22_BSSE :: 34
  01a_S22       <PATH1>/.                    XYG3_Comp      energy 
  02a_S22       <PATH1>/.                    XYG3_Comp      energy 
  03a_S22       <PATH1>/.                    XYG3_Comp      energy 
  04a_S22       <PATH1>/.                    XYG3_Comp      energy 
  05a_S22       <PATH1>/.                    XYG3_Comp      energy 
  06a_S22       <PATH1>/.                    XYG3_Comp      energy 
  06b_S22       <PATH1>/.                    XYG3_Comp      energy 
  07a_S22       <PATH1>/.                    XYG3_Comp      energy 
  07b_S22       <PATH1>/.                    XYG3_Comp      energy 
  08a_S22       <PATH1>/.                    XYG3_Comp      energy 
  09a_S22       <PATH1>/.                    XYG3_Comp      energy 
  10a_S22       <PATH1>/.                    XYG3_Comp      energy 
  10b_S22       <PATH1>/.                    XYG3_Comp      energy 
  11a_S22       <PATH1>/.                    XYG3_Comp      energy 
  12a_S22       <PATH1>/.                    XYG3_Comp      energy 
  13a_S22       <PATH1>/.                    XYG3_Comp      energy 
  14a_S22       <PATH1>/.                    XYG3_Comp      energy 
  14b_S22       <PATH2>/.                    XYG3_Comp      energy
  15a_S22       <PATH2>/.                    XYG3_Comp      energy
  15b_S22       <PATH2>/.                    XYG3_Comp      energy
  16a_S22       <PATH2>/.                    XYG3_Comp      energy
  16b_S22       <PATH2>/.                    XYG3_Comp      energy
  17a_S22       <PATH2>/.                    XYG3_Comp      energy
  17b_S22       <PATH2>/.                    XYG3_Comp      energy
  18a_S22       <PATH2>/.                    XYG3_Comp      energy
  18b_S22       <PATH2>/.                    XYG3_Comp      energy
  19a_S22       <PATH2>/.                    XYG3_Comp      energy
  19b_S22       <PATH2>/.                    XYG3_Comp      energy
  20a_S22       <PATH2>/.                    XYG3_Comp      energy
  20b_S22       <PATH2>/.                    XYG3_Comp      energy
  21a_S22       <PATH2>/.                    XYG3_Comp      energy
  21b_S22       <PATH2>/.                    XYG3_Comp      energy
  22a_S22       <PATH2>/.                    XYG3_Comp      energy
  22b_S22       <PATH2>/.                    XYG3_Comp      energy
# Molecules for ADIM6 + BSSE :: 12 + 6
       AM2      <PATH1>/.                    XYG3_Comp      energy 
       AD2      <PATH1>/.                    XYG3_Comp      energy 
       AM3      <PATH1>/.                    XYG3_Comp      energy 
       AD3      <PATH1>/.                    XYG3_Comp      energy 
       AM4      <PATH1>/.                    XYG3_Comp      energy 
       AD4      <PATH1>/.                    XYG3_Comp      energy 
       AM5      <PATH1>/.                    XYG3_Comp      energy 
       AD5      <PATH1>/.                    XYG3_Comp      energy 
       AM6      <PATH1>/.                    XYG3_Comp      energy 
       AD6      <PATH1>/.                    XYG3_Comp      energy 
       AM7      <PATH1>/.                    XYG3_Comp      energy 
       AD7      <PATH1>/.                    XYG3_Comp      energy 
  AM2_BSSE      <PATH1>/.                    XYG3_Comp      energy 
  AM3_BSSE      <PATH1>/.                    XYG3_Comp      energy 
  AM4_BSSE      <PATH1>/.                    XYG3_Comp      energy 
  AM5_BSSE      <PATH1>/.                    XYG3_Comp      energy 
  AM6_BSSE      <PATH1>/.                    XYG3_Comp      energy 
  AM7_BSSE      <PATH2>/.                    XYG3_Comp      energy
# MB08 :: 180
 MB08-001       <PATH2>/.                    XYG3_Comp      energy 
 MB08-002       <PATH2>/.                    XYG3_Comp      energy 
 MB08-003       <PATH2>/.                    XYG3_Comp      energy 
 MB08-004       <PATH2>/.                    XYG3_Comp      energy 
 MB08-005       <PATH2>/.                    XYG3_Comp      energy 
 MB08-006       <PATH2>/.                    XYG3_Comp      energy 
 MB08-007       <PATH2>/.                    XYG3_Comp      energy 
 MB08-008       <PATH2>/.                    XYG3_Comp      energy 
 MB08-009       <PATH2>/.                    XYG3_Comp      energy 
 MB08-010       <PATH2>/.                    XYG3_Comp      energy 
 MB08-011       <PATH2>/.                    XYG3_Comp      energy 
 MB08-012       <PATH2>/.                    XYG3_Comp      energy 
 MB08-013       <PATH2>/.                    XYG3_Comp      energy 
 MB08-014       <PATH2>/.                    XYG3_Comp      energy 
 MB08-015       <PATH2>/.                    XYG3_Comp      energy 
 MB08-016       <PATH2>/.                    XYG3_Comp      energy 
 MB08-017       <PATH2>/.                    XYG3_Comp      energy 
 MB08-018       <PATH2>/.                    XYG3_Comp      energy 
 MB08-019       <PATH2>/.                    XYG3_Comp      energy 
 MB08-020       <PATH2>/.                    XYG3_Comp      energy 
 MB08-021       <PATH2>/.                    XYG3_Comp      energy 
 MB08-022       <PATH2>/.                    XYG3_Comp      energy 
 MB08-023       <PATH2>/.                    XYG3_Comp      energy 
 MB08-024       <PATH2>/.                    XYG3_Comp      energy 
 MB08-025       <PATH2>/.                    XYG3_Comp      energy 
 MB08-026       <PATH2>/.                    XYG3_Comp      energy 
 MB08-027       <PATH2>/.                    XYG3_Comp      energy 
 MB08-028       <PATH2>/.                    XYG3_Comp      energy 
 MB08-029       <PATH2>/.                    XYG3_Comp      energy 
 MB08-030       <PATH2>/.                    XYG3_Comp      energy 
 MB08-031       <PATH2>/.                    XYG3_Comp      energy 
 MB08-032       <PATH2>/.                    XYG3_Comp      energy 
 MB08-033       <PATH2>/.                    XYG3_Comp      energy 
 MB08-034       <PATH2>/.                    XYG3_Comp      energy 
 MB08-035       <PATH2>/.                    XYG3_Comp      energy 
 MB08-036       <PATH2>/.                    XYG3_Comp      energy 
 MB08-037       <PATH2>/.                    XYG3_Comp      energy 
 MB08-038       <PATH2>/.                    XYG3_Comp      energy 
 MB08-039       <PATH2>/.                    XYG3_Comp      energy 
 MB08-040       <PATH2>/.                    XYG3_Comp      energy 
 MB08-041       <PATH2>/.                    XYG3_Comp      energy 
 MB08-042       <PATH2>/.                    XYG3_Comp      energy 
 MB08-043       <PATH2>/.                    XYG3_Comp      energy 
 MB08-044       <PATH2>/.                    XYG3_Comp      energy 
 MB08-045       <PATH2>/.                    XYG3_Comp      energy 
 MB08-046       <PATH2>/.                    XYG3_Comp      energy 
 MB08-047       <PATH2>/.                    XYG3_Comp      energy 
 MB08-048       <PATH2>/.                    XYG3_Comp      energy 
 MB08-049       <PATH2>/.                    XYG3_Comp      energy 
 MB08-050       <PATH2>/.                    XYG3_Comp      energy 
 MB08-051       <PATH2>/.                    XYG3_Comp      energy 
 MB08-052       <PATH2>/.                    XYG3_Comp      energy 
 MB08-053       <PATH2>/.                    XYG3_Comp      energy 
 MB08-054       <PATH2>/.                    XYG3_Comp      energy 
 MB08-055       <PATH2>/.                    XYG3_Comp      energy 
 MB08-056       <PATH2>/.                    XYG3_Comp      energy 
 MB08-057       <PATH2>/.                    XYG3_Comp      energy 
 MB08-058       <PATH2>/.                    XYG3_Comp      energy 
 MB08-059       <PATH2>/.                    XYG3_Comp      energy 
 MB08-060       <PATH2>/.                    XYG3_Comp      energy 
 MB08-061       <PATH2>/.                    XYG3_Comp      energy 
 MB08-062       <PATH2>/.                    XYG3_Comp      energy 
 MB08-063       <PATH2>/.                    XYG3_Comp      energy 
 MB08-064       <PATH2>/.                    XYG3_Comp      energy 
 MB08-065       <PATH2>/.                    XYG3_Comp      energy 
 MB08-066       <PATH2>/.                    XYG3_Comp      energy 
 MB08-067       <PATH2>/.                    XYG3_Comp      energy 
 MB08-068       <PATH2>/.                    XYG3_Comp      energy 
 MB08-069       <PATH2>/.                    XYG3_Comp      energy 
 MB08-070       <PATH2>/.                    XYG3_Comp      energy 
 MB08-071       <PATH2>/.                    XYG3_Comp      energy 
 MB08-072       <PATH2>/.                    XYG3_Comp      energy 
 MB08-073       <PATH2>/.                    XYG3_Comp      energy 
 MB08-074       <PATH2>/.                    XYG3_Comp      energy 
 MB08-075       <PATH2>/.                    XYG3_Comp      energy 
 MB08-076       <PATH2>/.                    XYG3_Comp      energy 
 MB08-077       <PATH2>/.                    XYG3_Comp      energy 
 MB08-078       <PATH2>/.                    XYG3_Comp      energy 
 MB08-079       <PATH2>/.                    XYG3_Comp      energy 
 MB08-080       <PATH2>/.                    XYG3_Comp      energy 
 MB08-081       <PATH2>/.                    XYG3_Comp      energy 
 MB08-082       <PATH2>/.                    XYG3_Comp      energy 
 MB08-083       <PATH2>/.                    XYG3_Comp      energy 
 MB08-084       <PATH2>/.                    XYG3_Comp      energy 
 MB08-085       <PATH2>/.                    XYG3_Comp      energy 
 MB08-086       <PATH2>/.                    XYG3_Comp      energy 
 MB08-087       <PATH2>/.                    XYG3_Comp      energy 
 MB08-088       <PATH2>/.                    XYG3_Comp      energy 
 MB08-089       <PATH2>/.                    XYG3_Comp      energy 
 MB08-090       <PATH2>/.                    XYG3_Comp      energy 
 MB08-091       <PATH2>/.                    XYG3_Comp      energy 
 MB08-092       <PATH2>/.                    XYG3_Comp      energy 
 MB08-093       <PATH2>/.                    XYG3_Comp      energy 
 MB08-094       <PATH2>/.                    XYG3_Comp      energy 
 MB08-095       <PATH2>/.                    XYG3_Comp      energy 
 MB08-096       <PATH2>/.                    XYG3_Comp      energy 
 MB08-097       <PATH2>/.                    XYG3_Comp      energy 
 MB08-098       <PATH2>/.                    XYG3_Comp      energy 
 MB08-099       <PATH2>/.                    XYG3_Comp      energy 
 MB08-100       <PATH2>/.                    XYG3_Comp      energy 
 MB08-101       <PATH2>/.                    XYG3_Comp      energy 
 MB08-102       <PATH2>/.                    XYG3_Comp      energy 
 MB08-103       <PATH2>/.                    XYG3_Comp      energy 
 MB08-104       <PATH2>/.                    XYG3_Comp      energy 
 MB08-105       <PATH2>/.                    XYG3_Comp      energy 
 MB08-106       <PATH2>/.                    XYG3_Comp      energy 
 MB08-107       <PATH2>/.                    XYG3_Comp      energy 
 MB08-108       <PATH2>/.                    XYG3_Comp      energy 
 MB08-109       <PATH2>/.                    XYG3_Comp      energy 
 MB08-110       <PATH2>/.                    XYG3_Comp      energy 
 MB08-111       <PATH2>/.                    XYG3_Comp      energy 
 MB08-112       <PATH2>/.                    XYG3_Comp      energy 
 MB08-113       <PATH2>/.                    XYG3_Comp      energy 
 MB08-114       <PATH2>/.                    XYG3_Comp      energy 
 MB08-115       <PATH2>/.                    XYG3_Comp      energy 
 MB08-116       <PATH2>/.                    XYG3_Comp      energy 
 MB08-117       <PATH2>/.                    XYG3_Comp      energy 
 MB08-118       <PATH2>/.                    XYG3_Comp      energy 
 MB08-119       <PATH2>/.                    XYG3_Comp      energy 
 MB08-120       <PATH2>/.                    XYG3_Comp      energy 
 MB08-121       <PATH2>/.                    XYG3_Comp      energy 
 MB08-122       <PATH2>/.                    XYG3_Comp      energy 
 MB08-123       <PATH2>/.                    XYG3_Comp      energy 
 MB08-124       <PATH2>/.                    XYG3_Comp      energy 
 MB08-125       <PATH2>/.                    XYG3_Comp      energy 
 MB08-126       <PATH2>/.                    XYG3_Comp      energy 
 MB08-127       <PATH2>/.                    XYG3_Comp      energy 
 MB08-128       <PATH2>/.                    XYG3_Comp      energy 
 MB08-129       <PATH2>/.                    XYG3_Comp      energy 
 MB08-130       <PATH2>/.                    XYG3_Comp      energy 
 MB08-131       <PATH2>/.                    XYG3_Comp      energy 
 MB08-132       <PATH2>/.                    XYG3_Comp      energy 
 MB08-133       <PATH2>/.                    XYG3_Comp      energy 
 MB08-134       <PATH2>/.                    XYG3_Comp      energy 
 MB08-135       <PATH2>/.                    XYG3_Comp      energy 
 MB08-136       <PATH2>/.                    XYG3_Comp      energy 
 MB08-137       <PATH2>/.                    XYG3_Comp      energy 
 MB08-138       <PATH2>/.                    XYG3_Comp      energy 
 MB08-139       <PATH2>/.                    XYG3_Comp      energy 
 MB08-140       <PATH2>/.                    XYG3_Comp      energy 
 MB08-141       <PATH2>/.                    XYG3_Comp      energy 
 MB08-142       <PATH2>/.                    XYG3_Comp      energy 
 MB08-143       <PATH2>/.                    XYG3_Comp      energy 
 MB08-144       <PATH2>/.                    XYG3_Comp      energy 
 MB08-145       <PATH2>/.                    XYG3_Comp      energy 
 MB08-146       <PATH2>/.                    XYG3_Comp      energy 
 MB08-147       <PATH2>/.                    XYG3_Comp      energy 
 MB08-148       <PATH2>/.                    XYG3_Comp      energy 
 MB08-149       <PATH2>/.                    XYG3_Comp      energy 
 MB08-150       <PATH2>/.                    XYG3_Comp      energy 
 MB08-151       <PATH2>/.                    XYG3_Comp      energy 
 MB08-152       <PATH2>/.                    XYG3_Comp      energy 
 MB08-153       <PATH2>/.                    XYG3_Comp      energy 
 MB08-154       <PATH2>/.                    XYG3_Comp      energy 
 MB08-155       <PATH2>/.                    XYG3_Comp      energy 
 MB08-156       <PATH2>/.                    XYG3_Comp      energy 
 MB08-157       <PATH2>/.                    XYG3_Comp      energy 
 MB08-158       <PATH2>/.                    XYG3_Comp      energy 
 MB08-159       <PATH2>/.                    XYG3_Comp      energy 
 MB08-160       <PATH2>/.                    XYG3_Comp      energy 
 MB08-161       <PATH2>/.                    XYG3_Comp      energy 
 MB08-162       <PATH2>/.                    XYG3_Comp      energy 
 MB08-163       <PATH2>/.                    XYG3_Comp      energy 
 MB08-164       <PATH2>/.                    XYG3_Comp      energy 
 MB08-165       <PATH2>/.                    XYG3_Comp      energy 
 MB08-166_h     <PATH2>/.                    XYG3_Comp      energy 
 MB08-167_li    <PATH2>/.                    XYG3_Comp      energy  
 MB08-168_be    <PATH2>/.                    XYG3_Comp      energy  
 MB08-169_b     <PATH2>/.                    XYG3_Comp      energy    
 MB08-170_c     <PATH2>/.                    XYG3_Comp      energy      
 MB08-171_n     <PATH2>/.                    XYG3_Comp      energy      
 MB08-172_o     <PATH2>/.                    XYG3_Comp      energy       
 MB08-173_f     <PATH2>/.                    XYG3_Comp      energy    
 MB08-174_na    <PATH2>/.                    XYG3_Comp      energy       
 MB08-175_mg    <PATH2>/.                    XYG3_Comp      energy      
 MB08-176_al    <PATH2>/.                    XYG3_Comp      energy     
 MB08-177_si    <PATH2>/.                    XYG3_Comp      energy       
 MB08-178_p     <PATH2>/.                    XYG3_Comp      energy       
 MB08-179_s     <PATH2>/.                    XYG3_Comp      energy        
 MB08-180_cl    <PATH2>/.                    XYG3_Comp      energy   
# W8 :: 111
 W4-alcl3       <PATH1>/.                    XYG3_Comp      energy
 W4-alcl        <PATH1>/.                    XYG3_Comp      energy
 W4-al          <PATH1>/.                    XYG3_Comp      energy
 W4-alf3        <PATH1>/.                    XYG3_Comp      energy
 W4-alf         <PATH1>/.                    XYG3_Comp      energy
 W4-alh3        <PATH1>/.                    XYG3_Comp      energy
 W4-alh         <PATH1>/.                    XYG3_Comp      energy
 W4-b2          <PATH1>/.                    XYG3_Comp      energy
 W4-b2h6        <PATH1>/.                    XYG3_Comp      energy
 W4-b           <PATH1>/.                    XYG3_Comp      energy
 W4-be2         <PATH1>/.                    XYG3_Comp      energy
 W4-becl2       <PATH1>/.                    XYG3_Comp      energy
 W4-be          <PATH1>/.                    XYG3_Comp      energy
 W4-bef2        <PATH1>/.                    XYG3_Comp      energy
 W4-bf2h        <PATH1>/.                    XYG3_Comp      energy
 W4-bf3         <PATH1>/.                    XYG3_Comp      energy
 W4-bf          <PATH1>/.                    XYG3_Comp      energy
 W4-bh3         <PATH1>/.                    XYG3_Comp      energy
 W4-bh          <PATH1>/.                    XYG3_Comp      energy
 W4-bn_S        <PATH1>/.                    XYG3_Comp      energy
 W4-bn_T        <PATH1>/.                    XYG3_Comp      energy
 W4-c2          <PATH1>/.                    XYG3_Comp      energy
 W4-c2h2        <PATH1>/.                    XYG3_Comp      energy
 W4-c2h4        <PATH1>/.                    XYG3_Comp      energy
 W4-c2h6        <PATH1>/.                    XYG3_Comp      energy
 W4-c2h         <PATH1>/.                    XYG3_Comp      energy
 W4-ccl2        <PATH1>/.                    XYG3_Comp      energy
 W4-c           <PATH1>/.                    XYG3_Comp      energy
 W4-cf2         <PATH1>/.                    XYG3_Comp      energy
 W4-cf          <PATH1>/.                    XYG3_Comp      energy
 W4-ch2c        <PATH1>/.                    XYG3_Comp      energy
 W4-ch2ch       <PATH1>/.                    XYG3_Comp      energy
 W4-ch2         <PATH1>/.                    XYG3_Comp      energy
 W4-ch2nh2      <PATH1>/.                    XYG3_Comp      energy
 W4-ch2nh       <PATH1>/.                    XYG3_Comp      energy
 W4-ch2o        <PATH1>/.                    XYG3_Comp      energy
 W4-ch3         <PATH1>/.                    XYG3_Comp      energy
 W4-ch3nh2      <PATH1>/.                    XYG3_Comp      energy
 W4-ch3nh       <PATH1>/.                    XYG3_Comp      energy
 W4-ch4         <PATH1>/.                    XYG3_Comp      energy
 W4-ch          <PATH1>/.                    XYG3_Comp      energy
 W4-cl2         <PATH1>/.                    XYG3_Comp      energy
 W4-cl2o        <PATH1>/.                    XYG3_Comp      energy
 W4-clcn        <PATH1>/.                    XYG3_Comp      energy
 W4-cl          <PATH1>/.                    XYG3_Comp      energy
 W4-clf         <PATH1>/.                    XYG3_Comp      energy
 W4-clo         <PATH1>/.                    XYG3_Comp      energy
 W4-cloo        <PATH1>/.                    XYG3_Comp      energy
 W4-cn          <PATH1>/.                    XYG3_Comp      energy
 W4-co2         <PATH1>/.                    XYG3_Comp      energy
 W4-co          <PATH1>/.                    XYG3_Comp      energy
 W4-cs2         <PATH1>/.                    XYG3_Comp      energy
 W4-cs          <PATH1>/.                    XYG3_Comp      energy
 W4-f2          <PATH1>/.                    XYG3_Comp      energy
 W4-f2o         <PATH1>/.                    XYG3_Comp      energy
 W4-f           <PATH1>/.                    XYG3_Comp      energy
 W4-fo2         <PATH1>/.                    XYG3_Comp      energy
 W4-foof        <PATH1>/.                    XYG3_Comp      energy
 W4-h2cn        <PATH1>/.                    XYG3_Comp      energy
 W4-h2          <PATH1>/.                    XYG3_Comp      energy
 W4-h2o2        <PATH1>/.                    XYG3_Comp      energy
 W4-h2o         <PATH1>/.                    XYG3_Comp      energy
 W4-h2s         <PATH1>/.                    XYG3_Comp      energy
 W4-hcl         <PATH1>/.                    XYG3_Comp      energy
 W4-hcn         <PATH1>/.                    XYG3_Comp      energy
 W4-hco         <PATH1>/.                    XYG3_Comp      energy
 W4-h           <PATH1>/.                    XYG3_Comp      energy
 W4-hf          <PATH1>/.                    XYG3_Comp      energy
 W4-hno         <PATH1>/.                    XYG3_Comp      energy
 W4-hocl        <PATH1>/.                    XYG3_Comp      energy
 W4-hof         <PATH1>/.                    XYG3_Comp      energy
 W4-hoo         <PATH1>/.                    XYG3_Comp      energy
 W4-hs          <PATH1>/.                    XYG3_Comp      energy
 W4-n2          <PATH1>/.                    XYG3_Comp      energy
 W4-n2h2        <PATH1>/.                    XYG3_Comp      energy
 W4-n2h4        <PATH1>/.                    XYG3_Comp      energy
 W4-n2h         <PATH1>/.                    XYG3_Comp      energy
 W4-n2o         <PATH1>/.                    XYG3_Comp      energy
 W4-nccn        <PATH1>/.                    XYG3_Comp      energy
 W4-n           <PATH1>/.                    XYG3_Comp      energy
 W4-nh2         <PATH1>/.                    XYG3_Comp      energy
 W4-nh3         <PATH1>/.                    XYG3_Comp      energy
 W4-nh          <PATH1>/.                    XYG3_Comp      energy
 W4-no2         <PATH1>/.                    XYG3_Comp      energy
 W4-no          <PATH1>/.                    XYG3_Comp      energy
 W4-o2          <PATH1>/.                    XYG3_Comp      energy
 W4-o3          <PATH1>/.                    XYG3_Comp      energy
 W4-oclo        <PATH1>/.                    XYG3_Comp      energy
 W4-o           <PATH1>/.                    XYG3_Comp      energy
 W4-ocs         <PATH1>/.                    XYG3_Comp      energy
 W4-of          <PATH1>/.                    XYG3_Comp      energy
 W4-oh          <PATH1>/.                    XYG3_Comp      energy
 W4-p2          <PATH1>/.                    XYG3_Comp      energy
 W4-p4          <PATH1>/.                    XYG3_Comp      energy
 W4-p           <PATH1>/.                    XYG3_Comp      energy
 W4-ph3         <PATH1>/.                    XYG3_Comp      energy
 W4-s2          <PATH1>/.                    XYG3_Comp      energy
 W4-s2o         <PATH1>/.                    XYG3_Comp      energy
 W4-s3          <PATH1>/.                    XYG3_Comp      energy
 W4-s4          <PATH1>/.                    XYG3_Comp      energy
 W4-s           <PATH1>/.                    XYG3_Comp      energy
 W4-si2h6       <PATH1>/.                    XYG3_Comp      energy
 W4-si          <PATH1>/.                    XYG3_Comp      energy
 W4-sif         <PATH1>/.                    XYG3_Comp      energy
 W4-sih4        <PATH1>/.                    XYG3_Comp      energy
 W4-sih         <PATH1>/.                    XYG3_Comp      energy
 W4-sio         <PATH1>/.                    XYG3_Comp      energy
 W4-so2         <PATH1>/.                    XYG3_Comp      energy
 W4-so3         <PATH1>/.                    XYG3_Comp      energy
 W4-so          <PATH1>/.                    XYG3_Comp      energy
 W4-ssh         <PATH1>/.                    XYG3_Comp      energy
# SIE :: 29
 SIE-aceton+    <PATH1>/.                  XYG3_Comp       energy
 SIE-acetyl     <PATH1>/.                  XYG3_Comp       energy
 SIE-but+       <PATH1>/.                  XYG3_Comp       energy
 SIE-bz         <PATH1>/.                  XYG3_Comp       energy
 SIE-bz_li      <PATH1>/.                  XYG3_Comp       energy
 SIE-c2h4       <PATH1>/.                  XYG3_Comp       energy
 SIE-c2h4_f2    <PATH1>/.                  XYG3_Comp       energy
 SIE-ch3        <PATH1>/.                  XYG3_Comp       energy
 SIE-clclf      <PATH1>/.                  XYG3_Comp       energy
 SIE-clfcl      <PATH1>/.                  XYG3_Comp       energy
 SIE-clf        <PATH1>/.                  XYG3_Comp       energy
 SIE-ethyl      <PATH1>/.                  XYG3_Comp       energy
 SIE-ethyl+     <PATH1>/.                  XYG3_Comp       energy
 SIE-f2         <PATH1>/.                  XYG3_Comp       energy
 SIE-h2o2+      <PATH1>/.                  XYG3_Comp       energy
 SIE-h2o        <PATH1>/.                  XYG3_Comp       energy
 SIE-h2o+       <PATH1>/.                  XYG3_Comp       energy
 SIE-he2+       <PATH1>/.                  XYG3_Comp       energy
 SIE-he         <PATH1>/.                  XYG3_Comp       energy
 SIE-he+        <PATH1>/.                  XYG3_Comp       energy
 SIE-li         <PATH1>/.                  XYG3_Comp       energy
 SIE-li_f2      <PATH1>/.                  XYG3_Comp       energy
 SIE-mgo        <PATH1>/.                  XYG3_Comp       energy
 SIE-na         <PATH1>/.                  XYG3_Comp       energy
 SIE-naomg      <PATH1>/.                  XYG3_Comp       energy
 SIE-nh32+      <PATH1>/.                  XYG3_Comp       energy
 SIE-nh3_clf    <PATH1>/.                  XYG3_Comp       energy
 SIE-nh3        <PATH1>/.                  XYG3_Comp       energy
 SIE-nh3+       <PATH1>/.                  XYG3_Comp       energy
# O3ADD :: 9
 O3ADD-c2h2           <PATH1>/.                  XYG3_Comp          energy
 O3ADD-c2h4           <PATH1>/.                  XYG3_Comp          energy
 O3ADD-o3_c2h2_add    <PATH1>/.                  XYG3_Comp          energy
 O3ADD-o3_c2h2_ts     <PATH1>/.                  XYG3_Comp          energy
 O3ADD-o3_c2h2_vdw    <PATH1>/.                  XYG3_Comp          energy
 O3ADD-o3_c2h4_add    <PATH1>/.                  XYG3_Comp          energy
 O3ADD-o3_c2h4_ts     <PATH1>/.                  XYG3_Comp          energy
 O3ADD-o3_c2h4_vdw    <PATH1>/.                  XYG3_Comp          energy
 O3ADD-o3             <PATH1>/.                  XYG3_Comp          energy
# DC9 :: 19
 DC9-13dip           <PATH1>/.                 XYG3_Comp        energy
 DC9-be4             <PATH1>/.                 XYG3_Comp        energy
 DC9-be              <PATH1>/.                 XYG3_Comp        energy
 DC9-c20bowl         <PATH1>/.                 XYG3_Comp        energy
 DC9-c20cage         <PATH1>/.                 XYG3_Comp        energy
 DC9-carbooxo1       <PATH1>/.                 XYG3_Comp        energy
 DC9-carbooxo2       <PATH1>/.                 XYG3_Comp        energy
 DC9-ch2n2           <PATH1>/.                 XYG3_Comp        energy
 DC9-ethen           <PATH1>/.                 XYG3_Comp        energy
 DC9-heptahexaene    <PATH1>/.                 XYG3_Comp        energy
 DC9-heptatriyne     <PATH1>/.                 XYG3_Comp        energy
 DC9-ISO_E35         <PATH1>/.                 XYG3_Comp        energy
 DC9-ISO_E36         <PATH1>/.                 XYG3_Comp        energy
 DC9-ISO_P35         <PATH1>/.                 XYG3_Comp        energy
 DC9-ISO_P36         <PATH1>/.                 XYG3_Comp        energy
 DC9-omcb            <PATH1>/.                 XYG3_Comp        energy
 DC9-s2              <PATH1>/.                 XYG3_Comp        energy
 DC9-s8              <PATH1>/.                 XYG3_Comp        energy
 DC9-tmethen         <PATH1>/.                 XYG3_Comp        energy
# WATER27 :: 30
 WATER27-H2O20        <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O20es      <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O20fc      <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O20fs      <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O2         <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O3         <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O4         <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O5         <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O6b        <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O6c2       <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O6c        <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O6         <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O8d2d      <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O8s4       <PATH1>/.                       XYG3_Comp     energy
 WATER27-H2O          <PATH1>/.                       XYG3_Comp     energy
 WATER27-H3Op         <PATH1>/.                       XYG3_Comp     energy
 WATER27-H3OpH2O2     <PATH1>/.                       XYG3_Comp     energy
 WATER27-H3OpH2O3     <PATH1>/.                       XYG3_Comp     energy
 WATER27-H3OpH2O62d   <PATH1>/.                       XYG3_Comp     energy
 WATER27-H3OpH2O63d   <PATH1>/.                       XYG3_Comp     energy
 WATER27-H3OpH2O6OHm  <PATH1>/.                       XYG3_Comp     energy
 WATER27-H3OpH2O      <PATH1>/.                       XYG3_Comp     energy
 WATER27-OHm          <PATH1>/.                       XYG3_Comp     energy
 WATER27-OHmH2O2      <PATH1>/.                       XYG3_Comp     energy
 WATER27-OHmH2O3      <PATH1>/.                       XYG3_Comp     energy
 WATER27-OHmH2O4c4    <PATH1>/.                       XYG3_Comp     energy
 WATER27-OHmH2O4cs    <PATH1>/.                       XYG3_Comp     energy
 WATER27-OHmH2O5      <PATH1>/.                       XYG3_Comp     energy
 WATER27-OHmH2O6      <PATH1>/.                       XYG3_Comp     energy
 WATER27-OHmH2O       <PATH1>/.                       XYG3_Comp     energy

# Training set for the atomization energy
#              675 = 223+38+38+31+22+6+165+99+11+6+9+27 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 675  1.0
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
# "223 HOFs in the G3 set"
 3         G2-1    -1   Li_0  1  H_0  1                  0.092438920      1.0
 3         G2-2    -1   Be_0  1  H_0  1                  0.079576419      1.0
 3         G2-3    -1    C_0  1  H_0  1                  0.133846814      1.0
 3         G2-4    -1    C_0  1  H_0  2                  0.303529675      1.0
 3         G2-5    -1    C_0  1  H_0  2                  0.288356697      1.0
 3         G2-6    -1    C_0  1  H_0  3                  0.490181060      1.0
 3         G2-7    -1    C_0  1  H_0  4                  0.669846726      1.0
 3         G2-8    -1    N_0  1  H_0  1                  0.133175788      1.0
 3         G2-9    -1    N_0  1  H_0  2                  0.289668645      1.0
 3         G2-10   -1    N_0  1  H_0  3                  0.474927408      1.0
 3         G2-11   -1    O_0  1  H_0  1                  0.170027633      1.0
 3         G2-12   -1    O_0  1  H_0  2                  0.371050337      1.0
 3         G2-13   -1    F_0  1  H_0  1                  0.225404423      1.0
 3         G2-14   -1   Si_0  1  H_0  2                  0.242101638      1.0
 3         G2-15   -1   Si_0  1  H_0  2                  0.208978063      1.0
 3         G2-16   -1   Si_0  1  H_0  3                  0.359873107      1.0
 3         G2-17   -1   Si_0  1  H_0  4                  0.513698487      1.0
 3         G2-18   -1    P_0  1  H_0  2                  0.243728144      1.0
 3         G2-19   -1    P_0  1  H_0  3                  0.385571579      1.0
 3         G2-20   -1    S_0  1  H_0  2                  0.291687684      1.0
 3         G2-21   -1   Cl_0  1  H_0  1                  0.170918205      1.0
 2         G2-22   -1   Li_0  2                          0.038837247      1.0
 3         G2-23   -1   Li_0  1  F_0  1                  0.219902912      1.0
 3         G2-24   -1    C_0  2  H_0  2                  0.646581182      1.0
 3         G2-25   -1    C_0  2  H_0  4                  0.898280729      1.0
 3         G2-26   -1    C_0  2  H_0  6                  1.135303362      1.0
 3         G2-27   -1    C_0  1  N_0  1                  0.289249534      1.0
 4         G2-28   -1    H_0  1  C_0  1  N_0  1          0.498622650      1.0
 3         G2-29   -1    C_0  1  O_0  1                  0.413699003      1.0
 4         G2-30   -1    H_0  1  C_0  1  O_0  1          0.444691167      1.0
 4         G2-31   -1    H_0  2  C_0  1  O_0  1          0.596127550      1.0
 4         G2-32   -1    H_0  4  C_0  1  O_0  1          0.817335028      1.0
 2         G2-33   -1    N_0  2                          0.364115833      1.0
 3         G2-34   -1    N_0  2  H_0  4                  0.698574056      1.0
 3         G2-35   -1    N_0  1  O_0  1                  0.243762078      1.0
 2         G2-36   -1    O_0  2                          0.192472586      1.0
 3         G2-37   -1    H_0  2  O_0  2                  0.428973769      1.0
 2         G2-38   -1    F_0  2                          0.062489929      1.0
 3         G2-39   -1    C_0  1  O_0  2                  0.621151578      1.0
 2         G2-40   -1   Na_0  2                          0.027141797      1.0
 2         G2-41   -1   Si_0  2                          0.120448451      1.0
 2         G2-42   -1    P_0  2                          0.186815045      1.0
 2         G2-43   -1    S_0  2                          0.163739677      1.0
 2         G2-44   -1   Cl_0  2                          0.095023796      1.0
 3         G2-45   -1   Na_0  1 Cl_0  1                  0.157523472      1.0
 3         G2-46   -1   Si_0  1  O_0  1                  0.307495508      1.0
 3         G2-47   -1    S_0  1  C_0  1                  0.274096067      1.0
 3         G2-48   -1    S_0  1  O_0  1                  0.200559119      1.0
 3         G2-49   -1   Cl_0  1  O_0  1                  0.104578353      1.0
 3         G2-50   -1    F_0  1 Cl_0  1                  0.099782694      1.0
 3         G2-51   -1   Si_0  2  H_0  6                  0.846526605      1.0
 4         G2-52   -1    C_0  1  H_0  3 Cl_0  1          0.630132241      1.0
 4         G2-53   -1    H_0  4  C_0  1  S_0  1          0.755841988      1.0
 4         G2-54   -1    H_0  1  O_0  1 Cl_0  1          0.263798173      1.0
 3         G2-55   -1    S_0  1  O_0  2                  0.413253754      1.0
 3         G2-56   -1    F_0  3  B_0  1                  0.751195041      1.0
 3         G2-57   -1   Cl_0  3  B_0  1                  0.518317621      1.0
 3         G2-58   -1    F_0  3 Al_0  1                  0.682154336      1.0
 3         G2-59   -1   Cl_0  3 Al_0  1                  0.492389251      1.0
 3         G2-60   -1    F_0  4  C_0  1                  0.761325656      1.0
 3         G2-61   -1   Cl_0  4  C_0  1                  0.503526448      1.0
 4         G2-62   -1    C_0  1  O_0  1  S_0  1          0.532872906      1.0
 3         G2-63   -1    C_0  1  S_0  2                  0.444730380      1.0
 4         G2-64   -1    C_0  1  F_0  2  O_0  1          0.675993214      1.0
 3         G2-65   -1    F_0  4 Si_0  1                  0.916375731      1.0
 3         G2-66   -1   Cl_0  4 Si_0  1                  0.616922029      1.0
 3         G2-67   -1    N_0  2  O_0  1                  0.431549822      1.0
 4         G2-68   -1   Cl_0  1  N_0  1  O_0  1          0.306616997      1.0
 3         G2-69   -1    F_0  3  N_0  1                  0.327878720      1.0
 3         G2-70   -1    F_0  3  P_0  1                  0.581728666      1.0
 2         G2-71   -1    O_0  3                          0.235051819      1.0
 3         G2-72   -1    F_0  2  O_0  1                  0.149691343      1.0
 3         G2-73   -1    F_0  3 Cl_0  1                  0.202913935      1.0
 3         G2-74   -1    F_0  4  C_0  2                  0.933153587      1.0
 3         G2-75   -1   Cl_0  4  C_0  2                  0.749140609      1.0
 4         G2-76   -1    F_0  3  C_0  2  N_0  1          1.021249184      1.0
 3         G2-77   -1    H_0  4  C_0  3                  1.123771717      1.0
 3         G2-78   -1    H_0  4  C_0  3                  1.121241891      1.0
 3         G2-79   -1    H_0  4  C_0  3                  1.088810576      1.0
 3         G2-80   -1    H_0  6  C_0  3                  1.371859450      1.0
 3         G2-81   -1    H_0  6  C_0  3                  1.360146088      1.0
 3         G2-82   -1    H_0  8  C_0  3                  1.604454397      1.0
 3         G2-83   -1    H_0  6  C_0  4                  1.614242607      1.0
 3         G2-84   -1    H_0  6  C_0  4                  1.600609631      1.0
 3         G2-85   -1    H_0  6  C_0  4                  1.579424869      1.0
 3         G2-86   -1    H_0  6  C_0  4                  1.573683263      1.0
 3         G2-87   -1    H_0  6  C_0  4                  1.596978025      1.0
 3         G2-88   -1    H_0  8  C_0  4                  1.831279070      1.0
 3         G2-89   -1    H_0  8  C_0  4                  1.846778658      1.0
 3         G2-90   -1    H_0 10  C_0  4                  2.073733270      1.0
 3         G2-91   -1    H_0 10  C_0  4                  2.076498939      1.0
 3         G2-92   -1    H_0  8  C_0  5                  2.047133118      1.0
 3         G2-93   -1    H_0  6  C_0  6                  2.180558987      1.0
 4         G2-94   -1    H_0  2  F_0  2  C_0  1          0.696796160      1.0
 4         G2-95   -1    H_0  1  F_0  3  C_0  1          0.731388582      1.0
 4         G2-96   -1    H_0  2 Cl_0  2  C_0  1          0.592057056      1.0
 4         G2-97   -1    H_0  1 Cl_0  3  C_0  1          0.550945544      1.0
 4         G2-98   -1    H_0  5  C_0  1  N_0  1          0.927956118      1.0
 4         G2-99   -1    H_0  3  C_0  2  N_0  1          0.981492270      1.0
 5         G2-100  -1    H_0  3  C_0  1  N_0  1  O_0  2  0.958577978      1.0
 5         G2-101  -1    H_0  3  C_0  1  N_0  1  O_0  2  0.954232915      1.0
 4         G2-102  -1    H_0  6  C_0  1 Si_0  1          1.000424746      1.0
 4         G2-103  -1    H_0  2  C_0  1  O_0  2          0.799177009      1.0
 4         G2-104  -1    H_0  4  C_0  2  O_0  2          1.251476148      1.0
 5         G2-105  -1    H_0  5  C_0  2  N_0  1  O_0  1  1.383439559      1.0
 4         G2-106  -1    H_0  5  C_0  2  N_0  1          1.147607461      1.0
 3         G2-107  -1    N_0  2  C_0  2                  0.800767050      1.0
 4         G2-108  -1    H_0  7  C_0  2  N_0  1          1.387045687      1.0
 4         G2-109  -1    H_0  7  C_0  2  N_0  1          1.398379198      1.0
 4         G2-110  -1    H_0  2  C_0  2  O_0  1          0.849136204      1.0
 4         G2-111  -1    H_0  4  C_0  2  O_0  1          1.037327762      1.0
 4         G2-112  -1    H_0  4  C_0  2  O_0  1          1.079396749      1.0
 4         G2-113  -1    H_0  2  C_0  2  O_0  2          1.010445845      1.0
 4         G2-114  -1    H_0  6  C_0  2  O_0  1          1.291577127      1.0
 4         G2-115  -1    H_0  6  C_0  2  O_0  1          1.271894963      1.0
 4         G2-116  -1    H_0  4  C_0  2  S_0  1          0.995087236      1.0
 5         G2-117  -1    H_0  6  C_0  2  S_0  1  O_0  1  1.364164732      1.0
 4         G2-118  -1    H_0  6  C_0  2  S_0  1          1.226198659      1.0
 4         G2-119  -1    H_0  6  C_0  2  S_0  1          1.223677025      1.0
 4         G2-120  -1    H_0  3  C_0  2  F_0  1          0.912390963      1.0
 4         G2-121  -1    H_0  5  C_0  2 Cl_0  1          1.103039137      1.0
 4         G2-122  -1    H_0  3  C_0  2 Cl_0  1          0.860799279      1.0
 4         G2-123  -1    H_0  3  C_0  3  N_0  1          1.217948397      1.0
 4         G2-124  -1    H_0  6  C_0  3  O_0  1          1.560009935      1.0
 4         G2-125  -1    H_0  4  C_0  2  O_0  2          1.280586863      1.0
 5         G2-126  -1    H_0  3  C_0  2  O_0  1  F_0  1  1.126378552      1.0
 5         G2-127  -1    H_0  3  C_0  2  O_0  1 Cl_0  1  1.065732102      1.0
 4         G2-128  -1    H_0  7  C_0  3 Cl_0  1          1.571914355      1.0
 4         G2-129  -1    H_0  8  C_0  3  O_0  1          1.766606946      1.0
 4         G2-130  -1    H_0  8  C_0  3  O_0  1          1.745352922      1.0
 4         G2-131  -1    H_0  9  C_0  3  N_0  1          1.849521255      1.0
 4         G2-132  -1    H_0  4  C_0  4  O_0  1          1.584779551      1.0
 4         G2-133  -1    H_0  4  C_0  4  S_0  1          1.536009019      1.0
 4         G2-134  -1    H_0  5  C_0  4  N_0  1          1.708568375      1.0
 4         G2-135  -1    H_0  5  C_0  5  N_0  1          1.973374648      1.0
 2         G2-136  -1    H_0  2                          0.174687946      1.0
 3         G2-137  -1    H_0  1  S_0  1                  0.139384221      1.0
 3         G2-138  -1    H_0  1  C_0  2                  0.422995218      1.0
 3         G2-139  -1    H_0  3  C_0  2                  0.709258725      1.0
 4         G2-140  -1    H_0  3  C_0  2  O_0  1          0.927178124      1.0
 4         G2-141  -1    H_0  3  C_0  1  O_0  1          0.653028753      1.0
 4         G2-142  -1    H_0  3  C_0  1  O_0  1          0.638625622      1.0
 4         G2-143  -1    H_0  5  C_0  2  O_0  1          1.110951813      1.0
 4         G2-144  -1    H_0  3  C_0  1  S_0  1          0.608123484      1.0
 3         G2-145  -1    H_0  5  C_0  2                  0.961852236      1.0
 3         G2-146  -1    H_0  7  C_0  3                  1.435106822      1.0
 3         G2-147  -1    H_0  9  C_0  4                  1.910960943      1.0
 3         G2-148  -1    N_0  1  O_0  2                  0.363089655      1.0
 3         G2-149  -1    H_0  6  C_0  4                  1.593492526      1.0
 3         G2-150  -1    H_0  8  C_0  5                  2.088567193      1.0
 3         G2-151  -1    H_0 10  C_0  5                  2.333747122      1.0
 3         G2-152  -1    H_0 12  C_0  5                  2.543263863      1.0
 3         G2-153  -1    H_0 12  C_0  5                  2.550387453      1.0
 3         G2-154  -1    H_0  8  C_0  6                  2.355300866      1.0
 3         G2-155  -1    H_0  8  C_0  6                  2.355756270      1.0
 3         G2-156  -1    H_0 12  C_0  6                  2.813143741      1.0
 3         G2-157  -1    H_0 14  C_0  6                  3.012218258      1.0
 3         G2-158  -1    H_0 14  C_0  6                  3.013703658      1.0
 3         G2-159  -1    H_0  8  C_0  7                  2.653613986      1.0
 3         G2-160  -1    H_0 16  C_0  7                  3.481601627      1.0
 3         G2-161  -1    H_0  8  C_0  8                  2.835998566      1.0
 3         G2-162  -1    H_0 18  C_0  8                  3.950876210      1.0
 3         G2-163  -1    H_0  8  C_0 10                  3.447263034      1.0
 3         G2-164  -1    H_0  8  C_0 10                  3.393512422      1.0
 4         G2-165  -1    H_0  6  C_0  3  O_0  2          1.733602058      1.0
 4         G2-166  -1    H_0 10  C_0  4  O_0  1          2.242081935      1.0
 4         G2-167  -1    H_0  7  C_0  6  N_0  1          2.455078046      1.0
 4         G2-168  -1    H_0  6  C_0  6  O_0  1          2.346744359      1.0
 4         G2-169  -1    H_0  6  C_0  4  O_0  1          1.759257985      1.0
 4         G2-170  -1    H_0  8  C_0  4  O_0  1          2.011543843      1.0
 4         G2-171  -1    H_0  8  C_0  5  O_0  1          2.290303353      1.0
 4         G2-172  -1    H_0  4  C_0  6  O_0  2          2.269736212      1.0
 4         G2-173  -1    H_0  4  C_0  4  N_0  2          1.767034271      1.0
 5         G2-174  -1    H_0  6  C_0  2  O_0  2  S_0  1  1.547668918      1.0
 4         G2-175  -1    H_0  5  C_0  6 Cl_0  1          2.148549661      1.0                                             
 4         G2-176  -1    H_0  4  C_0  4  N_0  2          1.760231166      1.0
 4         G2-177  -1    H_0  4  C_0  4  N_0  2          1.766680174      1.0
 4         G2-178  -1    H_0  4  C_0  4  O_0  1          1.543957934      1.0
 4         G2-179  -1    H_0  6  C_0  4  O_0  1          1.792508867      1.0
 4         G2-180  -1    H_0  6  C_0  4  O_0  3          2.168521950      1.0
 4         G2-181  -1    H_0  6  C_0  4  S_0  1          1.731138394      1.0
 4         G2-182  -1    H_0  7  C_0  4  N_0  1          1.923872143      1.0
 4         G2-183  -1    H_0  8  C_0  4  O_0  1          2.029739309      1.0
 4         G2-184  -1    H_0  8  C_0  4  O_0  1          2.021005089      1.0
 4         G2-185  -1    H_0  8  C_0  4  O_0  2          2.160185427      1.0
 4         G2-186  -1    H_0  8  C_0  4  S_0  1          1.963040120      1.0
 4         G2-187  -1    H_0  9  C_0  4 Cl_0  1          2.051015448      1.0
 4         G2-188  -1    H_0  9  C_0  4 Cl_0  1          2.042106569      1.0
 4         G2-189  -1    H_0  9  C_0  4  N_0  1          2.121143063      1.0
 5         G2-190  -1    H_0  9  C_0  4  N_0  1  O_0  2  2.376223340      1.0
 4         G2-191  -1    H_0 10  C_0  4  O_0  1          2.220239908      1.0
 4         G2-192  -1    H_0 10  C_0  4  O_0  2          2.370816762      1.0
 4         G2-193  -1    H_0 10  C_0  4  S_0  1          2.171650574      1.0
 4         G2-194  -1    H_0 10  C_0  4  S_0  2          2.268177463      1.0
 4         G2-195  -1    H_0 11  C_0  4  N_0  1          2.347423599      1.0
 4         G2-196  -1    H_0 12  C_0  4 Si_0  1          2.464044025      1.0
 4         G2-197  -1    H_0  6  C_0  5  S_0  1          2.008946978      1.0                                                
 4         G2-198  -1    H_0  7  C_0  5  N_0  1          2.171440727      1.0
 4         G2-199  -1    H_0 10  C_0  5  O_0  1          2.488132813      1.0
 4         G2-200  -1    H_0 10  C_0  5  O_0  1          2.498393364      1.0
 4         G2-201  -1    H_0 10  C_0  5  O_0  2          2.682092506      1.0
 4         G2-202  -1    H_0 10  C_0  5  S_0  1          2.435473577      1.0
 4         G2-203  -1    H_0 11  C_0  5  N_0  1          2.599289643      1.0
 4         G2-204  -1    H_0 12  C_0  5  O_0  1          2.692214296      1.0
 4         G2-205  -1    H_0  4  C_0  6  F_0  2          2.210784733      1.0
 4         G2-206  -1    H_0  4  C_0  6  F_0  2          2.209787323      1.0
 4         G2-207  -1    H_0  5  C_0  6  F_0  1          2.196648818      1.0
 4         G2-208  -1    H_0 14  C_0  6  O_0  1          3.167178613      1.0
 3         G2-209  -1    F_0  5  P_0  1                  0.890390013      1.0
 3         G2-210  -1    F_0  6  S_0  1                  0.766139788      1.0
 2         G2-211  -1    P_0  4                          0.461644853      1.0
 3         G2-212  -1    O_0  3  S_0  1                  0.549308787      1.0
 3         G2-213  -1   Cl_0  2  S_0  1                  0.208358575      1.0
 4         G2-214  -1   Cl_0  3  P_0  1  O_0  1          0.575802993      1.0
 3         G2-215  -1   Cl_0  5  P_0  1                  0.498502719      1.0
 4         G2-216  -1   Cl_0  2  O_0  2  S_0  1          0.532864912      1.0
 3         G2-217  -1   Cl_0  3  P_0  1                  0.374376891      1.0
 3         G2-218  -1   Cl_0  2  S_0  2                  0.315107607      1.0
 3         G2-219  -1   Cl_0  2 Si_0  1                  0.331345483      1.0
 4         G2-220  -1    F_0  3 Cl_0  1  C_0  1          0.691225398      1.0
 3         G2-221  -1    F_0  6  C_0  2                  1.260276236      1.0
 3         G2-222  -1    F_0  3  C_0  1                  0.549556598      1.0
 3         G2-223  -1    H_0  5  C_0  6                  1.989083212      1.0
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
 3         NB21   -1   NB1    1                1-1_NCIE    1                                  0.00501984  100.0
 3         NB22   -1   NB2    1                2-1_NCIE    1                                  0.00728275  100.0
 3         NB23   -1   NB3    1                3-1_NCIE    1                                  0.00792019  100.0
 5         NB24   -1   NB3    0.5  NB1   0.5   4-1_NCIE    0.5   4-2_NCIE  0.5                0.01021498  100.0
 3         NB25   -1   NB4    1                5-1_NCIE    1                                  0.02380839  100.0
 3         NB26   -1   NB5    1                6-1_NCIE    1                                  0.02573664  100.0
# 7 Charge transfer comlexes (CT)               : 
 5         NB27   -1   NB6    0.5  NB7   0.5   7-1_NCIE    0.5   7-2_NCIE  0.5                0.00168922  100.0
 5         NB28   -1   NB1    0.5  NB7   0.5   8-1_NCIE    0.5   8-2_NCIE  0.5                0.00288442  100.0
 5         NB29   -1   NB9    0.5  NB8   0.5   9-1_NCIE    0.5   9-2_NCIE  0.5                0.00607162  100.0
 5         NB30   -1   NB10   0.5  NB8   0.5  10-1_NCIE    0.5  10-2_NCIE  0.5                0.00774490  100.0
 5         NB31   -1   NB1    0.5  NB11  0.5  11-1_NCIE    0.5  11-2_NCIE  0.5                0.00777677  100.0
 5         NB32   -1   NB3    0.5  NB8   0.5  12-1_NCIE    0.5  12-2_NCIE  0.5                0.00854170  100.0
 5         NB33   -1   NB1    0.5  NB8   0.5  13-1_NCIE    0.5  13-2_NCIE  0.5                0.01692403  100.0
# 6 Dipole interaction complexes (DI)           : 
 3         NB34   -1   NB12   1               14-1_NCIE    1                                  0.00264538  100.0
 3         NB35   -1   NB13   1               15-1_NCIE    1                                  0.00320314  100.0
 5         NB36   -1   NB12   0.5  NB13  0.5  16-1_NCIE    0.5  16-2_NCIE  0.5                0.00533856  100.0
 5         NB37   -1   NB14   0.5  NB13  0.5  17-1_NCIE    0.5  17-2_NCIE  0.5                0.00565728  100.0
 5         NB38   -1   NB15   0.5  NB10  0.5  18-1_NCIE    0.5  18-2_NCIE  0.5                0.00572102  100.0
 5         NB39   -1   NB15   0.5  NB13  0.5  19-1_NCIE    0.5  19-2_NCIE  0.5                0.00662938  100.0
# 7 Weak interaction complexes (WI)             : 
 5         NB40   -1   NB16   0.5  NB17  0.5  20-1_NCIE   0.5   20-2_NCIE  0.5                0.00074899  100.0
 5         NB41   -1   NB16   0.5  NB18  0.5  21-1_NCIE   0.5   21-2_NCIE  0.5                0.00035059  100.0
 3         NB46   -1   NB18   1               26-1_NCIE   1                                   0.00081274  100.0
 5         NB43   -1   NB19   0.5  NB16  0.5  23-1_NCIE   0.5   23-2_NCIE  0.5                0.00006374  100.0
 5         NB42   -1   NB19   0.5  NB20  0.5  22-1_NCIE   0.5   22-2_NCIE  0.5                0.00009562  100.0
 3         NB44   -1   NB16   1               24-1_NCIE   1                                   0.00012749  100.0
 5         NB45   -1   NB16   0.5  NB20  0.5  25-1_NCIE   0.5   25-2_NCIE  0.5                0.00020717  100.0
# 5 Pi-Pi stacking complexes (PPS)              : 
 3         NB47   -1   NB9    1               27-1_NCIE   1                                   0.00213542  100.0
 3         NB48   -1   NB6    1               28-1_NCIE   1                                   0.00226291  100.0
 3         NB49   -1   NB52   1               29-1_NCIE   1                                   0.00288442  100.0
 3         NB50   -1   NB52   1               30-1_NCIE   1                                   0.00436646  100.0
 3         NB51   -1   NB52   1               31-1_NCIE   1                                   0.00443021  100.0
# 22 Non bond interaction for S22 set
 3         S22_1  -1   01a_S22    1                        S22_01a    1                       0.00505171  100.0
 3         S22_2  -1   02a_S22    1                        S22_02a    1                       0.00799987  100.0
 3         S22_3  -1   03a_S22    1                        S22_03a    1                       0.02995968  100.0
 3         S22_4  -1   04a_S22    1                        S22_04a    1                       0.02568883  100.0
 3         S22_5  -1   05a_S22    1                        S22_05a    1                       0.03297159  100.0
 5         S22_6  -1   06a_S22    0.5    06b_S22  0.5      S22_06a    0.5    S22_06b  0.5     0.02709120  100.0
 5         S22_7  -1   07a_S22    0.5    07b_S22  0.5      S22_07a    0.5    S22_07b  0.5     0.02667687  100.0
 3         S22_8  -1   08a_S22    1                        S22_08a    1                       0.00084461  100.0
 3         S22_9  -1   09a_S22    1                        S22_09a    1                       0.00239040  100.0
 5         S22_10 -1   10a_S22    0.5    10b_S22  0.5      S22_10a    0.5    S22_10b  0.5     0.00231072  100.0
 3         S22_11 -1   11a_S22    1                        S22_11a    1                       0.00417523  100.0
 3         S22_12 -1   12a_S22    1                        S22_12a    1                       0.00669312  100.0
 3         S22_13 -1   13a_S22    1                        S22_13a    1                       0.01552166  100.0
 5         S22_14 -1   14a_S22    0.5    14b_S22  0.5      S22_14a    0.5    S22_14b  0.5     0.00731462  100.0
 5         S22_15 -1   15a_S22    0.5    15b_S22  0.5      S22_15a    0.5    S22_15b  0.5     0.01858138  100.0
 5         S22_16 -1   16a_S22    0.5    16b_S22  0.5      S22_16a    0.5    S22_16b  0.5     0.00240634  100.0
 5         S22_17 -1   17a_S22    0.5    17b_S22  0.5      S22_17a    0.5    S22_17b  0.5     0.00524294  100.0
 5         S22_18 -1   18a_S22    0.5    18b_S22  0.5      S22_18a    0.5    S22_18b  0.5     0.00369715  100.0
 5         S22_19 -1   19a_S22    0.5    19b_S22  0.5      S22_19a    0.5    S22_19b  0.5     0.00725088  100.0
 5         S22_20 -1   20a_S22    0.5    20b_S22  0.5      S22_20a    0.5    S22_20b  0.5     0.00431866  100.0
 5         S22_21 -1   21a_S22    0.5    21b_S22  0.5      S22_21a    0.5    S22_21b  0.5     0.00895603  100.0
 5         S22_22 -1   22a_S22    0.5    22b_S22  0.5      S22_22a    0.5    S22_22b  0.5     0.01129862  100.0
# 6 vDW interactions for ADIM6
 3         AD2    -1   AM2_BSSE   1                        AM2        1                       0.00207168  300.0
 3         AD3    -1   AM3_BSSE   1                        AM3        1                       0.00313939  300.0
 3         AD4    -1   AM4_BSSE   1                        AM4        1                       0.00444614  300.0
 3         AD5    -1   AM5_BSSE   1                        AM5        1                       0.00586445  300.0
 3         AD6    -1   AM6_BSSE   1                        AM6        1                       0.00734650  300.0
 3         AD7    -1   AM7_BSSE   1                        AM7        1                       0.00892416  300.0
# MB08 :: 165
 4 MB08-001  -2  MB08-170_c    2  MB08-172_o   1  MB08-166_h   2                                                      0.20554413  1.00
 5 MB08-002  -2  MB08-171_n    1  MB08-172_o   1  MB08-178_p   1  MB08-166_h   5                                      0.01625392  1.00
 6 MB08-003  -2  MB08-166_h   -8  MB08-169_b   4  MB08-170_c   2  MB08-167_li  2  MB08-171_n    1                    -0.10281875  1.00
 4 MB08-004  -2  MB08-168_be   2  MB08-179_s   1  MB08-166_h   4                                                      0.10233398  1.00
 5 MB08-005  -2  MB08-168_be   2  MB08-180_cl  1  MB08-171_n   1  MB08-166_h   3                                      0.16468422  1.00
 6 MB08-006  -2  MB08-166_h   -4  MB08-176_al  2  MB08-169_b   2  MB08-168_be  2  MB08-171_n    1                     0.15117288  1.00
 3 MB08-007  -2  MB08-177_si   2  MB08-166_h   3                                                                     -0.13353141  1.00
 4 MB08-008  -1  MB08-166_h   -2  MB08-170_c   2  MB08-167_li  1                                                     -0.14001513  1.00
 6 MB08-009  -2  MB08-166_h   -4  MB08-176_al  2  MB08-169_b   2  MB08-168_be  2  MB08-173_f    1                     0.16231613  1.00
 4 MB08-010  -1  MB08-174_na   1  MB08-172_o   1  MB08-166_h   2                                                      0.11702028  1.00
 3 MB08-011  -2  MB08-168_be   2  MB08-166_h   5                                                                     -0.11143503  1.00
 3 MB08-012  -1  MB08-169_b    1  MB08-166_h   2                                                                      0.01002774  1.00
 4 MB08-013  -2  MB08-168_be   2  MB08-178_p   1  MB08-166_h   4                                                     -0.01231443  1.00
 4 MB08-014  -2  MB08-167_li   4  MB08-172_o   1  MB08-166_h   3                                                      0.33918184  1.00
 4 MB08-015  -2  MB08-168_be   2  MB08-172_o   1  MB08-166_h   4                                                      0.26738219  1.00
 4 MB08-016  -1  MB08-169_b    1  MB08-167_li  1  MB08-166_h   1                                                      0.11259246  1.00
 5 MB08-017  -2  MB08-168_be   2  MB08-180_cl  1  MB08-179_s   1  MB08-166_h   3                                      0.14946949  1.00
 3 MB08-018  -1  MB08-175_mg   1  MB08-177_si  1                                                                     -0.00341191  1.00
 4 MB08-019  -2  MB08-169_b    2  MB08-175_mg  2  MB08-178_p   1                                                      0.12718474  1.00
 5 MB08-020  -2  MB08-169_b    2  MB08-173_f   1  MB08-167_li  2  MB08-166_h   1                                      0.50218960  1.00
 6 MB08-021  -2  MB08-166_h   -7  MB08-168_be  2  MB08-170_c   4  MB08-173_f   1  MB08-179_s     1                    0.23168395  1.00
 4 MB08-022  -2  MB08-172_o    1  MB08-178_p   1  MB08-166_h   6                                                      0.13071361  1.00
 3 MB08-023  -1  MB08-169_b    1  MB08-167_li  2                                                                      0.05323707  1.00
 4 MB08-024  -2  MB08-169_b    2  MB08-168_be  2  MB08-179_s   1                                                      0.26552724  1.00
 4 MB08-025  -2  MB08-171_n    1  MB08-179_s   1  MB08-166_h   6                                                     -0.05545425  1.00
 4 MB08-026  -1  MB08-169_b    1  MB08-171_n   1  MB08-166_h   1                                                     -0.08593185  1.00
 4 MB08-027  -1  MB08-166_h   -1  MB08-170_c   1  MB08-177_si  1                                                     -0.10240075  1.00
 5 MB08-028  -2  MB08-169_b    2  MB08-173_f   1  MB08-172_o   1  MB08-166_h   2                                      0.36380934  1.00
 6 MB08-029  -2  MB08-166_h   -2  MB08-170_c   2  MB08-173_f   1  MB08-175_mg  2  MB08-172_o     1                    0.22552947  1.00
 4 MB08-030  -2  MB08-168_be   2  MB08-171_n   1  MB08-166_h   4                                                     -0.00834871  1.00
 4 MB08-031  -2  MB08-169_b    2  MB08-173_f   1  MB08-166_h   3                                                      0.31769055  1.00
 7 MB08-032  -2  MB08-166_h   -7  MB08-176_al  2  MB08-167_li  4  MB08-171_n   1  MB08-172_o     1    MB08-177_si  2  0.55260473  1.00
 5 MB08-033  -2  MB08-169_b    2  MB08-180_cl  1  MB08-173_f   1  MB08-166_h   2                                      0.39336106  1.00
 4 MB08-034  -2  MB08-170_c    2  MB08-173_f   1  MB08-167_li  2                                                     -0.01548290  1.00
 6 MB08-035  -1  MB08-166_h   -3  MB08-169_b   1  MB08-170_c   1  MB08-167_li  1  MB08-175_mg    1                   -0.00783684  1.00
 5 MB08-036  -2  MB08-166_h   -1  MB08-170_c   2  MB08-167_li  2  MB08-174_na  2                                     -0.05486781  1.00
 5 MB08-037  -2  MB08-166_h   -5  MB08-170_c   2  MB08-175_mg  2  MB08-177_si  2                                     -0.31770011  1.00
 6 MB08-038  -2  MB08-166_h   -2  MB08-168_be  2  MB08-170_c   2  MB08-171_n   1  MB08-172_o     1                    0.06638125  1.00
 6 MB08-039  -2  MB08-166_h   -3  MB08-169_b   2  MB08-170_c   2  MB08-180_cl  1  MB08-178_p     1                    0.04067313  1.00
 6 MB08-040  -2  MB08-166_h   -3  MB08-168_be  4  MB08-180_cl  1  MB08-167_li  2  MB08-171_n     2                    0.23103695  1.00
 5 MB08-041  -2  MB08-176_al   2  MB08-173_f   2  MB08-178_p   1  MB08-166_h   1                                      0.43526637  1.00
 5 MB08-042  -2  MB08-169_b    2  MB08-173_f   1  MB08-167_li  2  MB08-166_h   1                                      0.50370990  1.00
 6 MB08-043  -2  MB08-166_h   -3  MB08-176_al  2  MB08-170_c   2  MB08-180_cl  1  MB08-179_s     1                    0.05075456  1.00
 3 MB08-044  -1  MB08-176_al   1  MB08-166_h   2                                                                      0.00597780  1.00
 4 MB08-045  -1  MB08-169_b    1  MB08-174_na  1  MB08-166_h   1                                                      0.10445427  1.00
 6 MB08-046  -1  MB08-166_h   -3  MB08-169_b   1  MB08-168_be  1  MB08-174_na  1  MB08-177_si    1                    0.05836321  1.00
 4 MB08-047  -2  MB08-167_li   2  MB08-178_p   1  MB08-166_h   5                                                      0.07890854  1.00
 5 MB08-048  -2  MB08-166_h   -2  MB08-176_al  2  MB08-170_c   2  MB08-172_o   1                                      0.15350528  1.00
 4 MB08-049  -2  MB08-168_be   2  MB08-179_s   1  MB08-166_h   4                                                      0.14900654  1.00
 4 MB08-050  -2  MB08-176_al   2  MB08-180_cl  1  MB08-166_h   3                                                      0.09979426  1.00
 5 MB08-051  -2  MB08-173_f    1  MB08-167_li  2  MB08-171_n   1  MB08-166_h   4                                      0.14070660  1.00
 5 MB08-052  -2  MB08-166_h   -2  MB08-169_b   2  MB08-170_c   2  MB08-179_s   1                                     -0.02022900  1.00
 5 MB08-053  -2  MB08-166_h   -2  MB08-169_b   2  MB08-170_c   2  MB08-172_o   1                                      0.07646587  1.00
 4 MB08-054  -2  MB08-168_be   4  MB08-171_n   1  MB08-166_h   1                                                      0.02700865  1.00
 6 MB08-055  -2  MB08-180_cl   1  MB08-173_f   1  MB08-175_mg  2  MB08-179_s   1  MB08-166_h     2                    0.69108699  1.00
 4 MB08-056  -2  MB08-173_f    1  MB08-167_li  2  MB08-166_h   5                                                      0.39594110  1.00
 4 MB08-057  -1  MB08-169_b    1  MB08-174_na  1  MB08-166_h   1                                                      0.10405698  1.00
 4 MB08-058  -1  MB08-167_li   1  MB08-171_n   1  MB08-166_h   2                                                      0.02106946  1.00
 3 MB08-059  -2  MB08-180_cl   1  MB08-166_h   7                                                                      0.07938550  1.00
 5 MB08-060  -2  MB08-169_b    2  MB08-173_f   1  MB08-171_n   1  MB08-166_h   2                                      0.44958964  1.00
 4 MB08-061  -2  MB08-168_be   2  MB08-179_s   1  MB08-166_h   4                                                      0.15448343  1.00
 3 MB08-062  -1  MB08-174_na   1  MB08-166_h   3                                                                      0.00352050  1.00
 6 MB08-063  -2  MB08-166_h   -1  MB08-176_al  2  MB08-173_f   1  MB08-175_mg  2  MB08-179_s     1                    0.52763940  1.00
 5 MB08-064  -2  MB08-166_h   -3  MB08-170_c   2  MB08-171_n   1  MB08-177_si  2                                     -0.07228155  1.00
 4 MB08-065  -2  MB08-175_mg   2  MB08-172_o   1  MB08-166_h   4                                                      0.29538652  1.00
 4 MB08-066  -2  MB08-176_al   2  MB08-171_n   1  MB08-166_h   3                                                      0.01255157  1.00
 5 MB08-067  -2  MB08-166_h   -1  MB08-176_al  2  MB08-169_b   2  MB08-171_n   1                                      0.21308983  1.00
 4 MB08-068  -2  MB08-169_b    2  MB08-171_n   1  MB08-166_h   3                                                      0.16533441  1.00
 4 MB08-069  -2  MB08-173_f    1  MB08-171_n   1  MB08-166_h   6                                                      0.32070883  1.00
 5 MB08-070  -2  MB08-166_h   -1  MB08-168_be  2  MB08-170_c   2  MB08-173_f   1                                      0.09974948  1.00
 5 MB08-071  -2  MB08-166_h   -2  MB08-176_al  2  MB08-170_c   2  MB08-172_o   1                                      0.15189479  1.00
 4 MB08-072  -2  MB08-174_na   2  MB08-172_o   1  MB08-177_si  2                                                      0.23734601  1.00
 5 MB08-073  -1  MB08-166_h   -2  MB08-169_b   1  MB08-168_be  1  MB08-170_c   1                                     -0.05976494  1.00
 6 MB08-074  -1  MB08-166_h   -5  MB08-169_b   2  MB08-168_be  1  MB08-167_li  1  MB08-177_si    1                    0.02771445  1.00
 5 MB08-075  -2  MB08-170_c    2  MB08-173_f   1  MB08-171_n   1  MB08-172_o   1                                      0.05188251  1.00
 4 MB08-076  -1  MB08-169_b    1  MB08-167_li  1  MB08-166_h   1                                                      0.10437522  1.00
 5 MB08-077  -2  MB08-169_b    2  MB08-173_f   1  MB08-171_n   2  MB08-166_h   1                                      0.14603384  1.00
 4 MB08-078  -2  MB08-176_al   2  MB08-168_be  2  MB08-172_o   1                                                      0.35893770  1.00
 3 MB08-079  -2  MB08-173_f    1  MB08-166_h   7                                                                      0.22236617  1.00
 6 MB08-080  -1  MB08-166_h   -3  MB08-169_b   1  MB08-168_be  1  MB08-170_c   1  MB08-167_li    1                    0.05931379  1.00
 4 MB08-081  -2  MB08-167_li   2  MB08-178_p   1  MB08-166_h   5                                                      0.13836544  1.00
 4 MB08-082  -2  MB08-166_h   -3  MB08-170_c   4  MB08-171_n   1                                                     -0.19193319  1.00
 5 MB08-083  -2  MB08-166_h  -10  MB08-170_c   6  MB08-173_f   1  MB08-167_li  2                                     -0.26939491  1.00
 3 MB08-084  -1  MB08-166_h   -1  MB08-170_c   2                                                                     -0.02923172  1.00
 4 MB08-085  -2  MB08-166_h   -3  MB08-170_c   4  MB08-172_o   1                                                     -0.18759382  1.00
 3 MB08-086  -1  MB08-169_b    1  MB08-166_h   2                                                                      0.01013289  1.00
 6 MB08-087  -1  MB08-166_h   -4  MB08-176_al  1  MB08-169_b   1  MB08-170_c   1  MB08-175_mg    1                   -0.08679001  1.00
 5 MB08-088  -2  MB08-166_h   -9  MB08-170_c   6  MB08-171_n   1  MB08-179_s   1                                     -0.62929036  1.00
 5 MB08-089  -2  MB08-166_h   -7  MB08-169_b   2  MB08-170_c   4  MB08-171_n   1                                     -0.31900527  1.00
 3 MB08-090  -2  MB08-170_c    2  MB08-166_h   3                                                                     -0.17370081  1.00
 5 MB08-091  -2  MB08-166_h   -3  MB08-169_b   2  MB08-170_c   2  MB08-172_o   2                                      0.06001928  1.00
 3 MB08-092  -1  MB08-170_c    1  MB08-175_mg  1                                                                     -0.01249766  1.00
 5 MB08-093  -2  MB08-171_n    1  MB08-178_p   1  MB08-177_si  2  MB08-166_h   1                                      0.02773485  1.00
 5 MB08-094  -2  MB08-170_c    2  MB08-172_o   1  MB08-179_s   1  MB08-166_h   1                                      0.07110866  1.00
 5 MB08-095  -2  MB08-166_h  -11  MB08-170_c   6  MB08-175_mg  2  MB08-178_p   1                                     -0.54471801  1.00
 4 MB08-096  -2  MB08-166_h   -3  MB08-170_c   4  MB08-178_p   1                                                     -0.13983681  1.00
 4 MB08-097  -2  MB08-166_h   -3  MB08-170_c   4  MB08-179_s   1                                                     -0.20949626  1.00
 4 MB08-098  -2  MB08-172_o    1  MB08-179_s   1  MB08-166_h   6                                                      0.28940574  1.00
 4 MB08-099  -2  MB08-170_c    2  MB08-172_o   1  MB08-166_h   2                                                      0.10815333  1.00
 4 MB08-100  -1  MB08-166_h   -3  MB08-169_b   1  MB08-170_c   2                                                     -0.15753135  1.00
 3 MB08-101  -2  MB08-172_o    1  MB08-166_h   7                                                                      0.03259342  1.00
 5 MB08-102  -2  MB08-166_h   -1  MB08-170_c   2  MB08-175_mg  2  MB08-172_o   1                                     -0.01678076  1.00
 5 MB08-103  -2  MB08-166_h   -4  MB08-170_c   4  MB08-171_n   1  MB08-172_o   1                                     -0.27361635  1.00
 5 MB08-104  -2  MB08-166_h   -9  MB08-170_c   4  MB08-167_li  2  MB08-177_si  2                                     -0.33131105  1.00
 4 MB08-105  -2  MB08-166_h   -3  MB08-170_c   4  MB08-171_n   1                                                     -0.17097257  1.00
 5 MB08-106  -2  MB08-166_h   -4  MB08-170_c   4  MB08-173_f   1  MB08-178_p   1                                     -0.16082134  1.00
 4 MB08-107  -2  MB08-170_c    2  MB08-171_n   2  MB08-166_h   1                                                     -0.19887491  1.00
 5 MB08-108  -2  MB08-170_c    2  MB08-171_n   1  MB08-178_p   1  MB08-179_s   1                                     -0.20072986  1.00
 3 MB08-109  -1  MB08-171_n    1  MB08-166_h   3                                                                     -0.01350585  1.00
 4 MB08-110  -1  MB08-166_h   -5  MB08-170_c   3  MB08-175_mg  1                                                     -0.29802393  1.00
 4 MB08-111  -2  MB08-166_h   -8  MB08-170_c   6  MB08-171_n   1                                                     -0.57744737  1.00
 5 MB08-112  -2  MB08-166_h   -9  MB08-170_c   6  MB08-172_o   1  MB08-178_p   1                                     -0.57344265  1.00
 6 MB08-113  -2  MB08-166_h   -8  MB08-170_c   4  MB08-167_li  2  MB08-175_mg  2  MB08-172_o    1                     0.07245541  1.00
 5 MB08-114  -2  MB08-166_h   -2  MB08-176_al  2  MB08-170_c   2  MB08-171_n   1                                     -0.23409826  1.00
 5 MB08-115  -2  MB08-170_c    2  MB08-171_n   1  MB08-172_o   1  MB08-166_h   1                                     -0.10827444  1.00
 6 MB08-116  -2  MB08-176_al   2  MB08-173_f   1  MB08-172_o   1  MB08-178_p   1  MB08-166_h    1                     0.43848544  1.00
 4 MB08-117  -2  MB08-166_h   -3  MB08-170_c   4  MB08-173_f   1                                                     -0.04056939  1.00
 4 MB08-118  -1  MB08-176_al   1  MB08-172_o   1  MB08-166_h   1                                                      0.08377109  1.00
 5 MB08-119  -2  MB08-173_f    1  MB08-172_o   1  MB08-178_p   1  MB08-166_h   5                                      0.38464406  1.00
 4 MB08-120  -2  MB08-167_li   2  MB08-179_s   1  MB08-166_h   5                                                      0.07199072  1.00
 4 MB08-121  -1  MB08-166_h   -3  MB08-176_al  1  MB08-170_c   2                                                     -0.09473793  1.00
 6 MB08-122  -2  MB08-166_h   -5  MB08-170_c   2  MB08-172_o   2  MB08-178_p   1  MB08-177_si   2                     0.30734968  1.00
 4 MB08-123  -2  MB08-170_c    2  MB08-171_n   1  MB08-166_h   2                                                     -0.20010836  1.00
 5 MB08-124  -2  MB08-166_h   -8  MB08-170_c   4  MB08-178_p   1  MB08-177_si  2                                     -0.49622316  1.00
 6 MB08-125  -2  MB08-166_h   -1  MB08-170_c   2  MB08-180_cl  1  MB08-167_li  2  MB08-179_s    1                     0.09979601  1.00
 5 MB08-126  -2  MB08-166_h   -2  MB08-169_b   2  MB08-170_c   2  MB08-172_o   1                                      0.09569457  1.00
 4 MB08-127  -1  MB08-166_h   -1  MB08-170_c   1  MB08-177_si  1                                                     -0.10214976  1.00
 5 MB08-128  -2  MB08-166_h   -1  MB08-170_c   2  MB08-175_mg  2  MB08-178_p   1                                     -0.09909037  1.00
 4 MB08-129  -2  MB08-166_h  -18  MB08-170_c  10  MB08-172_o   1                                                     -0.90933371  1.00
 5 MB08-130  -2  MB08-166_h   -8  MB08-170_c   4  MB08-179_s   1  MB08-177_si  2                                     -0.30614173  1.00
 4 MB08-131  -2  MB08-166_h   -3  MB08-170_c   4  MB08-178_p   1                                                     -0.15298481  1.00
 5 MB08-132  -2  MB08-166_h   -7  MB08-169_b   2  MB08-170_c   4  MB08-173_f   1                                     -0.06041114  1.00
 4 MB08-133  -2  MB08-173_f    1  MB08-178_p   1  MB08-166_h   6                                                      0.17154786  1.00
 5 MB08-134  -1  MB08-166_h   -2  MB08-170_c   1  MB08-171_n   1  MB08-177_si  1                                     -0.13057624  1.00
 5 MB08-135  -2  MB08-180_cl   1  MB08-171_n   2  MB08-178_p   1  MB08-166_h   4                                      0.06296329  1.00
 5 MB08-136  -2  MB08-166_h   -2  MB08-169_b   2  MB08-170_c   2  MB08-172_o   1                                      0.07836655  1.00
 4 MB08-137  -1  MB08-166_h   -1  MB08-170_c   1  MB08-177_si  1                                                     -0.01011733  1.00
 4 MB08-138  -2  MB08-171_n    1  MB08-174_na  2  MB08-166_h   5                                                      0.07564771  1.00
 4 MB08-139  -2  MB08-166_h   -3  MB08-170_c   4  MB08-171_n   1                                                     -0.42500677  1.00
 5 MB08-140  -2  MB08-166_h   -2  MB08-169_b   2  MB08-170_c   2  MB08-172_o   1                                      0.04045863  1.00
 4 MB08-141  -2  MB08-170_c    2  MB08-179_s   1  MB08-166_h   2                                                     -0.18294051  1.00
 5 MB08-142  -2  MB08-166_h   -4  MB08-170_c   4  MB08-172_o   1  MB08-179_s   1                                     -0.13747541  1.00
 4 MB08-143  -2  MB08-166_h   -3  MB08-170_c   4  MB08-171_n   1                                                     -0.30663256  1.00
 5 MB08-144  -2  MB08-176_al   2  MB08-180_cl  1  MB08-178_p   1  MB08-166_h   2                                      0.28534844  1.00
 5 MB08-145  -2  MB08-166_h  -11  MB08-169_b   4  MB08-170_c   4  MB08-178_p   1                                     -0.27711112  1.00
 5 MB08-146  -1  MB08-166_h   -4  MB08-176_al  1  MB08-170_c   2  MB08-174_na  1                                     -0.08765692  1.00
 5 MB08-147  -2  MB08-166_h   -3  MB08-170_c   2  MB08-173_f   1  MB08-177_si  2                                     -0.10845532  1.00
 6 MB08-148  -2  MB08-166_h  -12  MB08-169_b   2  MB08-170_c   4  MB08-179_s   1  MB08-177_si   2                    -0.41397587  1.00
 5 MB08-149  -2  MB08-170_c    2  MB08-171_n   1  MB08-179_s   1  MB08-166_h   1                                     -0.18644483  1.00
 5 MB08-150  -2  MB08-166_h   -7  MB08-176_al  2  MB08-170_c   4  MB08-171_n   1                                     -0.19022166  1.00
 4 MB08-151  -2  MB08-166_h   -3  MB08-170_c   4  MB08-171_n   1                                                     -0.35889149  1.00
 5 MB08-152  -2  MB08-170_c    2  MB08-171_n   1  MB08-172_o   1  MB08-166_h   1                                      0.09431977  1.00
 4 MB08-153  -2  MB08-180_cl   2  MB08-172_o   1  MB08-177_si  2                                                      0.48071265  1.00
 5 MB08-154  -2  MB08-166_h  -13  MB08-170_c   6  MB08-173_f   1  MB08-177_si  2                                     -0.49825022  1.00
 5 MB08-155  -1  MB08-166_h   -6  MB08-176_al  2  MB08-170_c   2  MB08-167_li  1                                     -0.11511051  1.00
 4 MB08-156  -2  MB08-166_h   -3  MB08-180_cl  1  MB08-177_si  4                                                     -0.12396439  1.00
 3 MB08-157  -1  MB08-166_h   -6  MB08-170_c   4                                                                     -0.38354926  1.00
 5 MB08-158  -2  MB08-166_h   -8  MB08-170_c   4  MB08-172_o   1  MB08-177_si  2                                     -0.26154642  1.00
 5 MB08-159  -2  MB08-175_mg   2  MB08-172_o   1  MB08-178_p   1  MB08-166_h   3                                      0.28747111  1.00
 4 MB08-160  -2  MB08-180_cl   2  MB08-178_p   1  MB08-166_h   5                                                      0.20369396  1.00
 4 MB08-161  -2  MB08-180_cl   1  MB08-171_n   2  MB08-166_h   5                                                     -0.12646045  1.00
 4 MB08-162  -1  MB08-166_h   -1  MB08-170_c   1  MB08-177_si  1                                                     -0.10238561  1.00
 5 MB08-163  -2  MB08-166_h   -4  MB08-170_c   4  MB08-172_o   1  MB08-179_s   1                                     -0.06770091  1.00
 5 MB08-164  -2  MB08-170_c    2  MB08-171_n   1  MB08-172_o   1  MB08-166_h   1                                      0.08332472  1.00
 5 MB08-165  -2  MB08-166_h  -10  MB08-170_c   6  MB08-167_li  2  MB08-172_o   1                                     -0.21773358  1.00
# W4 :: 99
  3    W4-h     6    W4-b     2    W4-b2h6    -1                          0.96734713   1.00
  4    W4-h     1    W4-b     1    W4-f        2    W4-bf2h     -1        0.65492183   1.00
  3    W4-f     3    W4-b     1    W4-bf3     -1                          0.75053784   1.00
  3    W4-h     6    W4-c     2    W4-c2h6    -1                          1.13636436   1.00
  4    W4-h     2    W4-c     1    W4-n        1    W4-h2cn     -1        0.54780003   1.00
  3    W4-c     2    W4-n     2    W4-nccn    -1                          0.80005099   1.00
  4    W4-h     4    W4-c     1    W4-n        1    W4-ch2nh2   -1        0.76856145   1.00
  4    W4-h     4    W4-c     1    W4-n        1    W4-ch3nh    -1        0.75637041   1.00
  4    W4-h     5    W4-c     1    W4-n        1    W4-ch3nh2   -1        0.92795333   1.00
  3    W4-f     2    W4-c     1    W4-cf2     -1                          0.41239183   1.00
  3    W4-h     1    W4-n     2    W4-n2h     -1                          0.35833691   1.00
  3    W4-h     2    W4-n     2    W4-n2h2    -1                          0.47255023   1.00
  3    W4-h     4    W4-n     2    W4-n2h4    -1                          0.69844305   1.00
  3    W4-f     1    W4-o     2    W4-fo2     -1                          0.21468980   1.00
  3    W4-f     2    W4-o     2    W4-foof    -1                          0.24281684   1.00
  3    W4-f     3    W4-al    1    W4-alf3    -1                          0.68679383   1.00
  3    W4-h     6    W4-si    2    W4-si2h6   -1                          0.85399435   1.00
  2    W4-p     4    W4-p4   -1                                           0.46306831   1.00
  3    W4-s     1    W4-o     2    W4-so2     -1                          0.41532405   1.00
  3    W4-s     1    W4-o     3    W4-so3     -1                          0.55288361   1.00
  4    W4-o     1    W4-c     1    W4-s        1    W4-ocs      -1        0.53505123   1.00
  3    W4-c     1    W4-s     2    W4-cs2     -1                          0.44745103   1.00
  3    W4-o     1    W4-s     2    W4-s2o     -1                          0.33271182   1.00
  2    W4-s     3    W4-s3   -1                                           0.26829851   1.00
  2    W4-s     4    W4-s4   -1                                           0.37346018   1.00
  3    W4-be    1    W4-cl    2    W4-becl2   -1                          0.35899029   1.00
  3    W4-c     1    W4-cl    2    W4-ccl2    -1                          0.28264091   1.00
  3    W4-al    1    W4-cl    3    W4-alcl3   -1                          0.49823907   1.00
  4    W4-cl    1    W4-c     1    W4-n        1    W4-clcn     -1        0.45489314   1.00
  3    W4-o     2    W4-cl    1    W4-oclo    -1                          0.20417204   1.00
  3    W4-o     2    W4-cl    1    W4-cloo    -1                          0.20141511   1.00
  3    W4-o     1    W4-cl    2    W4-cl2o    -1                          0.16168666   1.00
  2    W4-h     2    W4-h2   -1                                           0.17448327   1.00
  3    W4-h     1    W4-o     1    W4-oh      -1                          0.17084986   1.00
  3    W4-h     1    W4-f     1    W4-hf      -1                          0.22571751   1.00
  3    W4-h     2    W4-o     1    W4-h2o     -1                          0.37126101   1.00
  3    W4-h     1    W4-c     1    W4-ch      -1                          0.13421300   1.00
  3    W4-h     2    W4-c     1    W4-ch2     -1                          0.30396328   1.00
  3    W4-h     3    W4-c     1    W4-ch3     -1                          0.49062166   1.00
  3    W4-h     4    W4-c     1    W4-ch4     -1                          0.66998135   1.00
  3    W4-h     1    W4-c     2    W4-c2h     -1                          0.42415260   1.00
  3    W4-h     2    W4-c     2    W4-c2h2    -1                          0.64623671   1.00
  3    W4-h     3    W4-n     1    W4-nh3     -1                          0.47492470   1.00
  2    W4-c     2    W4-c2   -1                                           0.23429108   1.00
  2    W4-n     2    W4-n2   -1                                           0.36410575   1.00
  3    W4-c     1    W4-o     1    W4-co      -1                          0.41390575   1.00
  3    W4-c     1    W4-n     1    W4-cn      -1                          0.28899937   1.00
  3    W4-o     1    W4-n     1    W4-no      -1                          0.24342241   1.00
  2    W4-o     2    W4-o2   -1                                           0.19253876   1.00
  3    W4-o     1    W4-f     1    W4-of      -1                          0.08458829   1.00
  2    W4-f     2    W4-f2   -1                                           0.06221414   1.00
  3    W4-h     3    W4-p     1    W4-ph3     -1                          0.38608149   1.00
  3    W4-h     1    W4-s     1    W4-hs      -1                          0.13980653   1.00
  3    W4-h     2    W4-s     1    W4-h2s     -1                          0.29307899   1.00
  3    W4-h     1    W4-cl    1    W4-hcl     -1                          0.17131201   1.00
  3    W4-s     1    W4-o     1    W4-so      -1                          0.20154260   1.00
  3    W4-cl    1    W4-o     1    W4-clo     -1                          0.10430112   1.00
  3    W4-cl    1    W4-f     1    W4-clf     -1                          0.10007808   1.00
  2    W4-p     2    W4-p2   -1                                           0.18739143   1.00
  2    W4-s     2    W4-s2   -1                                           0.16613281   1.00
  2    W4-cl    2    W4-cl2  -1                                           0.09521760   1.00
  2    W4-be    2    W4-be2  -1                                           0.00425491   1.00
  2    W4-b     2    W4-b2   -1                                           0.10750426   1.00
  3    W4-h     1    W4-b     1    W4-bh      -1                          0.13544007   1.00
  3    W4-h     3    W4-b     1    W4-bh3     -1                          0.44826377   1.00
  3    W4-n     1    W4-b     1    W4-bn_S    -1                          0.16771047   1.00
  3    W4-f     1    W4-b     1    W4-bf      -1                          0.29086389   1.00
  3    W4-n     1    W4-h     1    W4-nh      -1                          0.13242816   1.00
  3    W4-n     1    W4-h     2    W4-nh2     -1                          0.29097544   1.00
  4    W4-h     1    W4-c     1    W4-n        1    W4-hcn      -1        0.49946614   1.00
  4    W4-h     1    W4-o     1    W4-f        1    W4-hof      -1        0.25282465   1.00
  3    W4-h     1    W4-al    1    W4-alh     -1                          0.11724115   1.00
  3    W4-h     3    W4-al    1    W4-alh3    -1                          0.33970773   1.00
  3    W4-f     1    W4-al    1    W4-alf     -1                          0.26099982   1.00
  3    W4-cl    1    W4-al    1    W4-alcl    -1                          0.19540724   1.00
  3    W4-h     1    W4-si    1    W4-sih     -1                          0.11779891   1.00
  3    W4-h     4    W4-si    1    W4-sih4    -1                          0.51784035   1.00
  3    W4-o     1    W4-si    1    W4-sio     -1                          0.30764449   1.00
  3    W4-f     1    W4-si    1    W4-sif     -1                          0.22742267   1.00
  3    W4-c     1    W4-s     1    W4-cs      -1                          0.27444980   1.00
  3    W4-n     1    W4-b     1    W4-bn_T    -1                          0.16863476   1.00
  3    W4-c     1    W4-f     1    W4-cf      -1                          0.21150260   1.00
  3    W4-be    1    W4-f     2    W4-bef2    -1                          0.49258179   1.00
  3    W4-h     2    W4-c     2    W4-ch2c    -1                          0.57358448   1.00
  3    W4-h     3    W4-c     2    W4-ch2ch   -1                          0.71087313   1.00
  3    W4-h     4    W4-c     2    W4-c2h4    -1                          0.89894981   1.00
  4    W4-h     3    W4-c     1    W4-n        1    W4-ch2nh    -1        0.70029162   1.00
  4    W4-h     1    W4-c     1    W4-o        1    W4-hco      -1        0.44528374   1.00
  4    W4-h     2    W4-c     1    W4-o        1    W4-ch2o     -1        0.59705821   1.00
  3    W4-c     1    W4-o     2    W4-co2     -1                          0.62172714   1.00
  4    W4-h     1    W4-n     1    W4-o        1    W4-hno      -1        0.32810632   1.00
  3    W4-n     1    W4-o     2    W4-no2     -1                          0.36314959   1.00
  3    W4-n     2    W4-o     1    W4-n2o     -1                          0.43162658   1.00
  2    W4-o     3    W4-o3   -1                                           0.23494446   1.00
  3    W4-h     1    W4-o     2    W4-hoo     -1                          0.27972462   1.00
  3    W4-h     2    W4-o     2    W4-h2o2    -1                          0.42882185   1.00
  3    W4-f     2    W4-o     1    W4-f2o     -1                          0.14944781   1.00
  4    W4-h     1    W4-o     1    W4-cl       1    W4-hocl     -1        0.26490414   1.00
  3    W4-h     1    W4-s     2    W4-ssh     -1                          0.26315118   1.00
# SIE :: 11
  3   SIE-he      1   SIE-he+       1      SIE-he2+       -1              0.091536389  1.00
  3   SIE-nh3     1   SIE-nh3+      1      SIE-nh32+      -1              0.056317827  1.00
  3   SIE-h2o     1   SIE-h2o+      1      SIE-h2o2+      -1              0.059361603  1.00
  3   SIE-but+   -1   SIE-ethyl     1      SIE-ethyl+      1              0.056222211  1.00
  3   SIE-ch3     1   SIE-acetyl    1      SIE-aceton+    -1              0.035967554  1.00
  2   SIE-clclf   1   SIE-clfcl    -1                                    -0.001609536  1.00
  3   SIE-c2h4    1   SIE-f2        1      SIE-c2h4_f2    -1              0.001721088  1.00
  3   SIE-li      1   SIE-bz        1      SIE-bz_li      -1              0.015139201  1.00
  3   SIE-nh3     1   SIE-clf       1      SIE-nh3_clf    -1              0.016732801  1.00
  3   SIE-mgo     1   SIE-na        1      SIE-naomg      -1              0.110850823  1.00
  3   SIE-li      1   SIE-f2        1      SIE-li_f2      -1              0.150372105  1.00
# O3ADD :: 6
 3    O3ADD-o3     -1   O3ADD-c2h2     -1  O3ADD-o3_c2h2_vdw      1      -0.003027840  1.00
 3    O3ADD-o3     -1   O3ADD-c2h2     -1  O3ADD-o3_c2h2_ts       1       0.012334465  1.00
 3    O3ADD-o3     -1   O3ADD-c2h2     -1  O3ADD-o3_c2h2_add      1      -0.101671686  1.00
 3    O3ADD-o3     -1   O3ADD-c2h4     -1  O3ADD-o3_c2h4_vdw      1      -0.003091584  1.00
 3    O3ADD-o3     -1   O3ADD-c2h4     -1  O3ADD-o3_c2h4_ts       1       0.005370432  1.00
 3    O3ADD-o3     -1   O3ADD-c2h4     -1  O3ADD-o3_c2h4_add      1      -0.091074246  1.00
# DC9 :: 9
  2    DC9-ISO_E36       1  DC9-ISO_P36       -1                         -0.001593600  1.00 
  2    DC9-c20cage      -1  DC9-c20bowl        1                         -0.021194881  1.00 
  2    DC9-heptatriyne   1  DC9-heptahexaene  -1                         -0.022788482  1.00 
  2    DC9-tmethen      -2  DC9-omcb           1                         -0.030597122  1.00
  2    DC9-ISO_E35       1  DC9-ISO_P35       -1                         -0.031075202  1.00
  2    DC9-carbooxo2    -1  DC9-carbooxo1      1                         -0.042867843  1.00 
  3    DC9-ethen        -1  DC9-ch2n2         -1  DC9-13dip  1           -0.060716164  1.00 
  2    DC9-be4           1  DC9-be            -4                         -0.140874249  1.00
  2    DC9-s2           -4  DC9-s8             1                         -0.160953610  1.00 
# WATER27 :: 27
  2  WATER27-H2O2         -1  WATER27-H2O       2                         0.007983936  1.00
  2  WATER27-H2O3         -1  WATER27-H2O       3                         0.025178882  1.00
  2  WATER27-H2O4         -1  WATER27-H2O       4                         0.043664643  1.00
  2  WATER27-H2O5         -1  WATER27-H2O       5                         0.057210244  1.00
  2  WATER27-H2O6         -1  WATER27-H2O       6                         0.073305605  1.00
  2  WATER27-H2O6c        -1  WATER27-H2O       6                         0.072986885  1.00
  2  WATER27-H2O6b        -1  WATER27-H2O       6                         0.072190085  1.00
  2  WATER27-H2O6c2       -1  WATER27-H2O       6                         0.070596484  1.00
  2  WATER27-H2O8d2d      -1  WATER27-H2O       8                         0.115695367  1.00
  2  WATER27-H2O8s4       -1  WATER27-H2O       8                         0.115695367  1.00
  2  WATER27-H2O20        -1  WATER27-H2O      20                         0.318879380  1.00
  2  WATER27-H2O20fc      -1  WATER27-H2O      20                         0.338799382  1.00
  2  WATER27-H2O20fs      -1  WATER27-H2O      20                         0.342624022  1.00
  2  WATER27-H2O20es      -1  WATER27-H2O      20                         0.347245462  1.00
  3  WATER27-H3OpH2O      -1  WATER27-H3Op      1  WATER27-H2O     1      0.053385603  1.00
  3  WATER27-H3OpH2O2     -1  WATER27-H3Op      1  WATER27-H2O     2      0.090675846  1.00
  3  WATER27-H3OpH2O3     -1  WATER27-H3Op      1  WATER27-H2O     3      0.121910408  1.00
  3  WATER27-H3OpH2O63d   -1  WATER27-H3Op      1  WATER27-H2O     6      0.187726092  1.00
  3  WATER27-H3OpH2O62d   -1  WATER27-H3Op      1  WATER27-H2O     6      0.183104652  1.00
  3  WATER27-OHmH2O       -1  WATER27-OHm       1  WATER27-H2O     1      0.042389763  1.00
  3  WATER27-OHmH2O2      -1  WATER27-OHm       1  WATER27-H2O     2      0.077130245  1.00
  3  WATER27-OHmH2O3      -1  WATER27-OHm       1  WATER27-H2O     3      0.107727367  1.00
  3  WATER27-OHmH2O4c4    -1  WATER27-OHm       1  WATER27-H2O     4      0.135137289  1.00
  3  WATER27-OHmH2O4cs    -1  WATER27-OHm       1  WATER27-H2O     4      0.135137289  1.00
  3  WATER27-OHmH2O5      -1  WATER27-OHm       1  WATER27-H2O     5      0.160475530  1.00
  3  WATER27-OHmH2O6      -1  WATER27-OHm       1  WATER27-H2O     6      0.184379532  1.00
  2  WATER27-H3OpH2O6OHm   1  WATER27-H2O8s4   -1                         0.045417603  1.00

#               912 = 17+223+31+15+21+19+52+48+56+34+18+180+111+29+9+19+30 is the total number of jobs in this batch list
__xyg3 components__ :: 912
#        E_noXC  E_K   Ex_LDA   dEx_Becke  Ec_VWN  dEc_LYP  PT2_1ST  aaaa  abab  bbbb aaaa_erf200 abab_erf200 bbbb_erf200
# 17 atoms
   H_0 -0.19120627 -0.30821881 -0.26483415 -0.04163629 -0.03979738 0.03979738 -0.00043702 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
  He_0 -1.84240056 -1.01649219 -0.87763046 -0.14148003 -0.14969531 0.10595107 -0.00138221 0.00000000 -0.03749550 0.00000000 0.00000000 -0.00000493 0.00000000
  Li_0 -5.65066623 -1.78065766 -1.53861169 -0.23727194 -0.20630448 0.15246209 -0.00051426 -0.00039780 -0.03620243 0.00000000 -0.00000757 -0.00000878 0.00000000
  Be_0 -11.90161367 -2.66925722 -2.31662729 -0.34548650 -0.29865863 0.20353282 -0.00076928 -0.00056396 -0.09210284 -0.00056396 -0.00000178 -0.00069063 -0.00000178
   B_0 -20.76330091 -3.76523125 -3.29760185 -0.46332109 -0.38254427 0.25664887 -0.00193152 -0.00644491 -0.10892006 -0.00067706 -0.00005420 -0.00026417 -0.00000051
   C_0 -32.62137433 -5.06547531 -4.48380116 -0.58018981 -0.47031187 0.31115067 -0.00308389 -0.02057471 -0.12141320 -0.00072869 -0.00004560 -0.00011583 -0.00000018
   N_0 -47.80676342 -6.58844454 -5.89213339 -0.69500165 -0.56021181 0.36781508 -0.00389075 -0.04360432 -0.12975643 -0.00076501 -0.00003030 -0.00005568 -0.00000007
   O_0 -66.61492200 -8.18893679 -7.37011649 -0.83765673 -0.68765628 0.43017794 -0.00576307 -0.04538343 -0.18310823 -0.00756734 -0.00001265 -0.00003124 -0.00000384
   F_0 -89.38890704 -10.00641205 -9.06942612 -0.97343212 -0.81668281 0.49540208 -0.00768670 -0.04707123 -0.23597065 -0.02358331 -0.00000588 -0.00001796 -0.00000381
  Ne_0 -116.45861732 -12.06115024 -11.00696824 -1.10336479 -0.94568153 0.56258287 -0.00926285 -0.04864921 -0.28681273 -0.04864921 -0.00000294 -0.00001063 -0.00000294
  Na_0 -147.84526782 -13.99419248 -12.77641625 -1.24324916 -1.02472190 0.61521097 -0.00660157 -0.04411970 -0.22589274 -0.04082458 -0.00005400 -0.00006082 -0.00000251
  Mg_0 -183.62238884 -15.97784045 -14.61034606 -1.38721443 -1.13134065 0.67050079 -0.00596324 -0.04233917 -0.26323356 -0.04233917 -0.00002353 -0.00123233 -0.00002353
  Al_0 -223.79423147 -18.07220490 -16.54923506 -1.53467066 -1.22396862 0.72872604 -0.00653348 -0.04993406 -0.28393330 -0.04459851 -0.00025783 -0.00090741 -0.00001109
  Si_0 -268.56216238 -20.28182616 -18.60597098 -1.68085391 -1.31968335 0.78850779 -0.00722204 -0.06356023 -0.30512838 -0.04568955 -0.00040175 -0.00063753 -0.00000572
   P_0 -318.07908131 -22.62528265 -20.79316984 -1.82692192 -1.41715428 0.84979107 -0.00662228 -0.08359643 -0.32268595 -0.04584095 -0.00042973 -0.00044552 -0.00000317
   S_0 -372.48765905 -25.00763836 -23.01854248 -1.98331700 -1.54305554 0.91316046 -0.00783990 -0.08533035 -0.36775788 -0.05265933 -0.00024529 -0.00042287 -0.00004555
  Cl_0 -431.95286969 -27.51673592 -25.37185042 -2.13691877 -1.66967393 0.97840219 -0.00854831 -0.08667092 -0.41161171 -0.06652895 -0.00015017 -0.00035019 -0.00008031
# 223 molecules in G3 set
  G2-1 -5.84909897 -2.13540692 -1.84886324 -0.28369947 -0.29087432 0.20232552 -0.00229286 -0.00032382 -0.07630596 -0.00032382 -0.00000274 -0.00022034 -0.00000274
  G2-2 -12.07377145 -3.07526244 -2.67648382 -0.38832987 -0.35901741 0.25042508 -0.00229991 -0.00331702 -0.08347817 -0.00040586 -0.00007272 -0.00023261 -0.00000087
  G2-3 -32.86605136 -5.40897609 -4.80015351 -0.61514262 -0.55431837 0.35731397 -0.00472440 -0.01927306 -0.16847117 -0.00555180 -0.00005598 -0.00018679 -0.00001778
  G2-4 -33.07798686 -5.85197296 -5.21642633 -0.63391278 -0.61415583 0.40000858 -0.00496391 -0.03777992 -0.16732372 -0.00416208 -0.00011441 -0.00017904 -0.00001333
  G2-5 -33.10991137 -5.77540004 -5.14268108 -0.64082811 -0.63495664 0.40227403 -0.00586783 -0.01671983 -0.21134028 -0.01671983 -0.00005830 -0.00026069 -0.00005830
  G2-6 -33.35835099 -6.21166451 -5.54798819 -0.66256625 -0.70131815 0.44373905 -0.00587607 -0.03406355 -0.21548954 -0.01278876 -0.00011726 -0.00026120 -0.00004639
  G2-7 -33.62574387 -6.57944251 -5.89333679 -0.68555944 -0.78215978 0.48756908 -0.00706424 -0.02824080 -0.25904967 -0.02824080 -0.00010954 -0.00035870 -0.00010954
  G2-8 -48.05739595 -6.91607080 -6.20231600 -0.72980529 -0.64962658 0.41292832 -0.00585127 -0.04397527 -0.18545279 -0.00613274 -0.00004763 -0.00011348 -0.00000956
  G2-9 -48.30764138 -7.27038180 -6.54337619 -0.75322608 -0.73557162 0.45690207 -0.00710585 -0.04262566 -0.24024507 -0.01910508 -0.00006389 -0.00018355 -0.00003419
 G2-10 -48.55672030 -7.65377753 -6.91636403 -0.76849570 -0.81766949 0.49993381 -0.00796861 -0.03961757 -0.29063432 -0.03961757 -0.00007623 -0.00026006 -0.00007623
 G2-11 -66.87265274 -8.53796644 -7.72154892 -0.85780954 -0.77462606 0.47437963 -0.00790262 -0.04747267 -0.24792495 -0.02314409 -0.00002512 -0.00007879 -0.00001573
 G2-12 -67.12730966 -8.92180824 -8.10875993 -0.86921538 -0.85754644 0.51733627 -0.00916964 -0.04774581 -0.31028937 -0.04774581 -0.00003972 -0.00014132 -0.00003972
 G2-13 -89.65572748 -10.39247670 -9.47502115 -0.98200056 -0.90066049 0.53851088 -0.01004323 -0.05079921 -0.30929957 -0.05079921 -0.00001456 -0.00005342 -0.00001456
 G2-14 -269.04070960 -20.97601009 -19.22773027 -1.75104881 -1.47789143 0.87991002 -0.01064247 -0.05599988 -0.37664902 -0.05599988 -0.00020725 -0.00092652 -0.00020725
 G2-15 -268.99761309 -21.01036679 -19.25933123 -1.74723870 -1.45764504 0.87860593 -0.01026323 -0.07070390 -0.34011976 -0.04671928 -0.00052299 -0.00067345 -0.00004388
 G2-16 -269.25389407 -21.37179844 -19.57598722 -1.78444154 -1.54002946 0.92397375 -0.01150716 -0.06456427 -0.37481762 -0.05130692 -0.00037784 -0.00077203 -0.00011481
 G2-17 -269.50615890 -21.74075649 -19.90068919 -1.81999049 -1.61965084 0.96975930 -0.01281160 -0.05826815 -0.40755936 -0.05826815 -0.00023792 -0.00081905 -0.00023792
 G2-18 -318.57711996 -23.29529580 -21.40240993 -1.89073191 -1.58095097 0.93853171 -0.01038207 -0.07524359 -0.39720011 -0.05750302 -0.00036637 -0.00082635 -0.00013946
 G2-19 -318.82530903 -23.64791250 -21.72613862 -1.91784776 -1.65896394 0.98261942 -0.01184570 -0.06952506 -0.43444364 -0.06952506 -0.00029965 -0.00099764 -0.00029965
 G2-20 -373.00470319 -25.69477362 -23.66612018 -2.02959999 -1.70222416 1.00003758 -0.01053521 -0.07859451 -0.44958099 -0.07859451 -0.00025493 -0.00080229 -0.00025493
 G2-21 -432.22280737 -27.86907641 -25.71276677 -2.15416768 -1.74838074 1.02118558 -0.00941322 -0.08460930 -0.45557282 -0.08460930 -0.00017205 -0.00051914 -0.00017205
 G2-22 -11.31019316 -3.55774452 -3.07896345 -0.47081160 -0.44033347 0.30625975 -0.00210800 -0.00056178 -0.11484991 -0.00056178 -0.00001262 -0.00270268 -0.00001262
 G2-23 -95.02802354 -11.93966869 -10.82542593 -1.18544736 -1.07005183 0.65261938 -0.01647913 -0.05627057 -0.35850061 -0.05627057 -0.00002660 -0.00009640 -0.00002660
 G2-24 -65.84749039 -10.98895769 -9.88550414 -1.15136262 -1.15216485 0.70684242 -0.01193066 -0.05950422 -0.43493506 -0.05950422 -0.00027621 -0.00080460 -0.00027621
 G2-25 -66.30878166 -11.74001197 -10.55065151 -1.21466125 -1.29309633 0.79430245 -0.01324651 -0.05638379 -0.45540559 -0.05638379 -0.00029331 -0.00088147 -0.00029331
 G2-26 -66.75553005 -12.48786258 -11.21270763 -1.27665954 -1.43403377 0.88187103 -0.01394934 -0.05790808 -0.48398815 -0.05790808 -0.00031738 -0.00089624 -0.00031738
 G2-27 -80.58330235 -11.61568963 -10.50431881 -1.21919604 -1.10435384 0.67656911 -0.01915908 -0.07470011 -0.47999666 -0.07930469 -0.00019551 -0.00072343 -0.00025660
 G2-28 -80.84660975 -12.04666947 -10.88268948 -1.24440608 -1.18652265 0.72164996 -0.01367449 -0.07023883 -0.47299279 -0.07023883 -0.00020206 -0.00057976 -0.00020206
 G2-29 -99.45580620 -13.30701516 -12.05216369 -1.34867444 -1.22410599 0.73912110 -0.01646431 -0.07344699 -0.47459656 -0.07344699 -0.00012442 -0.00034417 -0.00012442
 G2-30 -99.60619126 -13.66653133 -12.38727170 -1.37781588 -1.28859367 0.78036811 -0.01884032 -0.07503443 -0.48574248 -0.07772462 -0.00015080 -0.00043753 -0.00015247
 G2-31 -99.83193072 -14.06148475 -12.74151878 -1.40748231 -1.36712845 0.82631428 -0.01886917 -0.07502174 -0.51237295 -0.07502174 -0.00016216 -0.00049057 -0.00016216
 G2-32 -100.25109535 -14.82023107 -13.41654610 -1.46465645 -1.50852066 0.91219625 -0.01727460 -0.07535006 -0.53401075 -0.07535006 -0.00019414 -0.00057018 -0.00019414
 G2-33 -95.86237538 -13.10496024 -11.87270147 -1.33571801 -1.21990339 0.73598944 -0.01342959 -0.07845634 -0.49899432 -0.07845634 -0.00013801 -0.00038130 -0.00013801
 G2-34 -96.59874845 -14.60872676 -13.23422685 -1.44541617 -1.50354714 0.90679338 -0.01637763 -0.07875540 -0.54810701 -0.07875540 -0.00022334 -0.00064171 -0.00022334
 G2-35 -114.57439095 -14.70112848 -13.35980934 -1.46907474 -1.32235646 0.79450011 -0.01776669 -0.08207825 -0.51998237 -0.09005807 -0.00009241 -0.00030297 -0.00012611
 G2-36 -133.33691037 -16.31489539 -14.86829461 -1.59862549 -1.42415233 0.85232106 -0.01751470 -0.08746764 -0.52478554 -0.12330681 -0.00005254 -0.00023502 -0.00016788
 G2-37 -133.75576125 -17.05876588 -15.54537175 -1.65638006 -1.57844873 0.94188697 -0.01947727 -0.09419242 -0.60759644 -0.09419242 -0.00011344 -0.00037781 -0.00011344
 G2-38 -178.80767135 -19.92024390 -18.20868346 -1.88953303 -1.66026481 0.98414383 -0.01989864 -0.09817282 -0.62779660 -0.09817282 -0.00003625 -0.00017146 -0.00003625
 G2-39 -166.08702235 -21.58779128 -19.64501813 -2.11802858 -1.95609563 1.16447567 -0.03309339 -0.13093168 -0.76923952 -0.13093168 -0.00023738 -0.00069017 -0.00023738
 G2-40 -295.70227294 -27.97411602 -25.55131850 -2.48051355 -2.07305109 1.22923395 -0.01520160 -0.08607102 -0.49217652 -0.08607102 -0.00009174 -0.00365510 -0.00009174
 G2-41 -537.20429010 -40.52074131 -37.24614491 -3.32682654 -2.67362487 1.57392578 -0.01844946 -0.15389778 -0.70614333 -0.11124826 -0.00256354 -0.00537262 -0.00094068
 G2-42 -636.28235011 -45.18070160 -41.62039882 -3.60857869 -2.91218405 1.69680867 -0.01966960 -0.15421146 -0.81364976 -0.15421146 -0.00129478 -0.00370745 -0.00129478
 G2-43 -745.05189584 -50.01354654 -46.13863802 -3.91186893 -3.12738771 1.82014959 -0.02068378 -0.16807281 -0.82241389 -0.16689357 -0.00073496 -0.00232364 -0.00112907
 G2-44 -863.93012887 -55.03513146 -50.82787785 -4.22541743 -3.36542292 1.95128431 -0.02079289 -0.17017304 -0.89185955 -0.17017304 -0.00051834 -0.00152094 -0.00051834
 G2-45 -579.79172430 -41.62953107 -38.28749747 -3.36134520 -2.73170543 1.59841014 -0.01862363 -0.12994824 -0.68134404 -0.12994824 -0.00027182 -0.00083958 -0.00027182
 G2-46 -335.29609970 -28.52252319 -26.15828431 -2.46415010 -2.07047248 1.21728308 -0.02594465 -0.11878772 -0.66156969 -0.11878772 -0.00033604 -0.00096895 -0.00033604
 G2-47 -405.26373824 -30.06706554 -27.61885521 -2.50653318 -2.07034141 1.22131969 -0.01939635 -0.11435609 -0.64489881 -0.11435609 -0.00055941 -0.00156953 -0.00055941
 G2-48 -439.17812170 -33.19915066 -30.53792327 -2.75765115 -2.27764088 1.33701521 -0.02189761 -0.12967017 -0.68559541 -0.14346036 -0.00028245 -0.00087057 -0.00040177
 G2-49 -498.60339973 -35.66169559 -32.83682523 -2.91812990 -2.39546888 1.40260796 -0.02549272 -0.13321129 -0.72170356 -0.13587619 -0.00023526 -0.00083684 -0.00035563
 G2-50 -521.35792828 -37.51222511 -34.54984895 -3.05666090 -2.51477748 1.46790596 -0.02328070 -0.13477981 -0.75441870 -0.13477981 -0.00019975 -0.00062869 -0.00019975
 G2-51 -538.54171831 -42.80127437 -39.22791173 -3.54185131 -3.10907935 1.84615119 -0.02492448 -0.12130546 -0.78527661 -0.12130546 -0.00074906 -0.00224359 -0.00074906
 G2-52 -465.35430387 -33.76922646 -31.02268154 -2.75120620 -2.39972984 1.41674182 -0.01731151 -0.11398843 -0.68348187 -0.11398843 -0.00040301 -0.00113207 -0.00040301
 G2-53 -406.13295065 -31.60121647 -28.98409628 -2.62367400 -2.35428198 1.39520808 -0.01796107 -0.10903930 -0.67817502 -0.10903930 -0.00051959 -0.00147790 -0.00051959
 G2-54 -498.83966839 -36.05145804 -33.19218483 -2.94073866 -2.47230321 1.44652497 -0.02085532 -0.13324410 -0.75314935 -0.13324410 -0.00028200 -0.00085818 -0.00028200
 G2-55 -505.81854626 -41.43986354 -38.10251243 -3.52647028 -3.02021649 1.76393000 -0.03911302 -0.19474094 -1.04633939 -0.19474094 -0.00048066 -0.00129551 -0.00048066
 G2-56 -289.08587309 -34.19699283 -31.14212270 -3.23239655 -2.92447234 1.72992074 -0.03978822 -0.16728698 -0.99461672 -0.16728698 -0.00015162 -0.00039265 -0.00015162
 G2-57 -1316.75433214 -86.56580341 -79.82147175 -6.74005548 -5.46783878 3.17802949 -0.03857114 -0.28034467 -1.46109865 -0.28034467 -0.00118705 -0.00300983 -0.00118705
 G2-58 -492.03049161 -48.52612565 -44.37359971 -4.34390918 -3.76700821 2.21266713 -0.04608076 -0.20897031 -1.17988656 -0.20897031 -0.00016736 -0.00044606 -0.00016736
 G2-59 -1519.73705144 -100.92506609 -93.06135934 -7.84619630 -6.30872930 3.65919533 -0.03901088 -0.31396906 -1.61270171 -0.31396906 -0.00114880 -0.00299439 -0.00114880
 G2-60 -390.31839170 -45.43291239 -41.46555541 -4.23737065 -3.85850085 2.26535041 -0.05492064 -0.23117614 -1.34582213 -0.23117614 -0.00024638 -0.00061979 -0.00024638
 G2-61 -1760.54840331 -115.28960286 -106.40134878 -8.92814048 -7.25275419 4.19886777 -0.05318138 -0.38607191 -1.99463983 -0.38607191 -0.00194049 -0.00481219 -0.00194049
 G2-62 -471.94016057 -38.36498070 -35.21835667 -3.27630393 -2.80244608 1.64653904 -0.03297168 -0.16784893 -0.92263139 -0.16784893 -0.00070233 -0.00201910 -0.00070233
 G2-63 -777.77708621 -55.15377964 -50.80544153 -4.43339759 -3.64995566 2.12878129 -0.03175333 -0.20660778 -1.07942121 -0.20660778 -0.00149013 -0.00433129 -0.00149013
 G2-64 -278.18981075 -33.49883705 -30.54937155 -3.17857976 -2.90690345 1.71514524 -0.04527865 -0.18062516 -1.05938276 -0.18062516 -0.00022918 -0.00062078 -0.00022918
 G2-65 -626.24454562 -60.85445181 -55.68638273 -5.39562614 -4.71389891 2.75689925 -0.05511925 -0.26641010 -1.49726515 -0.26641010 -0.00026311 -0.00066245 -0.00026311
 G2-66 -1996.49189506 -130.67536102 -120.58597393 -10.06689921 -8.10399361 4.68673780 -0.05213419 -0.41505002 -2.10444691 -0.41505002 -0.00188127 -0.00470083 -0.00188127
 G2-67 -162.43760518 -21.27813298 -19.39830120 -2.10087797 -1.94705558 1.15907720 -0.03423716 -0.14530359 -0.83538138 -0.14530359 -0.00038718 -0.00116823 -0.00038718
 G2-68 -546.57933200 -42.14161023 -38.76976296 -3.56449613 -3.01124561 1.76747976 -0.04206332 -0.18849463 -1.04434935 -0.18849463 -0.00065739 -0.00209101 -0.00065739
 G2-69 -316.08891435 -36.52929948 -33.39037713 -3.44861184 -3.11256640 1.83301147 -0.05411444 -0.19777237 -1.17185693 -0.19777237 -0.00022434 -0.00062989 -0.00022434
 G2-70 -586.35421003 -52.89145123 -48.49869229 -4.59910020 -3.97474300 2.32087351 -0.05056302 -0.22689637 -1.26649094 -0.22689637 -0.00031533 -0.00086382 -0.00031533
 G2-71 -199.97774314 -24.32878122 -22.28008959 -2.37259305 -2.15690518 1.27805484 -0.03491886 -0.17296651 -1.01662934 -0.17296651 -0.00033939 -0.00118873 -0.00033939
 G2-72 -245.46557227 -28.05011729 -25.65395806 -2.67197011 -2.38133174 1.40754942 -0.03867089 -0.15151348 -0.93286832 -0.15151348 -0.00012519 -0.00042944 -0.00012519
 G2-73 -700.09826788 -57.49296120 -52.90219474 -4.90118842 -4.18825296 2.44267198 -0.06452962 -0.25816105 -1.42731687 -0.25816105 -0.00042932 -0.00132332 -0.00042932
 G2-74 -422.96679624 -50.56700150 -46.11966242 -4.76775820 -4.37036539 2.57341859 -0.06599071 -0.26121580 -1.55733417 -0.26121580 -0.00043126 -0.00117937 -0.00043126
 G2-75 -1793.20670138 -120.49177460 -111.10924045 -9.44863782 -7.76811606 4.50541902 -0.05966217 -0.41779388 -2.19081626 -0.41779388 -0.00228794 -0.00567566 -0.00228794
 G2-76 -381.50122112 -47.07249031 -42.86943428 -4.50102206 -4.14487786 2.44923611 -0.06028407 -0.25484754 -1.52415671 -0.25484754 -0.00053497 -0.00137909 -0.00053497
 G2-77 -98.98143318 -16.90522295 -15.21653561 -1.73998953 -1.80492238 1.10103610 -0.01938946 -0.09018884 -0.65740106 -0.09018884 -0.00050536 -0.00140755 -0.00050536
 G2-78 -98.98721516 -16.89566494 -15.21610522 -1.73879551 -1.80483166 1.10049738 -0.02048149 -0.08788473 -0.65319071 -0.08788473 -0.00056273 -0.00163066 -0.00056273
 G2-79 -98.92154632 -16.92154692 -15.24604429 -1.72544861 -1.80871330 1.09934212 -0.01937414 -0.08991467 -0.65547216 -0.08991467 -0.00054601 -0.00146901 -0.00054601
 G2-80 -99.44385866 -17.64896284 -15.87477769 -1.80237667 -1.94533612 1.18786768 -0.02058398 -0.08754451 -0.68124871 -0.08754451 -0.00056148 -0.00155294 -0.00056148
 G2-81 -99.38912719 -17.68852445 -15.92133728 -1.78630598 -1.95056128 1.18636715 -0.01968504 -0.08983210 -0.67706058 -0.08983210 -0.00057699 -0.00149577 -0.00057699
 G2-82 -99.88918201 -18.39387483 -16.53197036 -1.86492086 -2.08590739 1.27526224 -0.02096482 -0.08863039 -0.71068781 -0.08863039 -0.00059893 -0.00157870 -0.00059893
 G2-83 -132.13354972 -22.81261902 -20.54118457 -2.32920420 -2.45698101 1.49414086 -0.02775879 -0.11815550 -0.88042055 -0.11815550 -0.00084882 -0.00249583 -0.00084882
 G2-84 -132.11336175 -22.82143540 -20.54722031 -2.32885282 -2.45775002 1.49532545 -0.02677052 -0.12099457 -0.88105655 -0.12099457 -0.00075760 -0.00205332 -0.00075760
 G2-85 -132.06892383 -22.84259325 -20.58157700 -2.31252986 -2.46169759 1.49274112 -0.02686904 -0.12033282 -0.87638672 -0.12033282 -0.00085007 -0.00223998 -0.00085007
 G2-86 -132.02604683 -22.86815443 -20.61505783 -2.29471084 -2.46574355 1.49015052 -0.02602981 -0.12373389 -0.87755987 -0.12373389 -0.00090136 -0.00225780 -0.00090136
 G2-87 -132.07619798 -22.84519110 -20.58339753 -2.30773447 -2.46269467 1.49140662 -0.02750663 -0.12048563 -0.88041721 -0.12048563 -0.00089151 -0.00231865 -0.00089151
 G2-88 -132.52382697 -23.59369630 -21.24098894 -2.37169217 -2.60334154 1.57890218 -0.02750720 -0.12019347 -0.90728819 -0.12019347 -0.00089968 -0.00227705 -0.00089968
 G2-89 -132.57886922 -23.55775617 -21.19923819 -2.38818441 -2.59772007 1.58081764 -0.02776888 -0.11936872 -0.90887766 -0.11936872 -0.00090152 -0.00236638 -0.00090152
 G2-90 -133.02182338 -24.30080163 -21.85214588 -2.45300640 -2.73789297 1.66865812 -0.02797444 -0.11946227 -0.93763774 -0.11946227 -0.00090411 -0.00230825 -0.00090411
 G2-91 -133.02463199 -24.29850128 -21.85179870 -2.45036305 -2.73792605 1.66780030 -0.02805110 -0.12040072 -0.93953655 -0.12040072 -0.00095515 -0.00240961 -0.00095515
 G2-92 -165.15329850 -28.79097363 -25.94888581 -2.88472117 -3.11880131 1.88461218 -0.03307412 -0.15352802 -1.09913612 -0.15352802 -0.00119813 -0.00295653 -0.00119813
 G2-93 -197.48712708 -33.24967893 -29.98838354 -3.34921952 -3.49224651 2.10213667 -0.03671275 -0.18909429 -1.25729931 -0.18909429 -0.00193513 -0.00436017 -0.00193513
 G2-94 -211.96141323 -25.99944818 -23.66948269 -2.47019430 -2.31999768 1.37837973 -0.03200953 -0.12812005 -0.80459959 -0.12812005 -0.00016317 -0.00045941 -0.00016317
 G2-95 -301.14373295 -35.71365461 -32.56609271 -3.35452831 -3.08911307 1.82187422 -0.04427408 -0.18012055 -1.07660217 -0.18012055 -0.00020641 -0.00054044 -0.00020641
 G2-96 -897.08748156 -60.94891818 -56.15039070 -4.81293757 -4.01723401 2.34480409 -0.02876780 -0.20269706 -1.11460069 -0.20269706 -0.00080207 -0.00211747 -0.00080207
 G2-97 -1328.81962477 -88.12220679 -81.27711504 -6.87161584 -5.63491772 3.27209186 -0.04089757 -0.29360885 -1.55178239 -0.29360885 -0.00131604 -0.00334351 -0.00131604
 G2-98 -81.67852684 -13.55842343 -12.23155412 -1.36108437 -1.46929861 0.89447114 -0.01538571 -0.06833785 -0.51495541 -0.06833785 -0.00026487 -0.00075803 -0.00026487
 G2-99 -113.98324580 -17.96651047 -16.21596057 -1.83353538 -1.83936877 1.11597313 -0.02123251 -0.10051653 -0.69351151 -0.10051653 -0.00040915 -0.00112707 -0.00040915
G2-100 -214.54023248 -29.17301316 -26.55483778 -2.84998258 -2.77793174 1.65483710 -0.04256261 -0.17774447 -1.10249865 -0.17774447 -0.00055475 -0.00154375 -0.00055475
G2-101 -214.58003889 -29.12934366 -26.50514335 -2.85782246 -2.77459522 1.65467537 -0.04729094 -0.17810451 -1.10166675 -0.17810451 -0.00057953 -0.00150414 -0.00057953
G2-102 -302.64140912 -27.66001209 -25.23242766 -2.41054072 -2.27271130 1.36438919 -0.01920863 -0.09006400 -0.63468334 -0.09006400 -0.00048633 -0.00143046 -0.00048633
G2-103 -166.49046897 -22.31862992 -20.29335567 -2.17629248 -2.09510105 1.24893786 -0.03220288 -0.12752732 -0.79014869 -0.12752732 -0.00027845 -0.00076097 -0.00027845
G2-104 -199.61678571 -28.21837516 -25.60476598 -2.76900482 -2.74657549 1.64292677 -0.04061633 -0.15706405 -1.01775888 -0.15706405 -0.00052849 -0.00137252 -0.00052849
G2-105 -181.03686521 -26.98604251 -24.44957287 -2.65979482 -2.70931058 1.62476761 -0.03686161 -0.15015142 -0.99045197 -0.15015142 -0.00061684 -0.00160789 -0.00061684
G2-106 -114.32766174 -18.73745013 -16.91944881 -1.87475040 -1.98451355 1.19961013 -0.02199782 -0.10017279 -0.71333091 -0.10017279 -0.00050731 -0.00134305 -0.00050731
G2-107 -161.20213857 -23.41335619 -21.20130614 -2.39463146 -2.24361439 1.35053758 -0.03040958 -0.14810953 -0.92680835 -0.14810953 -0.00060822 -0.00179642 -0.00060822
G2-108 -114.80729215 -19.45979518 -17.54723800 -1.94976974 -2.12085221 1.28773072 -0.02324510 -0.09861118 -0.74149278 -0.09861118 -0.00053738 -0.00142310 -0.00053738
G2-109 -114.81636134 -19.46270398 -17.55006704 -1.94898786 -2.12103057 1.28768138 -0.02264915 -0.09931615 -0.74187185 -0.09931615 -0.00054129 -0.00143163 -0.00054129
G2-110 -132.52780435 -19.22908400 -17.42207480 -1.92746596 -1.87983350 1.13202871 -0.02748411 -0.10978250 -0.71149645 -0.10978250 -0.00039039 -0.00114874 -0.00039039
G2-111 -132.91033546 -19.98842688 -18.09509775 -1.98133302 -2.02304681 1.21779322 -0.02523602 -0.10746412 -0.73637736 -0.10746412 -0.00040421 -0.00109508 -0.00040421
G2-112 -132.97509952 -19.97234012 -18.06835688 -1.99472869 -2.01927549 1.21959337 -0.02672238 -0.10635997 -0.73593650 -0.10635997 -0.00039388 -0.00107868 -0.00039388
G2-113 -199.19096915 -27.44742422 -24.91161022 -2.71717112 -2.60384174 1.55815954 -0.03811314 -0.15403807 -0.99388595 -0.15403807 -0.00046062 -0.00127314 -0.00046062
G2-114 -133.38885232 -20.72749771 -18.73728696 -2.05264805 -2.16035405 1.30541036 -0.02447264 -0.10609977 -0.76012407 -0.10609977 -0.00043848 -0.00117539 -0.00043848
G2-115 -133.38244500 -20.71595009 -18.72557491 -2.05571551 -2.15945406 1.30560210 -0.02601146 -0.10483635 -0.76027153 -0.10483635 -0.00043598 -0.00117229 -0.00043598
G2-116 -438.78777946 -36.79236022 -33.68563750 -3.13666835 -2.87056742 1.70022602 -0.02436772 -0.14347899 -0.88133307 -0.14347899 -0.00089422 -0.00238187 -0.00089422
G2-117 -505.85909416 -45.75110548 -41.85343933 -3.98988354 -3.73559754 2.21350800 -0.04370750 -0.19739369 -1.21068983 -0.19739369 -0.00104100 -0.00272243 -0.00104100
G2-118 -439.26778611 -37.50622757 -34.30297869 -3.21191650 -3.00614665 1.78862979 -0.02509904 -0.14019947 -0.90610098 -0.14019947 -0.00083321 -0.00222986 -0.00083321
G2-119 -439.26500022 -37.50603022 -34.30312226 -3.21477101 -3.00637902 1.78947317 -0.02551946 -0.14071892 -0.90843493 -0.14071892 -0.00085861 -0.00229151 -0.00085861
G2-120 -155.47685343 -21.44860786 -19.44454103 -2.10385703 -2.06251398 1.23925147 -0.02704719 -0.10780228 -0.73093636 -0.10780228 -0.00032663 -0.00094936 -0.00032663
G2-121 -498.49250772 -39.67373244 -36.34137337 -3.33949665 -3.05149619 1.81010618 -0.02463566 -0.14513446 -0.91077724 -0.14513446 -0.00069706 -0.00184673 -0.00069706
G2-122 -498.04030852 -38.92876765 -35.68837215 -3.27530436 -2.91143665 1.72257544 -0.02479787 -0.14528573 -0.88506522 -0.14528573 -0.00067234 -0.00183711 -0.00067234
G2-123 -146.66861411 -23.12542248 -20.87731785 -2.36222882 -2.35071688 1.42266620 -0.02860228 -0.13091514 -0.89529509 -0.13091514 -0.00067192 -0.00190619 -0.00067192
G2-124 -166.11300260 -25.88560151 -23.39580395 -2.58126596 -2.67177366 1.61279040 -0.03370583 -0.13756184 -0.96066489 -0.13756184 -0.00068063 -0.00176934 -0.00068063
G2-125 -199.62676920 -28.23605616 -25.62256680 -2.76353802 -2.74766694 1.64234431 -0.03871973 -0.15776300 -1.01200676 -0.15776300 -0.00052132 -0.00135873 -0.00052132
G2-126 -222.16056671 -29.69331609 -26.97455619 -2.88113621 -2.78948512 1.66413184 -0.04041450 -0.15981296 -1.01196527 -0.15981296 -0.00042566 -0.00112514 -0.00042566
G2-127 -564.73128896 -47.14919483 -43.20161234 -4.05486943 -3.63705659 2.14757708 -0.04041587 -0.19868000 -1.17313369 -0.19868000 -0.00083516 -0.00221023 -0.00083516
G2-128 -531.62506926 -45.58085199 -41.66144999 -3.92789165 -3.70348961 2.20359671 -0.03160298 -0.17600289 -1.13789422 -0.17600289 -0.00100161 -0.00257356 -0.00100161
G2-129 -166.52816073 -26.63215147 -24.05752211 -2.63812060 -2.81229745 1.69790470 -0.03173645 -0.13786570 -0.98857312 -0.13786570 -0.00076403 -0.00194526 -0.00076403
G2-130 -166.51950016 -26.62385065 -24.04684583 -2.64366839 -2.81137561 1.69887563 -0.03315083 -0.13573273 -0.98669699 -0.13573273 -0.00070888 -0.00183490 -0.00070888
G2-131 -147.94034843 -25.35845486 -22.86320667 -2.53487411 -2.77250151 1.67983901 -0.03133055 -0.13045092 -0.97123065 -0.13045092 -0.00089910 -0.00226840 -0.00089910
G2-132 -198.29135247 -30.37474971 -27.49733357 -3.01035843 -3.05233925 1.82582661 -0.03659777 -0.17531028 -1.12825912 -0.17531028 -0.00114804 -0.00271395 -0.00114804
G2-133 -504.15771920 -47.17827733 -43.08763070 -4.16909278 -3.90073975 2.30950318 -0.03683619 -0.21402956 -1.27915196 -0.21402956 -0.00187636 -0.00442565 -0.00187636
G2-134 -179.70801473 -29.13926869 -26.33801788 -2.90189717 -3.01489035 1.80762021 -0.03275408 -0.16896140 -1.10298649 -0.16896140 -0.00131095 -0.00306089 -0.00131095
G2-135 -212.42690068 -34.30509198 -30.99141589 -3.43807351 -3.52658252 2.11575858 -0.03934033 -0.19967918 -1.29255888 -0.19967918 -0.00179912 -0.00406539 -0.00179912
G2-136 -0.47516982 -0.65705264 -0.56665001 -0.08945789 -0.13022993 0.09200804 -0.00091567 0.00000000 -0.04139019 0.00000000 0.00000000 -0.00003440 0.00000000
G2-137 -372.74641103 -25.34441635 -23.33507746 -2.00816605 -1.62398928 0.95681122 -0.00942716 -0.08250873 -0.40829660 -0.06314984 -0.00025867 -0.00060908 -0.00012557
G2-138 -65.54321223 -10.61152874 -9.53771420 -1.12597707 -1.06643091 0.66250676 -0.01179919 -0.06346602 -0.39479813 -0.04884423 -0.00026536 -0.00071711 -0.00021297
G2-139 -66.04084156 -11.35866555 -10.20246343 -1.18805779 -1.21195127 0.74963500 -0.01370778 -0.06120175 -0.41691556 -0.04652344 -0.00030814 -0.00081185 -0.00023905
G2-140 -132.74752682 -19.57950160 -17.71444479 -1.96743251 -1.94124324 1.17471275 -0.02694516 -0.10769278 -0.70863548 -0.10650187 -0.00039125 -0.00101047 -0.00035781
G2-141 -99.99892756 -14.44385425 -13.07606139 -1.43602992 -1.42990891 0.86720103 -0.01809882 -0.07930407 -0.49832803 -0.06824293 -0.00019540 -0.00049689 -0.00015714
G2-142 -100.01610713 -14.42444769 -13.03948356 -1.44645610 -1.42814122 0.86823721 -0.02166534 -0.07474374 -0.48362424 -0.06160054 -0.00016118 -0.00051593 -0.00019028
G2-143 -133.15556801 -20.32838209 -18.35922325 -2.03458444 -2.08007125 1.26160986 -0.02994316 -0.10546642 -0.71126944 -0.09335223 -0.00039545 -0.00111846 -0.00044148
G2-144 -405.88234043 -31.24573445 -28.65409424 -2.59985207 -2.27691426 1.35154649 -0.01810172 -0.11284302 -0.63953630 -0.09641298 -0.00051853 -0.00128650 -0.00039496
G2-145 -66.49346014 -12.11737770 -10.87083973 -1.25136965 -1.35446784 0.83769201 -0.01385444 -0.06361840 -0.44249515 -0.04464300 -0.00033179 -0.00079212 -0.00023781
G2-146 -99.63011424 -18.02304646 -16.19366015 -1.83874199 -2.00726816 1.23115744 -0.02148339 -0.09418496 -0.67005641 -0.07662397 -0.00061717 -0.00145684 -0.00049474
G2-147 -132.76749310 -23.92803842 -21.51637186 -2.42448692 -2.65992136 1.62408676 -0.02904223 -0.12576133 -0.89904136 -0.10899750 -0.00097317 -0.00225620 -0.00081511
G2-148 -181.20647469 -22.86470277 -20.87659965 -2.23594540 -2.04981277 1.21753995 -0.03619910 -0.14427755 -0.86234606 -0.16486500 -0.00024649 -0.00089645 -0.00037363
G2-149 -132.12027645 -22.80504699 -20.53913892 -2.32801259 -2.45702016 1.49445470 -0.02766901 -0.11897320 -0.88000615 -0.11897320 -0.00085364 -0.00234386 -0.00085364
G2-150 -165.26541405 -28.72302234 -25.86800387 -2.91319087 -3.10977842 1.88667979 -0.03493735 -0.15044126 -1.10912553 -0.15044126 -0.00125726 -0.00342698 -0.00125726
G2-151 -165.66517151 -29.52332203 -26.58334489 -2.95388803 -3.25756270 1.97099183 -0.03435444 -0.15234026 -1.13254339 -0.15234026 -0.00128330 -0.00313888 -0.00128330
G2-152 -166.15464549 -30.20745070 -27.17203578 -3.04116730 -3.38986296 2.06207301 -0.03498409 -0.15030146 -1.16467433 -0.15030146 -0.00122185 -0.00306306 -0.00122185
G2-153 -166.15986001 -30.20269971 -27.17276036 -3.03324923 -3.39024173 2.05963575 -0.03516736 -0.15315567 -1.17090531 -0.15315567 -0.00138413 -0.00338727 -0.00138413
G2-154 -197.90772614 -33.95533030 -30.60867920 -3.41363336 -3.63012486 2.18922521 -0.04094063 -0.18374384 -1.30162870 -0.18374384 -0.00169274 -0.00416363 -0.00169274
G2-155 -197.90501338 -33.96087618 -30.61086291 -3.41350974 -3.63032667 2.18942027 -0.04097114 -0.18179903 -1.29833550 -0.18179903 -0.00161786 -0.00406883 -0.00161786
G2-156 -198.79622226 -35.44082496 -31.91516551 -3.53678667 -3.91081798 2.36301362 -0.04179175 -0.18375604 -1.35987631 -0.18375604 -0.00168914 -0.00409273 -0.00168914
G2-157 -199.28736270 -36.11420996 -32.49204071 -3.62930274 -4.04184337 2.45548243 -0.04199206 -0.18115322 -1.39172638 -0.18115322 -0.00154484 -0.00382829 -0.00154484
G2-158 -199.28471434 -36.11304239 -32.49524589 -3.62375290 -4.04258597 2.45393642 -0.04226392 -0.18304482 -1.39596619 -0.18304482 -0.00167579 -0.00408735 -0.00167579
G2-159 -230.62105634 -39.15700244 -35.31189942 -3.93559385 -4.14461217 2.49535014 -0.04400485 -0.22114194 -1.48646497 -0.22114194 -0.00232731 -0.00527404 -0.00232731
G2-160 -232.42012292 -42.02092860 -37.81198636 -4.21745611 -4.69381552 2.84889359 -0.04899961 -0.21200449 -1.61878657 -0.21200449 -0.00186999 -0.00459784 -0.00186999
G2-161 -263.28100992 -44.28338046 -39.94419468 -4.46357062 -4.65412909 2.80109119 -0.05538595 -0.24663714 -1.70240703 -0.24663714 -0.00259017 -0.00640156 -0.00259017
G2-162 -265.55285323 -47.92767707 -43.13197977 -4.80558773 -5.34579374 3.24230268 -0.05600864 -0.24285952 -1.84585387 -0.24285952 -0.00219625 -0.00536961 -0.00219625
G2-163 -328.65872345 -54.74510570 -49.41716394 -5.48207789 -5.69098491 3.40927622 -0.06209577 -0.32221706 -2.07233069 -0.32221706 -0.00407099 -0.00902217 -0.00407099
G2-164 -328.63781913 -54.69479090 -49.38883787 -5.48505817 -5.68865846 3.40945791 -0.06439662 -0.32824669 -2.09614776 -0.32824669 -0.00472584 -0.01081032 -0.00472584
G2-165 -232.75224254 -34.13575000 -30.93405868 -3.35579616 -3.39917555 2.03621493 -0.04713051 -0.18744386 -1.23996243 -0.18744386 -0.00080157 -0.00203003 -0.00080157
G2-166 -199.66574620 -32.53703667 -29.37849943 -3.22176874 -3.46451338 2.08993094 -0.03879951 -0.17025147 -1.21896147 -0.17025147 -0.00115202 -0.00284060 -0.00115202
G2-167 -245.54222746 -40.23808704 -36.34704540 -4.01629248 -4.18093948 2.50750652 -0.04688359 -0.23265692 -1.51805915 -0.23265692 -0.00227046 -0.00517996 -0.00227046
G2-168 -264.12126497 -41.49337639 -37.52576121 -4.12002511 -4.21964480 2.52512821 -0.04904261 -0.23951003 -1.53725953 -0.23951003 -0.00212563 -0.00481714 -0.00212563
G2-169 -198.76131933 -31.04491030 -28.06668591 -3.10289295 -3.18313140 1.91720100 -0.04127958 -0.16697796 -1.15975530 -0.16697796 -0.00091830 -0.00249655 -0.00091830
G2-170 -199.16549230 -31.84991873 -28.78025780 -3.14557181 -3.33124655 2.00170888 -0.03936220 -0.16845933 -1.18067213 -0.16845933 -0.00105949 -0.00261299 -0.00105949
G2-171 -231.88873859 -37.01891917 -33.45087617 -3.67057022 -3.84365237 2.30886986 -0.04737956 -0.20135524 -1.38205225 -0.20135524 -0.00134959 -0.00329462 -0.00134959
G2-172 -330.35901382 -48.93463261 -44.33294318 -4.85352119 -4.80185046 2.86565980 -0.06815423 -0.28224036 -1.81499961 -0.28224036 -0.00198323 -0.00533341 -0.00198323
G2-173 -227.36909694 -35.36301568 -31.99445674 -3.52691898 -3.56087382 2.12938974 -0.04239880 -0.20975345 -1.32558438 -0.20975345 -0.00164940 -0.00373582 -0.00164940
G2-174 -572.42743000 -54.07658379 -49.46535043 -4.75711535 -4.46904440 2.63767696 -0.05645146 -0.25139567 -1.49409672 -0.25139567 -0.00112824 -0.00286532 -0.00112824
G2-175 -629.21838463 -60.43688542 -55.12525043 -5.40879678 -5.11067473 3.03011453 -0.04816354 -0.27907604 -1.69039137 -0.27907604 -0.00245640 -0.00560138 -0.00245640
G2-176 -227.47475429 -35.25409960 -31.85272533 -3.57082606 -3.54809884 2.13785906 -0.04250627 -0.20446270 -1.35896947 -0.20446270 -0.00106524 -0.00273012 -0.00106524
G2-177 -227.36834955 -35.35404601 -31.98942649 -3.52725566 -3.56053382 2.12931063 -0.04112078 -0.21045804 -1.32905202 -0.21045804 -0.00168619 -0.00382765 -0.00168619
G2-178 -198.33667356 -30.29238493 -27.39246993 -3.04854592 -3.04227989 1.83279446 -0.04067469 -0.17151557 -1.14388054 -0.17151557 -0.00091225 -0.00244083 -0.00091225
G2-179 -198.79756820 -31.04636154 -28.05989210 -3.10952514 -3.18339834 1.91957016 -0.04170281 -0.16828196 -1.16171687 -0.16828196 -0.00095574 -0.00262559 -0.00095574
G2-180 -332.11715032 -47.53576300 -43.12260640 -4.65961915 -4.63710698 2.76736477 -0.06795858 -0.26945038 -1.72077764 -0.26945038 -0.00119169 -0.00295528 -0.00119169
G2-181 -504.60257823 -47.89498865 -43.70355037 -4.24046529 -4.03794354 2.39789204 -0.03891102 -0.20510084 -1.30320497 -0.20510084 -0.00162896 -0.00409967 -0.00162896
G2-182 -180.25054704 -29.77920922 -26.85410213 -3.01071532 -3.14319185 1.90292116 -0.03532253 -0.16252324 -1.14888392 -0.16252324 -0.00102235 -0.00258882 -0.00102235
G2-183 -199.24298966 -31.79544606 -28.71912686 -3.16848779 -3.32416469 2.00605858 -0.04082604 -0.16858729 -1.18785290 -0.16858729 -0.00100176 -0.00252739 -0.00100176
G2-184 -199.24038268 -31.78607557 -28.70921275 -3.17014757 -3.32340863 2.00618684 -0.04078101 -0.16886176 -1.19181418 -0.16886176 -0.00102886 -0.00258180 -0.00102886
G2-185 -265.80032085 -40.08122781 -36.29959710 -3.91975202 -4.05736063 2.42386204 -0.05245292 -0.21627017 -1.45892491 -0.21627017 -0.00123445 -0.00302096 -0.00123445
G2-186 -505.04855506 -48.63594817 -44.35652548 -4.30227692 -4.17821941 2.48474273 -0.03921398 -0.20582076 -1.33290741 -0.20582076 -0.00165238 -0.00408974 -0.00165238
G2-187 -564.76778559 -51.48147588 -46.98147782 -4.50853754 -4.35571111 2.59469763 -0.03919899 -0.20996427 -1.37178070 -0.20996427 -0.00150811 -0.00372775 -0.00150811
G2-188 -564.75769292 -51.48770063 -46.98141181 -4.51621457 -4.35546848 2.59705621 -0.03861549 -0.20684018 -1.36500280 -0.20684018 -0.00132043 -0.00333056 -0.00132043
G2-189 -180.58957363 -30.58967636 -27.59855679 -3.03889231 -3.29236556 1.98345690 -0.03676221 -0.16234894 -1.16298625 -0.16234894 -0.00120181 -0.00294620 -0.00120181
G2-190 -313.94151907 -46.89715259 -42.52124151 -4.60999069 -4.73469064 2.83383355 -0.06409287 -0.27242369 -1.78719674 -0.27242369 -0.00163422 -0.00404620 -0.00163422
G2-191 -199.65629461 -32.53190926 -29.36813436 -3.23168152 -3.46330420 2.09217124 -0.04025676 -0.16663571 -1.21317814 -0.16663571 -0.00099926 -0.00253223 -0.00099926
G2-192 -266.28456343 -40.76869753 -36.89305349 -4.00475972 -4.19021366 2.51463383 -0.05254495 -0.21589191 -1.49361768 -0.21589191 -0.00122640 -0.00301788 -0.00122640
G2-193 -505.54114740 -49.31208066 -44.94251006 -4.37980657 -4.31044280 2.57296336 -0.03960108 -0.20563899 -1.36884737 -0.20563899 -0.00170963 -0.00423753 -0.00170963
G2-194 -878.04833680 -74.33891775 -68.04166789 -6.32887702 -5.88355072 3.48421957 -0.05276427 -0.28855458 -1.79413037 -0.28855458 -0.00232880 -0.00586928 -0.00232880
G2-195 -181.08962311 -31.27284683 -28.19159476 -3.11741701 -3.42533133 2.07204172 -0.03676894 -0.16366954 -1.20147720 -0.16366954 -0.00129641 -0.00317960 -0.00129641
G2-196 -402.04988966 -45.41444730 -41.22745167 -4.17725757 -4.23199060 2.54673525 -0.03837304 -0.18761032 -1.32075576 -0.18761032 -0.00149515 -0.00376220 -0.00149515
G2-197 -537.29196462 -53.08660988 -48.41046299 -4.75693179 -4.55300405 2.70314181 -0.04419714 -0.24558031 -1.50752398 -0.24558031 -0.00226089 -0.00533667 -0.00226089
G2-198 -212.83837949 -35.04138845 -31.65428364 -3.49128465 -3.66663775 2.20118121 -0.04029071 -0.20009660 -1.33226024 -0.20009660 -0.00167701 -0.00392101 -0.00167701
G2-199 -232.29869518 -37.76178253 -34.10831114 -3.72803173 -3.98414986 2.39340096 -0.04713080 -0.20011812 -1.40931175 -0.20011812 -0.00145872 -0.00354978 -0.00145872
G2-200 -232.37302073 -37.70513782 -34.04221683 -3.75579463 -3.97654162 2.39934429 -0.04792903 -0.19961857 -1.41511898 -0.19961857 -0.00133580 -0.00331091 -0.00133580
G2-201 -299.02475577 -45.95055431 -41.57775980 -4.52884802 -4.70339570 2.82198850 -0.06153141 -0.25046113 -1.69587805 -0.25046113 -0.00149185 -0.00364685 -0.00149185
G2-202 -538.17702924 -54.54919224 -49.68508781 -4.88581759 -4.83124407 2.87695226 -0.04677835 -0.23721115 -1.56075029 -0.23721115 -0.00207113 -0.00506120 -0.00207113
G2-203 -213.72030394 -36.50460045 -32.92886794 -3.62186139 -3.94559315 2.37550575 -0.04424371 -0.19400241 -1.39119025 -0.19400241 -0.00160904 -0.00389955 -0.00160904
G2-204 -232.78609316 -38.43682033 -34.69274396 -3.81073275 -4.11645226 2.48304747 -0.04741758 -0.20068360 -1.44790548 -0.20068360 -0.00151770 -0.00368792 -0.00151770
G2-205 -375.82176664 -52.66793394 -47.77705161 -5.12619076 -5.03121791 2.99164442 -0.06376538 -0.29139746 -1.80764080 -0.29139746 -0.00199538 -0.00451036 -0.00199538
G2-206 -375.82049701 -52.66778005 -47.77708868 -5.12654601 -5.03126203 2.99174221 -0.06350621 -0.29134708 -1.80820715 -0.29134708 -0.00199804 -0.00450837 -0.00199804
G2-207 -286.65481586 -42.95886011 -38.88288551 -4.23775856 -4.26175936 2.54690018 -0.05022980 -0.24030081 -1.53269365 -0.24030081 -0.00196685 -0.00443640 -0.00196685
G2-208 -265.92745332 -44.34315431 -40.01053724 -4.40171547 -4.76780339 2.87707240 -0.05461566 -0.23087254 -1.67241570 -0.23087254 -0.00181355 -0.00439240 -0.00181355
G2-209 -765.04995840 -73.18418030 -67.05046252 -6.43262980 -5.66166603 3.29756611 -0.07121429 -0.33116289 -1.84242174 -0.33116289 -0.00039935 -0.00098205 -0.00039935
G2-210 -908.69561019 -85.51328619 -78.44404309 -7.47329956 -6.60824912 3.83873304 -0.08792098 -0.40125940 -2.21510836 -0.40125940 -0.00058629 -0.00143810 -0.00058629
G2-211 -1272.48261117 -90.50660964 -83.42642225 -7.14583678 -5.84799887 3.38465672 -0.04100701 -0.32182153 -1.60988376 -0.32182153 -0.00421394 -0.01082393 -0.00421394
G2-212 -572.37867549 -49.72584571 -45.67938937 -4.29757045 -3.75132755 2.18899881 -0.05517164 -0.24673092 -1.32732434 -0.24673092 -0.00056811 -0.00155414 -0.00056811
G2-213 -1236.45387206 -80.05868601 -73.93097283 -6.16404105 -4.93880557 2.85925091 -0.03540791 -0.25588318 -1.31962156 -0.25588318 -0.00116078 -0.00318903 -0.00116078
G2-214 -1680.63985678 -113.58445379 -104.78210923 -8.88295828 -7.25109928 4.19585289 -0.06167082 -0.39426755 -2.01751418 -0.39426755 -0.00173573 -0.00441572 -0.00173573
G2-215 -2477.89065795 -160.39439885 -148.13494184 -12.28352072 -9.89768400 5.71184410 -0.07097840 -0.52567492 -2.64114823 -0.52567492 -0.00309951 -0.00767206 -0.00309951
G2-216 -1369.64791941 -96.58398751 -89.06651476 -7.70547766 -6.39941857 3.70719122 -0.06795017 -0.37319742 -1.92869852 -0.37319742 -0.00149042 -0.00393726 -0.00149042
G2-217 -1614.05666863 -105.25560740 -97.17326111 -8.11018953 -6.51719065 3.77020215 -0.04757352 -0.33903016 -1.72674080 -0.33903016 -0.00175583 -0.00461877 -0.00175583
G2-218 -1608.98392642 -105.06301144 -97.03097323 -8.10133156 -6.51199233 3.76691540 -0.05227663 -0.34688230 -1.76344495 -0.34688230 -0.00211475 -0.00567452 -0.00211475
G2-219 -1132.58541192 -75.42269855 -69.56175966 -5.87732335 -4.71931477 2.73856685 -0.03350472 -0.23747765 -1.23050805 -0.23747765 -0.00108316 -0.00296943 -0.00108316
G2-220 -732.87837838 -62.88954159 -57.69494019 -5.41119874 -4.70659197 2.74868533 -0.05595810 -0.26921223 -1.50740653 -0.26921223 -0.00053838 -0.00139010 -0.00053838
G2-221 -601.80049107 -70.74486401 -64.55519599 -6.60410967 -6.04761009 3.54709143 -0.08856119 -0.36399377 -2.12396289 -0.36399377 -0.00058746 -0.00141774 -0.00058746
G2-222 -300.88906837 -35.32276646 -32.21470276 -3.32776889 -3.00837655 1.77716252 -0.04627293 -0.18099334 -1.04334860 -0.17798933 -0.00019911 -0.00048072 -0.00017256
G2-223 -197.21777744 -32.86545540 -29.63930959 -3.32352894 -3.41119321 2.05790813 -0.03823361 -0.19456546 -1.22213115 -0.18002581 -0.00195033 -0.00432189 -0.00188904
# Non Hydrogon Local Minimums : 31
# Non Hydrogon Transition States : 15
# Hydrogon Local Minimums : 21
# Hydrogon Transition States : 19
NHL1  -0.19120627 -0.30821881 -0.26483415 -0.04163629 -0.03979738 0.03979738 -0.00043702 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
NHL2  -95.86022091 -13.10748306 -11.87478038 -1.33566440 -1.22001205 0.73601057 -0.01339960 -0.07829047 -0.49820944 -0.07829047 -0.00013738 -0.00037934 -0.00013738
NHL3  -95.98929565 -13.45591727 -12.19529663 -1.36474805 -1.28384951 0.77638606 -0.01709492 -0.07820337 -0.49729609 -0.07708031 -0.00016843 -0.00049974 -0.00018108
NHL4  -99.45442336 -13.30860139 -12.05349731 -1.34862903 -1.22417619 0.73913116 -0.01642167 -0.07335924 -0.47418601 -0.07335924 -0.00012409 -0.00034319 -0.00012409
NHL5  -99.60262733 -13.67041048 -12.39047384 -1.37795374 -1.28880028 0.78047180 -0.01881140 -0.07504309 -0.48537525 -0.07762258 -0.00015032 -0.00043481 -0.00015147
NHL6  -66.30486506 -11.74405829 -10.55411164 -1.21489824 -1.29333974 0.79440031 -0.01322290 -0.05640653 -0.45541459 -0.05640653 -0.00029255 -0.00088008 -0.00029255
NHL7  -66.48451424 -12.12679893 -10.87891135 -1.25172386 -1.35499854 0.83789743 -0.01376863 -0.06357702 -0.44187917 -0.04456655 -0.00032941 -0.00078398 -0.00023561
NHL8  -33.35386659 -6.21632190 -5.55206751 -0.66271384 -0.70160288 0.44383613 -0.00585297 -0.03404298 -0.21524800 -0.01278876 -0.00011657 -0.00025898 -0.00004607
NHL9  -99.61257882 -18.03765970 -16.20202452 -1.84113620 -2.00721058 1.23174092 -0.02093135 -0.09489430 -0.66878260 -0.07463825 -0.00062108 -0.00144771 -0.00048655
NHL10 -80.84792538 -12.04514589 -10.88141807 -1.24444276 -1.18645281 0.72163784 -0.01369543 -0.07033626 -0.47347053 -0.07033626 -0.00020269 -0.00058184 -0.00020269
NHL11 -80.82892426 -12.04865719 -10.87882964 -1.24222371 -1.18549474 0.72068078 -0.01397536 -0.06621747 -0.45533467 -0.06621747 -0.00019578 -0.00055052 -0.00019578
NHL12 -89.21110878 -10.22515601 -9.34093164 -0.97166098 -0.89026502 0.53038471 -0.01594011 -0.05715219 -0.32601026 -0.05715219 -0.00000790 -0.00003982 -0.00000790
NHL13 -122.77950597 -16.29532779 -14.78355401 -1.58163582 -1.55143799 0.93398792 -0.01901623 -0.07695651 -0.53104153 -0.07695651 -0.00012754 -0.00039111 -0.00012754
NHL14 -212.00721017 -26.52050340 -24.13514989 -2.54319130 -2.44348028 1.46095628 -0.04152026 -0.13647772 -0.86399157 -0.13647772 -0.00020581 -0.00059663 -0.00020581
NHL15 -431.83911970 -27.71797783 -25.58185453 -2.13820544 -1.73571053 1.01133221 -0.01092967 -0.08792758 -0.45441633 -0.08792758 -0.00022305 -0.00072806 -0.00022305
NHL16 -465.34307818 -33.78089999 -31.03337503 -2.75073302 -2.40046940 1.41682672 -0.01718274 -0.11400934 -0.68262440 -0.11400934 -0.00040011 -0.00111853 -0.00040011
NHL17 -897.19260971 -61.50017624 -56.62382458 -4.88092255 -4.13794334 2.42607541 -0.03111788 -0.20400166 -1.14139077 -0.20400166 -0.00083717 -0.00230640 -0.00083717
NHL18 -554.58361096 -43.99478993 -40.37815351 -3.71149415 -3.29178172 1.94340265 -0.04533900 -0.17454088 -1.01783843 -0.17454088 -0.00053104 -0.00148831 -0.00053104
NHL19 -554.62225854 -44.02026915 -40.37764453 -3.71236486 -3.28930364 1.94345337 -0.03108728 -0.16648283 -0.98937099 -0.16648283 -0.00049712 -0.00141907 -0.00049712
NHL20 -66.68636550 -8.71233841 -7.94012633 -0.85664220 -0.84366705 0.50762480 -0.01417349 -0.05635107 -0.33662512 -0.05635107 -0.00004222 -0.00018438 -0.00004222
NHL21 -100.24081843 -14.83126173 -13.42589557 -1.46504060 -1.50913599 0.91242329 -0.01716943 -0.07523081 -0.53306329 -0.07523081 -0.00019207 -0.00056248 -0.00019207
NHL22 -189.48052982 -25.06553297 -22.80017187 -2.41354027 -2.40313290 1.43682287 -0.03597731 -0.13677032 -0.86709889 -0.13677032 -0.00030542 -0.00085925 -0.00030542
NHL23 -189.48011389 -25.01078579 -22.73577803 -2.42807237 -2.39690678 1.43826416 -0.03760576 -0.13550659 -0.87339206 -0.13550659 -0.00027807 -0.00081323 -0.00027807
NHL24 -162.42982823 -21.28759514 -19.40553009 -2.10072500 -1.94743694 1.15915825 -0.03415250 -0.14443040 -0.83149994 -0.14443040 -0.00038004 -0.00114466 -0.00038004
NHL25 -66.86933513 -8.54161298 -7.72454102 -0.85786893 -0.77481062 0.47445015 -0.00786278 -0.04740612 -0.24746208 -0.02310124 -0.00002497 -0.00007786 -0.00001562
NHL26 -178.81157800 -19.91550075 -18.20488340 -1.89001526 -1.66005232 0.98417101 -0.01997673 -0.09831575 -0.62989141 -0.09831575 -0.00003643 -0.00017468 -0.00003643
NHL27 -89.65346892 -10.39496559 -9.47704744 -0.98202753 -0.90077501 0.53855692 -0.01000795 -0.05074317 -0.30892833 -0.05074317 -0.00001450 -0.00005304 -0.00001450
NHL28 -521.35167575 -37.51938639 -34.55593964 -3.05597975 -2.51514314 1.46787447 -0.02316775 -0.13464059 -0.75255267 -0.13464059 -0.00019835 -0.00062004 -0.00019835
NHL29 -432.21959456 -27.87249322 -25.71568124 -2.15423087 -1.74857388 1.02125286 -0.00937683 -0.08459429 -0.45529774 -0.08459429 -0.00017116 -0.00051558 -0.00017116
NHL30 -89.38890704 -10.00641205 -9.06942612 -0.97343212 -0.81668281 0.49540208 -0.00768670 -0.04707123 -0.23597065 -0.02358331 -0.00000588 -0.00001796 -0.00000381
NHL31 -431.95286969 -27.51673592 -25.37185042 -2.13691877 -1.66967393 0.97840219 -0.00854831 -0.08667092 -0.41161171 -0.06652895 -0.00015017 -0.00035019 -0.00008031
NHT1  -96.02742359 -13.39349938 -12.14982458 -1.36460436 -1.27538731 0.77385200 -0.01733193 -0.08423644 -0.51125545 -0.07851782 -0.00021818 -0.00058275 -0.00016725
NHT2  -99.64157743 -13.60009840 -12.32236348 -1.38107718 -1.27438193 0.77734727 -0.02022461 -0.07599659 -0.48433232 -0.07509449 -0.00016852 -0.00048160 -0.00014315
NHT3  -66.49672563 -12.03722546 -10.81553502 -1.24947111 -1.34248671 0.83298959 -0.01640551 -0.06001727 -0.46004460 -0.05541073 -0.00037084 -0.00108641 -0.00032453
NHT4  -99.64115724 -17.94696061 -16.12546256 -1.85644700 -2.00137346 1.23329389 -0.02510781 -0.09729137 -0.68712125 -0.07616014 -0.00066877 -0.00180652 -0.00055266
NHT5  -80.82909977 -11.98590579 -10.83112835 -1.23972831 -1.18272749 0.71916251 -0.01453160 -0.07042802 -0.46948249 -0.07042802 -0.00023170 -0.00062780 -0.00023170
NHT6  -212.01713382 -26.47145356 -24.11452268 -2.54209690 -2.44323654 1.45944525 -0.05052081 -0.14318058 -0.89406502 -0.14318058 -0.00024312 -0.00078939 -0.00024312
NHT7  -897.21066177 -61.44837204 -56.59577311 -4.88169067 -4.13661123 2.42491791 -0.03986767 -0.20874453 -1.16186552 -0.20874453 -0.00098975 -0.00303952 -0.00098975
NHT8  -554.60730029 -43.95989636 -40.35714045 -3.71200977 -3.29032855 1.94243908 -0.04965394 -0.17705554 -1.03130082 -0.17705554 -0.00058875 -0.00181597 -0.00058875
NHT9  -189.48309264 -24.96998312 -22.72586843 -2.42671354 -2.39805343 1.43723886 -0.04769710 -0.14314654 -0.90552056 -0.14314654 -0.00035042 -0.00112409 -0.00035042
NHT10 -162.62431588 -21.53873869 -19.64779021 -2.13137432 -2.00017371 1.19592096 -0.03384118 -0.15770731 -0.84299750 -0.13686403 -0.00064739 -0.00141817 -0.00034481
NHT11 -122.99608858 -16.49573831 -14.99022835 -1.61777081 -1.60086083 0.97124400 -0.02130031 -0.09624480 -0.56335257 -0.07434885 -0.00030599 -0.00072545 -0.00012283
NHT12 -179.01057968 -20.19248997 -18.47486955 -1.92389212 -1.70896243 1.02110626 -0.02928208 -0.11077891 -0.63636249 -0.09872392 -0.00008252 -0.00036841 -0.00004269
NHT13 -554.73115388 -43.66998024 -40.09565299 -3.70718915 -3.22118449 1.90746267 -0.03201908 -0.18620759 -0.99753541 -0.15003845 -0.00062335 -0.00160899 -0.00033217
NHT14 -432.39500767 -28.14071849 -25.97722580 -2.18161458 -1.80205810 1.05756150 -0.01243635 -0.09198862 -0.47790805 -0.08655809 -0.00033234 -0.00091915 -0.00021293
NHT15 -89.85588524 -10.59555976 -9.69161261 -1.00657943 -0.94809656 0.57153883 -0.01132149 -0.06237605 -0.33205198 -0.05212618 -0.00011592 -0.00024645 -0.00001808
HL1   -0.19120627 -0.30821881 -0.26483415 -0.04163629 -0.03979738 0.03979738 -0.00043702 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
HL2   -432.21959456 -27.87249322 -25.71568124 -2.15423087 -1.74857388 1.02125286 -0.00937683 -0.08459429 -0.45529774 -0.08459429 -0.00017116 -0.00051558 -0.00017116
HL3   -0.47485429 -0.65738017 -0.56691799 -0.08949237 -0.13025076 0.09202108 -0.00091453 0.00000000 -0.04137515 0.00000000 0.00000000 -0.00003431 0.00000000
HL4   -431.95286969 -27.51673592 -25.37185042 -2.13691877 -1.66967393 0.97840219 -0.00854831 -0.08667092 -0.41161171 -0.06652895 -0.00015017 -0.00035019 -0.00008031
HL5   -66.86933513 -8.54161298 -7.72454102 -0.85786893 -0.77481062 0.47445015 -0.00786278 -0.04740612 -0.24746208 -0.02310124 -0.00002497 -0.00007786 -0.00001562
HL6   -67.12236191 -8.92726763 -8.11330337 -0.86926457 -0.85781425 0.51743005 -0.00911493 -0.04762938 -0.30948241 -0.04762938 -0.00003936 -0.00013948 -0.00003936
HL7   -33.35386659 -6.21632190 -5.55206751 -0.66271384 -0.70160288 0.44383613 -0.00585297 -0.03404298 -0.21524800 -0.01278876 -0.00011657 -0.00025898 -0.00004607
HL8   -33.61929958 -6.58610868 -5.89925883 -0.68570748 -0.78256526 0.48769571 -0.00702609 -0.02824120 -0.25868923 -0.02824120 -0.00010871 -0.00035503 -0.00010871
HL9   -48.55010149 -7.66113055 -6.92265289 -0.76850063 -0.81805363 0.50003655 -0.00789885 -0.03952314 -0.28965810 -0.03952314 -0.00007544 -0.00025557 -0.00007544
HL10  -48.30182865 -7.27676507 -6.54870433 -0.75333348 -0.73591323 0.45702008 -0.00704972 -0.04253049 -0.23949449 -0.01904795 -0.00006323 -0.00018020 -0.00003379
HL11  -66.74362919 -12.50017709 -11.22373956 -1.27676471 -1.43478530 0.88206586 -0.01387310 -0.05789854 -0.48328729 -0.05789854 -0.00031482 -0.00088721 -0.00031482
HL12  -66.48461755 -12.12667781 -10.87885001 -1.25169081 -1.35499701 0.83788944 -0.01377395 -0.06357973 -0.44189642 -0.04457666 -0.00032946 -0.00078425 -0.00023568
HL13  -89.38890704 -10.00641205 -9.06942612 -0.97343212 -0.81668281 0.49540208 -0.00768670 -0.04707123 -0.23597065 -0.02358331 -0.00000588 -0.00001796 -0.00000381
HL14  -89.65346892 -10.39496559 -9.47704744 -0.98202753 -0.90077501 0.53855692 -0.01000795 -0.05074317 -0.30892833 -0.05074317 -0.00001450 -0.00005304 -0.00001450
HL15  -66.61492200 -8.18893679 -7.37011649 -0.83765673 -0.68765628 0.43017794 -0.00576307 -0.04538343 -0.18310823 -0.00756734 -0.00001265 -0.00003124 -0.00000384
HL16  -318.81759371 -23.65614708 -21.73302731 -1.91809542 -1.65945504 0.98278306 -0.01177487 -0.06948347 -0.43381438 -0.06948347 -0.00029635 -0.00098308 -0.00029635
HL17  -318.57161023 -23.30114035 -21.40736804 -1.89088400 -1.58130980 0.93864934 -0.01033182 -0.07523656 -0.39681456 -0.05748508 -0.00036373 -0.00081661 -0.00013808
HL18  -372.99877428 -25.70106405 -23.67149374 -2.02973385 -1.70259389 1.00015817 -0.01047844 -0.07857326 -0.44911097 -0.07857326 -0.00025281 -0.00079358 -0.00025281
HL19  -372.74325734 -25.34776664 -23.33793758 -2.00823538 -1.62418832 0.95687692 -0.00939507 -0.08250313 -0.40804867 -0.06314147 -0.00025746 -0.00060470 -0.00012483
HL20  -48.05415078 -6.91959666 -6.20523422 -0.72990436 -0.64982889 0.41300538 -0.00581977 -0.04392827 -0.18511103 -0.00612296 -0.00004736 -0.00011201 -0.00000949
HL21  -165.25215307 -28.73537001 -25.87856605 -2.91608926 -3.11042950 1.88774086 -0.03506555 -0.14988625 -1.10702097 -0.14988625 -0.00117953 -0.00328301 -0.00117953
HT1   -432.39072251 -28.17446646 -25.98577194 -2.19850696 -1.80684125 1.06358670 -0.01247606 -0.09079037 -0.47035006 -0.07859854 -0.00021431 -0.00068568 -0.00019431
HT2   -67.33768863 -9.16180404 -8.31990089 -0.91614836 -0.91095196 0.55851133 -0.01498658 -0.05203835 -0.32392648 -0.04267549 -0.00006162 -0.00027619 -0.00006286
HT3   -33.81523748 -6.84793062 -6.13588969 -0.72503224 -0.83645344 0.52831750 -0.00976622 -0.03635984 -0.27421506 -0.02239345 -0.00016885 -0.00053606 -0.00010919
HT4   -100.48203608 -15.08257339 -13.64929122 -1.51389191 -1.56525915 0.95590045 -0.02090194 -0.08354666 -0.55063436 -0.07218073 -0.00022355 -0.00072983 -0.00022626
HT5   -0.66346275 -0.93713739 -0.82557146 -0.12074484 -0.18161601 0.12898852 -0.00269672 -0.00318235 -0.05277375 0.00000000 -0.00001311 -0.00012997 0.00000000
HT6   -115.42621706 -16.13900520 -14.66981717 -1.59578343 -1.60097547 0.96777489 -0.02286074 -0.09368855 -0.59444908 -0.09276742 -0.00017554 -0.00068803 -0.00026433
HT7   -465.57208120 -34.06440352 -31.28278902 -2.79594315 -2.45774763 1.46044726 -0.01947708 -0.12388753 -0.69266257 -0.10511270 -0.00043446 -0.00127775 -0.00038960
HT8   -133.61202130 -20.99357052 -18.97353484 -2.10454742 -2.21765597 1.35015207 -0.02956308 -0.11295261 -0.77707920 -0.10431881 -0.00045582 -0.00136417 -0.00050864
HT9   -89.86913724 -10.61937800 -9.66060242 -1.03806900 -0.95286719 0.58124062 -0.02095296 -0.05051447 -0.31150872 -0.04290158 -0.00002141 -0.00013808 -0.00002808
HT10  -100.22446732 -14.71938128 -13.28483397 -1.49790676 -1.48101253 0.91256005 -0.01882020 -0.08298389 -0.48611220 -0.04795408 -0.00019130 -0.00061288 -0.00016583
HT11  -319.01839623 -23.93308587 -21.98729680 -1.95224797 -1.71034771 1.02151579 -0.01465170 -0.07511904 -0.44740589 -0.06831078 -0.00039743 -0.00126801 -0.00031307
HT12  -67.07474980 -8.80120274 -7.96480731 -0.89540964 -0.82577798 0.51356781 -0.01151635 -0.05093671 -0.26310954 -0.02293699 -0.00004193 -0.00020171 -0.00002800
HT13  -373.19595821 -25.97946669 -23.92771964 -2.06419282 -1.75414087 1.03889248 -0.01318425 -0.08473334 -0.46360930 -0.07707015 -0.00033642 -0.00105223 -0.00028075
HT14  -498.84442137 -35.97531749 -33.09733319 -2.96322272 -2.44731557 1.44485958 -0.03930697 -0.13781076 -0.70047748 -0.12826637 -0.00025990 -0.00106551 -0.00065708
HT15  -81.65550027 -13.45374183 -12.10922558 -1.39161271 -1.44207990 0.89511191 -0.01792385 -0.08109268 -0.48018511 -0.04287105 -0.00028198 -0.00082867 -0.00020764
HT16  -114.78259404 -19.36683484 -17.43626119 -1.98078035 -2.09488457 1.28914675 -0.02519538 -0.11130907 -0.70692959 -0.07439777 -0.00053765 -0.00147237 -0.00047716
HT17  -115.03348086 -19.73373235 -17.79205953 -1.99923701 -2.17841969 1.33238912 -0.02632583 -0.10875375 -0.76076974 -0.09444121 -0.00056224 -0.00161608 -0.00057210
HT18  -81.90585648 -13.82082566 -12.46580928 -1.40954910 -1.52580227 0.93828037 -0.01874352 -0.07878655 -0.53404471 -0.06269684 -0.00030604 -0.00095426 -0.00028471
HT19  -165.21572312 -28.67935292 -25.87408827 -2.89281675 -3.11182165 1.88220405 -0.03370594 -0.16588723 -1.13343806 -0.16588723 -0.00175311 -0.00414014 -0.00175311
# 52 + 48 molecules for NCIE + BSSE
# 56 + 34 molecules for S22 + BSSE
# 12 +  6 molecules for ADIM6 + BSSE
NB1         -48.55539973 -7.65546679 -6.91777707 -0.76843095 -0.81774730 0.49993837 -0.00794173 -0.03958090 -0.29024710 -0.03958090 -0.00007602 -0.00025837 -0.00007602
NB2         -89.65632056 -10.39181533 -9.47448314 -0.98199354 -0.90063003 0.53849867 -0.01005271 -0.05081416 -0.30939897 -0.05081416 -0.00001458 -0.00005353 -0.00001458
NB3         -67.12713225 -8.92202642 -8.10893631 -0.86921297 -0.85755603 0.51733857 -0.00916677 -0.04773731 -0.31023532 -0.04773731 -0.00003969 -0.00014118 -0.00003969
NB4         -147.90217350 -21.07026289 -19.12158501 -2.07310811 -2.05680192 1.23151301 -0.03041113 -0.11968184 -0.76798562 -0.11968184 -0.00034912 -0.00096367 -0.00034912
NB5         -166.49160941 -22.31734352 -20.29211117 -2.17655364 -2.09505665 1.24897467 -0.03225392 -0.12760397 -0.79063320 -0.12760397 -0.00027852 -0.00076095 -0.00027852
NB6         -66.31267794 -11.73579948 -10.54679008 -1.21485782 -1.29285814 0.79427800 -0.01328561 -0.05648413 -0.45626131 -0.05648413 -0.00029482 -0.00088839 -0.00029482
NB7         -178.82179343 -19.90263499 -18.19462959 -1.89133717 -1.65947435 0.98425026 -0.02019075 -0.09870900 -0.63582603 -0.09870900 -0.00003693 -0.00018404 -0.00003693
NB8         -521.35757612 -37.51263447 -34.55019643 -3.05662172 -2.51479843 1.46790410 -0.02327418 -0.13477181 -0.75431006 -0.13477181 -0.00019967 -0.00062818 -0.00019967
NB9         -65.85978806 -10.97545314 -9.87389596 -1.15129668 -1.15144100 0.70664766 -0.01206230 -0.05995861 -0.43750971 -0.05995861 -0.00028258 -0.00082485 -0.00028258
NB10        -80.85462850 -12.03750805 -10.87499967 -1.24449258 -1.18607925 0.72154825 -0.01379390 -0.07071454 -0.47539766 -0.07071454 -0.00020552 -0.00059087 -0.00020552
NB11        -863.92801080 -55.03744514 -50.82998653 -4.22516021 -3.36557247 1.95127453 -0.02077606 -0.17019269 -0.89149088 -0.17019269 -0.00051767 -0.00151469 -0.00051767
NB12        -373.00187546 -25.69768429 -23.66872921 -2.02961923 -1.70240792 1.00008699 -0.01050683 -0.07861606 -0.44946367 -0.07861606 -0.00025415 -0.00079875 -0.00025415
NB13        -432.22125194 -27.87074420 -25.71418844 -2.15419821 -1.74847509 1.02121840 -0.00939533 -0.08460192 -0.45543727 -0.08460192 -0.00017162 -0.00051739 -0.00017162
NB14        -465.34681780 -33.77702205 -31.02993159 -2.75070350 -2.40023581 1.41676515 -0.01721467 -0.11401896 -0.68288719 -0.11401896 -0.00040112 -0.00112219 -0.00040112
NB15        -406.12493293 -31.60956642 -28.99176586 -2.62330034 -2.35482306 1.39526009 -0.01788496 -0.10906379 -0.67762007 -0.10906379 -0.00051703 -0.00146617 -0.00051703
NB16        -116.45861734 -12.06115022 -11.00696822 -1.10336478 -0.94568153 0.56258287 -0.00926285 -0.04864921 -0.28681273 -0.04864921 -0.00000294 -0.00001063 -0.00000294
NB17        -197.49267955 -33.24384580 -29.98287345 -3.34964109 -3.49190624 2.10214219 -0.03676814 -0.18917323 -1.25797058 -0.18917323 -0.00194160 -0.00437415 -0.00194160
NB18        -33.62226517 -6.58305426 -5.89654450 -0.68563951 -0.78237954 0.48763769 -0.00704349 -0.02824092 -0.25885345 -0.02824092 -0.00010909 -0.00035670 -0.00010909
NB19        -1.84240057 -1.01649219 -0.87763045 -0.14148003 -0.14969531 0.10595107 -0.00138221 0.00000000 -0.03749550 0.00000000 0.00000000 -0.00000493 0.00000000
NB20        -496.63170260 -30.16304169 -27.85921339 -2.28914074 -1.79632398 1.04518669 -0.00802700 -0.08769684 -0.45141355 -0.08769684 -0.00009680 -0.00027839 -0.00009680
NB21        -97.10999840 -15.31388733 -13.84367744 -1.53013985 -1.63679606 0.99806491 -0.01637336 -0.08028329 -0.58270963 -0.08028329 -0.00021497 -0.00064806 -0.00021497
NB22        -179.31191988 -20.78985037 -18.96013439 -1.95677971 -1.80264464 1.07469424 -0.02067410 -0.10239990 -0.61983609 -0.10239990 -0.00004493 -0.00014116 -0.00004493
NB23        -134.25268338 -17.85113723 -16.23085936 -1.73017473 -1.71676835 1.03230205 -0.01896382 -0.09662254 -0.62216304 -0.09662254 -0.00011912 -0.00036494 -0.00011912
NB24        -115.68134967 -16.58488166 -15.04228433 -1.62808113 -1.67741200 1.01473442 -0.01798686 -0.08892951 -0.60336972 -0.08892951 -0.00016837 -0.00051025 -0.00016837
NB25        -295.79539546 -42.16389122 -38.28142516 -4.12594306 -4.11840493 2.45773360 -0.06210581 -0.24267444 -1.54131596 -0.24267444 -0.00096832 -0.00248505 -0.00096832
NB26        -332.96440419 -44.67056650 -40.63741856 -4.32845259 -4.19606992 2.49171626 -0.06641781 -0.25857152 -1.58381030 -0.25857152 -0.00078519 -0.00199320 -0.00078519
NB27        -245.13384275 -31.63369304 -28.74789901 -3.10132592 -2.95332946 1.77693938 -0.04065750 -0.15763517 -1.09736579 -0.15763517 -0.00040749 -0.00127798 -0.00040749
NB28        -227.38156245 -27.54566080 -25.11779609 -2.65369706 -2.47828582 1.48208237 -0.04120136 -0.14171362 -0.93731437 -0.14171362 -0.00015875 -0.00060882 -0.00015875
NB29        -587.21458544 -48.48656588 -44.44045306 -4.19493015 -3.66890411 2.17115687 -0.03952361 -0.19892353 -1.19962974 -0.19892353 -0.00070127 -0.00198119 -0.00070127
NB30        -602.20973389 -49.55280592 -45.44078841 -4.28979178 -3.70315470 2.18620016 -0.04069065 -0.20883402 -1.23711975 -0.20883402 -0.00052361 -0.00148560 -0.00052361
NB31        -912.48904926 -62.68427756 -57.75850537 -4.98173757 -4.18534426 2.44787246 -0.03514151 -0.21397343 -1.19288928 -0.21397343 -0.00077715 -0.00228180 -0.00077715
NB32        -588.48596740 -46.43409064 -42.67353334 -3.91377835 -3.37455344 1.98169606 -0.03750042 -0.18573167 -1.07189014 -0.18573167 -0.00033516 -0.00100669 -0.00033516
NB33        -569.91223798 -45.16691969 -41.50170895 -3.80546835 -3.33706494 1.96285226 -0.03819456 -0.18213464 -1.06602024 -0.18213464 -0.00045023 -0.00143091 -0.00045023
NB34        -746.00224894 -51.39610079 -47.34324179 -4.05357657 -3.40592871 1.99888300 -0.02161627 -0.15857395 -0.90160671 -0.15857395 -0.00064179 -0.00187124 -0.00064179
NB35        -864.44052533 -55.74314325 -51.43542740 -4.30219910 -3.49814967 2.04083363 -0.01943163 -0.17054692 -0.91351692 -0.17054692 -0.00043972 -0.00123474 -0.00043972
NB36        -805.22185477 -53.56989644 -49.39307176 -4.17554917 -3.45259865 2.01933724 -0.02102451 -0.16524130 -0.90871063 -0.16524130 -0.00055378 -0.00159178 -0.00055378
NB37        -897.56562537 -61.64994077 -56.75503403 -4.89481037 -4.15055341 2.43531048 -0.02768906 -0.20097795 -1.14286645 -0.20097795 -0.00075552 -0.00201829 -0.00075552
NB38        -486.97807728 -43.65054717 -39.87604660 -3.85984417 -3.54248092 2.11483564 -0.03232647 -0.18137509 -1.15550532 -0.18137509 -0.00088145 -0.00238213 -0.00088145
NB39        -838.34406438 -59.48234298 -54.72052129 -4.76531639 -4.10567073 2.41350180 -0.02883371 -0.19686257 -1.13911855 -0.19686257 -0.00091087 -0.00245896 -0.00091087
NB40        -313.94955804 -45.30624725 -40.99280394 -4.44947830 -4.43815972 2.66358602 -0.04611774 -0.23826774 -1.54606520 -0.23826774 -0.00199965 -0.00450561 -0.00199965
NB41        -150.08046507 -18.64467587 -16.90449014 -1.78773722 -1.72827039 1.04984131 -0.01628953 -0.07700918 -0.54606354 -0.07700918 -0.00012341 -0.00039040 -0.00012341
NB42        -498.47371812 -31.17983304 -28.73742185 -2.42992576 -1.94613854 1.15097641 -0.00937674 -0.08774739 -0.48902707 -0.08774739 -0.00010294 -0.00029582 -0.00010294
NB43        -118.30080733 -13.07783977 -11.88497685 -1.24432735 -1.09545631 0.66837090 -0.01060336 -0.04867097 -0.32436976 -0.04867097 -0.00000446 -0.00001873 -0.00000446
NB44        -232.91699729 -24.12257106 -22.01452174 -2.20592361 -1.89148288 1.12485210 -0.01848379 -0.09735235 -0.57382549 -0.09735235 -0.00000843 -0.00002662 -0.00000843
NB45        -613.08982943 -42.22461735 -38.86712806 -3.39138403 -2.74219447 1.60741503 -0.01726732 -0.13644202 -0.73852954 -0.13644202 -0.00010870 -0.00030725 -0.00010870
NB46        -67.24201859 -13.16767787 -11.79637817 -1.36765507 -1.56540902 0.97438881 -0.01412887 -0.05701526 -0.51896275 -0.05701526 -0.00029872 -0.00087523 -0.00029872
NB47        -131.71805145 -21.95272223 -19.75195477 -2.29827059 -2.30368532 1.41226592 -0.02432991 -0.12066190 -0.87627934 -0.12066190 -0.00068085 -0.00188855 -0.00068085
NB48        -132.62025446 -23.47515592 -21.10128364 -2.42202599 -2.58711185 1.58658135 -0.02676709 -0.11442664 -0.91555977 -0.11442664 -0.00079068 -0.00218482 -0.00079068
NB49        -394.92996885 -66.54009440 -60.01904348 -6.68984022 -6.98847135 4.20316977 -0.07353005 -0.38146301 -2.52087047 -0.38146301 -0.00481081 -0.01060920 -0.00481081
NB50        -394.92946548 -66.54449984 -60.02242160 -6.68925022 -6.98857864 4.20266928 -0.07344244 -0.38057611 -2.51756085 -0.38057611 -0.00446729 -0.00993209 -0.00446729
NB51        -394.92893121 -66.54169358 -60.02184482 -6.68705466 -6.98888004 4.20236882 -0.07365449 -0.38214249 -2.52204461 -0.38214249 -0.00485345 -0.01070148 -0.00485345
NB52        -197.46851447 -33.26907193 -30.00568378 -3.34926720 -3.49338074 2.10240733 -0.03656052 -0.18892470 -1.25571373 -0.18892470 -0.00192345 -0.00433247 -0.00192345
  S22_1     -97.10232131 -15.32169663 -13.85056571 -1.52959162 -1.63725957 0.99794138 -0.01632774 -0.08026556 -0.58219723 -0.08026556 -0.00022106 -0.00065711 -0.00022106
S22_01a     -48.55155753 -7.65951213 -6.92126712 -0.76851690 -0.81797109 0.50001870 -0.00791663 -0.03954575 -0.28990334 -0.03954575 -0.00007563 -0.00025671 -0.00007563
  S22_2     -134.24470126 -17.85954833 -16.23837924 -1.72987440 -1.71726460 1.03234768 -0.01894274 -0.09654128 -0.62128305 -0.09654128 -0.00011950 -0.00036458 -0.00011950
S22_02a     -67.12260965 -8.92702665 -8.11309364 -0.86925158 -0.85780002 0.51742247 -0.00911586 -0.04762646 -0.30947076 -0.04762646 -0.00003936 -0.00013942 -0.00003936
  S22_3     -332.96392473 -44.66966507 -40.63875487 -4.32710504 -4.19632594 2.49138550 -0.06664512 -0.25908581 -1.58524069 -0.25908581 -0.00079247 -0.00201055 -0.00079247
S22_03a     -166.50081471 -22.30482867 -20.28235825 -2.17577674 -2.09449524 1.24860716 -0.03246789 -0.12806931 -0.79277731 -0.12806931 -0.00028197 -0.00077311 -0.00028197
  S22_4     -295.79367248 -42.16497702 -38.28326213 -4.12535528 -4.11861784 2.45760419 -0.06218588 -0.24290055 -1.54191243 -0.24290055 -0.00097305 -0.00249625 -0.00097305
S22_04a     -147.91001714 -21.06025028 -19.11363284 -2.07286950 -2.05636849 1.23131108 -0.03068294 -0.12014969 -0.77019257 -0.12014969 -0.00035259 -0.00097469 -0.00035259
  S22_5     -721.28637762 -103.82011821 -94.27340686 -10.11175958 -10.04212601 5.94673494 -0.15152202 -0.62169077 -3.78626876 -0.62169077 -0.00404369 -0.00972249 -0.00404369
S22_05a     -360.65436943 -51.88647034 -47.10719873 -5.06687882 -5.01804814 2.97618920 -0.07537591 -0.30887423 -1.89286830 -0.30887423 -0.00173444 -0.00429808 -0.00173444
  S22_6     -539.52593571 -83.89193455 -75.95392100 -8.28931301 -8.47651433 5.05442428 -0.10876616 -0.49912051 -3.14543374 -0.49912051 -0.00468040 -0.01075044 -0.00468040
S22_06a     -279.06817922 -42.54903771 -38.53799264 -4.20811239 -4.25462482 2.53895633 -0.05676152 -0.25070582 -1.58533386 -0.25070582 -0.00188318 -0.00450251 -0.00188318
S22_06b     -260.48195299 -41.30340270 -37.36054481 -4.10342346 -4.21583661 2.52084817 -0.05033333 -0.24328385 -1.55221584 -0.24328385 -0.00211236 -0.00486023 -0.00211236
  S22_7     -797.52393585 -118.66855578 -107.66089272 -11.59420546 -11.68449914 6.92454924 -0.16239481 -0.72259537 -4.40344592 -0.72259537 -0.00605234 -0.01392061 -0.00605234
S22_07a     -403.76827972 -60.82594912 -55.16558703 -5.96529624 -6.00712373 3.56105730 -0.07830121 -0.37638969 -2.27354863 -0.37638969 -0.00312816 -0.00710605 -0.00312816
S22_07b     -393.78275595 -57.80098906 -52.43837430 -5.65189493 -5.67107322 3.36912438 -0.08243628 -0.34128942 -2.12215557 -0.34128942 -0.00215828 -0.00527064 -0.00215828
  S22_8     -67.24109663 -13.16893048 -11.79711059 -1.36830713 -1.56538757 0.97460202 -0.01409954 -0.05693226 -0.51867218 -0.05693226 -0.00029316 -0.00086347 -0.00029316
S22_08a     -33.62111625 -6.58424025 -5.89759827 -0.68566587 -0.78245166 0.48766022 -0.00703672 -0.02824101 -0.25878950 -0.02824101 -0.00010894 -0.00035605 -0.00010894
  S22_9     -132.61211324 -23.48377647 -21.10886304 -2.42216579 -2.58760649 1.58672878 -0.02670048 -0.11434664 -0.91473907 -0.11434664 -0.00078708 -0.00217403 -0.00078708
S22_09a     -66.30997363 -11.73866036 -10.54931765 -1.21488745 -1.29302545 0.79432334 -0.01326440 -0.05646026 -0.45599143 -0.05646026 -0.00029405 -0.00088568 -0.00029405
 S22_10     -231.09050227 -39.85047592 -35.90485308 -4.02801425 -4.27682183 2.58833375 -0.04389625 -0.21898186 -1.51917592 -0.21898186 -0.00231955 -0.00528329 -0.00231955
S22_10a     -197.47945337 -33.25768969 -29.99532820 -3.34951977 -3.49271580 2.10230444 -0.03665568 -0.18904112 -1.25676363 -0.18904112 -0.00193217 -0.00435228 -0.00193217
S22_10b     -33.61655895 -6.58891165 -5.90175104 -0.68577002 -0.78273559 0.48774895 -0.00701024 -0.02824158 -0.25853992 -0.02824158 -0.00010836 -0.00035350 -0.00010836
 S22_11     -394.94367000 -66.52275355 -60.00817508 -6.68291215 -6.98854193 4.20099306 -0.07401841 -0.38382569 -2.52764167 -0.38382569 -0.00500582 -0.01101598 -0.00500582
S22_11a     -197.47825041 -33.25892445 -29.99635720 -3.34962657 -3.49278819 2.10234231 -0.03664832 -0.18903681 -1.25670853 -0.18903681 -0.00193213 -0.00435185 -0.00193213
 S22_12     -454.72850301 -70.70874948 -63.99095127 -7.03839718 -7.12410678 4.25458837 -0.08308036 -0.42749110 -2.67592259 -0.42749110 -0.00448118 -0.00989087 -0.00448118
S22_12a     -227.37342652 -35.34810520 -31.98389437 -3.52814800 -3.56025893 2.12940365 -0.04115661 -0.21075149 -1.33087308 -0.21075149 -0.00169385 -0.00384305 -0.00169385
 S22_13     -721.27643343 -103.80899657 -94.25970994 -10.10993123 -10.04152677 5.94642351 -0.15117226 -0.62488706 -3.79883795 -0.62488706 -0.00489205 -0.01144465 -0.00489205
S22_13a     -360.64786992 -51.89432516 -47.11358999 -5.06740947 -5.01840363 2.97642716 -0.07527683 -0.30864164 -1.89181024 -0.30864164 -0.00173349 -0.00429690 -0.00173349     
 S22_14     -508.32898020 -83.91921028 -75.80010520 -8.36293664 -8.71154200 5.21253812 -0.09593572 -0.49917794 -3.19016678 -0.49917794 -0.00694659 -0.01521042 -0.00694659
S22_14a     -310.86739914 -50.65416857 -45.78241928 -5.03637205 -5.21465395 3.11564153 -0.05823192 -0.30141042 -1.91250662 -0.30141042 -0.00328983 -0.00738378 -0.00328983     
S22_14b     -197.47827439 -33.25893447 -29.99657264 -3.34933324 -3.49278821 2.10228405 -0.03664179 -0.18901847 -1.25657898 -0.18901847 -0.00193015 -0.00434808 -0.00193015     
 S22_15     -797.50974959 -118.66536864 -107.65798353 -11.58404255 -11.68535743 6.92177321 -0.16210262 -0.72916837 -4.41969602 -0.72916837 -0.00747956 -0.01675957 -0.00747956
S22_15a     -403.76773454 -60.82602894 -55.16468743 -5.96640609 -6.00709758 3.56128273 -0.07834079 -0.37654578 -2.27425906 -0.37654578 -0.00314473 -0.00713989 -0.00314473     
S22_15b     -393.77106369 -57.81471342 -52.44963661 -5.65271222 -5.67174183 3.36952414 -0.08230091 -0.34096544 -2.12048270 -0.34096544 -0.00214933 -0.00524688 -0.00214933     
 S22_16     -132.16336403 -22.72134149 -20.43227184 -2.36205146 -2.44560341 1.50006553 -0.02546816 -0.11714241 -0.89417192 -0.11714241 -0.00068679 -0.00193282 -0.00068679
S22_16a     -66.30911059 -11.73954514 -10.55008827 -1.21491566 -1.29307811 0.79434014 -0.01325847 -0.05646152 -0.45596105 -0.05646152 -0.00029386 -0.00088514 -0.00029386      
S22_16b     -65.85889483 -10.97638333 -9.87470374 -1.15134194 -1.15149530 0.70666906 -0.01205716 -0.05995839 -0.43746663 -0.05995839 -0.00028239 -0.00082445 -0.00028239       
 S22_17     -264.60093805 -42.18707366 -38.11581555 -4.21047873 -4.35197808 2.61764090 -0.04620136 -0.23843978 -1.57034616 -0.23843978 -0.00217949 -0.00493123 -0.00217949
S22_17a     -197.48154173 -33.25549764 -29.99328675 -3.34963694 -3.49258783 2.10229826 -0.03667560 -0.18906807 -1.25699726 -0.18906807 -0.00193432 -0.00435699 -0.00193432     
S22_17b     -67.12416903 -8.92513425 -8.11156172 -0.86927423 -0.85771738 0.51740315 -0.00914065 -0.04770076 -0.30994244 -0.04770076 -0.00003957 -0.00014059 -0.00003957        
 S22_18     -246.02578628 -40.92215670 -36.92548950 -4.11051504 -4.31217847 2.60054013 -0.04482873 -0.23029435 -1.55056343 -0.23029435 -0.00226413 -0.00514422 -0.00226413
S22_18a     -197.47984064 -33.25728155 -29.99493759 -3.34955650 -3.49269201 2.10230627 -0.03665971 -0.18904706 -1.25681365 -0.18904706 -0.00193267 -0.00435335 -0.00193267     
S22_18b     -48.55146746 -7.65936671 -6.92117615 -0.76858853 -0.81797528 0.50003760 -0.00792961 -0.03956397 -0.29009957 -0.03956397 -0.00007567 -0.00025750 -0.00007567        
 S22_19     -278.33731313 -45.29334136 -40.87487973 -4.58380629 -4.68037044 2.82123126 -0.05103108 -0.26247154 -1.73868212 -0.26247154 -0.00244024 -0.00558160 -0.00244024
S22_19a     -197.48204423 -33.25496694 -29.99278318 -3.34967882 -3.49255687 2.10229946 -0.03668074 -0.18907547 -1.25705995 -0.18907547 -0.00193494 -0.00435831 -0.00193494     
S22_19b     -80.86384684 -12.02641519 -10.86576700 -1.24470232 -1.18555886 0.72144725 -0.01394786 -0.07140027 -0.47878086 -0.07140027 -0.00021015 -0.00060608 -0.00021015      
 S22_20     -394.95136561 -66.52082448 -60.00179572 -6.68857395 -6.98740387 4.20213583 -0.07369723 -0.38117857 -2.52064231 -0.38117857 -0.00452204 -0.01004826 -0.00452204
S22_20a     -197.48059563 -33.25649129 -29.99421142 -3.34958474 -3.49264585 2.10230125 -0.03666659 -0.18905589 -1.25689167 -0.18905589 -0.00193335 -0.00435487 -0.00193335     
S22_20b     -197.48254885 -33.25441653 -29.99220635 -3.34980096 -3.49252488 2.10231637 -0.03668788 -0.18908819 -1.25716033 -0.18908819 -0.00193611 -0.00436069 -0.00193611     
 S22_21     -508.34094171 -83.91724704 -75.79182443 -8.37110447 -8.71001229 5.21432826 -0.09548499 -0.49496354 -3.17955064 -0.49496354 -0.00612807 -0.01357802 -0.00612807
S22_21a     -310.87103891 -50.65027082 -45.77900408 -5.03635390 -5.21444027 3.11558418 -0.05825547 -0.30147192 -1.91289981 -0.30147192 -0.00329279 -0.00739012 -0.00329279     
S22_21b     -197.48106589 -33.25599869 -29.99375820 -3.34960320 -3.49261707 2.10229829 -0.03667089 -0.18906146 -1.25694071 -0.18906146 -0.00193378 -0.00435582 -0.00193378     
 S22_22     -528.21893111 -83.01329576 -75.08581713 -8.22477375 -8.44327436 5.04627818 -0.09852861 -0.48290722 -3.08215086 -0.48290722 -0.00493208 -0.01099919 -0.00493208
S22_22a     -264.11734863 -41.49723656 -37.52891351 -4.12068848 -4.21989500 2.52530405 -0.04904878 -0.23952234 -1.53735345 -0.23952234 -0.00212026 -0.00480312 -0.00212026     
S22_22b     -264.11734863 -41.49723656 -37.52891351 -4.12068848 -4.21989500 2.52530405 -0.04904879 -0.23952234 -1.53735345 -0.23952234 -0.00212026 -0.00480312 -0.00212026     
    AM2     -66.75008927 -12.49348615 -11.21782083 -1.27660052 -1.43438207 0.88193652 -0.01391678 -0.05790837 -0.48368113 -0.05790837 -0.00031646 -0.00089269 -0.00031646
    AD2     -133.49625729 -24.98942541 -22.44147319 -2.54670626 -2.86987511 1.76220875 -0.02796525 -0.11708548 -0.97009631 -0.11708548 -0.00083229 -0.00218508 -0.00083229
    AM3     -99.88086853 -18.40239692 -16.53994219 -1.86452630 -2.08645313 1.27528397 -0.02091891 -0.08866951 -0.71027424 -0.08866951 -0.00059836 -0.00157502 -0.00059836
    AD3     -199.75561943 -36.80849251 -33.08863404 -3.71983644 -4.17452937 2.54821107 -0.04212752 -0.17943963 -1.42514835 -0.17943963 -0.00155017 -0.00385792 -0.00155017
    AM4     -133.01087346 -24.31200795 -21.86269258 -2.45238974 -2.73861413 1.66866313 -0.02791383 -0.11951963 -0.93709911 -0.11951963 -0.00090336 -0.00230353 -0.00090336
    AD4     -266.01267585 -48.62959715 -43.73816151 -4.89180398 -5.47957507 3.33401119 -0.05628005 -0.24215166 -1.88108542 -0.24215166 -0.00235554 -0.00570584 -0.00235554
    AM5     -166.14068511 -30.22173100 -27.18552120 -3.04031292 -3.39078676 2.06206390 -0.03490622 -0.15037702 -1.16399462 -0.15037702 -0.00122109 -0.00305748 -0.00122109
    AD5     -332.26944957 -60.45088630 -54.38764527 -6.06397607 -6.78458562 4.11984576 -0.07041108 -0.30486203 -2.33708785 -0.30486203 -0.00319029 -0.00761208 -0.00319029
    AM6     -199.27054751 -36.13140329 -32.50830880 -3.62822150 -4.04295688 2.45545886 -0.04189789 -0.18124530 -1.39090805 -0.18124530 -0.00154402 -0.00382181 -0.00154402
    AD6     -398.52611211 -72.27203561 -65.03727576 -7.23602960 -8.08963742 4.90566681 -0.08459087 -0.36771251 -2.79344620 -0.36771251 -0.00405423 -0.00957715 -0.00405423
    AM7     -232.40038610 -42.04110124 -37.83111461 -4.21612790 -4.69512568 2.84885249 -0.04888917 -0.21211542 -1.61783047 -0.21211542 -0.00186925 -0.00459073 -0.00186925
    AD7     -464.78222910 -84.09370728 -75.68739422 -8.40760349 -9.39467714 5.69129480 -0.09869079 -0.43061387 -3.24977570 -0.43061387 -0.00491531 -0.01153533 -0.00491531
 1-1_NCIE   -48.55649928 -7.65446297 -6.91696382 -0.76836764 -0.81770165 0.49989398 -0.00796193 -0.03967407 -0.29079227 -0.03967407 -0.00007905 -0.00026721 -0.00007905
 2-1_NCIE   -89.65801931 -10.39040643 -9.47333370 -0.98193992 -0.90056092 0.53847497 -0.01014794 -0.05097516 -0.31034932 -0.05097516 -0.00001629 -0.00005887 -0.00001629
 3-1_NCIE   -67.12964853 -8.91944805 -8.10680846 -0.86915031 -0.85741507 0.51727847 -0.00924956 -0.04783033 -0.31080326 -0.04783033 -0.00004090 -0.00014490 -0.00004090
 4-1_NCIE   -48.55671816 -7.65431215 -6.91687268 -0.76832807 -0.81769250 0.49987455 -0.00797396 -0.03970796 -0.29103837 -0.03970796 -0.00007929 -0.00026831 -0.00007929
 4-2_NCIE   -67.13189820 -8.91694710 -8.10470799 -0.86910973 -0.85728781 0.51723011 -0.00927851 -0.04787473 -0.31114483 -0.04787473 -0.00004113 -0.00014582 -0.00004113
 5-1_NCIE   -147.90970234 -21.06105229 -19.11430933 -2.07274374 -2.05641742 1.23131327 -0.03070324 -0.12027918 -0.77109849 -0.12027918 -0.00035967 -0.00099174 -0.00035967
 6-1_NCIE   -166.49848952 -22.30847819 -20.28529484 -2.17567394 -2.09467780 1.24866631 -0.03244255 -0.12811618 -0.79335132 -0.12811618 -0.00028779 -0.00078685 -0.00028779
 7-1_NCIE   -66.31294139 -11.73553283 -10.54658257 -1.21484478 -1.29284785 0.79427170 -0.01329629 -0.05653291 -0.45655179 -0.05653291 -0.00029825 -0.00089741 -0.00029825
 7-2_NCIE   -178.82502253 -19.89903574 -18.19172372 -1.89168522 -1.65930970 0.98429590 -0.02032393 -0.09890951 -0.63803823 -0.09890951 -0.00003860 -0.00019041 -0.00003860
 8-1_NCIE   -48.55633238 -7.65463328 -6.91715689 -0.76836161 -0.81769518 0.49988415 -0.00797821 -0.03967447 -0.29069262 -0.03967447 -0.00007889 -0.00026718 -0.00007889
 8-2_NCIE   -178.82760639 -19.89543280 -18.18889225 -1.89206642 -1.65914617 0.98431294 -0.02036273 -0.09899051 -0.63965351 -0.09899051 -0.00003817 -0.00019198 -0.00003817
 9-1_NCIE   -65.86252161 -10.97244642 -9.87135382 -1.15126739 -1.15129010 0.70660833 -0.01210882 -0.06015744 -0.43877029 -0.06015744 -0.00029269 -0.00085474 -0.00029269
 9-2_NCIE   -521.36449105 -37.50473088 -34.54351852 -3.05732738 -2.51439906 1.46794479 -0.02346400 -0.13501045 -0.75713012 -0.13501045 -0.00020229 -0.00064131 -0.00020229
10-1_NCIE   -80.85285700 -12.03976322 -10.87689795 -1.24442125 -1.18619662 0.72158085 -0.01378857 -0.07062606 -0.47518274 -0.07062606 -0.00020510 -0.00058903 -0.00020510
10-2_NCIE   -521.36430136 -37.50498622 -34.54372685 -3.05731567 -2.51441316 1.46794628 -0.02345423 -0.13499843 -0.75697849 -0.13499843 -0.00020198 -0.00064030 -0.00020198
11-1_NCIE   -48.55684574 -7.65429322 -6.91682985 -0.76827407 -0.81768862 0.49985985 -0.00796533 -0.03970346 -0.29093573 -0.03970346 -0.00007999 -0.00026960 -0.00007999
11-2_NCIE   -863.93698113 -55.02761750 -50.82107259 -4.22623229 -3.36494714 1.95131862 -0.02086299 -0.17016899 -0.89365351 -0.17016899 -0.00052161 -0.00154507 -0.00052161
12-1_NCIE   -67.12930756 -8.92025630 -8.10752070 -0.86909441 -0.85745649 0.51728132 -0.00927136 -0.04792863 -0.31120709 -0.04792863 -0.00004361 -0.00015181 -0.00004361
12-2_NCIE   -521.36448714 -37.50467567 -34.54346485 -3.05735036 -2.51439643 1.46794563 -0.02344703 -0.13499139 -0.75699096 -0.13499139 -0.00020194 -0.00064040 -0.00020194
13-1_NCIE   -48.55661213 -7.65460505 -6.91711453 -0.76814224 -0.81769482 0.49982967 -0.00795039 -0.03972952 -0.29107422 -0.03972952 -0.00008109 -0.00027162 -0.00008109
13-2_NCIE   -521.38239374 -37.48223742 -34.52463150 -3.05957727 -2.51324056 1.46807738 -0.02385424 -0.13548802 -0.76402850 -0.13548802 -0.00020698 -0.00067355 -0.00020698
14-1_NCIE   -373.00263723 -25.69693038 -23.66808262 -2.02959742 -1.70236693 1.00007080 -0.01052173 -0.07865000 -0.44977720 -0.07865000 -0.00025565 -0.00080312 -0.00025565
15-1_NCIE   -432.22199007 -27.87000811 -25.71358145 -2.15416294 -1.74843909 1.02120508 -0.00941097 -0.08464583 -0.45587460 -0.08464583 -0.00017294 -0.00052133 -0.00017294
16-1_NCIE   -373.00296817 -25.69658436 -23.66781834 -2.02957598 -1.70234892 1.00006237 -0.01052753 -0.07866804 -0.44998150 -0.07866804 -0.00025584 -0.00080387 -0.00025584
16-2_NCIE   -432.22497644 -27.86683843 -25.71093298 -2.15412203 -1.74826225 1.02113996 -0.00946386 -0.08466345 -0.45608858 -0.08466345 -0.00017402 -0.00052545 -0.00017402
17-1_NCIE   -465.34876431 -33.77508389 -31.02808555 -2.75090076 -2.40010868 1.41677526 -0.01726165 -0.11406169 -0.68356591 -0.11406169 -0.00040392 -0.00113132 -0.00040392
17-2_NCIE   -432.22424877 -27.86763305 -25.71161734 -2.15411309 -1.74830729 1.02115364 -0.00945397 -0.08467461 -0.45614112 -0.08467461 -0.00017472 -0.00052692 -0.00017472
18-1_NCIE   -406.12603186 -31.60850629 -28.99079325 -2.62333588 -2.35475773 1.39525057 -0.01790940 -0.10911950 -0.67815292 -0.10911950 -0.00051952 -0.00147314 -0.00051952
18-2_NCIE   -80.85807490 -12.03381057 -10.87185422 -1.24435961 -1.18588529 0.72148145 -0.01386525 -0.07081775 -0.47612951 -0.07081775 -0.00020849 -0.00059885 -0.00020849
19-1_NCIE   -406.12585649 -31.60868483 -28.99096583 -2.62332278 -2.35477094 1.39525160 -0.01790921 -0.10913198 -0.67829094 -0.10913198 -0.00051948 -0.00147331 -0.00051948
19-2_NCIE   -432.22727207 -27.86430404 -25.70878584 -2.15407323 -1.74812035 1.02109176 -0.00949707 -0.08470320 -0.45653002 -0.08470320 -0.00017586 -0.00053125 -0.00017586
20-1_NCIE   -116.45896742 -12.06120563 -11.00697370 -1.10333758 -0.94567763 0.56259685 -0.00935449 -0.04871291 -0.28717729 -0.04871291 -0.00000335 -0.00001195 -0.00000335
20-2_NCIE   -197.49313107 -33.24345250 -29.98253241 -3.34961132 -3.49188810 2.10213390 -0.03678495 -0.18922942 -1.25825871 -0.18922942 -0.00194830 -0.00439829 -0.00194830
21-1_NCIE   -116.45887257 -12.06117389 -11.00695015 -1.10334307 -0.94568276 0.56259128 -0.00931724 -0.04868566 -0.28704052 -0.04868566 -0.00000307 -0.00001108 -0.00000307
21-2_NCIE   -33.62227250 -6.58305013 -5.89653521 -0.68563836 -0.78237799 0.48763638 -0.00704496 -0.02824455 -0.25887538 -0.02824455 -0.00010945 -0.00035755 -0.00010945
22-1_NCIE   -1.84239949 -1.01650054 -0.87763635 -0.14148004 -0.14969605 0.10595306 -0.00138329 0.00000000 -0.03749757 0.00000000 0.00000000 -0.00000501 0.00000000
22-2_NCIE   -496.63171938 -30.16303515 -27.85922277 -2.28913807 -1.79632575 1.04518819 -0.00802878 -0.08769974 -0.45144340 -0.08769974 -0.00009691 -0.00027877 -0.00009691
23-1_NCIE   -1.84240010 -1.01649730 -0.87763394 -0.14148007 -0.14969580 0.10595229 -0.00138279 0.00000000 -0.03749709 0.00000000 0.00000000 -0.00000500 0.00000000
23-2_NCIE   -116.45866311 -12.06115538 -11.00696634 -1.10336228 -0.94568026 0.56258509 -0.00927780 -0.04865563 -0.28685258 -0.04865563 -0.00000296 -0.00001071 -0.00000296
24-1_NCIE   -116.45869985 -12.06116191 -11.00696550 -1.10335943 -0.94568011 0.56258652 -0.00928426 -0.04866364 -0.28689510 -0.04866364 -0.00000303 -0.00001093 -0.00000303
25-1_NCIE   -116.45873645 -12.06117692 -11.00697591 -1.10335431 -0.94568091 0.56258821 -0.00929675 -0.04866633 -0.28691987 -0.04866633 -0.00000301 -0.00001087 -0.00000301
25-2_NCIE   -496.63172097 -30.16303516 -27.85922072 -2.28913747 -1.79632553 1.04518823 -0.00802910 -0.08770440 -0.45148303 -0.08770440 -0.00009700 -0.00027901 -0.00009700
26-1_NCIE   -33.62240751 -6.58292232 -5.89641829 -0.68563332 -0.78237075 0.48763405 -0.00704878 -0.02825763 -0.25895762 -0.02825763 -0.00011069 -0.00036040 -0.00011069
27-1_NCIE   -65.86048881 -10.97469384 -9.87325885 -1.15128566 -1.15140206 0.70663488 -0.01208016 -0.06001523 -0.43783898 -0.06001523 -0.00028675 -0.00083710 -0.00028675
28-1_NCIE   -66.31328449 -11.73520500 -10.54624385 -1.21485697 -1.29282799 0.79427159 -0.01330267 -0.05655598 -0.45665566 -0.05655598 -0.00030200 -0.00090614 -0.00030200
29-1_NCIE   -197.46906610 -33.26874073 -30.00544302 -3.34919320 -3.49339873 2.10240883 -0.03660737 -0.18906142 -1.25650318 -0.18906142 -0.00193260 -0.00435881 -0.00193260
30-1_NCIE   -197.46903007 -33.26899418 -30.00557264 -3.34919444 -3.49340399 2.10241850 -0.03661571 -0.18910522 -1.25673829 -0.18910522 -0.00193729 -0.00437920 -0.00193729
31-1_NCIE   -197.46906971 -33.26886553 -30.00550284 -3.34916400 -3.49339776 2.10240462 -0.03661640 -0.18910488 -1.25672879 -0.18910488 -0.00193630 -0.00437283 -0.00193630
01a_S22     -48.55300991 -7.65806654 -6.92003542 -0.76846640 -0.81789987 0.49998076 -0.00792683 -0.03961927 -0.29032571 -0.03961927 -0.00007877 -0.00026525 -0.00007877
02a_S22     -67.12623990 -8.92320314 -8.10994162 -0.86919405 -0.85760293 0.51734668 -0.00921327 -0.04776095 -0.31031086 -0.04776095 -0.00004069 -0.00014380 -0.00004069
03a_S22     -166.50136201 -22.30483114 -20.28231588 -2.17570907 -2.09450865 1.24862123 -0.03253480 -0.12828836 -0.79423261 -0.12828836 -0.00028917 -0.00079111 -0.00028917
04a_S22     -147.91037754 -21.06021925 -19.11356494 -2.07283389 -2.05637810 1.23132319 -0.03072646 -0.12032893 -0.77137389 -0.12032893 -0.00036009 -0.00099332 -0.00036009
05a_S22     -360.65489712 -51.88639158 -47.10708531 -5.06682540 -5.01806206 2.97620680 -0.07543469 -0.30909407 -1.89437028 -0.30909407 -0.00174362 -0.00431977 -0.00174362
06a_S22     -279.06874531 -42.54892417 -38.53781258 -4.20805450 -4.25462988 2.53896525 -0.05681913 -0.25095310 -1.58687839 -0.25095310 -0.00189664 -0.00453578 -0.00189664
06b_S22     -260.48237483 -41.30332347 -37.36042498 -4.10338014 -4.21584093 2.52085407 -0.05038822 -0.24343915 -1.55343429 -0.24343915 -0.00211780 -0.00487526 -0.00211780
07a_S22     -403.76963546 -60.82486655 -55.16462262 -5.96524847 -6.00708172 3.56105300 -0.07836415 -0.37656370 -2.27489360 -0.37656370 -0.00313361 -0.00711913 -0.00313361
07b_S22     -393.78321908 -57.80105492 -52.43839692 -5.65182210 -5.67111012 3.36914877 -0.08250061 -0.34150340 -2.12360725 -0.34150340 -0.00216683 -0.00529042 -0.00216683
08a_S22     -33.62156124 -6.58379518 -5.89719350 -0.68565278 -0.78242356 0.48765044 -0.00704344 -0.02825492 -0.25889514 -0.02825492 -0.00011038 -0.00035948 -0.00011038
09a_S22     -66.30918307 -11.73953927 -10.55007290 -1.21490046 -1.29308150 0.79433961 -0.01327031 -0.05652098 -0.45625177 -0.05652098 -0.00030079 -0.00090191 -0.00030079
10a_S22     -197.47976038 -33.25770855 -29.99529751 -3.34947885 -3.49273381 2.10231572 -0.03668879 -0.18915711 -1.25739561 -0.18915711 -0.00194300 -0.00439120 -0.00194300
10b_S22     -33.61710287 -6.58838251 -5.90127426 -0.68575646 -0.78270256 0.48773874 -0.00701930 -0.02828461 -0.25878135 -0.02828461 -0.00011326 -0.00036487 -0.00011326
11a_S22     -197.48027222 -33.25727042 -29.99493699 -3.34937635 -3.49271292 2.10229009 -0.03672633 -0.18925942 -1.25804725 -0.18925942 -0.00194702 -0.00439982 -0.00194702
12a_S22     -227.37345370 -35.34857668 -31.98427200 -3.52803414 -3.56031355 2.12942767 -0.04121004 -0.21090716 -1.33192809 -0.21090716 -0.00170394 -0.00387586 -0.00170394
13a_S22     -360.64874473 -51.89429664 -47.11347713 -5.06727883 -5.01843194 2.97646261 -0.07538495 -0.30904683 -1.89404859 -0.30904683 -0.00175470 -0.00434866 -0.00175470
14a_S22     -310.86948477 -50.65258192 -45.78102175 -5.03621337 -5.21460756 3.11562686 -0.05834009 -0.30175407 -1.91444196 -0.30175407 -0.00331270 -0.00744675 -0.00331270
14b_S22     -197.48175649 -33.25582599 -29.99368090 -3.34938793 -3.49266301 2.10229488 -0.03676148 -0.18935277 -1.25869370 -0.18935277 -0.00195051 -0.00440785 -0.00195051
15a_S22     -403.76868929 -60.82593359 -55.16460997 -5.96621551 -6.00714415 3.56131704 -0.07845959 -0.37697457 -2.27682051 -0.37697457 -0.00316385 -0.00718967 -0.00316385
15b_S22     -393.77223492 -57.81451844 -52.44944383 -5.65252738 -5.67179262 3.36956969 -0.08244346 -0.34146674 -2.12331738 -0.34146674 -0.00217453 -0.00530775 -0.00217453
16a_S22     -66.30923083 -11.73947758 -10.55006287 -1.21488773 -1.29308182 0.79433296 -0.01326936 -0.05651009 -0.45624722 -0.05651009 -0.00029709 -0.00089356 -0.00029709
16b_S22     -65.85784036 -10.97763122 -9.87578907 -1.15132437 -1.15156530 0.70668378 -0.01206189 -0.05992511 -0.43730776 -0.05992511 -0.00028275 -0.00082518 -0.00028275
17a_S22     -197.48165338 -33.25569457 -29.99341845 -3.34959606 -3.49260881 2.10230659 -0.03670472 -0.18917686 -1.25758127 -0.18917686 -0.00194438 -0.00439290 -0.00194438
17b_S22     -67.12653095 -8.92288871 -8.10981865 -0.86920710 -0.85757803 0.51734310 -0.00930021 -0.04787134 -0.31076758 -0.04787134 -0.00004270 -0.00014952 -0.00004270
18a_S22     -197.48060169 -33.25680217 -29.99443432 -3.34954502 -3.49267039 2.10230947 -0.03669474 -0.18916119 -1.25744580 -0.18916119 -0.00194363 -0.00439193 -0.00194363
18b_S22     -48.55152067 -7.65945635 -6.92129263 -0.76855672 -0.81797988 0.50002809 -0.00795751 -0.03964786 -0.29047501 -0.03964786 -0.00008008 -0.00026935 -0.00008008
19a_S22     -197.48289503 -33.25452630 -29.99232835 -3.34963337 -3.49255455 2.10230942 -0.03673147 -0.18923844 -1.25799815 -0.18923844 -0.00194774 -0.00440339 -0.00194774
19b_S22     -80.86420851 -12.02616408 -10.86556689 -1.24466018 -1.18556435 0.72145642 -0.01400281 -0.07145914 -0.47925882 -0.07145914 -0.00021244 -0.00061209 -0.00021244
20a_S22     -197.48128971 -33.25626018 -29.99396859 -3.34949549 -3.49266153 2.10230889 -0.03672705 -0.18925009 -1.25800653 -0.18925009 -0.00194784 -0.00440361 -0.00194784
20b_S22     -197.48064329 -33.25661053 -29.99433397 -3.34950680 -3.49266647 2.10229954 -0.03669840 -0.18914100 -1.25740152 -0.18914100 -0.00193921 -0.00437340 -0.00193921
21a_S22     -310.87147892 -50.65008581 -45.77882199 -5.03630135 -5.21443258 3.11557718 -0.05829622 -0.30160069 -1.91360324 -0.30160069 -0.00330073 -0.00740898 -0.00330073
21b_S22     -197.48406961 -33.25340961 -29.99135760 -3.34960889 -3.49251205 2.10230479 -0.03677596 -0.18934241 -1.25868721 -0.18934241 -0.00195234 -0.00441481 -0.00195234
22a_S22     -264.11840085 -41.49666268 -37.52837102 -4.12060935 -4.21986675 2.52529184 -0.04911971 -0.23976134 -1.53872440 -0.23976134 -0.00213314 -0.00483671 -0.00213314
22b_S22     -264.11792238 -41.49703019 -37.52917281 -4.12002296 -4.21989690 2.52518258 -0.04907935 -0.23973423 -1.53818106 -0.23973423 -0.00213561 -0.00484345 -0.00213561
AM2_BSSE    -66.75011494 -12.49350233 -11.21782360 -1.27659527 -1.43438473 0.88193883 -0.01392952 -0.05794157 -0.48386739 -0.05794157 -0.00031979 -0.00090019 -0.00031979
AM3_BSSE    -99.88095798 -18.40240803 -16.53990632 -1.86450956 -2.08645508 1.27528660 -0.02094981 -0.08872139 -0.71060657 -0.08872139 -0.00060179 -0.00158274 -0.00060179
AM4_BSSE    -133.01106106 -24.31199117 -21.86264815 -2.45235912 -2.73862650 1.66867322 -0.02796011 -0.11959677 -0.93760916 -0.11959677 -0.00090748 -0.00231287 -0.00090748
AM5_BSSE    -166.14093810 -30.22171809 -27.18543797 -3.04025950 -3.39079582 2.06206991 -0.03497016 -0.15047869 -1.16468022 -0.15047869 -0.00122610 -0.00306880 -0.00122610
AM6_BSSE    -199.27090095 -36.13136573 -32.50819894 -3.62815488 -4.04297507 2.45547238 -0.04198264 -0.18137959 -1.39180829 -0.18137959 -0.00155035 -0.00383600 -0.00155035
AM7_BSSE    -232.40079084 -42.04107089 -37.83098387 -4.21604407 -4.69514084 2.84886182 -0.04898914 -0.21227587 -1.61891944 -0.21227587 -0.00187661 -0.00460714 -0.00187661
# MB08 :: 180
MB08-001     -100.76710322  -15.48529520  -13.99087297  -1.55084205  -1.63941266  1.00364403  -0.01658977  -0.07671311  -0.57217895  -0.07671311  -0.00020371  -0.00061462  -0.00020371
MB08-002     -433.80718341  -39.07514172  -35.74756855  -3.43826234  -3.12171126  1.86067778  -0.03463003  -0.15821847  -0.98116116  -0.15377484  -0.00058284  -0.00176588  -0.00061821
MB08-003     -128.40804955  -22.40353233  -20.11829864  -2.36172180  -2.37877999  1.46682977  -0.02869741  -0.12820656  -0.84754949  -0.11021430  -0.00135873  -0.00299303  -0.00096813
MB08-004     -385.79884846  -29.79273288  -27.26785524  -2.50776497  -2.28348001  1.38048643  -0.01772985  -0.08774924  -0.62480466  -0.08774924  -0.00059755  -0.00173698  -0.00059755
MB08-005     -492.86651415  -38.65764963  -35.37644603  -3.29889818  -2.92525380  1.76652599  -0.02219894  -0.13420103  -0.84069375  -0.13408390  -0.00050378  -0.00137563  -0.00048100
MB08-006     -305.22647431  -32.82352485  -29.77287770  -3.08091734  -2.84740903  1.73149361  -0.03076245  -0.12654536  -0.83935630  -0.11461670  -0.00117852  -0.00249404  -0.00071312
MB08-007     -270.22036658  -22.66803685  -20.69600558  -1.95868476  -1.80003141  1.10685180  -0.01352290  -0.06500133  -0.45929691  -0.05161105  -0.00045604  -0.00098490  -0.00016388
MB08-008     -72.14279476  -13.81862426  -12.37658089  -1.48809730  -1.58562579  0.99266696  -0.02214381  -0.06785108  -0.56087911  -0.06785108  -0.00064064  -0.00193577  -0.00064064
MB08-009     -346.76976571  -36.16342219  -32.88853438  -3.34935446  -3.05953977  1.85118525  -0.03259939  -0.13954264  -0.90399216  -0.12900509  -0.00115031  -0.00279200  -0.00074609
MB08-010     -282.27112956  -32.08089604  -29.23340651  -3.02591598  -2.82425798  1.69715745  -0.03882649  -0.14702816  -0.94802761  -0.14702816  -0.00029684  -0.00092048  -0.00029684
MB08-011     -13.48688414  -5.03870085  -4.42440374  -0.60722018  -0.76564946  0.51503804  -0.00618098  -0.01844618  -0.22605207  -0.00395673  -0.00044465  -0.00073891  -0.00009635
MB08-012     -22.41619555  -6.22415135  -5.51446607  -0.69852794  -0.87479009  0.56711619  -0.00858455  -0.01995103  -0.27906427  -0.01995103  -0.00021547  -0.00068341  -0.00021547
MB08-013     -331.40312969  -27.37139449  -24.95932882  -2.39816354  -2.15626598  1.32647136  -0.01527833  -0.08392455  -0.57162898  -0.06374855  -0.00073861  -0.00168439  -0.00036447
MB08-014     -79.12811435  -13.52015101  -12.11844789  -1.45138400  -1.49855864  0.95748790  -0.01608749  -0.05928563  -0.47814299  -0.05028764  -0.00063189  -0.00103503  -0.00012646
MB08-015     -79.94276277  -13.02919319  -11.69992210  -1.36182851  -1.43550293  0.90015708  -0.01448749  -0.05279950  -0.47527298  -0.05279950  -0.00020632  -0.00070028  -0.00020632
MB08-016     -27.81384080  -7.78013230  -6.86115896  -0.89608263  -1.04329718  0.67968394  -0.00932457  -0.02145348  -0.31548966  -0.02145348  -0.00026912  -0.00085229  -0.00026912
MB08-017     -817.56197727  -56.96729615  -52.37327696  -4.59960243  -3.89766082  2.31604561  -0.02859195  -0.17611122  -1.06465948  -0.17611122  -0.00110117  -0.00307331  -0.00110117
MB08-018     -453.56887472  -38.37421204  -35.10948194  -3.27374427  -2.89048211  1.73105932  -0.02222299  -0.10945026  -0.73301008  -0.10945026  -0.00074255  -0.00242863  -0.00074255
MB08-019     -523.60324583  -44.29366586  -40.50630216  -3.78700227  -3.34427697  1.99694163  -0.02695073  -0.14464489  -0.87329740  -0.12778563  -0.00114480  -0.00280209  -0.00084652
MB08-020     -117.00711978  -17.53349058  -15.78114032  -1.79646778  -1.81524523  1.12739761  -0.02158103  -0.07167098  -0.58875215  -0.07167098  -0.00025359  -0.00078285  -0.00025359
MB08-021     -539.87261394  -49.31922965  -45.05050872  -4.36721052  -3.95893579  2.35231233  -0.04138046  -0.20709476  -1.25822617  -0.20709476  -0.00124585  -0.00327348  -0.00124585
MB08-022     -386.14292450  -32.86454028  -30.11267651  -2.81896846  -2.57874136  1.54044556  -0.02759921  -0.12796046  -0.77788967  -0.11935033  -0.00055952  -0.00148386  -0.00043118
MB08-023     -33.19525044  -9.20328751  -8.06743373  -1.11205362  -1.19695780  0.79382321  -0.00982492  -0.01594115  -0.34686287  -0.01594115  -0.00031347  -0.00117303  -0.00031347
MB08-024     -406.34393068  -33.43512649  -30.53474816  -2.87665127  -2.63716150  1.58845203  -0.02087177  -0.10835114  -0.74409855  -0.10835114  -0.00087775  -0.00237595  -0.00087775
MB08-025     -421.79772388  -33.59622375  -30.77645207  -2.85570274  -2.57127129  1.54459815  -0.02699025  -0.12438013  -0.74630242  -0.10429486  -0.00049172  -0.00145456  -0.00049026
MB08-026     -117.66038709  -18.72148742  -16.87663030  -1.92605388  -1.96793392  1.20600549  -0.02486801  -0.09273335  -0.71335497  -0.09273335  -0.00051924  -0.00147928  -0.00051924
MB08-027     -302.67316618  -27.52278286  -25.11494368  -2.42644379  -2.26080942  1.36551537  -0.02054953  -0.09395642  -0.66633513  -0.09395642  -0.00062492  -0.00197658  -0.00062492
MB08-028     -178.02474821  -23.84637785  -21.64527078  -2.33357361  -2.29829109  1.39080005  -0.03104441  -0.12023141  -0.79971334  -0.12058751  -0.00030748  -0.00089298  -0.00032571
MB08-029     -373.22428915  -40.87451575  -37.23088270  -3.78979278  -3.47567801  2.07562487  -0.04063034  -0.17799270  -1.08372877  -0.16431320  -0.00049305  -0.00127719  -0.00037525
MB08-030     -61.10600538  -11.39343493  -10.20280270  -1.22123121  -1.32037663  0.83533764  -0.01439518  -0.05123170  -0.43743194  -0.04605829  -0.00030350  -0.00081678  -0.00021360
MB08-031     -111.65309252  -15.96378720  -14.38570177  -1.62798792  -1.63990974  1.02109512  -0.02102300  -0.06406761  -0.54077286  -0.06406761  -0.00015434  -0.00051378  -0.00015434
MB08-032     -618.65935389  -57.73541667  -52.70820646  -5.14019510  -4.53975955  2.70519919  -0.04563417  -0.22252900  -1.36138595  -0.22252900  -0.00153736  -0.00440323  -0.00153736
MB08-033     -543.40244015  -43.17356350  -39.53012995  -3.69239996  -3.25806961  1.95032709  -0.02962021  -0.14894364  -0.95595697  -0.14894364  -0.00038005  -0.00110670  -0.00038005
MB08-034     -128.87111183  -18.68759664  -16.85782863  -1.91070124  -1.89703014  1.17813605  -0.03339601  -0.08356693  -0.62527455  -0.07432524  -0.00027499  -0.00096877  -0.00028777
MB08-035     -243.58841786  -28.28428589  -25.57095999  -2.73139454  -2.55986155  1.57146253  -0.02325899  -0.09164046  -0.73095780  -0.09164046  -0.00071861  -0.00223331  -0.00071861
MB08-036     -187.26530157  -22.71066464  -20.51294751  -2.22235110  -2.10836257  1.30932611  -0.01883689  -0.08362546  -0.57540029  -0.06066760  -0.00043174  -0.00111961  -0.00024045
MB08-037     -485.96437417  -43.19881581  -39.47455251  -3.76972689  -3.32582740  1.99345853  -0.02939219  -0.14842062  -0.91274839  -0.13901633  -0.00117832  -0.00309288  -0.00088231
MB08-038     -159.98312710  -24.15886936  -21.85578433  -2.42809302  -2.43264917  1.47430428  -0.03633942  -0.13770958  -0.88191645  -0.12632033  -0.00076776  -0.00167147  -0.00050637
MB08-039     -804.49474620  -60.64061536  -55.63850324  -5.00577189  -4.33183509  2.56039195  -0.03946528  -0.21464655  -1.20521385  -0.19496728  -0.00140204  -0.00361021  -0.00134097
MB08-040     -557.55743953  -48.77576546  -44.47909304  -4.37356014  -3.90970431  2.35517973  -0.03960443  -0.18750292  -1.23025100  -0.18750292  -0.00136180  -0.00393207  -0.00136180
MB08-041     -721.70907528  -62.14962200  -56.99048486  -5.32577222  -4.63947215  2.73145739  -0.05042134  -0.23461276  -1.38000429  -0.23461276  -0.00106120  -0.00343942  -0.00106120
MB08-042     -117.00808223  -17.53466315  -15.77975330  -1.79869904  -1.81502201  1.12779298  -0.02171637  -0.07124151  -0.58759951  -0.07124151  -0.00024430  -0.00076300  -0.00024430
MB08-043     -1061.84275860  -77.29967176  -71.08321898  -6.23740644  -5.28795043  3.09833372  -0.04151169  -0.25654010  -1.43794768  -0.25654010  -0.00152629  -0.00404477  -0.00152629
MB08-044     -225.41722399  -20.47555184  -18.65104683  -1.81216027  -1.70558202  1.04794582  -0.01376176  -0.05072686  -0.43831304  -0.05072686  -0.00025188  -0.00095151  -0.00025188
MB08-045     -169.98922788  -19.98770524  -18.08839857  -1.90355525  -1.85860067  1.14411107  -0.01579815  -0.06336286  -0.50535530  -0.06336286  -0.00030586  -0.00094571  -0.00030586
MB08-046     -449.98113195  -42.38969416  -38.63560881  -3.77658353  -3.39265782  2.03794381  -0.02709558  -0.14461195  -0.92698135  -0.14461195  -0.00173056  -0.00487525  -0.00173056
MB08-047     -325.16011401  -26.42233774  -24.14937662  -2.27064832  -2.08377252  1.27167733  -0.01804583  -0.07454707  -0.56302987  -0.07454707  -0.00055291  -0.00183061  -0.00055291
MB08-048     -324.32292297  -33.25524959  -30.30244016  -3.03286854  -2.81402346  1.68660251  -0.02982481  -0.13132537  -0.87206073  -0.13132537  -0.00052983  -0.00177826  -0.00052983
MB08-049     -385.81020719  -29.80303390  -27.27427939  -2.51305761  -2.28382455  1.38230211  -0.01741098  -0.09008888  -0.62849874  -0.09008888  -0.00063354  -0.00183373  -0.00063354
MB08-050     -657.16707961  -47.68927511  -43.79983819  -3.87506933  -3.32434056  1.97685940  -0.02252297  -0.13643094  -0.85629961  -0.13643094  -0.00056579  -0.00172807  -0.00056579
MB08-051     -144.06362860  -20.08558591  -18.17135769  -2.04178851  -2.01008351  1.23915669  -0.03204993  -0.09595624  -0.72388646  -0.09595624  -0.00024629  -0.00079816  -0.00024629
MB08-052     -427.16749024  -35.78482907  -32.71148605  -3.09504642  -2.82801929  1.69596284  -0.02554163  -0.13203958  -0.85500027  -0.13203958  -0.00097034  -0.00261898  -0.00097034
MB08-053     -121.31011544  -18.98180916  -17.11993619  -1.94382870  -1.98034247  1.21395387  -0.02651457  -0.09624632  -0.71534289  -0.09624632  -0.00040493  -0.00113483  -0.00040493
MB08-054     -72.77929740  -13.78429420  -12.30297798  -1.49592446  -1.57109775  0.99156223  -0.01635898  -0.05206678  -0.52459952  -0.05206678  -0.00059659  -0.00261083  -0.00059659
MB08-055     -1078.46530419  -80.10779478  -73.63702269  -6.53894144  -5.50748823  3.23393255  -0.04467744  -0.26667997  -1.49701135  -0.26667997  -0.00088322  -0.00240543  -0.00088322
MB08-056     -96.46753519  -13.90035880  -12.53083685  -1.43398986  -1.46342344  0.92250584  -0.02160005  -0.05841336  -0.48801526  -0.05841336  -0.00011032  -0.00039699  -0.00011032
MB08-057     -169.98991333  -19.98731408  -18.08709861  -1.90513360  -1.85827661  1.14432507  -0.01569043  -0.06316882  -0.50500411  -0.06316882  -0.00029246  -0.00091881  -0.00029246
MB08-058     -102.45981633  -16.74529644  -15.10819820  -1.71958251  -1.80076023  1.10637400  -0.02350112  -0.08805284  -0.65046823  -0.08805284  -0.00038707  -0.00112289  -0.00038707
MB08-059     -433.65816545  -29.82846150  -27.40796270  -2.41353084  -2.13968405  1.29492668  -0.01248294  -0.08551701  -0.58235111  -0.08551701  -0.00025930  -0.00081106  -0.00025930
MB08-060     -159.23876858  -22.34610286  -20.23265260  -2.18976008  -2.20432620  1.33105473  -0.02706939  -0.10765746  -0.75449285  -0.10765746  -0.00032493  -0.00090608  -0.00032493
MB08-061     -385.82491310  -29.79667895  -27.25762799  -2.52541951  -2.28113762  1.38512544  -0.01682663  -0.08829931  -0.62609048  -0.08829931  -0.00058592  -0.00172676  -0.00058592
MB08-062     -149.47439292  -16.29259824  -14.77446123  -1.54405169  -1.49812317  0.93720371  -0.01412472  -0.04372043  -0.39594802  -0.04372043  -0.00012215  -0.00071137  -0.00012215
MB08-063     -870.30152905  -70.62552795  -64.77017808  -5.94556322  -5.05800104  2.98418422  -0.04381950  -0.23335802  -1.36689114  -0.23335802  -0.00108774  -0.00407678  -0.00108774
MB08-064     -350.30434873  -33.87199623  -30.90817142  -3.01300724  -2.81898227  1.68012940  -0.02720785  -0.13470693  -0.87215808  -0.13470693  -0.00078124  -0.00219439  -0.00078124
MB08-065     -251.62610340  -26.30914395  -23.95723985  -2.42052675  -2.26604350  1.37322634  -0.02352835  -0.09663566  -0.67137389  -0.09663566  -0.00022811  -0.00080560  -0.00022811
MB08-066     -273.05932981  -26.73734049  -24.38098578  -2.39320213  -2.25635766  1.35888167  -0.01935365  -0.09413587  -0.66122924  -0.09413587  -0.00057851  -0.00211791  -0.00057851
MB08-067     -293.58248424  -30.43375585  -27.67032206  -2.78389491  -2.61312359  1.57338430  -0.02569603  -0.11003619  -0.77124521  -0.11003619  -0.00059404  -0.00170723  -0.00059404
MB08-068     -70.07269918  -12.56999991  -11.27030288  -1.31979787  -1.42722986  0.89012138  -0.01529932  -0.05462736  -0.48351137  -0.05462736  -0.00027320  -0.00080272  -0.00027320
MB08-069     -138.70196814  -18.69953184  -16.97617973  -1.81988574  -1.85198555  1.12496634  -0.02124009  -0.09381750  -0.64904398  -0.09381750  -0.00015904  -0.00049559  -0.00015904
MB08-070     -135.11373273  -19.69848076  -17.77184826  -1.99207623  -1.99744239  1.22671877  -0.02491887  -0.08576226  -0.67019521  -0.08576226  -0.00032576  -0.00098442  -0.00032576
MB08-071     -324.32352814  -33.25492673  -30.30072448  -3.03518315  -2.81361854  1.68718921  -0.02975016  -0.13095878  -0.87123883  -0.13095878  -0.00050109  -0.00172133  -0.00050109
MB08-072     -484.26516625  -44.25879463  -40.46234715  -3.90095429  -3.45103823  2.06155583  -0.03656276  -0.16248537  -1.00342785  -0.16248537  -0.00059875  -0.00189328  -0.00059875
MB08-073     -66.46644332  -13.52056238  -12.07418912  -1.46152268  -1.57387089  0.98480779  -0.01914614  -0.06309456  -0.53549867  -0.06309456  -0.00078303  -0.00216841  -0.00078303
MB08-074     -328.34230519  -33.71047552  -30.56593463  -3.15953452  -2.91929458  1.78477121  -0.02584273  -0.12568583  -0.88076126  -0.12568583  -0.00243439  -0.00684524  -0.00243439
MB08-075     -237.56654709  -31.31216925  -28.47527157  -3.05743120  -2.95022534  1.76747967  -0.04590053  -0.17164116  -1.10663668  -0.17164116  -0.00045704  -0.00127073  -0.00045704
MB08-076     -27.80950062  -7.77736635  -6.85658203  -0.89915612  -1.04275087  0.68051302  -0.00959977  -0.02100474  -0.31489071  -0.02100474  -0.00025953  -0.00084300  -0.00025953
MB08-077     -206.84221125  -28.49196079  -25.83662802  -2.81440740  -2.74575358  1.65341295  -0.03537900  -0.15191648  -1.00178535  -0.15191648  -0.00051643  -0.00139445  -0.00051643
MB08-078     -303.52080510  -30.84569802  -28.05797228  -2.83758806  -2.61536777  1.58364124  -0.02403989  -0.10823641  -0.76993097  -0.10823641  -0.00055051  -0.00196756  -0.00055051
MB08-079     -91.09200733  -12.35035865  -11.17290324  -1.23804633  -1.29253154  0.81086211  -0.01376106  -0.05221450  -0.43745601  -0.05221450  -0.00006524  -0.00027170  -0.00006524
MB08-080     -71.87217148  -15.08900082  -13.42857842  -1.65639771  -1.74290417  1.09775456  -0.01697878  -0.06285128  -0.56396046  -0.06285128  -0.00079508  -0.00219227  -0.00079508
MB08-081     -325.16983856  -26.44219276  -24.15953303  -2.27707566  -2.08412950  1.27394401  -0.01591445  -0.07658576  -0.56457542  -0.07658576  -0.00062191  -0.00199328  -0.00062191
MB08-082     -114.40520629  -18.67877441  -16.85590427  -1.89134346  -1.97827260  1.20095384  -0.02382385  -0.09846216  -0.72114937  -0.09846216  -0.00051241  -0.00140772  -0.00051241
MB08-083     -193.72971336  -28.41231588  -25.69223984  -2.87088701  -2.80113441  1.70259821  -0.05117110  -0.15310306  -1.00996063  -0.15133979  -0.00073581  -0.00200583  -0.00076893
MB08-084     -66.76647551  -12.47628686  -11.20251549  -1.27636383  -1.43333563  0.88164624  -0.01402644  -0.05793223  -0.48467060  -0.05793223  -0.00032009  -0.00090562  -0.00032009
MB08-085     -133.30495219  -20.15787585  -18.15338595  -2.09734924  -2.05522968  1.27387664  -0.02363536  -0.10852499  -0.73543327  -0.08714622  -0.00031431  -0.00077405  -0.00022559
MB08-086     -22.41622619  -6.22427630  -5.51446138  -0.69840330  -0.87482601  0.56710207  -0.00860675  -0.01992966  -0.27902310  -0.01992966  -0.00021652  -0.00068585  -0.00021652
MB08-087     -461.69124238  -44.55825480  -40.64467814  -3.98246999  -3.58008480  2.13837478  -0.03508418  -0.16841349  -1.04802337  -0.16841349  -0.00201744  -0.00587504  -0.00201744
MB08-088     -519.05047730  -48.09815935  -43.98892950  -4.25892046  -3.92894500  2.32250647  -0.04402058  -0.22713928  -1.35849904  -0.22713928  -0.00172342  -0.00443511  -0.00172342
MB08-089     -134.95084168  -22.16663531  -19.98341376  -2.27330308  -2.31975198  1.40957677  -0.02876928  -0.12405357  -0.86363282  -0.12405357  -0.00088859  -0.00228166  -0.00088859
MB08-090     -34.30097167  -7.53484574  -6.71747485  -0.81395055  -0.95216083  0.61883104  -0.00849758  -0.02851865  -0.30146689  -0.02836636  -0.00015325  -0.00046399  -0.00013084
MB08-091     -187.71207615  -26.83033329  -24.29490770  -2.68860208  -2.63024103  1.59060614  -0.04190691  -0.14848152  -0.95745739  -0.13128611  -0.00056669  -0.00140869  -0.00048147
MB08-092     -217.64529444  -23.25717941  -21.12567716  -2.15042547  -2.05501744  1.25194453  -0.01758090  -0.07589516  -0.57552229  -0.07589516  -0.00033886  -0.00117561  -0.00033886
MB08-093     -635.69345136  -51.35228518  -47.08354197  -4.29289592  -3.76186343  2.22257435  -0.03353464  -0.17822455  -1.04309780  -0.16772555  -0.00100691  -0.00259677  -0.00086381
MB08-094     -473.01895722  -40.13281306  -36.75107662  -3.45475434  -3.13547743  1.86497238  -0.02938282  -0.16484838  -0.96169461  -0.15083764  -0.00067288  -0.00179227  -0.00063979
MB08-095     -600.37824144  -55.15271606  -50.38858888  -4.86484734  -4.34012155  2.57470497  -0.04176025  -0.22094935  -1.32326005  -0.22094935  -0.00191508  -0.00500355  -0.00191508
MB08-096     -384.62822028  -34.73096740  -31.73731386  -3.02023735  -2.82683701  1.68155083  -0.02480103  -0.13588528  -0.86813310  -0.13588528  -0.00098807  -0.00268529  -0.00098807
MB08-097     -439.02916001  -37.10839509  -33.94133245  -3.18771796  -2.92610213  1.74445472  -0.02719118  -0.14784445  -0.87120779  -0.12758069  -0.00090781  -0.00230654  -0.00078520
MB08-098     -440.62343043  -35.25501383  -32.33671192  -2.97541713  -2.69121649  1.60576792  -0.02206129  -0.12867069  -0.80779820  -0.12867069  -0.00042056  -0.00124951  -0.00042056
MB08-099     -100.74401246  -15.45796668  -13.96876572  -1.55057012  -1.63821891  1.00287572  -0.01858725  -0.07599917  -0.57831410  -0.07599917  -0.00022384  -0.00067124  -0.00022384
MB08-100     -87.30499494  -15.92143954  -14.28197448  -1.67413290  -1.76835929  1.09101193  -0.02576428  -0.07530702  -0.61070797  -0.07530702  -0.00061960  -0.00172647  -0.00061960
MB08-101     -68.28017874  -10.53035741  -9.50103034  -1.08133518  -1.15852228  0.73882289  -0.01210456  -0.04876693  -0.39612314  -0.04867044  -0.00009127  -0.00031168  -0.00007853
MB08-102     -284.04401279  -31.11889537  -28.32188657  -2.88533217  -2.70636768  1.62793854  -0.03101352  -0.12704538  -0.81836764  -0.11889173  -0.00049589  -0.00146954  -0.00045102
MB08-103     -180.79103344  -26.50972766  -24.02123448  -2.63394085  -2.62515384  1.57778779  -0.04069603  -0.15854053  -0.95956547  -0.13684278  -0.00076156  -0.00181382  -0.00061418
MB08-104     -340.46794147  -33.89183307  -30.82998203  -3.09725885  -2.86886958  1.73568423  -0.03037085  -0.13279047  -0.85940115  -0.12224409  -0.00119543  -0.00309449  -0.00102823
MB08-105     -114.38506083  -18.70886976  -16.89173976  -1.88285228  -1.98042120  1.19966890  -0.02327850  -0.09979915  -0.71495881  -0.09979915  -0.00051624  -0.00146541  -0.00051624
MB08-106     -473.76757998  -44.37210857  -40.58051718  -3.92370203  -3.59166304  2.12822407  -0.04358157  -0.19075639  -1.17592761  -0.19075639  -0.00105570  -0.00329027  -0.00105570
MB08-107     -129.52646888  -20.10942185  -18.18920450  -2.00753668  -2.07739048  1.25526764  -0.02694497  -0.11222713  -0.74273985  -0.10421312  -0.00046675  -0.00125674  -0.00049077
MB08-108     -772.05276714  -60.74972664  -55.80731089  -5.03623056  -4.43249718  2.59845604  -0.04426155  -0.23617904  -1.35366282  -0.23617904  -0.00197979  -0.00524753  -0.00197979
MB08-109     -97.08748027  -15.25071656  -13.79016544  -1.53095780  -1.63342877  0.99758631  -0.01752401  -0.07930048  -0.59123502  -0.07930048  -0.00026584  -0.00076693  -0.00026584
MB08-110     -282.51064814  -32.85547213  -29.79211053  -3.13522567  -2.94001704  1.77729623  -0.02933951  -0.13329354  -0.91993858  -0.13329354  -0.00082824  -0.00228657  -0.00082824
MB08-111     -146.79672258  -23.47191001  -21.19324452  -2.38196614  -2.41460815  1.46263049  -0.03151225  -0.14076729  -0.88776787  -0.12246094  -0.00079481  -0.00193091  -0.00069268
MB08-112     -483.47181576  -47.26275230  -43.16950724  -4.26200763  -3.91928036  2.32213190  -0.05341491  -0.22319115  -1.35736216  -0.22319115  -0.00177916  -0.00462832  -0.00177916
MB08-113     -321.95478993  -37.45423263  -34.00590619  -3.57902685  -3.32261793  2.00698983  -0.04029331  -0.16351197  -1.07161118  -0.16351197  -0.00084367  -0.00253966  -0.00084367
MB08-114     -305.48732453  -31.57030459  -28.74550618  -2.89470827  -2.69576346  1.62353417  -0.02610108  -0.13268890  -0.82151961  -0.11294392  -0.00102079  -0.00243126  -0.00054939
MB08-115     -148.37194193  -21.60640016  -19.60973879  -2.15985214  -2.18246999  1.32165225  -0.03495524  -0.12610733  -0.85636046  -0.12610733  -0.00047255  -0.00152056  -0.00047255
MB08-116     -698.86637591  -60.46847967  -55.41153276  -5.18823023  -4.51534642  2.66913996  -0.04686036  -0.22878591  -1.32639264  -0.22837574  -0.00090828  -0.00251660  -0.00085299
MB08-117     -155.97658765  -22.07852323  -19.98808424  -2.19272392  -2.19146337  1.33073013  -0.02841205  -0.10833491  -0.77611746  -0.10833491  -0.00035267  -0.00104404  -0.00035267
MB08-118     -358.25255817  -36.16860033  -33.03426009  -3.31253609  -3.02314990  1.81049564  -0.04164558  -0.16177357  -1.04015095  -0.16177357  -0.00047325  -0.00148371  -0.00047325
MB08-119     -475.37894867  -42.58596460  -38.97550685  -3.73160885  -3.34003397  1.99129629  -0.03155094  -0.17601777  -1.02398579  -0.15835377  -0.00055633  -0.00128128  -0.00029968
MB08-120     -379.56592343  -28.80433983  -26.38269712  -2.42711062  -2.18719780  1.33304586  -0.01681875  -0.08918934  -0.59356353  -0.08201846  -0.00062006  -0.00180752  -0.00054356
MB08-121     -290.30967087  -30.22468805  -27.47817106  -2.77274338  -2.60542448  1.56966293  -0.02421767  -0.10991623  -0.77933280  -0.10991623  -0.00065447  -0.00194782  -0.00065447
MB08-122     -753.40175224  -65.69335446  -60.21310381  -5.64200853  -4.98475012  2.92495795  -0.05553672  -0.27576080  -1.56986191  -0.27576080  -0.00165142  -0.00441799  -0.00165142
MB08-123     -81.89104143  -13.83197329  -12.47644016  -1.39559388  -1.51630788  0.93258556  -0.01835314  -0.07042591  -0.52474956  -0.06927712  -0.00034145  -0.00090324  -0.00029450
MB08-124     -653.00560562  -54.57264775  -49.99248041  -4.66340897  -4.09153009  2.42683097  -0.03760489  -0.22032233  -1.22983843  -0.20096823  -0.00250922  -0.00605946  -0.00211133
MB08-125     -843.77949043  -60.88036012  -55.93330754  -4.97906796  -4.26291679  2.52677804  -0.03585936  -0.20525833  -1.20984028  -0.20525833  -0.00123738  -0.00336428  -0.00123738
MB08-126     -121.27173832  -19.04229169  -17.16983745  -1.92771098  -1.98539963  1.21019500  -0.02418138  -0.09092262  -0.68519642  -0.09092262  -0.00042004  -0.00115005  -0.00042004
MB08-127     -302.67334756  -27.52328907  -25.11470428  -2.42687524  -2.26070904  1.36559623  -0.02043727  -0.09381034  -0.66585951  -0.09381034  -0.00062216  -0.00196933  -0.00062216
MB08-128     -535.53517443  -45.49286263  -41.62747328  -3.91142395  -3.44470995  2.05444872  -0.02867086  -0.15138893  -0.96505331  -0.15138893  -0.00101630  -0.00305999  -0.00101630
MB08-129     -230.55388413  -34.59227546  -31.31183945  -3.51235757  -3.40896763  2.05112527  -0.05092576  -0.20970193  -1.34271523  -0.20970193  -0.00159695  -0.00469753  -0.00159695
MB08-130     -707.36917062  -57.08262419  -52.36379500  -4.77010230  -4.22198164  2.48243534  -0.03667702  -0.21597407  -1.24910495  -0.21597407  -0.00192266  -0.00500471  -0.00192266
MB08-131     -384.66473171  -34.69698782  -31.68942498  -3.03722786  -2.82134262  1.68350655  -0.02578198  -0.13057624  -0.86371052  -0.13057624  -0.00086552  -0.00244455  -0.00086552
MB08-132     -176.49917769  -25.66617939  -23.18252938  -2.57659219  -2.53697435  1.54094070  -0.02728011  -0.12595055  -0.87935358  -0.12595055  -0.00057178  -0.00152533  -0.00057178
MB08-133     -408.85822817  -34.72295812  -31.82515959  -2.95915590  -2.69909701  1.60672514  -0.02810949  -0.12356947  -0.79263910  -0.12356947  -0.00039176  -0.00129502  -0.00039176
MB08-134     -397.92661841  -40.05907088  -36.55255198  -3.62663930  -3.36377572  1.99902047  -0.04053965  -0.17801693  -1.11244638  -0.17801693  -0.00115371  -0.00309102  -0.00115371
MB08-135     -846.70615589  -64.74759980  -59.50569015  -5.33752302  -4.65020885  2.72510465  -0.04314301  -0.24444680  -1.40302714  -0.24444680  -0.00121195  -0.00323327  -0.00121195
MB08-136     -121.30985222  -18.98249770  -17.12148525  -1.94199797  -1.98063778  1.21336610  -0.02659894  -0.09647153  -0.71562799  -0.09647153  -0.00041634  -0.00115723  -0.00041634
MB08-137     -302.66347340  -27.63676252  -25.21155875  -2.41039249  -2.27117652  1.36403980  -0.01937274  -0.09000857  -0.63556646  -0.09000857  -0.00049354  -0.00146062  -0.00049354
MB08-138     -197.06322169  -22.63773697  -20.57352019  -2.13740501  -2.05919576  1.25459404  -0.02517095  -0.09122410  -0.62800918  -0.09122410  -0.00026847  -0.00093961  -0.00026847
MB08-139     -114.40312804  -18.56452245  -16.74363003  -1.90966648  -1.96766583  1.20226990  -0.03353418  -0.09801740  -0.72673323  -0.09801740  -0.00056392  -0.00166085  -0.00056392
MB08-140     -121.30645352  -18.97518636  -17.10671366  -1.94254725  -1.97772935  1.21217571  -0.02266318  -0.09335618  -0.69721738  -0.09335618  -0.00043824  -0.00127440  -0.00043824
MB08-141     -406.51110676  -32.22875350  -29.57174461  -2.68249133  -2.48917562  1.47972867  -0.02142474  -0.11518034  -0.73947091  -0.11518034  -0.00069682  -0.00199532  -0.00069682
MB08-142     -505.49828715  -44.90115896  -41.08185153  -3.93839030  -3.58300752  2.12680140  -0.03654685  -0.19185276  -1.17011583  -0.19185276  -0.00088482  -0.00243764  -0.00088482
MB08-143     -114.37520533  -18.65681489  -16.83030911  -1.89179233  -1.97589454  1.20019909  -0.02490096  -0.09615155  -0.71208573  -0.09615155  -0.00051496  -0.00139629  -0.00051496
MB08-144     -975.07533528  -70.04166567  -64.41034413  -5.62423675  -4.72402399  2.77943218  -0.03296246  -0.21298175  -1.22093147  -0.21298175  -0.00118513  -0.00335417  -0.00118513
MB08-145     -425.69377793  -41.78459561  -38.07780622  -3.76908271  -3.51574236  2.09670162  -0.03359386  -0.19127914  -1.15673152  -0.19127914  -0.00222530  -0.00559495  -0.00222530
MB08-146     -437.89230771  -43.87342366  -39.97966871  -3.96312326  -3.58134467  2.13985747  -0.03336999  -0.15935499  -1.02527895  -0.15935499  -0.00110441  -0.00364722  -0.00110441
MB08-147     -391.84859597  -37.20363623  -33.97469754  -3.32203202  -3.02866911  1.81042427  -0.03583471  -0.14168839  -0.93816691  -0.14168839  -0.00059780  -0.00187374  -0.00059780
MB08-148     -727.91265622  -60.59020899  -55.49225445  -5.16911931  -4.56236308  2.69371111  -0.04438068  -0.23542446  -1.38950483  -0.23542446  -0.00237146  -0.00616294  -0.00237146
MB08-149     -454.16652279  -38.48631682  -35.26563567  -3.29749594  -3.03843722  1.80062427  -0.03425342  -0.15802546  -0.97086387  -0.15802546  -0.00087231  -0.00244172  -0.00087231
MB08-150     -337.95079248  -36.47683204  -33.21034580  -3.35461013  -3.15668533  1.88166251  -0.03226047  -0.15970469  -1.01793303  -0.15970469  -0.00118663  -0.00334116  -0.00118663
MB08-151     -114.39719040  -18.59491651  -16.77869882  -1.90702514  -1.97115539  1.20500086  -0.02280757  -0.10169598  -0.74368027  -0.10169598  -0.00051075  -0.00140596  -0.00051075
MB08-152     -148.40008355  -21.70336093  -19.66079244  -2.16073534  -2.18637129  1.32183596  -0.02588675  -0.11728655  -0.80868336  -0.11728655  -0.00036668  -0.00103649  -0.00036668
MB08-153     -1200.15503260  -85.10486218  -78.33153907  -6.81018501  -5.71844412  3.34366179  -0.04337087  -0.28346501  -1.56815739  -0.28346501  -0.00102777  -0.00274700  -0.00102777
MB08-154     -456.67425260  -46.88799344  -42.79262144  -4.26168416  -3.92864742  2.32900419  -0.05123913  -0.21930114  -1.32945778  -0.21930114  -0.00158840  -0.00439812  -0.00158840
MB08-155     -519.29130914  -49.38448169  -45.04058684  -4.42379237  -3.94034874  2.35826463  -0.03561639  -0.18505444  -1.16242064  -0.18505444  -0.00237786  -0.00713257  -0.00237786
MB08-156     -970.32657496  -69.86110281  -64.26176632  -5.60253093  -4.71707057  2.77146848  -0.03418222  -0.21347888  -1.23168646  -0.21347888  -0.00146357  -0.00424835  -0.00146357
MB08-157     -131.59390911  -22.00497380  -19.86183496  -2.24151622  -2.31801844  1.40264697  -0.02828729  -0.13152598  -0.88077595  -0.13152598  -0.00110427  -0.00303222  -0.00110427
MB08-158     -401.53024266  -40.23923259  -36.72659516  -3.63379267  -3.36859321  2.00174105  -0.03894397  -0.17774425  -1.11594944  -0.17774425  -0.00114933  -0.00327314  -0.00114933
MB08-159     -569.50481493  -48.60582912  -44.51309657  -4.15817657  -3.66088900  2.17005461  -0.03395373  -0.16270199  -1.02065947  -0.16270199  -0.00065238  -0.00205674  -0.00065238
MB08-160     -1183.27535908  -79.36347247  -73.14230980  -6.22093327  -5.15706114  3.02361722  -0.03375244  -0.24250351  -1.36116016  -0.24250351  -0.00104625  -0.00296096  -0.00104625
MB08-161     -528.88083199  -42.32693349  -38.80403068  -3.62043146  -3.23970389  1.92993911  -0.03179885  -0.16469726  -1.02691912  -0.16469726  -0.00059240  -0.00162204  -0.00059240
MB08-162     -302.67357795  -27.52287235  -25.11422191  -2.42731744  -2.26062101  1.36565150  -0.02047793  -0.09381211  -0.66591348  -0.09381211  -0.00061980  -0.00196444  -0.00061980
MB08-163     -505.45413758  -44.97407289  -41.16190082  -3.91582904  -3.59362459  2.12392516  -0.03821775  -0.19228503  -1.16635835  -0.19228503  -0.00096130  -0.00252276  -0.00096130
MB08-164     -148.40168190  -21.69922828  -19.65444139  -2.16517294  -2.18596920  1.32309148  -0.03000487  -0.11731267  -0.80947292  -0.11731267  -0.00036079  -0.00101724  -0.00036079
MB08-165     -171.00963327  -26.59626075  -24.02896180  -2.70537533  -2.69588904  1.63458263  -0.03489472  -0.14846204  -0.99481175  -0.14846204  -0.00098819  -0.00278887  -0.00098819
MB08-166_h   -0.47805604  -0.65399507  -0.56415043  -0.08913718  -0.13003514  0.09188638  -0.00092667  0.00000000  -0.04153364  0.00000000  0.00000000  -0.00003523  0.00000000
MB08-167_li  -5.84910514  -2.13540062  -1.84885748  -0.28369929  -0.29087374  0.20232539  -0.00229291  -0.00032379  -0.07630606  -0.00032379  -0.00000274  -0.00022035  -0.00000274
MB08-168_be  -12.33499899  -3.43323762  -2.98803302  -0.42985620  -0.44273221  0.29770021  -0.00310642  -0.00204612  -0.11986231  -0.00204612  -0.00003604  -0.00026609  -0.00003604
MB08-169_b   -21.48331669  -4.91057356  -4.32802773  -0.56472749  -0.60708676  0.39318897  -0.00500551  -0.00999737  -0.17911420  -0.00999737  -0.00007624  -0.00030400  -0.00007624
MB08-170_c   -33.63234829  -6.57249725  -5.88717437  -0.68540636  -0.78173674  0.48743714  -0.00710469  -0.02824118  -0.25943333  -0.02824118  -0.00011041  -0.00036259  -0.00011041
MB08-171_n   -95.86952674  -13.09643677  -11.86569310  -1.33590121  -1.21953613  0.73591838  -0.01353217  -0.07902685  -0.50168865  -0.07902685  -0.00014018  -0.00038806  -0.00014018
MB08-172_o   -133.35147303  -16.29683953  -14.85397398  -1.59971293  -1.42337782  0.85225706  -0.01778151  -0.08767472  -0.53028908  -0.12726482  -0.00005306  -0.00024583  -0.00017950
MB08-173_f   -178.82577402  -19.89741954  -18.19049605  -1.89187902  -1.65923939  0.98428479  -0.02027838  -0.09887076  -0.63834354  -0.09887076  -0.00003714  -0.00018812  -0.00003714
MB08-174_na  -148.04801684  -14.32337015  -13.06811964  -1.28743756  -1.10506896  0.66329861  -0.01099538  -0.04247953  -0.27006270  -0.04247953  -0.00002371  -0.00043181  -0.00002371
MB08-175_mg  -184.02868590  -16.69424517  -15.23458483  -1.47158111  -1.27116491  0.76553021  -0.00980874  -0.04219357  -0.30172110  -0.04219357  -0.00006506  -0.00048831  -0.00006506
MB08-176_al  -224.46944959  -19.16096880  -17.50314058  -1.65106309  -1.44213495  0.86807359  -0.01103506  -0.04835681  -0.35165460  -0.04835681  -0.00013667  -0.00064051  -0.00013667
MB08-177_si  -269.52236800  -21.72363104  -19.88560606  -1.81951050  -1.61850471  0.96942787  -0.01292340  -0.05821079  -0.40803113  -0.05821079  -0.00024197  -0.00084105  -0.00024197
MB08-178_p   -636.29475461  -45.16597737  -41.60824189  -3.60915197  -2.91133097  1.69669287  -0.01985410  -0.15520441  -0.81856055  -0.15520441  -0.00135104  -0.00388443  -0.00135104
MB08-179_s   -745.06412343  -49.99898089  -46.12626657  -3.91279765  -3.12657250  1.82010089  -0.02084851  -0.16787923  -0.82482861  -0.16899612  -0.00073724  -0.00239703  -0.00120544
MB08-180_cl  -863.94051407  -55.02331808  -50.81718160  -4.22675298  -3.36465697  1.95133970  -0.02088103  -0.17007628  -0.89386759  -0.17007628  -0.00052186  -0.00155514  -0.00052186
# W4 :: 111
W4-alcl3   -1519.72899867  -100.93337347  -93.06919421  -7.84549642  -6.30929934  3.65916047  -0.03884750  -0.31398671  -1.61236317  -0.31398671  -0.00114551  -0.00298124  -0.00114551
W4-alcl    -655.80745391  -45.67534502  -42.04842529  -3.63790206  -2.92446048  1.70579522  -0.01817675  -0.13798710  -0.74092823  -0.13798710  -0.00051829  -0.00176539  -0.00051829
W4-al      -223.79423147  -18.07220490  -16.54923506  -1.53467066  -1.22396862  0.72872604  -0.00653348  -0.04993406  -0.28393330  -0.04459851  -0.00025783  -0.00090741  -0.00001109
W4-alf3    -492.06740601  -48.48384795  -44.33629665  -4.34693344  -3.76477108  2.21287846  -0.04742456  -0.21007796  -1.18556846  -0.21007796  -0.00017021  -0.00045775  -0.00017021
W4-alf     -313.23234721  -28.21726929  -25.82851076  -2.46771093  -2.07783601  1.22268098  -0.02098149  -0.10317641  -0.59672793  -0.10317641  -0.00015049  -0.00082920  -0.00015049
W4-alh3    -224.46208213  -19.16876503  -17.51003195  -1.65126322  -1.44269550  0.86822514  -0.01097142  -0.04838750  -0.35148500  -0.04838750  -0.00013547  -0.00062974  -0.00013547
W4-alh     -224.02403667  -18.42487291  -16.86158762  -1.57396001  -1.30215701  0.77597607  -0.00816191  -0.04765523  -0.31926734  -0.04765523  -0.00011625  -0.00096736  -0.00011625
W4-b2      -41.54567845  -7.53236857  -6.70417795  -0.88577618  -0.78066552  0.50955706  -0.01104464  -0.07485206  -0.32788513  -0.00844912  -0.00131039  -0.00312904  -0.00009457
W4-b2h6    -42.94122219  -9.87914923  -8.77462270  -1.07438090  -1.22758348  0.77547781  -0.01227554  -0.03413940  -0.38532672  -0.03413940  -0.00036297  -0.00104151  -0.00036297
W4-b       -20.76330091  -3.76523125  -3.29760185  -0.46332109  -0.38254427  0.25664887  -0.00193152  -0.00644491  -0.10892006  -0.00067706  -0.00005420  -0.00026417  -0.00000051
W4-be2     -23.78176153  -5.34519998  -4.66964497  -0.67892927  -0.60331184  0.40631362  -0.00545240  -0.00622672  -0.20276172  -0.00622672  -0.00028982  -0.00336647  -0.00028982
W4-becl2   -875.87106594  -57.93455841  -53.35872762  -4.55908174  -3.68679581  2.15800104  -0.02236705  -0.17903182  -0.96055229  -0.17903182  -0.00058404  -0.00158791  -0.00058404
W4-be      -11.90161367  -2.66925722  -2.31662729  -0.34548650  -0.29865863  0.20353282  -0.00076928  -0.00056396  -0.09210284  -0.00056396  -0.00000178  -0.00069063  -0.00000178
W4-bef2    -190.74570718  -22.99364417  -20.89783081  -2.22228221  -1.99261126  1.19322387  -0.02771511  -0.11055310  -0.67551808  -0.11055310  -0.00007896  -0.00022674  -0.00007896
W4-bf2h    -199.89726727  -24.42477129  -22.19898639  -2.34336452  -2.15171620  1.28406251  -0.03028836  -0.11616839  -0.72739474  -0.11616839  -0.00013226  -0.00036485  -0.00013226
W4-bf3     -289.08860288  -34.19405606  -31.13951378  -3.23257155  -2.92432390  1.72992381  -0.03986173  -0.16735552  -0.99499758  -0.16735552  -0.00015182  -0.00039330  -0.00015182
W4-bf      -110.26249082  -13.87545627  -12.56054344  -1.38475888  -1.23461870  0.74798391  -0.01733815  -0.06184578  -0.42539909  -0.06184578  -0.00009295  -0.00037043  -0.00009295
W4-bh3     -21.47453072  -4.91963206  -4.33610719  -0.56507792  -0.60769288  0.39338014  -0.00496355  -0.01002139  -0.17882908  -0.01002139  -0.00007532  -0.00029833  -0.00007532
W4-bh      -20.99892717  -4.12659867  -3.62299957  -0.49987994  -0.46220309  0.30393848  -0.00347450  -0.00484017  -0.14841005  -0.00484017  -0.00003779  -0.00033823  -0.00003779
W4-bn_S    -68.63973693  -10.24667915  -9.27256688  -1.10895895  -1.00949694  0.62249674  -0.02631940  -0.08671872  -0.57295682  -0.08671872  -0.00044126  -0.00189645  -0.00044126
W4-bn_T    -68.61370414  -10.38259254  -9.32143956  -1.12160722  -0.99122215  0.62344888  -0.01576281  -0.07045831  -0.35033671  -0.02936992  -0.00028443  -0.00060129  -0.00009867
W4-c2      -65.34067100  -10.04179512  -9.08087883  -1.09869926  -1.00246917  0.61940805  -0.01727004  -0.08686236  -0.60856422  -0.08686236  -0.00052048  -0.00227518  -0.00052048
W4-c2h2    -65.85602039  -10.97955520  -9.87743034  -1.15137099  -1.15166687  0.70671747  -0.01202732  -0.05986066  -0.43690049  -0.05986066  -0.00028096  -0.00081998  -0.00028096
W4-c2h4    -66.30807572  -11.74064838  -10.55107263  -1.21490672  -1.29314212  0.79435364  -0.01324951  -0.05644885  -0.45582833  -0.05644885  -0.00029354  -0.00088387  -0.00029354
W4-c2h6    -66.74497351  -12.49879264  -11.22250231  -1.27674235  -1.43470136  0.88204125  -0.01388194  -0.05789919  -0.48337052  -0.05789919  -0.00031517  -0.00088835  -0.00031517
W4-c2h     -65.51097186  -10.63803284  -9.53497261  -1.13812035  -1.07294037  0.66522079  -0.01059381  -0.06295099  -0.36381113  -0.02845086  -0.00026958  -0.00055906  -0.00012405
W4-ccl2    -896.62959490  -60.13038255  -55.43175366  -4.75525290  -3.87258592  2.25732833  -0.03660882  -0.20643270  -1.10072855  -0.20643270  -0.00092424  -0.00247262  -0.00092424
W4-c       -32.62137433  -5.06547531  -4.48380116  -0.58018981  -0.47031187  0.31115067  -0.00308389  -0.02057471  -0.12141320  -0.00072869  -0.00004560  -0.00011583  -0.00000018
W4-cf2     -211.53486002  -25.18192128  -22.94048124  -2.41042573  -2.17415109  1.29003039  -0.03708144  -0.12864058  -0.78012123  -0.12864058  -0.00015389  -0.00041869  -0.00015389
W4-cf      -122.08915226  -15.11319103  -13.70635260  -1.49821195  -1.32588078  0.80117237  -0.02151649  -0.07344780  -0.45755356  -0.06801625  -0.00009129  -0.00025405  -0.00007619
W4-ch2c    -65.84152443  -10.93639159  -9.81700917  -1.16166790  -1.14708974  0.70744715  -0.01438233  -0.05091357  -0.41404209  -0.05091357  -0.00026720  -0.00078129  -0.00026720
W4-ch2ch   -66.04149119  -11.35816314  -10.20154577  -1.18839090  -1.21178074  0.74969042  -0.01370249  -0.06118479  -0.41711150  -0.04651069  -0.00030758  -0.00081330  -0.00023931
W4-ch2     -33.07515455  -5.85494427  -5.21899303  -0.63402879  -0.61431935  0.40007823  -0.00494880  -0.03775633  -0.16715851  -0.00416142  -0.00011386  -0.00017771  -0.00001327
W4-ch2nh2  -81.42019179  -13.19293219  -11.90289172  -1.33172151  -1.39222072  0.84958285  -0.01582110  -0.07321712  -0.47929788  -0.06023636  -0.00026456  -0.00068147  -0.00022525
W4-ch2nh   -81.25322082  -12.79790262  -11.55539264  -1.30336383  -1.32781459  0.80803473  -0.01535367  -0.06722434  -0.49250912  -0.06722434  -0.00023867  -0.00071119  -0.00023867
W4-ch2o    -99.83109548  -14.06215543  -12.74198631  -1.40783333  -1.36722992  0.82638297  -0.01883835  -0.07516025  -0.51318584  -0.07516025  -0.00016211  -0.00048933  -0.00016211
W4-ch3     -33.35429722  -6.21587768  -5.55167824  -0.66269972  -0.70157575  0.44382688  -0.00585516  -0.03404492  -0.21527086  -0.01278875  -0.00011664  -0.00025919  -0.00004610
W4-ch3nh2  -81.66955982  -13.56791961  -12.23975770  -1.36133860  -1.46984480  0.89465491  -0.01530619  -0.06827085  -0.51425641  -0.06827085  -0.00026281  -0.00075063  -0.00026281
W4-ch3nh   -81.43413883  -13.17774334  -11.86959822  -1.34289474  -1.38912369  0.85106451  -0.01684058  -0.07089462  -0.46873322  -0.05257142  -0.00024173  -0.00067298  -0.00022693
W4-ch4     -33.61996753  -6.58542267  -5.89864908  -0.68569219  -0.78252356  0.48768268  -0.00702998  -0.02824112  -0.25872598  -0.02824112  -0.00010880  -0.00035540  -0.00010880
W4-ch      -32.86261575  -5.41266970  -4.80324522  -0.61527985  -0.55453885  0.35739464  -0.00469554  -0.01925454  -0.16820395  -0.00554372  -0.00005562  -0.00018451  -0.00001767
W4-cl2     -863.93870006  -55.02544219  -50.81909606  -4.22650995  -3.36479499  1.95132903  -0.02086491  -0.17009324  -0.89349032  -0.17009324  -0.00052121  -0.00154869  -0.00052121
W4-cl2o    -930.55207387  -63.17679398  -58.28082226  -5.00967704  -4.08734646  2.37489140  -0.03585099  -0.22323611  -1.20604103  -0.22323611  -0.00066835  -0.00188347  -0.00066835
W4-clcn    -512.56085441  -39.23681188  -36.02790739  -3.30516538  -2.80572419  1.65048332  -0.02653549  -0.16071700  -0.90784669  -0.16071700  -0.00054676  -0.00150976  -0.00054676
W4-cl      -431.95286969  -27.51673592  -25.37185042  -2.13691877  -1.66967393  0.97840219  -0.00854831  -0.08667092  -0.41161171  -0.06652895  -0.00015017  -0.00035019  -0.00008031
W4-clf     -521.35241125  -37.51855546  -34.55523163  -3.05605828  -2.51510079  1.46787799  -0.02318073  -0.13465667  -0.75276545  -0.13465667  -0.00019851  -0.00062102  -0.00019851
W4-clo     -498.59427380  -35.67154988  -32.84608256  -2.91707837  -2.39613700  1.40259992  -0.02496392  -0.13318837  -0.72012512  -0.13559098  -0.00023357  -0.00081957  -0.00034740
W4-cloo    -565.31112388  -43.74822622  -40.24514910  -3.70820664  -3.10665214  1.82591804  -0.05194139  -0.17446515  -1.02118610  -0.21816495  -0.00037190  -0.00156756  -0.00059008
W4-cn      -80.58581939  -11.61275587  -10.50187150  -1.21925739  -1.10423550  0.67654249  -0.01915078  -0.07488274  -0.48102431  -0.07955210  -0.00019656  -0.00072848  -0.00025871
W4-co2     -166.08681742  -21.58802465  -19.64521395  -2.11802163  -1.95610621  1.16447744  -0.03308666  -0.13091983  -0.76918426  -0.13091983  -0.00023731  -0.00068995  -0.00023731
W4-co      -99.45631788  -13.30642579  -12.05166840  -1.34869136  -1.22407991  0.73911737  -0.01648023  -0.07347972  -0.47474961  -0.07347972  -0.00012454  -0.00034453  -0.00012454
W4-cs2     -777.77916828  -55.15152017  -50.80342866  -4.43349427  -3.64982773  2.12876676  -0.03181709  -0.20668246  -1.07982334  -0.20668246  -0.00149331  -0.00434080  -0.00149331
W4-cs      -405.26433209  -30.06639262  -27.61827825  -2.50655794  -2.07030510  1.22131558  -0.01942080  -0.11439146  -0.64506845  -0.11439146  -0.00056028  -0.00157224  -0.00056028
W4-f2      -178.81522632  -19.91098617  -18.20127628  -1.89047677  -1.65984978  0.98419788  -0.02005147  -0.09845281  -0.63193082  -0.09845281  -0.00003660  -0.00017785  -0.00003660
W4-f2o     -245.47592926  -28.03749086  -25.64376470  -2.67321405  -2.38075330  1.40760924  -0.03906030  -0.15201542  -0.93790341  -0.15201542  -0.00012657  -0.00043949  -0.00012657
W4-f       -89.38890704  -10.00641205  -9.06942612  -0.97343212  -0.81668281  0.49540208  -0.00768670  -0.04707123  -0.23597065  -0.02358331  -0.00000588  -0.00001796  -0.00000381
W4-fo2     -222.76428989  -26.17436658  -23.95626961  -2.53083870  -2.26141247  1.34220762  -0.04448061  -0.15328313  -0.95808973  -0.18444427  -0.00016126  -0.00080895  -0.00028138
W4-foof    -312.17237018  -36.08663954  -33.06900360  -3.45570886  -3.10051375  1.83110073  -0.06367838  -0.22352972  -1.33663351  -0.22352972  -0.00031711  -0.00112643  -0.00031711
W4-h2cn    -81.02648597  -12.41660781  -11.19579211  -1.28200467  -1.24777045  0.76383061  -0.01630030  -0.06967619  -0.44795006  -0.05496291  -0.00021094  -0.00061723  -0.00020993
W4-h2      -0.48776053  -0.64277491  -0.55500955  -0.08798043  -0.12931586  0.09144087  -0.00097168  0.00000000  -0.04211009  0.00000000  0.00000000  -0.00003854  0.00000000
W4-h2o2    -133.75419021  -17.06016414  -15.54654744  -1.65681066  -1.57851746  0.94199172  -0.01946422  -0.09422832  -0.60821125  -0.09422832  -0.00011325  -0.00037935  -0.00011325
W4-h2o     -67.12328053  -8.92623954  -8.11245340  -0.86926196  -0.85776545  0.51741458  -0.00912610  -0.04765648  -0.30966408  -0.04765648  -0.00003944  -0.00013991  -0.00003944
W4-h2s     -372.99986305  -25.69989751  -23.67053061  -2.02969708  -1.70252893  1.00013406  -0.01048835  -0.07858579  -0.44922497  -0.07858579  -0.00025326  -0.00079532  -0.00025326
W4-hcl     -432.22001098  -27.87205644  -25.71530826  -2.15422265  -1.74854922  1.02124424  -0.00938142  -0.08459618  -0.45533234  -0.08459618  -0.00017128  -0.00051603  -0.00017128
W4-hcn     -80.85197102  -12.04051174  -10.87753189  -1.24449641  -1.18623024  0.72158851  -0.01375631  -0.07058523  -0.47472249  -0.07058523  -0.00020446  -0.00058757  -0.00020446
W4-hco     -99.60523009  -13.66746329  -12.38802609  -1.37798468  -1.28867412  0.78043214  -0.01885685  -0.07506841  -0.48600126  -0.07785884  -0.00015048  -0.00043708  -0.00015276
W4-h       -0.19120627  -0.30821881  -0.26483415  -0.04163629  -0.03979738  0.03979738  -0.00043702  0.00000000  0.00000000  0.00000000  0.00000000  0.00000000  0.00000000
W4-hf      -89.65392060  -10.39447155  -9.47664502  -0.98202210  -0.90075229  0.53854777  -0.01001490  -0.05075426  -0.30900166  -0.05075426  -0.00001451  -0.00005311  -0.00001451
W4-hno     -114.76932895  -15.04694743  -13.68558035  -1.49630163  -1.39801287  0.83890857  -0.01889335  -0.08621412  -0.56480935  -0.08621412  -0.00013510  -0.00041548  -0.00013510
W4-hocl    -498.83174107  -36.06040489  -33.19984224  -2.94010392  -2.47278642  1.44653873  -0.02076321  -0.13307569  -0.75119804  -0.13307569  -0.00027981  -0.00084549  -0.00027981
W4-hof     -156.28877003  -18.49072548  -16.87751584  -1.77437635  -1.61934086  0.96328643  -0.02091152  -0.09623998  -0.61716634  -0.09623998  -0.00006785  -0.00026218  -0.00006785
W4-hoo     -133.53028194  -16.67628782  -15.19132582  -1.63178060  -1.50110335  0.89758353  -0.02286369  -0.09100836  -0.56584888  -0.09679521  -0.00008039  -0.00031405  -0.00013502
W4-hs      -372.74400550  -25.34698136  -23.33726652  -2.00821892  -1.62414174  0.95686151  -0.00940252  -0.08250440  -0.40810584  -0.06314341  -0.00025774  -0.00060571  -0.00012500
W4-n2      -95.86427335  -13.10272082  -11.87085782  -1.33576583  -1.21980692  0.73597072  -0.01345635  -0.07860472  -0.49969582  -0.07860472  -0.00013858  -0.00038305  -0.00013858
W4-n2h2    -96.19928838  -13.82183707  -12.53099050  -1.39162291  -1.36053584  0.82112973  -0.01610551  -0.07744993  -0.53397807  -0.07744993  -0.00019200  -0.00057592  -0.00019200
W4-n2h4    -96.59060760  -14.61749675  -13.24165343  -1.44561847  -1.50401580  0.90695898  -0.01628352  -0.07863624  -0.54724937  -0.07863624  -0.00022154  -0.00063559  -0.00022154
W4-n2h     -95.99167737  -13.45327052  -12.19309481  -1.36476275  -1.28371088  0.77634708  -0.01714128  -0.07829637  -0.49779777  -0.07717867  -0.00016920  -0.00050205  -0.00018170
W4-n2o     -162.44032662  -21.27491971  -19.39567266  -2.10100026  -1.94691467  1.15905596  -0.03432326  -0.14553288  -0.83644072  -0.14553288  -0.00038910  -0.00117428  -0.00038910
W4-nccn    -161.21551287  -23.39892498  -21.18823536  -2.39502638  -2.24283836  1.35042903  -0.03056541  -0.14848238  -0.92935193  -0.14848238  -0.00061064  -0.00179992  -0.00061064
W4-n       -47.80676342  -6.58844454  -5.89213339  -0.69500165  -0.56021181  0.36781508  -0.00389075  -0.04360432  -0.12975643  -0.00076501  -0.00003030  -0.00005568  -0.00000007
W4-nh2     -48.30258700  -7.27591905  -6.54801187  -0.75332388  -0.73587093  0.45700619  -0.00705798  -0.04254670  -0.23962058  -0.01905948  -0.00006333  -0.00018075  -0.00003385
W4-nh3     -48.55172916  -7.65927316  -6.92106889  -0.76853523  -0.81796137  0.50002065  -0.00792181  -0.03955245  -0.28997737  -0.03955245  -0.00007566  -0.00025703  -0.00007566
W4-nh      -48.05484492  -6.91885069  -6.20461624  -0.72988322  -0.64978618  0.41298908  -0.00582637  -0.04393817  -0.18518256  -0.00612502  -0.00004742  -0.00011232  -0.00000951
W4-no2     -181.20626001  -22.86493211  -20.87680438  -2.23593711  -2.04982541  1.21754164  -0.03618707  -0.14425531  -0.86231080  -0.16487369  -0.00024633  -0.00089589  -0.00037352
W4-no      -114.56886938  -14.70759312  -13.36511404  -1.46879064  -1.32264036  0.79453512  -0.01761570  -0.08180033  -0.51790495  -0.08941464  -0.00009161  -0.00029864  -0.00012409
W4-o2      -133.33952594  -16.31172880  -14.86577272  -1.59881451  -1.42401653  0.85230949  -0.01756061  -0.08750280  -0.52572556  -0.12398094  -0.00005263  -0.00023684  -0.00016983
W4-o3      -199.99757137  -24.30352538  -22.26054765  -2.37450867  -2.15584157  1.27806585  -0.03552621  -0.17549202  -1.03147933  -0.17549202  -0.00035315  -0.00124718  -0.00035315
W4-oclo    -565.15201243  -43.87785675  -40.40702283  -3.67920583  -3.12799364  1.82537008  -0.04129319  -0.19456694  -1.07180405  -0.22337899  -0.00039847  -0.00141735  -0.00068325
W4-o       -66.61492200  -8.18893679  -7.37011649  -0.83765673  -0.68765628  0.43017794  -0.00576307  -0.04538343  -0.18310823  -0.00756734  -0.00001265  -0.00003124  -0.00000384
W4-ocs     -471.94080364  -38.36419965  -35.21775551  -3.27632074  -2.80241800  1.64653376  -0.03299728  -0.16791229  -0.92290075  -0.16791229  -0.00070290  -0.00202097  -0.00070290
W4-of      -156.05832006  -18.10040450  -16.50679992  -1.75331634  -1.53948939  0.91895761  -0.02891266  -0.09282513  -0.57017691  -0.09630915  -0.00004587  -0.00020666  -0.00007933
W4-oh      -66.87019091  -8.54068192  -7.72377647  -0.85785355  -0.77476356  0.47443213  -0.00787286  -0.04742304  -0.24757930  -0.02311213  -0.00002501  -0.00007810  -0.00001565
W4-p2      -636.28601096  -45.17645777  -41.61688219  -3.60874260  -2.91193843  1.69677522  -0.01972209  -0.15448885  -0.81502481  -0.15448885  -0.00131050  -0.00375687  -0.00131050
W4-p4      -1272.46621901  -90.52429307  -83.44226351  -7.14461354  -5.84917232  3.38472844  -0.04081572  -0.32153448  -1.60715539  -0.32153448  -0.00415767  -0.01064710  -0.00415767
W4-p       -318.07908131  -22.62528265  -20.79316984  -1.82692192  -1.41715428  0.84979107  -0.00662228  -0.08359643  -0.32268595  -0.04584095  -0.00042973  -0.00044552  -0.00000317
W4-ph3     -318.81954402  -23.65404823  -21.73132958  -1.91801051  -1.65933660  0.98273757  -0.01179310  -0.06950684  -0.43401665  -0.06950684  -0.00029731  -0.00098706  -0.00029731
W4-s2      -745.05730182  -50.00723015  -46.13325675  -3.91226815  -3.12703468  1.82012788  -0.02075453  -0.16798787  -0.82343285  -0.16778113  -0.00073592  -0.00235466  -0.00116115
W4-s2o     -811.68074280  -58.21403220  -53.67400650  -4.68365295  -3.86618464  2.24638988  -0.03937290  -0.23002396  -1.19493617  -0.23002396  -0.00119421  -0.00339085  -0.00119421
W4-s3      -1117.55974574  -74.99408351  -69.24315514  -5.84121191  -4.71178797  2.72893560  -0.03633210  -0.26262483  -1.33461369  -0.26262483  -0.00219437  -0.00645602  -0.00219437
W4-s4      -1490.08422012  -99.97449301  -92.34414914  -7.77023282  -6.28572919  3.63454944  -0.04619146  -0.36650552  -1.82179943  -0.36650552  -0.00430149  -0.01196703  -0.00430149
W4-s       -372.48765905  -25.00763836  -23.01854248  -1.98331700  -1.54305554  0.91316046  -0.00783990  -0.08533035  -0.36775788  -0.05265933  -0.00024529  -0.00042287  -0.00004555
W4-si2h6   -538.53523843  -42.80780517  -39.23399726  -3.54169921  -3.10955442  1.84620920  -0.02487157  -0.12138490  -0.78523171  -0.12138490  -0.00074789  -0.00223333  -0.00074789
W4-si      -268.56216238  -20.28182616  -18.60597098  -1.68085391  -1.31968335  0.78850779  -0.00722204  -0.06356023  -0.30512838  -0.04568955  -0.00040175  -0.00063753  -0.00000572
W4-sif     -358.01227710  -30.37823499  -27.84590386  -2.61187858  -2.17349655  1.28053473  -0.02363298  -0.11233852  -0.62252700  -0.10715451  -0.00027136  -0.00072488  -0.00012722
W4-sih4    -269.50247214  -21.74453635  -19.90402923  -1.82009644  -1.61990334  0.96983207  -0.01278799  -0.05828160  -0.40746492  -0.05828160  -0.00023704  -0.00081434  -0.00023704
W4-sih     -268.80254284  -20.62262278  -18.91036472  -1.71748925  -1.39990437  0.83425028  -0.00899690  -0.06012000  -0.34108135  -0.04920229  -0.00031306  -0.00080593  -0.00006906
W4-sio     -335.29905597  -28.51909472  -26.15545264  -2.46428874  -2.07030786  1.21726721  -0.02608757  -0.11901802  -0.66258475  -0.11901802  -0.00033829  -0.00097521  -0.00033829
W4-so2     -505.80682241  -41.45379154  -38.11371141  -3.52583888  -3.02084100  1.76398441  -0.03872595  -0.19379951  -1.04202422  -0.19379951  -0.00047225  -0.00126901  -0.00047225
W4-so3     -572.37618838  -49.72880392  -45.68179019  -4.29743616  -3.75146352  2.18901325  -0.05509186  -0.24655658  -1.32653748  -0.24655658  -0.00056654  -0.00154930  -0.00056654
W4-so      -439.17043383  -33.20822858  -30.54535997  -2.75720731  -2.27803176  1.33705594  -0.02177923  -0.12960006  -0.68359593  -0.14194998  -0.00028144  -0.00085536  -0.00038824
W4-ssh     -745.26611631  -50.37047311  -46.45368835  -3.94174711  -3.20214789  1.86463756  -0.02314743  -0.16483958  -0.84648070  -0.15804138  -0.00077338  -0.00229688  -0.00088315
# SIE :: 29
SIE-aceton+    -166.09146177  -25.59091544  -23.11311262  -2.57622094  -2.60079341  1.57671982  -0.04065928  -0.13225239  -0.91601098  -0.13298910  -0.00056428  -0.00163791  -0.00071930
SIE-acetyl     -132.78119323  -19.30718711  -17.46568261  -1.95084853  -1.88447581  1.14104516  -0.02750595  -0.10559241  -0.70834742  -0.10559241  -0.00030625  -0.00084251  -0.00030625
SIE-but+       -132.97843702  -23.97877842  -21.56827199  -2.44478538  -2.66980532  1.63283818  -0.03155749  -0.12110569  -0.91629027  -0.11581287  -0.00083101  -0.00240692  -0.00103720
SIE-bz         -197.48581208  -33.25102820  -29.98923020  -3.34972612  -3.49232660  2.10225587  -0.03671298  -0.18911382  -1.25740859  -0.18911382  -0.00193771  -0.00436469  -0.00193771
SIE-bz_li      -203.01161216  -35.13166666  -31.64856916  -3.56301876  -3.72737950  2.25413382  -0.04106140  -0.20416410  -1.32156814  -0.18838489  -0.00213222  -0.00505886  -0.00211734
SIE-c2h4       -66.30590765  -11.74291123  -10.55306647  -1.21494258  -1.29327488  0.79439151  -0.01323328  -0.05643454  -0.45564475  -0.05643454  -0.00029296  -0.00088191  -0.00029296
SIE-c2h4_f2    -245.12586494  -31.64359597  -28.75471652  -3.10169360  -2.95370095  1.77721016  -0.03958157  -0.15714172  -1.09474563  -0.15714172  -0.00040103  -0.00124795  -0.00040103
SIE-ch3        -33.35108296  -6.21917833  -5.55457148  -0.66280485  -0.70177724  0.44389565  -0.00583898  -0.03403060  -0.21510180  -0.01278888  -0.00011616  -0.00025764  -0.00004588
SIE-clclf      -953.32509382  -65.00450557  -59.91165280  -5.18686606  -4.18536973  2.44374649  -0.03973377  -0.22322766  -1.17844709  -0.20556773  -0.00046963  -0.00125112  -0.00040056
SIE-clfcl      -953.35631882  -64.91798308  -59.92153197  -5.16495999  -4.19250338  2.43951540  -0.05096813  -0.23298064  -1.25540216  -0.24637190  -0.00065156  -0.00289872  -0.00119281
SIE-clf        -521.35770995  -37.51247901  -34.55006445  -3.05663658  -2.51479047  1.46790480  -0.02327665  -0.13477485  -0.75435127  -0.13477485  -0.00019970  -0.00062837  -0.00019970
SIE-ethyl      -66.48199545  -12.12939111  -10.88119068  -1.25177819  -1.35514511  0.83794489  -0.01375767  -0.06355511  -0.44173114  -0.04457218  -0.00032884  -0.00078254  -0.00023527
SIE-ethyl+     -66.49138569  -11.83637552  -10.61917091  -1.22928791  -1.29997235  0.80193651  -0.01343584  -0.05104267  -0.43871583  -0.05104267  -0.00023997  -0.00068795  -0.00023997
SIE-f2         -178.81964226  -19.90540395  -18.19682964  -1.89105091  -1.65959894  0.98423250  -0.02014443  -0.09862367  -0.63451638  -0.09862367  -0.00003682  -0.00018194  -0.00003682
SIE-h2o2+      -134.21780936  -17.50145423  -15.93257630  -1.71064154  -1.64663851  0.99196931  -0.01971037  -0.09302065  -0.59804187  -0.09510744  -0.00010799  -0.00038079  -0.00014710
SIE-h2o        -67.12409673  -8.92533275  -8.11170094  -0.86925587  -0.85772156  0.51739972  -0.00913547  -0.04767767  -0.30980835  -0.04767767  -0.00003951  -0.00014024  -0.00003951
SIE-h2o+       -67.03114853  -8.61597905  -7.78466586  -0.86611485  -0.77933608  0.47969748  -0.00692628  -0.04456754  -0.24525213  -0.02114930  -0.00002499  -0.00007179  -0.00001491
SIE-he2+       -3.34452716  -1.58099772  -1.39782219  -0.22161124  -0.21914433  0.15537811  -0.00389800  -0.00086143  -0.05350167  0.00000000  -0.00000123  -0.00001133  0.00000000
SIE-he         -1.84240056  -1.01649219  -0.87763046  -0.14148003  -0.14969531  0.10595107  -0.00138221  0.00000000  -0.03749550  0.00000000  0.00000000  -0.00000493  0.00000000
SIE-he+        -1.37881511  -0.61906588  -0.53152369  -0.08324622  -0.04902240  0.04902240  -0.00037548  0.00000000  0.00000000  0.00000000  0.00000000  0.00000000  0.00000000
SIE-li         -5.65066623  -1.78065766  -1.53861169  -0.23727194  -0.20630448  0.15246209  -0.00051426  -0.00039780  -0.03620243  0.00000000  -0.00000757  -0.00000878  0.00000000
SIE-li_f2      -184.46645977  -21.83155371  -19.90629219  -2.14729377  -1.89389476  1.14571442  -0.02461340  -0.10127275  -0.66468817  -0.12542514  -0.00004168  -0.00033914  -0.00021876
SIE-mgo        -250.19244722  -24.16006895  -22.12516422  -2.18934484  -1.86252096  1.10259667  -0.04167902  -0.12098987  -0.69638709  -0.12098987  -0.00031175  -0.00195548  -0.00031175
SIE-na         -147.84526782  -13.99419248  -12.77641625  -1.24324916  -1.02472190  0.61521097  -0.00660157  -0.04411970  -0.22589274  -0.04082458  -0.00005400  -0.00006082  -0.00000251
SIE-naomg      -398.01773308  -38.31327863  -35.02494889  -3.41992638  -2.90242622  1.72022190  -0.04029096  -0.15320355  -0.82417220  -0.15165725  -0.00055826  -0.00109135  -0.00019826
SIE-nh32+      -97.07930570  -15.05353273  -13.61677870  -1.50911284  -1.57172489  0.95938399  -0.01683425  -0.08040448  -0.54968154  -0.07164346  -0.00019349  -0.00059814  -0.00021262
SIE-nh3_clf    -569.90588901  -45.17356592  -41.50773135  -3.80524283  -3.33746681  1.96290152  -0.03810835  -0.18212082  -1.06537179  -0.18212082  -0.00044963  -0.00142785  -0.00044963
SIE-nh3        -48.55071595  -7.66038491  -6.92202136  -0.76853810  -0.81801973  0.50003677  -0.00791166  -0.03953873  -0.28983558  -0.03953873  -0.00007554  -0.00025638  -0.00007554
SIE-nh3+       -48.48845253  -7.40632026  -6.65396984  -0.76387164  -0.74360230  0.46396794  -0.00589463  -0.03872406  -0.23004590  -0.01630192  -0.00004913  -0.00012081  -0.00002443
# O3ADD :: 9
O3ADD-c2h2         -65.84945915  -10.98689793  -9.88371797  -1.15128644  -1.15204731  0.70679981  -0.01194414  -0.05952275  -0.43510695  -0.05952275  -0.00027676  -0.00080602  -0.00027676
O3ADD-c2h4         -66.30276658  -11.74633304  -10.55624031  -1.21469623  -1.29346623  0.79439336  -0.01319808  -0.05634417  -0.45485915  -0.05634417  -0.00029162  -0.00087546  -0.00029162
O3ADD-o3_c2h2_add  -265.69778760  -35.58734458  -32.39868441  -3.46741893  -3.33091794  1.97410234  -0.05055089  -0.20985918  -1.30760354  -0.20985918  -0.00080196  -0.00207111  -0.00080196
O3ADD-o3_c2h2_ts   -265.75849597  -35.35530861  -32.24369506  -3.48714786  -3.31833474  1.97575850  -0.04646645  -0.23874524  -1.42683765  -0.23874524  -0.00116191  -0.00300949  -0.00116191
O3ADD-o3_c2h2_vdw  -265.78915367  -35.35911062  -32.20503291  -3.51262956  -3.31221283  1.98258858  -0.04763534  -0.23042525  -1.43057483  -0.23042525  -0.00088566  -0.00246669  -0.00088566
O3ADD-o3_c2h4_add  -266.14161843  -36.35082299  -33.06361963  -3.53143999  -3.47185773  2.06158334  -0.05041165  -0.20773630  -1.32376685  -0.20773630  -0.00078878  -0.00197793  -0.00078878
O3ADD-o3_c2h4_ts   -266.21796429  -36.11758024  -32.91404310  -3.55361916  -3.45946256  2.06399786  -0.04726562  -0.23641392  -1.45058156  -0.23641392  -0.00120013  -0.00316230  -0.00120013
O3ADD-o3_c2h4_vdw  -266.24182964  -36.11643598  -32.88027810  -3.57403281  -3.45412023  2.06957653  -0.05014905  -0.22840017  -1.45134996  -0.22840017  -0.00094211  -0.00261676  -0.00094211
O3ADD-o3           -199.94185348  -24.37186672  -22.31375894  -2.36938140  -2.15872024  1.27804307  -0.03386252  -0.16889402  -0.99333323  -0.16889402  -0.00031661  -0.00109315  -0.00031661
# DC9 :: 19
DC9-13dip         -195.12370373  -30.85191645  -27.90260022  -3.07217043  -3.18343120  1.91097607  -0.03950741  -0.17392000  -1.18226802  -0.17392000  -0.00111295  -0.00275331  -0.00111295
DC9-be4           -47.47064877  -10.86892167  -9.59309447  -1.29919617  -1.24004505  0.80779907  -0.01401924  -0.04893400  -0.45478946  -0.04893400  -0.00272065  -0.01013449  -0.00272065
DC9-be            -11.90161367  -2.66925722  -2.31662729  -0.34548650  -0.29865863  0.20353282  -0.00076928  -0.00056396  -0.09210284  -0.00056396  -0.00000178  -0.00069063  -0.00000178
DC9-c20bowl       -653.36725795  -103.34176762  -93.61510311  -10.35589161  -10.27471296  6.09875661  -0.13595833  -0.73228241  -4.21374839  -0.73228241  -0.01334581  -0.02916448  -0.01334581
DC9-c20cage       -653.07918061  -103.52523555  -93.90957102  -10.20668550  -10.30822299  6.07254089  -0.13767297  -0.76444372  -4.28698946  -0.76444372  -0.01843843  -0.04147963  -0.01843843
DC9-carbooxo1     -494.18172701  -71.00139648  -64.42126839  -7.09164888  -6.77655557  4.03595776  -0.10595514  -0.45213606  -2.72632866  -0.45213606  -0.00385608  -0.00956816  -0.00385608
DC9-carbooxo2     -494.00491370  -71.13882236  -64.58747021  -7.03854954  -6.79262651  4.03173431  -0.10992074  -0.45600893  -2.67405510  -0.45600893  -0.00364012  -0.00865140  -0.00364012
DC9-ch2n2         -128.89074638  -18.98200928  -17.21676407  -1.91262725  -1.87323582  1.12749773  -0.02461322  -0.11707609  -0.75118011  -0.11707609  -0.00050358  -0.00159416  -0.00050358
DC9-ethen         -66.30255514  -11.74654988  -10.55642292  -1.21472173  -1.29347929  0.79440190  -0.01319748  -0.05634350  -0.45485737  -0.05634350  -0.00029159  -0.00087546  -0.00029159
DC9-heptahexaene  -229.70370357  -37.51691407  -33.89306614  -3.84552541  -3.85292602  2.32756864  -0.05117717  -0.23034089  -1.48342357  -0.23034089  -0.00304133  -0.00913184  -0.00304133
DC9-heptatriyne   -229.69693121  -37.56259766  -33.90051634  -3.84803691  -3.85340305  2.32863624  -0.04924589  -0.22733145  -1.47197252  -0.22733145  -0.00209396  -0.00593180  -0.00209396
DC9-ISO_E35       -394.58749788  -66.79809971  -60.32850081  -6.54649225  -7.02574221  4.18010027  -0.07868332  -0.38958863  -2.53968734  -0.38958863  -0.00453574  -0.01020086  -0.00453574
DC9-ISO_E36       -279.06471438  -42.56049235  -38.54050585  -4.20673770  -4.25461823  2.53841645  -0.05251877  -0.25026960  -1.57095592  -0.25026960  -0.00196728  -0.00448655  -0.00196728
DC9-ISO_P35       -394.83068270  -66.54048750  -60.04972470  -6.65160362  -6.99418701  4.19408084  -0.08017887  -0.38241061  -2.55367956  -0.38241061  -0.00458889  -0.01056820  -0.00458889
DC9-ISO_P36       -279.06422146  -42.55583378  -38.54230073  -4.20903229  -4.25480258  2.53926104  -0.05659933  -0.24999411  -1.58311815  -0.24999411  -0.00186955  -0.00446879  -0.00186955
DC9-omcb          -397.56672131  -70.84320443  -63.83119900  -7.03061892  -7.82559511  4.71344615  -0.08602887  -0.38507630  -2.76635320  -0.38507630  -0.00504941  -0.01153486  -0.00504941
DC9-s2            -745.05730182  -50.00723015  -46.13325675  -3.91226815  -3.12703468  1.82012788  -0.02075453  -0.16798787  -0.82343285  -0.16778113  -0.00073592  -0.00235466  -0.00116115
DC9-s8            -2980.08541300  -200.18622930  -184.83772766  -15.49761871  -12.58880817  7.26241296  -0.10790165  -0.69554830  -3.46050384  -0.69554830  -0.00768743  -0.01849430  -0.00768743
DC9-tmethen       -198.84490138  -35.36530240  -31.84300507  -3.55792953  -3.90290383  2.36628810  -0.04258827  -0.18416988  -1.36929773  -0.18416988  -0.00167583  -0.00418431  -0.00167583
# WATER27 :: 30
WATER27-H2O20        -1342.50477328  -178.65475771  -162.68723624  -17.04462841  -17.21715125  10.25232579  -0.21325845  -1.01273463  -6.31096897  -1.01273463  -0.00361803  -0.00864400  -0.00361803
WATER27-H2O20es      -1342.49915250  -178.66726557  -162.71013716  -17.01907426  -17.22143464  10.24416286  -0.21473646  -1.01686328  -6.31957000  -1.01686328  -0.00406402  -0.00953596  -0.00406402
WATER27-H2O20fc      -1342.49948194  -178.66355548  -162.70356829  -17.01471248  -17.22156418  10.24206269  -0.21494139  -1.01686640  -6.32046186  -1.01686640  -0.00405670  -0.00951774  -0.00405670
WATER27-H2O20fs      -1342.49730776  -178.66675204  -162.70750207  -17.01787855  -17.22142530  10.24345361  -0.21445183  -1.01688545  -6.32055104  -1.01688545  -0.00410788  -0.00962222  -0.00410788
WATER27-H2O2         -134.25176473  -17.85207195  -16.23200002  -1.72980437  -1.71686327  1.03221602  -0.01900351  -0.09662967  -0.62196703  -0.09662967  -0.00011967  -0.00036576  -0.00011967
WATER27-H2O3         -201.37722234  -26.78479539  -24.36855557  -2.57895032  -2.57808646  1.54379762  -0.03014590  -0.14757715  -0.93803169  -0.14757715  -0.00026339  -0.00072468  -0.00026339
WATER27-H2O4         -268.50239525  -35.71955424  -32.50754220  -3.42995599  -3.43934334  2.05623809  -0.04088810  -0.19851255  -1.25397361  -0.19851255  -0.00040242  -0.00107573  -0.00040242
WATER27-H2O5         -335.62689896  -44.65273020  -40.63949486  -4.28558366  -4.29965248  2.56989289  -0.05109272  -0.24840415  -1.56754400  -0.24840415  -0.00052568  -0.00139020  -0.00052568
WATER27-H2O6b        -402.75239131  -53.58388627  -48.77216000  -5.13673315  -5.16056175  3.08202140  -0.06192189  -0.29919515  -1.88375192  -0.29919515  -0.00071499  -0.00183952  -0.00071499
WATER27-H2O6c2       -402.75139882  -53.58642018  -48.77066379  -5.14180246  -5.15980695  3.08364054  -0.06114602  -0.29801311  -1.88030441  -0.29801311  -0.00063446  -0.00167273  -0.00063446
WATER27-H2O6c        -402.75241041  -53.58288862  -48.77240036  -5.13275486  -5.16106173  3.08071917  -0.06226028  -0.29982261  -1.88554886  -0.29982261  -0.00078567  -0.00198212  -0.00078567
WATER27-H2O6         -402.75317800  -53.58259091  -48.77195316  -5.13133222  -5.16121676  3.08019679  -0.06237389  -0.29981084  -1.88576082  -0.29981084  -0.00080675  -0.00202283  -0.00080675
WATER27-H2O8d2d      -537.00402058  -71.45288266  -65.05632492  -6.82549038  -6.88496932  4.10261258  -0.08474455  -0.40335340  -2.52149465  -0.40335340  -0.00124087  -0.00303960  -0.00124087
WATER27-H2O8s4       -537.00320771  -71.45359240  -65.05709625  -6.82537213  -6.88503099  4.10260981  -0.08473660  -0.40336788  -2.52150523  -0.40336788  -0.00124095  -0.00304004  -0.00124095
WATER27-H2O          -67.12637062  -8.92295615  -8.10968295  -0.86919052  -0.85759471  0.51734466  -0.00915317  -0.04769417  -0.30996147  -0.04769417  -0.00003957  -0.00014049  -0.00003957
WATER27-H3Op         -67.30877897  -9.01957662  -8.18883200  -0.87647258  -0.86397544  0.52312371  -0.00764936  -0.04389875  -0.30102139  -0.04389875  -0.00003383  -0.00010983  -0.00003383
WATER27-H3OpH2O2     -201.59964447  -26.90570676  -24.47947844  -2.58165343  -2.58691990  1.54935426  -0.02813544  -0.14419440  -0.92772443  -0.14419440  -0.00021407  -0.00060425  -0.00021407
WATER27-H3OpH2O3     -268.73821877  -35.84436808  -32.61182482  -3.44010468  -3.44711197  2.06372609  -0.03794403  -0.19331576  -1.23947149  -0.19331576  -0.00032364  -0.00088724  -0.00032364
WATER27-H3OpH2O62d   -470.13157610  -62.64195486  -57.00708292  -6.00463990  -6.02843207  3.60385671  -0.06852929  -0.34363703  -2.18303791  -0.34363703  -0.00073722  -0.00191955  -0.00073722
WATER27-H3OpH2O63d   -470.13050126  -62.64128572  -57.01630497  -5.99173658  -6.03042013  3.59963371  -0.07059981  -0.34606065  -2.18942758  -0.34606065  -0.00089705  -0.00224836  -0.00089705
WATER27-H3OpH2O6OHm  -536.96750059  -71.41618061  -65.07749819  -6.79899925  -6.88759521  4.09702357  -0.08834852  -0.41282581  -2.54611528  -0.41282581  -0.00123432  -0.00307943  -0.00123432
WATER27-H3OpH2O      -134.46059035  -17.96214466  -16.33980699  -1.72574129  -1.72610591  1.03559491  -0.01812752  -0.09482151  -0.61656598  -0.09482151  -0.00011818  -0.00034935  -0.00011818
WATER27-OHm          -66.68758737  -8.71100776  -7.93900756  -0.85663694  -0.84359866  0.50760326  -0.01418412  -0.05638542  -0.33683765  -0.05638542  -0.00004233  -0.00018502  -0.00004233
WATER27-OHmH2O2      -200.97346461  -26.58767427  -24.22358976  -2.55981797  -2.56690130  1.53349474  -0.03582656  -0.15771065  -0.96655118  -0.15771065  -0.00028998  -0.00084181  -0.00028998
WATER27-OHmH2O3      -268.11128032  -35.52479620  -32.35684534  -3.41659002  -3.42747998  2.04766726  -0.04589362  -0.20740473  -1.27995005  -0.20740473  -0.00043954  -0.00120702  -0.00043954
WATER27-OHmH2O4c4    -335.24161139  -44.46545784  -40.49260816  -4.26877281  -4.28860090  2.56032218  -0.05575710  -0.25738604  -1.59323987  -0.25738604  -0.00066176  -0.00171462  -0.00066176
WATER27-OHmH2O4cs    -335.23788382  -44.46413712  -40.50338255  -4.25842990  -4.29018770  2.55733535  -0.05743220  -0.25955630  -1.59824102  -0.25955630  -0.00071151  -0.00182535  -0.00071151
WATER27-OHmH2O5      -402.36822277  -53.40090791  -48.63946657  -5.10864197  -5.15163088  3.06936837  -0.06817526  -0.31021707  -1.91389690  -0.31021707  -0.00093790  -0.00234667  -0.00093790
WATER27-OHmH2O6      -469.49841038  -62.33500637  -56.77783485  -5.95847411  -6.01313018  3.58141304  -0.07904651  -0.36151638  -2.23107123  -0.36151638  -0.00115892  -0.00286250  -0.00115892
WATER27-OHmH2O       -133.83462522  -17.64625509  -16.08572218  -1.70408903  -1.70595161  1.01963256  -0.02558500  -0.10829498  -0.65484326  -0.10829498  -0.00017587  -0.00055226  -0.00017587
