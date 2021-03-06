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
"================================ Total(223) ================================"
"There are about :                                                           " 
" 1)  223 HOFs from the G3 set                                               "

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
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 223  1.0
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

__xyg3 components__ ::  240
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
