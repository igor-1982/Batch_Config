# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BLYP           2                   QChem

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
" 5) BLYP referece KS orbital is used                                        "

__initial guess__ ::
# For XYG3
0.8033, 0.2107, 0.6667, 0.2107

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
    a1, a3, a6, a9 = C
    a2  = 1. - a1
    a4  = 0. 
    a5  = a6
    #a6  = 0.
    a7  = a6
    a8  = a9
    #a9 = 0.
    a10 = a9

    E_noXC, Ex_HF, Ex_B, Ec_LYP, Ec_PT21, aaaa, abab, bbbb,\
    aaaa_erf200, abab_erf200, bbbb_erf200 = P
    return E_noXC + a1*Ex_HF + a2*Ex_B + a3*Ec_LYP \
           + a4*Ec_PT21 + a5*aaaa + a6*abab + a7*bbbb\
           + a8*aaaa_erf200 + a9*abab_erf200 + a10*bbbb_erf200

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
#               534 = 17+223+31+15+21+19+52+48+56+34+18 is the total number of jobs in this batch list
__batch__ ::  534
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
 G2-100            <PATH2>/G2                   XYG3_Comp      energy
 G2-101            <PATH2>/G2                   XYG3_Comp      energy
 G2-102            <PATH2>/G2                   XYG3_Comp      energy
 G2-103            <PATH2>/G2                   XYG3_Comp      energy
 G2-104            <PATH2>/G2                   XYG3_Comp      energy
 G2-105            <PATH2>/G2                   XYG3_Comp      energy
 G2-106            <PATH2>/G2                   XYG3_Comp      energy
 G2-107            <PATH2>/G2                   XYG3_Comp      energy
 G2-108            <PATH2>/G2                   XYG3_Comp      energy
 G2-109            <PATH2>/G2                   XYG3_Comp      energy
 G2-110            <PATH2>/G2                   XYG3_Comp      energy
 G2-111            <PATH2>/G2                   XYG3_Comp      energy
 G2-112            <PATH2>/G2                   XYG3_Comp      energy
 G2-113            <PATH2>/G2                   XYG3_Comp      energy
 G2-114            <PATH2>/G2                   XYG3_Comp      energy
 G2-115            <PATH2>/G2                   XYG3_Comp      energy
 G2-116            <PATH2>/G2                   XYG3_Comp      energy
 G2-117            <PATH2>/G2                   XYG3_Comp      energy
 G2-118            <PATH2>/G2                   XYG3_Comp      energy
 G2-119            <PATH2>/G2                   XYG3_Comp      energy
 G2-120            <PATH2>/G2                   XYG3_Comp      energy
 G2-121            <PATH2>/G2                   XYG3_Comp      energy
 G2-122            <PATH2>/G2                   XYG3_Comp      energy
 G2-123            <PATH2>/G2                   XYG3_Comp      energy
 G2-124            <PATH2>/G2                   XYG3_Comp      energy
 G2-125            <PATH2>/G2                   XYG3_Comp      energy
 G2-126            <PATH2>/G2                   XYG3_Comp      energy
 G2-127            <PATH2>/G2                   XYG3_Comp      energy
 G2-128            <PATH2>/G2                   XYG3_Comp      energy
 G2-129            <PATH2>/G2                   XYG3_Comp      energy
 G2-130            <PATH2>/G2                   XYG3_Comp      energy
 G2-131            <PATH2>/G2                   XYG3_Comp      energy
 G2-132            <PATH2>/G2                   XYG3_Comp      energy
 G2-133            <PATH2>/G2                   XYG3_Comp      energy
 G2-134            <PATH2>/G2                   XYG3_Comp      energy
 G2-135            <PATH2>/G2                   XYG3_Comp      energy
 G2-136            <PATH2>/G2                   XYG3_Comp      energy
 G2-137            <PATH2>/G2                   XYG3_Comp      energy
 G2-138            <PATH2>/G2                   XYG3_Comp      energy
 G2-139            <PATH2>/G2                   XYG3_Comp      energy
 G2-140            <PATH2>/G2                   XYG3_Comp      energy
 G2-141            <PATH2>/G2                   XYG3_Comp      energy
 G2-142            <PATH2>/G2                   XYG3_Comp      energy
 G2-143            <PATH2>/G2                   XYG3_Comp      energy
 G2-144            <PATH2>/G2                   XYG3_Comp      energy
 G2-145            <PATH2>/G2                   XYG3_Comp      energy
 G2-146            <PATH2>/G2                   XYG3_Comp      energy
 G2-147            <PATH2>/G2                   XYG3_Comp      energy
 G2-148            <PATH2>/G2                   XYG3_Comp      energy
 G2-149            <PATH2>/G2                   XYG3_Comp      energy
 G2-150            <PATH2>/G2                   XYG3_Comp      energy
 G2-151            <PATH2>/G2                   XYG3_Comp      energy
 G2-152            <PATH2>/G2                   XYG3_Comp      energy
 G2-153            <PATH2>/G2                   XYG3_Comp      energy
 G2-154            <PATH2>/G2                   XYG3_Comp      energy
 G2-155            <PATH2>/G2                   XYG3_Comp      energy
 G2-156            <PATH2>/G2                   XYG3_Comp      energy
 G2-157            <PATH2>/G2                   XYG3_Comp      energy
 G2-158            <PATH2>/G2                   XYG3_Comp      energy
 G2-159            <PATH2>/G2                   XYG3_Comp      energy
 G2-160            <PATH2>/G2                   XYG3_Comp      energy
 G2-161            <PATH2>/G2                   XYG3_Comp      energy
 G2-162            <PATH2>/G2                   XYG3_Comp      energy
 G2-163            <PATH2>/G2                   XYG3_Comp      energy
 G2-164            <PATH2>/G2                   XYG3_Comp      energy
 G2-165            <PATH2>/G2                   XYG3_Comp      energy
 G2-166            <PATH2>/G2                   XYG3_Comp      energy
 G2-167            <PATH2>/G2                   XYG3_Comp      energy
 G2-168            <PATH2>/G2                   XYG3_Comp      energy
 G2-169            <PATH2>/G2                   XYG3_Comp      energy
 G2-170            <PATH2>/G2                   XYG3_Comp      energy
 G2-171            <PATH2>/G2                   XYG3_Comp      energy
 G2-172            <PATH2>/G2                   XYG3_Comp      energy
 G2-173            <PATH2>/G2                   XYG3_Comp      energy
 G2-174            <PATH2>/G2                   XYG3_Comp      energy
 G2-175            <PATH2>/G2                   XYG3_Comp      energy
 G2-176            <PATH2>/G2                   XYG3_Comp      energy
 G2-177            <PATH2>/G2                   XYG3_Comp      energy
 G2-178            <PATH2>/G2                   XYG3_Comp      energy
 G2-179            <PATH2>/G2                   XYG3_Comp      energy
 G2-180            <PATH2>/G2                   XYG3_Comp      energy
 G2-181            <PATH2>/G2                   XYG3_Comp      energy
 G2-182            <PATH2>/G2                   XYG3_Comp      energy
 G2-183            <PATH2>/G2                   XYG3_Comp      energy
 G2-184            <PATH2>/G2                   XYG3_Comp      energy
 G2-185            <PATH2>/G2                   XYG3_Comp      energy
 G2-186            <PATH2>/G2                   XYG3_Comp      energy
 G2-187            <PATH2>/G2                   XYG3_Comp      energy
 G2-188            <PATH2>/G2                   XYG3_Comp      energy
 G2-189            <PATH2>/G2                   XYG3_Comp      energy
 G2-190            <PATH2>/G2                   XYG3_Comp      energy
 G2-191            <PATH2>/G2                   XYG3_Comp      energy
 G2-192            <PATH2>/G2                   XYG3_Comp      energy
 G2-193            <PATH2>/G2                   XYG3_Comp      energy
 G2-194            <PATH2>/G2                   XYG3_Comp      energy
 G2-195            <PATH2>/G2                   XYG3_Comp      energy
 G2-196            <PATH2>/G2                   XYG3_Comp      energy
 G2-197            <PATH2>/G2                   XYG3_Comp      energy
 G2-198            <PATH2>/G2                   XYG3_Comp      energy
 G2-199            <PATH2>/G2                   XYG3_Comp      energy
 G2-200            <PATH2>/G2                   XYG3_Comp      energy
 G2-201            <PATH2>/G2                   XYG3_Comp      energy
 G2-202            <PATH2>/G2                   XYG3_Comp      energy
 G2-203            <PATH2>/G2                   XYG3_Comp      energy
 G2-204            <PATH2>/G2                   XYG3_Comp      energy
 G2-205            <PATH2>/G2                   XYG3_Comp      energy
 G2-206            <PATH2>/G2                   XYG3_Comp      energy
 G2-207            <PATH2>/G2                   XYG3_Comp      energy
 G2-208            <PATH2>/G2                   XYG3_Comp      energy
 G2-209            <PATH2>/G2                   XYG3_Comp      energy
 G2-210            <PATH2>/G2                   XYG3_Comp      energy
 G2-211            <PATH2>/G2                   XYG3_Comp      energy
 G2-212            <PATH2>/G2                   XYG3_Comp      energy
 G2-213            <PATH2>/G2                   XYG3_Comp      energy
 G2-214            <PATH2>/G2                   XYG3_Comp      energy
 G2-215            <PATH2>/G2                   XYG3_Comp      energy
 G2-216            <PATH2>/G2                   XYG3_Comp      energy
 G2-217            <PATH2>/G2                   XYG3_Comp      energy
 G2-218            <PATH2>/G2                   XYG3_Comp      energy
 G2-219            <PATH2>/G2                   XYG3_Comp      energy
 G2-220            <PATH2>/G2                   XYG3_Comp      energy
 G2-221            <PATH2>/G2                   XYG3_Comp      energy
 G2-222            <PATH2>/G2                   XYG3_Comp      energy
 G2-223            <PATH2>/G2                   XYG3_Comp      energy
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

# Training set for the atomization energy
#              358 = 223+38+38+31+22+6 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 358  1.0
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

#               534 = 17+223+31+15+21+19+52+48+56+34+18 is the total number of jobs in this batch list
__xyg3 components__ ::  534
#        E_noXC     E_K     Ex_Becke      Ec_LYP      PT2_1ST    aaaa     abab     bbbb      aaaa_erf200     abab_erf200     bbbb_erf200
# 17 atoms
   H_0  -0.19192309  -0.30717179  -0.30579839  0.00000000 -0.00080331  0.00000000  0.00000000  0.00000000  0.00000000  0.00000000  0.00000000
  He_0  -1.84411960  -1.01387824  -1.01753950 -0.04372008 -0.00239879  0.00000000 -0.04045477  0.00000000  0.00000000 -0.00000550  0.00000000
  Li_0  -5.65035417  -1.78060827  -1.77619380 -0.05388724 -0.00087460 -0.00042220 -0.03765183  0.00000000 -0.00000822 -0.00000959  0.00000000
  Be_0  -11.90095589  -2.66942478  -2.66281354 -0.09514713 -0.00129046 -0.00058931 -0.11113233 -0.00058931 -0.00000189 -0.00094039 -0.00000189
   B_0  -20.76370569  -3.76360013  -3.76064452 -0.12591817 -0.00330719 -0.00733294 -0.12629313 -0.00070149 -0.00006473 -0.00033402 -0.00000054
   C_0  -32.62331433  -5.06161908  -5.06228462 -0.15915984 -0.00538936 -0.02302950 -0.13561678 -0.00075082 -0.00005206 -0.00013863 -0.00000019
   N_0  -47.81058686  -6.58224574  -6.58364049 -0.19236378 -0.00691694 -0.04806433 -0.13939379 -0.00078540 -0.00003328 -0.00006360 -0.00000008
   O_0  -66.62028980  -8.18025306  -8.20286570 -0.25742675 -0.01004840 -0.04948067 -0.19705091 -0.00818377 -0.00001367 -0.00003519 -0.00000422
   F_0  -89.39629817  -9.99483425 -10.03610903 -0.32115955 -0.01335083 -0.05094074 -0.25296959 -0.02553862 -0.00000628 -0.00001992 -0.00000412
  Ne_0  -116.46827658 -12.04666105 -12.10148739 -0.38289783 -0.01616886 -0.05236504 -0.30583693 -0.05236504 -0.00000310 -0.00001161 -0.00000310
  Na_0  -147.85112256 -13.98442721 -14.01419062 -0.40959123 -0.01130080 -0.04681490 -0.23821874 -0.04317039 -0.00005979 -0.00006766 -0.00000275
  Mg_0  -183.62578674 -15.97097692 -15.99450138 -0.46089859 -0.00991465 -0.04443514 -0.28349317 -0.04443514 -0.00002548 -0.00158852 -0.00002548
  Al_0  -223.79783953 -18.06473684 -18.08064553 -0.49533112 -0.01076696 -0.05283458 -0.30488364 -0.04641558 -0.00032543 -0.00114515 -0.00001183
  Si_0  -268.56637940 -20.27336245 -20.28298374 -0.53127399 -0.01186815 -0.06820166 -0.32664748 -0.04732162 -0.00049198 -0.00078416 -0.00000604
   P_0  -318.08282147 -22.61770931 -22.61675056 -0.56740162 -0.01077095 -0.09034221 -0.34312747 -0.04729241 -0.00051086 -0.00053346 -0.00000333
   S_0  -372.49224726 -24.99843408 -24.99762763 -0.63005021 -0.01270690 -0.09159868 -0.39275245 -0.05491284 -0.00028719 -0.00050450 -0.00005427
  Cl_0  -431.95795698 -27.50668577 -27.50412430 -0.69138391 -0.01390051 -0.09256515 -0.43922448 -0.07027160 -0.00017381 -0.00041181 -0.00009403
