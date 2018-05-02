# The project environment :
#  "ProjDir" specifying the storage DIR of this project
#  "ProjCtrl" = 0 : to run all the jobs
#     = 1 : to fetch result from existed log and chk files
#     = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PBE0           2              Aims 

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
" 4) w=100 range-seperate PT2 used                                           "

__initial guess__ ::
  0.5, 0.5, 0.5, 0.2, 0.2


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

__optimization function__ :: 24
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a1, a3, a4, a5, a6 = C
    a2  = 1. - a1
    #a3  = 1. - a4

    E_noXC, Ex_HF, Ex_PBE, Ec_PBE, rospt2, Ex_SCAN, Ec_SCAN = P
    #return E_noXC + a1*Ex_HF + a2*Ex_SCAN + a3*Ec_SCAN + a4*rospt2
    #return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2
    return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2 + \
               a5*(Ex_SCAN-Ex_PBE) + a6*(Ec_SCAN-Ec_PBE)

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
#               426 = 15+223+6+31+56+19+47+29 is the total number of jobs in this batch list
__batch__ :: 238
#"Flag"         "DIR"                         "InpName"       "JobType"
# Atoms  15
 H_0            <PATH1>/EAtom                XYG3_Comp      energy 
 Li_0           <PATH1>/EAtom                XYG3_Comp      energy 
 Be_0           <PATH1>/EAtom                XYG3_Comp      energy 
 B_0            <PATH1>/EAtom                XYG3_Comp      energy 
 C_0            <PATH1>/EAtom                XYG3_Comp      energy 
 N_0            <PATH1>/EAtom                XYG3_Comp      energy 
 O_0            <PATH1>/EAtom                XYG3_Comp      energy 
 F_0            <PATH1>/EAtom                XYG3_Comp      energy 
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
# TMD-BE3 6
 Cr2-BE3          <PATH2>/G2                   XYG3_Comp      energy
  V2-BE3          <PATH2>/G2                   XYG3_Comp      energy
 Fe2-BE3          <PATH2>/G2                   XYG3_Comp      energy
  Cr-BE3          <PATH2>/G2                   XYG3_Comp      energy
   V-BE3          <PATH2>/G2                   XYG3_Comp      energy
  Fe-BE3          <PATH2>/G2                   XYG3_Comp      energy
#TM-BE13 31
   TiCl-BE13    <PATH2>/G2                   XYG3_Comp      energy
    VF5-BE13    <PATH2>/G2                   XYG3_Comp      energy
   CrCl-BE13    <PATH2>/G2                   XYG3_Comp      energy
   CrOF-BE13    <PATH2>/G2                   XYG3_Comp      energy
 Fe2Br4-BE13    <PATH2>/G2                   XYG3_Comp      energy
CoC4O4H-BE13    <PATH2>/G2                   XYG3_Comp      energy
 NiCH2+-BE13    <PATH2>/G2                   XYG3_Comp      energy
 FeC5O5-BE13    <PATH2>/G2                   XYG3_Comp      energy
     VS-BE13    <PATH2>/G2                   XYG3_Comp      energy
    CuH-BE13    <PATH2>/G2                   XYG3_Comp      energy
   CuCl-BE13    <PATH2>/G2                   XYG3_Comp      energy
     VO-BE13    <PATH2>/G2                   XYG3_Comp      energy
   NiCl-BE13    <PATH2>/G2                   XYG3_Comp      energy
  CO_di-BE13    <PATH2>/G2                   XYG3_Comp      energy
    CH2-BE13    <PATH2>/G2                   XYG3_Comp      energy
    Fe2-BE13    <PATH2>/G2                   XYG3_Comp      energy
     Ti-BE13    <PATH2>/G2                   XYG3_Comp      energy
     Cl-BE13    <PATH2>/G2                   XYG3_Comp      energy
      V-BE13    <PATH2>/G2                   XYG3_Comp      energy
      F-BE13    <PATH2>/G2                   XYG3_Comp      energy
      O-BE13    <PATH2>/G2                   XYG3_Comp      energy
     Fe-BE13    <PATH2>/G2                   XYG3_Comp      energy
     Br-BE13    <PATH2>/G2                   XYG3_Comp      energy
     Co-BE13    <PATH2>/G2                   XYG3_Comp      energy
      H-BE13    <PATH2>/G2                   XYG3_Comp      energy
     Ni-BE13    <PATH2>/G2                   XYG3_Comp      energy
    Ni+-BE13    <PATH2>/G2                   XYG3_Comp      energy
     Cu-BE13    <PATH2>/G2                   XYG3_Comp      energy
     Cr-BE13    <PATH2>/G2                   XYG3_Comp      energy
      S-BE13    <PATH2>/G2                   XYG3_Comp      energy
      C-BE13    <PATH2>/G2                   XYG3_Comp      energy
#S22 56
       1-S22    <PATH2>/G2                   XYG3_Comp      energy
     01a-S22    <PATH2>/G2                   XYG3_Comp      energy
       2-S22    <PATH2>/G2                   XYG3_Comp      energy
     02a-S22    <PATH2>/G2                   XYG3_Comp      energy
       3-S22    <PATH2>/G2                   XYG3_Comp      energy
     03a-S22    <PATH2>/G2                   XYG3_Comp      energy
       4-S22    <PATH2>/G2                   XYG3_Comp      energy
     04a-S22    <PATH2>/G2                   XYG3_Comp      energy
       5-S22    <PATH2>/G2                   XYG3_Comp      energy
     05a-S22    <PATH2>/G2                   XYG3_Comp      energy
       6-S22    <PATH2>/G2                   XYG3_Comp      energy
     06a-S22    <PATH2>/G2                   XYG3_Comp      energy
     06b-S22    <PATH2>/G2                   XYG3_Comp      energy
       7-S22    <PATH2>/G2                   XYG3_Comp      energy
     07a-S22    <PATH2>/G2                   XYG3_Comp      energy
     07b-S22    <PATH2>/G2                   XYG3_Comp      energy
       8-S22    <PATH2>/G2                   XYG3_Comp      energy
     08a-S22    <PATH2>/G2                   XYG3_Comp      energy
       9-S22    <PATH2>/G2                   XYG3_Comp      energy
     09a-S22    <PATH2>/G2                   XYG3_Comp      energy
      10-S22    <PATH2>/G2                   XYG3_Comp      energy
     10a-S22    <PATH2>/G2                   XYG3_Comp      energy
     10b-S22    <PATH2>/G2                   XYG3_Comp      energy
      11-S22    <PATH2>/G2                   XYG3_Comp      energy
     11a-S22    <PATH2>/G2                   XYG3_Comp      energy
      12-S22    <PATH2>/G2                   XYG3_Comp      energy
     12a-S22    <PATH2>/G2                   XYG3_Comp      energy
      13-S22    <PATH2>/G2                   XYG3_Comp      energy
     13a-S22    <PATH2>/G2                   XYG3_Comp      energy
      14-S22    <PATH2>/G2                   XYG3_Comp      energy
     14a-S22    <PATH2>/G2                   XYG3_Comp      energy
     14b-S22    <PATH2>/G2                   XYG3_Comp      energy
      15-S22    <PATH2>/G2                   XYG3_Comp      energy
     15a-S22    <PATH2>/G2                   XYG3_Comp      energy
     15b-S22    <PATH2>/G2                   XYG3_Comp      energy
      16-S22    <PATH2>/G2                   XYG3_Comp      energy
     16a-S22    <PATH2>/G2                   XYG3_Comp      energy
     16b-S22    <PATH2>/G2                   XYG3_Comp      energy
      17-S22    <PATH2>/G2                   XYG3_Comp      energy
     17a-S22    <PATH2>/G2                   XYG3_Comp      energy
     17b-S22    <PATH2>/G2                   XYG3_Comp      energy
      18-S22    <PATH2>/G2                   XYG3_Comp      energy
     18a-S22    <PATH2>/G2                   XYG3_Comp      energy
     18b-S22    <PATH2>/G2                   XYG3_Comp      energy
      19-S22    <PATH2>/G2                   XYG3_Comp      energy
     19a-S22    <PATH2>/G2                   XYG3_Comp      energy
     19b-S22    <PATH2>/G2                   XYG3_Comp      energy
      20-S22    <PATH2>/G2                   XYG3_Comp      energy
     20a-S22    <PATH2>/G2                   XYG3_Comp      energy
     20b-S22    <PATH2>/G2                   XYG3_Comp      energy
      21-S22    <PATH2>/G2                   XYG3_Comp      energy
     21a-S22    <PATH2>/G2                   XYG3_Comp      energy
     21b-S22    <PATH2>/G2                   XYG3_Comp      energy
      22-S22    <PATH2>/G2                   XYG3_Comp      energy
     22a-S22    <PATH2>/G2                   XYG3_Comp      energy
     22b-S22    <PATH2>/G2                   XYG3_Comp      energy
#DC9 19 
       13dip-DC9  <PATH2>/G2                   XYG3_Comp      energy
         be4-DC9  <PATH2>/G2                   XYG3_Comp      energy
          be-DC9  <PATH2>/G2                   XYG3_Comp      energy
     c20bowl-DC9  <PATH2>/G2                   XYG3_Comp      energy
     c20cage-DC9  <PATH2>/G2                   XYG3_Comp      energy
   carbooxo1-DC9  <PATH2>/G2                   XYG3_Comp      energy
   carbooxo2-DC9  <PATH2>/G2                   XYG3_Comp      energy
       ch2n2-DC9  <PATH2>/G2                   XYG3_Comp      energy
       ethen-DC9  <PATH2>/G2                   XYG3_Comp      energy
heptahexaene-DC9  <PATH2>/G2                   XYG3_Comp      energy
 heptatriyne-DC9  <PATH2>/G2                   XYG3_Comp      energy
     ISO_E35-DC9  <PATH2>/G2                   XYG3_Comp      energy
     ISO_E36-DC9  <PATH2>/G2                   XYG3_Comp      energy
     ISO_P35-DC9  <PATH2>/G2                   XYG3_Comp      energy
     ISO_P36-DC9  <PATH2>/G2                   XYG3_Comp      energy
        omcb-DC9  <PATH2>/G2                   XYG3_Comp      energy
          s2-DC9  <PATH2>/G2                   XYG3_Comp      energy
          s8-DC9  <PATH2>/G2                   XYG3_Comp      energy
     tmethen-DC9  <PATH2>/G2                   XYG3_Comp      energy
#G2RC 47 
 100-G2RC    <PATH2>/G2                   XYG3_Comp      energy
 104-G2RC    <PATH2>/G2                   XYG3_Comp      energy
 106-G2RC    <PATH2>/G2                   XYG3_Comp      energy
 113-G2RC    <PATH2>/G2                   XYG3_Comp      energy
 117-G2RC    <PATH2>/G2                   XYG3_Comp      energy
 118-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  11-G2RC    <PATH2>/G2                   XYG3_Comp      energy
 121-G2RC    <PATH2>/G2                   XYG3_Comp      energy
 126-G2RC    <PATH2>/G2                   XYG3_Comp      energy
 128-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  13-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  14-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  18-G2RC    <PATH2>/G2                   XYG3_Comp      energy
   1-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  21-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  22-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  23-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  24-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  25-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  26-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  30-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  32-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  33-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  34-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  39-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  40-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  45-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  47-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  51-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  52-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  56-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  57-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  58-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  59-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  60-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  61-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  62-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  66-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  67-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  68-G2RC    <PATH2>/G2                   XYG3_Comp      energy
   6-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  73-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  82-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  88-G2RC    <PATH2>/G2                   XYG3_Comp      energy
   8-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  94-G2RC    <PATH2>/G2                   XYG3_Comp      energy
  97-G2RC    <PATH2>/G2                   XYG3_Comp      energy
