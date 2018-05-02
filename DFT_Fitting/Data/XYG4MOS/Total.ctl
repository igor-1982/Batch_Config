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
"================================ Total(744) ================================"
"There are about :                                                           " 
" 1)  223 HOFs from the G3 set                                               "
" 2)   44 HOFs from the Bond3 set                                            "
" 3)  142 BDEs from the G3+Bond3 set                                         "
" 4)  118 points in the potential energy surfaces of Bz2 PPS                 "
" 5)   76 Barrier Heights from Trulhar's set                                 "
" 6)   31 Non Bonding interactions from NCIE set                             "
" 7)   19 points in the potential energy surfaces of Bz-Methane              "
" 8)   18 points in the potential energy surfaces of Methane dimer           "

__initial guess__ ::
# For XYG4MOS
0.773066  0.226934  0.00000 0.50626  0.275376  0.00000 0.336000

# "There are several algorithms at present:                                  "
# "   0) batch           :: just batch the results based on intital guess    "
# "   1) leastsq         :: least square fit algorithm                       "
# "   2) fmin_rms        :: downhill simplex algorithm based on RMS          "
# "   3) fmin_mad        :: downhill simplex algorithm based on MAD          "
# "   4) fmin_cobyla_rms :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on RMS                            "
# "   5) fmin_cobyla_mad :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on MAD                            "
__optimization algorithm__ :: batch

__optimization job__ :: xyg3

__optimization function__ :: 23
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a1, a2, a3, a4, a5, a6, a7 = C
    #a2  = 1. - a1
    #a5  = a4
    #a6  = 0.

    E_noXC, Ex_HF, Ex_LDA, dEx_B, Ec_VWN, dEc_LYP, Ec_PT21, Ec_MOS = P
    return E_noXC + a1*Ex_HF + a2*Ex_LDA + a3*dEx_B + a4*Ec_VWN + a5* dEc_LYP \
            + a6*Ec_PT21 + a7*Ec_MOS

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
#               580 is the total number of jobs in this batch list
__batch__ ::  580
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
# Bond3 set 44
 F224           <PATH2>/Bond3                XYG3_Comp      energy
 F230           <PATH2>/Bond3                XYG3_Comp      energy
 F234           <PATH2>/Bond3                XYG3_Comp      energy
 F235           <PATH2>/Bond3                XYG3_Comp      energy
 F243           <PATH2>/Bond3                XYG3_Comp      energy
 F244           <PATH2>/Bond3                XYG3_Comp      energy
 F246           <PATH2>/Bond3                XYG3_Comp      energy
 F247           <PATH2>/Bond3                XYG3_Comp      energy
 F248           <PATH2>/Bond3                XYG3_Comp      energy
 F249           <PATH2>/Bond3                XYG3_Comp      energy
 F250           <PATH2>/Bond3                XYG3_Comp      energy
 F251           <PATH2>/Bond3                XYG3_Comp      energy
 F252           <PATH2>/Bond3                XYG3_Comp      energy
 F253           <PATH2>/Bond3                XYG3_Comp      energy
 F254           <PATH2>/Bond3                XYG3_Comp      energy
 F256           <PATH2>/Bond3                XYG3_Comp      energy
 F266           <PATH2>/Bond3                XYG3_Comp      energy
 F267           <PATH2>/Bond3                XYG3_Comp      energy
 F270           <PATH2>/Bond3                XYG3_Comp      energy
 F275           <PATH2>/Bond3                XYG3_Comp      energy
 F277           <PATH2>/Bond3                XYG3_Comp      energy
 F287           <PATH2>/Bond3                XYG3_Comp      energy
 F300           <PATH2>/Bond3                XYG3_Comp      energy
 F301           <PATH2>/Bond3                XYG3_Comp      energy
 F306           <PATH2>/Bond3                XYG3_Comp      energy
 F309           <PATH2>/Bond3                XYG3_Comp      energy
 F332           <PATH2>/Bond3                XYG3_Comp      energy
 F333           <PATH2>/Bond3                XYG3_Comp      energy
 F336           <PATH2>/Bond3                XYG3_Comp      energy
 F340           <PATH2>/Bond3                XYG3_Comp      energy
 F357           <PATH2>/Bond3                XYG3_Comp      energy
 F378           <PATH2>/Bond3                XYG3_Comp      energy
 F379           <PATH2>/Bond3                XYG3_Comp      energy
 F399           <PATH2>/Bond3                XYG3_Comp      energy
 F403           <PATH2>/Bond3                XYG3_Comp      energy
 F404           <PATH2>/Bond3                XYG3_Comp      energy
 F424           <PATH2>/Bond3                XYG3_Comp      energy
 F444           <PATH2>/Bond3                XYG3_Comp      energy
 F523           <PATH2>/Bond3                XYG3_Comp      energy
 F536           <PATH2>/Bond3                XYG3_Comp      energy
 F700           <PATH2>/Bond3                XYG3_Comp      energy
 F771           <PATH2>/Bond3                XYG3_Comp      energy
 EtONO          <PATH2>/Bond3                XYG3_Comp      energy
 cum            <PATH2>/Bond3                XYG3_Comp      energy
# PESs for Bz2 1+118=119
 C6H6           <PATH2>/G2                   XYG3_Comp      energy
#     118 points in Bz2 PESs
 s32            <PATH2>/G2                   XYG3_Comp      energy
 s33            <PATH2>/G2                   XYG3_Comp      energy
 s34            <PATH2>/G2                   XYG3_Comp      energy
 s35            <PATH2>/G2                   XYG3_Comp      energy
 s36            <PATH2>/G2                   XYG3_Comp      energy
 s37            <PATH2>/G2                   XYG3_Comp      energy
 s38            <PATH2>/G2                   XYG3_Comp      energy
 s39            <PATH2>/G2                   XYG3_Comp      energy
 s40            <PATH2>/G2                   XYG3_Comp      energy
 s41            <PATH2>/G2                   XYG3_Comp      energy
 s42            <PATH2>/G2                   XYG3_Comp      energy
 s45            <PATH2>/G2                   XYG3_Comp      energy
 s50            <PATH2>/G2                   XYG3_Comp      energy
 s55            <PATH2>/G2                   XYG3_Comp      energy
 s60            <PATH2>/G2                   XYG3_Comp      energy
 s65            <PATH2>/G2                   XYG3_Comp      energy
 t44            <PATH2>/G2                   XYG3_Comp      energy
 t45            <PATH2>/G2                   XYG3_Comp      energy
 t46            <PATH2>/G2                   XYG3_Comp      energy
 t47            <PATH2>/G2                   XYG3_Comp      energy
 t48            <PATH2>/G2                   XYG3_Comp      energy
 t49            <PATH2>/G2                   XYG3_Comp      energy
 t50            <PATH2>/G2                   XYG3_Comp      energy
 t51            <PATH2>/G2                   XYG3_Comp      energy
 t52            <PATH2>/G2                   XYG3_Comp      energy
 t53            <PATH2>/G2                   XYG3_Comp      energy
 t54            <PATH2>/G2                   XYG3_Comp      energy
 t55            <PATH2>/G2                   XYG3_Comp      energy
 t56            <PATH2>/G2                   XYG3_Comp      energy
 t59            <PATH2>/G2                   XYG3_Comp      energy
 t64            <PATH2>/G2                   XYG3_Comp      energy
 t69            <PATH2>/G2                   XYG3_Comp      energy
 t74            <PATH2>/G2                   XYG3_Comp      energy
 t79            <PATH2>/G2                   XYG3_Comp      energy
 pd32L20        <PATH2>/G2                   XYG3_Comp      energy
 pd32L18        <PATH2>/G2                   XYG3_Comp      energy
 pd32L16        <PATH2>/G2                   XYG3_Comp      energy
 pd32L14        <PATH2>/G2                   XYG3_Comp      energy
 pd32L12        <PATH2>/G2                   XYG3_Comp      energy
 pd32L10        <PATH2>/G2                   XYG3_Comp      energy
 pd32L08        <PATH2>/G2                   XYG3_Comp      energy
 pd32L06        <PATH2>/G2                   XYG3_Comp      energy
 pd32L04        <PATH2>/G2                   XYG3_Comp      energy
 pd32L02        <PATH2>/G2                   XYG3_Comp      energy
 pd32L00        <PATH2>/G2                   XYG3_Comp      energy
 pd32R02        <PATH2>/G2                   XYG3_Comp      energy
 pd32R04        <PATH2>/G2                   XYG3_Comp      energy
 pd32R06        <PATH2>/G2                   XYG3_Comp      energy
 pd32R08        <PATH2>/G2                   XYG3_Comp      energy
 pd32R10        <PATH2>/G2                   XYG3_Comp      energy
 pd32R12        <PATH2>/G2                   XYG3_Comp      energy
 pd32R14        <PATH2>/G2                   XYG3_Comp      energy
 pd32R16        <PATH2>/G2                   XYG3_Comp      energy
 pd32R18        <PATH2>/G2                   XYG3_Comp      energy
 pd32R20        <PATH2>/G2                   XYG3_Comp      energy
 pd34L20        <PATH2>/G2                   XYG3_Comp      energy
 pd34L18        <PATH2>/G2                   XYG3_Comp      energy
 pd34L16        <PATH2>/G2                   XYG3_Comp      energy
 pd34L14        <PATH2>/G2                   XYG3_Comp      energy
 pd34L12        <PATH2>/G2                   XYG3_Comp      energy
 pd34L10        <PATH2>/G2                   XYG3_Comp      energy
 pd34L08        <PATH2>/G2                   XYG3_Comp      energy
 pd34L06        <PATH2>/G2                   XYG3_Comp      energy
 pd34L04        <PATH2>/G2                   XYG3_Comp      energy
 pd34L02        <PATH2>/G2                   XYG3_Comp      energy
 pd34L00        <PATH2>/G2                   XYG3_Comp      energy
 pd34R02        <PATH2>/G2                   XYG3_Comp      energy
 pd34R04        <PATH2>/G2                   XYG3_Comp      energy
 pd34R06        <PATH2>/G2                   XYG3_Comp      energy
 pd34R08        <PATH2>/G2                   XYG3_Comp      energy
 pd34R10        <PATH2>/G2                   XYG3_Comp      energy
 pd34R12        <PATH2>/G2                   XYG3_Comp      energy
 pd34R14        <PATH2>/G2                   XYG3_Comp      energy
 pd34R16        <PATH2>/G2                   XYG3_Comp      energy
 pd34R18        <PATH2>/G2                   XYG3_Comp      energy
 pd34R20        <PATH2>/G2                   XYG3_Comp      energy
 pd36L20        <PATH2>/G2                   XYG3_Comp      energy
 pd36L18        <PATH2>/G2                   XYG3_Comp      energy
 pd36L16        <PATH2>/G2                   XYG3_Comp      energy
 pd36L14        <PATH2>/G2                   XYG3_Comp      energy
 pd36L12        <PATH2>/G2                   XYG3_Comp      energy
 pd36L10        <PATH2>/G2                   XYG3_Comp      energy
 pd36L08        <PATH2>/G2                   XYG3_Comp      energy
 pd36L06        <PATH2>/G2                   XYG3_Comp      energy
 pd36L04        <PATH2>/G2                   XYG3_Comp      energy
 pd36L02        <PATH2>/G2                   XYG3_Comp      energy
 pd36L00        <PATH2>/G2                   XYG3_Comp      energy
 pd36R02        <PATH2>/G2                   XYG3_Comp      energy
 pd36R04        <PATH2>/G2                   XYG3_Comp      energy
 pd36R06        <PATH2>/G2                   XYG3_Comp      energy
 pd36R08        <PATH2>/G2                   XYG3_Comp      energy
 pd36R10        <PATH2>/G2                   XYG3_Comp      energy
 pd36R12        <PATH2>/G2                   XYG3_Comp      energy
 pd36R14        <PATH2>/G2                   XYG3_Comp      energy
 pd36R16        <PATH2>/G2                   XYG3_Comp      energy
 pd36R18        <PATH2>/G2                   XYG3_Comp      energy
 pd36R20        <PATH2>/G2                   XYG3_Comp      energy
 pd38L20        <PATH2>/G2                   XYG3_Comp      energy
 pd38L18        <PATH2>/G2                   XYG3_Comp      energy
 pd38L16        <PATH2>/G2                   XYG3_Comp      energy
 pd38L14        <PATH2>/G2                   XYG3_Comp      energy
 pd38L12        <PATH2>/G2                   XYG3_Comp      energy
 pd38L10        <PATH2>/G2                   XYG3_Comp      energy
 pd38L08        <PATH2>/G2                   XYG3_Comp      energy
 pd38L06        <PATH2>/G2                   XYG3_Comp      energy
 pd38L04        <PATH2>/G2                   XYG3_Comp      energy
 pd38L02        <PATH2>/G2                   XYG3_Comp      energy
 pd38L00        <PATH2>/G2                   XYG3_Comp      energy
 pd38R02        <PATH2>/G2                   XYG3_Comp      energy
 pd38R04        <PATH2>/G2                   XYG3_Comp      energy
 pd38R06        <PATH2>/G2                   XYG3_Comp      energy
 pd38R08        <PATH2>/G2                   XYG3_Comp      energy
 pd38R10        <PATH2>/G2                   XYG3_Comp      energy
 pd38R12        <PATH2>/G2                   XYG3_Comp      energy
 pd38R14        <PATH2>/G2                   XYG3_Comp      energy
 pd38R16        <PATH2>/G2                   XYG3_Comp      energy
 pd38R18        <PATH2>/G2                   XYG3_Comp      energy
 pd38R20        <PATH2>/G2                   XYG3_Comp      energy
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
# "20 points in Bz-Methane potential"
  BM0            <PATH1>/bz_methane_scan     XYG3_Comp      energy
  BM1            <PATH1>/bz_methane_scan     XYG3_Comp      energy
  BM2            <PATH1>/bz_methane_scan     XYG3_Comp      energy
  BM3            <PATH1>/bz_methane_scan     XYG3_Comp      energy
  BM4            <PATH1>/bz_methane_scan     XYG3_Comp      energy
  BM5            <PATH1>/bz_methane_scan     XYG3_Comp      energy
  BM6            <PATH1>/bz_methane_scan     XYG3_Comp      energy
  BM7            <PATH1>/bz_methane_scan     XYG3_Comp      energy
  BM8            <PATH1>/bz_methane_scan     XYG3_Comp      energy
  BM9            <PATH1>/bz_methane_scan     XYG3_Comp      energy
 BM10            <PATH1>/bz_methane_scan     XYG3_Comp      energy
 BM11            <PATH1>/bz_methane_scan     XYG3_Comp      energy
 BM12            <PATH1>/bz_methane_scan     XYG3_Comp      energy
 BM13            <PATH1>/bz_methane_scan     XYG3_Comp      energy
 BM14            <PATH1>/bz_methane_scan     XYG3_Comp      energy
 BM15            <PATH1>/bz_methane_scan     XYG3_Comp      energy
 BM16            <PATH1>/bz_methane_scan     XYG3_Comp      energy
 BM17            <PATH1>/bz_methane_scan     XYG3_Comp      energy
 BM18            <PATH1>/bz_methane_scan     XYG3_Comp      energy
 BM19            <PATH1>/bz_methane_scan     XYG3_Comp      energy
# "18 points in Methane-Methane potential + 1 methane = 19"
   A0            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
  MM0            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
  MM1            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
  MM2            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
  MM3            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
  MM4            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
  MM5            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
  MM6            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
  MM7            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
  MM8            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
  MM9            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
 MM10            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
 MM11            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
 MM12            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
 MM13            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
 MM14            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
 MM15            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
 MM16            <PATH1>/methane_dimer_scan     XYG3_Comp      energy
 MM17            <PATH1>/methane_dimer_scan     XYG3_Comp      energy