# 223 molecules in G3 set
  G2-1  -5.85154361 -2.13149631 -2.13050624 -0.08837961 -0.00475185 -0.00034455 -0.08546524 -0.00034455 -0.00000310 -0.00029783 -0.00000310
  G2-2  -12.07468016 -3.07269692 -3.06393784 -0.10874898 -0.00402929 -0.00378599 -0.09190974 -0.00042610 -0.00008741 -0.00029645 -0.00000094
  G2-3  -32.86697489 -5.40508331 -5.41469286 -0.19703717 -0.00824423 -0.02162294 -0.19234374 -0.00617423 -0.00006419 -0.00022728 -0.00002032
  G2-4  -33.07957955 -5.84696603 -5.84894021 -0.21434906 -0.00871286 -0.04226211 -0.18292739 -0.00460923 -0.00013072 -0.00020902 -0.00001526
  G2-5  -33.11026168 -5.77143277 -5.78365293 -0.23263288 -0.01028067 -0.01873888 -0.24805338 -0.01873888 -0.00006676 -0.00031841 -0.00006676
  G2-6  -33.35867743 -6.20764357 -6.21068247 -0.25757721 -0.01017420 -0.03798758 -0.23607384 -0.01423364 -0.00013345 -0.00030291 -0.00005308
  G2-7  -33.62507273 -6.57586892 -6.58016523 -0.29451953 -0.01209562 -0.03149147 -0.28421303 -0.03149147 -0.00012484 -0.00041507 -0.00012484
  G2-8  -48.06000223 -6.90977760 -6.92989267 -0.23675816 -0.01032611 -0.04885342 -0.20287718 -0.00675091 -0.00005361 -0.00013339 -0.00001078
  G2-9  -48.30915032 -7.26455427 -7.29569169 -0.27860232 -0.01255730 -0.04750215 -0.26425066 -0.02127229 -0.00007246 -0.00021573 -0.00003881
 G2-10  -48.55771355 -7.64809600 -7.68467034 -0.31753132 -0.01407413 -0.04417308 -0.31981690 -0.04417308 -0.00008679 -0.00030402 -0.00008679
 G2-11  -66.87708657 -8.52904679 -8.57560982 -0.30011825 -0.01395001 -0.05238800 -0.27068565 -0.02557714 -0.00002816 -0.00009173 -0.00001771
 G2-12  -67.13090322 -8.91309015 -8.97529597 -0.33995205 -0.01631453 -0.05305560 -0.34067439 -0.05305560 -0.00004493 -0.00016496 -0.00004493
 G2-13  -89.66270051 -10.38022928 -10.45098630 -0.36188478 -0.01780533 -0.05581470 -0.33615373 -0.05581470 -0.00001631 -0.00006175 -0.00001631
 G2-14  -269.04402143 -20.96627369 -20.97611428 -0.59806495 -0.01807665 -0.05934676 -0.41054050 -0.05934676 -0.00025036 -0.00115940 -0.00025036
 G2-15  -269.00178868 -20.99928669 -21.00255944 -0.57960988 -0.01756989 -0.07642316 -0.36472864 -0.04874419 -0.00063667 -0.00083544 -0.00005294
 G2-16  -269.25795248 -21.36043285 -21.35687035 -0.61636237 -0.01954453 -0.06933406 -0.40264840 -0.05396643 -0.00046055 -0.00094629 -0.00013804
 G2-17  -269.51023573 -21.72886498 -21.71740092 -0.64998273 -0.02170235 -0.06201628 -0.43859566 -0.06201628 -0.00028807 -0.00099779 -0.00028807
 G2-18  -318.57970727 -23.28633119 -23.29110745 -0.64258079 -0.01748049 -0.08101609 -0.42794843 -0.06071004 -0.00043749 -0.00100459 -0.00016558
 G2-19  -318.82736844 -23.63871147 -23.64271957 -0.67637318 -0.02005034 -0.07450388 -0.46961407 -0.07450388 -0.00035713 -0.00121036 -0.00035713
 G2-20  -373.00734420 -25.68590651 -25.69383685 -0.70215554 -0.01765285 -0.08429216 -0.48459037 -0.08429216 -0.00030015 -0.00095905 -0.00030015
 G2-21  -432.22668936 -27.85978555 -27.86373713 -0.72714545 -0.01556333 -0.09048831 -0.48809467 -0.09048831 -0.00020023 -0.00061141 -0.00020023
 G2-22  -11.31126572 -3.55523542 -3.54886167 -0.13410143 -0.00389626 -0.00059994 -0.13419119 -0.00059994 -0.00001387 -0.00414803 -0.00001387
 G2-23  -95.04123717 -11.91861385 -11.99905832 -0.41703498 -0.03210439 -0.06324751 -0.39387963 -0.06324751 -0.00003284 -0.00012354 -0.00003284
 G2-24  -65.84145898 -10.98799747 -11.04353799 -0.44548167 -0.02056214 -0.06862568 -0.49038256 -0.06862568 -0.00033270 -0.00097882 -0.00033270
 G2-25  -66.30386076 -11.73702124 -11.77107499 -0.49887376 -0.02284210 -0.06339306 -0.50618499 -0.06339306 -0.00034233 -0.00105093 -0.00034233
 G2-26  -66.75236103 -12.48266691 -12.49357614 -0.55212769 -0.02391264 -0.06464844 -0.53105106 -0.06464844 -0.00036590 -0.00104280 -0.00036590
 G2-27  -80.57939747 -11.60758613 -11.72763106 -0.42884107 -0.03639009 -0.08605669 -0.56672031 -0.10131280 -0.00023117 -0.00095408 -0.00035687
 G2-28  -80.84051995 -12.04490397 -12.13394565 -0.46500886 -0.02387555 -0.08118901 -0.53583062 -0.08118901 -0.00024285 -0.00070469 -0.00024285
 G2-29  -99.45342028 -13.30091677 -13.40413879 -0.48504657 -0.02913184 -0.08408929 -0.53442708 -0.08408929 -0.00014880 -0.00041616 -0.00014880
 G2-30  -99.60509091 -13.65762678 -13.76718906 -0.50836129 -0.03391187 -0.08443961 -0.54580901 -0.09069528 -0.00018026 -0.00053389 -0.00018542
 G2-31  -99.83047931 -14.05281332 -14.15165629 -0.54079034 -0.03369503 -0.08485317 -0.57226000 -0.08485317 -0.00019308 -0.00059468 -0.00019308
 G2-32  -100.25119195 -14.81025633 -14.88242555 -0.59619086 -0.03028118 -0.08403394 -0.58671580 -0.08403394 -0.00022489 -0.00066877 -0.00022489
 G2-33  -95.85499226 -13.10452146 -13.21652257 -0.48408165 -0.02320189 -0.09023190 -0.56452139 -0.09023190 -0.00016298 -0.00045517 -0.00016298
 G2-34  -96.59726572 -14.60053280 -14.68251540 -0.59654518 -0.02883576 -0.08798780 -0.60412928 -0.08798780 -0.00025961 -0.00075577 -0.00025961
 G2-35  -114.57110885 -14.69448987 -14.83312564 -0.52801620 -0.03134535 -0.09172380 -0.58657962 -0.10598246 -0.00010678 -0.00036344 -0.00015273
 G2-36  -133.33355771 -16.30723883 -16.47119833 -0.57212875 -0.03053748 -0.09565226 -0.58181038 -0.15120664 -0.00005874 -0.00027330 -0.00020933
 G2-37  -133.75635327 -17.04680545 -17.20275882 -0.63633158 -0.03451947 -0.10543894 -0.67571499 -0.10543894 -0.00013051 -0.00044912 -0.00013051
 G2-38  -178.81133601 -19.90493986 -20.09603805 -0.67600695 -0.03457572 -0.10874371 -0.70031342 -0.10874371 -0.00004026 -0.00020641 -0.00004026
 G2-39  -166.08224257 -21.57537757 -21.76954935 -0.79183387 -0.05959376 -0.15000476 -0.86266076 -0.15000476 -0.00029653 -0.00087699 -0.00029653
 G2-40  -295.71448693 -27.95275814 -28.02060201 -0.84391614 -0.02661912 -0.09132079 -0.53095281 -0.09132079 -0.00010275 -0.00546192 -0.00010275
 G2-41  -537.20485586 -40.50888914 -40.57304859 -1.10026047 -0.03154077 -0.17383208 -0.78424335 -0.11977369 -0.00350577 -0.00749538 -0.00127083
 G2-42  -636.28110463 -45.17049581 -45.23111699 -1.21573036 -0.03327776 -0.17036889 -0.90010782 -0.17036889 -0.00167359 -0.00486294 -0.00167359
 G2-43  -745.05328934 -49.99954830 -50.04994135 -1.30775232 -0.03478086 -0.18111863 -0.88934184 -0.18773149 -0.00088774 -0.00290166 -0.00149741
 G2-44  -863.93474544 -55.01839305 -55.04985812 -1.41430865 -0.03464991 -0.18280966 -0.96054565 -0.18280966 -0.00062012 -0.00185465 -0.00062012
 G2-45  -579.80790296 -41.60252766 -41.63413221 -1.13313606 -0.03475758 -0.13923041 -0.72825013 -0.13923041 -0.00033131 -0.00106175 -0.00033131
 G2-46  -335.30120549 -28.50520806 -28.61886101 -0.85307091 -0.04839263 -0.13405322 -0.73990397 -0.13405322 -0.00043531 -0.00125249 -0.00043531
 G2-47  -405.26086766 -30.05931757 -30.12913095 -0.84931393 -0.03472905 -0.12927488 -0.72479642 -0.12927488 -0.00070396 -0.00200032 -0.00070396
 G2-48  -439.17915279 -33.18537353 -33.29557730 -0.94098006 -0.03827627 -0.14127862 -0.75237910 -0.16720674 -0.00033911 -0.00107329 -0.00051755
 G2-49  -498.60768034 -35.64066929 -35.75198222 -0.99337312 -0.04494436 -0.14577062 -0.79847634 -0.15678918 -0.00028248 -0.00105063 -0.00045616
 G2-50  -521.36422875 -37.49321667 -37.60166722 -1.04686653 -0.04030498 -0.14681764 -0.82269886 -0.14681764 -0.00023794 -0.00076583 -0.00023794
 G2-51  -538.54875066 -42.77901078 -42.76417563 -1.26318871 -0.04239522 -0.12973681 -0.84521820 -0.12973681 -0.00091653 -0.00276696 -0.00091653
 G2-52  -465.35538417 -33.75810203 -33.77390818 -0.98304545 -0.02917065 -0.12357232 -0.73947908 -0.12357232 -0.00047146 -0.00133868 -0.00047146
 G2-53  -406.13296594 -31.59053162 -31.60894332 -0.95911955 -0.03047832 -0.11854426 -0.73630603 -0.11854426 -0.00061271 -0.00176382 -0.00061271
 G2-54  -498.84248491 -36.03654198 -36.13152356 -1.02575598 -0.03594612 -0.14560516 -0.82306732 -0.14560516 -0.00033384 -0.00103890 -0.00033384
 G2-55  -505.81574256 -41.42181739 -41.63394300 -1.25646915 -0.07007543 -0.22036835 -1.16989765 -0.22036835 -0.00060678 -0.00166145 -0.00060678
 G2-56  -289.10064237 -34.16090532 -34.36221076 -1.19454592 -0.07139118 -0.18512560 -1.08247260 -0.18512560 -0.00017998 -0.00047068 -0.00017998
 G2-57  -1316.76192252 -86.53640484 -86.55582784 -2.29030501 -0.06717844 -0.30320954 -1.57167117 -0.30320954 -0.00143742 -0.00367285 -0.00143742
 G2-58  -492.05725572 -48.47511351 -48.69376576 -1.55415673 -0.08400255 -0.22960880 -1.28038086 -0.22960880 -0.00020503 -0.00055263 -0.00020503
 G2-59  -1519.75249583 -100.88710763 -100.89416092 -2.64997346 -0.06640710 -0.33678425 -1.72446777 -0.33678425 -0.00138896 -0.00364803 -0.00138896
 G2-60  -390.32671447 -45.39477145 -45.69780412 -1.59333428 -0.09860545 -0.25618249 -1.46626397 -0.25618249 -0.00028997 -0.00073448 -0.00028997
 G2-61  -1760.55083853 -115.25647292 -115.32974451 -3.05455133 -0.09308892 -0.41877986 -2.15230986 -0.41877986 -0.00235583 -0.00587964 -0.00235583
 G2-62  -471.93516622 -38.35279298 -38.50117836 -1.15628327 -0.05888579 -0.18861723 -1.02446159 -0.18861723 -0.00089432 -0.00261931 -0.00089432
 G2-63  -777.77186610 -55.14221517 -55.24535167 -1.52170653 -0.05582283 -0.22938490 -1.19062299 -0.22938490 -0.00194774 -0.00580170 -0.00194774
 G2-64  -278.19195836 -33.47252150 -33.72838117 -1.19191958 -0.08214485 -0.20243217 -1.16731304 -0.20243217 -0.00027477 -0.00075701 -0.00027477
 G2-65  -626.26748270 -60.80161932 -61.06233788 -1.95713843 -0.09722309 -0.29190819 -1.62019650 -0.29190819 -0.00031458 -0.00079817 -0.00031458
 G2-66  -1996.50463592 -130.63258179 -130.64263760 -3.41801590 -0.08835812 -0.44627020 -2.25292955 -0.44627020 -0.00227176 -0.00571383 -0.00227176
 G2-67  -162.42486364 -21.27336986 -21.51356108 -0.78829820 -0.06257665 -0.16914792 -0.95230351 -0.16914792 -0.00049696 -0.00152996 -0.00049696
 G2-68  -546.57169782 -42.12630096 -42.34402300 -1.24416212 -0.08875744 -0.21675725 -1.18498265 -0.21675725 -0.00091873 -0.00298490 -0.00091873
 G2-69  -316.09119456 -36.49625142 -36.84005249 -1.27967373 -0.10439454 -0.22449330 -1.30429022 -0.22449330 -0.00027783 -0.00078733 -0.00027783
 G2-70  -586.36993450 -52.84869423 -53.08503615 -1.65395643 -0.09109162 -0.25000431 -1.37790415 -0.25000431 -0.00038791 -0.00106653 -0.00038791
 G2-71  -199.96533770 -24.32040323 -24.66716707 -0.87910023 -0.06521116 -0.20369301 -1.20452486 -0.20369301 -0.00044177 -0.00166653 -0.00044177
 G2-72  -245.46676848 -28.02546055 -28.32734037 -0.97381198 -0.07681789 -0.17300718 -1.05127213 -0.17300718 -0.00015638 -0.00054672 -0.00015638
 G2-73  -700.10664692 -57.45042056 -57.79870850 -1.74569757 -0.12596544 -0.29005615 -1.58378794 -0.29005615 -0.00055223 -0.00172720 -0.00055223
 G2-74  -422.97295769 -50.52539340 -50.88501449 -1.79719887 -0.12047422 -0.29093941 -1.70866486 -0.29093941 -0.00051882 -0.00145586 -0.00051882
 G2-75  -1793.20569958 -120.45848418 -120.56182833 -3.26349699 -0.10435862 -0.45467923 -2.37180975 -0.45467923 -0.00279011 -0.00700230 -0.00279011
 G2-76  -381.50038851 -47.04024622 -47.37459022 -1.69604909 -0.11010559 -0.28698213 -1.68465735 -0.28698213 -0.00064721 -0.00168642 -0.00064721
 G2-77  -98.97331683 -16.90183183 -16.96575546 -0.70409037 -0.03371766 -0.10290421 -0.73307231 -0.10290421 -0.00060482 -0.00170431 -0.00060482
 G2-78  -98.97844628 -16.89216849 -16.96481951 -0.70457464 -0.03600134 -0.09964873 -0.72844535 -0.09964873 -0.00068570 -0.00202430 -0.00068570
 G2-79  -98.91301346 -16.91853621 -16.98118094 -0.70954785 -0.03339202 -0.10139397 -0.72823909 -0.10139397 -0.00064049 -0.00174449 -0.00064049
 G2-80  -99.43674482 -17.64372352 -17.68557988 -0.75758941 -0.03572310 -0.09837345 -0.75371376 -0.09837345 -0.00065813 -0.00184993 -0.00065813
 G2-81  -99.38215870 -17.68368670 -17.71592323 -0.76426974 -0.03380588 -0.10045203 -0.74394744 -0.10045203 -0.00066970 -0.00174812 -0.00066970
 G2-82  -99.88354485 -18.38693502 -18.40401502 -0.81065027 -0.03602175 -0.09905330 -0.77990171 -0.09905330 -0.00069584 -0.00184506 -0.00069584
 G2-83  -132.12184542 -22.80753567 -22.88370251 -0.96313476 -0.04898054 -0.13343211 -0.97952552 -0.13343211 -0.00100864 -0.00310941 -0.00100864
 G2-84  -132.10297287 -22.81584171 -22.88803556 -0.96268232 -0.04666172 -0.13736047 -0.97740533 -0.13736047 -0.00090444 -0.00247959 -0.00090444
 G2-85  -132.05816241 -22.83719886 -22.90648957 -0.96918986 -0.04671898 -0.13536176 -0.96903704 -0.13536176 -0.00100405 -0.00268187 -0.00100405
 G2-86  -132.01513264 -22.86346892 -22.92230420 -0.97578066 -0.04483038 -0.13871509 -0.96640638 -0.13871509 -0.00105201 -0.00265294 -0.00105201
 G2-87  -132.06577686 -22.83911835 -22.90322405 -0.97151086 -0.04775385 -0.13562790 -0.97431537 -0.13562790 -0.00105008 -0.00276124 -0.00105008
 G2-88  -132.51464317 -23.58638493 -23.62367938 -1.02455213 -0.04722503 -0.13453598 -0.99719708 -0.13453598 -0.00104876 -0.00266752 -0.00104876
 G2-89  -132.56913253 -23.55080041 -23.59892396 -1.01706975 -0.04821217 -0.13407640 -1.00333664 -0.13407640 -0.00105924 -0.00281669 -0.00105924
 G2-90  -133.01359356 -24.29224611 -24.31530891 -1.06928530 -0.04810757 -0.13357913 -1.02903127 -0.13357913 -0.00105322 -0.00270214 -0.00105322
 G2-91  -133.01631977 -24.28997546 -24.31240672 -1.07017540 -0.04827981 -0.13467988 -1.03121523 -0.13467988 -0.00111504 -0.00282482 -0.00111504
 G2-92  -165.14041217 -28.78397133 -28.84856923 -1.23441660 -0.05710732 -0.17202534 -1.20842226 -0.17202534 -0.00140269 -0.00348094 -0.00140269
 G2-93  -197.46602881 -33.24899366 -33.36058603 -1.39067249 -0.06338410 -0.21377559 -1.39039905 -0.21377559 -0.00231754 -0.00520741 -0.00231754
 G2-94  -211.96880759 -25.97477591 -26.13439230 -0.94151889 -0.05759361 -0.14224564 -0.87896916 -0.14224564 -0.00019225 -0.00054558 -0.00019225
 G2-95  -301.15299059 -35.68040516 -35.91411168 -1.26724273 -0.07999366 -0.20003086 -1.17492092 -0.20003086 -0.00024489 -0.00064457 -0.00024489
 G2-96  -897.08988366 -60.92983530 -60.96256746 -1.67265872 -0.04938238 -0.21951939 -1.20316432 -0.21951939 -0.00095698 -0.00254569 -0.00095698
 G2-97  -1328.82253480 -88.09556586 -88.14800254 -2.36326262 -0.07125603 -0.31825135 -1.67434170 -0.31825135 -0.00158962 -0.00406431 -0.00158962
 G2-98  -81.67647082 -13.55137596 -13.59591197 -0.57471083 -0.02676551 -0.07631298 -0.56608511 -0.07631298 -0.00030658 -0.00088764 -0.00030658
 G2-99  -113.97510717 -17.96218023 -18.05885992 -0.72359276 -0.03722221 -0.11497112 -0.77599440 -0.11497112 -0.00048825 -0.00136079 -0.00048825