#SIE11 29
 aceton+-SIE11  <PATH2>/G2                   XYG3_Comp      energy
  acetyl-SIE11  <PATH2>/G2                   XYG3_Comp      energy
    but+-SIE11  <PATH2>/G2                   XYG3_Comp      energy
      bz-SIE11  <PATH2>/G2                   XYG3_Comp      energy
   bz_li-SIE11  <PATH2>/G2                   XYG3_Comp      energy
    c2h4-SIE11  <PATH2>/G2                   XYG3_Comp      energy
 c2h4_f2-SIE11  <PATH2>/G2                   XYG3_Comp      energy
     ch3-SIE11  <PATH2>/G2                   XYG3_Comp      energy
   clclf-SIE11  <PATH2>/G2                   XYG3_Comp      energy
   clfcl-SIE11  <PATH2>/G2                   XYG3_Comp      energy
     clf-SIE11  <PATH2>/G2                   XYG3_Comp      energy
   ethyl-SIE11  <PATH2>/G2                   XYG3_Comp      energy
  ethyl+-SIE11  <PATH2>/G2                   XYG3_Comp      energy
      f2-SIE11  <PATH2>/G2                   XYG3_Comp      energy
   h2o2+-SIE11  <PATH2>/G2                   XYG3_Comp      energy
     h2o-SIE11  <PATH2>/G2                   XYG3_Comp      energy
    h2o+-SIE11  <PATH2>/G2                   XYG3_Comp      energy
    he2+-SIE11  <PATH2>/G2                   XYG3_Comp      energy
      he-SIE11  <PATH2>/G2                   XYG3_Comp      energy
     he+-SIE11  <PATH2>/G2                   XYG3_Comp      energy
      li-SIE11  <PATH2>/G2                   XYG3_Comp      energy
   li_f2-SIE11  <PATH2>/G2                   XYG3_Comp      energy
     mgo-SIE11  <PATH2>/G2                   XYG3_Comp      energy
      na-SIE11  <PATH2>/G2                   XYG3_Comp      energy
   naomg-SIE11  <PATH2>/G2                   XYG3_Comp      energy
   nh32+-SIE11  <PATH2>/G2                   XYG3_Comp      energy
 nh3_clf-SIE11  <PATH2>/G2                   XYG3_Comp      energy
     nh3-SIE11  <PATH2>/G2                   XYG3_Comp      energy
    nh3+-SIE11  <PATH2>/G2                   XYG3_Comp      energy
    
# Training set for the atomization energy
#             304  = 223+3+13+22+9+25+11 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 223 1.0
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
# "223 HOFs in the G3 set"
 3         G2-1    -1   Li_0  1  H_0  1                  0.092403375  1.0
 3         G2-2    -1   Be_0  1  H_0  1                  0.0795458    1.0
 3         G2-3    -1    C_0  1  H_0  1                  0.133853728  1.0
 3         G2-4    -1    C_0  1  H_0  2                  0.303375656  1.0
 3         G2-5    -1    C_0  1  H_0  2                  0.288309299  1.0
 3         G2-6    -1    C_0  1  H_0  3                  0.490117257  1.0
 3         G2-7    -1    C_0  1  H_0  4                  0.669622518  1.0
 3         G2-8    -1    N_0  1  H_0  1                  0.133190604  1.0
 3         G2-9    -1    N_0  1  H_0  2                  0.289590629  1.0
 3         G2-10   -1    N_0  1  H_0  3                  0.474783351  1.0
 3         G2-11   -1    O_0  1  H_0  1                  0.170048375  1.0
 3         G2-12   -1    O_0  1  H_0  2                  0.37095453   1.0
 3         G2-13   -1    F_0  1  H_0  1                  0.225371829  1.0
 3         G2-14   -1   Si_0  1  H_0  2                  0.242086823  1.0
 3         G2-15   -1   Si_0  1  H_0  2                  0.209009657  1.0
 3         G2-16   -1   Si_0  1  H_0  3                  0.35990075   1.0
 3         G2-17   -1   Si_0  1  H_0  4                  0.513767576  1.0
 3         G2-18   -1    P_0  1  H_0  2                  0.243712353  1.0
 3         G2-19   -1    P_0  1  H_0  3                  0.385528133  1.0
 3         G2-20   -1    S_0  1  H_0  2                  0.291602754  1.0
 3         G2-21   -1   Cl_0  1  H_0  1                  0.17085893   1.0
 2         G2-22   -1   Li_0  2                          0.038835272  1.0
 3         G2-23   -1   Li_0  1  F_0  1                  0.219707544  1.0
 3         G2-24   -1    C_0  2  H_0  2                  0.646659906  1.0
 3         G2-25   -1    C_0  2  H_0  4                  0.898075275  1.0
 3         G2-26   -1    C_0  2  H_0  6                  1.135077203  1.0
 3         G2-27   -1    C_0  1  N_0  1                  0.289259411  1.0
 4         G2-28   -1    H_0  1  C_0  1  N_0  1          0.498407565  1.0
 3         G2-29   -1    C_0  1  O_0  1                  0.413717782  1.0
 4         G2-30   -1    H_0  1  C_0  1  O_0  1          0.444654635  1.0
 4         G2-31   -1    H_0  2  C_0  1  O_0  1          0.596019903  1.0
 4         G2-32   -1    H_0  4  C_0  1  O_0  1          0.817212996  1.0
 2         G2-33   -1    N_0  2                          0.36414644   1.0
 3         G2-34   -1    N_0  2  H_0  4                  0.698528548  1.0
 3         G2-35   -1    N_0  1  O_0  1                  0.24374825   1.0
 2         G2-36   -1    O_0  2                          0.192402459  1.0
 3         G2-37   -1    H_0  2  O_0  2                  0.428894913  1.0
 2         G2-38   -1    F_0  2                          0.0622955    1.0
 3         G2-39   -1    C_0  1  O_0  2                  0.621027324  1.0
 2         G2-40   -1   Na_0  2                          0.027142761  1.0
 2         G2-41   -1   Si_0  2                          0.12042782   1.0
 2         G2-42   -1    P_0  2                          0.186803218  1.0
 2         G2-43   -1    S_0  2                          0.16368255   1.0
 2         G2-44   -1   Cl_0  2                          0.094969755  1.0
 3         G2-45   -1   Na_0  1 Cl_0  1                  0.157510754  1.0
 3         G2-46   -1   Si_0  1  O_0  1                  0.307429344  1.0
 3         G2-47   -1    S_0  1  C_0  1                  0.274114821  1.0
 3         G2-48   -1    S_0  1  O_0  1                  0.200487054  1.0
 3         G2-49   -1   Cl_0  1  O_0  1                  0.104509325  1.0
 3         G2-50   -1    F_0  1 Cl_0  1                  0.09968412   1.0
 3         G2-51   -1   Si_0  2  H_0  6                  0.846627981  1.0
 4         G2-52   -1    C_0  1  H_0  3 Cl_0  1          0.630098683  1.0
 4         G2-53   -1    H_0  4  C_0  1  S_0  1          0.755769935  1.0
 4         G2-54   -1    H_0  1  O_0  1 Cl_0  1          0.263622584  1.0
 3         G2-55   -1    S_0  1  O_0  2                  0.40977415   1.0
 3         G2-56   -1    F_0  3  B_0  1                  0.74694868   1.0
 3         G2-57   -1   Cl_0  3  B_0  1                  0.51017942   1.0
 3         G2-58   -1    F_0  3 Al_0  1                  0.67753946   1.0
 3         G2-59   -1   Cl_0  3 Al_0  1                  0.48365767   1.0
 3         G2-60   -1    F_0  4  C_0  1                  0.75572254   1.0
 3         G2-61   -1   Cl_0  4  C_0  1                  0.49244831   1.0
 4         G2-62   -1    C_0  1  O_0  1  S_0  1          0.52995016   1.0
 3         G2-63   -1    C_0  1  S_0  2                  0.44080292   1.0
 4         G2-64   -1    C_0  1  F_0  2  O_0  1          0.67220091   1.0
 3         G2-65   -1    F_0  4 Si_0  1                  0.90971726   1.0
 3         G2-66   -1   Cl_0  4 Si_0  1                  0.60482198   1.0
 3         G2-67   -1    N_0  2  O_0  1                  0.43060819   1.0
 4         G2-68   -1   Cl_0  1  N_0  1  O_0  1          0.30319860   1.0
 3         G2-69   -1    F_0  3  N_0  1                  0.32386570   1.0
 3         G2-70   -1    F_0  3  P_0  1                  0.57763820   1.0
 2         G2-71   -1    O_0  3                          0.23267266   1.0
 3         G2-72   -1    F_0  2  O_0  1                  0.14627886   1.0
 3         G2-73   -1    F_0  3 Cl_0  1                  0.19614786   1.0
 3         G2-74   -1    F_0  4  C_0  2                  0.92736989   1.0
 3         G2-75   -1   Cl_0  4  C_0  2                  0.73777659   1.0
 4         G2-76   -1    F_0  3  C_0  2  N_0  1          1.01663576   1.0
 3         G2-77   -1    H_0  4  C_0  3                  1.12296063   1.0
 3         G2-78   -1    H_0  4  C_0  3                  1.12009989   1.0
 3         G2-79   -1    H_0  4  C_0  3                  1.08751170   1.0
 3         G2-80   -1    H_0  6  C_0  3                  1.37075983   1.0
 3         G2-81   -1    H_0  6  C_0  3                  1.35900783   1.0
 3         G2-82   -1    H_0  8  C_0  3                  1.60333895   1.0
 3         G2-83   -1    H_0  6  C_0  4                  1.61273955   1.0
 3         G2-84   -1    H_0  6  C_0  4                  1.59938800   1.0
 3         G2-85   -1    H_0  6  C_0  4                  1.57787558   1.0
 3         G2-86   -1    H_0  6  C_0  4                  1.57216644   1.0
 3         G2-87   -1    H_0  6  C_0  4                  1.59551550   1.0
 3         G2-88   -1    H_0  8  C_0  4                  1.82982714   1.0
 3         G2-89   -1    H_0  8  C_0  4                  1.84528080   1.0
 3         G2-90   -1    H_0 10  C_0  4                  2.07228855   1.0
 3         G2-91   -1    H_0 10  C_0  4                  2.07506255   1.0
 3         G2-92   -1    H_0  8  C_0  5                  2.04522760   1.0
 3         G2-93   -1    H_0  6  C_0  6                  2.17883457   1.0
 4         G2-94   -1    H_0  2  F_0  2  C_0  1          0.69382557   1.0
 4         G2-95   -1    H_0  1  F_0  3  C_0  1          0.72703017   1.0
 4         G2-96   -1    H_0  2 Cl_0  2  C_0  1          0.58647134   1.0
 4         G2-97   -1    H_0  1 Cl_0  3  C_0  1          0.54267582   1.0
 4         G2-98   -1    H_0  5  C_0  1  N_0  1          0.92752728   1.0
 4         G2-99   -1    H_0  3  C_0  2  N_0  1          0.98082788   1.0
 5         G2-100  -1    H_0  3  C_0  1  N_0  1  O_0  2  0.95668597   1.0
 5         G2-101  -1    H_0  3  C_0  1  N_0  1  O_0  2  0.95224012   1.0
 4         G2-102  -1    H_0  6  C_0  1 Si_0  1          0.99878182   1.0
 4         G2-103  -1    H_0  2  C_0  1  O_0  2          0.79727935   1.0
 4         G2-104  -1    H_0  4  C_0  2  O_0  2          1.24926768   1.0
 5         G2-105  -1    H_0  5  C_0  2  N_0  1  O_0  1  1.38294487   1.0
 4         G2-106  -1    H_0  5  C_0  2  N_0  1          1.14678879   1.0
 3         G2-107  -1    N_0  2  C_0  2                  0.80017573   1.0
 4         G2-108  -1    H_0  7  C_0  2  N_0  1          1.38625285   1.0
 4         G2-109  -1    H_0  7  C_0  2  N_0  1          1.39759140   1.0
 4         G2-110  -1    H_0  2  C_0  2  O_0  1          0.84767645   1.0
 4         G2-111  -1    H_0  4  C_0  2  O_0  1          1.03590961   1.0
 4         G2-112  -1    H_0  4  C_0  2  O_0  1          1.07796296   1.0
 4         G2-113  -1    H_0  2  C_0  2  O_0  2          1.00831471   1.0
 4         G2-114  -1    H_0  6  C_0  2  O_0  1          1.29014835   1.0
 4         G2-115  -1    H_0  6  C_0  2  O_0  1          1.27038731   1.0
 4         G2-116  -1    H_0  4  C_0  2  S_0  1          0.99267223   1.0
 5         G2-117  -1    H_0  6  C_0  2  S_0  1  O_0  1  1.36095891   1.0
 4         G2-118  -1    H_0  6  C_0  2  S_0  1          1.22376667   1.0
 4         G2-119  -1    H_0  6  C_0  2  S_0  1          1.22123469   1.0
 4         G2-120  -1    H_0  3  C_0  2  F_0  1          0.91027531   1.0
 4         G2-121  -1    H_0  5  C_0  2 Cl_0  1          1.09974880   1.0
 4         G2-122  -1    H_0  3  C_0  2 Cl_0  1          0.85740225   1.0
 4         G2-123  -1    H_0  3  C_0  3  N_0  1          1.21691900   1.0
 4         G2-124  -1    H_0  6  C_0  3  O_0  1          1.55830048   1.0
 4         G2-125  -1    H_0  4  C_0  2  O_0  2          1.27840337   1.0
 5         G2-126  -1    H_0  3  C_0  2  O_0  1  F_0  1  1.12360527   1.0
 5         G2-127  -1    H_0  3  C_0  2  O_0  1 Cl_0  1  1.06167252   1.0
 4         G2-128  -1    H_0  7  C_0  3 Cl_0  1          1.56832046   1.0
 4         G2-129  -1    H_0  8  C_0  3  O_0  1          1.76486891   1.0
 4         G2-130  -1    H_0  8  C_0  3  O_0  1          1.74353938   1.0
 4         G2-131  -1    H_0  9  C_0  3  N_0  1          1.84838186   1.0
 4         G2-132  -1    H_0  4  C_0  4  O_0  1          1.58274796   1.0
 4         G2-133  -1    H_0  4  C_0  4  S_0  1          1.53284857   1.0
 4         G2-134  -1    H_0  5  C_0  4  N_0  1          1.70722514   1.0
 4         G2-135  -1    H_0  5  C_0  5  N_0  1          1.97171610   1.0
 2         G2-136  -1    H_0  2                          0.17457832   1.0
 3         G2-137  -1    H_0  1  S_0  1                  0.13755977   1.0
 3         G2-138  -1    H_0  1  C_0  2                  0.42340140   1.0
 3         G2-139  -1    H_0  3  C_0  2                  0.70850615   1.0
 4         G2-140  -1    H_0  3  C_0  2  O_0  1          0.92585280   1.0
 4         G2-141  -1    H_0  3  C_0  1  O_0  1          0.65179374   1.0
 4         G2-142  -1    H_0  3  C_0  1  O_0  1          0.63743824   1.0
 4         G2-143  -1    H_0  5  C_0  2  O_0  1          1.11054006   1.0
 4         G2-144  -1    H_0  3  C_0  1  S_0  1          0.60601894   1.0
 3         G2-145  -1    H_0  5  C_0  2                  0.96116402   1.0
 3         G2-146  -1    H_0  7  C_0  3                  1.43397653   1.0
 3         G2-147  -1    H_0  9  C_0  4                  1.90955842   1.0
 3         G2-148  -1    N_0  1  O_0  2                  0.36159926   1.0
 3         G2-149  -1    H_0  6  C_0  4                  1.59205297   1.0
 3         G2-150  -1    H_0  8  C_0  5                  2.08673592   1.0
 3         G2-151  -1    H_0 10  C_0  5                  2.33204498   1.0
 3         G2-152  -1    H_0 12  C_0  5                  2.54149091   1.0
 3         G2-153  -1    H_0 12  C_0  5                  2.54863836   1.0
 3         G2-154  -1    H_0  8  C_0  6                  2.35336098   1.0
 3         G2-155  -1    H_0  8  C_0  6                  2.35386838   1.0
 3         G2-156  -1    H_0 12  C_0  6                  2.81109456   1.0
 3         G2-157  -1    H_0 14  C_0  6                  3.01012095   1.0
 3         G2-158  -1    H_0 14  C_0  6                  3.01159012   1.0
 3         G2-159  -1    H_0  8  C_0  7                  2.65153542   1.0
 3         G2-160  -1    H_0 16  C_0  7                  3.47918491   1.0
 3         G2-161  -1    H_0  8  C_0  8                  2.83349490   1.0
 3         G2-162  -1    H_0 18  C_0  8                  3.94812829   1.0
 3         G2-163  -1    H_0  8  C_0 10                  3.44440377   1.0
 3         G2-164  -1    H_0  8  C_0 10                  3.39028835   1.0
 4         G2-165  -1    H_0  6  C_0  3  O_0  2          1.73111684   1.0
 4         G2-166  -1    H_0 10  C_0  4  O_0  1          2.24002915   1.0
 4         G2-167  -1    H_0  7  C_0  6  N_0  1          2.45321599   1.0
 4         G2-168  -1    H_0  6  C_0  6  O_0  1          2.34409561   1.0
 4         G2-169  -1    H_0  6  C_0  4  O_0  1          1.75693771   1.0
 4         G2-170  -1    H_0  8  C_0  4  O_0  1          2.00952428   1.0
 4         G2-171  -1    H_0  8  C_0  5  O_0  1          2.28800836   1.0
 4         G2-172  -1    H_0  4  C_0  6  O_0  2          2.26630874   1.0
 4         G2-173  -1    H_0  4  C_0  4  N_0  2          1.76570905   1.0
 5         G2-174  -1    H_0  6  C_0  2  O_0  2  S_0  1  1.54362509   1.0
 4         G2-175  -1    H_0  5  C_0  6 Cl_0  1          2.14409885   1.0 
 4         G2-176  -1    H_0  4  C_0  4  N_0  2          1.75905227   1.0
 4         G2-177  -1    H_0  4  C_0  4  N_0  2          1.76530161   1.0
 4         G2-178  -1    H_0  4  C_0  4  O_0  1          1.54201931   1.0
 4         G2-179  -1    H_0  6  C_0  4  O_0  1          1.79040441   1.0
 4         G2-180  -1    H_0  6  C_0  4  O_0  3          2.16492882   1.0
 4         G2-181  -1    H_0  6  C_0  4  S_0  1          1.72815283   1.0
 4         G2-182  -1    H_0  7  C_0  4  N_0  1          1.92257336   1.0
 4         G2-183  -1    H_0  8  C_0  4  O_0  1          2.02767063   1.0
 4         G2-184  -1    H_0  8  C_0  4  O_0  1          2.01890919   1.0
 4         G2-185  -1    H_0  8  C_0  4  O_0  2          2.15750503   1.0
 4         G2-186  -1    H_0  8  C_0  4  S_0  1          1.96007688   1.0
 4         G2-187  -1    H_0  9  C_0  4 Cl_0  1          2.04701055   1.0
 4         G2-188  -1    H_0  9  C_0  4 Cl_0  1          2.03818723   1.0
 4         G2-189  -1    H_0  9  C_0  4  N_0  1          2.11980158   1.0
 5         G2-190  -1    H_0  9  C_0  4  N_0  1  O_0  2  2.37335355   1.0
 4         G2-191  -1    H_0 10  C_0  4  O_0  1          2.21812928   1.0
 4         G2-192  -1    H_0 10  C_0  4  O_0  2          2.36795405   1.0
 4         G2-193  -1    H_0 10  C_0  4  S_0  1          2.16849056   1.0
 4         G2-194  -1    H_0 10  C_0  4  S_0  2          2.26338171   1.0
 4         G2-195  -1    H_0 11  C_0  4  N_0  1          2.34602949   1.0
 4         G2-196  -1    H_0 12  C_0  4 Si_0  1          2.46140361   1.0
 4         G2-197  -1    H_0  6  C_0  5  S_0  1          2.00548689   1.0                                                
 4         G2-198  -1    H_0  7  C_0  5  N_0  1          2.16982749   1.0
 4         G2-199  -1    H_0 10  C_0  5  O_0  1          2.48581633   1.0
 4         G2-200  -1    H_0 10  C_0  5  O_0  1          2.49595703   1.0
 4         G2-201  -1    H_0 10  C_0  5  O_0  2          2.67892842   1.0
 4         G2-202  -1    H_0 10  C_0  5  S_0  1          2.43220660   1.0
 4         G2-203  -1    H_0 11  C_0  5  N_0  1          2.59763095   1.0
 4         G2-204  -1    H_0 12  C_0  5  O_0  1          2.68976010   1.0
 4         G2-205  -1    H_0  4  C_0  6  F_0  2          2.20636400   1.0
 4         G2-206  -1    H_0  4  C_0  6  F_0  2          2.20534490   1.0
 4         G2-207  -1    H_0  5  C_0  6  F_0  1          2.19356444   1.0
 4         G2-208  -1    H_0 14  C_0  6  O_0  1          3.16441770   1.0
 3         G2-209  -1    F_0  5  P_0  1                  0.88358498   1.0
 3         G2-210  -1    F_0  6  S_0  1                  0.75582233   1.0
 2         G2-211  -1    P_0  4                          0.46156839   1.0
 3         G2-212  -1    O_0  3  S_0  1                  0.54484235   1.0
 3         G2-213  -1   Cl_0  2  S_0  1                  0.20110480   1.0
 4         G2-214  -1   Cl_0  3  P_0  1  O_0  1          0.56689332   1.0
 3         G2-215  -1   Cl_0  5  P_0  1                  0.48488074   1.0
 4         G2-216  -1   Cl_0  2  O_0  2  S_0  1          0.52391177   1.0
 3         G2-217  -1   Cl_0  3  P_0  1                  0.36621229   1.0
 3         G2-218  -1   Cl_0  2  S_0  2                  0.30603388   1.0
 3         G2-219  -1   Cl_0  2 Si_0  1                  0.32457634   1.0
 4         G2-220  -1    F_0  3 Cl_0  1  C_0  1          0.68421344   1.0
 3         G2-221  -1    F_0  6  C_0  2                  1.25171994   1.0
 3         G2-222  -1    F_0  3  C_0  1                  0.54527011   1.0
 3         G2-223  -1    H_0  5  C_0  6                  1.98722459   1.0
