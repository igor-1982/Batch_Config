# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PBEPBE           2                   QChem

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
" 5) PBE referece KS orbital is used                                         "

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

    E_noXC, Ex_HF, Ex_PBE, Ec_PBE, Ec_PT21, aaaa, abab, bbbb,\
    aaaa_erf200, abab_erf200, bbbb_erf200 = P
    return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE \
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
#        E_noXC     E_K     Ex_PBE      Ec_PBE      PT2_1ST    aaaa     abab     bbbb      aaaa_erf200     abab_erf200     bbbb_erf200
# 17 atoms
   H_0  -0.19252001 -0.30666480 -0.30157884 -0.00571413 -0.00105001 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
  He_0  -1.84589704 -1.01259340 -1.00431714 -0.04108990 -0.00297365 0.00000000 -0.04030176 0.00000000 0.00000000 -0.00000550 0.00000000
  Li_0  -5.65343771 -1.77777672 -1.75533844 -0.05128547 -0.00106649 -0.00041784 -0.03759320 0.00000000 -0.00000831 -0.00000951 0.00000000
  Be_0  -11.90342249 -2.66725825 -2.63845127 -0.08576435 -0.00154744 -0.00058724 -0.11058023 -0.00058724 -0.00000190 -0.00093587 -0.00000190
   B_0  -20.76840056 -3.75952386 -3.72785196 -0.11256201 -0.00373352 -0.00729538 -0.12654073 -0.00070716 -0.00006610 -0.00033278 -0.00000053
   C_0  -32.62837458 -5.05742943 -5.02195575 -0.14375936 -0.00588237 -0.02279507 -0.13600207 -0.00075727 -0.00005284 -0.00013776 -0.00000018
   N_0  -47.81473110 -6.57946196 -6.53596733 -0.17851262 -0.00741349 -0.04749033 -0.13929909 -0.00079049 -0.00003357 -0.00006299 -0.00000007
   O_0  -66.62305079 -8.17969705 -8.14897991 -0.23288295 -0.01077826 -0.04896499 -0.19582656 -0.00811503 -0.00001375 -0.00003488 -0.00000419
   F_0  -89.39831612 -9.99546843 -9.97409800 -0.28915912 -0.01423528 -0.05044086 -0.25118207 -0.02528484 -0.00000631 -0.00001979 -0.00000411
  Ne_0  -116.46936673 -12.04866637 -12.03022637 -0.34671784 -0.01711233 -0.05186432 -0.30357908 -0.05186432 -0.00000311 -0.00001154 -0.00000311
  Na_0  -147.85623970 -13.98220655 -13.93017762 -0.36970372 -0.01207290 -0.04646234 -0.23664595 -0.04281909 -0.00006002 -0.00006676 -0.00000269
  Mg_0  -183.63222724 -15.96711099 -15.90275994 -0.40973348 -0.01020747 -0.04418138 -0.28279837 -0.04418138 -0.00002544 -0.00162603 -0.00002544
  Al_0  -223.80394808 -18.06138192 -17.97833845 -0.44464911 -0.01106652 -0.05251493 -0.30403839 -0.04624506 -0.00032212 -0.00114182 -0.00001178
  Si_0  -268.57207613 -20.27060271 -20.16979720 -0.48335025 -0.01208925 -0.06774090 -0.32579372 -0.04719168 -0.00048771 -0.00077508 -0.00000600
   P_0  -318.08842646 -22.61487871 -22.49181196 -0.52511636 -0.01088842 -0.08976556 -0.34227975 -0.04720649 -0.00050571 -0.00052379 -0.00000329
   S_0  -372.49621354 -24.99791681 -24.86208195 -0.58307848 -0.01293999 -0.09113065 -0.39096647 -0.05468985 -0.00028428 -0.00049140 -0.00005258
  Cl_0  -431.96101316 -27.50709979 -27.35681617 -0.64311063 -0.01409883 -0.09217122 -0.43744134 -0.06997414 -0.00017154 -0.00040215 -0.00009206