G2-100  -214.52922074 -29.16051079 -29.41828258 -1.12331597 -0.07654203 -0.20247302 -1.24049343 -0.20247302 -0.00067184 -0.00192496 -0.00067184
G2-101  -214.57013629 -29.11249808 -29.37562587 -1.12018003 -0.08897215 -0.20581180 -1.24454765 -0.20581180 -0.00071932 -0.00189334 -0.00071932
G2-102  -302.64349738 -27.64624872 -27.64211899 -0.90842616 -0.03277425 -0.09767128 -0.68778085 -0.09767128 -0.00057956 -0.00171989 -0.00057956
G2-103  -166.48989324 -22.30146151 -22.47228248 -0.84614724 -0.05893887 -0.14450619 -0.87943683 -0.14450619 -0.00033877 -0.00094034 -0.00033877
G2-104  -199.61248818 -28.20010940 -28.38050951 -1.10378127 -0.07346152 -0.17781980 -1.13007806 -0.17781980 -0.00063595 -0.00166699 -0.00063595
G2-105  -181.03127178 -26.97080381 -27.11730563 -1.08459977 -0.06665865 -0.16950494 -1.09722910 -0.16950494 -0.00074033 -0.00195372 -0.00074033
G2-106  -114.32081226 -18.73125797 -18.80253502 -0.78494623 -0.03821605 -0.11229309 -0.78646985 -0.11229309 -0.00059117 -0.00158029 -0.00059117
G2-107  -161.18708814 -23.41083330 -23.61244442 -0.89355737 -0.05509600 -0.17272573 -1.05506684 -0.17272573 -0.00078321 -0.00237266 -0.00078321
G2-108  -114.80266150 -19.45062740 -19.50332635 -0.83306844 -0.04060280 -0.11035100 -0.81500505 -0.11035100 -0.00062944 -0.00167795 -0.00062944
G2-109  -114.81209876 -19.45345265 -19.50499864 -0.83327557 -0.03962246 -0.11111399 -0.81540288 -0.11111399 -0.00063406 -0.00168803 -0.00063406
G2-110  -132.52163537 -19.22037224 -19.35719679 -0.74800213 -0.04933003 -0.12533224 -0.79593046 -0.12533224 -0.00048085 -0.00144395 -0.00048085
G2-111  -132.90559735 -19.97877936 -20.08280160 -0.80529321 -0.04438241 -0.12074278 -0.81316481 -0.12074278 -0.00047305 -0.00129581 -0.00047305
G2-112  -132.97197439 -19.96044997 -20.06792102 -0.79970811 -0.04804203 -0.12024415 -0.81718677 -0.12024415 -0.00047101 -0.00130558 -0.00047101
G2-113  -199.18534013 -27.43223172 -27.63663869 -1.04582234 -0.06892039 -0.17480881 -1.11197060 -0.17480881 -0.00055995 -0.00158547 -0.00055995
G2-114  -133.38679216 -20.71534697 -20.79376704 -0.85485592 -0.04286349 -0.11853420 -0.83497426 -0.11853420 -0.00051246 -0.00138317 -0.00051246
G2-115  -133.37979586 -20.70363065 -20.78574451 -0.85380478 -0.04583904 -0.11736420 -0.83586193 -0.11736420 -0.00051246 -0.00138652 -0.00051246
G2-116  -438.78343092 -36.78231503 -36.82810088 -1.17053570 -0.04165442 -0.15769255 -0.96279901 -0.15769255 -0.00106168 -0.00286107 -0.00106168
G2-117  -505.85676379 -45.72880302 -45.84830003 -1.52224444 -0.07876030 -0.22023678 -1.33144821 -0.22023678 -0.00126585 -0.00333618 -0.00126585
G2-118  -439.26537040 -37.49367211 -37.51894510 -1.21761155 -0.04284802 -0.15349895 -0.98668927 -0.15349895 -0.00098356 -0.00265585 -0.00098356
G2-119  -439.26248921 -37.49332810 -37.52203366 -1.21702769 -0.04366434 -0.15430279 -0.98985203 -0.15430279 -0.00101759 -0.00273833 -0.00101759
G2-120  -155.47645905 -21.43400358 -21.55047446 -0.82330712 -0.04885315 -0.12067563 -0.80722973 -0.12067563 -0.00038753 -0.00115170 -0.00038753
G2-121  -498.49121174 -39.66055866 -39.68372402 -1.24149776 -0.04200237 -0.15855286 -0.98917832 -0.15855286 -0.00081943 -0.00218820 -0.00081943
G2-122  -498.03730488 -38.91720957 -38.96809117 -1.18908956 -0.04325298 -0.15952038 -0.96777636 -0.15952038 -0.00080386 -0.00223171 -0.00080386
G2-123  -146.65605002 -23.12112480 -23.25363434 -0.92841792 -0.05086544 -0.14989411 -1.00546636 -0.14989411 -0.00081337 -0.00237489 -0.00081337
G2-124  -166.10684531 -25.87244510 -25.98534576 -1.05908914 -0.06006759 -0.15518607 -1.06314386 -0.15518607 -0.00080927 -0.00212338 -0.00080927
G2-125  -199.62304136 -28.21799997 -28.39227075 -1.10538644 -0.06997003 -0.17816356 -1.12132401 -0.17816356 -0.00062402 -0.00164421 -0.00062402
G2-126  -222.15947668 -29.67228546 -29.85918993 -1.12547078 -0.07313669 -0.18000131 -1.11850754 -0.18000131 -0.00050825 -0.00135799 -0.00050825
G2-127  -564.72753514 -47.13031502 -47.26249628 -1.48976124 -0.07300505 -0.22117375 -1.28998948 -0.22117375 -0.00101817 -0.00273017 -0.00101817
G2-128  -531.62109627 -45.56615822 -45.59530792 -1.50004896 -0.05401384 -0.19313352 -1.23851392 -0.19313352 -0.00117657 -0.00304308 -0.00117657
G2-129  -166.52357335 -26.61813036 -26.70244908 -1.11436032 -0.05565224 -0.15424193 -1.08601938 -0.15424193 -0.00089840 -0.00229777 -0.00089840
G2-130  -166.51448051 -26.60960795 -26.69777985 -1.11250469 -0.05825395 -0.15202625 -1.08445821 -0.15202625 -0.00083367 -0.00216862 -0.00083367
G2-131  -147.93313221 -25.34707984 -25.40748206 -1.09265901 -0.05493780 -0.14627198 -1.06781112 -0.14627198 -0.00106134 -0.00269004 -0.00106134
G2-132  -198.27664390 -30.36845068 -30.52440916 -1.22688525 -0.06377280 -0.19800431 -1.24980043 -0.19800431 -0.00137465 -0.00324992 -0.00137465
G2-133  -504.14414390 -47.17003174 -47.27219465 -1.59177361 -0.06365239 -0.23888423 -1.40743586 -0.23888423 -0.00227486 -0.00537399 -0.00227486
G2-134  -179.69116061 -29.13684167 -29.25860087 -1.20763391 -0.05666084 -0.19035231 -1.21928738 -0.19035231 -0.00155946 -0.00364146 -0.00155946
G2-135  -212.40597968 -34.30278919 -34.45246933 -1.41137187 -0.06841999 -0.22613734 -1.43211364 -0.22613734 -0.00216383 -0.00487928 -0.00216383
G2-136  -0.47567805 -0.65590481 -0.65574335 -0.03817153 -0.00168156 0.00000000 -0.04612003 0.00000000 0.00000000 -0.00004007 0.00000000
G2-137  -372.75006525 -25.33512877 -25.34011196 -0.66729021 -0.01564056 -0.08861781 -0.43847542 -0.06681270 -0.00030429 -0.00072886 -0.00014841
G2-138  -65.53907244 -10.60764532 -10.66787203 -0.40472403 -0.02088893 -0.07344338 -0.45081168 -0.05743698 -0.00032049 -0.00088996 -0.00026456
G2-139  -66.03834325 -11.35209041 -11.39349123 -0.46283341 -0.02465396 -0.06908893 -0.46664085 -0.05366564 -0.00036609 -0.00099298 -0.00029157
G2-140  -132.74584139 -19.56590270 -19.68507883 -0.76674643 -0.04893377 -0.12154728 -0.79041090 -0.12305448 -0.00047772 -0.00123586 -0.00043022
G2-141  -100.00135536 -14.43072109 -14.51073253 -0.56287033 -0.03279850 -0.08799939 -0.54930912 -0.07776072 -0.00022670 -0.00059088 -0.00018918
G2-142  -100.01993037 -14.40557635 -14.48329038 -0.56035817 -0.04245499 -0.08336276 -0.53742829 -0.07317308 -0.00018838 -0.00062922 -0.00023776
G2-143  -133.15813906 -20.30501156 -20.39289265 -0.81905838 -0.05963652 -0.11797689 -0.78941560 -0.10996397 -0.00046671 -0.00135965 -0.00054889
G2-144  -405.88452165 -31.23228412 -31.25269030 -0.92569036 -0.03186364 -0.12270098 -0.69426502 -0.10524443 -0.00061147 -0.00155583 -0.00048401
G2-145  -66.49234704 -12.10967111 -12.12414271 -0.51697142 -0.02464793 -0.07105603 -0.48615695 -0.05039053 -0.00038472 -0.00093297 -0.00028025
G2-146  -99.62706988 -18.01247925 -18.03668147 -0.77642901 -0.03816037 -0.10540183 -0.73648338 -0.08645928 -0.00072376 -0.00172509 -0.00058505
G2-147  -132.76240831 -23.91478797 -23.94762952 -1.03623716 -0.05152568 -0.14101616 -0.98835595 -0.12287443 -0.00115115 -0.00268114 -0.00096428
G2-148  -181.19775782 -22.85394873 -23.12309566 -0.83261176 -0.06547014 -0.16396172 -0.98506209 -0.19755850 -0.00030543 -0.00117940 -0.00049558
G2-149  -132.10911827 -22.79958854 -22.87991988 -0.96284804 -0.04852180 -0.13455925 -0.97731817 -0.13455925 -0.00103030 -0.00287481 -0.00103030
G2-150  -165.25094480 -28.71639783 -28.79771068 -1.22344939 -0.06141569 -0.16965310 -1.23028618 -0.16965310 -0.00149408 -0.00421302 -0.00149408
G2-151  -165.65329887 -29.51457715 -29.55134567 -1.28673253 -0.05904859 -0.17052783 -1.24351439 -0.17052783 -0.00149933 -0.00367896 -0.00149933
G2-152  -166.14379975 -30.19730334 -30.22641473 -1.32788654 -0.06019388 -0.16811287 -1.27826645 -0.16811287 -0.00142537 -0.00358895 -0.00142537
G2-153  -166.14846822 -30.19297201 -30.21977805 -1.33070349 -0.06058757 -0.17144011 -1.28543303 -0.17144011 -0.00162022 -0.00397840 -0.00162022
G2-154  -197.88985780 -33.94858084 -34.04253054 -1.44134250 -0.07146914 -0.20719185 -1.44120455 -0.20719185 -0.00201767 -0.00500709 -0.00201767
G2-155  -197.88731626 -33.95396780 -34.04440507 -1.44135959 -0.07136297 -0.20468321 -1.43685285 -0.20468321 -0.00192519 -0.00489686 -0.00192519
G2-156  -198.78137717 -35.43059702 -35.46948184 -1.54802702 -0.07199006 -0.20566789 -1.49269218 -0.20566789 -0.00197645 -0.00480618 -0.00197645
G2-157  -199.27390363 -36.10246961 -36.13760668 -1.58650420 -0.07227473 -0.20266077 -1.52751665 -0.20266077 -0.00180382 -0.00448822 -0.00180382
G2-158  -199.27080453 -36.10157288 -36.13570162 -1.58881774 -0.07282721 -0.20488757 -1.53245605 -0.20488757 -0.00196054 -0.00479745 -0.00196054
G2-159  -230.59756865 -39.15429765 -39.27332394 -1.64987350 -0.07611928 -0.24975214 -1.64203206 -0.24975214 -0.00278270 -0.00629567 -0.00278270
G2-160  -232.40404611 -42.00759998 -42.04876160 -1.84511192 -0.08435469 -0.23720799 -1.77677679 -0.23720799 -0.00218485 -0.00539266 -0.00218485
G2-161  -263.25469149 -44.27631816 -44.43703512 -1.85381286 -0.09777858 -0.27961384 -1.89407958 -0.27961384 -0.00315102 -0.00788362 -0.00315102
G2-162  -265.53416117 -47.91275671 -47.95994018 -2.10372771 -0.09643706 -0.27175941 -2.02604341 -0.27175941 -0.00256724 -0.00629981 -0.00256724
G2-163  -328.62164608 -54.74526200 -54.93934162 -2.28279138 -0.10774796 -0.36477407 -2.29288329 -0.36477407 -0.00493599 -0.01093830 -0.00493599
G2-164  -328.59972179 -54.69474460 -54.91510010 -2.28032332 -0.11291290 -0.37319535 -2.32794798 -0.37319535 -0.00587729 -0.01359323 -0.00587729
G2-165  -232.74476829 -34.11661558 -34.30014956 -1.36317379 -0.08448080 -0.21164043 -1.37232616 -0.21164043 -0.00095676 -0.00244064 -0.00095676
G2-166  -199.65785935 -32.52205702 -32.61079164 -1.37461761 -0.06782562 -0.19057823 -1.33911604 -0.19057823 -0.00135553 -0.00335523 -0.00135553
G2-167  -245.51962138 -40.23295283 -40.38850027 -1.67400454 -0.08253486 -0.26281226 -1.67862896 -0.26281226 -0.00273683 -0.00625625 -0.00273683
G2-168  -264.10091237 -41.48508349 -41.66882119 -1.69506233 -0.08673223 -0.27049770 -1.69972379 -0.27049770 -0.00256534 -0.00581330 -0.00256534
G2-169  -198.74995446 -31.03242320 -31.18333610 -1.26624203 -0.07412273 -0.18852963 -1.28816782 -0.18852963 -0.00109795 -0.00305560 -0.00109795
G2-170  -199.15644240 -31.83591634 -31.93740609 -1.32967622 -0.06884590 -0.18882953 -1.29787935 -0.18882953 -0.00124708 -0.00308621 -0.00124708
G2-171  -231.87624686 -37.00395428 -37.13680130 -1.53506228 -0.08350433 -0.22681088 -1.52617993 -0.22681088 -0.00159669 -0.00391720 -0.00159669
G2-172  -330.33735299 -48.91722512 -49.21175595 -1.93690766 -0.12362446 -0.32088916 -2.03045677 -0.32088916 -0.00247773 -0.00697562 -0.00247773
G2-173  -227.34848034 -35.35889299 -35.54422323 -1.43202902 -0.07389956 -0.23788259 -1.47109605 -0.23788259 -0.00199045 -0.00449947 -0.00199045
G2-174  -572.42290241 -54.04969554 -54.23023587 -1.83166615 -0.10063110 -0.28103826 -1.64315145 -0.28103826 -0.00136231 -0.00348436 -0.00136231
G2-175  -629.19886253 -60.42800267 -60.55600122 -2.08128720 -0.08351437 -0.31112408 -1.85603129 -0.31112408 -0.00295817 -0.00674546 -0.00295817
G2-176  -227.45622642 -35.24764779 -35.44434922 -1.41077759 -0.07472628 -0.23412518 -1.52218088 -0.23412518 -0.00127372 -0.00329686 -0.00127372
G2-177  -227.34699496 -35.35106572 -35.54021968 -1.43176670 -0.07197951 -0.23867437 -1.47546974 -0.23867437 -0.00203381 -0.00461457 -0.00203381
G2-178  -198.32439178 -30.28128791 -30.45552460 -1.20988285 -0.07385209 -0.19613837 -1.27973623 -0.19613837 -0.00111871 -0.00304905 -0.00111871
G2-179  -198.78720630 -31.03267887 -31.18224634 -1.26409206 -0.07506353 -0.19058576 -1.29184688 -0.19058576 -0.00115030 -0.00326167 -0.00115030
G2-180  -332.10475527 -47.51003803 -47.79848141 -1.87018092 -0.12327723 -0.30536247 -1.91001497 -0.30536247 -0.00143425 -0.00358262 -0.00143425
G2-181  -504.59238361 -47.88187784 -47.95644366 -1.64044852 -0.06726486 -0.22747233 -1.43042144 -0.22747233 -0.00195301 -0.00495504 -0.00195301
G2-182  -180.23718640 -29.77160515 -29.88027811 -1.24057102 -0.06155849 -0.18448904 -1.27608183 -0.18448904 -0.00120874 -0.00308265 -0.00120874
G2-183  -199.23395744 -31.78090167 -31.89917592 -1.31828642 -0.07240439 -0.18995337 -1.31249310 -0.18995337 -0.00118772 -0.00301762 -0.00118772
G2-184  -199.23173444 -31.77118908 -31.89057805 -1.31736436 -0.07230760 -0.19036776 -1.31779502 -0.19036776 -0.00122092 -0.00308289 -0.00122092
G2-185  -265.79166200 -40.05951796 -40.23131245 -1.63367373 -0.09345899 -0.24284778 -1.60571327 -0.24284778 -0.00147074 -0.00361198 -0.00147074
G2-186  -505.03973648 -48.62130341 -48.67001633 -1.69376268 -0.06735349 -0.22754612 -1.45678537 -0.22754612 -0.00196127 -0.00487902 -0.00196127
G2-187  -564.76046612 -51.46556048 -51.49977544 -1.76123998 -0.06732997 -0.23135805 -1.49586759 -0.23135805 -0.00177910 -0.00442279 -0.00177910
G2-188  -564.75109627 -51.47141522 -51.50665615 -1.75861452 -0.06612062 -0.22767597 -1.48785461 -0.22767597 -0.00155050 -0.00393359 -0.00155050
G2-189  -180.57888771 -30.57841916 -30.65057951 -1.30901825 -0.06405228 -0.18193305 -1.27839393 -0.18193305 -0.00141386 -0.00347856 -0.00141386
G2-190  -313.92229842 -46.87988059 -47.15420167 -1.90126266 -0.11397507 -0.30879128 -1.99239996 -0.30879128 -0.00195233 -0.00489279 -0.00195233
G2-191  -199.64883257 -32.51583790 -32.60996076 -1.37119114 -0.07058197 -0.18669097 -1.33311369 -0.18669097 -0.00117553 -0.00299167 -0.00117553
G2-192  -266.27554257 -40.74726431 -40.91015690 -1.67575754 -0.09296797 -0.24224202 -1.64306649 -0.24224202 -0.00145062 -0.00358154 -0.00145062
G2-193  -505.53277077 -49.29672843 -49.33322132 -1.73768290 -0.06809495 -0.22704584 -1.49537690 -0.22704584 -0.00202495 -0.00504775 -0.00202495
G2-194  -878.04102238 -74.31445463 -74.38099002 -2.39979060 -0.09165932 -0.31769419 -1.95730871 -0.31769419 -0.00280989 -0.00713149 -0.00280989
G2-195  -181.07940015 -31.26106929 -31.32177568 -1.35332860 -0.06394164 -0.18328813 -1.32019431 -0.18328813 -0.00152414 -0.00375232 -0.00152414
G2-196  -402.04573050 -45.39534061 -45.41138935 -1.68543261 -0.06590205 -0.20715260 -1.44077368 -0.20715260 -0.00176731 -0.00447142 -0.00176731
G2-197  -537.27585089 -53.07645604 -53.18586112 -1.85045308 -0.07648280 -0.27428301 -1.65816068 -0.27428301 -0.00273296 -0.00646597 -0.00273296
G2-198  -212.81858608 -35.03741942 -35.16761876 -1.46590361 -0.06963582 -0.22532056 -1.47122430 -0.22532056 -0.00199206 -0.00466257 -0.00199206
G2-199  -232.28699070 -37.74578932 -37.85104389 -1.59094434 -0.08268354 -0.22436949 -1.54899822 -0.22436949 -0.00172137 -0.00420350 -0.00172137
G2-200  -232.36106948 -37.68926245 -37.81289910 -1.57745363 -0.08468313 -0.22472305 -1.56192992 -0.22472305 -0.00158115 -0.00394124 -0.00158115
G2-201  -299.01181032 -45.92823271 -46.12324564 -1.88173843 -0.10951426 -0.28240099 -1.87326110 -0.28240099 -0.00177242 -0.00435558 -0.00177242
G2-202  -538.16552770 -54.53266018 -54.58525707 -1.95464097 -0.08069947 -0.26271902 -1.70669919 -0.26271902 -0.00245898 -0.00603825 -0.00245898
G2-203  -213.70641234 -36.49202622 -36.56749573 -1.57027599 -0.07713764 -0.21741144 -1.52874198 -0.21741144 -0.00189445 -0.00460791 -0.00189445
G2-204  -232.77433638 -38.42069554 -38.51828645 -1.63357756 -0.08290538 -0.22494831 -1.59131229 -0.22494831 -0.00178743 -0.00435696 -0.00178743
G2-205  -375.80823894 -52.64571631 -52.92020990 -2.04015290 -0.11396950 -0.32753654 -1.99128248 -0.32753654 -0.00241775 -0.00546154 -0.00241775
G2-206  -375.80701842 -52.64564172 -52.92054922 -2.04009070 -0.11342543 -0.32744874 -1.99206370 -0.32744874 -0.00242037 -0.00545734 -0.00242037
G2-207  -286.63769278 -42.94719926 -43.14044032 -1.71542240 -0.08872606 -0.27074636 -1.69120124 -0.27074636 -0.00237045 -0.00533733 -0.00237045
G2-208  -265.91390528 -44.32448009 -44.42930480 -1.89095204 -0.09557382 -0.25887932 -1.83785381 -0.25887932 -0.00213874 -0.00519383 -0.00213874
G2-209  -765.06735745 -73.12821367 -73.46966056 -2.36445955 -0.12604425 -0.36392282 -1.99779323 -0.36392282 -0.00047545 -0.00117784 -0.00047545
G2-210  -908.70456012 -85.45651844 -85.91313277 -2.77010315 -0.15605441 -0.44247820 -2.40975516 -0.44247820 -0.00069630 -0.00172063 -0.00069630
G2-211  -1272.48081730 -90.48363321 -90.57599397 -2.46409838 -0.06969496 -0.35219964 -1.75364098 -0.35219964 -0.00525957 -0.01370459 -0.00525957
G2-212  -572.37284916 -49.70193586 -49.98571969 -1.56269879 -0.09967742 -0.27920948 -1.47889086 -0.27920948 -0.00071353 -0.00198348 -0.00071353
G2-213  -1236.45927028 -80.03234363 -80.09151589 -2.07994544 -0.06239262 -0.27702567 -1.42546384 -0.27702567 -0.00144148 -0.00400617 -0.00144148
G2-214  -1680.64626573 -113.54382882 -113.66171695 -3.05592798 -0.10908196 -0.42963288 -2.18283615 -0.42963288 -0.00213349 -0.00547888 -0.00213349
G2-215  -2477.89870531 -160.34580623 -160.41383357 -4.18681808 -0.12278448 -0.56819548 -2.84144720 -0.56819548 -0.00379135 -0.00946540 -0.00379135
G2-216  -1369.64668946 -96.54828037 -96.77665051 -2.69285908 -0.12170406 -0.41191720 -2.10876829 -0.41191720 -0.00184838 -0.00495665 -0.00184838
G2-217  -1614.06389251 -105.22083649 -105.27861819 -2.74759542 -0.08364066 -0.36681306 -1.85986805 -0.36681306 -0.00217996 -0.00578399 -0.00217996
G2-218  -1608.98881188 -105.02573758 -105.13023714 -2.74576014 -0.09721256 -0.37965483 -1.91703913 -0.37965483 -0.00276943 -0.00753919 -0.00276943
G2-219  -1132.59482032 -75.39436251 -75.43142408 -1.98107956 -0.05903805 -0.25611613 -1.32485522 -0.25611613 -0.00135053 -0.00372545 -0.00135053
G2-220  -732.88618438 -62.85122581 -63.10149982 -1.95817229 -0.10043393 -0.29619826 -1.63780455 -0.29619826 -0.00064380 -0.00167716 -0.00064380
G2-221  -601.81147718 -70.68595479 -71.15324253 -2.50099024 -0.15986336 -0.40434215 -2.31763384 -0.40434215 -0.00069957 -0.00169677 -0.00069957
G2-222  -300.90059827 -35.28544480 -35.53328172 -1.23174659 -0.08551994 -0.20046519 -1.14217242 -0.20010607 -0.00023855 -0.00058565 -0.00020987
G2-223  -197.19972791 -32.85952019 -32.98239950 -1.35438337 -0.06816991 -0.22027899 -1.35653702 -0.20617144 -0.00234735 -0.00524363 -0.00232230
# Non Hydrogon Local Minimums : 31
# Non Hydrogon Transition States : 15
# Hydrogon Local Minimums : 21
# Hydrogon Transition States : 19
NHL1  -0.19192309 -0.30717179 -0.30579839 0.00000000 -0.00080331 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
NHL2  -95.85288383 -13.10701398 -13.21850133 -0.48416807 -0.02314688 -0.09000631 -0.56343947 -0.09000631 -0.00016218 -0.00045265 -0.00016218
NHL3  -95.98571612 -13.44867927 -13.56460353 -0.50769351 -0.03099189 -0.08850745 -0.56307116 -0.09090601 -0.00020350 -0.00061405 -0.00022024
NHL4  -99.45205382 -13.30250193 -13.40540939 -0.48510627 -0.02904784 -0.08396630 -0.53384615 -0.08396630 -0.00014836 -0.00041486 -0.00014836
NHL5  -99.60162883 -13.66141953 -13.77042298 -0.50846653 -0.03385027 -0.08442389 -0.54530305 -0.09058588 -0.00017965 -0.00053058 -0.00018430
NHL6  -66.29997565 -11.74105327 -11.77473673 -0.49902091 -0.02279300 -0.06341805 -0.50622653 -0.06341805 -0.00034130 -0.00104928 -0.00034130
NHL7  -66.48350169 -12.11905587 -12.13246502 -0.51729296 -0.02446898 -0.07098705 -0.48528860 -0.05028292 -0.00038179 -0.00092275 -0.00027752
NHL8  -33.35424353 -6.21226744 -6.21485769 -0.25776414 -0.01012943 -0.03795415 -0.23572698 -0.01422867 -0.00013264 -0.00030025 -0.00005271
NHL9  -99.60941450 -18.02763361 -18.04759075 -0.77572083 -0.03716508 -0.10617850 -0.73470747 -0.08405685 -0.00072964 -0.00171290 -0.00057242
NHL10 -80.84180656 -12.04339901 -12.13274010 -0.46495200 -0.02391435 -0.08132469 -0.53650347 -0.08132469 -0.00024367 -0.00070744 -0.00024367
NHL11 -80.82436370 -12.04522944 -12.12645462 -0.46489337 -0.02480239 -0.07601900 -0.51344976 -0.07601900 -0.00023633 -0.00067191 -0.00023633
NHL12 -89.22520175 -10.20416749 -10.29998102 -0.35930227 -0.02958718 -0.06457108 -0.36144154 -0.06457108 -0.00000884 -0.00004741 -0.00000884
NHL13 -122.78317184 -16.28134761 -16.36286593 -0.61733477 -0.03341179 -0.08527062 -0.58039734 -0.08527062 -0.00014741 -0.00045810 -0.00014741
NHL14 -212.02750769 -26.47905400 -26.66126282 -0.98182366 -0.08867736 -0.15410875 -0.95492184 -0.15410875 -0.00025859 -0.00076068 -0.00025859
NHL15 -431.84943794 -27.70184172 -27.71086889 -0.72398791 -0.01910667 -0.09462989 -0.48811200 -0.09462989 -0.00026036 -0.00087408 -0.00026036
NHL16 -465.34427256 -33.76972825 -33.78400764 -0.98369928 -0.02892209 -0.12355856 -0.73819007 -0.12355856 -0.00046790 -0.00132138 -0.00046790
NHL17 -897.20302974 -61.47164308 -61.49657589 -1.71170537 -0.05899618 -0.22115901 -1.23294347 -0.22115901 -0.00100866 -0.00282695 -0.00100866
NHL18 -554.60118807 -43.95392693 -44.07526609 -1.34787693 -0.10471536 -0.19452589 -1.11956404 -0.19452589 -0.00066438 -0.00192587 -0.00066438
NHL19 -554.63521583 -43.99020863 -44.07943025 -1.34550364 -0.05590006 -0.18198353 -1.07362093 -0.18198353 -0.00059193 -0.00171645 -0.00059193
NHL20 -66.69586165 -8.69621830 -8.78871870 -0.33546665 -0.02632558 -0.06481008 -0.37941304 -0.06481008 -0.00004881 -0.00022896 -0.00004881
NHL21 -100.24104777 -14.82122146 -14.89201749 -0.59658036 -0.03005914 -0.08387041 -0.58543556 -0.08387041 -0.00022237 -0.00065925 -0.00022237
NHL22 -189.49457340 -25.03231470 -25.20261893 -0.96568328 -0.06813462 -0.15382744 -0.95652529 -0.15382744 -0.00036859 -0.00104678 -0.00036859
NHL23 -189.49604766 -24.97530962 -25.15111354 -0.95782360 -0.07677787 -0.15367797 -0.97037279 -0.15367797 -0.00034677 -0.00103548 -0.00034677
NHL24 -162.41732480 -21.28262467 -21.52040037 -0.78859391 -0.06245081 -0.16796512 -0.94694928 -0.16796512 -0.00048712 -0.00149708 -0.00048712
NHL25 -66.87379455 -8.53268978 -8.57863231 -0.30023309 -0.01387258 -0.05229795 -0.27006394 -0.02551943 -0.00002799 -0.00009057 -0.00001758
NHL26 -178.81521071 -19.90017940 -20.09275697 -0.67576777 -0.03471836 -0.10894789 -0.70341639 -0.10894789 -0.00004047 -0.00021077 -0.00004047
NHL27 -89.66044707 -10.38272852 -10.45303120 -0.36195457 -0.01773703 -0.05574115 -0.33566544 -0.05574115 -0.00001624 -0.00006127 -0.00001624
NHL28 -521.35803123 -37.50036990 -37.60701605 -1.04726391 -0.04008648 -0.14661114 -0.81999230 -0.14661114 -0.00023613 -0.00075403 -0.00023613
NHL29 -432.22350383 -27.86319732 -27.86668366 -0.72727248 -0.01549110 -0.09046440 -0.48770301 -0.09046440 -0.00019914 -0.00060695 -0.00019914
NHL30 -89.39629817 -9.99483425 -10.03610903 -0.32115955 -0.01335083 -0.05094074 -0.25296959 -0.02553862 -0.00000628 -0.00001992 -0.00000412
NHL31 -431.95795698 -27.50668577 -27.50412430 -0.69138391 -0.01390051 -0.09256515 -0.43922448 -0.07027160 -0.00017381 -0.00041181 -0.00009403
NHT1  -96.02102142 -13.38870280 -13.52150012 -0.50207523 -0.03051846 -0.09684515 -0.58165561 -0.09114953 -0.00026393 -0.00072286 -0.00020150
NHT2  -99.64072376 -13.58854991 -13.70474847 -0.49788112 -0.03740179 -0.08705203 -0.54817121 -0.08631224 -0.00020404 -0.00061310 -0.00017346
NHT3  -66.49415069 -12.02824789 -12.06799693 -0.51030851 -0.03001153 -0.06802686 -0.51448633 -0.06243486 -0.00043951 -0.00135911 -0.00038524
NHT4  -99.63805192 -17.93257747 -17.98615994 -0.76884145 -0.04565286 -0.11045054 -0.76861608 -0.08694779 -0.00080224 -0.00230568 -0.00066060
NHT5  -80.82352622 -11.98262505 -12.07729031 -0.46370933 -0.02607517 -0.08172851 -0.53447906 -0.08172851 -0.00027832 -0.00076326 -0.00027832
NHT6  -212.03650061 -26.42833360 -26.64060944 -0.98324796 -0.09571570 -0.16280302 -0.99799449 -0.16280302 -0.00029968 -0.00102363 -0.00029968
NHT7  -897.21975328 -61.41806301 -61.47083381 -1.71165804 -0.07199447 -0.22764403 -1.26518709 -0.22764403 -0.00119980 -0.00390333 -0.00119980
NHT8  -554.62296261 -43.92054773 -44.05660684 -1.34752823 -0.09771384 -0.19726685 -1.13909811 -0.19726685 -0.00072223 -0.00235572 -0.00072223
NHT9  -189.49810964 -24.93167395 -25.14095258 -0.96020538 -0.09055009 -0.16382240 -1.01621588 -0.16382240 -0.00043538 -0.00146762 -0.00043538
NHT10 -162.61239976 -21.53098993 -21.79255226 -0.80493381 -0.06250137 -0.18335140 -0.96150318 -0.15897806 -0.00083246 -0.00188339 -0.00044285
NHT11 -122.99795963 -16.48134396 -16.60721111 -0.62994848 -0.03763909 -0.10778118 -0.62250058 -0.08312597 -0.00035620 -0.00089654 -0.00014394
NHT12 -179.01733835 -20.16472989 -20.39369991 -0.68851844 -0.04853336 -0.12554016 -0.72337172 -0.11155373 -0.00009999 -0.00052596 -0.00004950
NHT13 -554.73512407 -43.64630466 -43.80065610 -1.31414792 -0.05547362 -0.20499539 -1.09529305 -0.16525408 -0.00074025 -0.00208672 -0.00040205
NHT14 -432.39876262 -28.12918789 -28.15573739 -0.74470122 -0.02109642 -0.09951557 -0.51647364 -0.09277200 -0.00040203 -0.00113306 -0.00025128
NHT15 -89.85904335 -10.58571019 -10.69577560 -0.37659535 -0.02006757 -0.06903732 -0.36378869 -0.05743716 -0.00013301 -0.00029941 -0.00002065
HL1   -0.19192309 -0.30717179 -0.30579839 0.00000000 -0.00080331 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
HL2   -432.22350383 -27.86319732 -27.86668366 -0.72727248 -0.01549110 -0.09046440 -0.48770301 -0.09046440 -0.00019914 -0.00060695 -0.00019914
HL3   -0.47536617 -0.65622954 -0.65604199 -0.03817939 -0.00167920 0.00000000 -0.04609824 0.00000000 0.00000000 -0.00003996 0.00000000
HL4   -431.95795698 -27.50668577 -27.50412430 -0.69138391 -0.01390051 -0.09256515 -0.43922448 -0.07027160 -0.00017381 -0.00041181 -0.00009403
HL5   -66.87379455 -8.53268978 -8.57863231 -0.30023309 -0.01387258 -0.05229795 -0.27006394 -0.02551943 -0.00002799 -0.00009057 -0.00001758
HL6   -67.12600895 -8.91852767 -8.97983014 -0.34012730 -0.01620856 -0.05290105 -0.33961010 -0.05290105 -0.00004452 -0.00016268 -0.00004452
HL7   -33.35424353 -6.21226744 -6.21485769 -0.25776414 -0.01012943 -0.03795415 -0.23572698 -0.01422867 -0.00013264 -0.00030025 -0.00005271
HL8   -33.61870355 -6.58248377 -6.58615747 -0.29479833 -0.01202380 -0.03148071 -0.28369933 -0.03148071 -0.00012388 -0.00041068 -0.00012388
HL9   -48.55123252 -7.65536011 -7.69082180 -0.31781182 -0.01393559 -0.04403955 -0.31851153 -0.04403955 -0.00008589 -0.00029850 -0.00008589
HL10  -48.30343213 -7.27088206 -7.30102947 -0.27882484 -0.01244762 -0.04736978 -0.26323552 -0.02119435 -0.00007169 -0.00021158 -0.00003836
HL11  -66.74059873 -12.49489007 -12.50456937 -0.55268420 -0.02376737 -0.06461204 -0.53005121 -0.06461204 -0.00036285 -0.00103188 -0.00036285
HL12  -66.48360451 -12.11893090 -12.13237114 -0.51729980 -0.02448095 -0.07099044 -0.48531121 -0.05029488 -0.00038186 -0.00092313 -0.00027761
HL13  -89.39629817 -9.99483425 -10.03610903 -0.32115955 -0.01335083 -0.05094074 -0.25296959 -0.02553862 -0.00000628 -0.00001992 -0.00000412
HL14  -89.66044707 -10.38272852 -10.45303120 -0.36195457 -0.01773703 -0.05574115 -0.33566544 -0.05574115 -0.00001624 -0.00006127 -0.00001624
HL15  -66.62028980 -8.18025306 -8.20286570 -0.25742675 -0.01004840 -0.04948067 -0.19705091 -0.00818377 -0.00001367 -0.00003519 -0.00000422
HL16  -318.81979011 -23.64686045 -23.64971329 -0.67670038 -0.01990441 -0.07444615 -0.46870609 -0.07444615 -0.00035318 -0.00119192 -0.00035318
HL17  -318.57428467 -23.29212558 -23.29612680 -0.64282156 -0.01737869 -0.08099730 -0.42737878 -0.06068379 -0.00043423 -0.00099217 -0.00016392
HL18  -373.00149085 -25.69216072 -25.69926325 -0.70240548 -0.01753882 -0.08425679 -0.48391203 -0.08425679 -0.00029758 -0.00094809 -0.00029758
HL19  -372.74694942 -25.33846279 -25.34300067 -0.66742389 -0.01557715 -0.08860422 -0.43811613 -0.06679816 -0.00030280 -0.00072331 -0.00014751
HL20  -48.05679534 -6.91328798 -6.93287033 -0.23688228 -0.01026400 -0.04878559 -0.20240056 -0.00673791 -0.00005329 -0.00013155 -0.00001071
HL21  -165.23809271 -28.72822404 -28.81076762 -1.22304549 -0.06177933 -0.16908328 -1.22774225 -0.16908328 -0.00140119 -0.00405048 -0.00140119
HT1   -432.39536990 -28.16209358 -28.18034742 -0.74339580 -0.02119225 -0.09739322 -0.50641384 -0.08467638 -0.00025218 -0.00083786 -0.00023432
HT2   -67.34197008 -9.14742867 -9.23278224 -0.35256073 -0.02725780 -0.05820608 -0.36344819 -0.05051034 -0.00007250 -0.00034656 -0.00007453
HT3   -33.81506600 -6.84168210 -6.86173371 -0.30823664 -0.01734044 -0.04072089 -0.30399253 -0.02560531 -0.00019645 -0.00065002 -0.00012634
HT4   -100.48420232 -15.06688530 -15.16245894 -0.60946353 -0.03741374 -0.09328845 -0.61203019 -0.08377529 -0.00026106 -0.00088338 -0.00026644
HT5   -0.66376959 -0.93476810 -0.94614122 -0.05272297 -0.00505596 -0.00366054 -0.06029698 0.00000000 -0.00001522 -0.00016355 0.00000000
HT6   -115.42741930 -16.12265913 -16.26609207 -0.63324319 -0.04269871 -0.10440226 -0.66473430 -0.10917433 -0.00020590 -0.00084985 -0.00032788
HT7   -465.57491567 -34.04939919 -34.07700829 -0.99755768 -0.03391987 -0.13442149 -0.75173402 -0.11469343 -0.00050914 -0.00155687 -0.00046434
HT8   -133.61272435 -20.97353842 -21.07930363 -0.86776321 -0.05403952 -0.12626884 -0.86222759 -0.12098246 -0.00053292 -0.00165007 -0.00061450
HT9   -89.87688682 -10.59730658 -10.69199488 -0.37210171 -0.03922184 -0.05572915 -0.34905030 -0.05239911 -0.00002507 -0.00017974 -0.00003538
HT10  -100.22791528 -14.70360877 -14.78040952 -0.56871943 -0.03448357 -0.09214348 -0.53815212 -0.05568096 -0.00022192 -0.00074437 -0.00020215
HT11  -319.02164502 -23.91969149 -23.93679416 -0.68941181 -0.02653695 -0.08113558 -0.48703516 -0.07334435 -0.00047987 -0.00160607 -0.00037986
HT12  -67.07928600 -8.78886112 -8.85635788 -0.31240301 -0.02075350 -0.05646459 -0.29284185 -0.02662527 -0.00004890 -0.00025215 -0.00003273
HT13  -373.19919717 -25.96746708 -25.98921837 -0.71565168 -0.02323749 -0.09140744 -0.50282016 -0.08289263 -0.00040020 -0.00130292 -0.00033656
HT14  -498.85890324 -35.91932353 -36.04801579 -1.00443893 -0.19420986 -0.14976501 -0.79412879 -0.23134481 -0.00030448 -0.00157700 -0.00221473
HT15  -81.65598990 -13.44145845 -13.50138260 -0.54726322 -0.03269881 -0.09063038 -0.53323438 -0.04970827 -0.00032979 -0.00101471 -0.00024984
HT16  -114.78089348 -19.35212119 -19.42018361 -0.80614481 -0.04553724 -0.12451949 -0.78240753 -0.08524757 -0.00063012 -0.00178091 -0.00057423
HT17  -115.03067014 -19.71965507 -19.79584056 -0.84623118 -0.04746627 -0.12171073 -0.84227633 -0.10828815 -0.00065953 -0.00195088 -0.00068418
HT18  -81.90506606 -13.80951312 -13.87744570 -0.58762235 -0.03385165 -0.08814015 -0.59291529 -0.07225569 -0.00035867 -0.00116009 -0.00033586
HT19  -165.19831798 -28.67660064 -28.78630507 -1.22993165 -0.05883233 -0.18784561 -1.25738552 -0.18784561 -0.00210195 -0.00498519 -0.00210195
# 52 + 48 molecules for NCIE + BSSE
# 56 + 34 molecules for S22 + BSSE
# 12 +  6 molecules for ADIM6 + BSSE
NB1         -48.55645853 -7.64974024 -7.68595211 -0.31760339 -0.01401911 -0.04412231 -0.31930645 -0.04412231 -0.00008657 -0.00030193 -0.00008657
NB2         -89.66329217 -10.37956519 -10.45044355 -0.36186618 -0.01782368 -0.05583434 -0.33628457 -0.05583434 -0.00001633 -0.00006188 -0.00001633
NB3         -67.13073076 -8.91330525 -8.97546482 -0.33995930 -0.01630900 -0.05304461 -0.34060456 -0.05304461 -0.00004491 -0.00016479 -0.00004491
NB4         -147.89990245 -21.05563717 -21.19894619 -0.82525953 -0.05612852 -0.13562868 -0.85483207 -0.13562868 -0.00042681 -0.00120037 -0.00042681
NB5         -166.49102417 -22.30016105 -22.47130925 -0.84606768 -0.05906315 -0.14462961 -0.88018029 -0.14462961 -0.00033894 -0.00094061 -0.00033894
NB6         -66.30768165 -11.73286448 -11.76748426 -0.49866305 -0.02291196 -0.06353349 -0.50745334 -0.06353349 -0.00034407 -0.00105989 -0.00034407
NB7         -178.82533989 -19.88726520 -20.08392447 -0.67511182 -0.03510870 -0.10951046 -0.71226770 -0.10951046 -0.00004107 -0.00022353 -0.00004107
NB8         -521.36387993 -37.49362537 -37.60197185 -1.04688935 -0.04029239 -0.14680579 -0.82254098 -0.14680579 -0.00023783 -0.00076514 -0.00023783
NB9         -65.85354824 -10.97462874 -11.03207499 -0.44495746 -0.02081086 -0.06927431 -0.49407356 -0.06927431 -0.00034103 -0.00100557 -0.00034103
NB10        -80.84838567 -12.03583379 -12.12649837 -0.46467059 -0.02410483 -0.08185395 -0.53922276 -0.08185395 -0.00024739 -0.00071942 -0.00024739
NB11        -863.93265443 -55.02069020 -55.05168135 -1.41446793 -0.03461874 -0.18282552 -0.95998800 -0.18282552 -0.00061927 -0.00184606 -0.00061927
NB12        -373.00454583 -25.68880697 -25.69643336 -0.70229009 -0.01759682 -0.08431197 -0.48439617 -0.08431197 -0.00029919 -0.00095454 -0.00029919
NB13        -432.22514747 -27.86145072 -27.86517391 -0.72720755 -0.01552780 -0.09047657 -0.48790169 -0.09047657 -0.00019970 -0.00060921 -0.00019970
NB14        -465.34797114 -33.76587352 -33.78057804 -0.98352707 -0.02898433 -0.12357865 -0.73856417 -0.12357865 -0.00046913 -0.00132592 -0.00046913
NB15        -406.12504604 -31.59883096 -31.61613722 -0.95960748 -0.03032873 -0.11854563 -0.73545685 -0.11854563 -0.00060952 -0.00174871 -0.00060952
NB16        -116.46827658 -12.04666105 -12.10148739 -0.38289783 -0.01616886 -0.05236504 -0.30583693 -0.05236504 -0.00000310 -0.00001161 -0.00000310
NB17        -197.47149459 -33.24321779 -33.35558353 -1.39033033 -0.06348537 -0.21390790 -1.39137894 -0.21390790 -0.00232602 -0.00522560 -0.00232602
NB18        -33.62163489 -6.57945275 -6.58341068 -0.29467065 -0.01205655 -0.03148552 -0.28393341 -0.03148552 -0.00012432 -0.00041268 -0.00012432
NB19        -1.84411960 -1.01387824 -1.01753950 -0.04372008 -0.00239879 0.00000000 -0.04045477 0.00000000 0.00000000 -0.00000550 0.00000000
NB20        -496.63672054 -30.15350463 -30.14388908 -0.75111304 -0.01294047 -0.09328777 -0.47953793 -0.09328777 -0.00011101 -0.00032190 -0.00011101
NB21        -97.11154087 -15.30261715 -15.37382883 -0.63839667 -0.02911490 -0.08958384 -0.64122337 -0.08958384 -0.00024873 -0.00076242 -0.00024873
NB22        -179.32536910 -20.76527786 -20.90525776 -0.72754066 -0.03690319 -0.11258743 -0.67363614 -0.11258743 -0.00005140 -0.00016482 -0.00005140
NB23        -134.25939156 -17.83363668 -17.95609367 -0.68404797 -0.03398898 -0.10746162 -0.68309224 -0.10746162 -0.00013770 -0.00042971 -0.00013770
NB24        -115.68534153 -16.57039318 -16.66804992 -0.66230947 -0.03217414 -0.09909985 -0.66326933 -0.09909985 -0.00019495 -0.00060102 -0.00019495
NB25        -295.78786684 -42.13696985 -42.41865418 -1.66084448 -0.11343886 -0.27470167 -1.71480633 -0.27470167 -0.00118295 -0.00308110 -0.00118295
NB26        -332.96017169 -44.63818395 -44.97403852 -1.70457435 -0.12073854 -0.29263718 -1.76168445 -0.29263718 -0.00095802 -0.00246277 -0.00095802
NB27        -245.12812733 -31.61212961 -31.85769933 -1.17664043 -0.09985389 -0.17758773 -1.23027189 -0.17758773 -0.00048777 -0.00174335 -0.00048777
NB28        -227.38238099 -27.51800928 -27.77359754 -0.99625462 -0.11434296 -0.16002616 -1.05689467 -0.16002616 -0.00018937 -0.00094001 -0.00018937
NB29        -587.21380954 -48.46417378 -48.63848102 -1.49801523 -0.07226565 -0.22157362 -1.32616027 -0.22157362 -0.00085917 -0.00250365 -0.00085917
NB30        -602.21029692 -49.52876720 -49.73240269 -1.51719285 -0.07418182 -0.23331633 -1.37176907 -0.23331633 -0.00063886 -0.00184790 -0.00063886
NB31        -912.49378389 -62.65888034 -62.73775332 -1.73755500 -0.06667743 -0.23269458 -1.29584924 -0.23269458 -0.00095035 -0.00292122 -0.00095035
NB32        -588.49553193 -46.40321435 -46.58031877 -1.39272425 -0.07108171 -0.20440934 -1.17389156 -0.20440934 -0.00040759 -0.00127015 -0.00040759
NB33        -569.91810805 -45.13962551 -45.30384747 -1.37413288 -0.06881046 -0.20101172 -1.17127541 -0.20101172 -0.00054949 -0.00183686 -0.00054949
NB34        -746.00717986 -51.37827704 -51.39337405 -1.40704522 -0.03662878 -0.17024568 -0.97194017 -0.17024568 -0.00076011 -0.00224385 -0.00076011
NB35        -864.44786876 -55.72450122 -55.73161251 -1.45729167 -0.03252389 -0.18255453 -0.97882222 -0.18255453 -0.00051492 -0.00146025 -0.00051492
NB36        -805.22780434 -53.55147992 -53.56410710 -1.43325920 -0.03569523 -0.17721289 -0.97674160 -0.17721289 -0.00065338 -0.00190397 -0.00065338
NB37        -897.57002911 -61.62934247 -61.64718540 -1.71534835 -0.04699020 -0.21688113 -1.23175550 -0.21688113 -0.00088986 -0.00239726 -0.00088986
NB38        -486.97118815 -43.63843424 -43.74467344 -1.42791459 -0.05582909 -0.20225575 -1.27728738 -0.20225575 -0.00104641 -0.00285769 -0.00104641
NB39        -838.34721223 -59.46200594 -59.48456229 -1.69226227 -0.04942744 -0.21285447 -1.23048404 -0.21285447 -0.00107966 -0.00294756 -0.00107966
NB40        -313.93759604 -45.29152300 -45.45688470 -1.77498824 -0.07975235 -0.26677832 -1.69865786 -0.26677832 -0.00239342 -0.00537959 -0.00239342
NB41        -150.08928112 -18.62678621 -18.68477100 -0.67820030 -0.02815895 -0.08397922 -0.59018173 -0.08397922 -0.00014049 -0.00045077 -0.00014049
NB42        -498.48028678 -31.16786046 -31.16145250 -0.79513580 -0.01526034 -0.09334408 -0.52011243 -0.09334408 -0.00011803 -0.00034169 -0.00011803
NB43        -118.31206439 -13.06086708 -13.11897824 -0.42688578 -0.01846006 -0.05238668 -0.34634208 -0.05238668 -0.00000482 -0.00002071 -0.00000482
NB44        -232.93617209 -24.09372282 -24.20284260 -0.76627840 -0.03221334 -0.10478670 -0.61187081 -0.10478670 -0.00000908 -0.00002929 -0.00000908
NB45        -613.10430996 -42.20077666 -42.24534854 -1.13459719 -0.02903154 -0.14575657 -0.78568065 -0.14575657 -0.00012440 -0.00035446 -0.00012440
NB46        -67.24014084 -13.16105317 -13.16704284 -0.59093053 -0.02419502 -0.06358127 -0.56929686 -0.06358127 -0.00034310 -0.00101491 -0.00034310
NB47        -131.70510469 -21.95136575 -22.06441813 -0.89179460 -0.04210577 -0.13941304 -0.98948946 -0.13941304 -0.00081857 -0.00229370 -0.00081857
NB48        -132.60938736 -23.47000177 -23.53577983 -1.00077276 -0.04621713 -0.12876695 -1.01839354 -0.12876695 -0.00092536 -0.00260092 -0.00092536
NB49        -394.88702467 -66.53947676 -66.75554114 -2.78646806 -0.12697873 -0.43124675 -2.78743288 -0.43124675 -0.00575389 -0.01266227 -0.00575389
NB50        -394.88677268 -66.54357703 -66.75807228 -2.78708587 -0.12681941 -0.43016127 -2.78329459 -0.43016127 -0.00533550 -0.01183887 -0.00533550
NB51        -394.88582464 -66.54113145 -66.75573535 -2.78767290 -0.12727707 -0.43200306 -2.78862901 -0.43200306 -0.00580285 -0.01276967 -0.00580285
NB52        -197.44763849 -33.26825590 -33.37770211 -1.39153509 -0.06309056 -0.21351320 -1.38816888 -0.21351320 -0.00230263 -0.00517224 -0.00230263
  S22_1     -97.10393264 -15.31038570 -15.38009368 -0.63898557 -0.02911565 -0.08954756 -0.64052559 -0.08954756 -0.00025641 -0.00077382 -0.00025641