# TMD-BE3
 2  Cr2-BE3     -1    Cr-BE3    2                         0.057370000   00.0
 2  V2-BE3      -1    V-BE3     2                         0.102309000   00.0
 2  Fe2-BE3     -1    Fe-BE3    2                         0.042262000   00.0
# TM-BE13
 3 TiCl-BE13    -1 Ti-BE13   1 Cl-BE13    1                   0.16060302   20.0000
 3 VF5-BE13     -1 V-BE13    1 F-BE13     5                   0.89902950   20.0000
 3 CrCl-BE13    -1 Cr-BE13   1 Cl-BE13    1                   0.14366305   20.0000
 4 CrOF-BE13    -1 Cr-BE13   1 O-BE13     1 F-BE13 1          0.39454351   20.0000
 3 Fe2Br4-BE13  -1 Fe2-BE13  1 Br-BE13    4                   0.58453252   20.0000
 5 CoC4O4H-BE13 -1 Co-BE13   1 C-BE13     4 O-BE13 4 H-BE13 1 1.96033529   00.0000
 3 NiCH2+-BE13  -1 Ni+-BE13  1 CH2-BE13   1                   0.12159169   20.0000
 3 FeC5O5-BE13  -1 Fe-BE13   1 CO_di-BE13 5                   0.23489666   20.0000
 3 VS-BE13      -1 V-BE13    1 S-BE13     1                   0.17035585   20.0000
 3 CuH-BE13     -1 Cu-BE13   1 H-BE13     1                   0.09975937   20.0000
 3 CuCl-BE13    -1 Cu-BE13   1 Cl-BE13    1                   0.13975873   20.0000
 3 VO-BE13      -1 V-BE13    1 O-BE13     1                   0.24063362   20.0000
 3 NiCl-BE13    -1 Ni-BE13   1 Cl-BE13    1                   0.14023681   20.0000 
# S22
 2     1-S22    -1    01a-S22    2                            0.00505171    0.0000
 2     2-S22    -1    02a-S22    2                            0.00799987    0.0000
 2     3-S22    -1    03a-S22    2                            0.02995968    0.0000
 2     4-S22    -1    04a-S22    2                            0.02568883    0.0000
 2     5-S22    -1    05a-S22    2                            0.03297159    0.0000
 3     6-S22    -1    06a-S22    1    06b-S22    1            0.02709120    0.0000
 3     7-S22    -1    07a-S22    1    07b-S22    1            0.02667687    0.0000
 2     8-S22    -1    08a-S22    2                            0.00084461    0.0000
 2     9-S22    -1    09a-S22    2                            0.00239040    0.0000
 3    10-S22    -1    10a-S22    1    10b-S22    1            0.00231072    0.0000
 2    11-S22    -1    11a-S22    2                            0.00417523    0.0000
 2    12-S22    -1    12a-S22    2                            0.00669312    0.0000
 2    13-S22    -1    13a-S22    2                            0.01552166    0.0000
 3    14-S22    -1    14a-S22    1    14b-S22    1            0.00731462    0.0000
 3    15-S22    -1    15a-S22    1    15b-S22    1            0.01858138    0.0000
 3    16-S22    -1    16a-S22    1    16b-S22    1            0.00240634    0.0000
 3    17-S22    -1    17a-S22    1    17b-S22    1            0.00524294    0.0000
 3    18-S22    -1    18a-S22    1    18b-S22    1            0.00369715    0.0000
 3    19-S22    -1    19a-S22    1    19b-S22    1            0.00725088    0.0000
 3    20-S22    -1    20a-S22    1    20b-S22    1            0.00431866    0.0000
 3    21-S22    -1    21a-S22    1    21b-S22    1            0.00895603    0.0000
 3    22-S22    -1    22a-S22    1    22b-S22    1            0.01129862    0.0000
# DC9 
 2       ISO_E36-DC9     1         ISO_P36-DC9    -1                     -0.00159360   00.0000
 2       c20cage-DC9    -1         c20bowl-DC9     1                     -0.02119488   00.0000
 2   heptatriyne-DC9     1    heptahexaene-DC9    -1                     -0.02278848   00.0000
 2       tmethen-DC9    -2            omcb-DC9     1                     -0.03059712   00.0000
 2       ISO_E35-DC9     1         ISO_P35-DC9    -1                     -0.03107520   00.0000
 2     carbooxo2-DC9    -1       carbooxo1-DC9     1                     -0.04286784   00.0000
 3         ethen-DC9    -1           ch2n2-DC9    -1   13dip-DC9    1    -0.06071616   00.0000
 2           be4-DC9     1              be-DC9    -4                     -0.14087425   00.0000
 2            s2-DC9    -4              s8-DC9     1                     -0.16095361   00.0000