# Training set for the atomization energy
#              671 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 671  1.0
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
# "223 HOFs in the G3 set"
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
 4         G2-175  -1    H_0  5  C_0  6 Cl_0  1          2.14409885    1.0 
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
 4         G2-197  -1    H_0  6  C_0  5  S_0  1          2.00548689    1.0                                                
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
# "44 HOFs in the Bond3 set"
 4        F224   -1      N_0  1  C_0  1 Cl_0  1          0.45055508    1.0
 4        F230   -1      H_0  3  C_0  2 Cl_0  3          1.01765648    1.0
 5        F234   -1      H_0  5  C_0  2  O_0  2  N_0  1  1.42781606    1.0
 5        F235   -1      H_0  5  C_0  2  O_0  3  N_0  1  1.54486464    1.0
 4        F243   -1      H_0  7  C_0  3 Cl_0  1          1.57329000    1.0
 4        F244   -1      H_0  7  C_0  3  F_0  1          1.61096470    1.0
 5        F246   -1      H_0  7  C_0  3  O_0  2  N_0  1  1.89809072    1.0
 5        F247   -1      H_0  7  C_0  3  O_0  2  N_0  1  1.90340739    1.0
 5        F248   -1      H_0  7  C_0  3  O_0  3  N_0  1  2.01363318    1.0
 5        F249   -1      H_0  7  C_0  3  O_0  3  N_0  1  2.01926012    1.0
 4        F250   -1      H_0  8  C_0  3  S_0  1          1.69322229    1.0
 4        F251   -1      H_0  8  C_0  3  S_0  1          1.69558975    1.0
 4        F252   -1      H_0  8  C_0  3  S_0  1          1.69124613    1.0
 4        F253   -1      H_0  9  C_0  3  N_0  1          1.86825619    1.0
 4        F254   -1      H_0  9  C_0  3  N_0  1          1.87182798    1.0
 3        F256   -1      H_0  8  C_0  4                  1.83950116    1.0
 3        F266   -1      H_0 10  C_0  5                  2.31069207    1.0
 3        F267   -1      H_0 10  C_0  5                  2.30897365    1.0
 4        F270   -1      H_0 10  C_0  5  O_0  1          2.49615315    1.0
 3        F275   -1      H_0 12  C_0  5                  2.54381738    1.0
 4        F277   -1      H_0 12  C_0  5  O_0  1          2.69826696    1.0
 5        F287   -1      H_0  5  C_0  6  O_0  2  N_0  1  2.47033349    1.0
 4        F300   -1      H_0  5  C_0  7  N_0  1          2.49475055    1.0
 4        F301   -1      H_0  6  C_0  7  O_0  1          2.59771598    1.0
 3        F306   -1      H_0 16  C_0  7                  3.48384255    1.0
 4        F309   -1      H_0  8  C_0  8  O_0  1          3.07745139    1.0
 3        F332   -1      H_0  5  C_0  3                  1.22042055    1.0
 3        F333   -1      H_0  7  C_0  3                  1.43020462    1.0
 3        F336   -1      H_0  6  C_0  4                  1.59172879    1.0
 3        F340   -1      H_0  9  C_0  4                  1.90182440    1.0
 3        F357   -1      H_0  8  C_0  8                  2.89103018    1.0
 4        F378   -1      H_0  6  C_0  4  O_0  2          1.97353243    1.0
 4        F379   -1      H_0 10  C_0  4  O_0  2          2.29209964    1.0
 3        F399   -1      O_0  3  N_0  1                  0.44196549    1.0
 4        F403   -1      H_0  1  O_0  2  N_0  1          0.49637940    1.0
 4        F404   -1      H_0  1  O_0  3  N_0  1          0.61587078    1.0
 4        F424   -1      H_0  3  C_0  2  F_0  3          1.20488707    1.0
 3        F444   -1     Cl_0  3  C_0  1                  0.38302027    1.0
 4        F523   -1      H_0  6  C_0  2  S_0  2          1.32162380    1.0
 5        F536   -1      H_0  4  C_0  2  S_0  1  O_0  1  1.18513724    1.0
 3        F700   -1      H_0 10  C_0 12                  4.17006812    1.0
 3        F771   -1      H_0  2  S_0  2                  0.38180232    1.0
 5       EtONO   -1      H_0  5  C_0  2  O_0  2  N_0  1  1.42821384    1.0
 3         cum   -1      H_0 12  C_0  9                  3.59090276    1.0
# "142 BDEs from G3+Bond3(Bond267) set"
 3       G2-12   -1   G2-11   1 H_0    1                 0.20090616    3.0
 3       G2-54   -1   G2-49   1 H_0    1                 0.15911326    3.0
 3       G2-32   -1   G2-142  1 H_0    1                 0.17877475    3.0
 3       G2-114  -1   G2-143  1 H_0    1                 0.17960830    3.0
 3       G2-20   -1   G2-137  1 H_0    1                 0.15226298    3.0
 3       G2-53   -1   G2-144  1 H_0    1                 0.14769100    3.0
 3       G2-10   -1   G2-9    1 H_0    1                 0.18519272    3.0
 3       G2-9    -1   G2-8    1 H_0    1                 0.15640003    3.0
 3       G2-19   -1   G2-18   1 H_0    1                 0.14181578    3.0
 3       G2-7    -1   G2-6    1 H_0    1                 0.17950526    3.0
 3       G2-6    -1   G2-4    1 H_0    1                 0.18674160    3.0
 3       G2-4    -1   G2-3    1 H_0    1                 0.16952193    3.0
 3       G2-26   -1   G2-145  1 H_0    1                 0.17335318    3.0
 3       G2-82   -1   G2-146  1 H_0    1                 0.16936242    3.0
 3       G2-91   -1   G2-147  1 H_0    1                 0.16550414    3.0
 3       G2-25   -1   G2-139  1 H_0    1                 0.18900913    3.0
 3       G2-24   -1   G2-138  1 H_0    1                 0.22269850    3.0
 3       G2-93   -1   G2-223  1 H_0    1                 0.19160998    3.0
 3       G2-32   -1   G2-141  1 H_0    1                 0.16441926    3.0
 3       G2-28   -1   G2-27   1 H_0    1                 0.20914815    3.0
 3       G2-95   -1   G2-222  1 H_0    1                 0.18176005    3.0
 3       G2-31   -1   G2-30   1 H_0    1                 0.15136527    3.0
 3       G2-30   -1   G2-29   1 H_0    1                 0.03093685    3.0
 3       G2-112  -1   G2-140  1 H_0    1                 0.15211016    3.0
 3       G2-142  -1   G2-6    1 O_0    1                 0.14760098    3.0
 3       G2-143  -1   G2-145  1 O_0    1                 0.14937604    3.0
 3       G2-144  -1   G2-6    1 S_0    1                 0.11618168    3.0
 3       G2-60   -1   G2-222  1 F_0    1                 0.21045242    3.0
 3       G2-120  -1   G2-139  1 F_0    1                 0.20176916    3.0
 3       G2-207  -1   G2-223  1 F_0    1                 0.20633985    3.0
 3       G2-126  -1   G2-140  1 F_0    1                 0.19775247    3.0
 3       G2-52   -1   G2-6    1 Cl_0   1                 0.13730143    3.0
 3       G2-121  -1   G2-145  1 Cl_0   1                 0.13858478    3.0
 3       G2-187  -1   G2-147  1 Cl_0   1                 0.13745214    3.0
 3       G2-220  -1   G2-222  1 Cl_0   1                 0.13894333    3.0
 3       G2-122  -1   G2-139  1 Cl_0   1                 0.14889610    3.0
 3       G2-175  -1   G2-223  1 Cl_0   1                 0.15687427    3.0
 3       G2-127  -1   G2-140  1 Cl_0   1                 0.13581972    3.0
 3       G2-54   -1   G2-11   1 Cl_0   1                 0.09089421    3.0
 3       G2-68   -1   G2-35   1 Cl_0   1                 0.06017035    3.0
 3       G2-16   -1   G2-15   1 H_0    1                 0.15089109    3.0
 3       G2-26   -1   G2-6    1 G2-6   1                 0.15484269    3.0
 3       G2-82   -1   G2-145  1 G2-6   1                 0.15233768    3.0
 3       G2-90   -1   G2-145  1 G2-145 1                 0.14996051    3.0
 3       G2-91   -1   G2-146  1 G2-6   1                 0.15124877    3.0
 3       G2-153  -1   G2-147  1 G2-6   1                 0.14924269    3.0
 3       G2-80   -1   G2-139  1 G2-6   1                 0.17241643    3.0
 3       G2-83   -1   G2-139  1 G2-139 1                 0.19572726    3.0
 3       G2-77   -1   G2-6    1 G2-138 1                 0.20972197    3.0
 3       G2-159  -1   G2-223  1 G2-6   1                 0.17447358    3.0
 3       G2-114  -1   G2-6    1 G2-141 1                 0.14851736    3.0
 3       G2-113  -1   G2-30   1 G2-30  1                 0.12100544    3.0
 3       G2-112  -1   G2-6    1 G2-30  1                 0.14447107    3.0
 3       G2-184  -1   G2-146  1 G2-30  1                 0.14127802    3.0
 3       G2-124  -1   G2-140  1 G2-6   1                 0.14261043    3.0
 3       G2-183  -1   G2-140  1 G2-145 1                 0.14065381    3.0
 3       G2-140  -1   G2-6    1 G2-29  1                 0.02329776    3.0
 3       G2-107  -1   G2-27   1 G2-27  1                 0.22221691    3.0
 3       G2-99   -1   G2-6    1 G2-27  1                 0.20201121    3.0
 3       G2-182  -1   G2-146  1 G2-27  1                 0.19961741    3.0
 3       G2-221  -1   G2-222  1 G2-222 1                 0.16117972    3.0
 3       G2-76   -1   G2-222  1 G2-27  1                 0.18238623    3.0
 3       G2-123  -1   G2-139  1 G2-27  1                 0.21943345    3.0
 3       G2-32   -1   G2-6    1 G2-11  1                 0.15704736    3.0
 3       G2-114  -1   G2-145  1 G2-11  1                 0.15965596    3.0
 3       G2-129  -1   G2-146  1 G2-11  1                 0.16156401    3.0
 3       G2-166  -1   G2-147  1 G2-11  1                 0.16114236    3.0
 3       G2-103  -1   G2-30   1 G2-11  1                 0.18429634    3.0
 3       G2-125  -1   G2-140  1 G2-11  1                 0.18322220    3.0
 3       G2-115  -1   G2-142  1 G2-6   1                 0.14311181    3.0
 3       G2-204  -1   G2-147  1 G2-142 1                 0.14276344    3.0
 3       G2-168  -1   G2-223  1 G2-11  1                 0.18754265    3.0
 3       G2-130  -1   G2-142  1 G2-145 1                 0.14493712    3.0
 3       G2-130  -1   G2-6    1 G2-143 1                 0.14316206    3.0
 3       G2-191  -1   G2-145  1 G2-143 1                 0.14642520    3.0
 3       G2-165  -1   G2-140  1 G2-142 1                 0.16782580    3.0
 3       G2-104  -1   G2-30   1 G2-142 1                 0.16817481    3.0
 3       G2-98   -1   G2-6    1 G2-9   1                 0.14809940    3.0
 3       G2-109  -1   G2-145  1 G2-9   1                 0.14683675    3.0
 3       G2-167  -1   G2-223  1 G2-9   1                 0.17640077    3.0
 3       G2-195  -1   G2-147  1 G2-9   1                 0.14688045    3.0
 3       G2-105  -1   G2-140  1 G2-9   1                 0.16750144    3.0
 3       G2-100  -1   G2-6    1 G2-148 1                 0.10524946    3.0
 3       G2-53   -1   G2-6    1 G2-137 1                 0.12631290    3.0
 3       G2-118  -1   G2-145  1 G2-137 1                 0.12504287    3.0
 3       G2-193  -1   G2-147  1 G2-137 1                 0.12137237    3.0
 3       G2-119  -1   G2-144  1 G2-6   1                 0.12537849    3.0
 3       G2-37   -1   G2-11   1 G2-11  1                 0.08879816    3.0
 3       G2-34   -1   G2-9    1 G2-9   1                 0.11934729    3.0
 3       G2-101  -1   G2-142  1 G2-35  1                 0.07177363    3.0
 3       G2-102  -1   G2-6    1 G2-16  1                 0.15040381    3.0
 3       G2-51   -1   G2-16   1 G2-16  1                 0.12682648    3.0
 3       G2-97   -1   F444    1 H_0    1                 0.15965554    3.0
 3       F403    -1   H_0     1 G2-148 1                 0.13478015    3.0
 3       F404    -1   H_0     1 F399   1                 0.17390529    3.0
 3       F244    -1   F333    1 F_0    1                 0.18076007    3.0
 3       F224    -1   Cl_0    1 G2-27  1                 0.16157567    3.0
 3       G2-61   -1   F444    1 Cl_0   1                 0.10942803    3.0
 3       F243    -1   G2-146  1 Cl_0   1                 0.13931346    3.0
 3       F379    -1   G2-143  1 G2-143 1                 0.07101952    3.0
 3       F399    -1   G2-148  1 O_0    1                 0.08036623    3.0
 3       F403    -1   G2-11   1 G2-35  1                 0.08402278    3.0
 3       F404    -1   G2-11   1 G2-148 1                 0.08494314    3.0
 3       EtONO   -1   G2-143  1 G2-35  1                 0.07464553    3.0
 3       F235    -1   G2-143  1 G2-148 1                 0.07272532    3.0
 3       F771    -1   G2-137  1 G2-137 1                 0.10668277    3.0
 3       F523    -1   G2-144  1 G2-144 1                 0.10958592    3.0
 3       F248    -1   F333    1 F399   1                 0.14146307    3.0
 3       F249    -1   G2-146  1 F399   1                 0.14331810    3.0
 3       F235    -1   G2-145  1 F399   1                 0.14173513    3.0
 3       G2-152  -1   F333    1 G2-145 1                 0.15012226    3.0
 3       G2-157  -1   F333    1 F333   1                 0.14971170    3.0
 3       F275    -1   G2-145  1 G2-146 1                 0.14867682    3.0
 3       F275    -1   G2-6    1 F340   1                 0.15215572    3.0
 3       F306    -1   G2-146  1 G2-147 1                 0.14030760    3.0
 3       F277    -1   F340    1 G2-141 1                 0.14464883    3.0
 3       F424    -1   G2-222  1 G2-6   1                 0.16977971    3.0
 3       F230    -1   F444    1 G2-6   1                 0.14479895    3.0
 3       F256    -1   G2-139  1 G2-145 1                 0.16983099    3.0
 3       F256    -1   F332    1 G2-6   1                 0.12924335    3.0  #
 3       F266    -1   G2-139  1 G2-146 1                 0.16820939    3.0  #
 3       F267    -1   G2-139  1 F333   1                 0.17026288    3.0  #
 3       F267    -1   F332    1 G2-145 1                 0.12738908    3.0  #
 3       F336    -1   G2-138  1 G2-145 1                 0.20716337    3.0
 3       F357    -1   G2-223  1 G2-139 1                 0.19529945    3.0
 3       F300    -1   G2-223  1 G2-27  1                 0.21854656    3.0
 3       F301    -1   G2-223  1 G2-30  1                 0.16683676    3.0
 3       F309    -1   G2-223  1 G2-140 1                 0.16437400    3.0
 3       F378    -1   G2-140  1 G2-140 1                 0.12182683    3.0
 3       F270    -1   F333    1 G2-140 1                 0.14009572    3.0
 3       cum     -1   G2-223  1 G2-146 1                 0.16970164    3.0
 3       F700    -1   G2-223  1 G2-223 1                 0.19561895    3.0
 3       F253    -1   F333    1 G2-9   1                 0.14846094    3.0
 3       F254    -1   G2-146  1 G2-9   1                 0.14826082    3.0
 3       F234    -1   G2-145  1 G2-148 1                 0.10505278    3.0
 3       F246    -1   F333    1 G2-148 1                 0.10628684    3.0
 3       F247    -1   G2-146  1 G2-148 1                 0.10783160    3.0
 3       F287    -1   G2-223  1 G2-148 1                 0.12150965    3.0
 3       F250    -1   F333    1 G2-137 1                 0.12545789    3.0  #
 3       F251    -1   G2-146  1 G2-137 1                 0.12405344    3.0
 3       F536    -1   G2-140  1 G2-137 1                 0.12172467    3.0
 3       F252    -1   G2-144  1 G2-145 1                 0.12406317    3.0  #