S22_01a     -48.55265125 -7.65376619 -7.68949057 -0.31774756 -0.01397120 -0.04407177 -0.31883836 -0.04407177 -0.00008611 -0.00029990 -0.00008611
  S22_2     -134.25143129 -17.84202864 -17.96328486 -0.68450355 -0.03395599 -0.10734332 -0.68190976 -0.10734332 -0.00013815 -0.00042924 -0.00013815
S22_02a     -67.12626061 -8.91828275 -8.97960380 -0.34012041 -0.01621044 -0.05289778 -0.33959790 -0.05289778 -0.00004452 -0.00016262 -0.00004452
  S22_3     -332.95949222 -44.63737584 -44.97423562 -1.70516415 -0.12110643 -0.29325131 -1.76349018 -0.29325131 -0.00096714 -0.00248490 -0.00096714
S22_03a     -166.50036511 -22.28738908 -22.46067259 -0.84586027 -0.05954231 -0.14524005 -0.88323807 -0.14524005 -0.00034401 -0.00095872 -0.00034401
  S22_4     -295.78603458 -42.13812760 -42.42001233 -1.66119064 -0.11353328 -0.27496455 -1.71552503 -0.27496455 -0.00118863 -0.00309480 -0.00118863
S22_04a     -147.90780666 -21.04544755 -21.19071529 -0.82502123 -0.05681738 -0.13628216 -0.85799299 -0.13628216 -0.00043211 -0.00121725 -0.00043211
  S22_5     -721.24380265 -103.77796090 -104.43571053 -4.09687726 -0.27328335 -0.70472642 -4.20715323 -0.70472642 -0.00498000 -0.01213389 -0.00498000
