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
#    a1   ,    a2   ,    a3   ,    a4   ,    a5   ,    a6   ,    a7   ,    a8   ,    a9
#                      0.846100, 0.153900, 0.525500, 0.000000, 0.000000, 0.544500, 0.000000
#    b1   ,    b2   ,    b3   ,    b4   ,    b5   ,    b6   ,    b7   ,    b8   ,    b9
#                      0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000
#    a1   ,    a2   ,    a3   ,    a4   ,    a5   ,    a6   ,    a7   ,    a8   ,    a9
                      0.846100, 0.153900, 0.525500, 0.000000, 0.000000, 0.544500, 0.000000

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
__optimization function__ :: 32
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    #a1, a2, a3, a4, a5, a6, a7, a8, a9\
    #b1, b2, b3, b4, b5, b6, b7, a8, a9 = C        # for DDHDF
    a2, a3, a4, a5, a6, a7, \
    b3, b4, b5, b6, b7 = C                 # for DDHDF
    a1  = 0
    #a2  = 1.
    b1  = 0.
    b2  = 1. - a2

    PBE0, PBE0_noXC, PBE0x_K, PBE0x_PBE, PBE0c_PBE, PBE0c_PT21, PBE0c_aaaa, PBE0c_abab, PBE0c_bbbb,\
    PBE,  PBE_noXC,  PBEx_K,  PBEx_PBE,  PBEc_PBE,  PBEc_PT21,  PBEc_aaaa, PBEc_abab, PBEc_bbbb = P
    return a1*PBE0 + a2*PBE0_noXC + a3*PBE0x_K + a4*PBE0x_PBE + a5*PBE0c_PBE \
         + a6*PBE0c_PT21 + a7*PBE0c_aaaa + a8*PBE0c_abab + a9*PBE0c_bbbb \
         + b1*PBE  + b2*PBE_noXC  + b3*PBEx_K  + b4*PBEx_PBE  + b5*PBEc_PBE  \
	 + b6*PBEc_PT21  + b7*PBEc_aaaa  + b8*PBEc_abab  + b9*PBEc_bbbb