# 223 molecules in G3 set
  G2-1  -5.85537787 -2.12846874 -2.10606105 -0.08345516 -0.00555996 -0.00034867 -0.08458359 -0.00034867 -0.00000308 -0.00029032 -0.00000308
  G2-2  -12.07973270 -3.06819304 -3.03276323 -0.10323476 -0.00477344 -0.00382569 -0.09186609 -0.00042717 -0.00008975 -0.00029612 -0.00000093
  G2-3  -32.87107793 -5.40253350 -5.37356522 -0.18406964 -0.00884137 -0.02142341 -0.19223614 -0.00613574 -0.00006481 -0.00022607 -0.00002012
  G2-4  -33.08192646 -5.84742748 -5.80721967 -0.21441855 -0.00926258 -0.04176908 -0.18124029 -0.00454634 -0.00013087 -0.00020542 -0.00001491
  G2-5  -33.11458784 -5.76889785 -5.74054168 -0.22332518 -0.01083797 -0.01862138 -0.24932200 -0.01862138 -0.00006711 -0.00031852 -0.00006711
  G2-6  -33.36207037 -6.20688646 -6.16636650 -0.25887161 -0.01065253 -0.03763388 -0.23424266 -0.01414278 -0.00013388 -0.00030087 -0.00005306
  G2-7  -33.63027986 -6.57315513 -6.53217860 -0.30006820 -0.01241696 -0.03139048 -0.28235817 -0.03139048 -0.00012591 -0.00041529 -0.00012591
  G2-8  -48.06305984 -6.90923886 -6.88219546 -0.22448411 -0.01090771 -0.04821795 -0.20126387 -0.00666867 -0.00005374 -0.00013101 -0.00001058
  G2-9  -48.31219419 -7.26452225 -7.24684356 -0.26979035 -0.01305758 -0.04688054 -0.26173456 -0.02103178 -0.00007234 -0.00021254 -0.00003850
 G2-10  -48.56121638 -7.64796413 -7.63402656 -0.31404452 -0.01447836 -0.04365750 -0.31662449 -0.04365750 -0.00008637 -0.00029992 -0.00008637
 G2-11  -66.87987661 -8.52912678 -8.52064583 -0.27898482 -0.01466002 -0.05174911 -0.26830004 -0.02527133 -0.00002808 -0.00009038 -0.00001755
 G2-12  -67.13392828 -8.91348760 -8.91884626 -0.32438007 -0.01694861 -0.05236173 -0.33719772 -0.05236173 -0.00004457 -0.00016220 -0.00004457
 G2-13  -89.66504705 -10.38110203 -10.38747169 -0.33463991 -0.01867153 -0.05516244 -0.33315711 -0.05516244 -0.00001619 -0.00006081 -0.00001619
 G2-14  -269.05348652 -20.95960969 -20.85322152 -0.55385507 -0.01840074 -0.05933179 -0.40997724 -0.05933179 -0.00025406 -0.00116476 -0.00025406
 G2-15  -269.00991623 -20.99496703 -20.88059858 -0.54410244 -0.01813195 -0.07673449 -0.36281109 -0.04850768 -0.00064918 -0.00081892 -0.00005088
 G2-16  -269.26892116 -21.35235146 -21.22915604 -0.58086420 -0.02006526 -0.06977916 -0.40175979 -0.05388324 -0.00047544 -0.00095155 -0.00013867
 G2-17  -269.52381150 -21.71734017 -21.58418355 -0.61570101 -0.02234043 -0.06234930 -0.43848796 -0.06234930 -0.00029857 -0.00102177 -0.00029857
 G2-18  -318.58715858 -23.28234134 -23.15905954 -0.60496516 -0.01754311 -0.08102062 -0.42627680 -0.06059296 -0.00043940 -0.00099502 -0.00016568
 G2-19  -318.83728294 -23.63170018 -23.50563079 -0.64300480 -0.02002860 -0.07470338 -0.46865855 -0.07470338 -0.00036232 -0.00121298 -0.00036232
 G2-20  -373.01347216 -25.68338291 -25.55156006 -0.66603518 -0.01753514 -0.08418125 -0.48278537 -0.08418125 -0.00029938 -0.00094705 -0.00029938
 G2-21  -432.23044647 -27.85969313 -27.71370980 -0.68607495 -0.01555572 -0.09018438 -0.48608569 -0.09018438 -0.00019793 -0.00059947 -0.00019793
 G2-22  -11.31670980 -3.55054491 -3.51199727 -0.12405146 -0.00470898 -0.00059420 -0.13325992 -0.00059420 -0.00001392 -0.00404694 -0.00001392
 G2-23  -95.04612404 -11.91737804 -11.92086551 -0.37583180 -0.03505506 -0.06232547 -0.38980990 -0.06232547 -0.00003200 -0.00011985 -0.00003200
 G2-24  -65.84657582 -10.98656780 -10.97231407 -0.43007478 -0.02069370 -0.06794396 -0.48719605 -0.06794396 -0.00033032 -0.00096923 -0.00033032
 G2-25  -66.31232983 -11.73230840 -11.69123986 -0.49464362 -0.02304291 -0.06301683 -0.50317182 -0.06301683 -0.00034319 -0.00104837 -0.00034319
 G2-26  -66.76468928 -12.47482287 -12.40459698 -0.55983411 -0.02421963 -0.06446383 -0.52760129 -0.06446383 -0.00036899 -0.00104690 -0.00036899
 G2-27  -80.58384976 -11.60876883 -11.65394734 -0.40009278 -0.03686700 -0.08509164 -0.55777016 -0.09801306 -0.00023052 -0.00092365 -0.00033768
 G2-28  -80.84567498 -12.04358107 -12.05731145 -0.44016962 -0.02402941 -0.08029481 -0.53178012 -0.08029481 -0.00024083 -0.00069801 -0.00024083
 G2-29  -99.45980301 -13.29791740 -13.31956720 -0.44814805 -0.02967222 -0.08330780 -0.53106646 -0.08330780 -0.00014773 -0.00041332 -0.00014773
 G2-30  -99.61266157 -13.65424666 -13.67904026 -0.47771305 -0.03468243 -0.08388602 -0.54185118 -0.08939968 -0.00018130 -0.00052946 -0.00018158
 G2-31  -99.83852570 -14.04887739 -14.06054248 -0.51487652 -0.03436740 -0.08412891 -0.56854142 -0.08412891 -0.00019265 -0.00059233 -0.00019265
 G2-32  -100.26239696 -14.80400482 -14.78343077 -0.58089351 -0.03095373 -0.08335343 -0.58223606 -0.08335343 -0.00022552 -0.00066830 -0.00022552
 G2-33  -95.85995249 -13.10369025 -13.13500045 -0.45125892 -0.02305562 -0.08910709 -0.55950355 -0.08910709 -0.00016115 -0.00044969 -0.00016115
 G2-34  -96.60789532 -14.59596493 -14.58612302 -0.58508016 -0.02919656 -0.08703487 -0.59822755 -0.08703487 -0.00025842 -0.00074932 -0.00025842
 G2-35  -114.57843601 -14.69149587 -14.74023238 -0.48971840 -0.03151530 -0.09090550 -0.58188549 -0.10457400 -0.00010690 -0.00036040 -0.00015022
 G2-36  -133.34223272 -16.30345472 -16.36813351 -0.52840927 -0.03044639 -0.09483947 -0.57678538 -0.14900160 -0.00005906 -0.00027127 -0.00020529
 G2-37  -133.76712370 -17.04206040 -17.09324724 -0.59820556 -0.03508262 -0.10415136 -0.66897249 -0.10415136 -0.00012978 -0.00044358 -0.00012978
 G2-38  -178.82069569 -19.90085383 -19.97231912 -0.61312271 -0.03533210 -0.10761356 -0.69462368 -0.10761356 -0.00004025 -0.00020400 -0.00004025
 G2-39  -166.09278660 -21.57110554 -21.63608277 -0.73919070 -0.06011769 -0.14856191 -0.85625982 -0.14856191 -0.00029545 -0.00087294 -0.00029545
 G2-40  -295.72311581 -27.95078872 -27.86078091 -0.75757777 -0.02853954 -0.09058728 -0.52611694 -0.09058728 -0.00010143 -0.00513691 -0.00010143
 G2-41  -537.21767215 -40.50321765 -40.34870486 -1.00908582 -0.03111057 -0.17167640 -0.77907939 -0.11926643 -0.00341177 -0.00731501 -0.00125453
 G2-42  -636.29300645 -45.16506044 -44.98501952 -1.12667655 -0.03265559 -0.16915005 -0.89514329 -0.16915005 -0.00163870 -0.00475089 -0.00163870
 G2-43  -745.06622993 -49.99342754 -49.77832150 -1.22150059 -0.03419346 -0.18039414 -0.88525099 -0.18598576 -0.00088488 -0.00285426 -0.00144972
 G2-44  -863.94737466 -55.01242343 -54.75291953 -1.32540311 -0.03438318 -0.18207666 -0.95670723 -0.18207666 -0.00061507 -0.00182740 -0.00061507
 G2-45  -579.81436585 -41.60294106 -41.40661036 -1.04739086 -0.03687719 -0.13832318 -0.72388141 -0.13832318 -0.00032076 -0.00101229 -0.00032076
 G2-46  -335.31327340 -28.49777561 -28.45378965 -0.77661461 -0.04911791 -0.13315129 -0.73631476 -0.13315129 -0.00043306 -0.00124759 -0.00043306
 G2-47  -405.26932612 -30.05538482 -29.96020613 -0.79230232 -0.03455761 -0.12836213 -0.72106160 -0.12836213 -0.00069478 -0.00197308 -0.00069478
 G2-48  -439.19057238 -33.17916892 -33.10747173 -0.87328886 -0.03846463 -0.14076508 -0.74881892 -0.16517377 -0.00034061 -0.00106174 -0.00050274
 G2-49  -498.61899269 -35.63489938 -35.55115895 -0.92482693 -0.04500635 -0.14498414 -0.79401790 -0.15558512 -0.00028171 -0.00103837 -0.00045014
 G2-50  -521.37581213 -37.48689266 -37.39077014 -0.96962777 -0.04076402 -0.14605468 -0.81910061 -0.14605468 -0.00023697 -0.00075914 -0.00023697
 G2-51  -538.57581465 -42.75600127 -42.50699738 -1.19487121 -0.04328323 -0.13040024 -0.84509006 -0.13040024 -0.00095036 -0.00284397 -0.00095036
 G2-52  -465.36727868 -33.75187918 -33.58147301 -0.94287537 -0.02925467 -0.12305692 -0.73571385 -0.12305692 -0.00047035 -0.00132876 -0.00047035
 G2-53  -406.14669136 -31.58253733 -31.42503109 -0.92495802 -0.03041417 -0.11822163 -0.73263845 -0.11822163 -0.00061387 -0.00175595 -0.00061387
 G2-54  -498.85431262 -36.03079790 -35.92817130 -0.96178311 -0.03612364 -0.14464834 -0.81806850 -0.14464834 -0.00033164 -0.00102598 -0.00033164
 G2-55  -505.83286241 -41.41142580 -41.39578202 -1.16990416 -0.07024654 -0.21905865 -1.16385006 -0.21905865 -0.00060537 -0.00165736 -0.00060537
 G2-56  -289.11973825 -34.14839658 -34.15038658 -1.09070075 -0.07479659 -0.18395483 -1.07719923 -0.18395483 -0.00018021 -0.00047146 -0.00018021
 G2-57  -1316.78549618 -86.52252084 -86.08517433 -2.15602888 -0.06788666 -0.30229756 -1.56706833 -0.30229756 -0.00142994 -0.00365118 -0.00142994
 G2-58  -492.07813438 -48.46366662 -48.40820656 -1.40561488 -0.08881491 -0.22780070 -1.27248910 -0.22780070 -0.00020335 -0.00054798 -0.00020335
 G2-59  -1519.77784047 -100.87348959 -100.34956271 -2.47177353 -0.06732809 -0.33553339 -1.71887805 -0.33553339 -0.00137167 -0.00359702 -0.00137167
 G2-60  -390.35455695 -45.37645232 -45.41800016 -1.46968451 -0.10147443 -0.25464978 -1.45859420 -0.25464978 -0.00029087 -0.00073725 -0.00029087
 G2-61  -1760.58852325 -115.23363148 -114.70077962 -2.88007883 -0.09229166 -0.41725638 -2.14317891 -0.41725638 -0.00234543 -0.00584540 -0.00234543
 G2-62  -471.94850577 -38.34657918 -38.28268308 -1.08276621 -0.05865366 -0.18729914 -1.01845488 -0.18729914 -0.00088669 -0.00259028 -0.00088669
 G2-63  -777.78745324 -55.13483210 -54.94241029 -1.42776382 -0.05485980 -0.22802185 -1.18444937 -0.22802185 -0.00192414 -0.00572048 -0.00192414
 G2-64  -278.21096626 -33.46140603 -33.52174229 -1.10370444 -0.08390540 -0.20098182 -1.16030784 -0.20098182 -0.00027488 -0.00075717 -0.00027488
 G2-65  -626.29863775 -60.77980609 -60.70134959 -1.78268707 -0.10142474 -0.29040251 -1.61348861 -0.29040251 -0.00031562 -0.00080168 -0.00031562
 G2-66  -1996.54218246 -130.60896744 -129.93643825 -3.20572735 -0.08869661 -0.44502994 -2.24703373 -0.44502994 -0.00226264 -0.00568901 -0.00226264
 G2-67  -162.43577661 -21.26987881 -21.38173628 -0.74147774 -0.06180411 -0.16716236 -0.94300010 -0.16716236 -0.00049322 -0.00151652 -0.00049322
 G2-68  -546.58646921 -42.12012855 -42.10406370 -1.16236308 -0.08786651 -0.21477562 -1.17512054 -0.21477562 -0.00090506 -0.00292858 -0.00090506
 G2-69  -316.11379343 -36.48281161 -36.61314590 -1.17763998 -0.10628545 -0.22277850 -1.29494979 -0.22277850 -0.00027805 -0.00078722 -0.00027805
 G2-70  -586.39676318 -52.82855918 -52.77378765 -1.51512506 -0.09416370 -0.24909396 -1.37382076 -0.24909396 -0.00039055 -0.00107522 -0.00039055
 G2-71  -199.98108107 -24.31225855 -24.51329217 -0.81495974 -0.06475952 -0.20167523 -1.19243721 -0.20167523 -0.00044013 -0.00165100 -0.00044013
 G2-72  -245.48366219 -28.01598690 -28.15137050 -0.88906101 -0.07817030 -0.17143544 -1.04273863 -0.17143544 -0.00015633 -0.00054369 -0.00015633
 G2-73  -700.13440909 -57.43188603 -57.46257242 -1.61024564 -0.12794391 -0.28839861 -1.57604245 -0.28839861 -0.00055360 -0.00172994 -0.00055360
 G2-74  -423.00600508 -50.50352824 -50.57097864 -1.66401895 -0.12363925 -0.28919054 -1.69903229 -0.28919054 -0.00052214 -0.00146403 -0.00052214
 G2-75  -1793.24740912 -120.43304347 -119.90064874 -3.08267961 -0.10337507 -0.45296225 -2.36120875 -0.45296225 -0.00278480 -0.00698361 -0.00278480
 G2-76  -381.53052439 -47.02061982 -47.08237900 -1.57554488 -0.11276753 -0.28511352 -1.67520003 -0.28511352 -0.00064838 -0.00168947 -0.00064838
 G2-77  -98.98570691 -16.89499552 -16.85333583 -0.69178065 -0.03391153 -0.10219391 -0.72829570 -0.10219391 -0.00060532 -0.00170279 -0.00060532
 G2-78  -98.99079126 -16.88495443 -16.85255943 -0.69229823 -0.03614040 -0.09913026 -0.72407782 -0.09913026 -0.00068840 -0.00202847 -0.00068840
 G2-79  -98.92599877 -16.91205875 -16.86904798 -0.70485502 -0.03329269 -0.10051583 -0.72258364 -0.10051583 -0.00063900 -0.00173528 -0.00063900
 G2-80  -99.45288574 -17.63327172 -17.56459769 -0.75599996 -0.03601751 -0.09797618 -0.74913520 -0.09797618 -0.00066149 -0.00185409 -0.00066149
 G2-81  -99.39966267 -17.67280492 -17.59419203 -0.77085578 -0.03383851 -0.09994418 -0.73859016 -0.09994418 -0.00067424 -0.00175502 -0.00067424
 G2-82  -99.90370562 -18.37320649 -18.27396034 -0.82047337 -0.03637572 -0.09883478 -0.77497223 -0.09883478 -0.00070218 -0.00185613 -0.00070218
 G2-83  -132.14156561 -22.79477078 -22.73089861 -0.95186895 -0.04910865 -0.13277598 -0.97389788 -0.13277598 -0.00101219 -0.00311012 -0.00101219
 G2-84  -132.12277026 -22.80348900 -22.73427829 -0.95348091 -0.04688233 -0.13662568 -0.97102840 -0.13662568 -0.00090841 -0.00248743 -0.00090841
 G2-85  -132.07910123 -22.82407353 -22.75285386 -0.96688844 -0.04673901 -0.13465985 -0.96251518 -0.13465985 -0.00100916 -0.00269168 -0.00100916
 G2-86  -132.03760994 -22.84987801 -22.76837179 -0.98173628 -0.04459572 -0.13786037 -0.95907247 -0.13786037 -0.00105669 -0.00265890 -0.00105669
 G2-87  -132.08887798 -22.82381176 -22.74747962 -0.97123738 -0.04780629 -0.13500982 -0.96772406 -0.13500982 -0.00105714 -0.00277233 -0.00105714
 G2-88  -132.54187367 -23.56756863 -23.45873109 -1.03462652 -0.04729294 -0.13410258 -0.99050084 -0.13410258 -0.00105925 -0.00268674 -0.00105925
 G2-89  -132.59361409 -23.53396145 -23.43656884 -1.01806968 -0.04852667 -0.13367276 -0.99728562 -0.13367276 -0.00106652 -0.00283032 -0.00106652
 G2-90  -133.04168712 -24.27253263 -24.14406630 -1.08130957 -0.04848690 -0.13334216 -1.02264587 -0.13334216 -0.00106345 -0.00272149 -0.00106345
 G2-91  -133.04516347 -24.26948135 -24.14096262 -1.08219324 -0.04867262 -0.13447268 -1.02491345 -0.13447268 -0.00112670 -0.00284765 -0.00112670
 G2-92  -165.17054766 -28.76451066 -28.65316608 -1.24223092 -0.05702070 -0.17118862 -1.19975913 -0.17118862 -0.00141257 -0.00350010 -0.00141257
 G2-93  -197.49827680 -33.22659629 -33.13979420 -1.37281319 -0.06288643 -0.21292948 -1.38269209 -0.21292948 -0.00232499 -0.00522144 -0.00232499
 G2-94  -211.98517902 -25.96438039 -25.97000521 -0.88021897 -0.05965498 -0.14133749 -0.87406750 -0.14133749 -0.00019323 -0.00054806 -0.00019323
 G2-95  -301.17503973 -35.66599941 -35.69213654 -1.17429449 -0.08272498 -0.19882852 -1.16870896 -0.19882852 -0.00024588 -0.00064744 -0.00024588
 G2-96  -897.10913205 -60.91938166 -60.62558216 -1.58722672 -0.04929091 -0.21862994 -1.19752608 -0.21862994 -0.00095203 -0.00252509 -0.00095203
 G2-97  -1328.85029700 -88.07962477 -87.66566874 -2.23306221 -0.07091996 -0.31704047 -1.66694871 -0.31704047 -0.00158139 -0.00403573 -0.00158139
 G2-98  -81.68778395 -13.54525856 -13.50334004 -0.57263666 -0.02716740 -0.07574623 -0.56151592 -0.07574623 -0.00030727 -0.00088609 -0.00030727
 G2-99  -113.98737380 -17.95554331 -17.94114673 -0.70167165 -0.03743920 -0.11406551 -0.77048457 -0.11406551 -0.00048919 -0.00136176 -0.00048919