# "118 points in PESs of Bz2"
 2         s32      1   C6H6  -2                         0.00591544   30.0
 2         s33      1   C6H6  -2                         0.00267087   30.0
 2         s34      1   C6H6  -2                         0.00047967   30.0
 2         s35      1   C6H6  -2                        -0.00098006   30.0
 2         s36      1   C6H6  -2                        -0.00188842   30.0
 2         s37      1   C6H6  -2                        -0.00241112   30.0
 2         s38      1   C6H6  -2                        -0.00264856   30.0
 2         s39      1   C6H6  -2                        -0.00271071   30.0
 2         s40      1   C6H6  -2                        -0.00265334   30.0
 2         s41      1   C6H6  -2                        -0.00251948   30.0
 2         s42      1   C6H6  -2                        -0.00232506   30.0
 2         s45      1   C6H6  -2                        -0.00172268   30.0
 2         s50      1   C6H6  -2                        -0.00091632   30.0
 2         s55      1   C6H6  -2                        -0.00043665   30.0
 2         s60      1   C6H6  -2                        -0.00018167   30.0
 2         s65      1   C6H6  -2                        -0.00005737   30.0
 2         t44      1   C6H6  -2                         0.00174977   30.0
 2         t45      1   C6H6  -2                        -0.00063425   30.0
 2         t46      1   C6H6  -2                        -0.00222785   30.0
 2         t47      1   C6H6  -2                        -0.00323660   30.0
 2         t48      1   C6H6  -2                        -0.00381827   30.0
 2         t49      1   C6H6  -2                        -0.00409555   30.0
 2         t50      1   C6H6  -2                        -0.00415930   30.0
 2         t51      1   C6H6  -2                        -0.00407962   30.0
 2         t52      1   C6H6  -2                        -0.00390910   30.0
 2         t53      1   C6H6  -2                        -0.00368281   30.0
 2         t54      1   C6H6  -2                        -0.00342624   30.0
 2         t55      1   C6H6  -2                        -0.00316011   30.0
 2         t56      1   C6H6  -2                        -0.00289557   30.0
 2         t59      1   C6H6  -2                        -0.00217367   30.0
 2         t64      1   C6H6  -2                        -0.00131631   30.0
 2         t69      1   C6H6  -2                        -0.00081114   30.0
 2         t74      1   C6H6  -2                        -0.00051792   30.0
 2         t79      1   C6H6  -2                        -0.00034262   30.0
 2         pd32L20  1   C6H6  -2                        -0.00290035   30.0
 2         pd32L18  1   C6H6  -2                        -0.00290832   30.0
 2         pd32L16  1   C6H6  -2                        -0.00270593   30.0
 2         pd32L14  1   C6H6  -2                        -0.00218961   30.0
 2         pd32L12  1   C6H6  -2                        -0.00129878   30.0
 2         pd32L10  1   C6H6  -2                        -0.00005259   30.0
 2         pd32L08  1   C6H6  -2                         0.00148045   30.0
 2         pd32L06  1   C6H6  -2                         0.00309636   30.0
 2         pd32L04  1   C6H6  -2                         0.00453220   30.0
 2         pd32L02  1   C6H6  -2                         0.00555848   30.0
 2         pd32L00  1   C6H6  -2                         0.00591544   30.0
 2         pd32R02  1   C6H6  -2                         0.00555848   30.0
 2         pd32R04  1   C6H6  -2                         0.00453220   30.0
 2         pd32R06  1   C6H6  -2                         0.00309636   30.0
 2         pd32R08  1   C6H6  -2                         0.00148045   30.0
 2         pd32R10  1   C6H6  -2                        -0.00005259   30.0
 2         pd32R12  1   C6H6  -2                        -0.00129878   30.0
 2         pd32R14  1   C6H6  -2                        -0.00218961   30.0
 2         pd32R16  1   C6H6  -2                        -0.00270593   30.0
 2         pd32R18  1   C6H6  -2                        -0.00290832   30.0
 2         pd32R20  1   C6H6  -2                        -0.00290035   30.0
 2         pd34L20  1   C6H6  -2                        -0.00401906   30.0
 2         pd34L18  1   C6H6  -2                        -0.00410671   30.0
 2         pd34L16  1   C6H6  -2                        -0.00405253   30.0
 2         pd34L14  1   C6H6  -2                        -0.00381189   30.0
 2         pd34L12  1   C6H6  -2                        -0.00335134   30.0
 2         pd34L10  1   C6H6  -2                        -0.00268362   30.0
 2         pd34L08  1   C6H6  -2                        -0.00186451   30.0
 2         pd34L06  1   C6H6  -2                        -0.00101034   30.0
 2         pd34L04  1   C6H6  -2                        -0.00026454   30.0
 2         pd34L02  1   C6H6  -2                         0.00027569   30.0
 2         pd34L00  1   C6H6  -2                         0.00047967   30.0
 2         pd34R02  1   C6H6  -2                         0.00027569   30.0
 2         pd34R04  1   C6H6  -2                        -0.00026454   30.0
 2         pd34R06  1   C6H6  -2                        -0.00101034   30.0
 2         pd34R08  1   C6H6  -2                        -0.00186451   30.0
 2         pd34R10  1   C6H6  -2                        -0.00268362   30.0
 2         pd34R12  1   C6H6  -2                        -0.00335134   30.0
 2         pd34R14  1   C6H6  -2                        -0.00381189   30.0
 2         pd34R16  1   C6H6  -2                        -0.00405253   30.0
 2         pd34R18  1   C6H6  -2                        -0.00410671   30.0
 2         pd34R20  1   C6H6  -2                        -0.00401906   30.0
 2         pd36L20  1   C6H6  -2                        -0.00406846   30.0
 2         pd36L18  1   C6H6  -2                        -0.00416089   30.0
 2         pd36L16  1   C6H6  -2                        -0.00418001   30.0
 2         pd36L14  1   C6H6  -2                        -0.00407962   30.0
 2         pd36L12  1   C6H6  -2                        -0.00385651   30.0
 2         pd36L10  1   C6H6  -2                        -0.00351229   30.0
 2         pd36L08  1   C6H6  -2                        -0.00308680   30.0
 2         pd36L06  1   C6H6  -2                        -0.00262944   30.0
 2         pd36L04  1   C6H6  -2                        -0.00223901   30.0
 2         pd36L02  1   C6H6  -2                        -0.00197288   30.0
 2         pd36L00  1   C6H6  -2                        -0.00188842   30.0
 2         pd36R02  1   C6H6  -2                        -0.00197288   30.0
 2         pd36R04  1   C6H6  -2                        -0.00223901   30.0
 2         pd36R06  1   C6H6  -2                        -0.00262944   30.0
 2         pd36R08  1   C6H6  -2                        -0.00308680   30.0
 2         pd36R10  1   C6H6  -2                        -0.00351229   30.0
 2         pd36R12  1   C6H6  -2                        -0.00385651   30.0
 2         pd36R14  1   C6H6  -2                        -0.00407962   30.0
 2         pd36R16  1   C6H6  -2                        -0.00418001   30.0
 2         pd36R18  1   C6H6  -2                        -0.00416089   30.0
 2         pd36R20  1   C6H6  -2                        -0.00406846   30.0
 2         pd38L20  1   C6H6  -2                        -0.00363978   30.0
 2         pd38L18  1   C6H6  -2                        -0.00374018   30.0
 2         pd38L16  1   C6H6  -2                        -0.00378480   30.0
 2         pd38L14  1   C6H6  -2                        -0.00374177   30.0
 2         pd38L12  1   C6H6  -2                        -0.00363500   30.0
 2         pd38L10  1   C6H6  -2                        -0.00346608   30.0
 2         pd38L08  1   C6H6  -2                        -0.00324935   30.0
 2         pd38L06  1   C6H6  -2                        -0.00301668   30.0
 2         pd38L04  1   C6H6  -2                        -0.00280314   30.0
 2         pd38L02  1   C6H6  -2                        -0.00267725   30.0
 2         pd38L00  1   C6H6  -2                        -0.00264856   30.0
 2         pd38R02  1   C6H6  -2                        -0.00267725   30.0
 2         pd38R04  1   C6H6  -2                        -0.00280314   30.0
 2         pd38R06  1   C6H6  -2                        -0.00301668   30.0
 2         pd38R08  1   C6H6  -2                        -0.00324935   30.0
 2         pd38R10  1   C6H6  -2                        -0.00346608   30.0
 2         pd38R12  1   C6H6  -2                        -0.00363500   30.0
 2         pd38R14  1   C6H6  -2                        -0.00374177   30.0
 2         pd38R16  1   C6H6  -2                        -0.00378480   30.0
 2         pd38R18  1   C6H6  -2                        -0.00374018   30.0
 2         pd38R20  1   C6H6  -2                        -0.00363978   30.0
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
# 19 points in the Bz-Methane potential surface :
 2         BM0     1   BM19  -1                          -0.00022788  30.0
 2         BM1     1   BM19  -1                          -0.00037290  30.0
 2         BM2     1   BM19  -1                          -0.00046214  30.0
 2         BM3     1   BM19  -1                          -0.00058963  30.0
 2         BM4     1   BM19  -1                          -0.00075855  30.0
 2         BM5     1   BM19  -1                          -0.00096891  30.0
 2         BM6     1   BM19  -1                          -0.00122229  30.0
 2         BM7     1   BM19  -1                          -0.00152348  30.0
 2         BM8     1   BM19  -1                          -0.00183264  30.0
 2         BM9     1   BM19  -1                          -0.00198881  30.0
 2         BM10    1   BM19  -1                          -0.00214180  30.0
 2         BM11    1   BM19  -1                          -0.00227566  30.0
 2         BM12    1   BM19  -1                          -0.00233622  30.0
 2         BM13    1   BM19  -1                          -0.00231072  30.0
 2         BM14    1   BM19  -1                          -0.00216252  30.0
 2         BM15    1   BM19  -1                          -0.00185495  30.0
 2         BM16    1   BM19  -1                          -0.00127329  30.0
 2         BM17    1   BM19  -1                          -0.00033147  30.0
 2         BM18    1   BM19  -1                           0.00109958  30.0
# "18 points in Methane-Methane potential"
 2         MM17    1    A0   -2                           0.00010996  30.0
 2         MM16    1    A0   -2                          -0.00038087  30.0
 2         MM15    1    A0   -2                          -0.00066453  30.0
 2         MM14    1    A0   -2                          -0.00080955  30.0
 2         MM13    1    A0   -2                          -0.00086214  30.0
 2         MM12    1    A0   -2                          -0.00085895  30.0
 2         MM11    1    A0   -2                          -0.00082070  30.0
 2         MM10    1    A0   -2                          -0.00076493  30.0
 2         MM9     1    A0   -2                          -0.00069959  30.0
 2         MM8     1    A0   -2                          -0.00063107  30.0
 2         MM7     1    A0   -2                          -0.00056413  30.0
 2         MM6     1    A0   -2                          -0.00050198  30.0
 2         MM5     1    A0   -2                          -0.00044461  30.0
 2         MM4     1    A0   -2                          -0.00034581  30.0
 2         MM3     1    A0   -2                          -0.00026772  30.0
 2         MM2     1    A0   -2                          -0.00020717  30.0
 2         MM1     1    A0   -2                          -0.00012749  30.0
 2         MM0     1    A0   -2                          -0.00007968  30.0