def opt_func_constrained(C,P):
    '''\
    The constrained function for optimization, where C is the parameters
    '''
    con1 = 0.2
    con2 = 0.8
    for a in C:
        if a<0:
	    a = con1
        if a>1:
	    a = con2
    return


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
#     PBE0  E_no_XC  Ex_K  Ex_PBE  Ec_PBE  PT21  aaaa  abab  bbbb  PBE  E_noXC  Ex_K  Ex_PBE  Ec_PBE  PT21  aaaa  abab  bbbb
   H_0    -0.50103810  -0.19005592  -0.30955273  -0.30369111  -0.00582566  -0.00036887  0.00000000  0.00000000  0.00000000  -0.49961878  -0.19109692  -0.30826436  -0.30277386  -0.00574799  -0.00073911  0.00000000  0.00000000  0.00000000
   He_0   -2.89310132  -1.83898737  -1.02045298  -1.00985659  -0.04160826  -0.00107679  0.00000000  -0.03655628  0.00000000  -2.89057560  -1.84142435  -1.01740391  -1.00779817  -0.04135308  -0.00206721  0.00000000  -0.04003262  0.00000000
   Li_0   -7.46573499  -5.65212866  -1.77947837  -1.75653997  -0.05133176  -0.00051031  -0.00019740  -0.01549979  0.00000000  -7.46006161  -5.65343770  -1.77777672  -1.75533844  -0.05128547  -0.00106649  -0.00021894  -0.01654910  0.00000000
   Be_0   -14.63493389  -11.90249460  -2.66872507  -2.63917645  -0.08587570  -0.00077676  -0.00029278  -0.06718659  -0.00029278  -14.62763811  -11.90342249  -2.66725825  -2.63845127  -0.08576435  -0.00154744  -0.00031558  -0.08869878  -0.00031558
   B_0    -24.61693155  -20.76577352  -3.76358638  -3.73002237  -0.11274467  -0.00178936  -0.00577004  -0.08455697  -0.00037459  -24.60876311  -20.76859675  -3.75940125  -3.72764436  -0.11252200  -0.00374294  -0.00688410  -0.10508512  -0.00039691
   C_0    -37.80321882  -32.62380500  -5.06415388  -5.02575132  -0.14406186  -0.00274240  -0.01925017  -0.09795875  -0.00040282  -37.79395583  -32.62879533  -5.05712936  -5.02147293  -0.14368757  -0.00586354  -0.02226103  -0.11513338  -0.00042239
   N_0    -54.54033276  -47.80798743  -6.58862646  -6.54156287  -0.17901655  -0.00339579  -0.04136867  -0.10697789  -0.00041919  -54.52897029  -47.81534946  -6.57897866  -6.53519513  -0.17842570  -0.00731864  -0.04676202  -0.11872357  -0.00043650
   O_0    -75.01292670  -66.61420853  -8.19200725  -8.15611916  -0.23362699  -0.00506024  -0.04297007  -0.15896254  -0.00669969  -75.00453215  -66.62399677  -8.17894686  -8.14774029  -0.23279510  -0.01071455  -0.04795775  -0.17595236  -0.00748995
   F_0    -99.66728894  -89.38721252  -10.01089696  -9.98294617  -0.29014256  -0.00670983  -0.04463673  -0.21115759  -0.02200411  -99.66103474  -89.39961862  -9.99435519  -9.97234694  -0.28906919  -0.01413344  -0.04936379  -0.23189320  -0.02443041
   Ne_0   -128.85129505  -116.45587083  -12.06693890  -12.04098077  -0.34795392  -0.00801324  -0.04627645  -0.26184113  -0.04627645  -128.84564046  -116.47094784  -12.04725427  -12.02805968  -0.34663294  -0.01687914  -0.05082330  -0.28498649  -0.05082330
   Na_0   -162.16981158  -147.84601024  -13.99635523  -13.93892419  -0.37051939  -0.00590245  -0.02687915  -0.13658799  -0.02406117  -162.15612104  -147.85623968  -13.98220657  -13.93017764  -0.36970372  -0.01207290  -0.02958086  -0.14834763  -0.02634004
   Mg_0   -199.96141314  -183.62484986  -15.97806463  -15.90892237  -0.41035534  -0.00515680  -0.02376540  -0.16393856  -0.02376540  -199.94472066  -183.63222724  -15.96711098  -15.90275993  -0.40973348  -0.01020747  -0.02568792  -0.18507448  -0.02568792
   Al_0   -242.24834329  -223.79612882  -18.07324419  -17.98486390  -0.44525549  -0.00559378  -0.03042941  -0.18500866  -0.02580980  -242.22690796  -223.80402141  -18.06129654  -17.97824091  -0.44464564  -0.01105304  -0.03337825  -0.20748280  -0.02749226
   Si_0   -289.25113670  -268.56310474  -20.28399819  -20.17736795  -0.48400645  -0.00610595  -0.04277498  -0.20404738  -0.02684493  -289.22520090  -268.57208905  -20.27056272  -20.16976289  -0.48334895  -0.01208529  -0.04780019  -0.22745212  -0.02836447
    P_0   -341.13518554  -318.07908154  -22.62584797  -22.49902741  -0.52537145  -0.00566687  -0.06120074  -0.21975927  -0.02687561  -341.10414100  -318.08808434  -22.61292648  -22.49143321  -0.52462346  -0.01099666  -0.06872465  -0.24199014  -0.02823143
    S_0   -397.97502125  -372.48496694  -25.01239684  -24.87086518  -0.58380621  -0.00663198  -0.06168131  -0.25555239  -0.03179452  -397.94041728  -372.49498291  -24.99763524  -24.86238527  -0.58304910  -0.01294036  -0.06863559  -0.28279503  -0.03406217
   Cl_0   -459.99788596  -431.96535270  -27.50708584  -27.34962811  -0.64354072  -0.00632688  -0.04987331  -0.24080570  -0.03165900  -459.95924800  -431.98195490  -27.48619693  -27.33460151  -0.64269159  -0.01242944  -0.05601598  -0.26968921  -0.03529721
   G2-1   -8.05075495  -5.84796414  -2.13719313  -2.11234111  -0.08423669  -0.00216440  -0.00022371  -0.05395047  -0.00022371  -8.04481484  -5.85297180  -2.13087282  -2.10826247  -0.08358057  -0.00544275  -0.00024622  -0.06360605  -0.00024622
   G2-2   -15.22487732  -12.07634701  -3.07341501  -3.03571759  -0.10338837  -0.00228007  -0.00290226  -0.06074091  -0.00024520  -15.21573795  -12.08027681  -3.06763653  -3.03225482  -0.10320631  -0.00484833  -0.00348303  -0.07042024  -0.00026407
   G2-3   -38.43654330  -32.86628776  -5.41085497  -5.37727978  -0.18458197  -0.00420603  -0.01814120  -0.14298342  -0.00495154  -38.42865887  -32.87045681  -5.40360868  -5.37416370  -0.18403836  -0.00874309  -0.02103430  -0.17156483  -0.00570702
   G2-4   -39.11399006  -33.07686088  -5.85573171  -5.81087093  -0.21504305  -0.00443064  -0.03611378  -0.14260092  -0.00366419  -39.10331572  -33.08214032  -5.84725605  -5.80678163  -0.21439376  -0.00916402  -0.04153623  -0.16107353  -0.00419520
   G2-5   -39.08646163  -33.10981777  -5.77817295  -5.74403447  -0.22407477  -0.00521105  -0.01579863  -0.18454084  -0.01579863  -39.07854534  -33.11340641  -5.77097795  -5.74184914  -0.22328980  -0.01071874  -0.01827055  -0.22918964  -0.01827055
   G2-6   -39.79778486  -33.35779989  -6.21477528  -6.16878443  -0.25970282  -0.00524329  -0.03257028  -0.18985135  -0.01197670  -39.78690862  -33.36187245  -6.20721438  -6.16625229  -0.25878388  -0.01058434  -0.03732406  -0.21434595  -0.01374509
   G2-7   -40.47310393  -33.62656703  -6.58097777  -6.53358478  -0.30110387  -0.00624594  -0.02708228  -0.23286402  -0.02708228  -40.46197555  -33.62960659  -6.57390778  -6.53232656  -0.30004241  -0.01239273  -0.03106830  -0.26285841  -0.03106830
   G2-8   -55.17724622  -48.05722417  -6.91924147  -6.88675983  -0.22514181  -0.00513162  -0.04177946  -0.15997466  -0.00542058  -55.16973747  -48.06366187  -6.90920479  -6.88168227  -0.22439334  -0.01074811  -0.04768674  -0.18082215  -0.00616318
   G2-9   -55.83429809  -48.30776382  -7.27398986  -7.24971692  -0.27074911  -0.00622671  -0.04052887  -0.21294020  -0.01786375  -55.82895625  -48.31300527  -7.26464731  -7.24625986  -0.26969113  -0.01287527  -0.04640576  -0.24141500  -0.02047113
  G2-10   -56.51367718  -48.55733009  -7.65709262  -7.63569697  -0.31530120  -0.00698437  -0.03766317  -0.26178307  -0.03766317  -56.50912284  -48.56192967  -7.64823997  -7.63327550  -0.31391767  -0.01429679  -0.04311049  -0.29614147  -0.04311049
  G2-11   -75.68242045  -66.87299265  -8.54093831  -8.52562417  -0.27997509  -0.00692389  -0.04501871  -0.22142154  -0.02161616  -75.67936739  -66.88167583  -8.52785458  -8.51882498  -0.27886658  -0.01457556  -0.05095223  -0.24870479  -0.02456444
  G2-12   -76.37689240  -67.12902827  -8.92402900  -8.92155693  -0.32568918  -0.00802508  -0.04524659  -0.28139558  -0.04524659  -76.37715508  -67.13651706  -8.91173335  -8.91639442  -0.32424360  -0.01676790  -0.05157541  -0.31735093  -0.05157541
  G2-13   -100.38655072  -89.65728325  -10.39451503  -10.39290429  -0.33596050  -0.00880767  -0.04833852  -0.28251717  -0.04833852  -100.38706947  -89.66898503  -10.37769404  -10.38354665  -0.33453779  -0.01862035  -0.05438275  -0.31473271  -0.05438275
  G2-14   -290.48776448  -269.04521180  -20.97401240  -20.85909622  -0.55472742  -0.00903424  -0.03632168  -0.27287565  -0.03632168  -290.46011796  -269.05405434  -20.95834948  -20.85219517  -0.55386845  -0.01836552  -0.03992463  -0.31099235  -0.03992463
  G2-15   -290.46382646  -269.00010975  -21.01127314  -20.88833346  -0.54464833  -0.00885026  -0.05018887  -0.23707356  -0.02770251  -290.43417831  -269.01030358  -20.99390155  -20.87976038  -0.54411436  -0.01810475  -0.05672473  -0.26388981  -0.02967263
  G2-16   -291.11028849  -269.25953944  -21.36853157  -21.23605136  -0.58157763  -0.00984857  -0.04464670  -0.27141634  -0.03198191  -291.07837047  -269.27004881  -21.35019549  -21.22744515  -0.58087652  -0.02003598  -0.05009295  -0.30250946  -0.03475877
  G2-17   -291.75748864  -269.51424249  -21.73415248  -21.59085503  -0.61656676  -0.01095341  -0.03873836  -0.30372370  -0.03873836  -291.72299353  -269.52521977  -21.71459997  -21.58206601  -0.61570775  -0.02232945  -0.04293950  -0.33894997  -0.04293950
  G2-18   -342.38175558  -318.57926484  -23.29471031  -23.16442360  -0.60549546  -0.00887550  -0.05414708  -0.29087083  -0.03749478  -342.35025200  -318.58802175  -23.27924953  -23.15759116  -0.60463910  -0.01769639  -0.06069822  -0.32540224  -0.04097610
  G2-19   -343.01747943  -318.83082245  -23.64358989  -23.50939298  -0.64371478  -0.01012529  -0.04902599  -0.32756512  -0.04902599  -342.98514151  -318.83918814  -23.62766994  -23.50325528  -0.64269808  -0.02024419  -0.05469349  -0.36753802  -0.05469349
  G2-20   -399.26382925  -373.00608674  -25.69519194  -25.55577449  -0.66711365  -0.00889501  -0.05619534  -0.33500495  -0.05619534  -399.23002326  -373.01400821  -25.68101168  -25.55005710  -0.66595796  -0.01755616  -0.06260028  -0.37428616  -0.06260028
  G2-21   -460.66655964  -432.23754670  -27.85749792  -27.70387521  -0.68673206  -0.00704436  -0.04859097  -0.28371300  -0.04859097  -460.62895386  -432.25256265  -27.83797230  -27.69080202  -0.68558919  -0.01382594  -0.05476300  -0.31843957  -0.05476300
  G2-22   -14.96260666  -11.31134277  -3.55734970  -3.51660538  -0.12447244  -0.00203940  -0.00033421  -0.07053529  -0.00033421  -14.95266977  -11.31589570  -3.55134844  -3.51264593  -0.12412813  -0.00456404  -0.00037068  -0.09108602  -0.00037068
  G2-23   -107.34367252  -95.03207431  -11.94012984  -11.93201242  -0.37755644  -0.01485973  -0.05334258  -0.31062323  -0.05334258  -107.34307681  -95.05401969  -11.91000308  -11.91357437  -0.37548274  -0.03575654  -0.06167512  -0.35220300  -0.06167512
  G2-24   -77.25316767  -65.85360181  -10.98641931  -10.96285250  -0.43082166  -0.01050650  -0.05646109  -0.38246060  -0.05646109  -77.24844994  -65.85199992  -10.98075361  -10.96666799  -0.42978203  -0.02091831  -0.06737248  -0.44831291  -0.06737248
  G2-25   -78.50924616  -66.31458516  -11.73815257  -11.68592256  -0.49568094  -0.01160033  -0.05383265  -0.40352932  -0.05383265  -78.49751833  -66.31520158  -11.72939518  -11.68791012  -0.49440662  -0.02317322  -0.06233228  -0.46396464  -0.06233228
  G2-26   -79.74735110  -66.76012209  -12.48785219  -12.40511330  -0.56143098  -0.01219421  -0.05546315  -0.43221528  -0.05546315  -79.72806874  -66.76393710  -12.47583136  -12.40442169  -0.55970996  -0.02424950  -0.06368458  -0.48819244  -0.06368458
  G2-27   -92.62912483  -80.58110042  -11.62696769  -11.65450149  -0.40040637  -0.01630698  -0.07041097  -0.41471814  -0.07131711  -92.63805420  -80.58432860  -11.60982748  -11.65353665  -0.40018894  -0.03709629  -0.08377011  -0.51609369  -0.09671224
  G2-28   -93.34129414  -80.84858284  -12.05002006  -12.05192665  -0.44126130  -0.01188166  -0.06625409  -0.41712351  -0.06625409  -93.34308242  -80.84706963  -12.04333610  -12.05584803  -0.44016477  -0.02408746  -0.07917254  -0.49096685  -0.07917254
  G2-29   -113.22497013  -99.45773066  -13.31183020  -13.31978060  -0.44944648  -0.01412443  -0.06929100  -0.41942476  -0.06929100  -113.22839720  -99.46084110  -13.29965186  -13.31921881  -0.44833730  -0.02955573  -0.08186464  -0.48988640  -0.08186464
  G2-30   -113.76594095  -99.60850955  -13.67148444  -13.68074156  -0.47900412  -0.01617715  -0.07136653  -0.43074747  -0.07283703  -113.76994209  -99.61379707  -13.65545678  -13.67834550  -0.47779953  -0.03449572  -0.08265033  -0.50174667  -0.08808170
  G2-31   -114.41342806  -99.83672843  -14.06310643  -14.05953910  -0.51626870  -0.01620916  -0.07126459  -0.45846678  -0.07126459  -114.41424178  -99.84130580  -14.04788387  -14.05811674  -0.51481925  -0.03417543  -0.08303034  -0.52966439  -0.08303034
  G2-32   -115.63387586  -100.25872210  -14.81920932  -14.78385673  -0.58245888  -0.01505016  -0.07178403  -0.48066603  -0.07178403  -115.62671190  -100.26609096  -14.80186459  -14.78006791  -0.58055304  -0.03098988  -0.08226925  -0.54350728  -0.08226925
  G2-33   -109.43994089  -95.86348474  -13.10968290  -13.12887473  -0.45237938  -0.01155499  -0.07381409  -0.44119348  -0.07381409  -109.44603330  -95.86047376  -13.10461255  -13.13426028  -0.45129926  -0.02304289  -0.08761388  -0.51786249  -0.08761388
  G2-34   -111.78342883  -96.60323943  -14.61169187  -14.58669336  -0.58724641  -0.01418703  -0.07486847  -0.49137534  -0.07486847  -111.77879695  -96.60859405  -14.59706005  -14.58516415  -0.58503875  -0.02899290  -0.08587436  -0.55714430  -0.08587436
  G2-35   -129.79875695  -114.57675661  -14.70621483  -14.73929503  -0.49097536  -0.01513799  -0.07780102  -0.46250550  -0.08419285  -129.80869180  -114.57932359  -14.69305870  -14.73958547  -0.48978274  -0.03136989  -0.08938150  -0.54102215  -0.10283983
  G2-36   -150.22446192  -133.34304361  -16.31590799  -16.36413130  -0.52934283  -0.01502270  -0.08296329  -0.46964768  -0.11487572  -150.23835260  -133.34571281  -16.30139036  -16.36444578  -0.52819401  -0.03047826  -0.09296563  -0.53802881  -0.14751316
  G2-37   -151.44721948  -133.76793436  -17.05291409  -17.08854309  -0.59964928  -0.01692716  -0.08929278  -0.55042402  -0.08929278  -151.45805721  -133.77558944  -17.03373037  -17.08500428  -0.59746349  -0.03510829  -0.10282347  -0.63183242  -0.10282347
  G2-38   -199.38818178  -178.82401429  -19.90652388  -19.96516578  -0.61366219  -0.01734961  -0.09373107  -0.57618230  -0.09373107  -199.40485066  -178.83552275  -19.88263024  -19.95753177  -0.61179614  -0.03567528  -0.10684664  -0.66637175  -0.10684664
  G2-39   -188.45667954  -166.09125763  -21.59504217  -21.63400115  -0.74116050  -0.02796373  -0.12386880  -0.68613738  -0.12386880  -188.46928943  -166.09514657  -21.57255866  -21.63474893  -0.73939393  -0.05993244  -0.14651666  -0.79662148  -0.14651666
  G2-40   -324.36549644  -295.70226963  -27.98079445  -27.87774259  -0.75972126  -0.01365451  -0.05184283  -0.30958406  -0.05184283  -324.34130497  -295.72393086  -27.95011659  -27.85980479  -0.75756931  -0.02854764  -0.05704802  -0.34849869  -0.05704802
  G2-41   -578.61487544  -537.20972023  -40.52186904  -40.35301713  -1.00992511  -0.01534329  -0.11060187  -0.49541403  -0.07177056  -578.57986081  -537.19309417  -40.55203860  -40.37874879  -1.00801785  -0.02964319  -0.13139303  -0.51319758  -0.06697863
  G2-42   -682.44922260  -636.28674438  -45.18001346  -44.98721607  -1.12706280  -0.01654943  -0.11111519  -0.59551443  -0.11111519  -682.40293382  -636.29417988  -45.16035354  -44.98297697  -1.12577698  -0.03302044  -0.12927786  -0.69267519  -0.12927786
  G2-43   -796.11897944  -745.06033123  -50.00877795  -49.77961431  -1.22174299  -0.01713814  -0.12131678  -0.59462040  -0.12165674  -796.06377738  -745.07099164  -49.98449900  -49.77220649  -1.22057925  -0.03420339  -0.13592690  -0.67004847  -0.14586119
  G2-44   -920.08825628  -863.97347621  -54.99601988  -54.72198984  -1.32428273  -0.01561657  -0.09744241  -0.54900948  -0.09744241  -920.02155820  -864.00013518  -54.95823323  -54.69882474  -1.32259828  -0.03116757  -0.11073428  -0.62385284  -0.11073428
  G2-45   -622.31839246  -579.80475263  -41.62338639  -41.41126989  -1.04934082  -0.01522280  -0.07633551  -0.41743865  -0.07633551  -622.26710625  -579.83794059  -41.58035864  -41.38249276  -1.04667291  -0.03510320  -0.08588445  -0.46563987  -0.08588445
  G2-46   -364.55456746  -335.30747324  -28.51411463  -28.45459170  -0.77762178  -0.02185126  -0.09564182  -0.52897650  -0.09564182  -364.54178873  -335.32053972  -28.48771487  -28.44517566  -0.77607335  -0.04963960  -0.11351232  -0.62047908  -0.11351232
  G2-47   -436.04645286  -405.26549257  -30.06992398  -29.96046479  -0.79313071  -0.01618059  -0.08921383  -0.50029224  -0.08921383  -436.02083729  -405.26877091  -30.05525550  -29.95995224  -0.79211414  -0.03428983  -0.10624294  -0.59151691  -0.10624294
  G2-48   -473.18900742  -439.19167820  -33.18872014  -33.10201888  -0.87363502  -0.01850761  -0.10409974  -0.54533039  -0.11802477  -473.16948347  -439.20061777  -33.16563854  -33.09633637  -0.87252933  -0.03861210  -0.11772962  -0.62396856  -0.14640526
  G2-49   -535.11650229  -498.63268190  -35.63955039  -35.53312608  -0.92408824  -0.02106686  -0.09425573  -0.52023081  -0.09553819  -535.09276169  -498.65313759  -35.60014298  -35.51656876  -0.92305535  -0.04482021  -0.10852674  -0.61058822  -0.12090295
  G2-50   -559.76054274  -521.39337515  -37.48085589  -37.37014546  -0.96934452  -0.01895108  -0.09654785  -0.55932614  -0.09654785  -559.73492831  -521.41481554  -37.44648470  -37.35247531  -0.96763746  -0.03952637  -0.11033691  -0.63959207  -0.11033691
  G2-51   -582.34089003  -538.55771652  -42.78852127  -42.51972706  -1.19624789  -0.02108010  -0.08197306  -0.57834135  -0.08197306  -582.27625148  -538.57778478  -42.75171424  -42.50366218  -1.19480453  -0.04319948  -0.09147721  -0.64615571  -0.09147721
  G2-52   -499.93488198  -465.37383406  -33.75579205  -33.57111683  -0.94376228  -0.01382510  -0.07662750  -0.48610337  -0.07662750  -499.89027847  -465.38946464  -33.73080412  -33.55877322  -0.94204060  -0.02756602  -0.08727049  -0.54878727  -0.08727049
  G2-53   -438.53622770  -406.13910097  -31.59936852  -31.42790751  -0.92635398  -0.01525053  -0.08521507  -0.53782418  -0.08521507  -438.49513921  -406.14770480  -31.57997267  -31.42287049  -0.92456392  -0.03039291  -0.09621422  -0.60459208  -0.09621422
  G2-54   -535.77034484  -498.87070537  -36.02601231  -35.90821123  -0.96197797  -0.01686796  -0.09461431  -0.55387096  -0.09461431  -535.74282985  -498.88792790  -35.99694674  -35.89481260  -0.96008936  -0.03457258  -0.10858731  -0.63426208  -0.10858731
  G2-55   -548.40095349  -505.85273671  -41.40686821  -41.36870761  -1.16996901  -0.03346101  -0.16756741  -0.88008550  -0.16756741  -548.39498273  -505.85972178  -41.37645107  -41.36715639  -1.16810456  -0.07205888  -0.19880633  -1.02982998  -0.19880633
  G2-56   -324.36493076  -289.11295638  -34.18045279  -34.15250532  -1.09248219  -0.03447435  -0.15921924  -0.89418151  -0.15921924  -324.36164512  -289.14496669  -34.12461248  -34.12679324  -1.08988518  -0.07584354  -0.18108393  -1.00117885  -0.18108393
  G2-57   -1405.13963121  -1316.80479277  -86.52929915  -86.06038776  -2.15722283  -0.02937937  -0.17133368  -0.92518978  -0.17133368  -1405.02568097  -1316.84881459  -86.46427351  -86.02196390  -2.15490248  -0.06257691  -0.19614174  -1.04539255  -0.19614174
  G2-58   -541.90440815  -492.06434979  -48.49714139  -48.41198545  -1.40678393  -0.04027557  -0.18202840  -1.00185946  -0.18202840  -541.88738642  -492.11304514  -48.42172751  -48.37137623  -1.40296505  -0.09100379  -0.20684640  -1.12218298  -0.20684640
  G2-59   -1622.73131891  -1519.78812377  -100.88698981  -100.33080920  -2.47334079  -0.02970896  -0.18562659  -0.99656366  -0.18562659  -1622.59569960  -1519.84303855  -100.81060119  -100.28224446  -2.47041659  -0.06217378  -0.20973959  -1.11536800  -0.20973959
  G2-60   -437.24105391  -390.35698276  -45.41338457  -45.41207774  -1.47166670  -0.04726436  -0.22053581  -1.21900459  -0.22053581  -437.24580776  -390.38545033  -45.35187478  -45.39193992  -1.46841751  -0.10279806  -0.25122041  -1.36583251  -0.25122041
  G2-61   -1878.30589196  -1760.63428446  -115.22218696  -114.64713363  -2.88071054  -0.04050478  -0.23976556  -1.28306926  -0.23976556  -1878.16670564  -1760.68363023  -115.14355118  -114.60570851  -2.87736689  -0.08568147  -0.27536968  -1.45511774  -0.27536968
  G2-62   -511.33267612  -471.94788554  -38.36630624  -38.27866717  -1.08421364  -0.02760895  -0.14030773  -0.75205951  -0.14030773  -511.31361287  -471.95229300  -38.34339621  -38.27877265  -1.08254722  -0.05860047  -0.16449958  -0.87008744  -0.16449958
  G2-63   -834.20653393  -777.78841818  -55.14939914  -54.93596873  -1.42878941  -0.02649648  -0.15849022  -0.82177992  -0.15849022  -834.15594929  -777.79356660  -55.12628986  -54.93523911  -1.42714358  -0.05513003  -0.18457820  -0.94845335  -0.18457820
  G2-64   -312.82799104  -278.21224880  -33.49091479  -33.51659276  -1.10556898  -0.03871826  -0.17197493  -0.95482154  -0.17197493  -312.83849906  -278.22874214  -33.44781999  -33.50673420  -1.10302273  -0.08464623  -0.19847321  -1.08499944  -0.19847321
  G2-65   -688.79829649  -626.29530130  -60.80527449  -60.69168776  -1.78291075  -0.04750245  -0.23669901  -1.29159839  -0.23669901  -688.77509009  -626.34277934  -60.72401265  -60.65269214  -1.77961861  -0.10353282  -0.26778382  -1.44070898  -0.26778382
  G2-66   -2129.85351257  -1996.56374505  -130.61882860  -129.90379367  -3.20721512  -0.03936524  -0.24974745  -1.31419927  -0.24974745  -2129.67926909  -1996.62678359  -130.52671781  -129.84832472  -3.20416079  -0.08159287  -0.28314178  -1.47347562  -0.28314178
  G2-67   -184.53435360  -162.44544101  -21.28103735  -21.36737619  -0.74312111  -0.02877837  -0.13707102  -0.74617138  -0.13707102  -184.55882515  -162.43972790  -21.26809951  -21.37774953  -0.74134772  -0.06180657  -0.16511363  -0.88317384  -0.16511363
  G2-68   -589.86032625  -546.60744320  -42.12557560  -42.07803039  -1.16296636  -0.03403649  -0.14578785  -0.80867483  -0.14578785  -589.85207751  -546.61520778  -42.09381205  -42.07590020  -1.16096954  -0.08900838  -0.17820141  -0.97023019  -0.17820141
  G2-69   -353.87799957  -316.12101146  -36.51057155  -36.60046794  -1.17899426  -0.04632410  -0.18843091  -1.06523559  -0.18843091  -353.90566247  -316.13869297  -36.45849146  -36.59093995  -1.17602955  -0.10844614  -0.22123239  -1.22656076  -0.22123239
  G2-70   -640.69986972  -586.41064005  -52.83762843  -52.75386246  -1.51442572  -0.04409519  -0.19968015  -1.08763081  -0.19968015  -640.68367900  -586.44550527  -52.77130792  -52.72620583  -1.51196791  -0.09816815  -0.22828985  -1.22447878  -0.22828985
  G2-71   -225.26258062  -199.99496101  -24.32247933  -24.49410330  -0.81642231  -0.02952310  -0.16335749  -0.91723165  -0.16335749  -225.30891441  -199.98980221  -24.30517219  -24.50467140  -0.81444080  -0.06494375  -0.19985926  -1.13587977  -0.19985926
  G2-72   -274.49254122  -245.49026889  -28.03264484  -28.13895617  -0.88989399  -0.03304335  -0.14410199  -0.85054704  -0.14410199  -274.52306018  -245.50285122  -27.99391805  -28.13272911  -0.88747985  -0.07999837  -0.17062081  -0.99538887  -0.17062081
  G2-73   -759.19968868  -700.18810824  -57.40517350  -57.40507520  -1.60648066  -0.05579342  -0.21625020  -1.19118152  -0.21625020  -759.20557405  -700.22010494  -57.33367358  -57.38205450  -1.60341460  -0.13891754  -0.25674232  -1.39159307  -0.25674232
  G2-74   -475.23294852  -423.00766978  -50.54585801  -50.56336449  -1.66629087  -0.05648168  -0.24918554  -1.40371877  -0.24918554  -475.24332381  -423.03658242  -50.47772163  -50.54409273  -1.66264866  -0.12487203  -0.28555357  -1.58677019  -0.28555357
  G2-75   -1916.36728276  -1793.29686998  -120.42217054  -119.84218029  -3.08323493  -0.04604020  -0.27023692  -1.45556307  -0.27023692  -1916.22746478  -1793.34501605  -120.34076610  -119.80281291  -3.07963581  -0.09688736  -0.31085748  -1.65513215  -0.31085748
  G2-76   -430.18191791  -381.53691393  -47.05642182  -47.07096118  -1.57767765  -0.05180080  -0.24256488  -1.36790780  -0.24256488  -430.19113931  -381.55671861  -46.99989180  -47.05999548  -1.57442522  -0.11423769  -0.28156010  -1.56109936  -0.28156010
  G2-77   -116.54225132  -98.99128674  -16.90106979  -16.84346036  -0.69310187  -0.01689519  -0.08598244  -0.58011759  -0.08598244  -116.52976920  -98.99107219  -16.88933421  -16.84726049  -0.69143652  -0.03414751  -0.10128798  -0.67002303  -0.10128798
  G2-78   -116.54487970  -98.99956509  -16.88879641  -16.83969424  -0.69334483  -0.01779035  -0.08396140  -0.57629085  -0.08396140  -116.53465335  -98.99849113  -16.87684491  -16.84433414  -0.69182807  -0.03641127  -0.09821975  -0.66588209  -0.09821975
  G2-79   -116.51206243  -98.93318771  -16.91686945  -16.85790006  -0.70623230  -0.01682873  -0.08580282  -0.57864839  -0.08580282  -116.49922779  -98.93276534  -16.90568492  -16.86212632  -0.70433614  -0.03349731  -0.09960321  -0.66485603  -0.09960321
  G2-80   -117.79184747  -99.45403375  -17.64494003  -17.55863117  -0.75760533  -0.01789736  -0.08377282  -0.60430100  -0.08377282  -117.77233369  -99.45590991  -17.63035739  -17.56074526  -0.75567851  -0.03614818  -0.09693338  -0.69052022  -0.09693338
  G2-81   -117.78597259  -99.39978274  -17.68534723  -17.58939284  -0.77280842  -0.01710601  -0.08604349  -0.60086711  -0.08604349  -117.76394146  -99.40229084  -17.67117428  -17.59103410  -0.77061653  -0.03398888  -0.09891675  -0.68027268  -0.09891675
  G2-82   -119.02411777  -99.89802782  -18.39193707  -18.27386913  -0.82270384  -0.01824491  -0.08493447  -0.63360482  -0.08493447  -118.99670058  -99.90280004  -18.37466812  -18.27357370  -0.82032685  -0.03642727  -0.09764006  -0.71591226  -0.09764006
  G2-83   -155.84203823  -132.15045807  -22.80351486  -22.71645587  -0.95335954  -0.02399882  -0.11297347  -0.77815226  -0.11297347  -155.82306081  -132.14954282  -22.78672425  -22.72226550  -0.95125249  -0.04933439  -0.13149349  -0.89610920  -0.13149349
  G2-84   -155.82920038  -132.12696218  -22.81574538  -22.72391320  -0.95536696  -0.02319127  -0.11557442  -0.77870720  -0.11557442  -155.80889733  -132.12786238  -22.79828898  -22.72794886  -0.95308608  -0.04707854  -0.13532902  -0.89316114  -0.13532902
  G2-85   -155.81850990  -132.08656159  -22.83367305  -22.73980275  -0.96867798  -0.02326351  -0.11520623  -0.77522988  -0.11520623  -155.79771981  -132.08719985  -22.81644035  -22.74423439  -0.96628557  -0.04698843  -0.13341224  -0.88541757  -0.13341224
  G2-86   -155.81057117  -132.04344713  -22.86102680  -22.75720915  -0.98396047  -0.02245872  -0.11859993  -0.77706066  -0.11859993  -155.78717729  -132.04434320  -22.84469026  -22.76156393  -0.98127015  -0.04471568  -0.13671445  -0.88255672  -0.13671445
  G2-87   -155.82859786  -132.09261764  -22.83773159  -22.73789214  -0.97312822  -0.02376354  -0.11531912  -0.77870220  -0.11531912  -155.80636849  -132.09400747  -22.81940277  -22.74165516  -0.97070585  -0.04798458  -0.13366630  -0.89015156  -0.13366630
  G2-88   -157.06449805  -132.53957027  -23.58770426  -23.45438247  -1.03721487  -0.02383598  -0.11516275  -0.80552425  -0.11516275  -157.03390273  -132.54356572  -23.56718205  -23.45596504  -1.03437196  -0.04748144  -0.13258391  -0.91230093  -0.13258391
  G2-89   -157.07428551  -132.59442147  -23.55061447  -23.42927574  -1.02025361  -0.02405527  -0.11441791  -0.80704528  -0.11441791  -157.04672716  -132.59707672  -23.53082553  -23.43195627  -1.01769418  -0.04862885  -0.13231215  -0.91945630  -0.13231215
  G2-90   -158.30079139  -133.03560165  -24.29618711  -24.14272671  -1.08409793  -0.02428475  -0.11454997  -0.83541264  -0.11454997  -158.26522166  -133.04120423  -24.27379612  -24.14293712  -1.08108031  -0.04855483  -0.13176471  -0.94412140  -0.13176471
  G2-91   -158.30223471  -133.03957978  -24.29280826  -24.13918757  -1.08506219  -0.02433787  -0.11553015  -0.83749711  -0.11553015  -158.26663237  -133.04516649  -24.27037227  -24.13941660  -1.08204928  -0.04872138  -0.13295077  -0.94659770  -0.13295077
  G2-92   -195.09648306  -165.17525285  -28.78127186  -28.64119772  -1.24501395  -0.02861675  -0.14717458  -0.97359266  -0.14717458  -195.06474684  -165.17772491  -28.75887139  -28.64533847  -1.24168346  -0.05728113  -0.16958150  -1.10337921  -0.16958150
  G2-93   -232.03446041  -197.51573009  -33.23168342  -33.11527765  -1.37435123  -0.03158369  -0.18107009  -1.10758443  -0.18107009  -232.00893747  -197.50966350  -33.21502387  -33.12755655  -1.37171743  -0.06310082  -0.21091463  -1.26603752  -0.21091463
  G2-94   -238.83811041  -211.98324023  -25.98714617  -25.96884722  -0.88144822  -0.02782478  -0.12239418  -0.72915145  -0.12239418  -238.83650581  -212.00299135  -25.94856250  -25.95442669  -0.87908776  -0.06047661  -0.13977790  -0.81986868  -0.13977790
  G2-95   -338.04148528  -301.17470199  -35.69660517  -35.68901178  -1.17587316  -0.03831131  -0.17194538  -0.97563411  -0.17194538  -338.04370114  -301.20044860  -35.64431265  -35.67023623  -1.17301631  -0.08397317  -0.19643645  -1.09565317  -0.19643645
  G2-96   -959.39654674  -897.12582232  -60.92048194  -60.60327968  -1.58814417  -0.02233334  -0.12903634  -0.74579720  -0.12903634  -959.31978169  -897.15365826  -60.87695926  -60.58031371  -1.58580973  -0.04592770  -0.14742783  -0.84324286  -0.14742783
  G2-97   -1418.85450230  -1328.87964978  -88.07613804  -87.62923863  -2.23388904  -0.03135469  -0.18360035  -1.01153942  -0.18360035  -1418.74634226  -1328.91877936  -88.01446355  -87.59653832  -2.23102458  -0.06591971  -0.21044709  -1.14557229  -0.21044709
  G2-98   -95.77574528  -81.68433219  -13.55884063  -13.50309705  -0.57438014  -0.01340934  -0.06522561  -0.46137910  -0.06522561  -95.76333795  -81.68922084  -13.54506767  -13.50168941  -0.57242770  -0.02711263  -0.07483801  -0.52194244  -0.07483801
  G2-99   -132.63590220  -113.98765750  -17.96965107  -17.93648055  -0.70347152  -0.01831857  -0.09536921  -0.61285822  -0.09536921  -132.62968193  -113.98751921  -17.95677750  -17.94039181  -0.70177091  -0.03748966  -0.11258728  -0.71015175  -0.11258728
 G2-100   -244.84030549  -214.56037371  -29.16613868  -29.21576283  -1.07657499  -0.03620503  -0.16917317  -0.99113304  -0.16917317  -244.85662046  -214.56102766  -29.14041600  -29.22167976  -1.07391305  -0.07667264  -0.19885061  -1.15461829  -0.19885061
 G2-101   -244.83152181  -214.60258650  -29.12110684  -29.17233221  -1.06940945  -0.04004351  -0.16894506  -0.98895019  -0.16894506  -244.84880349  -214.60488831  -29.08956295  -29.17703851  -1.06687668  -0.08980042  -0.20223799  -1.15891175  -0.20223799
 G2-102   -331.05007053  -302.65293619  -27.65214861  -27.47446752  -0.87824655  -0.01647032  -0.06909141  -0.50500092  -0.06909141  -331.00761649  -302.66506945  -27.62762722  -27.46586857  -0.87667847  -0.03342855  -0.07795517  -0.56638785  -0.07795517
 G2-103   -189.63153911  -166.50195019  -22.31800673  -22.32892074  -0.80339669  -0.02749303  -0.12111101  -0.70868915  -0.12111101  -189.63725447  -166.51123713  -22.28968112  -22.32485281  -0.80116453  -0.06007221  -0.14145943  -0.81495935  -0.14145943
 G2-104   -228.89329003  -199.63619523  -28.21201845  -28.19082530  -1.06097121  -0.03471733  -0.14958741  -0.91182429  -0.14958741  -228.89178411  -199.64513909  -28.17867090  -28.18824047  -1.05840455  -0.07483326  -0.17465268  -1.04602029  -0.17465268
 G2-105   -209.05728058  -181.05454526  -26.98000517  -26.93407412  -1.05717844  -0.03162743  -0.14336289  -0.88569947  -0.14336289  -209.04928154  -181.06162174  -26.95098697  -26.93333028  -1.05432952  -0.06770569  -0.16672172  -1.01298156  -0.16672172
 G2-106   -133.80954894  -114.33967500  -18.73450767  -18.67019306  -0.78360223  -0.01904244  -0.09570994  -0.63495709  -0.09570994  -133.79563215  -114.34217554  -18.71900781  -18.67217786  -0.78127875  -0.03838350  -0.11031890  -0.72165888  -0.11031890
 G2-107   -185.49472145  -161.20651197  -23.42030750  -23.45409490  -0.84256143  -0.02584658  -0.13956391  -0.81462410  -0.13956391  -185.50604864  -161.20015127  -23.40776905  -23.46496935  -0.84092802  -0.05484983  -0.16850115  -0.96491315  -0.16850115
 G2-108   -135.04314238  -114.81882027  -19.45682997  -19.36738575  -0.83457531  -0.02013668  -0.09428902  -0.66318130  -0.09428902  -135.02308529  -114.82455559  -19.43729235  -19.36650027  -0.83202943  -0.04098305  -0.10847952  -0.75048127  -0.10847952
 G2-109   -135.05536547  -114.82657341  -19.46094988  -19.37063494  -0.83557839  -0.01967114  -0.09490573  -0.66288874  -0.09490573  -135.03504613  -114.83272203  -19.44136410  -19.36935287  -0.83297123  -0.04014280  -0.10916747  -0.75009490  -0.10916747
 G2-110   -152.48107754  -132.53636191  -19.22908136  -19.22727520  -0.71698889  -0.02340747  -0.10427911  -0.63126326  -0.10427911  -152.48310823  -132.53829260  -19.21120098  -19.22949145  -0.71532418  -0.04972719  -0.12291204  -0.73140945  -0.12291204
 G2-111   -153.66797633  -132.92411725  -19.98376211  -19.94431649  -0.78968118  -0.02179576  -0.10261254  -0.65830512  -0.10261254  -153.66051975  -132.92903193  -19.96397276  -19.94399839  -0.78748943  -0.04498308  -0.11866886  -0.74994084  -0.11866886
 G2-112   -153.70620164  -132.98345728  -19.97244176  -19.93538042  -0.77809861  -0.02295887  -0.10139768  -0.65704578  -0.10139768  -153.69945471  -132.98990306  -19.95015333  -19.93353387  -0.77601778  -0.04890455  -0.11813232  -0.75374497  -0.11813232
 G2-113   -227.65049162  -199.20485245  -27.44613541  -27.45572247  -0.99231346  -0.03253898  -0.14638883  -0.88682442  -0.14638883  -227.65637120  -199.21097435  -27.41759275  -27.45545146  -0.98994539  -0.06995544  -0.17129610  -1.02723399  -0.17129610
 G2-114   -154.91560049  -133.40111606  -20.72374409  -20.65333998  -0.84354342  -0.02123928  -0.10129412  -0.68153323  -0.10129412  -154.90039128  -133.40971446  -20.70069558  -20.64966620  -0.84101062  -0.04366810  -0.11636054  -0.77076619  -0.11636054
 G2-115   -154.89716668  -133.39633567  -20.71109609  -20.64340202  -0.84050548  -0.02249768  -0.10009171  -0.68223187  -0.10009171  -154.88276033  -133.40435041  -20.68760748  -20.64031068  -0.83809924  -0.04662584  -0.11526046  -0.77251206  -0.11526046
 G2-116   -476.58961365  -438.79815146  -36.78960910  -36.61005350  -1.13651979  -0.02070200  -0.11807290  -0.71535335  -0.11807290  -476.54709896  -438.80484329  -36.76831799  -36.60795477  -1.13430091  -0.04141374  -0.13469790  -0.80961902  -0.13469790
 G2-117   -552.96149208  -505.89176333  -45.72518356  -45.55659379  -1.47098752  -0.03739869  -0.16975845  -1.01900007  -0.16975845  -552.92350226  -505.90516614  -45.68516315  -45.55030118  -1.46803493  -0.08098728  -0.19724843  -1.16271319  -0.19724843
 G2-118   -477.81369363  -439.27834379  -37.50243404  -37.29615717  -1.18762345  -0.02141046  -0.11508406  -0.74032648  -0.11508406  -477.76461396  -439.28799570  -37.47758021  -37.29143446  -1.18518380  -0.04286269  -0.13070657  -0.83382123  -0.13070657
 G2-119   -477.81217415  -439.27547808  -37.50248325  -37.29907137  -1.18677173  -0.02172118  -0.11544438  -0.74234454  -0.11544438  -477.76384504  -439.28498647  -37.47750067  -37.29450279  -1.18435577  -0.04364128  -0.13136623  -0.83679061  -0.13136623
 G2-120   -177.69533469  -155.49418634  -21.43866946  -21.40534976  -0.78746866  -0.02341276  -0.10294760  -0.65423186  -0.10294760  -177.68955090  -155.50386517  -21.41279817  -21.40016412  -0.78552162  -0.05057325  -0.11869203  -0.74603897  -0.11869203
 G2-121   -539.21539248  -498.51602222  -39.65886321  -39.43964056  -1.20492403  -0.02011429  -0.10648932  -0.68794393  -0.10648932  -539.16288357  -498.53267173  -39.62828353  -39.42763919  -1.20257265  -0.04048915  -0.12179779  -0.77726648  -0.12179779
 G2-122   -537.97960948  -498.06504731  -38.91204630  -38.72693038  -1.14135282  -0.02016483  -0.10648342  -0.66202198  -0.10648342  -537.93563454  -498.07861221  -38.88403253  -38.71759243  -1.13942990  -0.04169022  -0.12272071  -0.75635779  -0.12272071
 G2-123   -170.67706986  -146.67927722  -23.12402842  -23.09139385  -0.89824015  -0.02456726  -0.12426360  -0.78885774  -0.12426360  -170.67170000  -146.67658218  -23.10878678  -23.09877331  -0.89634451  -0.05108056  -0.14689781  -0.91899386  -0.14689781
 G2-124   -192.99496452  -166.12647808  -25.88256912  -25.80981636  -1.04048189  -0.02897947  -0.13152382  -0.85717367  -0.13152382  -192.98000267  -166.13324338  -25.85548076  -25.80890875  -1.03785055  -0.06106612  -0.15288539  -0.97932363  -0.15288539
 G2-125   -228.92100276  -199.64282707  -28.23258274  -28.20606224  -1.06548333  -0.03310413  -0.15029215  -0.90601223  -0.15029215  -228.91802007  -199.65220946  -28.20000439  -28.20309127  -1.06271933  -0.07110261  -0.17486505  -1.03626199  -0.17486505
 G2-126   -252.92224582  -222.18093563  -29.68451237  -29.66436017  -1.07191198  -0.03481885  -0.15264233  -0.90881114  -0.15264233  -252.92095126  -222.19362742  -29.64771638  -29.65797596  -1.06934789  -0.07561230  -0.17729947  -1.03716360  -0.17729947
 G2-127   -613.19444118  -564.75894103  -47.13463409  -46.97125508  -1.42340032  -0.03315817  -0.15716892  -0.92211503  -0.15716892  -613.15722849  -564.77547241  -47.09482706  -46.96094086  -1.42081522  -0.07159369  -0.18323464  -1.05696310  -0.18323464
 G2-128   -578.49214363  -531.65315332  -45.56380779  -45.30899636  -1.46629109  -0.02611578  -0.13615791  -0.88994254  -0.13615791  -578.43143048  -531.67052538  -45.52822858  -45.29760410  -1.46330100  -0.05253963  -0.15599855  -1.00571776  -0.15599855
 G2-129   -194.19756030  -166.54613405  -26.62483149  -26.51936970  -1.10569109  -0.02750230  -0.13181188  -0.88485296  -0.13181188  -194.17431608  -166.55572251  -26.59620766  -26.51604587  -1.10254769  -0.05667983  -0.15169610  -1.00104589  -0.15169610
 G2-130   -194.17884459  -166.53817161  -26.61612128  -26.51322420  -1.10172451  -0.02862661  -0.12978592  -0.88352557  -0.12978592  -194.15634674  -166.54720117  -26.58719184  -26.51043877  -1.09870679  -0.05909612  -0.14956437  -1.00024555  -0.14956437
 G2-131   -174.31358139  -147.95840223  -25.35134175  -25.22834333  -1.09608623  -0.02704345  -0.12492505  -0.86811466  -0.12492505  -174.28592984  -147.96513837  -25.32576189  -25.22785208  -1.09293940  -0.05538125  -0.14409412  -0.98298499  -0.14409412
 G2-132   -229.83501129  -198.31931332  -30.35868885  -30.30457665  -1.19759326  -0.03146502  -0.16760355  -1.00070582  -0.16760355  -229.82497489  -198.31805316  -30.33778550  -30.31187133  -1.19505039  -0.06404953  -0.19505864  -1.14556607  -0.19505864
 G2-133   -552.74758744  -504.18444452  -47.16122239  -46.97088812  -1.54467123  -0.03129889  -0.18551987  -1.06411950  -0.18551987  -552.70359225  -504.18589431  -47.13690847  -46.97557944  -1.54211849  -0.06316197  -0.21499037  -1.21442637  -0.21499037
 G2-134   -209.99179284  -179.73715336  -29.12118177  -29.04209018  -1.19277640  -0.02821715  -0.16186592  -0.97683826  -0.16186592  -209.97519844  -179.73314671  -29.10538268  -29.05196744  -1.19008430  -0.05646225  -0.18774424  -1.11528599  -0.18774424
 G2-135   -248.06500190  -212.45582862  -34.28854685  -34.20230864  -1.38530509  -0.03374462  -0.19099246  -1.14102850  -0.19099246  -248.04725887  -212.44991322  -34.27010684  -34.21475503  -1.38259062  -0.06812557  -0.22289653  -1.30701959  -0.22289653
 G2-136   -1.16848677  -0.47536122  -0.65725895  -0.64737177  -0.04328199  -0.00092672  0.00000000  -0.04020837  0.00000000  -1.16612636  -0.47640324  -0.65574646  -0.64675859  -0.04296453  -0.00183696  0.00000000  -0.04587941  0.00000000
 G2-137   -398.61427809  -372.74546482  -25.34748730  -25.20798303  -0.62595416  -0.00794709  -0.05946484  -0.29461029  -0.04153151  -398.58034537  -372.75456839  -25.33262710  -25.20074074  -0.62503624  -0.01569596  -0.06629785  -0.32806771  -0.04548391
 G2-138   -76.53264337  -65.54500009  -10.61506847  -10.59566688  -0.38712600  -0.01045613  -0.05984407  -0.33973967  -0.04587632  -76.52908715  -65.54682362  -10.60444142  -10.59546034  -0.38680319  -0.02151926  -0.07174264  -0.40592481  -0.05594701
 G2-139   -77.82656810  -66.04399390  -11.36048614  -11.31598122  -0.45546675  -0.01187680  -0.05828782  -0.36435538  -0.04392835  -77.81691464  -66.04800512  -11.34678734  -11.31422196  -0.45468757  -0.02506525  -0.06780504  -0.42339212  -0.05243906
 G2-140   -153.05872614  -132.75149693  -19.58512675  -19.56080973  -0.74034023  -0.02310916  -0.10273222  -0.62847560  -0.10042226  -153.05520488  -132.75997412  -19.56031235  -19.55676986  -0.73846090  -0.04990534  -0.11942282  -0.72520369  -0.12001718
 G2-141   -114.97510761  -100.00395393  -14.44608342  -14.41963718  -0.54490494  -0.01550920  -0.07578141  -0.44459975  -0.06414314  -114.97027623  -100.01426511  -14.42468491  -14.41267288  -0.54333825  -0.03348824  -0.08628518  -0.50522305  -0.07548045
 G2-142   -114.96306066  -100.01984657  -14.42838117  -14.39388674  -0.54070373  -0.01805930  -0.07122056  -0.43070060  -0.05765467  -114.95688603  -100.03230838  -14.39924880  -14.38491823  -0.53965941  -0.04300139  -0.08169793  -0.49509651  -0.07161985
 G2-143   -154.24511731  -133.16298048  -20.33082883  -20.26335041  -0.80191681  -0.02502139  -0.10067362  -0.63269086  -0.08801704  -154.23162316  -133.17789024  -20.29300171  -20.25339222  -0.80034070  -0.06047231  -0.11589665  -0.72607875  -0.10812429
 G2-144   -437.89384320  -405.88536314  -31.24762533  -31.07961544  -0.88686214  -0.01519240  -0.08839530  -0.49970670  -0.07307268  -437.85368213  -405.89665288  -31.22458813  -31.07155922  -0.88547004  -0.03191409  -0.09977403  -0.56233577  -0.08322273
 G2-145   -79.07950951  -66.49615877  -12.11972489  -12.04214436  -0.52181126  -0.01198453  -0.06090192  -0.39123214  -0.04237877  -79.06155568  -66.50245217  -12.10457774  -12.03871615  -0.52038736  -0.02506782  -0.06993471  -0.44312533  -0.04934260
 G2-146   -118.36222508  -99.63712364  -18.02345727  -17.91341413  -0.78417653  -0.01846358  -0.09030814  -0.59362033  -0.07300674  -118.33693158  -99.64502337  -18.00173738  -17.90972059  -0.78218761  -0.03852347  -0.10395116  -0.67259175  -0.08492127
 G2-147   -157.64496565  -132.77945276  -23.92616341  -23.78271558  -1.04693536  -0.02491915  -0.12057668  -0.79748701  -0.10418340  -157.61209103  -132.78879681  -23.89810701  -23.77894088  -1.04435334  -0.05185718  -0.13909932  -0.90367537  -0.12103887
 G2-148   -204.94087976  -181.21333587  -22.87039612  -22.97298251  -0.78020799  -0.03046503  -0.13668617  -0.77161227  -0.15421096  -204.96976262  -181.21314347  -22.84960736  -22.97833185  -0.77828730  -0.06484889  -0.16010568  -0.91526357  -0.19220822
 G2-149   -155.82519490  -132.13669334  -22.79641256  -22.71298286  -0.95466127  -0.02396768  -0.11379589  -0.77795451  -0.11379589  -155.80710313  -132.13661516  -22.77904948  -22.71801436  -0.95247360  -0.04896491  -0.13269275  -0.89374309  -0.13269275
 G2-150   -195.12332311  -165.28850834  -28.70992259  -28.58711181  -1.21700027  -0.03013719  -0.14406455  -0.98194092  -0.14406455  -195.09611375  -165.28824796  -28.68806931  -28.59357363  -1.21429216  -0.06174907  -0.16740300  -1.12621557  -0.16740300
 G2-151   -196.37207953  -165.68555663  -29.51459215  -29.33997667  -1.30289236  -0.02969725  -0.14609069  -1.00575258  -0.14609069  -196.33183862  -165.69040184  -29.48901270  -29.34198956  -1.29944722  -0.05930687  -0.16823771  -1.13762071  -0.16823771
 G2-152   -197.57737701  -166.17310982  -30.20041313  -30.01159156  -1.34547024  -0.03032211  -0.14417451  -1.03730360  -0.14417451  -197.53366206  -166.17951856  -30.17292653  -30.01233025  -1.34181326  -0.06067671  -0.16589955  -1.17243360  -0.16589955
 G2-153   -197.58054151  -166.18115874  -30.19298959  -30.00326386  -1.34868748  -0.03041387  -0.14715054  -1.04391662  -0.14715054  -197.53661321  -166.18718082  -30.16575249  -30.00435926  -1.34507312  -0.06093923  -0.16947569  -1.18028054  -0.16947569
 G2-154   -233.20312048  -197.93533194  -33.93994468  -33.79504347  -1.43651977  -0.03522617  -0.17608714  -1.15019653  -0.17608714  -233.17095836  -197.93453323  -33.91505650  -33.80304818  -1.43337695  -0.07156930  -0.20455168  -1.31608850  -0.20455168
 G2-155   -233.20320461  -197.93263515  -33.94516648  -33.79688919  -1.43661094  -0.03527680  -0.17416533  -1.14680423  -0.17416533  -233.17019855  -197.93198756  -33.92006784  -33.80468990  -1.43352109  -0.07155534  -0.20197288  -1.31151601  -0.20197288
 G2-156   -235.65769345  -198.82319825  -35.42754313  -35.21445552  -1.56676779  -0.03604195  -0.17645365  -1.20860751  -0.17645365  -235.60856726  -198.82850830  -35.39682201  -35.21726969  -1.56278927  -0.07223901  -0.20319817  -1.36663966  -0.20319817
 G2-157   -236.85397860  -199.31059277  -36.10467148  -35.88047499  -1.60686171  -0.03636107  -0.17381669  -1.23922831  -0.17381669  -236.80211523  -199.31781236  -36.07208212  -35.88173655  -1.60256633  -0.07280194  -0.20005650  -1.40078591  -0.20005650
 G2-158   -236.85270062  -199.31057451  -36.10091467  -35.87672702  -1.60935218  -0.03652916  -0.17578497  -1.24378821  -0.17578497  -236.80086100  -199.31748433  -36.06840501  -35.87825039  -1.60512628  -0.07326166  -0.20245514  -1.40627703  -0.20245514
 G2-159   -271.31495248  -230.65474413  -39.13631101  -38.98566662  -1.63688063  -0.03782611  -0.21194907  -1.31175104  -0.21194907  -271.28159415  -230.64977754  -39.11405647  -38.99822152  -1.63359510  -0.07586898  -0.24659001  -1.49692497  -0.24659001
 G2-160   -276.13057571  -232.44772056  -42.00929294  -41.74967369  -1.86827664  -0.04239581  -0.20346172  -1.44114894  -0.20346172  -276.07055142  -232.45574645  -41.97160834  -41.75146154  -1.86334343  -0.08491744  -0.23421501  -1.62912562  -0.23421501
 G2-161   -309.29885812  -263.32149973  -44.25837063  -44.11068921  -1.82974884  -0.04758887  -0.23615742  -1.50074497  -0.23615742  -309.26743933  -263.31619728  -44.22809110  -44.12502651  -1.82621554  -0.09796183  -0.27607699  -1.72871278  -0.27607699
 G2-162   -315.40715800  -265.58550279  -47.91323310  -47.61828061  -2.12963648  -0.04843464  -0.23310456  -1.64309247  -0.23310456  -315.33899569  -265.59433243  -47.87045328  -47.62059849  -2.12406477  -0.09704199  -0.26837361  -1.85750516  -0.26837361
 G2-163   -385.54178574  -328.71242416  -54.70920896  -54.53224999  -2.25287184  -0.05314070  -0.30888527  -1.82443082  -0.30888527  -385.50357850  -328.70000281  -54.68280881  -54.55466497  -2.24891072  -0.10687418  -0.36038305  -2.08711761  -0.36038305
 G2-164   -385.48642308  -328.69457327  -54.65611121  -54.50418290  -2.24968483  -0.05505711  -0.31464348  -1.84708673  -0.31464348  -385.45466946  -328.68080466  -54.62957969  -54.52810285  -2.24576195  -0.11206610  -0.36897450  -2.12309731  -0.36897450
 G2-165   -268.18188539  -232.77637734  -34.12641736  -34.06751144  -1.32327013  -0.04030882  -0.17890987  -1.10947486  -0.17890987  -268.17160966  -232.78538719  -34.08886562  -34.06605522  -1.32016725  -0.08580624  -0.20821926  -1.26765565  -0.20821926
 G2-166   -233.47830825  -199.69019952  -32.52541534  -32.38384519  -1.36887100  -0.03355124  -0.16307762  -1.09040543  -0.16307762  -233.44673550  -199.69991521  -32.49226117  -32.38164673  -1.36517356  -0.06883823  -0.18781240  -1.23373672  -0.18781240
 G2-167   -287.35561833  -245.57782684  -40.21659119  -40.09547329  -1.65203872  -0.04019753  -0.22270539  -1.34146393  -0.22270539  -287.32989938  -245.57358892  -40.19187507  -40.10770282  -1.64860763  -0.08244337  -0.25912668  -1.53248348  -0.25912668
 G2-168   -307.21387146  -264.15784513  -41.47151240  -41.37082969  -1.66002596  -0.04202401  -0.22903387  -1.36025593  -0.22903387  -307.19342705  -264.15637460  -41.44279015  -41.38042283  -1.65662961  -0.08704038  -0.26647329  -1.55375886  -0.26647329
 G2-169   -231.00234425  -198.78811405  -31.03026509  -30.96119933  -1.23576443  -0.03545503  -0.15946012  -1.03046581  -0.15946012  -230.98906265  -198.79128527  -31.00151518  -30.96476665  -1.23301074  -0.07513611  -0.18559294  -1.18366156  -0.18559294
 G2-170   -232.25579595  -199.19157106  -31.83701837  -31.71273108  -1.32042200  -0.03394963  -0.16128198  -1.05326985  -0.16128198  -232.22856668  -199.19941534  -31.80525335  -31.71210012  -1.31705123  -0.06969453  -0.18606905  -1.19321354  -0.18606905
 G2-171   -270.34670353  -231.91319017  -37.00971158  -36.88036224  -1.52081378  -0.04062622  -0.19265708  -1.22846834  -0.19265708  -270.31892089  -231.91989065  -36.97431930  -36.88188359  -1.51714665  -0.08429839  -0.22353995  -1.40003812  -0.22353995
 G2-172   -381.14622103  -330.39674837  -48.91639133  -48.86951191  -1.86824089  -0.05789989  -0.26929612  -1.60803731  -0.26929612  -381.14095213  -330.39653904  -48.87413637  -48.87968597  -1.86472712  -0.12437672  -0.31593508  -1.86440034  -0.31593508
 G2-173   -264.09863942  -227.39751934  -35.34874073  -35.29001481  -1.39642379  -0.03628059  -0.20038694  -1.17215853  -0.20038694  -264.08803121  -227.39199055  -35.32817793  -35.30240042  -1.39364024  -0.07362799  -0.23422938  -1.34509406  -0.23422938
 G2-174   -628.15288041  -572.48188978  -54.02700312  -53.86782346  -1.76337225  -0.04845334  -0.22185993  -1.27816175  -0.22185993  -628.11841174  -572.49613304  -53.97805484  -53.86206913  -1.76020957  -0.10389706  -0.25802208  -1.45787563  -0.25802208
 G2-175   -691.50367060  -629.26707906  -60.40327269  -60.15372282  -2.02048125  -0.04009407  -0.23495118  -1.37021013  -0.23495118  -691.44583186  -629.27361735  -60.36770159  -60.15499571  -2.01721881  -0.08139656  -0.27271425  -1.56342560  -0.27271425
 G2-176   -264.07057497  -227.48824316  -35.25576738  -35.20296720  -1.36616457  -0.03646765  -0.19399707  -1.19831324  -0.19399707  -264.06149785  -227.48537756  -35.23230155  -35.21291960  -1.36320069  -0.07492146  -0.22930801  -1.39075283  -0.22930801
 G2-177   -264.09159600  -227.39728002  -35.33921619  -35.28492997  -1.39581445  -0.03518585  -0.20108132  -1.17557027  -0.20108132  -264.08201960  -227.39071145  -35.32016925  -35.29825589  -1.39305226  -0.07161986  -0.23502538  -1.34956495  -0.23502538
 G2-178   -229.78038655  -198.35582810  -30.28503116  -30.24423324  -1.17012573  -0.03483237  -0.16340800  -1.01364394  -0.16340800  -229.77406165  -198.35716233  -30.25855409  -30.24927085  -1.16762846  -0.07482104  -0.19302640  -1.17522365  -0.19302640
 G2-179   -231.03801503  -198.81691687  -31.03923538  -30.96723212  -1.23586523  -0.03570357  -0.16066740  -1.03231031  -0.16066740  -231.02401382  -198.82139088  -31.00913417  -30.96960998  -1.23301296  -0.07592498  -0.18762001  -1.18724967  -0.18762001
 G2-180   -381.44180036  -332.15012867  -47.52354645  -47.47675689  -1.80321741  -0.05796329  -0.25711786  -1.53765351  -0.25711786  -381.43646120  -332.16000289  -47.47231940  -47.47718195  -1.79927637  -0.12537898  -0.30059752  -1.76372717  -0.30059752
 G2-181   -553.94050218  -504.62655878  -47.88185176  -47.65480965  -1.60237322  -0.03313577  -0.17707191  -1.08730069  -0.17707191  -553.88758593  -504.63323157  -47.85091776  -47.65499628  -1.59935807  -0.06711966  -0.20363869  -1.23616017  -0.20363869
 G2-182   -211.18955621  -180.26521196  -29.77675111  -29.67263157  -1.22568280  -0.03041317  -0.15487885  -1.01765318  -0.15487885  -211.16699511  -180.26663355  -29.75369453  -29.67766405  -1.22269751  -0.06183084  -0.18124532  -1.16817138  -0.18124532
 G2-183   -232.27204331  -199.26212400  -31.78890691  -31.68037322  -1.30241267  -0.03508586  -0.16131917  -1.05910384  -0.16131917  -232.24883699  -199.26944199  -31.75685951  -31.68018099  -1.29921400  -0.07345300  -0.18727162  -1.20766413  -0.18727162
 G2-184   -232.26003277  -199.25975196  -31.77992238  -31.67205325  -1.30126027  -0.03505707  -0.16143073  -1.06266891  -0.16143073  -232.23698792  -199.26762512  -31.74748417  -31.67143038  -1.29793242  -0.07329605  -0.18748323  -1.21273596  -0.18748323
 G2-185   -307.41759878  -265.83610949  -40.06248415  -39.95277588  -1.60128634  -0.04506066  -0.20686012  -1.30521983  -0.20686012  -307.39524723  -265.84814868  -40.01814624  -39.94967614  -1.59742242  -0.09513890  -0.23918260  -1.48090257  -0.23918260
 G2-186   -555.16929087  -505.07176365  -48.62470963  -48.36493682  -1.66764720  -0.03344009  -0.17796281  -1.11704969  -0.17796281  -555.10822179  -505.08131713  -48.59114876  -48.36271763  -1.66418702  -0.06724181  -0.20379861  -1.26195658  -0.20379861
 G2-187   -617.77595597  -564.80500357  -51.45799169  -51.16794127  -1.73049853  -0.03259752  -0.16907526  -1.09919547  -0.16907526  -617.70718180  -564.82249769  -51.41750129  -51.15770823  -1.72697589  -0.06584383  -0.19415929  -1.24312209  -0.19415929
 G2-188   -617.76869867  -564.79080471  -51.46790507  -51.17774848  -1.72760633  -0.03215762  -0.16579576  -1.09197019  -0.16579576  -617.69984545  -564.80895733  -51.42724757  -51.16691221  -1.72397591  -0.06468039  -0.19016046  -1.23421938  -0.19016046
 G2-189   -212.39720721  -180.61276623  -30.57953915  -30.43331653  -1.31456880  -0.03171638  -0.15549419  -1.03492891  -0.15549419  -212.36428920  -180.61878920  -30.55129774  -30.43452960  -1.31097040  -0.06443593  -0.17924536  -1.17203130  -0.17924536
 G2-190   -362.67821415  -313.97852327  -46.88011261  -46.82295292  -1.86244804  -0.05471495  -0.26013686  -1.60043451  -0.26013686  -362.66997256  -313.98148505  -46.83868573  -46.83049910  -1.85798840  -0.11432105  -0.30402870  -1.84406235  -0.30402870
 G2-191   -233.46034286  -199.67980231  -32.52122082  -32.38307944  -1.36292577  -0.03472748  -0.15949208  -1.08487145  -0.15949208  -233.42973907  -199.68977907  -32.48694683  -32.38066097  -1.35929903  -0.07147948  -0.18387859  -1.22804396  -0.18387859
 G2-192   -308.62221867  -266.32137520  -40.74881180  -40.62459879  -1.64519143  -0.04521280  -0.20654911  -1.33938551  -0.20654911  -308.59626106  -266.33355055  -40.70437162  -40.62151900  -1.64119151  -0.09461263  -0.23864312  -1.51845244  -0.23864312
 G2-193   -556.37123658  -505.56562643  -49.29932531  -49.02256574  -1.71385452  -0.03384196  -0.17818378  -1.15315862  -0.17818378  -556.30597490  -505.57628651  -49.26445514  -49.01948388  -1.71020451  -0.06809854  -0.20373080  -1.30154113  -0.20373080
 G2-194   -954.44521164  -878.07990110  -74.32136836  -73.93329579  -2.33499661  -0.04457310  -0.23750730  -1.46280502  -0.23750730  -954.35343017  -878.09661459  -74.27170159  -73.92607620  -2.33073937  -0.09136308  -0.27169304  -1.65253273  -0.27169304
 G2-195   -213.61484635  -181.11274212  -31.26258007  -31.10019278  -1.36131463  -0.03178949  -0.15693445  -1.07276481  -0.15693445  -213.57790542  -181.11985144  -31.23331259  -31.10052844  -1.35752553  -0.06445186  -0.18077488  -1.21393010  -0.18077488
 G2-196   -448.92853398  -402.07284003  -45.40182487  -45.12054733  -1.66482723  -0.03294976  -0.16239456  -1.11356261  -0.16239456  -448.86208882  -402.08865903  -45.36214590  -45.11224416  -1.66118562  -0.06663227  -0.18572810  -1.25440008  -0.18572810
 G2-197   -592.02853026  -537.32377809  -53.06694696  -52.84192127  -1.80657447  -0.03763316  -0.21592363  -1.26758585  -0.21592363  -591.97659564  -537.32615715  -53.03713520  -52.84705400  -1.80338449  -0.07605540  -0.25009310  -1.44447524  -0.25009310
 G2-198   -249.26170074  -212.87259692  -35.02063074  -34.90816827  -1.45281993  -0.03466412  -0.19183378  -1.18126870  -0.19183378  -249.23750129  -212.86913541  -34.99962162  -34.91880448  -1.44956140  -0.06944038  -0.22239449  -1.34676903  -0.22239449
 G2-199   -271.53887699  -232.32988463  -37.74596924  -37.58450956  -1.58411788  -0.04056372  -0.19170648  -1.25666482  -0.19170648  -271.50312000  -232.33863393  -37.70840649  -37.58430624  -1.58017983  -0.08365349  -0.22123629  -1.42335038  -0.22123629
 G2-200   -271.54896502  -232.39760658  -37.69535948  -37.55093897  -1.56431434  -0.04114732  -0.19110028  -1.26112040  -0.19110028  -271.51748291  -232.40539871  -37.65846535  -37.55153321  -1.56055099  -0.08569130  -0.22162610  -1.43609510  -0.22162610
 G2-201   -346.74403125  -299.06041357  -45.93367600  -45.80445277  -1.84685911  -0.05270553  -0.23956015  -1.51540969  -0.23956015  -346.71760717  -299.07082698  -45.88574359  -45.80421052  -1.84256967  -0.11100506  -0.27836970  -1.72736797  -0.27836970
 G2-202   -594.44891374  -538.20623905  -54.53415106  -54.23737090  -1.93110875  -0.03988467  -0.20822566  -1.32021262  -0.20822566  -594.37934268  -538.21656273  -54.49502453  -54.23568276  -1.92709719  -0.08061735  -0.23871111  -1.49154193  -0.23871111
 G2-203   -251.68075724  -213.74922667  -36.49080763  -36.30719088  -1.57843550  -0.03807721  -0.18602528  -1.23827595  -0.18602528  -251.63923095  -213.75547287  -36.45756513  -36.30941839  -1.57433970  -0.07752782  -0.21449053  -1.40184553  -0.21449053
 G2-204   -272.73572158  -232.81929667  -38.41862113  -38.24459396  -1.62832416  -0.04087594  -0.19253712  -1.29520660  -0.19253712  -272.69685827  -232.82855015  -38.38044062  -38.24404388  -1.62426424  -0.08391890  -0.22216317  -1.46664718  -0.22216317
 G2-205   -430.40599509  -375.87342679  -52.63373830  -52.55393398  -1.95868324  -0.05483367  -0.27892578  -1.60885782  -0.27892578  -430.39202320  -375.88421333  -52.58422150  -52.55298254  -1.95482733  -0.11663592  -0.32296965  -1.82961946  -0.32296965
 G2-206   -430.40463062  -375.87152510  -52.63415295  -52.55483705  -1.95843950  -0.05455602  -0.27880514  -1.60903700  -0.27880514  -430.39075209  -375.88226439  -52.58490480  -52.55391708  -1.95457062  -0.11588362  -0.32277601  -1.82995066  -0.32277601
 G2-207   -331.22071190  -286.69490625  -42.93274777  -42.83488736  -1.66645319  -0.04320374  -0.23005249  -1.35844720  -0.23005249  -331.20103012  -286.69749782  -42.89939876  -42.84033165  -1.66320065  -0.08994300  -0.26704338  -1.54823001  -0.26704338
 G2-208   -312.01898988  -265.96374684  -44.32374421  -44.11522711  -1.88788665  -0.04711282  -0.22147478  -1.49447946  -0.22147478  -311.97222907  -265.97471369  -44.27936000  -44.11435975  -1.88315562  -0.09689236  -0.25566892  -1.69216029  -0.25566892
 G2-209   -840.33283867  -765.14134268  -73.09964037  -72.99481938  -2.17047136  -0.06186381  -0.29945658  -1.61381328  -0.29945658  -840.31335809  -765.18663239  -73.00965849  -72.95958328  -2.16714242  -0.13478610  -0.34010580  -1.80556402  -0.34010580
 G2-210   -996.72468990  -908.84199594  -85.36986026  -85.31395054  -2.55476599  -0.07681626  -0.36695336  -1.96381044  -0.36695336  -996.71905049  -908.88124311  -85.27496322  -85.28692997  -2.55087742  -0.16701674  -0.41882619  -2.20849462  -0.41882619
 G2-211   -1365.00881135  -1272.50543464  -90.49243982  -90.08173350  -2.31896663  -0.03396154  -0.23567515  -1.17856994  -0.23567515  -1364.91016464  -1272.52335101  -90.44887355  -90.07073898  -2.31607465  -0.06824810  -0.26992224  -1.33985649  -0.26992224
 G2-212   -623.55060792  -572.43010429  -49.67690487  -49.65343115  -1.46120406  -0.04693661  -0.21719169  -1.13470052  -0.21719169  -623.54977436  -572.43736481  -49.63616604  -49.65353187  -1.45887768  -0.10194295  -0.25683966  -1.31885006  -0.25683966
 G2-213   -1318.17828943  -1236.50911932  -80.00966008  -79.62359944  -1.94905551  -0.02768057  -0.15992817  -0.86213450  -0.15992817  -1318.08504345  -1236.54170871  -79.95597826  -79.59651135  -1.94682338  -0.05962464  -0.18306072  -0.97946238  -0.18306072
 G2-214   -1796.71112045  -1680.71923945  -113.51598135  -112.99346055  -2.86779025  -0.04876256  -0.26144571  -1.36833488  -0.26144571  -1796.58585757  -1680.76773698  -113.43231800  -112.95339009  -2.86473049  -0.10541675  -0.30098167  -1.55339179  -0.30098167
 G2-215   -2641.62536352  -2478.02010066  -160.28037247  -159.46419487  -3.93702360  -0.05445836  -0.32161889  -1.67376077  -0.32161889  -2641.42747363  -2478.08943158  -160.17110018  -159.40487680  -3.93316525  -0.11494375  -0.36778368  -1.89270605  -0.36778368
 G2-216   -1468.51978422  -1369.73740509  -96.49909043  -96.17383773  -2.52722823  -0.05544502  -0.27304866  -1.42016024  -0.27304866  -1468.44445260  -1369.76892934  -96.42817365  -96.15142738  -2.52409587  -0.12049690  -0.31818027  -1.63034305  -0.31818027
 G2-217   -1721.50257333  -1614.12677423  -105.19521538  -104.66807243  -2.57594093  -0.03687385  -0.20851847  -1.10460301  -0.20851847  -1721.37503563  -1614.17280463  -105.12157482  -104.62894303  -2.57328797  -0.07938405  -0.23878575  -1.25038641  -0.23878575
 G2-218   -1716.26668480  -1609.05160928  -105.00261049  -104.52019739  -2.57427485  -0.04150202  -0.22756436  -1.19131204  -0.22756436  -1716.15124142  -1609.08831205  -104.93163213  -104.49137123  -2.57155814  -0.09508709  -0.26454391  -1.36533988  -0.26454391
 G2-219   -1209.57446166  -1132.62422510  -75.39243718  -75.00708020  -1.84681712  -0.02590648  -0.14454816  -0.78319675  -0.14454816  -1209.48105715  -1132.66098651  -75.33679012  -74.97524940  -1.84482124  -0.05610749  -0.16462854  -0.88568911  -0.16462854
 G2-220   -797.50399635  -732.92801463  -62.85814303  -62.71810111  -1.82287012  -0.04685055  -0.22512229  -1.23575714  -0.22512229  -797.47403377  -732.96288736  -62.79047482  -62.69153722  -1.81960918  -0.10209368  -0.25725137  -1.38998488  -0.25725137
 G2-221   -674.88562233  -601.86709509  -70.70693226  -70.70344631  -2.31420944  -0.07625767  -0.34748754  -1.92236029  -0.34748754  -674.89291310  -601.91049560  -70.60984485  -70.67288009  -2.30953740  -0.16724903  -0.39712485  -2.15877008  -0.39712485
 G2-222   -337.36823247  -300.91292990  -35.31466665  -35.31947720  -1.13702801  -0.03952403  -0.17284515  -0.94065499  -0.16887906  -337.37374957  -300.94172093  -35.25734105  -35.29737899  -1.13464965  -0.08892208  -0.19680492  -1.06055292  -0.19567718
 G2-223   -231.34961202  -197.24380256  -32.85128272  -32.74510068  -1.33416328  -0.03271301  -0.18618328  -1.07181154  -0.17162353  -231.32692688  -197.24186839  -32.82781108  -32.75299157  -1.33206692  -0.06797994  -0.21722298  -1.23149595  -0.20296495