G2-100  -214.55225499 -29.14663332 -29.23007563 -1.07446292 -0.07659480 -0.20090873 -1.23058417 -0.20090873 -0.00067353 -0.00192456 -0.00067353
G2-101  -214.59442444 -29.09681390 -29.18600631 -1.06778966 -0.08909738 -0.20428749 -1.23534287 -0.20428749 -0.00072256 -0.00189973 -0.00072256
G2-102  -302.66327439 -27.63064173 -27.46893439 -0.87678612 -0.03345741 -0.09785144 -0.68595085 -0.09785144 -0.00059331 -0.00175083 -0.00059331
G2-103  -166.50378687 -22.29403200 -22.33123031 -0.80144426 -0.06001127 -0.14327946 -0.87323826 -0.14327946 -0.00033792 -0.00093781 -0.00033792
G2-104  -199.63600435 -28.18431104 -28.19609942 -1.05900131 -0.07463291 -0.17675947 -1.12326536 -0.17675947 -0.00063888 -0.00167289 -0.00063888
G2-105  -181.05317547 -26.95738925 -26.94148360 -1.05470761 -0.06747938 -0.16837942 -1.08969305 -0.16837942 -0.00074245 -0.00195767 -0.00074245
G2-106  -114.33808803 -18.72112853 -18.67600428 -0.78154851 -0.03825829 -0.11146643 -0.78007201 -0.11146643 -0.00059363 -0.00158239 -0.00059363
G2-107  -161.19916379 -23.40569729 -23.46616406 -0.84068541 -0.05492745 -0.17100767 -1.04753891 -0.17100767 -0.00077954 -0.00235975 -0.00077954
G2-108  -114.82248263 -19.43779250 -19.36895702 -0.83234355 -0.04108989 -0.10978155 -0.80919151 -0.10978155 -0.00063233 -0.00168129 -0.00063233
G2-109  -114.83115053 -19.44148926 -19.37150049 -0.83326469 -0.04015155 -0.11052592 -0.80940162 -0.11052592 -0.00063710 -0.00169191 -0.00063710
G2-110  -132.53353659 -19.21413402 -19.23392158 -0.71550315 -0.04978160 -0.12444841 -0.79070967 -0.12444841 -0.00048187 -0.00144270 -0.00048187
G2-111  -132.92325252 -19.96769100 -19.94911165 -0.78790446 -0.04479061 -0.11989746 -0.80733556 -0.11989746 -0.00047537 -0.00129898 -0.00047537
G2-112  -132.98732380 -19.95094741 -19.93617329 -0.77611012 -0.04895681 -0.11954511 -0.81209697 -0.11954511 -0.00047289 -0.00130881 -0.00047289
G2-113  -199.20367394 -27.42131787 -27.46180403 -0.99017138 -0.07000971 -0.17351877 -1.10523249 -0.17351877 -0.00056033 -0.00158490 -0.00056033
G2-114  -133.40569535 -20.70322998 -20.65384664 -0.84147866 -0.04370071 -0.11784539 -0.82911704 -0.11784539 -0.00051548 -0.00138781 -0.00051548
G2-115  -133.39988688 -20.69000346 -20.64445536 -0.83858885 -0.04669142 -0.11673781 -0.83050117 -0.11673781 -0.00051508 -0.00139067 -0.00051508
G2-116  -438.80276973 -36.77094675 -36.61077920 -1.13485002 -0.04129514 -0.15692920 -0.95684096 -0.15692920 -0.00106184 -0.00284809 -0.00106184
G2-117  -505.88615185 -45.70855429 -45.57112725 -1.47004750 -0.07954150 -0.21943301 -1.32463900 -0.21943301 -0.00127362 -0.00335140 -0.00127362
G2-118  -439.28700507 -37.47972919 -37.29383136 -1.18562920 -0.04283728 -0.15313826 -0.98152866 -0.15313826 -0.00098741 -0.00265440 -0.00098741
G2-119  -439.28426105 -37.47932984 -37.29662017 -1.18494293 -0.04370226 -0.15382312 -0.98446385 -0.15382312 -0.00102172 -0.00273811 -0.00102172
G2-120  -155.49115195 -21.42482335 -21.41197972 -0.78640390 -0.05004297 -0.11998302 -0.80259916 -0.11998302 -0.00038931 -0.00115324 -0.00038931
G2-121  -498.51088459 -39.64844710 -39.45020700 -1.20337890 -0.04216132 -0.15800921 -0.98395957 -0.15800921 -0.00082023 -0.00218305 -0.00082023
G2-122  -498.05309801 -38.90833213 -38.74362224 -1.14032037 -0.04329826 -0.15879922 -0.96275231 -0.15879922 -0.00080274 -0.00222340 -0.00080274
G2-123  -146.67186206 -23.11223551 -23.10395730 -0.89656649 -0.05098590 -0.14871852 -0.99885363 -0.14871852 -0.00081340 -0.00237078 -0.00081340
G2-124  -166.13032358 -25.85658933 -25.81223903 -1.03797123 -0.06094799 -0.15454088 -1.05677120 -0.15454088 -0.00081506 -0.00213564 -0.00081506
G2-125  -199.64489154 -28.20436404 -28.20981779 -1.06308560 -0.07097266 -0.17698439 -1.11387791 -0.17698439 -0.00062599 -0.00164785 -0.00062599
G2-126  -222.18077714 -29.65850553 -29.66917681 -1.07016904 -0.07467179 -0.17899880 -1.11203445 -0.17899880 -0.00051109 -0.00136414 -0.00051109
G2-127  -564.75049233 -47.11650023 -46.98588386 -1.42148298 -0.07333256 -0.22006683 -1.28286213 -0.22006683 -0.00101717 -0.00272227 -0.00101717
G2-128  -531.64870082 -45.54808111 -45.32055058 -1.46413129 -0.05417681 -0.19256138 -1.23181750 -0.19256138 -0.00118093 -0.00304554 -0.00118093
G2-129  -166.55097141 -26.59931563 -26.52127370 -1.10309821 -0.05661652 -0.15359611 -1.07889765 -0.15359611 -0.00090556 -0.00231172 -0.00090556
G2-130  -166.54233565 -26.59005263 -26.51544361 -1.09932289 -0.05921519 -0.15141156 -1.07773929 -0.15141156 -0.00083918 -0.00217881 -0.00083918
G2-131  -147.96239977 -25.32656557 -25.23109030 -1.09330810 -0.05555832 -0.14573754 -1.06084998 -0.14573754 -0.00106839 -0.00270252 -0.00106839
G2-132  -198.30483402 -30.34930052 -30.32447665 -1.19601362 -0.06370393 -0.19700143 -1.24202396 -0.19700143 -0.00137998 -0.00325838 -0.00137998
G2-133  -504.17441987 -47.14998721 -46.98803924 -1.54354843 -0.06289082 -0.23796425 -1.39971574 -0.23796425 -0.00228244 -0.00538319 -0.00228244
G2-134  -179.71878938 -29.11886427 -29.06607748 -1.19121109 -0.05623369 -0.18930419 -1.21105389 -0.18930419 -0.00156343 -0.00364626 -0.00156343
G2-135  -212.43813397 -34.28079690 -34.22663263 -1.38352657 -0.06797696 -0.22507366 -1.42373268 -0.22507366 -0.00217049 -0.00489271 -0.00217049
G2-136  -0.47598819 -0.65615753 -0.64716235 -0.04296537 -0.00193320 0.00000000 -0.04585951 0.00000000 0.00000000 -0.00003963 0.00000000
G2-137  -372.75478127 -25.33413328 -25.20149593 -0.62510232 -0.01570101 -0.08832436 -0.43645039 -0.06657527 -0.00030211 -0.00071477 -0.00014636
G2-138  -65.54315626 -10.60824843 -10.59940681 -0.38699259 -0.02132706 -0.07250446 -0.44536035 -0.05656478 -0.00031745 -0.00087152 -0.00025879
G2-139  -66.04541401 -11.34932347 -11.31717441 -0.45487818 -0.02498985 -0.06851143 -0.46292967 -0.05312172 -0.00036576 -0.00098234 -0.00028792
G2-140  -132.76033902 -19.55747823 -19.55645518 -0.73829531 -0.05005683 -0.12095119 -0.78492198 -0.12170901 -0.00048072 -0.00123452 -0.00042735
G2-141  -100.01098896 -14.42631334 -14.41566103 -0.54345271 -0.03368780 -0.08726241 -0.54465280 -0.07677917 -0.00022725 -0.00058666 -0.00018684
G2-142  -100.03057024 -14.39923737 -14.38665455 -0.53979212 -0.04312387 -0.08279737 -0.53398510 -0.07275532 -0.00018990 -0.00063019 -0.00023799
G2-143  -133.17633501 -20.29283170 -20.25540536 -0.80048471 -0.06062803 -0.11742167 -0.78469489 -0.10959568 -0.00047116 -0.00136626 -0.00055145
G2-144  -405.89678332 -31.22583906 -31.07260601 -0.88581464 -0.03191806 -0.12222164 -0.69039775 -0.10475000 -0.00061166 -0.00154335 -0.00048096
G2-145  -66.50282868 -12.10388500 -12.03904649 -0.52051817 -0.02511822 -0.07064986 -0.48268518 -0.05014182 -0.00038661 -0.00093146 -0.00028026
G2-146  -99.64525510 -18.00094651 -17.91055169 -0.78232948 -0.03865398 -0.10497075 -0.73153922 -0.08614232 -0.00072808 -0.00172652 -0.00058596
G2-147  -132.78892627 -23.89687541 -23.78020523 -1.04456942 -0.05205141 -0.14057242 -0.98200592 -0.12252632 -0.00115940 -0.00268880 -0.00096745
G2-148  -181.21072111 -22.84868784 -22.98054280 -0.77829269 -0.06517825 -0.16245529 -0.97553943 -0.19471139 -0.00030535 -0.00116942 -0.00048837
G2-149  -132.12893473 -22.78694548 -22.72656803 -0.95303037 -0.04869338 -0.13395960 -0.97130944 -0.13395960 -0.00103467 -0.00288343 -0.00103467
G2-150  -165.27965112 -28.69656410 -28.60313699 -1.21501399 -0.06154435 -0.16902839 -1.22325349 -0.16902839 -0.00150255 -0.00422585 -0.00150255
G2-151  -165.69009716 -29.48798544 -29.34395447 -1.29974174 -0.05915203 -0.17023394 -1.23570197 -0.17023394 -0.00151820 -0.00371629 -0.00151820
G2-152  -166.17982451 -30.17160996 -30.01398435 -1.34210070 -0.06059523 -0.16785951 -1.27043005 -0.16785951 -0.00143996 -0.00361746 -0.00143996
G2-153  -166.18691242 -30.16477558 -30.00639946 -1.34516432 -0.06096494 -0.17128262 -1.27785534 -0.17128262 -0.00163984 -0.00401889 -0.00163984
G2-154  -197.92672107 -33.92234278 -33.81214114 -1.43400339 -0.07133726 -0.20657829 -1.43272989 -0.20657829 -0.00203396 -0.00503745 -0.00203396
G2-155  -197.92414659 -33.92766852 -33.81385988 -1.43437249 -0.07127215 -0.20412623 -1.42843859 -0.20412623 -0.00194413 -0.00493564 -0.00194413
G2-156  -198.82747682 -35.39636457 -35.22034279 -1.56314136 -0.07207797 -0.20550472 -1.48380410 -0.20550472 -0.00200427 -0.00486376 -0.00200427
G2-157  -199.31786501 -36.07078621 -35.88398511 -1.60291001 -0.07269683 -0.20239364 -1.51823500 -0.20239364 -0.00182304 -0.00452647 -0.00182304
G2-158  -199.31664548 -36.06794599 -35.88127338 -1.60543799 -0.07321150 -0.20469796 -1.52332564 -0.20469796 -0.00198414 -0.00484556 -0.00198414
G2-159  -230.63815203 -39.12557244 -39.01100554 -1.63473105 -0.07570977 -0.24889669 -1.63279383 -0.24889669 -0.00279510 -0.00632013 -0.00279510
G2-160  -232.45594271 -41.96993065 -41.75395068 -1.86370616 -0.08479663 -0.23692667 -1.76604809 -0.23692667 -0.00220884 -0.00544090 -0.00220884
G2-161  -263.29984017 -44.24435815 -44.14260043 -1.82730668 -0.09752351 -0.27851547 -1.88328696 -0.27851547 -0.00316626 -0.00791496 -0.00316626
G2-162  -265.59399239 -47.86910064 -47.62393968 -2.12451638 -0.09689939 -0.27146465 -2.01386980 -0.27146465 -0.00259606 -0.00635818 -0.00259606
G2-163  -328.67900189 -54.70391276 -54.57685396 -2.25080434 -0.10664027 -0.36353047 -2.28056113 -0.36353047 -0.00495773 -0.01098120 -0.00495773
G2-164  -328.65608352 -54.65449657 -54.55369267 -2.24778637 -0.11166076 -0.37186289 -2.31532861 -0.37186289 -0.00589884 -0.01363466 -0.00589884
G2-165  -232.77636583 -34.09449992 -34.07426626 -1.32085840 -0.08558844 -0.21063962 -1.36429338 -0.21063962 -0.00096296 -0.00245360 -0.00096296
G2-166  -199.69457551 -32.49571357 -32.38779108 -1.36569554 -0.06875372 -0.19001057 -1.33081553 -0.19001057 -0.00136923 -0.00338386 -0.00136923
G2-167  -245.55918264 -40.20584993 -40.12277712 -1.64987322 -0.08224052 -0.26159496 -1.66842871 -0.26159496 -0.00274726 -0.00627856 -0.00274726
G2-168  -264.14044361 -41.45773176 -41.39653160 -1.65800692 -0.08679260 -0.26922009 -1.68964733 -0.26922009 -0.00257602 -0.00583615 -0.00257602
G2-169  -198.77749664 -31.01384466 -30.97809874 -1.23392669 -0.07475101 -0.18754800 -1.28040985 -0.18754800 -0.00110144 -0.00305953 -0.00110144
G2-170  -199.19293772 -31.80934359 -31.71871533 -1.31774383 -0.06945309 -0.18823452 -1.28996129 -0.18823452 -0.00126162 -0.00311602 -0.00126162
G2-171  -231.91598205 -36.97557251 -36.88655536 -1.51742973 -0.08415343 -0.22612292 -1.51695740 -0.22612292 -0.00161590 -0.00395794 -0.00161590
G2-172  -330.38040534 -48.88720438 -48.89536534 -1.86569415 -0.12413082 -0.31932100 -2.01951925 -0.31932100 -0.00249547 -0.00701022 -0.00249547
G2-173  -227.38058026 -35.33727437 -35.31329315 -1.39441199 -0.07355332 -0.23660804 -1.46206811 -0.23660804 -0.00199607 -0.00451131 -0.00199607
G2-174  -572.45947923 -54.02337016 -53.90138581 -1.76351021 -0.10150368 -0.28007950 -1.63563594 -0.28007950 -0.00137438 -0.00351327 -0.00137438
G2-175  -629.23923687 -60.40064159 -60.19000759 -2.01890971 -0.08286366 -0.30994598 -1.84642659 -0.30994598 -0.00296544 -0.00675689 -0.00296544
G2-176  -227.48355660 -35.23110197 -35.21571051 -1.36312932 -0.07488104 -0.23236936 -1.51157298 -0.23236936 -0.00127713 -0.00330377 -0.00127713
G2-177  -227.37899149 -35.32948538 -35.30943255 -1.39382647 -0.07150212 -0.23741480 -1.46648829 -0.23741480 -0.00203974 -0.00462790 -0.00203974
G2-178  -198.34770840 -30.26668172 -30.25888296 -1.16808540 -0.07451349 -0.19493369 -1.27210883 -0.19493369 -0.00112095 -0.00305191 -0.00112095
G2-179  -198.81418221 -31.01468197 -30.97707279 -1.23349137 -0.07584128 -0.18964397 -1.28422480 -0.18964397 -0.00115684 -0.00327479 -0.00115684
G2-180  -332.14681188 -47.48082520 -47.48893822 -1.80009920 -0.12474462 -0.30386637 -1.89886135 -0.30386637 -0.00144245 -0.00360060 -0.00144245
G2-181  -504.62678472 -47.85829748 -47.66262368 -1.60044114 -0.06697374 -0.22678868 -1.42248048 -0.22678868 -0.00196749 -0.00497652 -0.00196749
G2-182  -180.26536003 -29.75302687 -29.68013134 -1.22275942 -0.06182370 -0.18349467 -1.26759201 -0.18349467 -0.00121589 -0.00309681 -0.00121589
G2-183  -199.26582604 -31.75849995 -31.68446047 -1.29953879 -0.07328987 -0.18934082 -1.30480768 -0.18934082 -0.00119842 -0.00304004 -0.00119842
G2-184  -199.26359635 -31.74906546 -31.67601191 -1.29816269 -0.07327390 -0.18964331 -1.30985858 -0.18964331 -0.00123222 -0.00310655 -0.00123222
G2-185  -265.83711840 -40.02537568 -39.95987768 -1.59844002 -0.09486392 -0.24205411 -1.59653081 -0.24205411 -0.00148817 -0.00364974 -0.00148817
G2-186  -505.07855972 -48.59397740 -48.36703375 -1.66482342 -0.06711326 -0.22704177 -1.44860037 -0.22704177 -0.00197973 -0.00490871 -0.00197973
G2-187  -564.79839357 -51.43886814 -51.18267775 -1.72771417 -0.06748652 -0.23090785 -1.48808882 -0.23090785 -0.00179165 -0.00444473 -0.00179165
G2-188  -564.78659795 -51.44739854 -51.19071947 -1.72486287 -0.06629321 -0.22708193 -1.47970201 -0.22708193 -0.00155884 -0.00394433 -0.00155884
G2-189  -180.61524919 -30.55270993 -30.43892680 -1.31143492 -0.06437768 -0.18131710 -1.26979912 -0.18131710 -0.00142816 -0.00350599 -0.00142816
G2-190  -313.97091786 -46.84603997 -46.84146427 -1.85898024 -0.11411032 -0.30729126 -1.97862311 -0.30729126 -0.00196934 -0.00492567 -0.00196934
G2-191  -199.68447122 -32.49033885 -32.38655989 -1.36003757 -0.07164988 -0.18609151 -1.32504530 -0.18609151 -0.00118442 -0.00300884 -0.00118442
G2-192  -266.32094465 -40.71355752 -40.63319357 -1.64255351 -0.09434879 -0.24142025 -1.63367597 -0.24142025 -0.00146378 -0.00360906 -0.00146378
G2-193  -505.57299064 -49.26798171 -49.02438298 -1.71067608 -0.06808184 -0.22677078 -1.48761274 -0.22677078 -0.00204279 -0.00507877 -0.00204279
G2-194  -878.08878031 -74.28151722 -73.93593905 -2.33260582 -0.09145247 -0.31690828 -1.94729774 -0.31690828 -0.00282336 -0.00714793 -0.00282336
G2-195  -181.11667159 -31.23460739 -31.10491623 -1.35786238 -0.06447864 -0.18278252 -1.31163624 -0.18278252 -0.00153893 -0.00378240 -0.00153893
G2-196  -402.08618504 -45.36531509 -45.11749183 -1.66151574 -0.06680597 -0.20703088 -1.43409489 -0.20703088 -0.00179189 -0.00452438 -0.00179189
G2-197  -537.31419521 -53.05033840 -52.86021927 -1.80484213 -0.07575378 -0.27334759 -1.64887774 -0.27334759 -0.00274578 -0.00648639 -0.00274578
G2-198  -212.85497333 -35.01250393 -34.93293081 -1.45079262 -0.06927615 -0.22429174 -1.46173318 -0.22429174 -0.00199920 -0.00467394 -0.00199920
G2-199  -232.33275317 -37.71165260 -37.59078893 -1.58090372 -0.08341803 -0.22387855 -1.53991866 -0.22387855 -0.00174374 -0.00425066 -0.00174374
G2-200  -232.40133069 -37.66032093 -37.55657325 -1.56105743 -0.08556303 -0.22414399 -1.55293443 -0.22414399 -0.00159721 -0.00397477 -0.00159721
G2-201  -299.05999035 -45.89320402 -45.81482745 -1.84360949 -0.11066398 -0.28146729 -1.86263925 -0.28146729 -0.00178801 -0.00438867 -0.00178801
G2-202  -538.21344915 -54.49793073 -54.24071459 -1.92783861 -0.08051894 -0.26232048 -1.69738322 -0.26232048 -0.00248604 -0.00608822 -0.00248604
G2-203  -213.75207057 -36.45865006 -36.31404486 -1.57487453 -0.07742395 -0.21694284 -1.51908142 -0.21694284 -0.00191801 -0.00465672 -0.00191801
G2-204  -232.82129108 -38.38552791 -38.25192357 -1.62502600 -0.08378340 -0.22453624 -1.58225921 -0.22453624 -0.00180840 -0.00440127 -0.00180840
G2-205  -375.85399421 -52.61317036 -52.58128817 -1.95702949 -0.11549254 -0.32612362 -1.98074404 -0.32612362 -0.00243168 -0.00549295 -0.00243168
G2-206  -375.85270208 -52.61321295 -52.58167278 -1.95681722 -0.11488208 -0.32600822 -1.98146484 -0.32600822 -0.00243428 -0.00548896 -0.00243428
G2-207  -286.67673397 -42.91967481 -42.86055002 -1.66488347 -0.08926621 -0.26961938 -1.68208779 -0.26961938 -0.00238144 -0.00536076 -0.00238144
G2-208  -265.96756348 -44.28448615 -44.12264781 -1.88402640 -0.09671750 -0.25843570 -1.82739554 -0.25843570 -0.00216148 -0.00524142 -0.00216148
G2-209  -765.10914416 -73.09626187 -73.03392063 -2.17165280 -0.13009792 -0.36251286 -1.99120596 -0.36251286 -0.00047874 -0.00118743 -0.00047874
G2-210  -908.75726849 -85.41637746 -85.40232804 -2.55980482 -0.15936375 -0.44073744 -2.40095751 -0.44073744 -0.00070092 -0.00173290 -0.00070092
G2-211  -1272.51303842 -90.46634712 -90.08173535 -2.31863464 -0.06755974 -0.35005471 -1.74319124 -0.35005471 -0.00519848 -0.01347491 -0.00519848
G2-212  -572.39644704 -49.68734258 -49.69620515 -1.46152620 -0.09968326 -0.27736738 -1.47072462 -0.27736738 -0.00071213 -0.00197955 -0.00071213
G2-213  -1236.48158060 -80.01968338 -79.65772260 -1.95083614 -0.06189482 -0.27598540 -1.42004853 -0.27598540 -0.00143324 -0.00397037 -0.00143324
G2-214  -1680.68401154 -113.51941009 -113.03991360 -2.86853550 -0.10929379 -0.42819266 -2.17590058 -0.42819266 -0.00212757 -0.00546057 -0.00212757
G2-215  -2477.95159158 -160.31116994 -159.54354775 -3.94058283 -0.12201598 -0.56657745 -2.83277728 -0.56657745 -0.00377960 -0.00942776 -0.00377960
G2-216  -1369.68351736 -96.52486770 -96.23958427 -2.52969208 -0.12118817 -0.41004853 -2.09982417 -0.41004853 -0.00184128 -0.00492742 -0.00184128
G2-217  -1614.09463918 -105.20212511 -104.70874399 -2.57728095 -0.08330185 -0.36559397 -1.85399362 -0.36559397 -0.00217026 -0.00575477 -0.00217026
G2-218  -1609.02037667 -105.00696111 -104.56009972 -2.57691320 -0.09619272 -0.37825141 -1.90977225 -0.37825141 -0.00275970 -0.00750162 -0.00275970
G2-219  -1132.61543318 -75.38222659 -75.02253159 -1.84625266 -0.05921707 -0.25526690 -1.32129239 -0.25526690 -0.00134389 -0.00371133 -0.00134389
G2-220  -732.91662663 -62.83140864 -62.73429903 -1.82127099 -0.10266352 -0.29479716 -1.63010440 -0.29479716 -0.00064344 -0.00167287 -0.00064344
G2-221  -601.86000678 -70.65140629 -70.71552030 -2.31219757 -0.16487957 -0.40232697 -2.30662699 -0.40232697 -0.00070482 -0.00171113 -0.00070482
G2-222  -300.92129387 -35.27316796 -35.31472758 -1.13535536 -0.08806055 -0.19948815 -1.13520207 -0.19809945 -0.00024043 -0.00058442 -0.00020734
G2-223  -197.23070690 -32.83901962 -32.76485414 -1.33308591 -0.06769651 -0.21924402 -1.34800016 -0.20489526 -0.00235406 -0.00524184 -0.00231554
# Non Hydrogon Local Minimums : 31
# Non Hydrogon Transition States : 15
# Hydrogon Local Minimums : 21
# Hydrogon Transition States : 19
NHL1  -0.19252001 -0.30666480 -0.30157884 -0.00571413 -0.00105001 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
NHL2  -95.85783123 -13.10618784 -13.13698884 -0.45134727 -0.02300469 -0.08888773 -0.55845044 -0.08888773 -0.00016036 -0.00044721 -0.00016036
NHL3  -95.99272608 -13.44628863 -13.47859685 -0.48045829 -0.03098145 -0.08757560 -0.55800454 -0.08968983 -0.00020294 -0.00060707 -0.00021652
NHL4  -99.45842930 -13.29950748 -13.32084476 -0.44820879 -0.02958785 -0.08318696 -0.53049509 -0.08318696 -0.00014729 -0.00041202 -0.00014729
NHL5  -99.60916826 -13.65806334 -13.68229884 -0.47781914 -0.03463106 -0.08387190 -0.54136048 -0.08928729 -0.00018067 -0.00052615 -0.00018046
NHL6  -66.30843342 -11.73633475 -11.69490335 -0.49475105 -0.02299791 -0.06304250 -0.50323095 -0.06304250 -0.00034213 -0.00104655 -0.00034213
NHL7  -66.49394713 -12.11327156 -12.04738003 -0.52079784 -0.02495450 -0.07058366 -0.48185656 -0.05003941 -0.00038364 -0.00092128 -0.00027754
NHL8  -33.35760591 -6.21152463 -6.17056343 -0.25903307 -0.01061268 -0.03760387 -0.23391524 -0.01413909 -0.00013307 -0.00029822 -0.00005268
NHL9  -99.62742759 -18.01636097 -17.92154787 -0.78124484 -0.03764862 -0.10569416 -0.72962497 -0.08368354 -0.00073250 -0.00171396 -0.00057444
NHL10 -80.84696935 -12.04207290 -12.05610010 -0.44011395 -0.02406588 -0.08042708 -0.53243687 -0.08042708 -0.00024165 -0.00070073 -0.00024165
NHL11 -80.83024282 -12.04302197 -12.04916491 -0.43992703 -0.02512738 -0.07524800 -0.51001763 -0.07524800 -0.00023462 -0.00066736 -0.00023462
NHL12 -89.22744283 -10.20535557 -10.23971011 -0.32483433 -0.03163579 -0.06362051 -0.35734067 -0.06362051 -0.00000880 -0.00004675 -0.00000880
NHL13 -122.79400768 -16.27479295 -16.25627672 -0.58868852 -0.03451089 -0.08471087 -0.57693106 -0.08471087 -0.00014839 -0.00045969 -0.00014839
NHL14 -212.04347440 -26.46987361 -26.49510545 -0.91667502 -0.09417270 -0.15283900 -0.94833137 -0.15283900 -0.00025983 -0.00076512 -0.00025983
NHL15 -431.85089245 -27.70457441 -27.56642155 -0.67745709 -0.01994968 -0.09402227 -0.48525193 -0.09402227 -0.00025675 -0.00085150 -0.00025675
NHL16 -465.35611750 -33.76350149 -33.59163197 -0.94375331 -0.02901202 -0.12305807 -0.73450109 -0.12305807 -0.00046684 -0.00131186 -0.00046684
NHL17 -897.21926343 -61.46493410 -61.15978594 -1.62422097 -0.06009653 -0.22008610 -1.22662226 -0.22008610 -0.00099850 -0.00278525 -0.00099850
NHL18 -554.61815415 -43.94480870 -43.82327503 -1.27178409 -0.11032168 -0.19337211 -1.11318236 -0.19337211 -0.00066419 -0.00192647 -0.00066419
NHL19 -554.65046559 -43.98308022 -43.82843128 -1.26909628 -0.05807156 -0.18088067 -1.06760125 -0.18088067 -0.00058665 -0.00169239 -0.00058665
NHL20 -66.69910925 -8.69662682 -8.73537057 -0.31279718 -0.02775534 -0.06370651 -0.37437946 -0.06370651 -0.00004837 -0.00022409 -0.00004837
NHL21 -100.25222301 -14.81495874 -14.79302533 -0.58121022 -0.03074968 -0.08319450 -0.58100718 -0.08319450 -0.00022298 -0.00065878 -0.00022298
NHL22 -189.51116694 -25.02368941 -25.04396156 -0.91662647 -0.07151445 -0.15238859 -0.94882235 -0.15238859 -0.00036840 -0.00104422 -0.00036840
NHL23 -189.51278565 -24.96608826 -24.99233428 -0.90431269 -0.08105232 -0.15209321 -0.96218323 -0.15209321 -0.00034591 -0.00102968 -0.00034591
NHL24 -162.42818437 -21.27913673 -21.38861812 -0.74178669 -0.06170149 -0.16601755 -0.93781873 -0.16601755 -0.00048355 -0.00148429 -0.00048355
NHL25 -66.87655841 -8.53279113 -8.52368643 -0.27913173 -0.01458443 -0.05166108 -0.26769217 -0.02521496 -0.00002790 -0.00008924 -0.00001742
NHL26 -178.82456842 -19.89608891 -19.96903490 -0.61271554 -0.03547980 -0.10781241 -0.69769512 -0.10781241 -0.00004046 -0.00020829 -0.00004046
NHL27 -89.66277892 -10.38361467 -10.38952426 -0.33474255 -0.01860268 -0.05509028 -0.33267695 -0.05509028 -0.00001612 -0.00006033 -0.00001612
NHL28 -521.36959096 -37.49404372 -37.39615331 -0.97027382 -0.04055100 -0.14586046 -0.81644762 -0.14586046 -0.00023518 -0.00074753 -0.00023518
NHL29 -432.22724018 -27.86310916 -27.71667049 -0.68622671 -0.01548791 -0.09016258 -0.48571544 -0.09016258 -0.00019685 -0.00059511 -0.00019685
NHL30 -89.39831612 -9.99546843 -9.97409800 -0.28915912 -0.01423528 -0.05044086 -0.25118207 -0.02528484 -0.00000631 -0.00001979 -0.00000411
NHL31 -431.96101316 -27.50709979 -27.35681617 -0.64311063 -0.01409883 -0.09217122 -0.43744134 -0.06997414 -0.00017154 -0.00040215 -0.00009206
NHT1  -96.02868969 -13.38615700 -13.43504271 -0.47360616 -0.03015923 -0.09575033 -0.57562859 -0.08996276 -0.00026353 -0.00071128 -0.00019761
NHT2  -99.64870364 -13.58542461 -13.61630091 -0.46495377 -0.03732195 -0.08631152 -0.54309164 -0.08532282 -0.00020469 -0.00060020 -0.00017019
NHT3  -66.50408928 -12.02397749 -11.98453380 -0.50935156 -0.02962454 -0.06759643 -0.50985667 -0.06219930 -0.00044298 -0.00132580 -0.00037978
NHT4  -99.65506327 -17.92265006 -17.86060275 -0.76713072 -0.04613084 -0.10961279 -0.76204553 -0.08627155 -0.00080178 -0.00228443 -0.00065942
NHT5  -80.83009432 -11.97976634 -11.99950054 -0.44033427 -0.02602894 -0.08096311 -0.53073065 -0.08096311 -0.00027597 -0.00075644 -0.00027597
NHT6  -212.05448577 -26.41632415 -26.47258133 -0.91707898 -0.09973984 -0.16155672 -0.99249508 -0.16155672 -0.00030184 -0.00104009 -0.00030184
NHT7  -897.23813112 -61.40878708 -61.13178391 -1.62208573 -0.07243142 -0.22648524 -1.25893486 -0.22648524 -0.00118913 -0.00387376 -0.00118913
NHT8  -554.64104893 -43.90991845 -43.80327592 -1.27009112 -0.10097896 -0.19608756 -1.13344186 -0.19608756 -0.00072082 -0.00236054 -0.00072082
NHT9  -189.51643902 -24.92016573 -24.98048948 -0.90652408 -0.09397142 -0.16229617 -1.00905559 -0.16229617 -0.00043536 -0.00147794 -0.00043536
NHT10 -162.62633503 -21.52544258 -21.65625173 -0.75925729 -0.06173203 -0.18146654 -0.95163143 -0.15718549 -0.00082951 -0.00185874 -0.00043846
NHT11 -123.01042147 -16.47425850 -16.49748858 -0.60106617 -0.03844154 -0.10704940 -0.61748219 -0.08225695 -0.00035670 -0.00088602 -0.00014366
NHT12 -179.02821360 -20.15988981 -20.26705309 -0.62596100 -0.04924564 -0.12427663 -0.71706541 -0.11024925 -0.00010018 -0.00050644 -0.00004868
NHT13 -554.75329156 -43.63657345 -43.54614669 -1.23370549 -0.05653280 -0.20343146 -1.08870132 -0.16419364 -0.00073169 -0.00204601 -0.00039858
NHT14 -432.40585710 -28.12660091 -28.00035331 -0.70799670 -0.02096754 -0.09927106 -0.51333432 -0.09229428 -0.00040511 -0.00111241 -0.00024548
NHT15 -89.86496724 -10.58350764 -10.62787314 -0.35044396 -0.02041772 -0.06864457 -0.36018542 -0.05660146 -0.00013439 -0.00029233 -0.00002021
HL1   -0.19252001 -0.30666480 -0.30157884 -0.00571413 -0.00105001 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
HL2   -432.22724018 -27.86310916 -27.71667049 -0.68622671 -0.01548791 -0.09016258 -0.48571544 -0.09016258 -0.00019685 -0.00059511 -0.00019685
HL3   -0.47567584 -0.65648193 -0.64745941 -0.04297025 -0.00193154 0.00000000 -0.04583851 0.00000000 0.00000000 -0.00003952 0.00000000
HL4   -431.96101316 -27.50709979 -27.35681617 -0.64311063 -0.01409883 -0.09217122 -0.43744134 -0.06997414 -0.00017154 -0.00040215 -0.00009206
HL5   -66.87655841 -8.53279113 -8.52368643 -0.27913173 -0.01458443 -0.05166108 -0.26769217 -0.02521496 -0.00002790 -0.00008924 -0.00001742
HL6   -67.12899702 -8.91895281 -8.92340778 -0.32458717 -0.01684697 -0.05221050 -0.33615751 -0.05221050 -0.00004415 -0.00015997 -0.00004415
HL7   -33.35760591 -6.21152463 -6.17056343 -0.25903307 -0.01061268 -0.03760387 -0.23391524 -0.01413909 -0.00013307 -0.00029822 -0.00005268
HL8   -33.62388392 -6.57977381 -6.53818435 -0.30033111 -0.01235302 -0.03138321 -0.28187352 -0.03138321 -0.00012493 -0.00041088 -0.00012493
HL9   -48.55468862 -7.65525349 -7.64022388 -0.31428113 -0.01435411 -0.04352647 -0.31535566 -0.04352647 -0.00008545 -0.00029446 -0.00008545
HL10  -48.30643131 -7.27087768 -7.25221800 -0.27001029 -0.01295726 -0.04675239 -0.26074955 -0.02095583 -0.00007157 -0.00020847 -0.00003805
HL11  -66.75287812 -12.48704897 -12.41562436 -0.56039588 -0.02408751 -0.06443484 -0.52666047 -0.06443484 -0.00036590 -0.00103594 -0.00036590
HL12  -66.49404877 -12.11314797 -12.04728913 -0.52080959 -0.02496567 -0.07058751 -0.48187940 -0.05005134 -0.00038371 -0.00092165 -0.00027763
HL13  -89.39831612 -9.99546843 -9.97409800 -0.28915912 -0.01423528 -0.05044086 -0.25118207 -0.02528484 -0.00000631 -0.00001979 -0.00000411
HL14  -89.66277892 -10.38361467 -10.38952426 -0.33474255 -0.01860268 -0.05509028 -0.33267695 -0.05509028 -0.00001612 -0.00006033 -0.00001612
HL15  -66.62305079 -8.17969705 -8.14897991 -0.23288295 -0.01077826 -0.04896499 -0.19582656 -0.00811503 -0.00001375 -0.00003488 -0.00000419
HL16  -318.82967411 -23.63982127 -23.51262840 -0.64328009 -0.01990371 -0.07465121 -0.46780121 -0.07465121 -0.00035829 -0.00119457 -0.00035829
HL17  -318.58170818 -23.28812964 -23.16408999 -0.60518274 -0.01745347 -0.08100507 -0.42573712 -0.06056930 -0.00043607 -0.00098267 -0.00016401
HL18  -373.00758530 -25.68963339 -25.55700597 -0.66629196 -0.01743218 -0.08415004 -0.48214801 -0.08415004 -0.00029680 -0.00093622 -0.00029680
HL19  -372.75164289 -25.33747285 -25.20440010 -0.62524323 -0.01564275 -0.08831270 -0.43611029 -0.06656206 -0.00030062 -0.00070931 -0.00014546
HL20  -48.05982381 -6.91277157 -6.88519804 -0.22461916 -0.01084908 -0.04815214 -0.20080106 -0.00665607 -0.00005342 -0.00012921 -0.00001051
HL21  -165.26598878 -28.70915470 -28.61647785 -1.21457411 -0.06195736 -0.16844187 -1.22060606 -0.16844187 -0.00140915 -0.00406293 -0.00140915
HT1   -432.40189012 -28.15930841 -28.02450374 -0.70268294 -0.02131676 -0.09698200 -0.50436399 -0.08447549 -0.00025020 -0.00082830 -0.00023264
HT2   -67.34834019 -9.14417383 -9.16984180 -0.33688760 -0.02788204 -0.05761357 -0.36055778 -0.05004378 -0.00007257 -0.00034408 -0.00007405
HT3   -33.82259785 -6.83726148 -6.80839641 -0.31620442 -0.01785176 -0.04043988 -0.30170919 -0.02554397 -0.00019745 -0.00064814 -0.00012733
HT4   -100.49545829 -15.06112535 -15.06015017 -0.59452325 -0.03832585 -0.09249915 -0.60704191 -0.08290627 -0.00026124 -0.00087991 -0.00026645
HT5   -0.66683437 -0.93287620 -0.93215374 -0.06097429 -0.00525327 -0.00366215 -0.05953042 0.00000000 -0.00001559 -0.00016097 0.00000000
HT6   -115.43758793 -16.11863140 -16.16063262 -0.60883268 -0.04355152 -0.10325114 -0.65833301 -0.10769122 -0.00020454 -0.00084062 -0.00032480
HT7   -465.58588375 -34.04500540 -33.88219858 -0.95829955 -0.03435767 -0.13370200 -0.74739159 -0.11412184 -0.00050469 -0.00153467 -0.00046061
HT8   -133.63138371 -20.96208793 -20.93595200 -0.85479777 -0.05508957 -0.12546187 -0.85591278 -0.12012546 -0.00053569 -0.00165313 -0.00061720
HT9   -89.88193308 -10.59511526 -10.62251176 -0.34314635 -0.04002403 -0.05524492 -0.34666324 -0.05184874 -0.00002515 -0.00017916 -0.00003523
HT10  -100.23867277 -14.69795994 -14.67972290 -0.54918385 -0.03552068 -0.09136632 -0.53409605 -0.05513377 -0.00022279 -0.00074243 -0.00020172
HT11  -319.03287389 -23.91307128 -23.79598865 -0.65909919 -0.02597294 -0.08130566 -0.48469981 -0.07337463 -0.00048599 -0.00158460 -0.00038003
HT12  -67.08521425 -8.78584477 -8.79525819 -0.29287418 -0.02152294 -0.05596533 -0.29065088 -0.02634203 -0.00004935 -0.00024953 -0.00003242
HT13  -373.20692049 -25.96479666 -25.84292754 -0.68244792 -0.02283987 -0.09117967 -0.49984280 -0.08274834 -0.00039940 -0.00127587 -0.00033359
HT14  -498.86840877 -35.91921370 -35.84601857 -0.93671862 -0.18916292 -0.14873890 -0.78604118 -0.21977676 -0.00030228 -0.00153158 -0.00202859
HT15  -81.66688740 -13.43598289 -13.40693228 -0.54101775 -0.03352644 -0.08971297 -0.52882195 -0.04929457 -0.00032974 -0.00100908 -0.00024924
HT16  -114.79926676 -19.34105113 -19.28467781 -0.80230868 -0.04641936 -0.12356258 -0.77655370 -0.08480609 -0.00063258 -0.00178045 -0.00057559
HT17  -115.04961285 -19.70833232 -19.65858276 -0.84701343 -0.04826011 -0.12084307 -0.83570787 -0.10761650 -0.00066104 -0.00194952 -0.00068652
HT18  -81.91649626 -13.80390050 -13.78128633 -0.58616334 -0.03455783 -0.08730979 -0.58774014 -0.07158114 -0.00035782 -0.00115274 -0.00033573
HT19  -165.22933029 -28.65533148 -28.58988036 -1.22782349 -0.05847696 -0.18706652 -1.24944530 -0.18706652 -0.00210873 -0.00499895 -0.00210873
# 52 + 48 molecules for NCIE + BSSE
# 56 + 34 molecules for S22 + BSSE
# 12 +  6 molecules for ADIM6 + BSSE
NB1         -48.55995198 -7.64961149 -7.63532486 -0.31406807 -0.01443135 -0.04360608 -0.31612324 -0.04360608 -0.00008613 -0.00029785 -0.00008613
NB2         -89.66564277 -10.38043421 -10.38692675 -0.33461253 -0.01869003 -0.05518171 -0.33328578 -0.05518171 -0.00001621 -0.00006094 -0.00001621
NB3         -67.13375443 -8.91370358 -8.91901659 -0.32438500 -0.01694373 -0.05235082 -0.33712899 -0.05235082 -0.00004454 -0.00016204 -0.00004454
NB4         -147.91369169 -21.04856336 -21.06456580 -0.79286606 -0.05701449 -0.13444297 -0.84850805 -0.13444297 -0.00042566 -0.00119664 -0.00042566
NB5         -166.50493863 -22.29270652 -22.33022524 -0.80130705 -0.06014044 -0.14340118 -0.87397399 -0.14340118 -0.00033810 -0.00093812 -0.00033810
NB6         -66.31617746 -11.72814063 -11.68762546 -0.49440246 -0.02310690 -0.06315035 -0.50440506 -0.06315035 -0.00034491 -0.00105713 -0.00034491
NB7         -178.83468733 -19.88316589 -19.96019880 -0.61160289 -0.03588422 -0.10836043 -0.70646080 -0.10836043 -0.00004105 -0.00022083 -0.00004105
NB8         -521.37546202 -37.48730119 -37.39107668 -0.96966489 -0.04075174 -0.14604353 -0.81894583 -0.14604353 -0.00023686 -0.00075845 -0.00023686
NB9         -65.85872870 -10.97318381 -10.96081531 -0.42960759 -0.02092487 -0.06857212 -0.49077418 -0.06857212 -0.00033859 -0.00099570 -0.00033859
NB10        -80.85358392 -12.03449708 -12.04983712 -0.43985140 -0.02424617 -0.08094195 -0.53508310 -0.08094195 -0.00024534 -0.00071258 -0.00024534
NB11        -863.94527368 -55.01471997 -54.75476084 -1.32568432 -0.03435213 -0.18209581 -0.95617039 -0.18209581 -0.00061424 -0.00181914 -0.00061424
NB12        -373.01065703 -25.68628620 -25.55416863 -0.66619031 -0.01748229 -0.08420274 -0.48260569 -0.08420274 -0.00029841 -0.00094258 -0.00029841
NB13        -432.22889441 -27.86136040 -27.71515357 -0.68614934 -0.01552236 -0.09017366 -0.48590323 -0.09017366 -0.00019740 -0.00059732 -0.00019740
NB14        -465.35983023 -33.75964878 -33.58819317 -0.94357178 -0.02907021 -0.12307496 -0.73485329 -0.12307496 -0.00046808 -0.00131636 -0.00046808
NB15        -406.13873213 -31.59082442 -31.43227197 -0.92561080 -0.03027036 -0.11823604 -0.73185444 -0.11823604 -0.00061073 -0.00174122 -0.00061073
NB16        -116.46936673 -12.04866637 -12.03022637 -0.34671784 -0.01711233 -0.05186432 -0.30357908 -0.05186432 -0.00000311 -0.00001154 -0.00000311
NB17        -197.50377516 -33.22081364 -33.13475183 -1.37238251 -0.06298274 -0.21305254 -1.38362873 -0.21305254 -0.00233345 -0.00523958 -0.00233345
NB18        -33.62682749 -6.57674104 -6.53543142 -0.30021083 -0.01238217 -0.03138643 -0.28209436 -0.03138643 -0.00012537 -0.00041289 -0.00012537
NB19        -1.84589704 -1.01259340 -1.00431714 -0.04108990 -0.00297365 0.00000000 -0.04030176 0.00000000 0.00000000 -0.00000550 0.00000000
NB20        -496.63885667 -30.15467004 -29.98447798 -0.70454806 -0.01312247 -0.09295364 -0.47790978 -0.09295364 -0.00010923 -0.00031468 -0.00010923
NB21        -97.12021965 -15.30055341 -15.27325023 -0.63050265 -0.03006343 -0.08857743 -0.63500349 -0.08857743 -0.00024661 -0.00075236 -0.00024661
NB22        -179.33146813 -20.76538525 -20.77926547 -0.67159896 -0.03892072 -0.11133929 -0.66793508 -0.11133929 -0.00005086 -0.00016259 -0.00005086
NB23        -134.26715554 -17.83251441 -17.84403230 -0.65175633 -0.03547188 -0.10612560 -0.67642799 -0.10612560 -0.00013609 -0.00042300 -0.00013609
NB24        -115.69396988 -16.56839089 -16.56148184 -0.64239183 -0.03333582 -0.09792964 -0.65686350 -0.09792964 -0.00019316 -0.00059303 -0.00019316
NB25        -295.81996372 -42.11788147 -42.14989582 -1.59507800 -0.11464509 -0.27251212 -1.70287281 -0.27251212 -0.00118185 -0.00307718 -0.00118185
NB26        -332.99330263 -44.61728285 -44.69108830 -1.61456384 -0.12233935 -0.29047025 -1.75046149 -0.29047025 -0.00095872 -0.00246427 -0.00095872
NB27        -245.14816822 -31.60225761 -31.65436821 -1.10719925 -0.09694336 -0.17576606 -1.22026273 -0.17576606 -0.00048544 -0.00169226 -0.00048544
NB28        -227.39681836 -27.51254410 -27.60026692 -0.92738798 -0.11435279 -0.15816962 -1.04691917 -0.15816962 -0.00018759 -0.00091858 -0.00018759
NB29        -587.23447639 -48.45247210 -48.35578203 -1.40496593 -0.07272959 -0.22005121 -1.31897322 -0.22005121 -0.00085371 -0.00248494 -0.00085371
NB30        -602.23017176 -49.51758014 -49.44490731 -1.41386292 -0.07500899 -0.23170511 -1.36437122 -0.23170511 -0.00063573 -0.00183821 -0.00063573
NB31        -912.51290391 -62.64933958 -62.39026662 -1.64451895 -0.06705055 -0.23145454 -1.28900382 -0.23145454 -0.00094377 -0.00289661 -0.00094377
NB32        -588.51316049 -46.39353687 -46.31318643 -1.29880512 -0.07275166 -0.20305922 -1.16741899 -0.20305922 -0.00040617 -0.00126683 -0.00040617
NB33        -569.93746717 -45.12831946 -45.04154540 -1.29378832 -0.06943528 -0.19975513 -1.16489800 -0.19975513 -0.00054882 -0.00183950 -0.00054882
NB34        -746.02114709 -51.37149028 -51.10922239 -1.33446128 -0.03646356 -0.17001872 -0.96834762 -0.17001872 -0.00075616 -0.00221729 -0.00075616
NB35        -864.45702826 -55.72262379 -55.43217675 -1.37447541 -0.03259470 -0.18193537 -0.97485619 -0.18193537 -0.00050775 -0.00143245 -0.00050775
NB36        -805.23983440 -53.54674690 -53.27209073 -1.35584490 -0.03555635 -0.17677287 -0.97291857 -0.17677287 -0.00064760 -0.00187651 -0.00064760
NB37        -897.58832373 -61.62026061 -61.30527340 -1.63354745 -0.04707614 -0.21607841 -1.22615663 -0.21607841 -0.00088359 -0.00237159 -0.00088359
NB38        -486.99234717 -43.62676081 -43.48458019 -1.36855847 -0.05591837 -0.20105860 -1.26963527 -0.20105860 -0.00104490 -0.00284350 -0.00104490
NB39        -838.36776697 -59.45080332 -59.15079245 -1.61713765 -0.04928039 -0.21223673 -1.22491447 -0.21223673 -0.00107592 -0.00292504 -0.00107592
NB40        -313.97230593 -45.26961448 -45.16562591 -1.71985647 -0.08059641 -0.26545630 -1.68876843 -0.26545630 -0.00240088 -0.00539311 -0.00240088
NB41        -150.09625453 -18.62524234 -18.56589725 -0.64708578 -0.02986987 -0.08340963 -0.58618996 -0.08340963 -0.00014149 -0.00045095 -0.00014149
NB42        -498.48464917 -31.16721984 -30.98899275 -0.74570371 -0.01620455 -0.09301303 -0.51836286 -0.09301303 -0.00011619 -0.00033449 -0.00011619
NB43        -118.31532128 -13.06109923 -13.03463056 -0.38783699 -0.02028704 -0.05189821 -0.34399159 -0.05189821 -0.00000482 -0.00002062 -0.00000482
NB44        -232.93882995 -24.09712561 -24.06061809 -0.69349557 -0.03463141 -0.10381028 -0.60745620 -0.10381028 -0.00000906 -0.00002909 -0.00000906
NB45        -613.10813585 -42.20322550 -42.01502487 -1.05138908 -0.03056148 -0.14494329 -0.78188856 -0.14494329 -0.00012245 -0.00034694 -0.00012245
NB46        -67.25180022 -13.15422006 -13.07188156 -0.60126654 -0.02496144 -0.06341831 -0.56569630 -0.06341831 -0.00034509 -0.00101593 -0.00034509
NB47        -131.71686299 -21.94706846 -21.92254682 -0.86048756 -0.04238562 -0.13800163 -0.98278703 -0.13800163 -0.00081150 -0.00226958 -0.00081150
NB48        -132.62856249 -23.45826687 -23.37718588 -0.99124057 -0.04662025 -0.12804604 -1.01232799 -0.12804604 -0.00092520 -0.00259259 -0.00092520
NB49        -394.95528454 -66.49093973 -66.31417518 -2.74998060 -0.12603003 -0.42957010 -2.77201928 -0.42957010 -0.00577498 -0.01270443 -0.00577498
NB50        -394.95417233 -66.49575046 -66.31698419 -2.75082604 -0.12584414 -0.42853653 -2.76810154 -0.42853653 -0.00535146 -0.01186963 -0.00535146
NB51        -394.95473784 -66.49198034 -66.31420048 -2.75129925 -0.12632709 -0.43033368 -2.77321238 -0.43033368 -0.00582338 -0.01281073 -0.00582338
NB52        -197.47980269 -33.24585822 -33.15696953 -1.37367638 -0.06261378 -0.21268471 -1.38058179 -0.21268471 -0.00230996 -0.00518599 -0.00230996
  S22_1     -97.11266403 -15.30823204 -15.27973102 -0.63099042 -0.03007362 -0.08855057 -0.63433283 -0.08855057 -0.00025413 -0.00076349 -0.00025413