__xyg3 components__ ::  580
#              E_noXC         E_K           Ex_LDA         dEx_Becke       Ec_VWN       dEc_LYP        PT2_1ST        PT2_MOS
     H_0    -0.19023547    -0.30925638    -0.26560754    -0.04167771    -0.03986945    0.03986945    -0.00033958    0.00000000
    He_0    -1.83868023    -1.02035674    -0.88042122    -0.14163340    -0.15000509    0.10622447    -0.00102535    -0.04095907
    Li_0    -5.65066622    -1.78065767    -1.53861170    -0.23727194    -0.20630448    0.15246210    -0.00051426    -0.01643483
    Be_0    -11.90161367    -2.66925722    -2.31662728    -0.34548651    -0.29865864    0.20353283    -0.00076928    -0.09973057
     B_0    -20.76340054    -3.76518213    -3.29748272    -0.46331409    -0.38253316    0.25664791    -0.00192433    -0.11379583
     C_0    -32.62161385    -5.06530125    -4.48351792    -0.58016155    -0.47028686    0.31113682    -0.00305826    -0.12215292
     N_0    -47.80714519    -6.58810724    -5.89167100    -0.69492648    -0.56018519    0.36779300    -0.00383673    -0.12635296
     O_0    -66.61555928    -8.18840153    -7.36929467    -0.83755461    -0.68762019    0.43015042    -0.00570465    -0.18141986
     F_0    -89.38983573    -10.00556900    -9.06820806    -0.97328192    -0.81664846    0.49536697    -0.00760630    -0.23338070
    Ne_0    -116.45978994    -12.06001029    -11.00542552    -1.10316291    -0.94565342    0.56254610    -0.00912982    -0.28214044
    Na_0    -147.84526780    -13.99419250    -12.77641627    -1.24324916    -1.02472190    0.61521097    -0.00660157    -0.14408188
    Mg_0    -183.62238886    -15.97784045    -14.61034605    -1.38721444    -1.13134066    0.67050079    -0.00596324    -0.19504808
    Al_0    -223.79425279    -18.07216385    -16.54919397    -1.53466833    -1.22397243    0.72872098    -0.00652864    -0.21913461
    Si_0    -268.56215720    -20.28180534    -18.60595594    -1.68085001    -1.31968700    0.78850696    -0.00722143    -0.23921541
     P_0    -318.07886136    -22.62314590    -20.79272856    -1.82657864    -1.41703827    0.84952817    -0.00676577    -0.25322444
     S_0    -372.48607119    -25.00770907    -23.01944995    -1.98307482    -1.54311784    0.91309484    -0.00782806    -0.29586577
    Cl_0    -431.97345606    -27.49563461    -25.35131277    -2.13536714    -1.66934338    0.97782069    -0.00748474    -0.28454988
    G2-1    -5.84669654    -2.13778552    -1.85100162    -0.28373625    -0.29109581    0.20235978    -0.00224703    -0.07103299
    G2-2    -12.07415689    -3.07484238    -2.67616704    -0.38826579    -0.35901241    0.25038067    -0.00231896    -0.07884636
    G2-3    -32.86525513    -5.41015628    -4.80091180    -0.61511591    -0.55436975    0.35730732    -0.00466197    -0.18032369
    G2-4    -33.07800512    -5.85189956    -5.21627906    -0.63375245    -0.61420759    0.39993385    -0.00490966    -0.17751440
    G2-5    -33.10846773    -5.77765543    -5.14425377    -0.64073117    -0.63506512    0.40222117    -0.00579471    -0.23347410
    G2-6    -33.35792260    -6.21213630    -5.54812023    -0.66249741    -0.70133792    0.44371681    -0.00584093    -0.23716668
    G2-7    -33.62483285    -6.58035200    -5.89378126    -0.68545628    -0.78222958    0.48755328    -0.00705670    -0.29219483
    G2-8    -48.05776235    -6.91616989    -6.20212471    -0.72970542    -0.64958938    0.41289841    -0.00576698    -0.19324110
    G2-9    -48.30816827    -7.27068365    -6.54323842    -0.75302450    -0.73555399    0.45683440    -0.00701052    -0.25985126
   G2-10    -48.55701684    -7.65434397    -6.91637840    -0.76809121    -0.81768186    0.49981596    -0.00787006    -0.32114589
   G2-11    -66.87404696    -8.53700860    -7.72032902    -0.85763302    -0.77456877    0.47432862    -0.00783359    -0.25835502
   G2-12    -67.12940705    -8.92043720    -8.10710904    -0.86892486    -0.85749075    0.51725320    -0.00906543    -0.33276325
   G2-13    -89.65913680    -10.38949429    -9.47198824    -0.98167276    -0.90057448    0.53844449    -0.01001114    -0.31946299
   G2-14    -269.04137722    -20.97461964    -19.22669837    -1.75093854    -1.47782908    0.87988318    -0.01063170    -0.33128375
   G2-15    -268.99808457    -21.00920281    -19.25847906    -1.74714032    -1.45761462    0.87856307    -0.01025164    -0.27945530
   G2-16    -269.25520991    -21.36941578    -19.57423731    -1.78424186    -1.53993758    0.92389024    -0.01149928    -0.32299917
   G2-17    -269.50783201    -21.73769624    -19.89852381    -1.81972434    -1.61950338    0.96965816    -0.01281955    -0.36363216
   G2-18    -318.57804216    -23.29206981    -21.40117150    -1.89031059    -1.58083375    0.93829080    -0.01054627    -0.34960382
   G2-19    -318.82721742    -23.64379719    -21.72412872    -1.91743317    -1.65876992    0.98241170    -0.01204729    -0.39796558
   G2-20    -373.00504769    -25.69254950    -23.66515483    -2.02930737    -1.70209314    0.99997125    -0.01055424    -0.40330935
   G2-21    -432.24452899    -27.84715821    -25.69161887    -2.15260720    -1.74792878    1.02059871    -0.00832487    -0.34263137
   G2-22    -11.30949408    -3.55842508    -3.07951737    -0.47080295    -0.44041895    0.30629888    -0.00204641    -0.10397481
   G2-23    -95.03500940    -11.93321368    -10.81906944    -1.18538663    -1.06968668    0.65253156    -0.01668823    -0.35510623
   G2-24    -65.85204333    -10.98391299    -9.88119031    -1.15080298    -1.15199289    0.70663209    -0.01205396    -0.49483670
   G2-25    -66.31093504    -11.73768361    -10.54826380    -1.21435172    -1.29304097    0.79419398    -0.01332662    -0.51452119
   G2-26    -66.75431502    -12.48917656    -11.21305032    -1.27648412    -1.43414277    0.88183360    -0.01397033    -0.54476117
   G2-27    -80.58277564    -11.61765943    -10.50544964    -1.21865633    -1.10452525    0.67653833    -0.01925619    -0.54809319
   G2-28    -80.84703436    -12.04724403    -10.88271849    -1.24386546    -1.18663352    0.72156692    -0.01370245    -0.52849362
   G2-29    -99.45582007    -13.30959556    -12.05347276    -1.34808637    -1.22430388    0.73910039    -0.01639595    -0.51161839
   G2-30    -99.60655287    -13.66831789    -12.38783342    -1.37734186    -1.28875407    0.78033827    -0.01876719    -0.52786427
   G2-31    -99.83401413    -14.06100047    -12.74011659    -1.40714955    -1.36720053    0.82626662    -0.01880145    -0.55999037
   G2-32    -100.25404790    -14.81866664    -13.41388647    -1.46467095    -1.50848574    0.91218561    -0.01729730    -0.58363615
   G2-33    -95.86181782    -13.10683182    -11.87359169    -1.33515825    -1.22007075    0.73595596    -0.01341922    -0.54742070
   G2-34    -96.59856041    -14.61049578    -13.23494931    -1.44449883    -1.50367519    0.90658931    -0.01626728    -0.60376393
   G2-35    -114.57435884    -14.70342208    -13.36065019    -1.46852355    -1.32249609    0.79446631    -0.01765394    -0.56025823
   G2-36    -133.33949349    -16.31358996    -14.86592865    -1.59823180    -1.42411435    0.85224834    -0.01747640    -0.55613295
   G2-37    -133.76318404    -17.05136785    -15.53821153    -1.65638234    -1.57813535    0.94176150    -0.01948020    -0.65710710
   G2-38    -178.82150068    -19.90304056    -18.19416402    -1.89033037    -1.65960187    0.98408546    -0.02006031    -0.66464968
   G2-39    -166.08788579    -21.59043759    -19.64614129    -2.11720167    -1.95634302    1.16447058    -0.03298989    -0.83122727
   G2-40    -295.70311293    -27.97342375    -25.55029343    -2.48066104    -2.07288096    1.22931516    -0.01520652    -0.35509124
   G2-41    -537.20535560    -40.51855752    -37.24415462    -3.32707116    -2.67345679    1.57391025    -0.01843433    -0.63640540
   G2-42    -636.28349019    -45.17597707    -41.61889883    -3.60790654    -2.91189079    1.69634492    -0.02000855    -0.75828416
   G2-43    -745.05623729    -50.00504873    -46.13297951    -3.91190095    -3.12696614    1.82002578    -0.02070459    -0.72353950
   G2-44    -863.98208210    -54.98058058    -50.77537661    -4.22438007    -3.36382146    1.95038894    -0.01873357    -0.67002182
   G2-45    -579.81486493    -41.60679935    -38.26494409    -3.36017511    -2.73117050    1.59799437    -0.01751150    -0.48890067
   G2-46    -335.30311709    -28.51265035    -26.14972844    -2.46435263    -2.07003721    1.21719886    -0.02614707    -0.64187855
   G2-47    -405.26266793    -30.06733467    -27.61955483    -2.50615876    -2.07036049    1.22122722    -0.01925128    -0.63731297
   G2-48    -439.18744437    -33.18624526    -30.52761939    -2.75763174    -2.27711120    1.33684520    -0.02196839    -0.65268592
   G2-49    -498.63629157    -35.62797384    -32.80373782    -2.91784259    -2.39420292    1.40207392    -0.02506803    -0.63468048
   G2-50    -521.39611565    -37.47198369    -34.51235212    -3.05659830    -2.51342501    1.46740815    -0.02244256    -0.65860465
   G2-51    -538.54401058    -42.79658369    -39.22457776    -3.54144969    -3.10883286    1.84598033    -0.02489734    -0.69673574
   G2-52    -465.37585671    -33.74811042    -31.00152582    -2.75007477    -2.39932540    1.41625759    -0.01624159    -0.60032228
   G2-53    -406.13356482    -31.59892028    -28.98250109    -2.62350402    -2.35414744    1.39512302    -0.01795180    -0.66175939
   G2-54    -498.87244833    -36.01777558    -33.16008519    -2.94024155    -2.47121237    1.44600091    -0.01983863    -0.66882832
   G2-55    -505.84431643    -41.40605675    -38.07473675    -3.52687968    -3.01875524    1.76359430    -0.03996176    -1.06677622
   G2-56    -289.10892932    -34.17527060    -31.12139501    -3.23187554    -2.92357311    1.72969076    -0.04017100    -1.01564780
   G2-57    -1316.81624395    -86.50705879    -79.76331887    -6.73597674    -5.46692660    3.17666675    -0.03523808    -1.13671353
   G2-58    -492.06378335    -48.48586078    -44.33643032    -4.34605919    -3.76504450    2.21282173    -0.04686387    -1.12713157
   G2-59    -1519.80079111    -100.86187995    -92.99952867    -7.84179069    -6.30750364    3.65760767    -0.03573976    -1.19767155
   G2-60    -390.34719750    -45.41016057    -41.44146564    -4.23760531    -3.85754036    2.26537195    -0.05543980    -1.39050481
   G2-61    -1760.64113690    -115.19948764    -106.31327862    -8.92339592    -7.25082169    4.19711911    -0.04887437    -1.58535677
   G2-62    -471.94276236    -38.36278741    -35.21643172    -3.27566571    -2.80239754    1.64643944    -0.03292094    -0.92804565
   G2-63    -777.78227861    -55.14607301    -50.79989577    -4.43288844    -3.64959067    2.12859736    -0.03188585    -1.03566220
   G2-64    -278.20574669    -33.48684362    -30.53656768    -3.17832094    -2.90646762    1.71509684    -0.04556708    -1.11337281
   G2-65    -626.28675605    -60.80064862    -55.63799604    -5.39748363    -4.71136996    2.75676064    -0.05591369    -1.45224644
   G2-66    -1996.57434586    -130.59281135    -120.50566795    -10.06085624    -8.10257064    4.68475043    -0.04764420    -1.59064156
   G2-67    -162.44001102    -21.27766217    -19.39666116    -2.10007695    -1.94715012    1.15899345    -0.03424056    -0.93179022
   G2-68    -546.60713947    -42.11544657    -38.74348819    -3.56342152    -3.01047114    1.76699218    -0.04158447    -1.01327735
   G2-69    -316.11198895    -36.50695193    -33.36937848    -3.44930489    -3.11168589    1.83300318    -0.05495141    -1.24184253
   G2-70    -586.40118684    -52.83628302    -48.45134985    -4.60076106    -3.97223244    2.32058930    -0.05228006    -1.24030274
   G2-71    -199.98509020    -24.32290260    -22.27340084    -2.37205502    -2.15672906    1.27789027    -0.03495004    -1.14442024
   G2-72    -245.48314275    -28.02987572    -25.63626617    -2.67268035    -2.38054853    1.40744549    -0.03924511    -0.99763338
   G2-73    -700.18240236    -57.39716699    -52.81836641    -4.90607895    -4.18418465    2.44264065    -0.06733495    -1.40588748
   G2-74    -422.99470828    -50.54355263    -46.09577991    -4.76746949    -4.36944407    2.57321942    -0.06648631    -1.63162673
   G2-75    -1793.30152373    -120.39975627    -111.01870530    -9.44383313    -7.76612266    4.50361786    -0.05546331    -1.80855883
   G2-76    -381.52475323    -47.05413027    -42.85001157    -4.50084551    -4.14424447    2.44924233    -0.06085028    -1.62155292
   G2-77    -98.98564393    -16.90053694    -15.21208091    -1.73936184    -1.80480886    1.10081379    -0.01954495    -0.74475174
   G2-78    -98.99367233    -16.88861307    -15.20956676    -1.73820026    -1.80459446    1.10025929    -0.02067281    -0.74010265
   G2-79    -98.92724698    -16.91605534    -15.24044492    -1.72506636    -1.80850299    1.09916114    -0.01948965    -0.74207034
   G2-80    -99.44593856    -17.64677850    -15.87210625    -1.80201211    -1.94530836    1.18774527    -0.02066947    -0.76969127
   G2-81    -99.39085654    -17.68756147    -15.91930588    -1.78595011    -1.95057392    1.18627410    -0.01976293    -0.76205800
   G2-82    -99.88757304    -18.39579767    -16.53243030    -1.86463168    -2.08606686    1.27520810    -0.02099565    -0.80087220
   G2-83    -132.14013337    -22.80568504    -20.53429118    -2.32871109    -2.45672966    1.49392437    -0.02791240    -0.99886064
   G2-84    -132.11704930    -22.81737167    -20.54275205    -2.32819387    -2.45769880    1.49511100    -0.02692699    -0.99613589
   G2-85    -132.07567126    -22.83602559    -20.57462651    -2.31202709    -2.46145484    1.49251693    -0.02702329    -0.99034991
   G2-86    -132.03159684    -22.86383728    -20.60969663    -2.29433330    -2.46557865    1.48999796    -0.02607559    -0.99255734
   G2-87    -132.08011784    -22.84171286    -20.57902653    -2.30729714    -2.46260914    1.49123842    -0.02760334    -0.99666566
   G2-88    -132.52445610    -23.59405186    -21.23955762    -2.37123736    -2.60343891    1.57880105    -0.02759766    -1.02322637
   G2-89    -132.58115077    -23.55550356    -21.19611526    -2.38771986    -2.59771203    1.58066606    -0.02784757    -1.02820801
   G2-90    -133.02038929    -24.30269380    -21.85214745    -2.45264099    -2.73806661    1.66858407    -0.02801884    -1.05760745
   G2-91    -133.02365987    -24.30003650    -21.85155460    -2.44990246    -2.73807921    1.66770824    -0.02807830    -1.06122562
   G2-92    -165.15895162    -28.78647240    -25.94294287    -2.88419276    -3.11865318    1.88442972    -0.03321081    -1.23961426
   G2-93    -197.49643287    -33.23972101    -29.97853373    -3.34867993    -3.49190234    2.10185056    -0.03686388    -1.42548900
   G2-94    -211.97808445    -25.98464583    -23.65428653    -2.47097376    -2.31937746    1.37842802    -0.03237578    -0.84484412
   G2-95    -301.16756366    -35.69338772    -32.54524421    -3.35511695    -3.08825269    1.82190594    -0.04478520    -1.11978659
   G2-96    -897.13090107    -60.90633879    -56.10833407    -4.81050612    -4.01640882    2.34384750    -0.02661513    -0.91903100
   G2-97    -1328.88644014    -88.05687658    -81.21300532    -6.86796965    -5.63359753    3.27071626    -0.03766013    -1.24753677
   G2-98    -81.67930479    -13.55870314    -12.23076218    -1.36080580    -1.46934467    0.89440468    -0.01536582    -0.57323492
   G2-99    -113.98213133    -17.96876771    -16.21717824    -1.83280613    -1.83961483    1.11590202    -0.02125615    -0.77521383
  G2-100    -214.54743889    -29.16805208    -26.54838752    -2.84959753    -2.77780008    1.65475648    -0.04259624    -1.22048665
  G2-101    -214.58906952    -29.12330714    -26.49736963    -2.85808217    -2.77430236    1.65473748    -0.04753707    -1.21755136
  G2-102    -302.64310812    -27.65695942    -25.22971039    -2.41024427    -2.27256672    1.36427284    -0.01920812    -0.61913315
  G2-103    -166.49662846    -22.31531972    -20.28875855    -2.17583538    -2.09502402    1.24886650    -0.03221826    -0.85585950
  G2-104    -199.62450651    -28.21383298    -25.59837163    -2.76897263    -2.74642447    1.64294519    -0.04071363    -1.11286082
  G2-105    -181.04384135    -26.98081422    -24.44342467    -2.65920549    -2.70918273    1.62462649    -0.03697581    -1.09341587
  G2-106    -114.33075219    -18.73608143    -16.91688154    -1.87439260    -1.98449699    1.19951064    -0.02205662    -0.79813346
  G2-107    -161.20100799    -23.41718882    -21.20357608    -2.39341018    -2.24399679    1.35046744    -0.03035811    -1.04031412
  G2-108    -114.80858900    -19.45978667    -17.54557924    -1.94968210    -2.12090489    1.28772550    -0.02322754    -0.82957895
  G2-109    -114.81704954    -19.46320138    -17.54901162    -1.94866395    -2.12109365    1.28761228    -0.02265433    -0.82957907
  G2-110    -132.53124669    -19.22720085    -17.41962016    -1.92681529    -1.87982853    1.13191360    -0.02746538    -0.78573081
  G2-111    -132.91509816    -19.98550141    -18.09103286    -1.98124325    -2.02298448    1.21774208    -0.02534727    -0.81334301
  G2-112    -132.97669339    -19.97229090    -18.06712777    -1.99424415    -2.01940151    1.21952086    -0.02672173    -0.81171988
  G2-113    -199.19675076    -27.44487369    -24.90744221    -2.71652589    -2.60384648    1.55807327    -0.03809278    -1.08612716
  G2-114    -133.39200421    -20.72557301    -18.73392783    -2.05262201    -2.16032749    1.30538745    -0.02449062    -0.83866755
  G2-115    -133.38615181    -20.71404178    -18.72187052    -2.05601723    -2.15942532    1.30567924    -0.02603518    -0.83904527
  G2-116    -438.78906952    -36.79033073    -33.68378467    -3.13645905    -2.87047147    1.70012504    -0.02441987    -0.89586100
  G2-117    -505.87698470    -45.72873595    -41.83283212    -3.99081820    -3.73444280    2.21334582    -0.04426734    -1.25684037
  G2-118    -439.26819992    -37.50443811    -34.30134856    -3.21167731    -3.00606253    1.78853988    -0.02511780    -0.91994822
  G2-119    -439.26513798    -37.50457112    -34.30161559    -3.21472456    -3.00629433    1.78940548    -0.02548915    -0.92306195
  G2-120    -155.48833623    -21.43766777    -19.43374895    -2.10400499    -2.06207891    1.23914811    -0.02728153    -0.79449962
  G2-121    -498.51341004    -39.65369950    -36.32076125    -3.33819795    -3.05118162    1.80962341    -0.02358112    -0.85744279
  G2-122    -498.06465039    -38.90489703    -35.66478443    -3.27385523    -2.91094518    1.72203271    -0.02377498    -0.83094943
  G2-123    -146.67160403    -23.12339280    -20.87466032    -2.36139321    -2.35075509    1.42250245    -0.02866649    -1.00687553
  G2-124    -166.11459867    -25.88552086    -23.39434951    -2.58062879    -2.67191964    1.61268230    -0.03376010    -1.06575317
  G2-125    -199.63256018    -28.23290809    -25.61789060    -2.76299147    -2.74763329    1.64225364    -0.03876706    -1.10522476
  G2-126    -222.17189683    -29.68385968    -26.96480734    -2.88118317    -2.78917279    1.66409915    -0.04080839    -1.09269001
  G2-127    -564.75474949    -47.12817576    -43.17983581    -4.05307240    -3.63675398    2.14704123    -0.03932037    -1.14005409
  G2-128    -531.64573657    -45.56132454    -41.64082889    -3.92646517    -3.70321993    2.20309221    -0.03056688    -1.11444330
  G2-129    -166.53178465    -26.62984769    -24.05343285    -2.63803203    -2.81226452    1.69787541    -0.03178589    -1.09782738
  G2-130    -166.52343896    -26.62155954    -24.04244905    -2.64391756    -2.81135065    1.69893209    -0.03316527    -1.09478859
  G2-131    -147.94214419    -25.35821705    -22.86087772    -2.53483912    -2.77256642    1.67984770    -0.03130584    -1.09153462
  G2-132    -198.30279810    -30.36466419    -27.48677541    -3.00995140    -3.05195824    1.82560426    -0.03678949    -1.26092956
  G2-133    -504.16764705    -47.16642411    -43.07672417    -4.16900257    -3.90018276    2.30927655    -0.03698620    -1.35371655
  G2-134    -179.72068282    -29.12710676    -26.32578381    -2.90153902    -3.01436993    1.80733358    -0.03290660    -1.24485067
  G2-135    -212.43656160    -34.29603442    -30.98206634    -3.43750269    -3.52629426    2.11552332    -0.03944450    -1.45911659
  G2-136    -0.47572256    -0.65647041    -0.56617948    -0.08940003    -0.13018973    0.09198372    -0.00088154    -0.05074827
  G2-137    -372.74594381    -25.34313841    -23.33486056    -2.00788900    -1.62395437    0.95673455    -0.00942270    -0.34883500
  G2-138    -65.54601462    -10.60848611    -9.53504033    -1.12546371    -1.06638864    0.66234816    -0.01190860    -0.44584316
  G2-139    -66.04270445    -11.35671921    -10.20053332    -1.18766613    -1.21192918    0.74950994    -0.01376532    -0.46758079
  G2-140    -132.74606022    -19.58317730    -17.71658027    -1.96665685    -1.94153755    1.17464078    -0.02689835    -0.77821989
  G2-141    -100.00150455    -14.44269192    -13.07413770    -1.43563074    -1.42995605    0.86710343    -0.01798570    -0.53922402
  G2-142    -100.01717498    -14.42492524    -13.03854636    -1.44630889    -1.42819024    0.86823146    -0.02160774    -0.52461793
  G2-143    -133.15625113    -20.32913365    -18.35836987    -2.03421988    -2.08017904    1.26156631    -0.02991017    -0.78144848
  G2-144    -405.88175657    -31.24484049    -28.65364071    -2.59966271    -2.27690094    1.35145220    -0.01808234    -0.61120024
  G2-145    -66.49259908    -12.11838134    -10.87107862    -1.25117214    -1.35456385    0.83764292    -0.01384239    -0.49307835
  G2-146    -99.62921558    -18.02421966    -16.19371914    -1.83836586    -2.00743048    1.23106847    -0.02144816    -0.75075812
  G2-147    -132.76647631    -23.92979239    -21.51634950    -2.42396158    -2.66002420    1.62396293    -0.02900766    -1.01103658
  G2-148    -181.20749590    -22.86669390    -20.87665439    -2.23508660    -2.04999465    1.21747727    -0.03601588    -0.94899948
  G2-149    -132.12649681    -22.79834787    -20.53248003    -2.32738544    -2.45682194    1.49421248    -0.02786521    -0.99670900
  G2-150    -165.27238313    -28.71578519    -25.86041093    -2.91267537    -3.10952157    1.88644699    -0.03508008    -1.25911262
  G2-151    -165.66423211    -29.52519248    -26.58291610    -2.95338278    -3.25776115    1.97089032    -0.03443346    -1.27800005
  G2-152    -166.15313156    -30.20957249    -27.17182526    -3.04070532    -3.39006932    2.06197821    -0.03504093    -1.31447018
  G2-153    -166.15885107    -30.20453791    -27.17250858    -3.03262919    -3.39043492    2.05952073    -0.03515990    -1.32578860
  G2-154    -197.91362204    -33.94950137    -30.60216577    -3.41272634    -3.63000144    2.18891911    -0.04109116    -1.47566381
  G2-155    -197.91096890    -33.95472434    -30.60392479    -3.41287531    -3.63018073    2.18916508    -0.04115898    -1.46921672
  G2-156    -198.79580760    -35.44222673    -31.91388708    -3.53621476    -3.91099278    2.36290180    -0.04187327    -1.53625747
  G2-157    -199.28584329    -36.11648954    -32.49155805    -3.62873771    -4.04207827    2.45536598    -0.04206478    -1.57138765
  G2-158    -199.28405972    -36.11449987    -32.49410454    -3.62315982    -4.04276327    2.45381043    -0.04230429    -1.57910398
  G2-159    -230.63036966    -39.14724756    -35.30180079    -3.93495424    -4.14429664    2.49503444    -0.04413831    -1.68624434
  G2-160    -232.41819472    -42.02377496    -37.81162413    -4.21675158    -4.69410663    2.84875128    -0.04908449    -1.82829061
  G2-161    -263.29437655    -44.26949168    -39.93053881    -4.46238030    -4.65366181    2.80062184    -0.05566748    -1.93791691
  G2-162    -265.55120633    -47.93036993    -43.13105392    -4.80480874    -5.34609212    3.24214021    -0.05610868    -2.08524218
  G2-163    -328.67636447    -54.72657283    -49.39882105    -5.48123990    -5.69026812    3.40876881    -0.06228740    -2.35766821
  G2-164    -328.65915032    -54.67250680    -49.36712937    -5.48419483    -5.68775314    3.40890192    -0.06468634    -2.40010471
  G2-165    -232.75963538    -34.13135222    -30.92754253    -3.35569892    -3.39906144    2.03621673    -0.04723320    -1.36286215
  G2-166    -199.66963356    -32.53463588    -29.37404873    -3.22144732    -3.46449253    2.08984763    -0.03884782    -1.36061054
  G2-167    -245.55418669    -40.22599606    -36.33493314    -4.01553715    -4.18050477    2.50715314    -0.04703682    -1.71557548
  G2-168    -264.13460995    -41.48046344    -37.51258143    -4.11948906    -4.21917213    2.52483260    -0.04919393    -1.72487285
  G2-169    -198.77330831    -31.03404431    -28.05544586    -3.10248573    -3.18270584    1.91697925    -0.04149286    -1.29495411
  G2-170    -199.17063306    -31.84677686    -28.77481183    -3.14561295    -3.33120465    2.00169547    -0.03950167    -1.31356374
  G2-171    -231.89082852    -37.01901701    -33.44866112    -3.66976858    -3.84384382    2.30872784    -0.04744044    -1.54126530
  G2-172    -330.37216804    -48.92390462    -44.32116935    -4.85250860    -4.80154319    2.86537840    -0.06826292    -2.02503353
  G2-173    -227.37833912    -35.35558517    -31.98624099    -3.52631141    -3.56067700    2.12920684    -0.04244772    -1.48931137
  G2-174    -572.46255674    -54.03279148    -49.42581142    -4.75887937    -4.46685665    2.63739048    -0.05751068    -1.56031730
  G2-175    -629.25014269    -60.40550003    -55.09435405    -5.40704090    -5.10990509    3.02940563    -0.04723762    -1.74836814
  G2-176    -227.47405642    -35.25732670    -31.85383524    -3.56941933    -3.54848689    2.13769751    -0.04252509    -1.52093153
  G2-177    -227.37789444    -35.34640429    -31.98094835    -3.52663481    -3.56033100    2.12912605    -0.04119389    -1.49489532
  G2-178    -198.34414844    -30.28589785    -27.38568570    -3.04756731    -3.04214725    1.83252507    -0.04084274    -1.27999840
  G2-179    -198.80308432    -31.04212282    -28.05461068    -3.10892063    -3.18334892    1.91941087    -0.04177391    -1.29681250
  G2-180    -332.12780671    -47.52932233    -43.11386250    -4.65911559    -4.63697116    2.76731828    -0.06819796    -1.88897448
  G2-181    -504.60772048    -47.88857476    -43.69731868    -4.24022402    -4.03766682    2.39768816    -0.03900317    -1.37374954
  G2-182    -180.25011218    -29.78117519    -26.85415425    -3.00983803    -3.14342758    1.90279386    -0.03532199    -1.29083684
  G2-183    -199.24508021    -31.79494890    -28.71681180    -3.16792299    -3.32427026    2.00596003    -0.04090391    -1.32259381
  G2-184    -199.24289582    -31.78559980    -28.70667492    -3.16955215    -3.32353013    2.00609466    -0.04080545    -1.32848931
  G2-185    -265.80972205    -40.07515770    -36.29057280    -3.92014855    -4.05718791    2.42395731    -0.05263093    -1.61055038
  G2-186    -505.05020796    -48.63385758    -44.35363510    -4.30185562    -4.17816612    2.48459993    -0.03927682    -1.40534275
  G2-187    -564.79037748    -51.46071690    -46.95955833    -4.50688464    -4.35540183    2.59419018    -0.03815752    -1.38412975
  G2-188    -564.77863502    -51.46805441    -46.96027934    -4.51465396    -4.35521299    2.59651726    -0.03759709    -1.37150078
  G2-189    -180.59178192    -30.58917584    -27.59570834    -3.03851336    -3.29243869    1.98336585    -0.03682285    -1.30612740
  G2-190    -313.94981632    -46.89152295    -42.51275817    -4.60970458    -4.73450109    2.83377439    -0.06419641    -1.99683714
  G2-191    -199.66049735    -32.52918030    -29.36303277    -3.23187023    -3.46328134    2.09220483    -0.04026371    -1.35064340
  G2-192    -266.29559115    -40.76061922    -36.88209187    -4.00558701    -4.18986007    2.51479486    -0.05270851    -1.65157592
  G2-193    -505.54333931    -49.30926889    -44.93917118    -4.37934249    -4.31034512    2.57284335    -0.03962472    -1.44939820
  G2-194    -878.05497146    -74.32979889    -68.03240588    -6.32942422    -5.88293791    3.48411953    -0.05273173    -1.82856961
  G2-195    -181.09137033    -31.27256124    -28.18912714    -3.11681240    -3.42539537    2.07190724    -0.03676935    -1.35350972
  G2-196    -402.05137639    -45.41189100    -41.22354975    -4.17686339    -4.23186900    2.54658361    -0.03827891    -1.39374866
  G2-197    -537.30213939    -53.07480200    -48.39915609    -4.75672747    -4.55248144    2.70288809    -0.04438119    -1.61333810
  G2-198    -212.85066858    -35.02991407    -31.64207361    -3.49106203    -3.66615967    2.20093795    -0.04042266    -1.50537718
  G2-199    -232.30302999    -37.75960329    -34.10325060    -3.72802021    -3.98415296    2.39340910    -0.04726339    -1.57300735
  G2-200    -232.37536622    -37.70452424    -34.03923000    -3.75530310    -3.97662728    2.39925570    -0.04799342    -1.57956822
  G2-201    -299.03350843    -45.94465380    -41.56919404    -4.52881116    -4.70320903    2.82200054    -0.06169573    -1.87996856
  G2-202    -538.17884528    -54.54711715    -49.68161974    -4.88545397    -4.83118768    2.87683361    -0.04683460    -1.66397423
  G2-203    -213.72215081    -36.50456819    -32.92603779    -3.62143688    -3.94567283    2.37541996    -0.04430342    -1.56507157
  G2-204    -232.79175568    -38.43285306    -34.68635652    -3.81074896    -4.11635671    2.48302801    -0.04750767    -1.62120607
  G2-205    -375.84872872    -52.64175805    -47.75167005    -5.12637012    -5.03021397    2.99140932    -0.06428378    -1.98454937
  G2-206    -375.84688578    -52.64214893    -47.75208776    -5.12681309    -5.03025602    2.99150946    -0.06396199    -1.98493314
  G2-207    -286.67291096    -42.94078384    -38.86526199    -4.23763834    -4.26108547    2.54664788    -0.05056686    -1.70533433
  G2-208    -265.93283093    -44.33924839    -40.00394387    -4.40163017    -4.76774720    2.87703290    -0.05472865    -1.87378813
  G2-209    -765.12493158    -73.10042166    -66.97630181    -6.43513410    -5.65777177    3.29718962    -0.07322125    -1.82503966
  G2-210    -908.81722217    -85.37483549    -78.32389506    -7.48049451    -6.60180044    3.83875818    -0.09126242    -2.24037569
  G2-211    -1272.49265321    -90.48914529    -83.41602344    -7.14550124    -5.84691886    3.38393842    -0.04160631    -1.49752795
  G2-212    -572.41794423    -49.67636932    -45.63770647    -4.29845116    -3.74917002    2.18858457    -0.05626663    -1.36762219
  G2-213    -1236.51290829    -79.99501707    -73.87099369    -6.16377846    -4.93656989    2.85838256    -0.03363676    -1.05527935
  G2-214    -1680.72166604    -113.49739245    -104.70027443    -8.87997393    -7.24858670    4.19421604    -0.05903784    -1.66045016
  G2-215    -2478.02628347    -160.25355882    -148.00075742    -12.28097035    -9.89331886    5.70976926    -0.06625700    -2.05660211
  G2-216    -1369.73155553    -96.48798340    -88.97967809    -7.70593982    -6.39579241    3.70608492    -0.06703476    -1.72776197
  G2-217    -1614.13339800    -105.17475152    -97.09705593    -8.10771567    -6.51486939    3.76869933    -0.04489789    -1.35355921
  G2-218    -1609.05077695    -104.98797927    -96.96272543    -8.10186429    -6.50906149    3.76602105    -0.05087445    -1.47117730
  G2-219    -1132.63004975    -75.37702616    -69.51759602    -5.87486495    -4.71828239    2.73757174    -0.03144846    -0.95440317
  G2-220    -732.92254574    -62.84996641    -57.65508702    -5.41031267    -4.70548404    2.74823772    -0.05531977    -1.43840737
  G2-221    -601.84786060    -70.70598341    -64.51466712    -6.60530664    -6.04591391    3.54732570    -0.08953108    -2.20696564
  G2-222    -300.90787271    -35.30832235    -32.19928149    -3.32753619    -3.00776516    1.77706036    -0.04659984    -1.07834220
  G2-223    -197.22677780    -32.85596566    -29.63000629    -3.32288071    -3.41090904    2.05761837    -0.03843159    -1.38399727
  F224    -512.57909517    -39.22083909    -36.01060239    -3.30327722    -2.80562329    1.65001234    -0.02534114    -0.84967919
  F230    -1362.02939238    -93.95872403    -86.53142503    -7.45128456    -6.28579747    3.66284520    -0.04488920    -1.51530717
  F234    -247.68184932    -35.07637115    -31.87085379    -3.43645743    -3.43011128    2.04785729    -0.05019962    -1.47715847
  F235    -314.32513179    -43.25654282    -39.35845284    -4.21258807    -4.15418335    2.47104543    -0.06604373    -1.79465047
  F243    -531.65242716    -45.55746318    -41.63982010    -3.92367348    -3.70317528    2.20223512    -0.03087377    -1.11862970
  F244    -189.06450540    -28.09697333    -25.41118536    -2.75850242    -2.85464810    1.72069411    -0.03350686    -1.07739343
  F246    -280.81414469    -40.98455928    -37.18990240    -4.02614867    -4.08200229    2.44166234    -0.05679420    -1.73374320
  F247    -280.81802892    -40.98375298    -37.19140715    -4.02304478    -4.08222836    2.44074129    -0.05712092    -1.73790001
  F248    -347.45668813    -49.16475006    -44.67881336    -4.80100882    -4.80624586    2.86457178    -0.07303231    -2.05090788
  F249    -347.46146300    -49.16298813    -44.68034944    -4.79729288    -4.80647327    2.86339467    -0.07341026    -2.05571065
  F250    -472.40253309    -43.41060988    -39.62085943    -3.79944429    -3.65804892    2.18185650    -0.03223622    -1.17749281
  F251    -472.40633219    -43.40702757    -39.61997173    -3.79658011    -3.65808464    2.18099032    -0.03241861    -1.18264124
  F252    -472.39960436    -43.41013036    -39.62049013    -3.80283764    -3.65825422    2.18283893    -0.03262358    -1.18178796
  F253    -147.94797084    -25.37229050    -22.87014657    -2.53667819    -2.77322603    1.68101938    -0.02947753    -1.08559023
  F254    -147.95419608    -25.36840099    -22.86885806    -2.53389356    -2.77313293    1.68008719    -0.02969881    -1.08929099
  F256    -132.57911587    -23.55310742    -21.19070463    -2.39086695    -2.59719747    1.58131869    -0.02768559    -1.02671440
  F266    -165.71079658    -29.45990581    -26.51341087    -2.97447353    -3.24973849    1.97350610    -0.03481820    -1.28846322
  F267    -165.71207204    -29.45992885    -26.51032114    -2.97889231    -3.24918309    1.97469320    -0.03472588    -1.28372453
  F270    -232.37761172    -37.70185769    -34.03636457    -3.75611846    -3.97626712    2.39939649    -0.04789780    -1.57931119
  F275    -166.15411389    -30.20719635    -27.17272803    -3.03654702    -3.39040970    2.06076635    -0.03518344    -1.32004267
  F277    -232.78965050    -38.44513473    -34.69539733    -3.81200754    -4.11687014    2.48418121    -0.04577636    -1.61525420
  F287    -378.41719525    -55.82938258    -50.64564166    -5.50530092    -5.48902272    3.26733643    -0.07357426    -2.36644243
  F300    -277.85733207    -44.62483848    -40.30410880    -4.49516686    -4.54962827    2.72996944    -0.05196528    -1.92091812
  F301    -296.85219519    -46.63347886    -42.15976843    -4.65418838    -4.73003177    2.83306377    -0.05773315    -1.95669434
  F306    -232.41500670    -42.01732543    -37.81789320    -4.19986617    -4.69590903    2.84391188    -0.04964760    -1.85281985
  F309    -329.98588662    -52.54753183    -47.48870348    -5.23800572    -5.38297371    3.22557392    -0.06464514    -2.21367087
  F332    -99.19750556    -17.28300361    -15.53920782    -1.77673157    -1.86817636    1.14374643    -0.02208774    -0.71858147
  F333    -99.62638908    -18.02408060    -16.18947748    -1.83973198    -2.00648898    1.23116306    -0.02097250    -0.74927691
  F336    -132.11948497    -22.80633843    -20.52958216    -2.32901533    -2.45659008    1.49457279    -0.02657338    -1.00141434
  F340    -132.76225819    -23.92821240    -21.50807062    -2.42571634    -2.65850062    1.62389277    -0.02814349    -1.00961836
  F357    -263.31993164    -44.30784473    -39.96554909    -4.46070303    -4.65604030    2.80101180    -0.05121082    -1.91560331
  F378    -265.47128076    -39.27588522    -35.57018805    -3.88599938    -3.90967302    2.34371265    -0.05327083    -1.59502536
  F379    -266.31009147    -40.65493708    -36.79426671    -4.01853880    -4.18385253    2.51611745    -0.05218623    -1.68606495
  F399    -247.84330717    -30.98019613    -28.34888212    -3.00570407    -2.77440030    1.63949913    -0.04666923    -1.35018712
  F403    -181.45991883    -23.22476162    -21.18414460    -2.26802427    -2.12245068    1.26130935    -0.03829654    -0.95752212
  F404    -248.05704767    -31.45219842    -28.72798017    -3.03176385    -2.85075468    1.68386550    -0.04953177    -1.27806321
  F424    -334.30866946    -41.60530858    -37.87028964    -3.94129570    -3.74054793    2.21462643    -0.05141803    -1.37308478
  F444    -1328.62028829    -87.69667785    -80.89247088    -6.83844834    -5.55806553    3.22645758    -0.03946900    -1.20768439
  F523    -811.78736719    -62.51671065    -57.39267516    -5.15328078    -4.57883732    2.69719401    -0.03847702    -1.30957710
  F536    -505.50462724    -44.98592698    -41.16653214    -3.92640949    -3.59227675    2.12593304    -0.04130340    -1.20146492
  F700    -394.50367353    -65.80892844    -59.39510746    -6.59228363    -6.85514258    4.10806219    -0.07449637    -2.83604299
  F771    -745.51892625    -50.70787034    -46.75488976    -3.97068327    -3.27458170    1.90852924    -0.02263514    -0.78080155
 EtONO    -247.72502201    -35.03239378    -31.81518056    -3.45000325    -3.42571482    2.04903810    -0.05435091    -1.47039120
   cum    -296.89560823    -50.95949030    -45.94184634    -5.10784967    -5.44865545    3.28090601    -0.05834778    -2.20902778