S22_05a     -360.63413874 -51.86471191 -52.19838230 -2.04249389 -0.13629248 -0.35021607 -2.10460136 -0.35021607 -0.00213503 -0.00537708 -0.00213503
  S22_6     -539.48048036 -83.87475272 -84.29431135 -3.42346251 -0.19333708 -0.56527930 -3.48917984 -0.56527930 -0.00569278 -0.01315276 -0.00569278
S22_06a     -279.04772989 -42.53740833 -42.76959251 -1.71623740 -0.10131831 -0.28426982 -1.76183589 -0.28426982 -0.00230089 -0.00555155 -0.00230089
S22_06b     -260.45973781 -41.29604461 -41.48895001 -1.69555203 -0.08916150 -0.27527287 -1.71945250 -0.27527287 -0.00255936 -0.00591033 -0.00255936
  S22_7     -797.46452730 -118.63500892 -119.32299942 -4.76182352 -0.29029772 -0.81854189 -4.88570062 -0.81854189 -0.00741977 -0.01719479 -0.00741977
S22_07a     -403.73457828 -60.81408127 -61.16878096 -2.44697264 -0.13907361 -0.42637424 -2.52167552 -0.42637424 -0.00382757 -0.00873474 -0.00382757
S22_07b     -393.75994822 -57.77744053 -58.11758711 -2.30264602 -0.14852220 -0.38662833 -2.35613729 -0.38662833 -0.00264534 -0.00655174 -0.00264534
  S22_8     -67.23930356 -13.16223966 -13.16834520 -0.59069222 -0.02413791 -0.06348336 -0.56894078 -0.06348336 -0.00033654 -0.00100103 -0.00033654