S22_01a     -48.55611766 -7.65365405 -7.63888081 -0.31423468 -0.01438567 -0.04355844 -0.31567456 -0.04355844 -0.00008567 -0.00029585 -0.00008567
  S22_2     -134.25921508 -17.84086218 -17.85122781 -0.65231014 -0.03542819 -0.10601630 -0.67529550 -0.10601630 -0.00013654 -0.00042262 -0.00013654
S22_02a     -67.12925048 -8.91870620 -8.92318113 -0.32457096 -0.01684971 -0.05220695 -0.33614452 -0.05220695 -0.00004415 -0.00015991 -0.00004415
  S22_3     -332.99287768 -44.61620607 -44.69107807 -1.61537119 -0.12267101 -0.29109040 -1.75229295 -0.29109040 -0.00096797 -0.00248675 -0.00096797
S22_03a     -166.51436875 -22.27986918 -22.31958119 -0.80106653 -0.06062245 -0.14399999 -0.87695142 -0.14399999 -0.00034314 -0.00095600 -0.00034314
  S22_4     -295.81826526 -42.11889652 -42.15114799 -1.59552727 -0.11471246 -0.27277894 -1.70360840 -0.27277894 -0.00118761 -0.00309108 -0.00118761
S22_04a     -147.92166260 -21.03832763 -21.05631035 -0.79260077 -0.05771659 -0.13508352 -0.85159677 -0.13508352 -0.00043089 -0.00121334 -0.00043089
  S22_5     -721.33996828 -103.71150946 -103.77003742 -3.94481842 -0.27402679 -0.70075817 -4.18131577 -0.70075817 -0.00501317 -0.01220252 -0.00501317