NHL1    -0.19023547    -0.30925638    -0.26560754    -0.04167771    -0.03986945    0.03986945    -0.00033958    0.00000000
NHL2    -95.86382365    -13.10450460    -11.87167057    -1.33520922    -1.21997025    0.73593666    -0.01344594    -0.54842907
NHL3    -95.99223119    -13.45396976    -12.19278854    -1.36436181    -1.28380695    0.77629836    -0.01704274    -0.54915016
NHL4    -99.45799720    -13.30711124    -12.05138184    -1.34815844    -1.22419369    0.73908451    -0.01646156    -0.51249919
NHL5    -99.60565180    -13.66916592    -12.38849852    -1.37751906    -1.28882251    0.78040382    -0.01879185    -0.52815613
NHL6    -66.30702927    -11.74170819    -10.55174034    -1.21454493    -1.29328044    0.79428518    -0.01330062    -0.51431034
NHL7    -66.48574201    -12.12561996    -10.87720956    -1.25149394    -1.35494940    0.83781130    -0.01377693    -0.49220732
NHL8    -33.35423554    -6.21595692    -5.55147105    -0.66261759    -0.70157202    0.44379667    -0.00582238    -0.23681597
NHL9    -99.61451337    -18.03597719    -16.19944137    -1.84074759    -2.00714895    1.23161259    -0.02096713    -0.74859430
NHL10    -80.85104980    -12.04264862    -10.87887433    -1.24396406    -1.18641965    0.72152702    -0.01376401    -0.53050950
NHL11    -80.83186574    -12.04638173    -10.87645495    -1.24174783    -1.18547318    0.72059809    -0.01405421    -0.50555246
NHL12    -89.21214123    -10.22413688    -9.33951822    -0.97145536    -0.89024646    0.53035098    -0.01580052    -0.34553042
NHL13    -122.78236741    -16.29380529    -14.78113911    -1.58116314    -1.55142154    0.93390616    -0.01901357    -0.56555449
NHL14    -212.00938555    -26.51981299    -24.13254751    -2.54254597    -2.44360695    1.46090310    -0.04033465    -0.92058444
NHL15    -431.85911460    -27.69834876    -25.56234461    -2.13654113    -1.73558087    1.01089302    -0.00967599    -0.34471447
NHL16    -465.36416897    -33.76029606    -31.01286724    -2.74928294    -2.40011599    1.41629415    -0.01609047    -0.59879301
NHL17    -897.23386743    -61.46004860    -56.58389033    -4.87773452    -4.13743988    2.42507648    -0.02870610    -0.95157885
NHL18    -554.60454708    -43.97474179    -40.35723045    -3.70978069    -3.29155690    1.94288092    -0.04334843    -0.95821154
NHL19    -554.64533369    -43.99896903    -40.35568348    -3.71018753    -3.28911283    1.94289589    -0.02981095    -0.91685154
NHL20    -66.68765478    -8.71147769    -7.93893069    -0.85638526    -0.84366639    0.50758033    -0.01394012    -0.37544081
NHL21    -100.24357502    -14.82975579    -13.42359154    -1.46462650    -1.50910871    0.91233906    -0.01719254    -0.58206202
NHL22    -189.48300005    -25.06471781    -22.79753486    -2.41285674    -2.40327586    1.43677490    -0.03520985    -0.93929548
NHL23    -189.48039786    -25.01207182    -22.73462839    -2.42744860    -2.39727495    1.43832275    -0.03601552    -0.94842369
NHL24    -162.43549017    -21.28319722    -19.40078313    -2.10002872    -1.94736661    1.15904405    -0.03422927    -0.92824954
NHL25    -66.87072301    -8.54066843    -7.72333097    -0.85769345    -0.77475316    0.47439926    -0.00779351    -0.25770395
NHL26    -178.81429347    -19.91206786    -18.20135055    -1.88941205    -1.66000723    0.98403126    -0.01991456    -0.65918718
NHL27    -89.65558016    -10.39343679    -9.47519577    -0.98171604    -0.90075604    0.53851785    -0.00995560    -0.31869132
NHL28    -521.37446934    -37.49776589    -34.53419309    -3.05407065    -2.51475206    1.46728142    -0.02200467    -0.64870076
NHL29    -432.24013279    -27.85185391    -25.69563718    -2.15268893    -1.74819435    1.02069123    -0.00827426    -0.34198228
NHL30    -89.38983573    -10.00556900    -9.06820806    -0.97328192    -0.81664846    0.49536697    -0.00760630    -0.23338069
NHL31    -431.97345606    -27.49563461    -25.35131277    -2.13536714    -1.66934338    0.97782069    -0.00748474    -0.28454985
NHT1    -96.02907205    -13.39245383    -12.14818877    -1.36420418    -1.27550786    0.77382570    -0.01732495    -0.56900154
NHT2    -99.64439914    -13.59924444    -12.32071346    -1.38064830    -1.27445248    0.77732526    -0.02023433    -0.52802484
NHT3    -66.49768668    -12.03615341    -10.81413964    -1.24912682    -1.34252124    0.83292086    -0.01643701    -0.52219266
NHT4    -99.64347098    -17.94469665    -16.12272246    -1.85595104    -2.00130332    1.23313600    -0.02514147    -0.77835350
NHT5    -80.83262274    -11.98367998    -10.82858747    -1.23926299    -1.18271505    0.71909049    -0.01458208    -0.52830152
NHT6    -212.02100256    -26.46918660    -24.11083910    -2.54146149    -2.44314781    1.45927861    -0.05023094    -0.96223449
NHT7    -897.25267875    -61.40741657    -56.55521000    -4.87851273    -4.13603654    2.42386698    -0.03750974    -0.98436101
NHT8    -554.62952217    -43.93873943    -40.33537726    -3.71017626    -3.29001977    1.94185042    -0.04817585    -0.97795869
NHT9    -189.48532039    -24.96939943    -22.72356136    -2.42603368    -2.39816742    1.43715719    -0.04706965    -0.99297685
NHT10    -162.62818544    -21.53610189    -19.64457142    -2.13063333    -2.00029144    1.19585886    -0.03388767    -0.94548111
NHT11    -122.99631993    -16.49580722    -14.98948020    -1.61745443    -1.60105314    0.97126334    -0.02123496    -0.61324555
NHT12    -179.01304008    -20.18953798    -18.47167641    -1.92327851    -1.70895135    1.02097737    -0.02916574    -0.67244181
NHT13    -554.75436888    -43.64812818    -40.07344682    -3.70527862    -3.22082357    1.90688070    -0.03085334    -0.93211054
NHT14    -432.41218726    -28.12312060    -25.95944560    -2.18026725    -1.80196816    1.05717374    -0.01132644    -0.37672022
NHT15    -89.85125726    -10.59946589    -9.69470744    -1.00657782    -0.94861296    0.57184292    -0.01130946    -0.35305642
HL1    -0.19023547    -0.30925638    -0.26560754    -0.04167771    -0.03986945    0.03986945    -0.00033958    0.00000000
HL2    -432.24013279    -27.85185391    -25.69563718    -2.15268893    -1.74819435    1.02069123    -0.00827426    -0.34198228
HL3    -0.47489055    -0.65733652    -0.56688834    -0.08949136    -0.13024466    0.09201813    -0.00087880    -0.05067705
HL4    -431.97345606    -27.49563461    -25.35131277    -2.13536714    -1.66934338    0.97782069    -0.00748474    -0.28454985
HL5    -66.87072301    -8.54066843    -7.72333097    -0.85769345    -0.77475316    0.47439926    -0.00779351    -0.25770395
HL6    -67.12418606    -8.92608608    -8.11184393    -0.86901515    -0.85777597    0.51736280    -0.00901524    -0.33182818
HL7    -33.35423554    -6.21595692    -5.55147105    -0.66261759    -0.70157202    0.44379667    -0.00582238    -0.23681597
HL8    -33.61976338    -6.58558085    -5.89843291    -0.68557176    -0.78254792    0.48765282    -0.00702653    -0.29169368
HL9    -48.55133742    -7.66031190    -6.92153326    -0.76828789    -0.81802003    0.49995233    -0.00784392    -0.32057394
HL10    -48.30328725    -7.27592502    -6.54767086    -0.75312739    -0.73584415    0.45693647    -0.00696927    -0.25906681
HL11    -66.74469457    -12.49909446    -11.22198279    -1.27652058    -1.43475091    0.88198102    -0.01391025    -0.54378002
HL12    -66.48585024    -12.12549294    -10.87714417    -1.25146041    -1.35494780    0.83780314    -0.01378263    -0.49223975
HL13    -89.38983573    -10.00556900    -9.06820806    -0.97328192    -0.81664846    0.49536697    -0.00760630    -0.23338069
HL14    -89.65558016    -10.39343679    -9.47519577    -0.98171604    -0.90075604    0.53851785    -0.00995560    -0.31869132
HL15    -66.61555928    -8.18840153    -7.36929467    -0.83755461    -0.68762019    0.43015042    -0.00570465    -0.18141985
HL16    -318.81825097    -23.65326364    -21.73221907    -1.91766017    -1.65935184    0.98259320    -0.01196603    -0.39675581
HL17    -318.57195589    -23.29851038    -21.40666647    -1.89046444    -1.58123348    0.93841945    -0.01049067    -0.34879143
HL18    -372.99754598    -25.70051005    -23.67198107    -2.02946380    -1.70256458    1.00012324    -0.01048245    -0.40224624
HL19    -372.74181464    -25.34753708    -23.33861852    -2.00797648    -1.62421686    0.95682119    -0.00938065    -0.34823989
HL20    -48.05505578    -6.91910400    -6.20455432    -0.72978766    -0.64975714    0.41296235    -0.00574139    -0.19280535
HL21    -165.25728850    -28.72991595    -25.87280670    -2.91528457    -3.11028377    1.88746751    -0.03520483    -1.25470966
HT1    -432.41140300    -28.15404828    -25.96577026    -2.19700584    -1.80649151    1.06305883    -0.01138174    -0.36229800
HT2    -67.33905825    -9.16089147    -8.31874062    -0.91588316    -0.91092784    0.55845080    -0.01483590    -0.35515686
HT3    -33.81440814    -6.84876628    -6.13613527    -0.72496017    -0.83654411    0.52833480    -0.00968879    -0.31440015
HT4    -100.48423442    -15.08084081    -13.64705467    -1.51347754    -1.56520830    0.95578248    -0.02080057    -0.60931048
HT5    -0.66217596    -0.93844925    -0.82655471    -0.12078877    -0.18173521    0.12905147    -0.00257988    -0.06723832
HT6    -115.42904990    -16.13730838    -14.66741541    -1.59528147    -1.60091842    0.96763145    -0.02271019    -0.65611212
HT7    -465.59331568    -34.04382150    -31.26226532    -2.79431643    -2.45739156    1.45988626    -0.01836258    -0.61288075
HT8    -133.61475253    -20.99132095    -18.97038164    -2.10404253    -2.21759299    1.35000073    -0.02947892    -0.86446695
HT9    -89.87041409    -10.61814713    -9.65921999    -1.03778781    -0.95283389    0.58117207    -0.02078558    -0.32747358
HT10    -100.22633049    -14.71776904    -13.28273345    -1.49757711    -1.48095422    0.91245219    -0.01877567    -0.53144154
HT11    -319.01844311    -23.93104517    -21.98708061    -1.95184421    -1.71029950    1.02137818    -0.01477858    -0.41704304
HT12    -67.07559706    -8.80051900    -7.96388234    -0.89522613    -0.82575095    0.51352027    -0.01141049    -0.28226905
HT13    -373.19450443    -25.97939365    -23.92851367    -2.06396301    -1.75415657    1.03889457    -0.01315067    -0.42387186
HT14    -498.86620949    -35.95390438    -33.07611509    -2.96155598    -2.44690764    1.44426350    -0.03811810    -0.60814183
HT15    -81.65722003    -13.45262242    -12.10753314    -1.39130561    -1.44200913    0.89499307    -0.01783439    -0.53582866
HT16    -114.78492305    -19.36515056    -17.43364553    -1.98037948    -2.09479743    1.28899742    -0.02514099    -0.79150062
HT17    -115.03577994    -19.73203491    -17.78934737    -1.99879086    -2.17835510    1.33222451    -0.02625146    -0.85810828
HT18    -81.90762031    -13.81963631    -12.46398706    -1.40919473    -1.52574812    0.93814747    -0.01864736    -0.60246776
HT19    -165.22101883    -28.67395521    -25.86832740    -2.89206276    -3.11168738    1.88194914    -0.03380560    -1.29933008
NB1    -48.55665649    -7.65464385    -6.91665446    -0.76821660    -0.81771367    0.49985339    -0.00788595    -0.32147282
NB2    -89.65842794    -10.39028950    -9.47263467    -0.98168131    -0.90061115    0.53845927    -0.00999982    -0.31930609
NB3    -67.12896662    -8.92083036    -8.10746711    -0.86896284    -0.85751798    0.51727150    -0.00906719    -0.33287567
NB4    -147.90644635    -21.06799956    -19.11829291    -2.07254651    -2.05678548    1.23142371    -0.03042145    -0.84226119
NB5    -166.49660495    -22.31517381    -20.28870228    -2.17588692    -2.09504717    1.24887732    -0.03224674    -0.85639382
NB6    -66.31481967    -11.73348356    -10.54443704    -1.21450855    -1.29279936    0.79416353    -0.01336161    -0.51568384
NB7    -178.82446800    -19.89922086    -18.19113476    -1.89072213    -1.65942996    0.98410965    -0.02012251    -0.66703982
NB8    -521.38037216    -37.49103454    -34.52845683    -3.05471741    -2.51440753    1.46731125    -0.02211585    -0.65114758
NB9    -65.86299569    -10.97184473    -9.87081826    -1.15077475    -1.15134802    0.70646345    -0.01217470    -0.49855978
NB10    -80.85773908    -12.03502869    -10.87246841    -1.24401843    -1.18604617    0.72143784    -0.01386145    -0.53334020
NB11    -863.96785975    -54.99685854    -50.79010931    -4.22254677    -3.36487051    1.95031403    -0.01860469    -0.66584312
NB12    -373.00063918    -25.69714617    -23.66922487    -2.02935289    -1.70237894    1.00005253    -0.01051051    -0.40286312
NB13    -432.24179602    -27.85010140    -25.69413583    -2.15265787    -1.74809537    1.02065666    -0.00829292    -0.34222136
NB14    -465.36790686    -33.75642438    -31.00942575    -2.74925348    -2.39988256    1.41623242    -0.01612219    -0.59923719
NB15    -406.12441984    -31.60849609    -28.99135058    -2.62292161    -2.35477750    1.39515442    -0.01785978    -0.66057793
NB16    -116.45978994    -12.06001029    -11.00542552    -1.10316291    -0.94565342    0.56254610    -0.00912982    -0.28214044
NB17    -197.49923941    -33.23676888    -29.97576989    -3.34885250    -3.49172877    2.10184480    -0.03688932    -1.42601026
NB18    -33.62272888    -6.58253010    -5.89571839    -0.68550429    -0.78236223    0.48759475    -0.00704409    -0.29198528
NB19    -1.83868023    -1.02035674    -0.88042122    -0.14163340    -0.15000509    0.10622447    -0.00102535    -0.04095907
NB20    -496.66083084    -30.14007147    -27.83584358    -2.28677527    -1.79617121    1.04479643    -0.00631226    -0.32671323
NB21    -97.11207787    -15.31251340    -13.84160449    -1.52979287    -1.63674303    0.99793824    -0.01628074    -0.64656077
NB22    -179.31611017    -20.78685780    -18.95646994    -1.95621288    -1.80261071    1.07462504    -0.02056035    -0.64014132
NB23    -134.25602711    -17.84895519    -16.22802518    -1.72973686    -1.71671058    1.03219008    -0.01878057    -0.66845623
NB24    -115.68408550    -16.58314952    -15.03983364    -1.62768581    -1.67735906    1.01462622    -0.01787911    -0.65881389
NB25    -295.80405868    -42.15924736    -38.27485023    -4.12476391    -4.11834758    2.45751042    -0.06213090    -1.69394957
NB26    -332.97455566    -44.66633058    -40.63073228    -4.32704979    -4.19604792    2.49148927    -0.06641096    -1.71796168
NB27    -245.13857883    -31.62824536    -28.74222532    -3.10036345    -2.95323256    1.77669673    -0.04059196    -1.19123465
NB28    -227.38520348    -27.54176188    -25.11330517    -2.65300654    -2.47821646    1.48191110    -0.04096186    -1.00499041
NB29    -587.24037791    -48.46174292    -44.41588521    -4.19249423    -3.66844890    2.17041095    -0.03848210    -1.16314840
NB30    -602.23575199    -49.52874215    -45.41642686    -4.28740708    -3.70273871    2.18549033    -0.03961728    -1.19653168
NB31    -912.53068065    -62.64323165    -57.71755194    -4.97894440    -4.18464066    2.44687022    -0.03294722    -1.00549979
NB32    -588.51053931    -46.41139887    -42.65026210    -3.91164846    -3.37413361    1.98102870    -0.03624541    -0.99542754
NB33    -569.93647675    -45.14441510    -41.47858624    -3.80332522    -3.33664568    1.96217309    -0.03705534    -1.00559084
NB34    -746.00002803    -51.39504838    -47.34421879    -4.05302305    -3.40588349    1.99882003    -0.02162469    -0.81020942
NB35    -864.48173502    -55.70214451    -51.39558260    -4.29907072    -3.49742210    2.03973611    -0.01723957    -0.68875743
NB36    -805.24143669    -53.54892398    -49.37368937    -4.17369758    -3.45222225    2.01876124    -0.01993418    -0.75139488
NB37    -897.60723834    -61.60920893    -56.71486190    -4.89178665    -4.14986370    2.43426099    -0.02548299    -0.94910742
NB38    -486.98061554    -43.64719942    -39.87322961    -3.85898984    -3.54240734    2.11462156    -0.03234471    -1.19872015
NB39    -838.36422906    -59.46105450    -54.70035254    -4.76337100    -4.10528737    2.41287314    -0.02769814    -1.01301491
NB40    -313.95729397    -45.29815096    -40.98427326    -4.44842299    -4.43796533    2.66324068    -0.04611675    -1.71046859
NB41    -150.08207707    -18.64301261    -16.90214108    -1.78739361    -1.72822712    1.04975874    -0.01615003    -0.57477668
NB42    -498.50019739    -31.15962747    -28.71604120    -2.42769949    -1.94620519    1.15079098    -0.00741223    -0.36789996
NB43    -118.29888627    -13.07990646    -11.88574935    -1.24427322    -1.09568490    0.66856693    -0.01017475    -0.32323635
NB44    -232.91935597    -24.12029793    -22.01145318    -2.20551899    -1.89142872    1.12478018    -0.01822457    -0.56458684
NB45    -613.12011817    -42.20050692    -38.84221321    -3.38883441    -2.74201199    1.60699236    -0.01542073    -0.60937316
NB46    -67.24297899    -13.16658049    -11.79470631    -1.36736840    -1.56537054    0.97429468    -0.01412642    -0.58636777
NB47    -131.72438867    -21.94565192    -19.74589882    -2.29718366    -2.30350717    1.41189374    -0.02453754    -0.99968805
NB48    -132.62452325    -23.47054228    -21.09664392    -2.42127589    -2.58699629    1.58634643    -0.02690570    -1.03684595
NB49    -394.94242022    -66.52653665    -60.00537509    -6.68824060    -6.98813276    4.20256631    -0.07375776    -2.86155198
NB50    -394.94259370    -66.53057280    -60.00850568    -6.68754734    -6.98824561    4.20206929    -0.07368704    -2.85570641
NB51    -394.94155050    -66.52830717    -60.00828703    -6.68539882    -6.98855684    4.20177527    -0.07389220    -2.86377400
NB52    -197.47514419    -33.26188929    -29.99852352    -3.34847006    -3.49320168    2.10210852    -0.03668803    -1.42228099
C6H6    -197.47515157    -33.26188449    -29.99851455    -3.34847455    -3.49320032    2.10210932    -0.03668803    -1.42228098
s32    -394.89867133    -66.54872551    -60.04029709    -6.67224611    -6.99251878    4.19892869    -0.07415920    -2.88855186
s33    -394.91039097    -66.54319740    -60.03177598    -6.67552200    -6.99153975    4.19966035    -0.07408337    -2.88280250
s34    -394.91958752    -66.53860751    -60.02480478    -6.67838519    -6.99071648    4.20031320    -0.07401488    -2.87785642
s35    -394.92672451    -66.53494405    -60.01912780    -6.68093291    -6.99001420    4.20089099    -0.07395400    -2.87359078
s36    -394.93224447    -66.53204743    -60.01451465    -6.68315747    -6.98941054    4.20139358    -0.07389957    -2.86990212
s37    -394.93654625    -66.52973730    -60.01078090    -6.68506054    -6.98890675    4.20183449    -0.07384813    -2.86671051
s38    -394.93985867    -66.52794551    -60.00778323    -6.68673339    -6.98848371    4.20222158    -0.07380035    -2.86394715
s39    -394.94234969    -66.52662177    -60.00539808    -6.68824433    -6.98811814    4.20255659    -0.07375776    -2.86155195
s40    -394.94425041    -66.52562446    -60.00350234    -6.68956695    -6.98781297    4.20284828    -0.07371863    -2.85947704
s41    -394.94577650    -66.52480446    -60.00198521    -6.69066365    -6.98757970    4.20310922    -0.07368072    -2.85768396
s42    -394.94698034    -66.52415436    -60.00077737    -6.69158810    -6.98739782    4.20333829    -0.07364517    -2.85613504
s45    -394.94867163    -66.52348281    -59.99862320    -6.69390313    -6.98691912    4.20378684    -0.07355768    -2.85262093
s50    -394.94974245    -66.52319521    -59.99726192    -6.69580665    -6.98660908    4.20416676    -0.07346040    -2.84922565
s55    -394.95001242    -66.52329906    -59.99694277    -6.69655245    -6.98649557    4.20426965    -0.07341575    -2.84743287
s60    -394.95008029    -66.52343967    -59.99688887    -6.69683361    -6.98643960    4.20426640    -0.07339692    -2.84639987
s65    -394.95017021    -66.52348604    -59.99684767    -6.69695196    -6.98640917    4.20424488    -0.07338852    -2.84576151
t44    -394.91151563    -66.54830898    -60.03480519    -6.67552443    -6.99132386    4.19925570    -0.07415920    -2.86913093
t45    -394.92033496    -66.54362894    -60.02804150    -6.67821540    -6.99058596    4.19985412    -0.07408337    -2.86599754
t46    -394.92728137    -66.53979773    -60.02243245    -6.68059801    -6.98995079    4.20039781    -0.07401488    -2.86328033
t47    -394.93272201    -66.53667533    -60.01780203    -6.68271029    -6.98940701    4.20089126    -0.07395400    -2.86092648
t48    -394.93696234    -66.53414278    -60.01398941    -6.68457710    -6.98894298    4.20133700    -0.07389957    -2.85888520
t49    -394.94025143    -66.53209810    -60.01085904    -6.68621999    -6.98854861    4.20173713    -0.07384813    -2.85711728
t50    -394.94259351    -66.53057359    -60.00850071    -6.68755027    -6.98824064    4.20206534    -0.07380035    -2.85570636
t51    -394.94471648    -66.52912322    -60.00622645    -6.68893333    -6.98793143    4.20241056    -0.07375776    -2.85424967
t52    -394.94617662    -66.52810683    -60.00454157    -6.69004041    -6.98769280    4.20269045    -0.07371863    -2.85308856
t53    -394.94727579    -66.52729072    -60.00317829    -6.69101125    -6.98749140    4.20293689    -0.07368072    -2.85207534
t54    -394.94808961    -66.52666055    -60.00208060    -6.69186224    -6.98732196    4.20315300    -0.07364517    -2.85118381
t55    -394.94869066    -66.52615603    -60.00119734    -6.69260080    -6.98717921    4.20334059    -0.07355768    -2.85040104
t56    -394.94912434    -66.52577838    -60.00048454    -6.69323963    -6.98705805    4.20350126    -0.07346040    -2.84971893
t59    -394.94980928    -66.52507283    -59.99908079    -6.69468724    -6.98680177    4.20385298    -0.07341575    -2.84813609
t64    -394.95007384    -66.52461128    -59.99805315    -6.69596601    -6.98658847    4.20413514    -0.07339692    -2.84657758
t69    -394.95015031    -66.52433819    -59.99761507    -6.69651419    -6.98649463    4.20421237    -0.07338852    -2.84575773
t74    -394.95018810    -66.52418034    -59.99739550    -6.69674003    -6.98645028    4.20422284    -0.07336178    -2.84529899
t79    -394.95021169    -66.52409656    -59.99727546    -6.69683459    -6.98642811    4.20421994    -0.07336488    -2.84502816
pd32L20    -394.92756606    -66.53628769    -60.02159270    -6.67827600    -6.99029173    4.20003280    -0.07415920    -2.87290612
pd32L18    -394.92597639    -66.53706140    -60.02310786    -6.67710765    -6.99052527    4.19975695    -0.07408337    -2.87481228
pd32L16    -394.92396710    -66.53795480    -60.02482354    -6.67601947    -6.99077094    4.19950882    -0.07401488    -2.87675177
pd32L14    -394.92137630    -66.53909461    -60.02679476    -6.67503812    -6.99103543    4.19930050    -0.07395400    -2.87875945
pd32L12    -394.91814415    -66.54047902    -60.02903156    -6.67418971    -6.99132260    4.19914330    -0.07389957    -2.88076832
pd32L10    -394.91424049    -66.54215602    -60.03147655    -6.67351362    -6.99159794    4.19902494    -0.07384813    -2.88275236
pd32L08    -394.90993359    -66.54409176    -60.03400681    -6.67299841    -6.99186888    4.19895276    -0.07380035    -2.88458614
pd32L06    -394.90569652    -66.54587469    -60.03642159    -6.67263540    -6.99212266    4.19892226    -0.07375776    -2.88619699
pd32L04    -394.90203673    -66.54740717    -60.03844772    -6.67240525    -6.99232854    4.19891615    -0.07371863    -2.88745283
pd32L02    -394.89955861    -66.54836527    -60.03981448    -6.67228269    -6.99246898    4.19892389    -0.07368072    -2.88826375
pd32L00    -394.89867133    -66.54872551    -60.04029709    -6.67224611    -6.99251878    4.19892869    -0.07415920    -2.88855186
pd32R02    -394.89955861    -66.54836527    -60.03981448    -6.67228269    -6.99246898    4.19892389    -0.07368072    -2.88826375
pd32R04    -394.90203673    -66.54740717    -60.03844772    -6.67240525    -6.99232854    4.19891615    -0.07371863    -2.88745283
pd32R06    -394.90569652    -66.54587469    -60.03642159    -6.67263540    -6.99212266    4.19892226    -0.07375776    -2.88619699
pd32R08    -394.90993359    -66.54409176    -60.03400681    -6.67299841    -6.99186888    4.19895276    -0.07380035    -2.88458614
pd32R10    -394.91424049    -66.54215602    -60.03147655    -6.67351362    -6.99159794    4.19902494    -0.07384813    -2.88275236
pd32R12    -394.91814415    -66.54047902    -60.02903156    -6.67418971    -6.99132260    4.19914330    -0.07389957    -2.88076832
pd32R14    -394.92137630    -66.53909461    -60.02679476    -6.67503812    -6.99103543    4.19930050    -0.07395400    -2.87875945
pd32R16    -394.92396710    -66.53795480    -60.02482354    -6.67601947    -6.99077094    4.19950882    -0.07401488    -2.87675177
pd32R18    -394.92597639    -66.53706140    -60.02310786    -6.67710765    -6.99052527    4.19975695    -0.07408337    -2.87481228
pd32R20    -394.92756606    -66.53628769    -60.02159270    -6.67827600    -6.99029173    4.20003280    -0.07415920    -2.87290612
pd34L20    -394.93717394    -66.53119462    -60.01279471    -6.68301480    -6.98914452    4.20117597    -0.07415920    -2.86643454
pd34L18    -394.93628424    -66.53138438    -60.01374286    -6.68214400    -6.98931514    4.20097385    -0.07408337    -2.86788648
pd34L16    -394.93506127    -66.53186511    -60.01483569    -6.68133019    -6.98949158    4.20079051    -0.07401488    -2.86936534
pd34L14    -394.93342687    -66.53255407    -60.01610841    -6.68060150    -6.98967111    4.20062997    -0.07395400    -2.87086639
pd34L12    -394.93135099    -66.53358116    -60.01756211    -6.67997457    -6.98986293    4.20050387    -0.07389957    -2.87236226
pd34L10    -394.92895384    -66.53461080    -60.01916019    -6.67944974    -6.99006568    4.20041454    -0.07384813    -2.87379775
pd34L08    -394.92635093    -66.53572618    -60.02080294    -6.67903843    -6.99026380    4.20035763    -0.07380035    -2.87509036
pd34L06    -394.92380177    -66.53680999    -60.02235406    -6.67874036    -6.99044574    4.20032930    -0.07375776    -2.87621616
pd34L04    -394.92158061    -66.53776765    -60.02364008    -6.67854525    -6.99057901    4.20031059    -0.07371863    -2.87709012
pd34L02    -394.92010134    -66.53832344    -60.02449945    -6.67843118    -6.99067185    4.20030673    -0.07368072    -2.87764994
pd34L00    -394.91958752    -66.53860751    -60.02480478    -6.67838519    -6.99071648    4.20031320    -0.07401488    -2.87785642
pd34R02    -394.92010134    -66.53832344    -60.02449945    -6.67843118    -6.99067185    4.20030673    -0.07368072    -2.87764994
pd34R04    -394.92158061    -66.53776765    -60.02364008    -6.67854525    -6.99057901    4.20031059    -0.07371863    -2.87709012
pd34R06    -394.92380177    -66.53680999    -60.02235406    -6.67874036    -6.99044574    4.20032930    -0.07375776    -2.87621616
pd34R08    -394.92635093    -66.53572618    -60.02080294    -6.67903843    -6.99026380    4.20035763    -0.07380035    -2.87509036
pd34R10    -394.92895384    -66.53461080    -60.01916019    -6.67944974    -6.99006568    4.20041454    -0.07384813    -2.87379775
pd34R12    -394.93135099    -66.53358116    -60.01756211    -6.67997457    -6.98986293    4.20050387    -0.07389957    -2.87236226
pd34R14    -394.93342687    -66.53255407    -60.01610841    -6.68060150    -6.98967111    4.20062997    -0.07395400    -2.87086639
pd34R16    -394.93506127    -66.53186511    -60.01483569    -6.68133019    -6.98949158    4.20079051    -0.07401488    -2.86936534
pd34R18    -394.93628424    -66.53138438    -60.01374286    -6.68214400    -6.98931514    4.20097385    -0.07408337    -2.86788648
pd34R20    -394.93717394    -66.53119462    -60.01279471    -6.68301480    -6.98914452    4.20117597    -0.07415920    -2.86643454
pd36L20    -394.94288015    -66.52782865    -60.00704405    -6.68662899    -6.98833321    4.20206282    -0.07415920    -2.86153021
pd36L18    -394.94231011    -66.52803983    -60.00761820    -6.68599209    -6.98844308    4.20191086    -0.07408337    -2.86264374
pd36L16    -394.94159721    -66.52812593    -60.00829229    -6.68539600    -6.98856382    4.20177518    -0.07401488    -2.86377398
pd36L14    -394.94059144    -66.52863529    -60.00908899    -6.68484389    -6.98869701    4.20165995    -0.07395400    -2.86490336
pd36L12    -394.93936438    -66.52911010    -60.01000573    -6.68436247    -6.98883875    4.20156840    -0.07389957    -2.86599969
pd36L10    -394.93787800    -66.52973141    -60.01101300    -6.68397395    -6.98897069    4.20149414    -0.07384813    -2.86703064
pd36L08    -394.93627287    -66.53040974    -60.01204448    -6.68367053    -6.98909736    4.20144191    -0.07380035    -2.86794738
pd36L06    -394.93473216    -66.53104621    -60.01300910    -6.68344234    -6.98921794    4.20141281    -0.07375776    -2.86874482
pd36L04    -394.93345439    -66.53144818    -60.01380401    -6.68328297    -6.98931773    4.20139822    -0.07371863    -2.86935761
pd36L02    -394.93257297    -66.53183751    -60.01433003    -6.68318872    -6.98938675    4.20139438    -0.07368072    -2.86975232
pd36L00    -394.93224447    -66.53204743    -60.01451465    -6.68315747    -6.98941054    4.20139358    -0.07389957    -2.86990212
pd36R02    -394.93257297    -66.53183751    -60.01433003    -6.68318872    -6.98938675    4.20139438    -0.07368072    -2.86975232
pd36R04    -394.93345439    -66.53144818    -60.01380401    -6.68328297    -6.98931773    4.20139822    -0.07371863    -2.86935761
pd36R06    -394.93473216    -66.53104621    -60.01300910    -6.68344234    -6.98921794    4.20141281    -0.07375776    -2.86874482
pd36R08    -394.93627287    -66.53040974    -60.01204448    -6.68367053    -6.98909736    4.20144191    -0.07380035    -2.86794738
pd36R10    -394.93787800    -66.52973141    -60.01101300    -6.68397395    -6.98897069    4.20149414    -0.07384813    -2.86703064
pd36R12    -394.93936438    -66.52911010    -60.01000573    -6.68436247    -6.98883875    4.20156840    -0.07389957    -2.86599969
pd36R14    -394.94059144    -66.52863529    -60.00908899    -6.68484389    -6.98869701    4.20165995    -0.07395400    -2.86490336
pd36R16    -394.94159721    -66.52812593    -60.00829229    -6.68539600    -6.98856382    4.20177518    -0.07401488    -2.86377398
pd36R18    -394.94231011    -66.52803983    -60.00761820    -6.68599209    -6.98844308    4.20191086    -0.07408337    -2.86264374
pd36R20    -394.94288015    -66.52782865    -60.00704405    -6.68662899    -6.98833321    4.20206282    -0.07415920    -2.86153021
pd38L20    -394.94618887    -66.52580503    -60.00332625    -6.68936504    -6.98776034    4.20273670    -0.07415920    -2.85781549
pd38L18    -394.94590453    -66.52574992    -60.00366518    -6.68888905    -6.98784525    4.20263273    -0.07408337    -2.85867009
pd38L16    -394.94546771    -66.52582763    -60.00406702    -6.68845080    -6.98792881    4.20253550    -0.07401488    -2.85952370
pd38L14    -394.94485932    -66.52600503    -60.00454805    -6.68805881    -6.98801213    4.20244767    -0.07395400    -2.86036057
pd38L12    -394.94408611    -66.52640741    -60.00510107    -6.68770633    -6.98810649    4.20237817    -0.07389957    -2.86116529
pd38L10    -394.94321245    -66.52671885    -60.00571043    -6.68740238    -6.98820152    4.20232313    -0.07384813    -2.86191694
pd38L08    -394.94228612    -66.52705103    -60.00632951    -6.68715106    -6.98829593    4.20228468    -0.07380035    -2.86257007
pd38L06    -394.94139039    -66.52736916    -60.00690151    -6.68696292    -6.98838032    4.20226016    -0.07375776    -2.86313619
pd38L04    -394.94059699    -66.52766366    -60.00736763    -6.68683574    -6.98843539    4.20223823    -0.07371863    -2.86356577
pd38L02    -394.94006471    -66.52779729    -60.00767410    -6.68676066    -6.98846925    4.20222447    -0.07368072    -2.86384263
pd38L00    -394.93985867    -66.52794551    -60.00778323    -6.68673339    -6.98848371    4.20222158    -0.07380035    -2.86394715
pd38R02    -394.94006471    -66.52779729    -60.00767410    -6.68676066    -6.98846925    4.20222447    -0.07368072    -2.86384263
pd38R04    -394.94059699    -66.52766366    -60.00736763    -6.68683574    -6.98843539    4.20223823    -0.07371863    -2.86356577
pd38R06    -394.94139039    -66.52736916    -60.00690151    -6.68696292    -6.98838032    4.20226016    -0.07375776    -2.86313619
pd38R08    -394.94228612    -66.52705103    -60.00632951    -6.68715106    -6.98829593    4.20228468    -0.07380035    -2.86257007
pd38R10    -394.94321245    -66.52671885    -60.00571043    -6.68740238    -6.98820152    4.20232313    -0.07384813    -2.86191694
pd38R12    -394.94408611    -66.52640741    -60.00510107    -6.68770633    -6.98810649    4.20237817    -0.07389957    -2.86116529
pd38R14    -394.94485932    -66.52600503    -60.00454805    -6.68805881    -6.98801213    4.20244767    -0.07395400    -2.86036057
pd38R16    -394.94546771    -66.52582763    -60.00406702    -6.68845080    -6.98792881    4.20253550    -0.07401488    -2.85952370
pd38R18    -394.94590453    -66.52574992    -60.00366518    -6.68888905    -6.98784525    4.20263273    -0.07408337    -2.85867009
pd38R20    -394.94618887    -66.52580503    -60.00332625    -6.68936504    -6.98776034    4.20273670    -0.07415920    -2.85781549
BM0    -231.19403195    -39.74254638    -35.80246120    -4.03473361    -4.26957773    2.58849890    -0.04451501    -1.72931545
BM1    -231.19400178    -39.74260798    -35.80257784    -4.03457161    -4.26960719    2.58849189    -0.04451472    -1.72955036
BM2    -231.19398122    -39.74264353    -35.80266311    -4.03444159    -4.26962912    2.58847655    -0.04451498    -1.72971774
BM3    -231.19394663    -39.74268725    -35.80278651    -4.03424213    -4.26965839    2.58844519    -0.04452312    -1.72993961
BM4    -231.19389557    -39.74275787    -35.80297197    -4.03396823    -4.26970409    2.58839510    -0.04452551    -1.73021843
BM5    -231.19379550    -39.74286831    -35.80325512    -4.03357647    -4.26976424    2.58830798    -0.04454413    -1.73058777
BM6    -231.19361954    -39.74304849    -35.80369024    -4.03302407    -4.26985430    2.58817869    -0.04456127    -1.73106039
BM7    -231.19328170    -39.74333634    -35.80436078    -4.03228016    -4.26998455    2.58799331    -0.04459269    -1.73168847
BM8    -231.19262807    -39.74383563    -35.80540460    -4.03127057    -4.27017063    2.58773673    -0.04463012    -1.73251845
BM9    -231.19210431    -39.74421565    -35.80612995    -4.03065513    -4.27029129    2.58757779    -0.04465221    -1.73303025
BM10    -231.19139294    -39.74471525    -35.80703407    -4.02994968    -4.27043355    2.58739522    -0.04467952    -1.73362339
BM11    -231.19043983    -39.74536892    -35.80815878    -4.02914427    -4.27060211    2.58718785    -0.04470839    -1.73430507
BM12    -231.18916995    -39.74622082    -35.80955414    -4.02823256    -4.27080106    2.58695354    -0.04473770    -1.73508661
BM13    -231.18749843    -39.74730797    -35.81127744    -4.02720121    -4.27103615    2.58669077    -0.04477176    -1.73599077
BM14    -231.18532013    -39.74867764    -35.81339727    -4.02603233    -4.27131449    2.58639833    -0.04481007    -1.73703719
BM15    -231.18249639    -39.75039544    -35.81599557    -4.02471407    -4.27164300    2.58607464    -0.04485013    -1.73824430
BM16    -231.17885549    -39.75253412    -35.81916703    -4.02323291    -4.27202884    2.58571786    -0.04489428    -1.73964174
BM17    -231.17419349    -39.75517402    -35.82301256    -4.02156552    -4.27247828    2.58532503    -0.04494361    -1.74126073
BM18    -231.16825751    -39.75841540    -35.82765778    -4.01969549    -4.27300031    2.58489516    -0.04499635    -1.74313075
BM19    -231.19414994    -39.74233827    -35.80223599    -4.03489781    -4.26953516    2.58848630    -0.04452961    -1.72888063
A0    -33.63698969    -6.56753648    -5.88239924    -0.68517622    -0.78144793    0.48730932    -0.00713238    -0.29345119
MM17    -67.26375636    -13.14148368    -11.77506793    -1.36290235    -1.56446377    0.97263880    -0.01444965    -0.59140065
MM16    -67.26647487    -13.13983388    -11.77277117    -1.36402497    -1.56417640    0.97295448    -0.01440487    -0.59077963
MM15    -67.26848223    -13.13859652    -11.77098247    -1.36500618    -1.56394120    0.97323446    -0.01436621    -0.59024313
MM14    -67.26996163    -13.13767036    -11.76959113    -1.36584852    -1.56374885    0.97347885    -0.01433432    -0.58977973
MM13    -67.27104751    -13.13698086    -11.76851122    -1.36656319    -1.56359136    0.97368930    -0.01430921    -0.58937953
MM12    -67.27183247    -13.13648175    -11.76768146    -1.36717854    -1.56346313    0.97386980    -0.01428816    -0.58903200
MM11    -67.27239660    -13.13612439    -11.76704604    -1.36770624    -1.56335925    0.97402293    -0.01427052    -0.58873046
MM10    -67.27280615    -13.13586270    -11.76655598    -1.36814530    -1.56327487    0.97415025    -0.01425769    -0.58847121
MM9    -67.27309939    -13.13567565    -11.76618041    -1.36851178    -1.56320630    0.97425525    -0.01424837    -0.58824828
MM8    -67.27330602    -13.13554650    -11.76589400    -1.36882432    -1.56315061    0.97434143    -0.01424107    -0.58805637
MM7    -67.27345170    -13.13545798    -11.76567505    -1.36909126    -1.56310553    0.97441132    -0.01423518    -0.58789150
MM6    -67.27355833    -13.13539227    -11.76550479    -1.36930976    -1.56306888    0.97446660    -0.01423190    -0.58775180
MM5    -67.27363454    -13.13534560    -11.76537376    -1.36948811    -1.56303911    0.97450991    -0.01423036    -0.58763344
MM4    -67.27372942    -13.13528908    -11.76519194    -1.36976546    -1.56299461    0.97456921    -0.01422976    -0.58744787
MM3    -67.27378657    -13.13525276    -11.76507547    -1.36995914    -1.56296443    0.97460208    -0.01423166    -0.58731558
MM2    -67.27382122    -13.13522855    -11.76500174    -1.37008344    -1.56294404    0.97461865    -0.01423545    -0.58722121
MM1    -67.27387643    -13.13518073    -11.76490681    -1.37023404    -1.56291907    0.97462684    -0.01424334    -0.58710213
MM0    -67.27391556    -13.13514174    -11.76485452    -1.37029946    -1.56290638    0.97462432    -0.01425039    -0.58703521