# G2RC
 3   118-G2RC   -1   117-G2RC   1    13-G2RC    1                    -0.00152986    0.0000
 3    40-G2RC   -1     1-G2RC  -1   104-G2RC    1                    -0.00323501    0.0000
 3   113-G2RC   -1    30-G2RC   1     8-G2RC    1                    -0.00406368    0.0000
 3    52-G2RC   -1     1-G2RC  -1    18-G2RC    2                    -0.00618317    0.0000
 4    30-G2RC   -1    13-G2RC  -1    40-G2RC    1     1-G2RC    1    -0.01117114    0.0000
 4   128-G2RC   -1    13-G2RC  -1   126-G2RC    1    22-G2RC    1    -0.01587226    0.0000
 3   100-G2RC   -1    13-G2RC  -1   106-G2RC    1                    -0.03207917    0.0000
 3    25-G2RC   -1    14-G2RC  -1   121-G2RC    1                    -0.04042963    0.0000
 3    39-G2RC   -1    45-G2RC  -1    51-G2RC    2                    -0.04210291    0.0000
 4    58-G2RC   -1    59-G2RC  -1    57-G2RC    1    60-G2RC    1    -0.04278816    0.0000
 4    67-G2RC   -1    61-G2RC  -1    66-G2RC    1    62-G2RC    1    -0.04195949    0.0000
 3    32-G2RC   -1     1-G2RC  -1    33-G2RC    1                    -0.04658093    0.0000
 3    25-G2RC   -1    26-G2RC  -1    88-G2RC    1                    -0.05215853    0.0000
 4    47-G2RC   -1     1-G2RC  -3    18-G2RC    1    13-G2RC    1    -0.05403898    0.0000
 3    34-G2RC   -1     1-G2RC  -3    11-G2RC    2                    -0.06194324    0.0000
 4     8-G2RC   -1    45-G2RC  -2    97-G2RC    1    22-G2RC    2    -0.07502669    0.0000
 3    25-G2RC   -1     1-G2RC  -1    26-G2RC    1                    -0.07716212    0.0000
 4    56-G2RC   -1     1-G2RC  -3    21-G2RC    1    13-G2RC    2    -0.09636500    0.0000
 4    30-G2RC   -1     1-G2RC  -3    13-G2RC    1     8-G2RC    1    -0.10323341    0.0000
 4    73-G2RC   -1     1-G2RC  -1    39-G2RC    1    13-G2RC    1    -0.10951220    0.0000
 4    68-G2RC   -1     1-G2RC  -1    34-G2RC    1    13-G2RC    1    -0.12866727    0.0000
 3    26-G2RC   -1     6-G2RC  -1    82-G2RC    1                    -0.17379803    0.0000
 3     1-G2RC   -1    39-G2RC  -1    14-G2RC    2                    -0.21400456    0.0000
 2    25-G2RC   -3    94-G2RC   1                                    -0.24154197    0.0000
 3    23-G2RC   -1    39-G2RC  -1    24-G2RC    2                    -0.33895874    0.0000
# SIE11 
 3      he-SIE11     1       he+-SIE11     1       he2+-SIE11    -1    0.09153639  00.0000
 3     nh3-SIE11     1      nh3+-SIE11     1      nh32+-SIE11    -1    0.05631783  00.0000
 3     h2o-SIE11     1      h2o+-SIE11     1      h2o2+-SIE11    -1    0.05936160  00.0000
 3    but+-SIE11    -1     ethyl-SIE11     1     ethyl+-SIE11     1    0.05622221  00.0000
 3     ch3-SIE11     1    acetyl-SIE11     1    aceton+-SIE11    -1    0.03596755  00.0000
 2   clclf-SIE11     1     clfcl-SIE11    -1                          -0.00160954  00.0000
 3    c2h4-SIE11     1        f2-SIE11     1    c2h4_f2-SIE11    -1    0.00172109  00.0000
 3      li-SIE11     1        bz-SIE11     1      bz_li-SIE11    -1    0.01513920  00.0000
 3     nh3-SIE11     1       clf-SIE11     1    nh3_clf-SIE11    -1    0.01673280  00.0000
 3     mgo-SIE11     1        na-SIE11     1      naomg-SIE11    -1    0.11085082  00.0000
 3      li-SIE11     1        f2-SIE11     1      li_f2-SIE11    -1    0.15037211  00.0000