S22_05a     -360.67973040 -51.83417090 -51.86560565 -1.96707927 -0.13686185 -0.34814213 -2.09123941 -0.34814213 -0.00214931 -0.00540659 -0.00214931
  S22_6     -539.56421656 -83.81596334 -83.74652733 -3.34199619 -0.19273408 -0.56252529 -3.46836569 -0.56252529 -0.00571749 -0.01320354 -0.00571749
S22_06a     -279.08684272 -42.51083253 -42.49268425 -1.66928551 -0.10141492 -0.28277170 -1.75103175 -0.28277170 -0.00231267 -0.00557368 -0.00231267
S22_06b     -260.49904139 -41.26950901 -41.21846288 -1.66149791 -0.08890576 -0.27381477 -1.70859881 -0.27381477 -0.00256814 -0.00593007 -0.00256814
  S22_7     -797.58320692 -118.55221687 -118.55515290 -4.62274598 -0.28970181 -0.81419588 -4.85455639 -0.81419588 -0.00746474 -0.01729246 -0.00746474
S22_07a     -403.79330174 -60.77468036 -60.77556457 -2.38143486 -0.13838893 -0.42384380 -2.50434514 -0.42384380 -0.00384389 -0.00877178 -0.00384389
S22_07b     -393.81425166 -57.74012020 -57.74310987 -2.22994068 -0.14908923 -0.38457782 -2.34136994 -0.38457782 -0.00266530 -0.00659430 -0.00266530
  S22_8     -67.25085215 -13.15551892 -13.07307843 -0.60111042 -0.02493218 -0.06331850 -0.56534049 -0.06331850 -0.00033853 -0.00100199 -0.00033853