S22_08a     -33.62049931 -6.58062962 -6.58447698 -0.29472024 -0.01204380 -0.03148363 -0.28384226 -0.03148363 -0.00012415 -0.00041190 -0.00012415
  S22_9     -132.60135570 -23.47855287 -23.54338591 -1.00111906 -0.04608919 -0.12864943 -1.01721619 -0.12864943 -0.00092097 -0.00258739 -0.00092097
S22_09a     -66.30501318 -11.73570216 -11.77000453 -0.49878467 -0.02287148 -0.06349772 -0.50706437 -0.06349772 -0.00034313 -0.00105645 -0.00034313
 S22_10     -231.06811997 -39.84675314 -39.95768710 -1.68902075 -0.07571605 -0.24712932 -1.67759723 -0.24712932 -0.00276493 -0.00628681 -0.00276493
S22_10a     -197.45843455 -33.25696170 -33.36774521 -1.39097576 -0.06327048 -0.21370008 -1.38966856 -0.21370008 -0.00231391 -0.00519766 -0.00231391
S22_10b     -33.61599432 -6.58526524 -6.58867970 -0.29491540 -0.01199399 -0.03147646 -0.28348644 -0.03147646 -0.00012348 -0.00040885 -0.00012348
 S22_11     -394.90006140 -66.52246407 -66.73845311 -2.78870802 -0.12801164 -0.43403940 -2.79561944 -0.43403940 -0.00598856 -0.01315383 -0.00598856