__xyg3 components__ :: 238
#G2             E[noXC]         X Energy HF    X Energy DFT   C Energy GGA  C osRPA      X_Energy_SCAN  C_Energy_SCAN
# 15+223
     H_0     -0.19247959     -0.30687159     -0.30179193    -0.00570858     0.00000000     -0.30755235     0.00000000
    Li_0     -5.65798850     -1.77224410     -1.75253153    -0.05103457     0.00000000     -1.77517123    -0.04600936
    Be_0    -11.90916606     -2.66090698     -2.63478636    -0.08560802    -0.05290639     -2.65640384    -0.08354853
     B_0    -20.77571233     -3.75290115     -3.72360801    -0.11262385    -0.06856123     -3.75004104    -0.11454377
     C_0    -32.63856543     -5.04913072     -5.01620383    -0.14382435    -0.08098988     -5.05383069    -0.14622523
     N_0    -47.82715490     -6.57104630     -6.52990170    -0.17862010    -0.09081553     -6.58109756    -0.18035276
     O_0    -66.63783339     -8.17291239     -8.14404239    -0.23302903    -0.14510197     -8.20047186    -0.23473172
     F_0    -89.41655029     -9.99000297     -9.97010860    -0.28936467    -0.19854588    -10.04094142    -0.28973833
    Na_0   -147.87798661    -13.97058000    -13.92511209    -0.36887943     0.00000000    -14.03333210    -0.36555158
    Mg_0   -183.64910989    -15.95591722    -15.89666982    -0.40918925    -0.04099331    -16.01382492    -0.41074617
    Al_0   -223.81999563    -18.04992258    -17.97165156    -0.44432482    -0.05393009    -18.10685199    -0.44684207
    Si_0   -268.58273011    -20.26453184    -20.16737589    -0.48339922    -0.07085251    -20.32473468    -0.48454653
     P_0   -318.10314948    -22.60608683    -22.48731988    -0.52498051    -0.08539973    -22.67093447    -0.52348949
     S_0   -372.51073475    -24.99023685    -24.85873538    -0.58309321    -0.13264595    -25.06460934    -0.57969818
    Cl_0   -431.97746601    -27.49953357    -27.35395335    -0.64311513    -0.17102559    -27.58534404    -0.63633399
    G2-1     -5.85793974     -2.12599115     -2.10596838    -0.08330068    -0.04216345     -2.13201301    -0.07794537
    G2-2    -12.08307909     -3.06493715     -3.03170284    -0.10311703    -0.04863612     -3.06536169    -0.09687098
    G2-3    -32.87853086     -5.39783489     -5.37077609    -0.18414428    -0.12344253     -5.41184739    -0.17914641
    G2-4    -33.09043451     -5.84204343     -5.80403422    -0.21428712    -0.12828496     -5.85621915    -0.20626926
    G2-5    -33.12104765     -5.76606542     -5.73927949    -0.22330965    -0.17309535     -5.78666838    -0.21105752
    G2-6    -33.36992580     -6.20264080     -6.16426766    -0.25858067    -0.16957034     -6.22192944    -0.24550980
    G2-7    -33.63843645     -6.56874258     -6.53000832    -0.29973118    -0.21667063     -6.58960536    -0.28059365
    G2-8    -48.07429451     -6.90276366     -6.87788364    -0.22454128    -0.14341848     -6.92872524    -0.22157304
    G2-9    -48.32331391     -7.25897374     -7.24336879    -0.26974845    -0.19217721     -7.29829457    -0.26209845
   G2-10    -48.57195844     -7.64344202     -7.63119815    -0.31391418    -0.24020433     -7.68696970    -0.30105235
   G2-11    -66.89444532     -8.52324165     -8.51654731    -0.27912632    -0.20203612     -8.57504838    -0.27659494
   G2-12    -67.14877563     -8.90803852     -8.91503769    -0.32451454    -0.25683765     -8.97280691    -0.31725888
   G2-13    -89.68425412    -10.37541788    -10.38329855    -0.33488425    -0.26078997    -10.44990969    -0.33135800
   G2-14   -269.06650545    -20.95182891    -20.84945214    -0.55366826    -0.14975858    -21.02176362    -0.54265366
   G2-15   -269.02175955    -20.98854631    -20.87811811    -0.54384415    -0.10942934    -21.05785511    -0.53354721
   G2-16   -269.28239545    -21.34471440    -21.22573382    -0.58045106    -0.14732836    -21.41420395    -0.56389561
   G2-17   -269.53840980    -21.70901475    -21.58033486    -0.61513957    -0.18810831    -21.77895640    -0.59153755
   G2-18   -318.60198500    -23.27390394    -23.15502704    -0.60475160    -0.16362858    -23.35184567    -0.59336655
   G2-19   -318.85338891    -23.62228574    -23.50084188    -0.64261730    -0.20633073    -23.70511043    -0.62462653
   G2-20   -373.02868321    -25.67546549    -25.54824528    -0.66594285    -0.21606081    -25.76630498    -0.65107682
   G2-21   -432.24703429    -27.85230414    -27.71107533    -0.68608721    -0.21944986    -27.94757501    -0.67310644
   G2-22    -11.32339651     -3.54257657     -3.50836296    -0.12360603    -0.04253090     -3.54524886    -0.11856922
   G2-23    -95.07183614    -11.90410172    -11.91244136    -0.37529857    -0.26625753    -11.99251796    -0.37508800
   G2-24    -65.86569157    -10.97250536    -10.96340956    -0.42950133    -0.31871400    -11.03452404    -0.41902743
   G2-25    -66.33029358    -11.72050606    -11.68429104    -0.49399227    -0.35587767    -11.77229509    -0.47375776
   G2-26    -66.78101893    -12.46538116    -12.39973595    -0.55920877    -0.39453169    -12.50670249    -0.52828902
   G2-27    -80.59977708    -11.60026537    -11.64919271    -0.40010431    -0.31543192    -11.71064507    -0.40142956
   G2-28    -80.86261504    -12.03397372    -12.05187299    -0.43991840    -0.34369610    -12.12278144    -0.43413955
   G2-29    -99.47800731    -13.29115419    -13.31561127    -0.44845156    -0.35229231    -13.39299100    -0.44688265
   G2-30    -99.63076673    -13.64757758    -13.67538594    -0.47780824    -0.35074843    -13.75697256    -0.47421930
   G2-31    -99.86031103    -14.03814916    -14.05399315    -0.51459084    -0.39807132    -14.14319251    -0.50430494
   G2-32   -100.28606005    -14.79243073    -14.77615753    -0.58038699    -0.43436559    -14.88355537    -0.56056902
   G2-33    -95.87562529    -13.09823596    -13.13208523    -0.45165206    -0.36249475    -13.20475680    -0.44953239
   G2-34    -96.62773822    -14.58765716    -14.58103263    -0.58513311    -0.44245835    -14.67832293    -0.56712501
   G2-35   -114.59798722    -14.68568344    -14.73652649    -0.49019971    -0.38451822    -14.81364382    -0.49179321
   G2-36   -133.36939259    -16.29316011    -16.36032783    -0.52892808    -0.40159756    -16.44720235    -0.53229432
   G2-37   -133.80051501    -17.02544723    -17.08108329    -0.59811446    -0.48848439    -17.18044554    -0.59162645
   G2-38   -178.86847951    -19.87616305    -19.95455468    -0.61268724    -0.51029815    -20.07066672    -0.61300276
   G2-39   -166.12323458    -21.55922340    -21.62929050    -0.73928897    -0.57885504    -21.75186250    -0.73673264
   G2-40   -295.76690544    -27.92709719    -27.84953754    -0.75600896    -0.03723819    -28.05380686    -0.75473685
   G2-41   -537.21348185    -40.54061972    -40.37480551    -1.00833706    -0.18240706    -40.68669314    -1.00803302
   G2-42   -636.31955547    -45.14950158    -44.97834090    -1.12649760    -0.30570977    -45.33291409    -1.12123340
   G2-43   -745.09879859    -49.97332595    -49.76839122    -1.22088534    -0.32874896    -50.17076654    -1.21362955
   G2-44   -863.99075134    -54.98556130    -54.73803406    -1.32380139    -0.40922402    -55.18923539    -1.30990370
   G2-45   -579.85318309    -41.58322015    -41.39778718    -1.04636919    -0.21518464    -41.74371060    -1.03290591
   G2-46   -335.34626898    -28.47629443    -28.43989224    -0.77618200    -0.34370110    -28.64126215    -0.77748085
   G2-47   -405.28800509    -30.04548773    -29.95621869    -0.79252602    -0.32828985    -30.18597952    -0.78660982
   G2-48   -439.22524576    -33.15756678    -33.09372722    -0.87307933    -0.36941411    -33.33965508    -0.87189040
   G2-49   -498.65922245    -35.61045305    -35.53484334    -0.92390892    -0.40541332    -35.80109274    -0.92052855
   G2-50   -521.42505857    -37.45744442    -37.37138456    -0.96841371    -0.45795857    -37.65501616    -0.96218108
   G2-51   -538.60339019    -42.74040510    -42.50024733    -1.19371768    -0.33917971    -42.88304030    -1.15434673
   G2-52   -465.39213234    -33.73955842    -33.57611356    -0.94237508    -0.39798595    -33.85945240    -0.91821789
   G2-53   -406.17057525    -31.56924651    -31.41865203    -0.92441166    -0.39495604    -31.68302108    -0.89843426
   G2-54   -498.89566532    -36.00627351    -35.91239704    -0.96084142    -0.45095787    -36.18736501    -0.95098525
   G2-55   -505.89261447    -41.36986239    -41.36731367    -1.16923194    -0.65129959    -41.65697053    -1.16628973
   G2-56   -289.19296917    -34.11330833    -34.12497200    -1.08960609    -0.80291540    -34.35457236    -1.08341110
   G2-57  -1316.83902298    -86.49679974    -86.07619175    -2.15510330    -0.69297430    -86.80605123    -2.12216266
   G2-58   -492.17580024    -48.40606575    -48.36705688    -1.40275764    -0.79697916    -48.71358199    -1.39808541
   G2-59  -1519.84299587   -100.83936723   -100.33484357    -2.47038646    -0.66478204   -101.19293817    -2.43451453
   G2-60   -390.45205141    -45.33170691    -45.38475875    -1.46832630    -1.09836694    -45.68120893    -1.45935909
   G2-61  -1760.67187238   -115.18743814   -114.67797763    -2.87792823    -0.96328866   -115.62596569    -2.84247196
   G2-62   -471.98464251    -38.32718405    -38.27203837    -1.08245925    -0.54514493    -38.55012965    -1.07497469
   G2-63   -777.82989960    -55.10728638    -54.92724800    -1.42705667    -0.51269539    -55.36088243    -1.41473153
   G2-64   -278.27643966    -33.43116002    -33.50047765    -1.10302300    -0.84140139    -33.70735861    -1.09815052
   G2-65   -626.42224458    -60.70955038    -60.64954301    -1.77926495    -1.06412769    -61.09145850    -1.76863480
   G2-66  -1996.61987886   -130.57325395   -129.92327759    -3.20451515    -0.90715226   -131.03429262    -3.15643489
   G2-67   -162.46725643    -21.25587975    -21.37277364    -0.74166349    -0.61153207    -21.47876770    -0.74153047
   G2-68   -546.62825170    -42.10015597    -42.09284941    -1.16183671    -0.64617304    -42.39165944    -1.15589057
   G2-69   -316.19327550    -36.44340001    -36.58468729    -1.17684538    -0.94670302    -36.79631673    -1.17695719
   G2-70   -586.50672605    -52.76022926    -52.72324643    -1.51218566    -0.87679895    -53.09990958    -1.50620106
   G2-71   -200.02485367    -24.29320576    -24.49880119    -0.81552824    -0.73908618    -24.61051314    -0.82069049
   G2-72   -245.54738949    -27.98325580    -28.12763150    -0.88867365    -0.74864510    -28.28346246    -0.89080609
   G2-73   -700.26043257    -57.34078332    -57.40106006    -1.60453054    -1.00748951    -57.79265088    -1.60420016
   G2-74   -423.10590071    -50.45637293    -50.53767737    -1.66284524    -1.24779047    -50.85638816    -1.65414579
   G2-75  -1793.33750868   -120.38261060   -119.87525452    -3.08057696    -1.10217600   -120.85324277    -3.04310613
   G2-76   -381.62238061    -46.97428288    -47.05029557    -1.57406071    -1.18984657    -47.34459847    -1.56458751
   G2-77    -99.01185789    -16.87707817    -16.84254382    -0.69098083    -0.49508153    -16.96035987    -0.66902326
   G2-78    -99.01856144    -16.86539344    -16.84028700    -0.69135880    -0.49657382    -16.95589848    -0.67033683
   G2-79    -98.95409414    -16.89250875    -16.85680163    -0.70384529    -0.49766120    -16.96951753    -0.68302070
   G2-80    -99.47877736    -17.61663551    -17.55510323    -0.75504439    -0.53433794    -17.69073226    -0.72317127
   G2-81    -99.42572000    -17.65647960    -17.58484163    -0.76989563    -0.53269556    -17.72106960    -0.73694039
   G2-82    -99.92798940    -18.35901557    -18.26663948    -0.81953957    -0.57359622    -18.42179415    -0.77689292
   G2-83   -132.17822769    -22.76963207    -22.71562783    -0.95047628    -0.67528578    -22.88025035    -0.91758794
   G2-84   -132.15608748    -22.78162542    -22.72150688    -0.95242207    -0.67209283    -22.88581059    -0.91902333
   G2-85   -132.11581837    -22.79899416    -22.73746451    -0.96552113    -0.67399228    -22.90058414    -0.93210442
   G2-86   -132.07410843    -22.82561229    -22.75358674    -0.98037515    -0.67542228    -22.91802544    -0.94591347
   G2-87   -132.12415268    -22.80035859    -22.73348883    -0.97000341    -0.67728994    -22.90037075    -0.93417694
   G2-88   -132.57556470    -23.54648923    -23.44694334    -1.03341917    -0.71515984    -23.63394774    -0.98666398
   G2-89   -132.62767528    -23.51221538    -23.42431707    -1.01678466    -0.71389695    -23.60866382    -0.97312034
   G2-90   -133.07425393    -24.25312209    -24.13397169    -1.08001060    -0.75281472    -24.33728892    -1.02563878
   G2-91   -133.07811987    -24.24964361    -24.13048277    -1.08087204    -0.75399415    -24.33467196    -1.02647551
   G2-92   -165.21483097    -28.73534793    -28.63586186    -1.24049057    -0.85122001    -28.84783470    -1.19436816
   G2-93   -197.55197428    -33.18938350    -33.11718769    -1.37086815    -0.94686330    -33.34922244    -1.33118424
   G2-94   -212.04064103    -25.93641866    -25.94998174    -0.87898569    -0.65992592    -26.12589829    -0.86536027
   G2-95   -301.25257055    -35.62835438    -35.66450139    -1.17294104    -0.88040044    -35.89990710    -1.16197683
   G2-96   -897.15133127    -60.89823918    -60.61633343    -1.58651124    -0.58326896    -61.12156446    -1.55830758
   G2-97  -1328.91185618    -88.04738276    -87.65074996    -2.23181703    -0.77190008    -88.37747386    -2.19990130
   G2-98    -81.70680256    -13.53533020    -13.49758035    -0.57211428    -0.41781338    -13.60129818    -0.54724357
   G2-99   -114.01048552    -17.94299070    -17.93462228    -0.70125778    -0.51890948    -18.05270705    -0.68386120
  G2-100   -214.60071035    -29.12149424    -29.21360273    -1.07378346    -0.84790279    -29.38479866    -1.05874697
  G2-101   -214.64502212    -29.06973833    -29.16800254    -1.06679020    -0.85243268    -29.34028270    -1.05247663
  G2-102   -302.68666690    -27.61671310    -27.46164550    -0.87594188    -0.36620551    -27.70807813    -0.84060795
  G2-103   -166.54100374    -22.27594353    -22.31937418    -0.80103931    -0.61778931    -22.45722559    -0.79039911
  G2-104   -199.68265495    -28.15935071    -28.18014796    -1.05785361    -0.79773067    -28.36881157    -1.03478863
  G2-105   -181.09613122    -26.93275760    -26.92618260    -1.05380422    -0.77684277    -27.11054226    -1.02576370
  G2-106   -114.36676885    -18.70411258    -18.66576577    -0.78074298    -0.55947551    -18.79850780    -0.75390326
  G2-107   -161.22802498    -23.39097912    -23.45848590    -0.84044462    -0.65515354    -23.58534913    -0.83704045
  G2-108   -114.85043705    -19.42178598    -19.35968000    -0.83135556    -0.59702629    -19.51175105    -0.79476120
  G2-109   -114.85852973    -19.42626856    -19.36289233    -0.83237671    -0.59713440    -19.51464907    -0.79587107
  G2-110   -132.56261405    -19.19841354    -19.22441851    -0.71502930    -0.53831653    -19.34331439    -0.70335905
  G2-111   -132.95585973    -19.94938848    -19.93762967    -0.78710888    -0.57811250    -20.07479898    -0.76502157
  G2-112   -133.01637811    -19.93585594    -19.92752057    -0.77559876    -0.57553679    -20.06457354    -0.75375355
  G2-113   -199.24719122    -27.39889315    -27.44773224    -0.98957027    -0.75885806    -27.61456406    -0.97668948
  G2-114   -133.43784929    -20.68600314    -20.64339867    -0.84059840    -0.61305353    -20.79923467    -0.80899864
  G2-115   -133.43282160    -20.67176147    -20.63315762    -0.83750643    -0.61364743    -20.79054680    -0.80549169
  G2-116   -438.83439984    -36.75283542    -36.60171086    -1.13403841    -0.53758393    -36.89427458    -1.10701372
  G2-117   -505.94862932    -45.66588185    -45.54279302    -1.46784703    -0.81045115    -45.89922848    -1.43197835
  G2-118   -439.31875273    -37.46179156    -37.28508174    -1.18475027    -0.57441277    -37.59758409    -1.14708503
  G2-119   -439.31634770    -37.46119005    -37.28762279    -1.18401082    -0.57488684    -37.59869251    -1.14703546
  G2-120   -155.53292681    -21.40051885    -21.39557210    -0.78526697    -0.57936816    -21.54207117    -0.76772443
  G2-121   -498.54339569    -39.63157717    -39.44260445    -1.20255617    -0.57713612    -39.77429867    -1.16665417
  G2-122   -498.08804341    -38.88813153    -38.73309521    -1.13945502    -0.54021754    -39.04413036    -1.11464460
  G2-123   -146.70539976    -23.09147492    -23.09188010    -0.89570524    -0.66105849    -23.23857322    -0.87720733
  G2-124   -166.16743155    -25.83615814    -25.80076670    -1.03713412    -0.75371670    -25.98689318    -1.00341104
  G2-125   -199.68970462    -28.18127456    -28.19544103    -1.06234027    -0.79411987    -28.38304371    -1.03948642
  G2-126   -222.23418194    -29.63003579    -29.65097126    -1.06903677    -0.79929026    -29.84750888    -1.04990381
  G2-127   -564.79606854    -47.09352623    -46.97411228    -1.42076002    -0.76432770    -47.33457449    -1.39469554
  G2-128   -531.68918032    -45.52630466    -45.31042353    -1.46297952    -0.75636116    -45.69031244    -1.41532265
  G2-129   -166.59166281    -26.57633125    -26.50759924    -1.10180048    -0.79326378    -26.71253769    -1.05844173
  G2-130   -166.58376722    -26.56610928    -26.50100134    -1.09784679    -0.79253700    -26.70685345    -1.05403184
  G2-131   -147.99926477    -25.30454439    -25.21830873    -1.09189683    -0.77832357    -25.41951595    -1.04370201
  G2-132   -198.35758159    -30.31534359    -30.30239564    -1.19454143    -0.85670267    -30.50352270    -1.16747273
  G2-133   -504.22946698    -47.11284529    -46.96559690    -1.54173773    -0.81969082    -47.32174245    -1.50951667
  G2-134   -179.76985025    -29.08366430    -29.04318336    -1.18948656    -0.83670652    -29.23944260    -1.15785518
  G2-135   -212.49274104    -34.24427186    -34.20447429    -1.38170210    -0.97241394    -34.43417026    -1.34744981
  G2-136     -0.47699174     -0.65573782     -0.64684114    -0.04288584    -0.04369303     -0.65915613    -0.03561892
  G2-137   -372.76944460    -25.32649631    -25.19830759    -0.62506837    -0.17193024    -25.41082999    -0.61630508
  G2-138    -65.56056657    -10.59576487    -10.59176264    -0.38658337    -0.27178978    -10.65891256    -0.38275259
  G2-139    -66.06237710    -11.33826382    -11.31074865    -0.45436918    -0.31178178    -11.39408038    -0.44069971
  G2-140   -132.78496195    -19.54715265    -19.55144995    -0.73822300    -0.53905587    -19.68008892    -0.72329300
  G2-141   -100.03281191    -14.41651573    -14.40957057    -0.54334019    -0.38822584    -14.51004428    -0.53063166
  G2-142   -100.05203400    -14.38953046    -14.38063533    -0.53946767    -0.38110833    -14.48342888    -0.52578423
  G2-143   -133.20545974    -20.27830882    -20.24691939    -0.79992914    -0.56286450    -20.39688852    -0.77468434
  G2-144   -405.91951963    -31.21355843    -31.06685768    -0.88538956    -0.35208689    -31.32403365    -0.86602019
  G2-145    -66.51825131    -12.09528359    -12.03470841    -0.52002356    -0.34748760    -12.13785670    -0.49577372
  G2-146    -99.66899295    -17.98709933    -17.90334765    -0.78154294    -0.51797006    -18.05294470    -0.74598199
  G2-147   -132.82098076    -23.87796476    -23.77016022    -1.04335957    -0.69841922    -23.96720315    -0.99630905
  G2-148   -181.24118695    -22.84028738    -22.97516713    -0.77894891    -0.63013424    -23.08872263    -0.78184912
  G2-149   -132.16460032    -22.76260799    -22.71181339    -0.95177156    -0.67528217    -22.87475198    -0.91914613
  G2-150   -165.32460090    -28.66616833    -28.58500062    -1.21323571    -0.85564699    -28.79860959    -1.16858365
  G2-151   -165.73062220    -29.46311227    -29.33070142    -1.29821505    -0.89363328    -29.56853118    -1.23903534
  G2-152   -166.22049128    -30.14724555    -30.00127262    -1.34047231    -0.93214011    -30.25283711    -1.27436268
  G2-153   -166.22758738    -30.14017027    -29.99356647    -1.34340588    -0.93584744    -30.24797014    -1.27708606
  G2-154   -197.97823015    -33.88800662    -33.79208063    -1.43225018    -0.99489425    -34.04042670    -1.38265065
  G2-155   -197.97583887    -33.89320446    -33.79371195    -1.43252761    -0.99297097    -34.04258425    -1.38255708
  G2-156   -198.87630995    -35.36615971    -35.20430267    -1.56113777    -1.07342168    -35.49338979    -1.48966357
  G2-157   -199.36663492    -36.04141457    -35.86864680    -1.60094100    -1.11144297    -36.16836575    -1.52310475
  G2-158   -199.36594044    -36.03781685    -35.86539853    -1.60334438    -1.11433332    -36.16584929    -1.52574576
  G2-159   -230.69935257    -39.08394393    -38.98622599    -1.63245470    -1.12707318    -39.26653054    -1.58102548
  G2-160   -232.51243785    -41.93592463    -41.73632182    -1.86143784    -1.29074547    -42.08433053    -1.77184897
  G2-161   -263.37115114    -44.19449544    -44.11240509    -1.82465532    -1.27756784    -44.41816710    -1.77349154
  G2-162   -265.65889127    -47.82977267    -47.60341756    -2.12187884    -1.47006057    -47.99951598    -2.02057968
  G2-163   -328.76807630    -54.64141911    -54.53869533    -2.24743484    -1.54475706    -54.91551772    -2.18819714
  G2-164   -328.74829494    -54.58841879    -54.51255725    -2.24426022    -1.55902039    -54.88369280    -2.18682799
  G2-165   -232.83079666    -34.06434413    -34.05564462    -1.31933416    -0.97431937    -34.29400743    -1.28407423
  G2-166   -199.74359161    -32.46712162    -32.37112181    -1.36400182    -0.97458170    -32.62638114    -1.30864581
  G2-167   -245.62416214    -40.16209782    -40.09598937    -1.64768022    -1.15139187    -40.37365642    -1.60214750
  G2-168   -264.20924374    -41.41306750    -41.36867261    -1.65587462    -1.16794474    -41.64976339    -1.61537850
  G2-169   -198.83091449    -30.97938712    -30.95598683    -1.23224041    -0.89619207    -31.16995514    -1.19851651
  G2-170   -199.24243428    -31.77979113    -31.70097581    -1.31609968    -0.93293163    -31.94188537    -1.26726288
  G2-171   -231.96894960    -36.94484670    -36.86947530    -1.51603196    -1.07326063    -37.13860547    -1.46556030
  G2-172   -330.45889474    -48.83880368    -48.86570635    -1.86377893    -1.36145486    -49.17775313    -1.83104344
  G2-173   -227.43598598    -35.30169175    -35.29177769    -1.39279187    -0.99688208    -35.51986360    -1.36375993
  G2-174   -572.55397711    -53.95447016    -53.85266211    -1.76001811    -1.03365420    -54.26737877    -1.71987660
  G2-175   -629.30954785    -60.35515154    -60.16400278    -2.01671025    -1.13275356    -60.62017443    -1.97211590
  G2-176   -227.53036496    -35.20474212    -35.20150176    -1.36221198    -1.00208809    -35.42637278    -1.33479184
  G2-177   -227.43478298    -35.29359444    -35.28752850    -1.39222318    -0.99883316    -35.51434595    -1.36359190
  G2-178   -198.39534894    -30.23689611    -30.24072402    -1.16696711    -0.85938525    -30.43749074    -1.14199845
  G2-179   -198.86120818    -30.98678686    -30.96069863    -1.23223328    -0.89552555    -31.17486068    -1.19750591
  G2-180   -332.22281597    -47.43871462    -47.46316921    -1.79825180    -1.33512507    -47.78024450    -1.76045513
  G2-181   -504.67733303    -47.82649509    -47.64497426    -1.59883664    -0.85657864    -48.01975602    -1.55592483
  G2-182   -180.30556916    -29.72952473    -29.66747363    -1.22159088    -0.87777429    -29.88277368    -1.18046677
  G2-183   -199.31178462    -31.73224971    -31.66973755    -1.29820384    -0.93322034    -31.90451817    -1.25266403
  G2-184   -199.30981857    -31.72289653    -31.66115049    -1.29683786    -0.93498173    -31.89516823    -1.25153182
  G2-185   -265.90219642    -39.98759258    -39.93624548    -1.59635792    -1.15384789    -40.22993580    -1.54613928
  G2-186   -505.12702477    -48.56501006    -48.35195612    -1.66329271    -0.89621028    -48.74669702    -1.60970566
  G2-187   -564.84871465    -51.41001143    -51.16834853    -1.72593739    -0.93950354    -51.59981824    -1.66617658
  G2-188   -564.83553785    -51.42031524    -51.17762749    -1.72338202    -0.93571970    -51.60573249    -1.66399067
  G2-189   -180.65962415    -30.52586341    -30.42348592    -1.30995231    -0.91696115    -30.65893010    -1.25659274
  G2-190   -314.04432013    -46.80466540    -46.81645649    -1.85679473    -1.38781060    -47.13430598    -1.80645660
  G2-191   -199.73453734    -32.46053397    -32.36888128    -1.35816798    -0.97149901    -32.62318724    -1.30256201
  G2-192   -266.38859793    -40.67340575    -40.60796768    -1.63988069    -1.19357051    -40.91429790    -1.58332439
  G2-193   -505.62243960    -49.23829085    -49.00908597    -1.70883567    -0.93780307    -49.42069383    -1.64757035
  G2-194   -878.15900457    -74.23844021    -73.91216075    -2.32977066    -1.11820275    -74.52137757    -2.26472607
  G2-195   -181.16115910    -31.20808729    -31.09010670    -1.35612860    -0.95901128    -31.34175009    -1.29572908
  G2-196   -402.13499555    -45.33504179    -45.10063677    -1.65975706    -0.90349473    -45.49203964    -1.58946211
  G2-197   -537.37679289    -53.00871034    -52.83553636    -1.80270707    -0.99916641    -53.23996483    -1.75864870
  G2-198   -212.91362172    -34.97269880    -34.90769902    -1.44865760    -1.01693846    -35.15303314    -1.40506007
  G2-199   -232.38936848    -37.67797721    -37.57122321    -1.57882765    -1.11343370    -37.86260372    -1.51799725
  G2-200   -232.45582502    -37.62855614    -37.53883702    -1.55924388    -1.11271763    -37.82218709    -1.50190437
  G2-201   -299.13206878    -45.85091518    -45.78946332    -1.84112788    -1.33415013    -46.12563068    -1.78225647
  G2-202   -538.27001451    -54.46384117    -54.22292636    -1.92576356    -1.07629795    -54.66759967    -1.86022866
  G2-203   -213.80389744    -36.42721509    -36.29658816    -1.57286111    -1.09729994    -36.58263819    -1.50746210
  G2-204   -232.88019014    -38.34951618    -38.23080946    -1.62266024    -1.15592295    -38.53633056    -1.55526482
  G2-205   -375.95243781    -52.55283001    -52.54161977    -1.95426118    -1.39346233    -52.89310478    -1.91902847
  G2-206   -375.95103950    -52.55300068    -52.54210107    -1.95402373    -1.39370865    -52.89319359    -1.91893140
  G2-207   -286.75279064    -42.87087995    -42.82945448    -1.66249344    -1.17032636    -43.12109340    -1.62510121
  G2-208   -266.03479933    -44.24304339    -44.09857312    -1.88133673    -1.33368151    -44.45144561    -1.80231264
  G2-209   -765.28168768    -72.99052307    -72.95402662    -2.16653846    -1.35684649    -73.47994427    -2.15208426
  G2-210   -908.99068328    -85.25355975    -85.28226062    -2.55038299    -1.67068386    -85.88584043    -2.53563322
  G2-211  -1272.57905184    -90.42475643    -90.05867869    -2.31699776    -0.61256465    -90.77102183    -2.30628710
  G2-212   -572.49171608    -49.61808337    -49.64618199    -1.45948179    -0.87566866    -49.98831917    -1.45370799
  G2-213  -1236.54626379    -79.97779381    -79.63376417    -1.94809928    -0.59295220    -80.28748727    -1.92943385
  G2-214  -1680.78142627   -113.46227142   -113.00711321    -2.86561039    -0.98384317   -113.94024853    -2.83089759
  G2-215  -2478.07975558   -160.23117239   -159.49884524    -3.93426758    -1.18131067   -160.84033754    -3.88511339
  G2-216  -1369.80206863    -96.44176399    -96.18502928    -2.52509118    -1.06220150    -96.94119187    -2.50312115
  G2-217  -1614.17188987   -105.15695301   -104.68511964    -2.57478559    -0.76013667   -105.55620989    -2.54629896
  G2-218  -1609.10633815   -104.94853657   -104.52737785    -2.57293320    -0.78830966   -105.37997271    -2.55115472
  G2-219  -1132.66249612    -75.35776775    -75.01180290    -1.84555545    -0.51286797    -75.63383217    -1.82623741
  G2-220   -733.00997686    -62.78609563    -62.70386058    -1.81980926    -1.06591474    -63.16334026    -1.80403822
  G2-221   -602.01250149    -70.57633952    -70.66067541    -2.30932118    -1.72421677    -71.12527974    -2.29373137
  G2-222   -300.99090910    -35.24423182    -35.29350885    -1.13489870    -0.83893561    -35.51923999    -1.13215584
  G2-223   -197.28295237    -32.80304506    -32.74312886    -1.33132382    -0.88862549    -32.96946421    -1.29840448