S22_08a     -33.62568716 -6.57791859 -6.53650012 -0.30025757 -0.01237082 -0.03138516 -0.28200837 -0.03138516 -0.00012520 -0.00041211 -0.00012520
  S22_9     -132.62047951 -23.46683379 -23.38481787 -0.99156676 -0.04650460 -0.12793565 -1.01120500 -0.12793565 -0.00092080 -0.00257904 -0.00092080
S22_09a     -66.31349608 -11.73097971 -11.69015393 -0.49451828 -0.02306985 -0.06311706 -0.50403417 -0.06311706 -0.00034397 -0.00105369 -0.00034397
 S22_10     -231.10788692 -39.81926043 -39.68939843 -1.67609068 -0.07555277 -0.24620939 -1.66808553 -0.24620939 -0.00277449 -0.00630387 -0.00277449
S22_10a     -197.49065248 -33.23455983 -33.14696397 -1.37306013 -0.06278233 -0.21285880 -1.38200695 -0.21285880 -0.00232127 -0.00521149 -0.00232127
S22_10b     -33.62116352 -6.58255689 -6.54071210 -0.30044120 -0.01232649 -0.03138041 -0.28167268 -0.03138041 -0.00012451 -0.00040905 -0.00012451
 S22_11     -394.97044777 -66.47204080 -66.29619036 -2.75257509 -0.12706895 -0.43235932 -2.77999596 -0.43235932 -0.00601203 -0.01320163 -0.00601203