S22_11a     -197.45724090 -33.25819243 -33.36887022 -1.39101101 -0.06325499 -0.21369585 -1.38959951 -0.21369585 -0.00231390 -0.00519721 -0.00231390
 S22_12     -454.68392160 -70.70415162 -71.07827272 -2.87066449 -0.14588263 -0.48512259 -2.97224218 -0.48512259 -0.00540575 -0.01192728 -0.00540575
S22_12a     -227.35190709 -35.34527459 -35.53573813 -1.43140626 -0.07200786 -0.23909079 -1.47798010 -0.23909079 -0.00204361 -0.00463421 -0.00204361
 S22_13     -721.23328295 -103.76778713 -104.42072882 -4.09657680 -0.27308655 -0.70872032 -4.22308111 -0.70872032 -0.00604306 -0.01429517 -0.00604306
S22_13a     -360.62762273 -51.87258418 -52.20531083 -2.04261946 -0.13610480 -0.34994270 -2.10318638 -0.34994270 -0.00213492 -0.00537746 -0.00213492
 S22_14     -508.27331173 -83.91811705 -84.22355636 -3.50049853 -0.16679846 -0.56438179 -3.52863811 -0.56438179 -0.00836181 -0.01831152 -0.00836181
S22_14a     -310.83490344 -50.65224693 -50.85425242 -2.09989838 -0.10131066 -0.34053759 -2.11482740 -0.34053759 -0.00397223 -0.00892942 -0.00397223
S22_14b     -197.45727841 -33.25819038 -33.36878124 -1.39106705 -0.06324609 -0.21366055 -1.38939339 -0.21366055 -0.00231123 -0.00519214 -0.00231123
 S22_15     -797.44984965 -118.63251380 -119.31046508 -4.76539132 -0.29044478 -0.82647066 -4.90470364 -0.82647066 -0.00919029 -0.02070901 -0.00919029
S22_15a     -403.73402181 -60.81413645 -61.16899781 -2.44672791 -0.13925938 -0.42660855 -2.52267983 -0.42660855 -0.00384810 -0.00877825 -0.00384810
S22_15b     -393.74827741 -57.79122587 -58.12962417 -2.30292541 -0.14819839 -0.38621565 -2.35383294 -0.38621565 -0.00263360 -0.00651836 -0.00263360
 S22_16     -132.15181753 -22.71777179 -22.80732603 -0.94581603 -0.04399416 -0.13358372 -1.00160211 -0.13358372 -0.00081331 -0.00232228 -0.00081331
S22_16a     -66.30415877 -11.73658225 -11.77079413 -0.49882065 -0.02285966 -0.06349783 -0.50702328 -0.06349783 -0.00034288 -0.00105576 -0.00034288
S22_16b     -65.85266243 -10.97555496 -11.03291992 -0.44499060 -0.02080052 -0.06927404 -0.49401645 -0.06927404 -0.00034081 -0.00100510 -0.00034081
 S22_17     -264.58286586 -42.17796870 -42.34709528 -1.73472052 -0.08033901 -0.26867503 -1.73405973 -0.26867503 -0.00260672 -0.00588833 -0.00260672
S22_17a     -197.46049222 -33.25478942 -33.36585168 -1.39085501 -0.06330736 -0.21374464 -1.39000721 -0.21374464 -0.00231671 -0.00520376 -0.00231671
S22_17b     -67.12777650 -8.91641749 -8.97813941 -0.34005745 -0.01625816 -0.05299367 -0.34020657 -0.05299367 -0.00004476 -0.00016406 -0.00004476
 S22_18     -246.00501280 -40.91633939 -41.05939248 -1.71206555 -0.07773376 -0.25974581 -1.71298144 -0.25974581 -0.00270497 -0.00613711 -0.00270497
S22_18a     -197.45881546 -33.25655782 -33.36739757 -1.39095045 -0.06327779 -0.21371016 -1.38974200 -0.21371016 -0.00231456 -0.00519905 -0.00231456
S22_18b     -48.55252110 -7.65364982 -7.68951128 -0.31773395 -0.01399876 -0.04409637 -0.31909233 -0.04409637 -0.00008614 -0.00030089 -0.00008614
 S22_19     -278.30917256 -45.29135970 -45.48945806 -1.85989048 -0.08854892 -0.29876565 -1.93669294 -0.29876565 -0.00291664 -0.00667206 -0.00291664
S22_19a     -197.46098649 -33.25426422 -33.36539812 -1.39082322 -0.06331672 -0.21375710 -1.39009893 -0.21375710 -0.00231751 -0.00520548 -0.00231751
S22_19b     -80.85739935 -12.02486855 -12.11768235 -0.46425678 -0.02439398 -0.08281241 -0.54400460 -0.08281241 -0.00025350 -0.00073965 -0.00025350
 S22_20     -394.90829353 -66.52013136 -66.73715945 -2.78645057 -0.12730437 -0.43096777 -2.78746066 -0.43096777 -0.00540254 -0.01198124 -0.00540254
S22_20a     -197.45956002 -33.25577412 -33.36671021 -1.39090958 -0.06329066 -0.21372453 -1.38985421 -0.21372453 -0.00231545 -0.00520101 -0.00231545
S22_20b     -197.46147921 -33.25372248 -33.36495458 -1.39077529 -0.06332892 -0.21377966 -1.39025020 -0.21377966 -0.00231907 -0.00520863 -0.00231907
 S22_21     -508.28583284 -83.91580008 -84.22280655 -3.49722837 -0.16574657 -0.55943339 -3.51619736 -0.55943339 -0.00736000 -0.01631309 -0.00736000
S22_21a     -310.83850115 -50.64837399 -50.85086347 -2.09974177 -0.10135622 -0.34062243 -2.11535449 -0.34062243 -0.00397599 -0.00893737 -0.00397599
S22_21b     -197.46002371 -33.25528568 -33.36628210 -1.39088393 -0.06329871 -0.21373360 -1.38992481 -0.21373360 -0.00231601 -0.00520225 -0.00231601
 S22_22     -528.17686647 -82.99762613 -83.35787859 -3.39824216 -0.17427475 -0.54550578 -3.40780192 -0.54550578 -0.00594482 -0.01325680 -0.00594482
S22_22a     -264.09707970 -41.48885643 -41.67255294 -1.69513683 -0.08680811 -0.27053775 -1.69986761 -0.27053775 -0.00255876 -0.00579582 -0.00255876
S22_22b     -264.09707970 -41.48885643 -41.67255294 -1.69513683 -0.08680810 -0.27053775 -1.69986761 -0.27053775 -0.00255876 -0.00579582 -0.00255876
    AM2     -66.74698375 -12.48824701 -12.49856492 -0.55241010 -0.02385044 -0.06463563 -0.53060639 -0.06463563 -0.00036480 -0.00103850 -0.00036480
    AD2     -133.48915582 -24.97972984 -24.99726672 -1.10767833 -0.04796468 -0.13074313 -1.06433534 -0.13074313 -0.00096429 -0.00254703 -0.00096429
    AM3     -99.87532616 -18.39538987 -18.41149538 -0.81117318 -0.03593524 -0.09907514 -0.77927688 -0.09907514 -0.00069517 -0.00184059 -0.00069517
    AD3     -199.74330798 -36.79548240 -36.82363107 -1.62644381 -0.07246086 -0.20060460 -1.56382372 -0.20060460 -0.00180728 -0.00451572 -0.00180728
    AM4     -133.00276440 -24.30336792 -24.32511547 -1.06999991 -0.04799323 -0.13361238 -1.02821102 -0.13361238 -0.00105230 -0.00269631 -0.00105230
    AD4     -265.99472382 -48.61370626 -48.65160320 -2.14582488 -0.09691844 -0.27086662 -2.06431771 -0.27086662 -0.00275282 -0.00668972 -0.00275282
    AM5     -166.12998918 -30.21148034 -30.23889247 -1.32881744 -0.06004640 -0.16815621 -1.27722579 -0.16815621 -0.00142439 -0.00358197 -0.00142439
    AD5     -332.24587973 -60.43211055 -60.47971637 -2.66513229 -0.12132114 -0.34111975 -2.56487897 -0.34111975 -0.00373293 -0.00893231 -0.00373293
    AM6     -199.25726639 -36.11954115 -36.15261147 -1.58763877 -0.07209617 -0.20271269 -1.52626087 -0.20271269 -0.00180271 -0.00448003 -0.00180271
    AD6     -398.49690237 -72.25036687 -72.30788001 -3.18449672 -0.14583008 -0.41154597 -3.06586283 -0.41154597 -0.00474824 -0.01124584 -0.00474824
    AM7     -232.38451573 -42.02763196 -42.06635043 -1.84646015 -0.08414495 -0.23727080 -1.77530521 -0.23727080 -0.00218378 -0.00538356 -0.00218378
    AD7     -464.74743323 -84.06915428 -84.13600720 -3.70402892 -0.17014858 -0.48200530 -3.56676510 -0.48200530 -0.00575940 -0.01354956 -0.00575940
 1-1_NCIE   -48.55755920 -7.64872145 -7.68507549 -0.31760254 -0.01407266 -0.04424185 -0.31998766 -0.04424185 -0.00009049 -0.00031359 -0.00009049
 2-1_NCIE   -89.66510182 -10.37799895 -10.44914092 -0.36181570 -0.01803013 -0.05603649 -0.33743958 -0.05603649 -0.00001841 -0.00006852 -0.00001841
 3-1_NCIE   -67.13332756 -8.91060233 -8.97320545 -0.33987269 -0.01650126 -0.05317177 -0.34134442 -0.05317177 -0.00004655 -0.00016989 -0.00004655
 4-1_NCIE   -48.55780034 -7.64854217 -7.68492382 -0.31761233 -0.01409618 -0.04428125 -0.32026515 -0.04428125 -0.00009074 -0.00031496 -0.00009074
 4-2_NCIE   -67.13557170 -8.90809162 -8.97107325 -0.33979243 -0.01655792 -0.05323114 -0.34179136 -0.05323114 -0.00004686 -0.00017108 -0.00004686
 5-1_NCIE   -147.90755546 -21.04617197 -21.19120643 -0.82506595 -0.05685003 -0.13642545 -0.85896144 -0.13642545 -0.00044076 -0.00123807 -0.00044076
 6-1_NCIE   -166.49813599 -22.29095705 -22.46341103 -0.84598196 -0.05945700 -0.14526106 -0.88367327 -0.14526106 -0.00035100 -0.00097506 -0.00035100
 7-1_NCIE   -66.30795700 -11.73257851 -11.76725273 -0.49865908 -0.02293382 -0.06359482 -0.50780752 -0.06359482 -0.00034827 -0.00107098 -0.00034827
 7-2_NCIE   -178.82866306 -19.88349058 -20.08128478 -0.67489930 -0.03536202 -0.10978753 -0.71547030 -0.10978753 -0.00004319 -0.00023198 -0.00004319
 8-1_NCIE   -48.55743970 -7.64883709 -7.68521662 -0.31760561 -0.01409738 -0.04424545 -0.31988966 -0.04424545 -0.00009026 -0.00031355 -0.00009026
 8-2_NCIE   -178.83118996 -19.87991931 -20.07889253 -0.67472005 -0.03542961 -0.10990722 -0.71794088 -0.10990722 -0.00004267 -0.00023432 -0.00004267
 9-1_NCIE   -65.85626186 -10.97161586 -11.02952525 -0.44484703 -0.02089521 -0.06953782 -0.49569221 -0.06953782 -0.00035340 -0.00104259 -0.00035340
 9-2_NCIE   -521.37082806 -37.48560400 -37.59598049 -1.04644556 -0.04067590 -0.14713588 -0.82638990 -0.14713588 -0.00024158 -0.00078380 -0.00024158