#TMD-BE3       E[noXC]         X Energy HF   X Energy DFT     C Energy GGA    C Energy osRPA   X Energy SCAN     C Energy SCAN
 Cr2-BE3    -2009.12074433    -94.94417425    -95.51074666    -2.07948012    -1.45147880       -96.03068748    -2.11623877
  V2-BE3    -1811.54895034    -88.78482107    -89.08349675    -1.95080116    -1.11475669       -89.60802464    -1.97794884
 Fe2-BE3    -2440.67954515   -109.40308945   -109.69445752    -2.28913881    -1.19410435      -110.29664088    -2.32693742
  Cr-BE3    -1004.34229130    -48.07098706    -48.00023496    -0.98364435    -0.34281434       -48.31513661    -0.99192177
   V-BE3     -905.79438937    -44.58492681    -44.48085723    -0.92862927    -0.35395904       -44.77295914    -0.93963467
  Fe-BE3    -1220.40984963    -54.83362439    -54.75926836    -1.11189206    -0.47200980       -55.08179116    -1.13143991
#TM-BE13           E[noXC]         X Energy HF   X Energy DFT     C Energy GGA     C Energy osRPA   X Energy SCAN     C Energy SCAN
   TiCl-BE13     -1247.25618160     -69.16824179    -68.94775726    -1.55189867     -0.61361869     -69.46822744    -1.54475476
    VF5-BE13     -1353.99254020     -94.50952376    -94.76793787    -2.55290534     -1.69487957     -95.40237969    -2.54190431
   CrCl-BE13     -1438.50982192     -75.71994143    -75.51647327    -1.66640728     -0.67604883     -76.06706671    -1.66225991
   CrOF-BE13     -1160.80211869     -66.15687783    -66.21620019    -1.61012697     -0.88188650     -66.63937892    -1.61260603
 Fe2Br4-BE13    -12547.48637803    -473.80521120   -473.03053219    -9.16076064     -2.25414697    -475.89588106    -9.18015444