S22_11a     -197.48945537 -33.23578879 -33.14808740 -1.37307426 -0.06276847 -0.21285478 -1.38194387 -0.21285478 -0.00232124 -0.00521099 -0.00232124
 S22_12     -454.75417239 -70.65501300 -70.61599844 -2.79384313 -0.14510307 -0.48260833 -2.95397367 -0.48260833 -0.00542608 -0.01197227 -0.00542608
S22_12a     -227.38396580 -35.32364859 -35.30486272 -1.39331083 -0.07152099 -0.23781967 -1.46893301 -0.23781967 -0.00204960 -0.00464762 -0.00204960
 S22_13     -721.33194655 -103.69896047 -103.75548626 -3.94419083 -0.27417711 -0.70480544 -4.19713546 -0.70480544 -0.00608802 -0.01439036 -0.00608802
S22_13a     -360.67313566 -51.84210733 -51.87257299 -1.96718963 -0.13666923 -0.34787099 -2.08985643 -0.34787099 -0.00214914 -0.00540674 -0.00214914
 S22_14     -508.36610663 -83.85122269 -83.66705850 -3.45222024 -0.16535949 -0.56214433 -3.50808963 -0.56214433 -0.00840421 -0.01839903 -0.00840421
S22_14a     -310.88715199 -50.61567836 -50.52008856 -2.06969347 -0.10033094 -0.33908871 -2.10214820 -0.33908871 -0.00398948 -0.00896270 -0.00398948
S22_14b     -197.48948783 -33.23579142 -33.14801329 -1.37318990 -0.06275870 -0.21282208 -1.38174245 -0.21282208 -0.00231861 -0.00520601 -0.00231861
 S22_15     -797.57409858 -118.54435171 -118.54122212 -4.62626801 -0.29019220 -0.82221975 -4.87355067 -0.82221975 -0.00925808 -0.02085694 -0.00925808
S22_15a     -403.79277808 -60.77466336 -60.77566669 -2.38127438 -0.13857025 -0.42409229 -2.50537260 -0.42409229 -0.00386397 -0.00881409 -0.00386397
S22_15b     -393.80242898 -57.75402088 -57.75521512 -2.23024466 -0.14877756 -0.38417038 -2.33912357 -0.38417038 -0.00265342 -0.00656053 -0.00265342
 S22_16     -132.16683259 -22.71026030 -22.65674437 -0.92566866 -0.04436468 -0.13251176 -0.99523240 -0.13251176 -0.00081056 -0.00230802 -0.00081056
S22_16a     -66.31263877 -11.73185928 -11.69094497 -0.49454950 -0.02305894 -0.06311754 -0.50399721 -0.06311754 -0.00034371 -0.00105297 -0.00034371
S22_16b     -65.85783901 -10.97410960 -10.96166108 -0.42963260 -0.02091549 -0.06857272 -0.49072377 -0.06857272 -0.00033836 -0.00099522 -0.00033836
 S22_17     -264.62067567 -42.15329220 -42.07033479 -1.70068862 -0.08073970 -0.26719844 -1.72310671 -0.26719844 -0.00261314 -0.00589859 -0.00261314
S22_17a     -197.49272167 -33.23238565 -33.14505758 -1.37291441 -0.06281722 -0.21290027 -1.38233007 -0.21290027 -0.00232407 -0.00521758 -0.00232407
S22_17b     -67.13077834 -8.91683346 -8.92170403 -0.32452967 -0.01689168 -0.05230221 -0.33674378 -0.05230221 -0.00004439 -0.00016131 -0.00004439
 S22_18     -246.04317863 -40.89127564 -40.78846758 -1.69008861 -0.07778342 -0.25842912 -1.70223546 -0.25842912 -0.00271131 -0.00614650 -0.00271131
S22_18a     -197.49103578 -33.23415534 -33.14661318 -1.37302714 -0.06278932 -0.21286817 -1.38207726 -0.21286817 -0.00232192 -0.00521287 -0.00232192
S22_18b     -48.55598719 -7.65353979 -7.63889377 -0.31426503 -0.01440776 -0.04358436 -0.31592719 -0.04358436 -0.00008571 -0.00029683 -0.00008571
 S22_19     -278.34949024 -45.26486726 -45.19232374 -1.81695138 -0.08813304 -0.29699367 -1.92471463 -0.29699367 -0.00292095 -0.00667709 -0.00292095
S22_19a     -197.49321910 -33.23185966 -33.14460009 -1.37287381 -0.06282614 -0.21291186 -1.38241780 -0.21291186 -0.00232487 -0.00521929 -0.00232487
S22_19b     -80.86265466 -12.02350970 -12.04097955 -0.43944794 -0.02451865 -0.08187553 -0.53974534 -0.08187553 -0.00025139 -0.00073255 -0.00025139
 S22_20     -394.97613116 -66.47198593 -66.29585873 -2.75013534 -0.12629519 -0.42932070 -2.77210488 -0.42932070 -0.00541898 -0.01201318 -0.00541898
S22_20a     -197.49178424 -33.23337122 -33.14592192 -1.37298012 -0.06280142 -0.21288155 -1.38218410 -0.21288155 -0.00232281 -0.00521483 -0.00232281
S22_20b     -197.49371627 -33.23131599 -33.14414862 -1.37280068 -0.06283810 -0.21293281 -1.38256365 -0.21293281 -0.00232641 -0.00522241 -0.00232641
 S22_21     -508.37474751 -83.85245438 -83.66810346 -3.44877586 -0.16419461 -0.55721688 -3.49590748 -0.55721688 -0.00738905 -0.01637109 -0.00738905
S22_21a     -310.89076557 -50.61180615 -50.51668991 -2.06952474 -0.10037230 -0.33916941 -2.10264988 -0.33916941 -0.00399325 -0.00897069 -0.00399325
S22_21b     -197.49225043 -33.23288242 -33.14549126 -1.37295046 -0.06280900 -0.21288999 -1.38225133 -0.21288999 -0.00232337 -0.00521607 -0.00232337
 S22_22     -528.26003722 -82.93856039 -82.81399495 -3.32255348 -0.17427690 -0.54308352 -3.38811318 -0.54308352 -0.00596962 -0.01330978 -0.00596962
S22_22a     -264.13661603 -41.46146301 -41.40022685 -1.65790803 -0.08689511 -0.26926498 -1.68982868 -0.26926498 -0.00256945 -0.00581870 -0.00256945
S22_22b     -264.13661604 -41.46146301 -41.40022684 -1.65790803 -0.08689511 -0.26926498 -1.68982868 -0.26926498 -0.00256945 -0.00581870 -0.00256945
    AM2     -66.75929061 -12.48040008 -12.40960596 -0.56014446 -0.02416229 -0.06445609 -0.52718760 -0.06445609 -0.00036788 -0.00104260 -0.00036788
    AD2     -133.51580607 -24.96179940 -24.82054166 -1.12204172 -0.04870730 -0.13044620 -1.05764854 -0.13044620 -0.00097176 -0.00255933 -0.00097176
    AM3     -99.89548599 -18.38161822 -18.28146661 -0.82108567 -0.03629428 -0.09886805 -0.77440544 -0.09886805 -0.00070154 -0.00185179 -0.00070154
    AD3     -199.78660136 -36.76468920 -36.56477487 -1.64494645 -0.07329251 -0.20029315 -1.55433984 -0.20029315 -0.00182475 -0.00454990 -0.00182475
    AM4     -133.03086485 -24.28358704 -24.15390385 -1.08216141 -0.04837814 -0.13339226 -1.02190665 -0.13339226 -0.00106261 -0.00271590 -0.00106261
    AD4     -266.05499004 -48.56971483 -48.31073929 -2.16843056 -0.09772660 -0.27057643 -2.05208718 -0.27057643 -0.00278267 -0.00675060 -0.00278267
    AM5     -166.16602902 -30.18569258 -30.02649944 -1.34322069 -0.06045384 -0.16792571 -1.26949604 -0.16792571 -0.00143909 -0.00361084 -0.00143909
    AD5     -332.32305075 -60.37499249 -60.05676477 -2.69189877 -0.12211696 -0.34085819 -2.54991905 -0.34085819 -0.00377655 -0.00902256 -0.00377655
    AM6     -199.30124913 -36.08773943 -35.89903435 -1.60428322 -0.07252501 -0.20247419 -1.51711036 -0.20247419 -0.00182209 -0.00451874 -0.00182209
    AD6     -398.59115014 -72.17993757 -71.80267108 -3.21545837 -0.14661089 -0.41132058 -3.04820055 -0.41132058 -0.00480692 -0.01136821 -0.00480692
    AM7     -232.43644244 -41.98981700 -41.77159008 -1.86534679 -0.08459416 -0.23702425 -1.76473329 -0.23702425 -0.00220798 -0.00543240 -0.00220798
    AD7     -464.85881684 -83.98531898 -83.54826094 -3.73940812 -0.17092749 -0.48184112 -3.54643484 -0.48184112 -0.00583428 -0.01370634 -0.00583428
 1-1_NCIE   -48.56103998 -7.64861424 -7.63449144 -0.31403877 -0.01449023 -0.04372065 -0.31677740 -0.04372065 -0.00008986 -0.00030888 -0.00008986
 2-1_NCIE   -89.66745447 -10.37887742 -10.38560760 -0.33458761 -0.01893160 -0.05537858 -0.33441373 -0.05537858 -0.00001821 -0.00006731 -0.00001821
 3-1_NCIE   -67.13634686 -8.91101992 -8.91676967 -0.32428533 -0.01715447 -0.05247237 -0.33784331 -0.05247237 -0.00004609 -0.00016686 -0.00004609
 4-1_NCIE   -48.56127651 -7.64844119 -7.63435602 -0.31403544 -0.01452181 -0.04375949 -0.31705074 -0.04375949 -0.00009011 -0.00031020 -0.00009011
 4-2_NCIE   -67.13860477 -8.90850157 -8.91462998 -0.32418075 -0.01721227 -0.05252953 -0.33827717 -0.05252953 -0.00004638 -0.00016802 -0.00004638
 5-1_NCIE   -147.92141008 -21.03906365 -21.05679200 -0.79269634 -0.05776097 -0.13522251 -0.85253990 -0.13522251 -0.00043919 -0.00123324 -0.00043919
 6-1_NCIE   -166.51210648 -22.28348106 -22.32232497 -0.80127667 -0.06055737 -0.14401765 -0.87737227 -0.14401765 -0.00034979 -0.00097151 -0.00034979
 7-1_NCIE   -66.31645705 -11.72785447 -11.68738475 -0.49440895 -0.02313306 -0.06320895 -0.50474845 -0.06320895 -0.00034888 -0.00106757 -0.00034888
 7-2_NCIE   -178.83799895 -19.87941382 -19.95752343 -0.61133236 -0.03618238 -0.10862932 -0.70961858 -0.10862932 -0.00004310 -0.00022901 -0.00004310
 8-1_NCIE   -48.56091207 -7.64873864 -7.63464393 -0.31403423 -0.01453609 -0.04372360 -0.31667820 -0.04372360 -0.00008965 -0.00030884 -0.00008965
 8-2_NCIE   -178.84052125 -19.87583765 -19.95514223 -0.61100478 -0.03624371 -0.10874589 -0.71207028 -0.10874589 -0.00004260 -0.00023134 -0.00004260
 9-1_NCIE   -65.86147209 -10.97015919 -10.95823265 -0.42952211 -0.02101308 -0.06882463 -0.49233476 -0.06882463 -0.00035021 -0.00103017 -0.00035021
 9-2_NCIE   -521.38241116 -37.47931946 -37.38505407 -0.96897361 -0.04114044 -0.14635969 -0.82274072 -0.14635969 -0.00024043 -0.00077642 -0.00024043