10-1_NCIE   -80.84669930 -12.03800365 -12.12824243 -0.46475368 -0.02409162 -0.08171737 -0.53877885 -0.08171737 -0.00024682 -0.00071698 -0.00024682
10-2_NCIE   -521.37062910 -37.48587434 -37.59618433 -1.04645934 -0.04065114 -0.14711816 -0.82619535 -0.14711816 -0.00024112 -0.00078231 -0.00024112
11-1_NCIE   -48.55793405 -7.64852581 -7.68481808 -0.31762483 -0.01406071 -0.04427574 -0.32014274 -0.04427574 -0.00009166 -0.00031664 -0.00009166
11-2_NCIE   -863.94153006 -55.01090355 -55.04394069 -1.41379841 -0.03477623 -0.18282346 -0.96301585 -0.18282346 -0.00062474 -0.00188861 -0.00062474
12-1_NCIE   -67.13304662 -8.91134291 -8.97380378 -0.33991033 -0.01654289 -0.05329648 -0.34182955 -0.05329648 -0.00004992 -0.00017861 -0.00004992
12-2_NCIE   -521.37079396 -37.48558865 -37.59597725 -1.04644348 -0.04063701 -0.14711131 -0.82624216 -0.14711131 -0.00024105 -0.00078242 -0.00024105
13-1_NCIE   -48.55777037 -7.64878026 -7.68490242 -0.31765874 -0.01403458 -0.04429966 -0.32024352 -0.04429966 -0.00009308 -0.00031925 -0.00009308
13-2_NCIE   -521.38856069 -37.46312793 -37.57953175 -1.04515391 -0.04142201 -0.14783135 -0.83644412 -0.14783135 -0.00024766 -0.00082830 -0.00024766
14-1_NCIE   -373.00531830 -25.68803280 -25.69575616 -0.70226470 -0.01762572 -0.08435212 -0.48475557 -0.08435212 -0.00030135 -0.00096094 -0.00030135
15-1_NCIE   -432.22589786 -27.86069309 -27.86452146 -0.72718410 -0.01555733 -0.09052561 -0.48838646 -0.09052561 -0.00020162 -0.00061497 -0.00020162
16-1_NCIE   -373.00565038 -25.68768187 -25.69546977 -0.70225512 -0.01763593 -0.08437252 -0.48498217 -0.08437252 -0.00030160 -0.00096190 -0.00030160
16-2_NCIE   -432.22888293 -27.85749336 -27.86183756 -0.72707187 -0.01565816 -0.09055604 -0.48871572 -0.09055604 -0.00020296 -0.00061993 -0.00020296
17-1_NCIE   -465.34992458 -33.76390456 -33.77892489 -0.98339007 -0.02907200 -0.12363491 -0.73938390 -0.12363491 -0.00047304 -0.00133866 -0.00047304
17-2_NCIE   -432.22816659 -27.85828271 -27.86250115 -0.72710313 -0.01564045 -0.09056645 -0.48874713 -0.09056645 -0.00020410 -0.00062252 -0.00020410
18-1_NCIE   -406.12615437 -31.59774613 -31.61519262 -0.95955165 -0.03037416 -0.11861315 -0.73607154 -0.11861315 -0.00061301 -0.00175852 -0.00061301
18-2_NCIE   -80.85183637 -12.03208933 -12.12322092 -0.46454321 -0.02424513 -0.08199481 -0.54017291 -0.08199481 -0.00025127 -0.00072990 -0.00025127
19-1_NCIE   -406.12598323 -31.59792062 -31.61534766 -0.95956400 -0.03037223 -0.11862519 -0.73621574 -0.11862519 -0.00061287 -0.00175854 -0.00061287
19-2_NCIE   -432.23117104 -27.85494663 -27.85965272 -0.72697710 -0.01572426 -0.09060553 -0.48926237 -0.09060553 -0.00020555 -0.00062807 -0.00020555
20-1_NCIE   -116.46876276 -12.04653144 -12.10134106 -0.38287507 -0.01636877 -0.05244252 -0.30625837 -0.05244252 -0.00000361 -0.00001326 -0.00000361
20-2_NCIE   -197.47196064 -33.24279864 -33.35519984 -1.39032021 -0.06351506 -0.21397833 -1.39172530 -0.21397833 -0.00233443 -0.00525613 -0.00233443
21-1_NCIE   -116.46860975 -12.04657756 -12.10137626 -0.38288792 -0.01628657 -0.05240786 -0.30609158 -0.05240786 -0.00000327 -0.00001216 -0.00000327
21-2_NCIE   -33.62164250 -6.57944733 -6.58340018 -0.29467032 -0.01205959 -0.03149040 -0.28396013 -0.03149040 -0.00012478 -0.00041377 -0.00012478
22-1_NCIE   -1.84412047 -1.01388385 -1.01754357 -0.04371884 -0.00240078 0.00000000 -0.04045718 0.00000000 0.00000000 -0.00000562 0.00000000
22-2_NCIE   -496.63674018 -30.15349412 -30.14389315 -0.75111323 -0.01294357 -0.09329074 -0.47956944 -0.09329074 -0.00011117 -0.00032244 -0.00011117
23-1_NCIE   -1.84412021 -1.01388183 -1.01754200 -0.04371937 -0.00239986 0.00000000 -0.04045655 0.00000000 0.00000000 -0.00000560 0.00000000
23-2_NCIE   -116.46834516 -12.04663537 -12.10146211 -0.38289350 -0.01620232 -0.05237331 -0.30588415 -0.05237331 -0.00000313 -0.00001171 -0.00000313
24-1_NCIE   -116.46839058 -12.04662991 -12.10145037 -0.38289176 -0.01621419 -0.05238268 -0.30593265 -0.05238268 -0.00000322 -0.00001198 -0.00000322
25-1_NCIE   -116.46844616 -12.04661912 -12.10143842 -0.38289003 -0.01624328 -0.05238617 -0.30596030 -0.05238617 -0.00000319 -0.00001191 -0.00000319
25-2_NCIE   -496.63674219 -30.15349352 -30.14389011 -0.75111297 -0.01294409 -0.09329528 -0.47960957 -0.09329528 -0.00011132 -0.00032283 -0.00011132
26-1_NCIE   -33.62177747 -6.57931700 -6.58327870 -0.29466529 -0.01206712 -0.03150769 -0.28405958 -0.03150769 -0.00012640 -0.00041748 -0.00012640
27-1_NCIE   -65.85425242 -10.97385482 -11.03142453 -0.44493158 -0.02084558 -0.06935039 -0.49449916 -0.06935039 -0.00034621 -0.00102095 -0.00034621
28-1_NCIE   -66.30828424 -11.73226276 -11.76694175 -0.49863993 -0.02294436 -0.06362755 -0.50794742 -0.06362755 -0.00035305 -0.00108201 -0.00035305
29-1_NCIE   -197.44824287 -33.26784257 -33.37733817 -1.39155160 -0.06317305 -0.21367422 -1.38904470 -0.21367422 -0.00231398 -0.00520505 -0.00231398
30-1_NCIE   -197.44821263 -33.26808417 -33.37746472 -1.39154652 -0.06318565 -0.21372669 -1.38932309 -0.21372669 -0.00231991 -0.00523141 -0.00231991
31-1_NCIE   -197.44825086 -33.26795750 -33.37736556 -1.39155444 -0.06318783 -0.21372606 -1.38930764 -0.21372606 -0.00231866 -0.00522318 -0.00231866
01a_S22     -48.55408612 -7.65233052 -7.68822622 -0.31771460 -0.01400022 -0.04416807 -0.31937611 -0.04416807 -0.00009023 -0.00031125 -0.00009023
02a_S22     -67.12994824 -8.91434851 -8.97634945 -0.33999345 -0.01643035 -0.05307835 -0.34068742 -0.05307835 -0.00004630 -0.00016851 -0.00004630
03a_S22     -166.50100137 -22.28726806 -22.46048059 -0.84585712 -0.05965817 -0.14550000 -0.88488760 -0.14550000 -0.00035291 -0.00098106 -0.00035291
04a_S22     -147.90822397 -21.04533687 -21.19055909 -0.82501740 -0.05688998 -0.13649419 -0.85933317 -0.13649419 -0.00044132 -0.00124024 -0.00044132
05a_S22     -360.63474435 -51.86452183 -52.19814257 -2.04248929 -0.13639341 -0.35047195 -2.10627725 -0.35047195 -0.00214636 -0.00540405 -0.00214636
06a_S22     -279.04835995 -42.53719642 -42.76929571 -1.71623267 -0.10141941 -0.28456147 -1.76357479 -0.28456147 -0.00231747 -0.00559283 -0.00231747
06b_S22     -260.46022512 -41.29586675 -41.48872712 -1.69554897 -0.08925705 -0.27545011 -1.72079216 -0.27545011 -0.00256635 -0.00592980 -0.00256635
07a_S22     -403.73599165 -60.81290285 -61.16771666 -2.44693408 -0.13918731 -0.42657569 -2.52317065 -0.42657569 -0.00383455 -0.00875162 -0.00383455
07b_S22     -393.76049705 -57.77738277 -58.11745658 -2.30265775 -0.14862929 -0.38687626 -2.35774922 -0.38687626 -0.00265590 -0.00657624 -0.00265590
08a_S22     -33.62094081 -6.58018362 -6.58406336 -0.29470171 -0.01205703 -0.03150284 -0.28397454 -0.03150284 -0.00012602 -0.00041633 -0.00012602
09a_S22     -66.30423706 -11.73656217 -11.77075839 -0.49882490 -0.02288254 -0.06357465 -0.50736549 -0.06357465 -0.00035156 -0.00107664 -0.00035156
10a_S22     -197.45877842 -33.25692170 -33.36763995 -1.39098198 -0.06332680 -0.21383926 -1.39039470 -0.21383926 -0.00232742 -0.00524708 -0.00232742
10b_S22     -33.61653655 -6.58473154 -6.58819212 -0.29489231 -0.01201221 -0.03153578 -0.28379135 -0.03153578 -0.00012986 -0.00042357 -0.00012986
11a_S22     -197.45931470 -33.25643720 -33.36715522 -1.39098672 -0.06339389 -0.21395599 -1.39110308 -0.21395599 -0.00233238 -0.00525758 -0.00233238
12a_S22     -227.35202673 -35.34561868 -35.53591502 -1.43143586 -0.07210075 -0.23927081 -1.47914571 -0.23927081 -0.00205643 -0.00467627 -0.00205643
13a_S22     -360.62865331 -51.87232642 -52.20491927 -2.04261364 -0.13628711 -0.35042767 -2.10573601 -0.35042767 -0.00216178 -0.00544357 -0.00216178
14a_S22     -310.83708946 -50.65048915 -50.85260617 -2.09986540 -0.10150409 -0.34095244 -2.11704299 -0.34095244 -0.00400137 -0.00901019 -0.00400137
14b_S22     -197.46082277 -33.25494771 -33.36588971 -1.39093184 -0.06345458 -0.21406827 -1.39184662 -0.21406827 -0.00233682 -0.00526788 -0.00233682
15a_S22     -403.73513966 -60.81380082 -61.16857759 -2.44673915 -0.13946312 -0.42711268 -2.52554497 -0.42711268 -0.00387302 -0.00884346 -0.00387302
15b_S22     -393.74963296 -57.79075250 -58.12907308 -2.30293115 -0.14844253 -0.38681307 -2.35704476 -0.38681307 -0.00266571 -0.00659647 -0.00266571
16a_S22     -66.30429201 -11.73649366 -11.77072826 -0.49883203 -0.02288230 -0.06355712 -0.50734821 -0.06355712 -0.00034687 -0.00106617 -0.00034687
16b_S22     -65.85164968 -10.97675643 -11.03394753 -0.44504511 -0.02081113 -0.06922277 -0.49374181 -0.06922277 -0.00034132 -0.00100615 -0.00034132
17a_S22     -197.46064364 -33.25492722 -33.36590537 -1.39086745 -0.06335642 -0.21387334 -1.39066494 -0.21387334 -0.00232925 -0.00524920 -0.00232925
17b_S22     -67.13034270 -8.91388375 -8.97614786 -0.33996651 -0.01664335 -0.05323129 -0.34130703 -0.05323129 -0.00004904 -0.00017648 -0.00004904
18a_S22     -197.45960235 -33.25602984 -33.36685997 -1.39092544 -0.06333877 -0.21384975 -1.39048248 -0.21384975 -0.00232826 -0.00524798 -0.00232826
18b_S22     -48.55262762 -7.65366962 -7.68954670 -0.31774609 -0.01407231 -0.04420707 -0.31956666 -0.04420707 -0.00009205 -0.00031705 -0.00009205
19a_S22     -197.46188516 -33.25374300 -33.36485371 -1.39081106 -0.06340167 -0.21394955 -1.39116002 -0.21394955 -0.00233344 -0.00526255 -0.00233344
19b_S22     -80.85783078 -12.02451470 -12.11737353 -0.46425386 -0.02448878 -0.08288580 -0.54454559 -0.08288580 -0.00025653 -0.00074768 -0.00025653
20a_S22     -197.46031713 -33.25544136 -33.36632064 -1.39091689 -0.06339476 -0.21395326 -1.39110588 -0.21395326 -0.00233351 -0.00526268 -0.00233351
20b_S22     -197.45964204 -33.25583787 -33.36672371 -1.39093136 -0.06334762 -0.21382441 -1.39041641 -0.21382441 -0.00232278 -0.00522448 -0.00232278
21a_S22     -310.83899031 -50.64811459 -50.85058359 -2.09974033 -0.10142737 -0.34077471 -2.11613545 -0.34077471 -0.00398619 -0.00896163 -0.00398619
21b_S22     -197.46309048 -33.25256926 -33.36383131 -1.39077289 -0.06348006 -0.21407377 -1.39194238 -0.21407377 -0.00233929 -0.00527698 -0.00233929
22a_S22     -264.09823579 -41.48813893 -41.67183480 -1.69511892 -0.08692356 -0.27082681 -1.70144054 -0.27082681 -0.00257502 -0.00583858 -0.00257502
22b_S22     -264.09772286 -41.48856503 -41.67208265 -1.69525785 -0.08677214 -0.27076328 -1.70074095 -0.27076328 -0.00257814 -0.00584733 -0.00257814
AM2_BSSE    -66.74701710 -12.48824726 -12.49855616 -0.55241009 -0.02387375 -0.06467913 -0.53082825 -0.06467913 -0.00036913 -0.00104822 -0.00036913
AM3_BSSE    -99.87543059 -18.39536622 -18.41143127 -0.81117156 -0.03599260 -0.09914087 -0.77965973 -0.09914087 -0.00069961 -0.00185063 -0.00069961
AM4_BSSE    -133.00297176 -24.30330182 -24.32502582 -1.07000090 -0.04807942 -0.13370797 -1.02879018 -0.13370797 -0.00105767 -0.00270854 -0.00105767
AM5_BSSE    -166.13026614 -30.21140316 -30.23873924 -1.32881839 -0.06016560 -0.16828119 -1.27799976 -0.16828119 -0.00143094 -0.00359683 -0.00143094
AM6_BSSE    -199.25765192 -36.11941793 -36.15241261 -1.58764085 -0.07225440 -0.20287690 -1.52727424 -0.20287690 -0.00181099 -0.00449867 -0.00181099
AM7_BSSE    -232.38495669 -42.02750252 -42.06611130 -1.84646259 -0.08433197 -0.23746600 -1.77652650 -0.23746600 -0.00219339 -0.00540513 -0.00219339