CoC4O4H-BE13     -1736.54602322    -111.83493810   -112.22746983    -3.15484070     -2.15871780    -112.88091471    -3.15231288
 NiCH2+-BE13     -1496.83319816     -67.92373247    -67.97161966    -1.49824697     -0.70071666     -68.37145562    -1.50098561
 FeC5O5-BE13     -1718.23760789    -121.22686179   -121.60974053    -3.52062725     -2.40093332    -122.33205346    -3.51504489
     VS-BE13     -1279.91010284     -69.72152083    -69.61106417    -1.56896193     -0.65145738     -70.11069500    -1.56838426
    CuH-BE13     -1593.43037094     -66.55071618    -66.63842168    -1.37500527     -0.76653808     -66.97723077    -1.39410915
   CuCl-BE13     -2027.26109977     -93.98127890    -93.90943781    -2.02238128     -1.03894627     -94.48251693    -2.03145310
     VO-BE13      -972.58243190     -52.74009355    -52.79353835    -1.22178941     -0.62262914     -53.12954704    -1.22823167
   NiCl-BE13     -1897.69133038     -90.14362833    -90.03021136    -1.95465646     -0.82204523     -90.61084358    -1.96120819
  CO_di-BE13       -99.57280365     -13.31643679    -13.32945043    -0.44942765     -0.31696436     -13.41070924    -0.44641463
    CH2-BE13       -33.13020913      -5.78291714     -5.74936354    -0.22402652     -0.14897275      -5.79926545    -0.21071991
    Fe2-BE13     -2440.67954515    -109.40308945   -109.69445752    -2.28913881     -1.19410435    -110.29664088    -2.32693742
     Ti-BE13      -813.22928648     -41.38042270    -41.25468850    -0.87431306     -0.32620905     -41.54211717    -0.88383308
     Cl-BE13      -434.08034899     -27.64543875    -27.49779009    -0.64346610     -0.27622912     -27.73096546    -0.63586379
      V-BE13      -905.79438937     -44.58492681    -44.48085723    -0.92862927     -0.35395904     -44.77295914    -0.93963467
      F-BE13       -89.53064650     -10.02223247     -9.99656970    -0.29037216     -0.18493055     -10.06990557    -0.28978856
      O-BE13       -66.70271983      -8.19770016     -8.16383487    -0.23387377     -0.13381840      -8.22245805    -0.23473458
     Fe-BE13     -1220.40984979     -54.83362447    -54.75926812    -1.11189206     -0.47200978     -55.08179122    -1.13143991
     Br-BE13     -2526.62242654     -91.02907032    -90.80177215    -1.69229622     -0.26700401     -91.35073363    -1.69417039
     Co-BE13     -1338.00114232     -58.46592044    -58.41705724    -1.18225848     -0.53919194     -58.89737063    -1.21495432
      H-BE13        -0.19102678      -0.30867667     -0.30309140    -0.00579958      0.00000000      -0.30912620    -0.00000000
     Ni-BE13     -1463.74846866     -62.29639017    -62.30535456    -1.25994288     -0.51732274     -62.66636231    -1.28247236
    Ni+-BE13     -1463.48179221     -62.30825476    -62.28368787    -1.25486177     -0.50805840     -62.63092010    -1.26808074
     Cu-BE13     -1593.13431835     -66.29169938    -66.35514159    -1.34085006     -0.71615687     -66.68719664    -1.36435351
     Cr-BE13     -1004.34229129     -48.07098707    -48.00023496    -0.98364435     -0.34281434     -48.31513660    -0.99192177
      S-BE13      -374.11959072     -25.11134551    -24.97725146    -0.58347755     -0.23621111     -25.18533959    -0.57918877
      C-BE13       -32.65369733      -5.06153259     -5.02546335    -0.14421176     -0.07049636      -5.06466819    -0.14604735
#S22          E[noXC]       X Energy HF    X Energy DFT   C Energy GGA   C Energy osRPA   X Energy SCAN     C Energy SCAN
  1-S22    -97.12452640    -15.31758433    -15.27914117    -0.63332209    -0.43908818      -15.39620658    -0.60576378
01a-S22    -48.56216409     -7.65810340     -7.63850534    -0.31553283    -0.21866438       -7.69718326    -0.30140135
  2-S22   -134.27002161    -17.85949383    -17.85715841    -0.65531596    -0.47143700      -17.97896014    -0.63878631
02a-S22    -67.13506398     -8.92749146     -8.92593715    -0.32621384    -0.23481682       -8.98687774    -0.31762906
  3-S22   -333.04111197    -44.64899665    -44.68248691    -1.61889533    -1.12566625      -44.97847599    -1.59098067
03a-S22   -166.53689516    -22.29718170    -22.31651455    -0.80327266    -0.56092901      -22.46234907    -0.78938745
  4-S22   -295.86446833    -42.14371804    -42.13895524    -1.59880774    -1.09126012      -42.42675754    -1.56091793
04a-S22   -147.94319552    -21.05198670    -21.05140834    -0.79464705    -0.54366572      -21.19420047    -0.77545971
  5-S22   -721.47675688   -103.74304892   -103.71452320    -3.95014507    -2.60925679     -104.41673679    -3.86954183
05a-S22   -360.74766839    -51.84999924    -51.83814227    -1.97006817    -1.30274150      -52.18791925    -1.92951238
  6-S22   -539.68418096    -83.81668179    -83.68883092    -3.34551515    -2.15244668      -84.27663902    -3.25805668
06a-S22   -279.14589918    -42.51450723    -42.46556348    -1.67144575    -1.08322932      -42.76008537    -1.62977721
06b-S22   -260.55800865    -41.26758776    -41.18951291    -1.66358706    -1.06249007      -41.48115031    -1.61708634
  7-S22   -797.74720176   -118.56910946   -118.48055097    -4.62847689    -3.01856659     -119.28881519    -4.52508862
07a-S22   -403.88105592    -60.77529596    -60.73258759    -2.38471416    -1.54520512      -61.13849347    -2.33366654
07b-S22   -393.88870719    -57.75722237    -57.71300863    -2.23320335    -1.46642717      -58.11359247    -2.18003409
  8-S22    -67.26174409    -13.16111248    -13.07061444    -0.60246545    -0.39358618      -13.19539878    -0.56212807
08a-S22    -33.63107079     -6.58072706     -6.53527812    -0.30097839    -0.19635991       -6.59769355    -0.28059923
  9-S22   -132.65188710    -23.46585948    -23.36994229    -0.99277636    -0.64316615      -23.55511293    -0.94942633
09a-S22    -66.32915562    -11.73045760    -11.68268395    -0.49523668    -0.32054085      -11.77506042    -0.47317036
 10-S22   -231.16474978    -39.81233832    -39.66076696    -1.67774367    -1.05298304      -39.96821648    -1.61350832
10a-S22   -197.54226092    -33.22472215    -33.11938359    -1.37425887    -0.85425520      -33.36348059    -1.32985844
10b-S22    -33.62648075     -6.58542646     -6.53956877    -0.30115601    -0.19625121       -6.60214882    -0.28074848
 11-S22   -395.07285137    -66.45314216    -66.24170547    -2.75442704    -1.71608588      -66.73431537    -2.66611829
11a-S22   -197.54105160    -33.22596264    -33.12052448    -1.37426976    -0.85422479      -33.36465610    -1.32986837
 12-S22   -454.86260166    -70.64300467    -70.56010671    -2.79646481    -1.81177556      -71.04325307    -2.73011862
12a-S22   -227.43841896    -35.31740585    -35.27667900    -1.39495023    -0.90199969      -35.51565969    -1.36155571
 13-S22   -721.46810896   -103.72984294   -103.70039889    -3.94897580    -2.61380530     -104.40851162    -3.86830603
13a-S22   -360.74120525    -51.85785350    -51.84505123    -1.97015976    -1.30228937      -52.19519105    -1.92951161
 14-S22   -508.49454363    -83.83034887    -83.59880011    -3.45462912    -2.15863543      -84.20951520    -3.35191874
14a-S22   -310.96494072    -50.60382580    -50.47882487    -2.07169087    -1.29326806      -50.83889509    -2.01282230
14b-S22   -197.54106830    -33.22597694    -33.12046375    -1.37438913    -0.85419365      -33.36461937    -1.32996609
 15-S22   -797.73699244   -118.56134443   -118.46759560    -4.63128597    -3.02573904     -119.28583154    -4.52743936
15a-S22   -403.88091292    -60.77507523    -60.73244944    -2.38452728    -1.54568396      -61.13840281    -2.33346294
15b-S22   -393.87696669    -57.77101510    -57.72511659    -2.23348139    -1.46569332      -58.12630554    -2.18010838
 16-S22   -132.19995938    -22.70560881    -22.63942910    -0.92692905    -0.60735408      -22.80600742    -0.89344983
16a-S22    -66.32828566    -11.73134913    -11.68349098    -0.49526639    -0.32052480      -11.77589773    -0.47319646
16b-S22    -65.87577319    -10.96935263    -10.95141124    -0.43023293    -0.28606240      -11.02562903    -0.41841960
 17-S22   -264.67727933    -42.15295196    -42.04585403    -1.70331803    -1.09168280      -42.35228189    -1.65074787
17a-S22   -197.54436809    -33.22251558    -33.11743244    -1.37411502    -0.85434193      -33.36144302    -1.32973897
17b-S22    -67.13666637     -8.92556291     -8.92439206    -0.32617217    -0.23504570       -8.98525959    -0.31760401
 18-S22   -246.10063907    -40.88605834    -40.76060610    -1.69234632    -1.07541534      -41.06461988    -1.63425726
18a-S22   -197.54265206    -33.22431110    -33.11902384    -1.37422604    -0.85427290      -33.36310355    -1.32983124
18b-S22    -48.56218375     -7.65785920     -7.63840352    -0.31555855    -0.21879718       -7.69708285    -0.30142172
 19-S22   -278.41964206    -45.25269061    -45.15495185    -1.81877046    -1.16690602      -45.47405236    -1.76785624
19a-S22   -197.54487548    -33.22198118    -33.11696346    -1.37407469    -0.85436443      -33.36095198    -1.32970556
19b-S22    -80.88207105    -12.02020204    -12.03050706    -0.44030158    -0.31034587      -12.10403227    -0.43334505
 20-S22   -395.07875264    -66.45284080    -66.24116576    -2.75221679    -1.71264973      -66.73094346    -2.66405069
20a-S22   -197.54341348    -33.22351580    -33.11831704    -1.37417986    -0.85430267      -33.36236674    -1.32979282
20b-S22   -197.54538711    -33.22142583    -33.11649662    -1.37400085    -0.85439638      -33.36045575    -1.32964479
 21-S22   -508.50350282    -83.83129296    -83.59969389    -3.45154592    -2.15351626      -84.20619036    -3.34896874
21a-S22   -310.96859980    -50.59991591    -50.47536455    -2.07153008    -1.29343557      -50.83525698    -2.01271534
21b-S22   -197.54388777    -33.22302005    -33.11787669    -1.37415073    -0.85432134      -33.36190761    -1.32976859
 22-S22   -528.37721456    -82.93648336    -82.75988124    -3.32610007    -2.11707850      -83.35484082    -3.23396516
22a-S22   -264.19535810    -41.46023531    -41.37305078    -1.65997855    -1.05604121      -41.66933340    -1.61348883
22b-S22   -264.19535810    -41.46023531    -41.37305078    -1.65997855    -1.05604121      -41.66933340    -1.61348883
#DC9                      E[noXC]     X Energy HF    X Energy DFT   C Energy GGA   C Energy osRPA   X Energy SCAN     C Energy SCAN
       13dip-DC9    -195.18395190    -30.82377879    -30.76339871    -1.25670542     -0.82187774     -30.98445619    -1.21534932
         be4-DC9     -47.48261515    -10.86280576    -10.81115913    -0.41954161     -0.21239150     -10.90204520    -0.41001538
          be-DC9     -11.90704819     -2.66416263     -2.63652410    -0.08579969     -0.04161617      -2.65906039    -0.08341814
     c20bowl-DC9    -653.57461538   -103.22847308   -103.27898388    -4.06410260     -2.61853436    -103.90350648    -4.01722375
     c20cage-DC9    -653.31336807   -103.39017915   -103.40623520    -4.18476959     -2.67719106    -104.04996147    -4.12214554
   carbooxo1-DC9    -494.30851823    -70.94737190    -71.05123928    -2.60590404     -1.76117007     -71.47805820    -2.58155368
   carbooxo2-DC9    -494.12813247    -71.09093635    -71.16861313    -2.65731704     -1.75333983     -71.58179089    -2.63680476
       ch2n2-DC9    -128.92294799    -18.97030567    -19.00299011    -0.71812780     -0.50185335     -19.11788462    -0.70550344
       ethen-DC9     -66.32168234    -11.73838864    -11.68969411    -0.49562769     -0.32012032     -11.78240836    -0.47347594