10-1_NCIE   -80.85190761 -12.03665694 -12.05154182 -0.43996396 -0.02425122 -0.08080979 -0.53465795 -0.08080979 -0.00024474 -0.00071009 -0.00024474
10-2_NCIE   -521.38220479 -37.47959518 -37.38526966 -0.96899504 -0.04111810 -0.14634146 -0.82254371 -0.14634146 -0.00024001 -0.00077506 -0.00024001
11-1_NCIE   -48.56140479 -7.64843407 -7.63426443 -0.31402569 -0.01449738 -0.04375155 -0.31692008 -0.04375155 -0.00009098 -0.00031174 -0.00009098
11-2_NCIE   -863.95416065 -55.00497369 -54.74696581 -1.32451501 -0.03451493 -0.18208069 -0.95911592 -0.18208069 -0.00061930 -0.00185955 -0.00061930
12-1_NCIE   -67.13606737 -8.91176038 -8.91736679 -0.32433627 -0.01721860 -0.05259302 -0.33831223 -0.05259302 -0.00004931 -0.00017519 -0.00004931
12-2_NCIE   -521.38238189 -37.47929623 -37.38505190 -0.96896171 -0.04109798 -0.14633479 -0.82259000 -0.14633479 -0.00023994 -0.00077518 -0.00023994
13-1_NCIE   -48.56123114 -7.64869601 -7.63437073 -0.31400717 -0.01447861 -0.04377298 -0.31702028 -0.04377298 -0.00009232 -0.00031418 -0.00009232
13-2_NCIE   -521.40017502 -37.45688838 -37.36853575 -0.96688125 -0.04187335 -0.14701478 -0.83261636 -0.14701478 -0.00024643 -0.00082021 -0.00024643
14-1_NCIE   -373.01142676 -25.68552278 -25.55349073 -0.66616898 -0.01751689 -0.08424249 -0.48296387 -0.08424249 -0.00030036 -0.00094834 -0.00030036
15-1_NCIE   -432.22964112 -27.86061237 -27.71449415 -0.68612848 -0.01555700 -0.09022439 -0.48639504 -0.09022439 -0.00019912 -0.00060243 -0.00019912
16-1_NCIE   -373.01175664 -25.68517778 -25.55320574 -0.66615533 -0.01752842 -0.08426314 -0.48319184 -0.08426314 -0.00030060 -0.00094926 -0.00030060
16-2_NCIE   -432.23259272 -27.85746888 -27.71186072 -0.68599744 -0.01565656 -0.09024857 -0.48668583 -0.09024857 -0.00020041 -0.00060729 -0.00020041
17-1_NCIE   -465.36179780 -33.75767701 -33.58650796 -0.94335862 -0.02916902 -0.12313000 -0.73567131 -0.12313000 -0.00047168 -0.00132821 -0.00047168
17-2_NCIE   -432.23188473 -27.85824497 -27.71250804 -0.68602927 -0.01564382 -0.09026061 -0.48673009 -0.09026061 -0.00020138 -0.00060943 -0.00020138
18-1_NCIE   -406.13984096 -31.58974967 -31.43132286 -0.92553178 -0.03032701 -0.11830309 -0.73246964 -0.11830309 -0.00061397 -0.00175034 -0.00061397
18-2_NCIE   -80.85705229 -12.03075894 -12.04654595 -0.43975931 -0.02439881 -0.08107534 -0.53599437 -0.08107534 -0.00024901 -0.00072245 -0.00024901
19-1_NCIE   -406.13966794 -31.58992618 -31.43147758 -0.92555238 -0.03032639 -0.11831586 -0.73261712 -0.11831586 -0.00061388 -0.00175044 -0.00061388
19-2_NCIE   -432.23489804 -27.85491884 -27.70965944 -0.68588450 -0.01572576 -0.09029726 -0.48722298 -0.09029726 -0.00020277 -0.00061475 -0.00020277
20-1_NCIE   -116.46983866 -12.04856518 -12.03006117 -0.34675242 -0.01734102 -0.05193913 -0.30398796 -0.05193913 -0.00000360 -0.00001312 -0.00000360
20-2_NCIE   -197.50425257 -33.22038892 -33.13435119 -1.37239148 -0.06301708 -0.21311909 -1.38396297 -0.21311909 -0.00234139 -0.00526830 -0.00234139
21-1_NCIE   -116.46969031 -12.04860243 -12.03010713 -0.34674426 -0.01724516 -0.05190569 -0.30382642 -0.05190569 -0.00000327 -0.00001207 -0.00000327
21-2_NCIE   -33.62683628 -6.57673393 -6.53541892 -0.30021012 -0.01238605 -0.03139127 -0.28212088 -0.03139127 -0.00012582 -0.00041395 -0.00012582
22-1_NCIE   -1.84589818 -1.01259881 -1.00431864 -0.04109093 -0.00297633 0.00000000 -0.04030419 0.00000000 0.00000000 -0.00000561 0.00000000
22-2_NCIE   -496.63887334 -30.15466308 -29.98448183 -0.70455067 -0.01312625 -0.09295672 -0.47794120 -0.09295672 -0.00010937 -0.00031515 -0.00010937
23-1_NCIE   -1.84589767 -1.01259701 -1.00431826 -0.04109054 -0.00297518 0.00000000 -0.04030354 0.00000000 0.00000000 -0.00000559 0.00000000
23-2_NCIE   -116.46943243 -12.04864582 -12.03019859 -0.34672176 -0.01714981 -0.05187221 -0.30362463 -0.05187221 -0.00000314 -0.00001163 -0.00000314
24-1_NCIE   -116.46947728 -12.04864208 -12.03018446 -0.34672550 -0.01716526 -0.05188133 -0.30367184 -0.05188133 -0.00000322 -0.00001189 -0.00000322
25-1_NCIE   -116.46953008 -12.04863617 -12.03017134 -0.34673092 -0.01719598 -0.05188457 -0.30369842 -0.05188457 -0.00000320 -0.00001182 -0.00000320
25-2_NCIE   -496.63887517 -30.15466275 -29.98447876 -0.70455124 -0.01312693 -0.09296162 -0.47798302 -0.09296162 -0.00010950 -0.00031549 -0.00010950
26-1_NCIE   -33.62697419 -6.57659970 -6.53529289 -0.30020522 -0.01239560 -0.03140840 -0.28221922 -0.03140840 -0.00012738 -0.00041750 -0.00012738
27-1_NCIE   -65.85943340 -10.97241599 -10.96016498 -0.42958567 -0.02096555 -0.06864387 -0.49118026 -0.06864387 -0.00034340 -0.00100987 -0.00034340
28-1_NCIE   -66.31678411 -11.72753782 -11.68708085 -0.49437930 -0.02314442 -0.06323987 -0.50488113 -0.06323987 -0.00035337 -0.00107790 -0.00035337
29-1_NCIE   -197.48044558 -33.24542658 -33.15654221 -1.37374463 -0.06271590 -0.21283844 -1.38144045 -0.21283844 -0.00232062 -0.00521674 -0.00232062
30-1_NCIE   -197.48042333 -33.24566324 -33.15663703 -1.37377929 -0.06272904 -0.21288967 -1.38170829 -0.21288967 -0.00232620 -0.00524137 -0.00232620
31-1_NCIE   -197.48046264 -33.24553456 -33.15654685 -1.37377978 -0.06273297 -0.21288868 -1.38169423 -0.21288868 -0.00232502 -0.00523367 -0.00232502
01a_S22     -48.55755846 -7.65221772 -7.63762859 -0.31418106 -0.01441242 -0.04365071 -0.31619234 -0.04365071 -0.00008959 -0.00030659 -0.00008959
02a_S22     -67.13294161 -8.91478634 -8.91993192 -0.32443850 -0.01708458 -0.05238137 -0.33720245 -0.05238137 -0.00004584 -0.00016552 -0.00004584
03a_S22     -166.51499206 -22.27978028 -22.31938101 -0.80113122 -0.06075864 -0.14425241 -0.87856312 -0.14425241 -0.00035169 -0.00097746 -0.00035169
04a_S22     -147.92207813 -21.03823112 -21.05614190 -0.79263754 -0.05780236 -0.13528967 -0.85290495 -0.13528967 -0.00043974 -0.00123539 -0.00043974
05a_S22     -360.68034006 -51.83399550 -51.86533614 -1.96713500 -0.13698752 -0.34839158 -2.09288124 -0.34839158 -0.00216022 -0.00543248 -0.00216022
06a_S22     -279.08748018 -42.51063142 -42.49234936 -1.66934297 -0.10153626 -0.28305506 -1.75273318 -0.28305506 -0.00232852 -0.00561299 -0.00232852
06b_S22     -260.49952744 -41.26935519 -41.21821862 -1.66153976 -0.08902417 -0.27398757 -1.70991466 -0.27398757 -0.00257473 -0.00594837 -0.00257473
07a_S22     -403.79472515 -60.77351470 -60.77447629 -2.38143997 -0.13852116 -0.42404151 -2.50581564 -0.42404151 -0.00385055 -0.00878782 -0.00385055
07b_S22     -393.81480993 -57.74007494 -57.74294574 -2.23002136 -0.14921821 -0.38481914 -2.34294935 -0.38481914 -0.00267548 -0.00661786 -0.00267548
08a_S22     -33.62613369 -6.57746719 -6.53608006 -0.30023962 -0.01238632 -0.03140402 -0.28213799 -0.03140402 -0.00012700 -0.00041637 -0.00012700
09a_S22     -66.31271742 -11.73183937 -11.69091008 -0.49455580 -0.02308775 -0.06319069 -0.50432623 -0.06319069 -0.00035188 -0.00107253 -0.00035188
10a_S22     -197.49102474 -33.23450346 -33.14679713 -1.37313294 -0.06285017 -0.21299211 -1.38271225 -0.21299211 -0.00233399 -0.00525779 -0.00233399
10b_S22     -33.62171330 -6.58201654 -6.54021330 -0.30042086 -0.01234801 -0.03143798 -0.28196995 -0.03143798 -0.00013067 -0.00042321 -0.00013067
11a_S22     -197.49158190 -33.23401354 -33.14628122 -1.37318186 -0.06292951 -0.21310444 -1.38340982 -0.21310444 -0.00233864 -0.00526763 -0.00233864
12a_S22     -227.38412703 -35.32398026 -35.30494675 -1.39343806 -0.07164919 -0.23799203 -1.47007048 -0.23799203 -0.00206159 -0.00468687 -0.00206159
13a_S22     -360.67418659 -51.84187083 -51.87209184 -1.96733866 -0.13691798 -0.34834192 -2.09235057 -0.34834192 -0.00217487 -0.00547002 -0.00217487
14a_S22     -310.88941127 -50.61389204 -50.51830144 -2.06979902 -0.10057573 -0.33949008 -2.10431818 -0.33949008 -0.00401707 -0.00903896 -0.00401707
14b_S22     -197.49312625 -33.23250640 -33.14495836 -1.37314594 -0.06299908 -0.21321329 -1.38413998 -0.21321329 -0.00234290 -0.00527747 -0.00234290
15a_S22     -403.79397213 -60.77430714 -60.77507436 -2.38148225 -0.13884854 -0.42458333 -2.50818827 -0.42458333 -0.00388765 -0.00887596 -0.00388765
15b_S22     -393.80383453 -57.75354802 -57.75453632 -2.23044388 -0.14909581 -0.38475289 -2.34227903 -0.38475289 -0.00268432 -0.00663567 -0.00268432
16a_S22     -66.31277429 -11.73177194 -11.69087851 -0.49456547 -0.02308690 -0.06317431 -0.50431453 -0.06317431 -0.00034746 -0.00106272 -0.00034746
16b_S22     -65.85682078 -10.97531963 -10.96268734 -0.42968764 -0.02093185 -0.06852166 -0.49045575 -0.06852166 -0.00033874 -0.00099592 -0.00033874
17a_S22     -197.49289446 -33.23251406 -33.14505840 -1.37298703 -0.06287838 -0.21302343 -1.38297048 -0.21302343 -0.00233586 -0.00526014 -0.00233586
17b_S22     -67.13333201 -8.91433017 -8.91973268 -0.32444749 -0.01732770 -0.05253091 -0.33780781 -0.05253091 -0.00004843 -0.00017305 -0.00004843
18a_S22     -197.49184624 -33.23361809 -33.14602007 -1.37305389 -0.06286059 -0.21300129 -1.38279450 -0.21300129 -0.00233485 -0.00525880 -0.00233485
18b_S22     -48.55608135 -7.65357671 -7.63894716 -0.31427212 -0.01448909 -0.04369045 -0.31638460 -0.04369045 -0.00009129 -0.00031204 -0.00009129
19a_S22     -197.49415731 -33.23131964 -33.14397714 -1.37293909 -0.06292366 -0.21309676 -1.38345326 -0.21309676 -0.00233985 -0.00527269 -0.00233985
19b_S22     -80.86309323 -12.02316606 -12.04064759 -0.43947489 -0.02463978 -0.08194316 -0.54026656 -0.08194316 -0.00025416 -0.00073981 -0.00025416
20a_S22     -197.49259013 -33.23301551 -33.14543202 -1.37308789 -0.06292553 -0.21310127 -1.38340626 -0.21310127 -0.00233979 -0.00527256 -0.00233979
20b_S22     -197.49188294 -33.23342710 -33.14590024 -1.37304282 -0.06287261 -0.21297846 -1.38273716 -0.21297846 -0.00232971 -0.00523682 -0.00232971
21a_S22     -310.89126781 -50.61154689 -50.51637927 -2.06956306 -0.10046079 -0.33931783 -2.10341929 -0.33931783 -0.00400292 -0.00899361 -0.00400292
21b_S22     -197.49538931 -33.23013910 -33.14290614 -1.37293807 -0.06301257 -0.21321631 -1.38421996 -0.21321631 -0.00234543 -0.00528645 -0.00234543
22a_S22     -264.13776530 -41.46078053 -41.39949154 -1.65794349 -0.08705910 -0.26954234 -1.69135939 -0.26954234 -0.00258487 -0.00585916 -0.00258487
22b_S22     -264.13721799 -41.46124891 -41.39981818 -1.65822155 -0.08687559 -0.26947867 -1.69065830 -0.26947867 -0.00258802 -0.00586796 -0.00258802
AM2_BSSE    -66.75932805 -12.48039451 -12.40958763 -0.56015234 -0.02419464 -0.06449936 -0.52740758 -0.06449936 -0.00037209 -0.00105202 -0.00037209
AM3_BSSE    -99.89559806 -18.38159087 -18.28138279 -0.82110479 -0.03636931 -0.09893352 -0.77478681 -0.09893352 -0.00070587 -0.00186154 -0.00070587
AM4_BSSE    -133.03108990 -24.28351177 -24.15378073 -1.08220014 -0.04848938 -0.13348744 -1.02248324 -0.13348744 -0.00106785 -0.00272780 -0.00106785
AM5_BSSE    -166.16632782 -30.18560729 -30.02630050 -1.34327731 -0.06060400 -0.16805011 -1.27026719 -0.16805011 -0.00144548 -0.00362527 -0.00144548
AM6_BSSE    -199.30166572 -36.08760642 -35.89877294 -1.60435934 -0.07272568 -0.20263740 -1.51812007 -0.20263740 -0.00183016 -0.00453684 -0.00183016
AM7_BSSE    -232.43691730 -41.98967748 -41.77127874 -1.86543567 -0.08482753 -0.23721867 -1.76595179 -0.23721867 -0.00221735 -0.00545336 -0.00221735