heptahexaene-DC9    -229.76636023    -37.48758686    -37.48876617    -1.47959559     -0.96177311     -37.72816785    -1.45026929
 heptatriyne-DC9    -229.75937551    -37.53336192    -37.49869307    -1.47895463     -0.95192087     -37.74379732    -1.44726160
     ISO_E35-DC9    -394.73066150    -66.71715746    -66.41414399    -2.87325843     -1.73840944     -66.93186154    -2.76492293
     ISO_E36-DC9    -279.14296267    -42.52556129    -42.46660392    -1.67230868     -1.07813524     -42.76179507    -1.63083056
     ISO_P35-DC9    -394.96352117    -66.46805376    -66.24904917    -2.77727939     -1.73012729     -66.74409325    -2.68584847
     ISO_P36-DC9    -279.14201343    -42.52128513    -42.47070851    -1.67118491     -1.08223437     -42.76574488    -1.62936584
        omcb-DC9    -397.72520535    -70.75010585    -70.36059412    -3.14708901     -1.97162718     -70.97459011    -2.99377142
          s2-DC9    -745.08313798    -50.00436028    -49.78044009    -1.22224950     -0.29147980     -50.18968719    -1.21274750
          s8-DC9   -2980.21279436   -200.15569126   -199.27195133    -5.01754699     -1.30790861    -200.91454759    -4.96822826
     tmethen-DC9    -198.91515846    -35.32823225    -35.15348621    -1.54574115     -0.97363622     -35.44737024    -1.47295863
#G2RC       E[noXC]       X Energy HF    X Energy DFT   C Energy GGA       C Energy osRPA   X Energy SCAN     C Energy SCAN
 100-G2RC   -114.00165065    -17.96665851    -17.93893577    -0.70333471      -0.46662279   -18.06366620    -0.68329553
 104-G2RC   -166.52552292    -22.31223995    -22.32907739    -0.80356366      -0.55975397   -22.47579462    -0.78941160
 106-G2RC   -181.07513270    -26.97820190    -26.93973174    -1.05734117      -0.70315271   -27.13552750    -1.02465767
 113-G2RC   -133.00089124    -19.96893633    -19.93765103    -0.77812290      -0.52019469   -20.08292762    -0.75294339
 117-G2RC   -438.81976630    -36.78384585    -36.61114777    -1.13651294      -0.48289918   -36.91198798    -1.10606730
 118-G2RC   -505.91800228    -45.72664555    -45.56509164    -1.47176588      -0.72901859   -45.93507954    -1.43029619
  11-G2RC    -48.56427880     -7.65591899     -7.63653947    -0.31544004      -0.21871458    -7.69512437    -0.30133548
 121-G2RC   -155.51399408    -21.43745612    -21.40923205    -0.78767980      -0.52580897   -21.56358883    -0.76699656
 126-G2RC   -199.67063753    -28.22582910    -28.20727128    -1.06556864      -0.71988840   -28.40618038    -1.03814889
 128-G2RC   -564.77555364    -47.13816804    -46.98622156    -1.42356039      -0.68865201   -47.35831363    -1.39284203
  13-G2RC    -67.13922285     -8.92297869     -8.92209119    -0.32603934      -0.23508474    -8.98281662    -0.31752443
  14-G2RC    -89.67190778    -10.39326602    -10.39324483    -0.33630900      -0.24105633   -10.46285000    -0.33157285
  18-G2RC   -269.52657267    -21.73019707    -21.58985078    -0.61603510      -0.16703451   -21.79314439    -0.59030646
   1-G2RC     -0.47545269     -0.65780352     -0.64791750    -0.04322102      -0.03928310    -0.66074006    -0.03568863
  21-G2RC   -373.01739656    -25.69386085    -25.55712640    -0.66717471      -0.19281726   -25.77908061    -0.65072248
  22-G2RC   -432.23552706    -27.86992853    -27.72037998    -0.68726716      -0.19746837   -27.96054080    -0.67286408
  23-G2RC    -11.31754245     -3.55088606     -3.51315598    -0.12424212      -0.03245785    -3.55231509    -0.11828276
  24-G2RC    -95.04433916    -11.94099429    -11.93590030    -0.37776200      -0.24381925   -12.02090397    -0.37569437
  25-G2RC    -65.86194484    -10.98454266    -10.96449873    -0.43076171      -0.28492160   -11.03947471    -0.41875745
  26-G2RC    -66.32168234    -11.73838864    -11.68969411    -0.49562769      -0.32012032   -11.78240836    -0.47347594
  30-G2RC    -99.47063034    -13.30878442    -13.32007869    -0.44971752      -0.31633834   -13.40182955    -0.44654407
  32-G2RC    -99.85043137    -14.05995584    -14.06025897    -0.51627808      -0.35941530   -14.15491477    -0.50384943
  33-G2RC   -100.27366659    -14.81596577    -14.78458143    -0.58248511      -0.39536149   -14.89759162    -0.56028039
  34-G2RC    -95.87019028    -13.11340302    -13.13433301    -0.45308375      -0.32493304   -13.21092521    -0.44952917
  39-G2RC   -178.85024811    -19.90880933    -19.96816376    -0.61505699      -0.46392043   -20.08953869    -0.61335440
  40-G2RC   -166.11509767    -21.58751788    -21.63234428    -0.74125308      -0.52326148   -21.76337936    -0.73550126
  45-G2RC   -863.97007421    -55.02098358    -54.75461060    -1.32596435      -0.36524339   -55.21279977    -1.30937905
  47-G2RC   -335.32980281    -28.50745019    -28.45243592    -0.77781205      -0.30487598   -28.65970444    -0.77685519
  51-G2RC   -521.39791036    -37.50170308    -37.39381326    -0.97113655      -0.41257559   -37.68445397    -0.96224652
  52-G2RC   -538.58072415    -42.78137398    -42.51861159    -1.19524126      -0.30026671   -42.91027483    -1.15184817
  56-G2RC   -505.87579060    -41.41336240    -41.37803801    -1.17154382      -0.58323070   -41.67739710    -1.16488279
  57-G2RC   -289.15407262    -34.17819300    -34.15695024    -1.09251126      -0.73883621   -34.39770602    -1.08218660
  58-G2RC  -1316.80709325    -86.55479086    -86.10163535    -2.15760712      -0.62104746   -86.84462922    -2.11954167
  59-G2RC   -492.10468478    -48.50872305    -48.42849594    -1.40806266      -0.73062691   -48.78917126    -1.39805595
  60-G2RC  -1519.80540584   -100.90355739   -100.36557269    -2.47294907      -0.59627480  -101.23810271    -2.43159639
  61-G2RC   -390.41454040    -45.40518279    -45.41312243    -1.47195202      -1.01023481   -45.72388883    -1.45730435
  62-G2RC  -1760.63653132   -115.25896979   -114.70413655    -2.88165280      -0.86289628  -115.66939532    -2.83946937
  66-G2RC   -626.35046153    -60.82061487    -60.71109492    -1.78405246      -0.97793021   -61.16996994    -1.76724203
  67-G2RC  -1996.57961700   -130.64901161   -129.95536613    -3.20706840      -0.81394161  -131.08443692    -3.15204340
  68-G2RC   -162.46340384    -21.28093060    -21.37102860    -0.74389725      -0.54909959   -21.48410704    -0.74109287
   6-G2RC    -33.11422445     -5.77710928     -5.74447442    -0.22418702      -0.14984626    -5.79433011    -0.21087936
  73-G2RC   -245.53137387    -28.02689273    -28.13695748    -0.89115658      -0.67673676   -28.30126557    -0.89008938
  82-G2RC    -99.41070721    -17.68482401    -17.59473721    -0.77274155      -0.48223298   -17.73814383    -0.73669223
  88-G2RC   -132.10763035    -22.83602905    -22.74363414    -0.97323200      -0.61068288   -22.92001116    -0.93344700
   8-G2RC    -33.63096396     -6.58083702     -6.53537847    -0.30098255      -0.19635734    -6.59779777    -0.28060273
  94-G2RC   -197.53517749    -33.23209729    -33.12589404    -1.37476507      -0.85396114   -33.37028391    -1.33027897
  97-G2RC   -897.13060181    -60.93822743    -60.63160500    -1.58885106      -0.52415888   -61.14672076    -1.55673699
#SIE11              E[noXC]       X Energy HF    X Energy DFT   C Energy GGA     C Energy osRPA   X Energy SCAN     C Energy SCAN
 aceton+-SIE11    -166.13731511    -25.57477682    -25.51471617    -1.00284435     -0.63173292    -25.71562858    -0.96487861
  acetyl-SIE11    -132.81372576    -19.29647947    -19.28678988    -0.71539593     -0.48278214    -19.42233231    -0.69439804
    but+-SIE11    -133.02646662    -23.95507140    -23.83956498    -1.04819938     -0.63036118    -24.05198201    -0.99148359
      bz-SIE11    -197.54867296    -33.21801886    -33.11341915    -1.37388237     -0.85450332    -33.35726550    -1.32954510
   bz_li-SIE11    -203.07447239    -35.10074056    -34.97305198    -1.45857588     -0.84990707    -35.24111719    -1.41387154
    c2h4-SIE11     -66.32505792    -11.73473589    -11.68652548    -0.49540157     -0.32039846    -11.77906141    -0.47330558
 c2h4_f2-SIE11    -245.18112498    -31.63307985    -31.65193646    -1.11067985     -0.78761794    -31.86523218    -1.08761129
     ch3-SIE11     -33.35855421     -6.21811577     -6.17360260    -0.25975804     -0.15420539     -6.23392688    -0.24564390
   clclf-SIE11    -953.37154866    -65.00242707    -64.74950348    -1.61637382     -0.56471508    -65.27465521    -1.60050954
   clfcl-SIE11    -953.40533960    -64.91626525    -64.73432554    -1.63209799     -0.57620857    -65.24689609    -1.62010479
     clf-SIE11    -521.39121295    -37.50963605    -37.39978592    -0.97186040     -0.41172775    -37.69088903    -0.96279290
   ethyl-SIE11     -66.50082356    -12.12288126    -12.04846522    -0.52180786     -0.31497055    -12.15714433    -0.49537585
  ethyl+-SIE11     -66.51186647    -11.82743065    -11.76345170    -0.49985641     -0.31494392    -11.86792186    -0.47018765
      f2-SIE11    -178.85471693    -19.90318088    -19.96425626    -0.61456658     -0.46485709    -20.08537531    -0.61295819
   h2o2+-SIE11    -134.24810267    -17.49657622    -17.52810038    -0.62368469     -0.43624313    -17.64804957    -0.60815736
     h2o-SIE11     -67.13657730     -8.92577546     -8.92452546    -0.32616446     -0.23497869     -8.98539518    -0.31759876
    h2o+-SIE11     -67.04484957     -8.61556185     -8.59273950    -0.28481380     -0.18435157     -8.66190425    -0.27619377
    he2+-SIE11      -3.34829101     -1.58131972     -1.59981554    -0.05925034     -0.05279930     -1.61632059    -0.05819616
      he-SIE11      -1.84362947     -1.01728008     -1.00777866    -0.04137363     -0.04039777     -1.02349275    -0.03776741
     he+-SIE11      -1.37851517     -0.62094563     -0.60884417    -0.00612848      0.00000000     -0.62155203     0.00000000
      li-SIE11      -5.65538219     -1.77579326     -1.75477446    -0.05123606      0.00000000     -1.77816817    -0.04587353
   li_f2-SIE11    -184.49836919    -21.83238441    -21.91945236    -0.67341540     -0.45532605    -22.06030133    -0.67316409
     mgo-SIE11    -250.21537632    -24.15855663    -24.17648491    -0.68416675     -0.28055738    -24.33876483    -0.68774749
      na-SIE11    -147.86510396    -13.98826982    -13.93619259    -0.36986209      0.00000000    -14.04724926    -0.36531628
   naomg-SIE11    -398.05845649    -38.30814096    -38.22565849    -1.07059323     -0.25463249    -38.51724623    -1.06504734
   nh32+-SIE11     -97.10430730    -15.04659537    -15.02210613    -0.60535306     -0.39987086    -15.13934634    -0.57870128
 nh3_clf-SIE11    -569.95267854    -45.16690033    -45.05523603    -1.29731593     -0.64129843    -45.40511187    -1.27494889
     nh3-SIE11     -48.56132304     -7.65897630     -7.63928371    -0.31556776     -0.21863609     -7.69799792    -0.30142619
    nh3+-SIE11     -48.49861175     -7.40518018     -7.36607690    -0.27634790     -0.16812562     -7.43415211    -0.26175468
