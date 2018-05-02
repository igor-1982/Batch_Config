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
  0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5


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
    a1, a2, a3, a4, a5, a6, a7 = C
    #a1 = 0.5; a2  = 1 - a1
    #a3  = 1. - a4

    E_noXC, Ex_HF, Ex_PBE, Ec_PBE, rospt2, Ex_SCAN, Ec_SCAN, Ec_vdW = P
    #return E_noXC + a1*Ex_HF + a2*Ex_SCAN + a3*Ec_SCAN + a4*rospt2 + a5*Ec_vdW
    #return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2 + a5*Ec_vdW
    return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2 + \
                   a5*(Ex_SCAN-Ex_PBE) + a6*(Ec_SCAN-Ec_PBE) + a7*Ec_vdW

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
__batch__ :: 426
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
__energy__ :: 304 1.0
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
# "223 HOFs in the G3 set"
 3         G2-1    -1   Li_0  1  H_0  1                  0.092403375    1.0
 3         G2-2    -1   Be_0  1  H_0  1                  0.0795458      1.0
 3         G2-3    -1    C_0  1  H_0  1                  0.133853728    1.0
 3         G2-4    -1    C_0  1  H_0  2                  0.303375656    1.0
 3         G2-5    -1    C_0  1  H_0  2                  0.288309299    1.0
 3         G2-6    -1    C_0  1  H_0  3                  0.490117257    1.0
 3         G2-7    -1    C_0  1  H_0  4                  0.669622518    1.0
 3         G2-8    -1    N_0  1  H_0  1                  0.133190604    1.0
 3         G2-9    -1    N_0  1  H_0  2                  0.289590629    1.0
 3         G2-10   -1    N_0  1  H_0  3                  0.474783351    1.0
 3         G2-11   -1    O_0  1  H_0  1                  0.170048375    1.0
 3         G2-12   -1    O_0  1  H_0  2                  0.37095453     1.0
 3         G2-13   -1    F_0  1  H_0  1                  0.225371829    1.0
 3         G2-14   -1   Si_0  1  H_0  2                  0.242086823    1.0
 3         G2-15   -1   Si_0  1  H_0  2                  0.209009657    1.0
 3         G2-16   -1   Si_0  1  H_0  3                  0.35990075     1.0
 3         G2-17   -1   Si_0  1  H_0  4                  0.513767576    1.0
 3         G2-18   -1    P_0  1  H_0  2                  0.243712353    1.0
 3         G2-19   -1    P_0  1  H_0  3                  0.385528133    1.0
 3         G2-20   -1    S_0  1  H_0  2                  0.291602754    1.0
 3         G2-21   -1   Cl_0  1  H_0  1                  0.17085893     1.0
 2         G2-22   -1   Li_0  2                          0.038835272    1.0
 3         G2-23   -1   Li_0  1  F_0  1                  0.219707544    1.0
 3         G2-24   -1    C_0  2  H_0  2                  0.646659906    1.0
 3         G2-25   -1    C_0  2  H_0  4                  0.898075275    1.0
 3         G2-26   -1    C_0  2  H_0  6                  1.135077203    1.0
 3         G2-27   -1    C_0  1  N_0  1                  0.289259411    1.0
 4         G2-28   -1    H_0  1  C_0  1  N_0  1          0.498407565    1.0
 3         G2-29   -1    C_0  1  O_0  1                  0.413717782    1.0
 4         G2-30   -1    H_0  1  C_0  1  O_0  1          0.444654635    1.0
 4         G2-31   -1    H_0  2  C_0  1  O_0  1          0.596019903    1.0
 4         G2-32   -1    H_0  4  C_0  1  O_0  1          0.817212996    1.0
 2         G2-33   -1    N_0  2                          0.36414644     1.0
 3         G2-34   -1    N_0  2  H_0  4                  0.698528548    1.0
 3         G2-35   -1    N_0  1  O_0  1                  0.24374825     1.0
 2         G2-36   -1    O_0  2                          0.192402459    1.0
 3         G2-37   -1    H_0  2  O_0  2                  0.428894913    1.0
 2         G2-38   -1    F_0  2                          0.0622955      1.0
 3         G2-39   -1    C_0  1  O_0  2                  0.621027324    1.0
 2         G2-40   -1   Na_0  2                          0.027142761    1.0
 2         G2-41   -1   Si_0  2                          0.12042782     1.0
 2         G2-42   -1    P_0  2                          0.186803218    1.0
 2         G2-43   -1    S_0  2                          0.16368255     1.0
 2         G2-44   -1   Cl_0  2                          0.094969755    1.0
 3         G2-45   -1   Na_0  1 Cl_0  1                  0.157510754    1.0
 3         G2-46   -1   Si_0  1  O_0  1                  0.307429344    1.0
 3         G2-47   -1    S_0  1  C_0  1                  0.274114821    1.0
 3         G2-48   -1    S_0  1  O_0  1                  0.200487054    1.0
 3         G2-49   -1   Cl_0  1  O_0  1                  0.104509325    1.0
 3         G2-50   -1    F_0  1 Cl_0  1                  0.09968412     1.0
 3         G2-51   -1   Si_0  2  H_0  6                  0.846627981    1.0
 4         G2-52   -1    C_0  1  H_0  3 Cl_0  1          0.630098683    1.0
 4         G2-53   -1    H_0  4  C_0  1  S_0  1          0.755769935    1.0
 4         G2-54   -1    H_0  1  O_0  1 Cl_0  1          0.263622584    1.0
 3         G2-55   -1    S_0  1  O_0  2                  0.40977415     1.0
 3         G2-56   -1    F_0  3  B_0  1                  0.74694868     1.0
 3         G2-57   -1   Cl_0  3  B_0  1                  0.51017942     1.0
 3         G2-58   -1    F_0  3 Al_0  1                  0.67753946     1.0
 3         G2-59   -1   Cl_0  3 Al_0  1                  0.48365767     1.0
 3         G2-60   -1    F_0  4  C_0  1                  0.75572254     1.0
 3         G2-61   -1   Cl_0  4  C_0  1                  0.49244831     1.0
 4         G2-62   -1    C_0  1  O_0  1  S_0  1          0.52995016     1.0
 3         G2-63   -1    C_0  1  S_0  2                  0.44080292     1.0
 4         G2-64   -1    C_0  1  F_0  2  O_0  1          0.67220091     1.0
 3         G2-65   -1    F_0  4 Si_0  1                  0.90971726     1.0
 3         G2-66   -1   Cl_0  4 Si_0  1                  0.60482198     1.0
 3         G2-67   -1    N_0  2  O_0  1                  0.43060819     1.0
 4         G2-68   -1   Cl_0  1  N_0  1  O_0  1          0.30319860     1.0
 3         G2-69   -1    F_0  3  N_0  1                  0.32386570     1.0
 3         G2-70   -1    F_0  3  P_0  1                  0.57763820     1.0
 2         G2-71   -1    O_0  3                          0.23267266     1.0
 3         G2-72   -1    F_0  2  O_0  1                  0.14627886     1.0
 3         G2-73   -1    F_0  3 Cl_0  1                  0.19614786     1.0
 3         G2-74   -1    F_0  4  C_0  2                  0.92736989     1.0
 3         G2-75   -1   Cl_0  4  C_0  2                  0.73777659     1.0
 4         G2-76   -1    F_0  3  C_0  2  N_0  1          1.01663576     1.0
 3         G2-77   -1    H_0  4  C_0  3                  1.12296063     1.0
 3         G2-78   -1    H_0  4  C_0  3                  1.12009989     1.0
 3         G2-79   -1    H_0  4  C_0  3                  1.08751170     1.0
 3         G2-80   -1    H_0  6  C_0  3                  1.37075983     1.0
 3         G2-81   -1    H_0  6  C_0  3                  1.35900783     1.0
 3         G2-82   -1    H_0  8  C_0  3                  1.60333895     1.0
 3         G2-83   -1    H_0  6  C_0  4                  1.61273955     1.0
 3         G2-84   -1    H_0  6  C_0  4                  1.59938800     1.0
 3         G2-85   -1    H_0  6  C_0  4                  1.57787558     1.0
 3         G2-86   -1    H_0  6  C_0  4                  1.57216644     1.0
 3         G2-87   -1    H_0  6  C_0  4                  1.59551550     1.0
 3         G2-88   -1    H_0  8  C_0  4                  1.82982714     1.0
 3         G2-89   -1    H_0  8  C_0  4                  1.84528080     1.0
 3         G2-90   -1    H_0 10  C_0  4                  2.07228855     1.0
 3         G2-91   -1    H_0 10  C_0  4                  2.07506255     1.0
 3         G2-92   -1    H_0  8  C_0  5                  2.04522760     1.0
 3         G2-93   -1    H_0  6  C_0  6                  2.17883457     1.0
 4         G2-94   -1    H_0  2  F_0  2  C_0  1          0.69382557     1.0
 4         G2-95   -1    H_0  1  F_0  3  C_0  1          0.72703017     1.0
 4         G2-96   -1    H_0  2 Cl_0  2  C_0  1          0.58647134     1.0
 4         G2-97   -1    H_0  1 Cl_0  3  C_0  1          0.54267582     1.0
 4         G2-98   -1    H_0  5  C_0  1  N_0  1          0.92752728     1.0
 4         G2-99   -1    H_0  3  C_0  2  N_0  1          0.98082788     1.0
 5         G2-100  -1    H_0  3  C_0  1  N_0  1  O_0  2  0.95668597     1.0
 5         G2-101  -1    H_0  3  C_0  1  N_0  1  O_0  2  0.95224012     1.0
 4         G2-102  -1    H_0  6  C_0  1 Si_0  1          0.99878182     1.0
 4         G2-103  -1    H_0  2  C_0  1  O_0  2          0.79727935     1.0
 4         G2-104  -1    H_0  4  C_0  2  O_0  2          1.24926768     1.0
 5         G2-105  -1    H_0  5  C_0  2  N_0  1  O_0  1  1.38294487     1.0
 4         G2-106  -1    H_0  5  C_0  2  N_0  1          1.14678879     1.0
 3         G2-107  -1    N_0  2  C_0  2                  0.80017573     1.0
 4         G2-108  -1    H_0  7  C_0  2  N_0  1          1.38625285     1.0
 4         G2-109  -1    H_0  7  C_0  2  N_0  1          1.39759140     1.0
 4         G2-110  -1    H_0  2  C_0  2  O_0  1          0.84767645     1.0
 4         G2-111  -1    H_0  4  C_0  2  O_0  1          1.03590961     1.0
 4         G2-112  -1    H_0  4  C_0  2  O_0  1          1.07796296     1.0
 4         G2-113  -1    H_0  2  C_0  2  O_0  2          1.00831471     1.0
 4         G2-114  -1    H_0  6  C_0  2  O_0  1          1.29014835     1.0
 4         G2-115  -1    H_0  6  C_0  2  O_0  1          1.27038731     1.0
 4         G2-116  -1    H_0  4  C_0  2  S_0  1          0.99267223     1.0
 5         G2-117  -1    H_0  6  C_0  2  S_0  1  O_0  1  1.36095891     1.0
 4         G2-118  -1    H_0  6  C_0  2  S_0  1          1.22376667     1.0
 4         G2-119  -1    H_0  6  C_0  2  S_0  1          1.22123469     1.0
 4         G2-120  -1    H_0  3  C_0  2  F_0  1          0.91027531     1.0
 4         G2-121  -1    H_0  5  C_0  2 Cl_0  1          1.09974880     1.0
 4         G2-122  -1    H_0  3  C_0  2 Cl_0  1          0.85740225     1.0
 4         G2-123  -1    H_0  3  C_0  3  N_0  1          1.21691900     1.0
 4         G2-124  -1    H_0  6  C_0  3  O_0  1          1.55830048     1.0
 4         G2-125  -1    H_0  4  C_0  2  O_0  2          1.27840337     1.0
 5         G2-126  -1    H_0  3  C_0  2  O_0  1  F_0  1  1.12360527     1.0
 5         G2-127  -1    H_0  3  C_0  2  O_0  1 Cl_0  1  1.06167252     1.0
 4         G2-128  -1    H_0  7  C_0  3 Cl_0  1          1.56832046     1.0
 4         G2-129  -1    H_0  8  C_0  3  O_0  1          1.76486891     1.0
 4         G2-130  -1    H_0  8  C_0  3  O_0  1          1.74353938     1.0
 4         G2-131  -1    H_0  9  C_0  3  N_0  1          1.84838186     1.0
 4         G2-132  -1    H_0  4  C_0  4  O_0  1          1.58274796     1.0
 4         G2-133  -1    H_0  4  C_0  4  S_0  1          1.53284857     1.0
 4         G2-134  -1    H_0  5  C_0  4  N_0  1          1.70722514     1.0
 4         G2-135  -1    H_0  5  C_0  5  N_0  1          1.97171610     1.0
 2         G2-136  -1    H_0  2                          0.17457832     1.0
 3         G2-137  -1    H_0  1  S_0  1                  0.13755977     1.0
 3         G2-138  -1    H_0  1  C_0  2                  0.42340140     1.0
 3         G2-139  -1    H_0  3  C_0  2                  0.70850615     1.0
 4         G2-140  -1    H_0  3  C_0  2  O_0  1          0.92585280     1.0
 4         G2-141  -1    H_0  3  C_0  1  O_0  1          0.65179374     1.0
 4         G2-142  -1    H_0  3  C_0  1  O_0  1          0.63743824     1.0
 4         G2-143  -1    H_0  5  C_0  2  O_0  1          1.11054006     1.0
 4         G2-144  -1    H_0  3  C_0  1  S_0  1          0.60601894     1.0
 3         G2-145  -1    H_0  5  C_0  2                  0.96116402     1.0
 3         G2-146  -1    H_0  7  C_0  3                  1.43397653     1.0
 3         G2-147  -1    H_0  9  C_0  4                  1.90955842     1.0
 3         G2-148  -1    N_0  1  O_0  2                  0.36159926     1.0
 3         G2-149  -1    H_0  6  C_0  4                  1.59205297     1.0
 3         G2-150  -1    H_0  8  C_0  5                  2.08673592     1.0
 3         G2-151  -1    H_0 10  C_0  5                  2.33204498     1.0
 3         G2-152  -1    H_0 12  C_0  5                  2.54149091     1.0
 3         G2-153  -1    H_0 12  C_0  5                  2.54863836     1.0
 3         G2-154  -1    H_0  8  C_0  6                  2.35336098     1.0
 3         G2-155  -1    H_0  8  C_0  6                  2.35386838     1.0
 3         G2-156  -1    H_0 12  C_0  6                  2.81109456     1.0
 3         G2-157  -1    H_0 14  C_0  6                  3.01012095     1.0
 3         G2-158  -1    H_0 14  C_0  6                  3.01159012     1.0
 3         G2-159  -1    H_0  8  C_0  7                  2.65153542     1.0
 3         G2-160  -1    H_0 16  C_0  7                  3.47918491     1.0
 3         G2-161  -1    H_0  8  C_0  8                  2.83349490     1.0
 3         G2-162  -1    H_0 18  C_0  8                  3.94812829     1.0
 3         G2-163  -1    H_0  8  C_0 10                  3.44440377     1.0
 3         G2-164  -1    H_0  8  C_0 10                  3.39028835     1.0
 4         G2-165  -1    H_0  6  C_0  3  O_0  2          1.73111684     1.0
 4         G2-166  -1    H_0 10  C_0  4  O_0  1          2.24002915     1.0
 4         G2-167  -1    H_0  7  C_0  6  N_0  1          2.45321599     1.0
 4         G2-168  -1    H_0  6  C_0  6  O_0  1          2.34409561     1.0
 4         G2-169  -1    H_0  6  C_0  4  O_0  1          1.75693771     1.0
 4         G2-170  -1    H_0  8  C_0  4  O_0  1          2.00952428     1.0
 4         G2-171  -1    H_0  8  C_0  5  O_0  1          2.28800836     1.0
 4         G2-172  -1    H_0  4  C_0  6  O_0  2          2.26630874     1.0
 4         G2-173  -1    H_0  4  C_0  4  N_0  2          1.76570905     1.0
 5         G2-174  -1    H_0  6  C_0  2  O_0  2  S_0  1  1.54362509     1.0
 4         G2-175  -1    H_0  5  C_0  6 Cl_0  1          2.14409885     1.0 
 4         G2-176  -1    H_0  4  C_0  4  N_0  2          1.75905227     1.0
 4         G2-177  -1    H_0  4  C_0  4  N_0  2          1.76530161     1.0
 4         G2-178  -1    H_0  4  C_0  4  O_0  1          1.54201931     1.0
 4         G2-179  -1    H_0  6  C_0  4  O_0  1          1.79040441     1.0
 4         G2-180  -1    H_0  6  C_0  4  O_0  3          2.16492882     1.0
 4         G2-181  -1    H_0  6  C_0  4  S_0  1          1.72815283     1.0
 4         G2-182  -1    H_0  7  C_0  4  N_0  1          1.92257336     1.0
 4         G2-183  -1    H_0  8  C_0  4  O_0  1          2.02767063     1.0
 4         G2-184  -1    H_0  8  C_0  4  O_0  1          2.01890919     1.0
 4         G2-185  -1    H_0  8  C_0  4  O_0  2          2.15750503     1.0
 4         G2-186  -1    H_0  8  C_0  4  S_0  1          1.96007688     1.0
 4         G2-187  -1    H_0  9  C_0  4 Cl_0  1          2.04701055     1.0
 4         G2-188  -1    H_0  9  C_0  4 Cl_0  1          2.03818723     1.0
 4         G2-189  -1    H_0  9  C_0  4  N_0  1          2.11980158     1.0
 5         G2-190  -1    H_0  9  C_0  4  N_0  1  O_0  2  2.37335355     1.0
 4         G2-191  -1    H_0 10  C_0  4  O_0  1          2.21812928     1.0
 4         G2-192  -1    H_0 10  C_0  4  O_0  2          2.36795405     1.0
 4         G2-193  -1    H_0 10  C_0  4  S_0  1          2.16849056     1.0
 4         G2-194  -1    H_0 10  C_0  4  S_0  2          2.26338171     1.0
 4         G2-195  -1    H_0 11  C_0  4  N_0  1          2.34602949     1.0
 4         G2-196  -1    H_0 12  C_0  4 Si_0  1          2.46140361     1.0
 4         G2-197  -1    H_0  6  C_0  5  S_0  1          2.00548689     1.0                                                
 4         G2-198  -1    H_0  7  C_0  5  N_0  1          2.16982749     1.0
 4         G2-199  -1    H_0 10  C_0  5  O_0  1          2.48581633     1.0
 4         G2-200  -1    H_0 10  C_0  5  O_0  1          2.49595703     1.0
 4         G2-201  -1    H_0 10  C_0  5  O_0  2          2.67892842     1.0
 4         G2-202  -1    H_0 10  C_0  5  S_0  1          2.43220660     1.0
 4         G2-203  -1    H_0 11  C_0  5  N_0  1          2.59763095     1.0
 4         G2-204  -1    H_0 12  C_0  5  O_0  1          2.68976010     1.0
 4         G2-205  -1    H_0  4  C_0  6  F_0  2          2.20636400     1.0
 4         G2-206  -1    H_0  4  C_0  6  F_0  2          2.20534490     1.0
 4         G2-207  -1    H_0  5  C_0  6  F_0  1          2.19356444     1.0
 4         G2-208  -1    H_0 14  C_0  6  O_0  1          3.16441770     1.0
 3         G2-209  -1    F_0  5  P_0  1                  0.88358498     1.0
 3         G2-210  -1    F_0  6  S_0  1                  0.75582233     1.0
 2         G2-211  -1    P_0  4                          0.46156839     1.0
 3         G2-212  -1    O_0  3  S_0  1                  0.54484235     1.0
 3         G2-213  -1   Cl_0  2  S_0  1                  0.20110480     1.0
 4         G2-214  -1   Cl_0  3  P_0  1  O_0  1          0.56689332     1.0
 3         G2-215  -1   Cl_0  5  P_0  1                  0.48488074     1.0
 4         G2-216  -1   Cl_0  2  O_0  2  S_0  1          0.52391177     1.0
 3         G2-217  -1   Cl_0  3  P_0  1                  0.36621229     1.0
 3         G2-218  -1   Cl_0  2  S_0  2                  0.30603388     1.0
 3         G2-219  -1   Cl_0  2 Si_0  1                  0.32457634     1.0
 4         G2-220  -1    F_0  3 Cl_0  1  C_0  1          0.68421344     1.0
 3         G2-221  -1    F_0  6  C_0  2                  1.25171994     1.0
 3         G2-222  -1    F_0  3  C_0  1                  0.54527011     1.0
 3         G2-223  -1    H_0  5  C_0  6                  1.98722459     1.0
# TMD-BE3
 2  Cr2-BE3     -1    Cr-BE3    2                         0.057370000   08.0
 2  V2-BE3      -1    V-BE3     2                         0.102309000   08.0
 2  Fe2-BE3     -1    Fe-BE3    2                         0.042262000   08.0
# TM-BE13
 3 TiCl-BE13    -1 Ti-BE13   1 Cl-BE13    1                   0.16060302   08.0000
 3 VF5-BE13     -1 V-BE13    1 F-BE13     5                   0.89902950   08.0000
 3 CrCl-BE13    -1 Cr-BE13   1 Cl-BE13    1                   0.14366305   08.0000
 4 CrOF-BE13    -1 Cr-BE13   1 O-BE13     1 F-BE13 1          0.39454351   08.0000
 3 Fe2Br4-BE13  -1 Fe2-BE13  1 Br-BE13    4                   0.58453252   08.0000
 5 CoC4O4H-BE13 -1 Co-BE13   1 C-BE13     4 O-BE13 4 H-BE13 1 1.96033529   08.0000
 3 NiCH2+-BE13  -1 Ni+-BE13  1 CH2-BE13   1                   0.12159169   08.0000
 3 FeC5O5-BE13  -1 Fe-BE13   1 CO_di-BE13 5                   0.23489666   08.0000
 3 VS-BE13      -1 V-BE13    1 S-BE13     1                   0.17035585   08.0000
 3 CuH-BE13     -1 Cu-BE13   1 H-BE13     1                   0.09975937   08.0000
 3 CuCl-BE13    -1 Cu-BE13   1 Cl-BE13    1                   0.13975873   08.0000
 3 VO-BE13      -1 V-BE13    1 O-BE13     1                   0.24063362   08.0000
 3 NiCl-BE13    -1 Ni-BE13   1 Cl-BE13    1                   0.14023681   08.0000 
# S22
 2     1-S22    -1    01a-S22    2                            0.00505171   21.0000
 2     2-S22    -1    02a-S22    2                            0.00799987   21.0000
 2     3-S22    -1    03a-S22    2                            0.02995968   21.0000
 2     4-S22    -1    04a-S22    2                            0.02568883   21.0000
 2     5-S22    -1    05a-S22    2                            0.03297159   21.0000
 3     6-S22    -1    06a-S22    1    06b-S22    1            0.02709120   21.0000
 3     7-S22    -1    07a-S22    1    07b-S22    1            0.02667687   21.0000
 2     8-S22    -1    08a-S22    2                            0.00084461   21.0000
 2     9-S22    -1    09a-S22    2                            0.00239040   21.0000
 3    10-S22    -1    10a-S22    1    10b-S22    1            0.00231072   21.0000
 2    11-S22    -1    11a-S22    2                            0.00417523   21.0000
 2    12-S22    -1    12a-S22    2                            0.00669312   21.0000
 2    13-S22    -1    13a-S22    2                            0.01552166   21.0000
 3    14-S22    -1    14a-S22    1    14b-S22    1            0.00731462   21.0000
 3    15-S22    -1    15a-S22    1    15b-S22    1            0.01858138   21.0000
 3    16-S22    -1    16a-S22    1    16b-S22    1            0.00240634   21.0000
 3    17-S22    -1    17a-S22    1    17b-S22    1            0.00524294   21.0000
 3    18-S22    -1    18a-S22    1    18b-S22    1            0.00369715   21.0000
 3    19-S22    -1    19a-S22    1    19b-S22    1            0.00725088   21.0000
 3    20-S22    -1    20a-S22    1    20b-S22    1            0.00431866   21.0000
 3    21-S22    -1    21a-S22    1    21b-S22    1            0.00895603   21.0000
 3    22-S22    -1    22a-S22    1    22b-S22    1            0.01129862   21.0000
# DC9 
 2       ISO_E36-DC9     1         ISO_P36-DC9    -1                     -0.00159360   01.0000
 2       c20cage-DC9    -1         c20bowl-DC9     1                     -0.02119488   01.0000
 2   heptatriyne-DC9     1    heptahexaene-DC9    -1                     -0.02278848   01.0000
 2       tmethen-DC9    -2            omcb-DC9     1                     -0.03059712   01.0000
 2       ISO_E35-DC9     1         ISO_P35-DC9    -1                     -0.03107520   01.0000
 2     carbooxo2-DC9    -1       carbooxo1-DC9     1                     -0.04286784   01.0000
 3         ethen-DC9    -1           ch2n2-DC9    -1   13dip-DC9    1    -0.06071616   01.0000
 2           be4-DC9     1              be-DC9    -4                     -0.14087425   01.0000
 2            s2-DC9    -4              s8-DC9     1                     -0.16095361   01.0000
# G2RC
 3   118-G2RC   -1   117-G2RC   1    13-G2RC    1                    -0.00152986    1.0000
 3    40-G2RC   -1     1-G2RC  -1   104-G2RC    1                    -0.00323501    1.0000
 3   113-G2RC   -1    30-G2RC   1     8-G2RC    1                    -0.00406368    1.0000
 3    52-G2RC   -1     1-G2RC  -1    18-G2RC    2                    -0.00618317    1.0000
 4    30-G2RC   -1    13-G2RC  -1    40-G2RC    1     1-G2RC    1    -0.01117114    1.0000
 4   128-G2RC   -1    13-G2RC  -1   126-G2RC    1    22-G2RC    1    -0.01587226    1.0000
 3   100-G2RC   -1    13-G2RC  -1   106-G2RC    1                    -0.03207917    1.0000
 3    25-G2RC   -1    14-G2RC  -1   121-G2RC    1                    -0.04042963    1.0000
 3    39-G2RC   -1    45-G2RC  -1    51-G2RC    2                    -0.04210291    1.0000
 4    58-G2RC   -1    59-G2RC  -1    57-G2RC    1    60-G2RC    1    -0.04278816    1.0000
 4    67-G2RC   -1    61-G2RC  -1    66-G2RC    1    62-G2RC    1    -0.04195949    1.0000
 3    32-G2RC   -1     1-G2RC  -1    33-G2RC    1                    -0.04658093    1.0000
 3    25-G2RC   -1    26-G2RC  -1    88-G2RC    1                    -0.05215853    1.0000
 4    47-G2RC   -1     1-G2RC  -3    18-G2RC    1    13-G2RC    1    -0.05403898    1.0000
 3    34-G2RC   -1     1-G2RC  -3    11-G2RC    2                    -0.06194324    1.0000
 4     8-G2RC   -1    45-G2RC  -2    97-G2RC    1    22-G2RC    2    -0.07502669    1.0000
 3    25-G2RC   -1     1-G2RC  -1    26-G2RC    1                    -0.07716212    1.0000
 4    56-G2RC   -1     1-G2RC  -3    21-G2RC    1    13-G2RC    2    -0.09636500    1.0000
 4    30-G2RC   -1     1-G2RC  -3    13-G2RC    1     8-G2RC    1    -0.10323341    1.0000
 4    73-G2RC   -1     1-G2RC  -1    39-G2RC    1    13-G2RC    1    -0.10951220    1.0000
 4    68-G2RC   -1     1-G2RC  -1    34-G2RC    1    13-G2RC    1    -0.12866727    1.0000
 3    26-G2RC   -1     6-G2RC  -1    82-G2RC    1                    -0.17379803    1.0000
 3     1-G2RC   -1    39-G2RC  -1    14-G2RC    2                    -0.21400456    1.0000
 2    25-G2RC   -3    94-G2RC   1                                    -0.24154197    1.0000
 3    23-G2RC   -1    39-G2RC  -1    24-G2RC    2                    -0.33895874    1.0000
# SIE11 
 3      he-SIE11     1       he+-SIE11     1       he2+-SIE11    -1    0.09153639  01.0000
 3     nh3-SIE11     1      nh3+-SIE11     1      nh32+-SIE11    -1    0.05631783  01.0000
 3     h2o-SIE11     1      h2o+-SIE11     1      h2o2+-SIE11    -1    0.05936160  01.0000
 3    but+-SIE11    -1     ethyl-SIE11     1     ethyl+-SIE11     1    0.05622221  01.0000
 3     ch3-SIE11     1    acetyl-SIE11     1    aceton+-SIE11    -1    0.03596755  01.0000
 2   clclf-SIE11     1     clfcl-SIE11    -1                          -0.00160954  01.0000
 3    c2h4-SIE11     1        f2-SIE11     1    c2h4_f2-SIE11    -1    0.00172109  01.0000
 3      li-SIE11     1        bz-SIE11     1      bz_li-SIE11    -1    0.01513920  01.0000
 3     nh3-SIE11     1       clf-SIE11     1    nh3_clf-SIE11    -1    0.01673280  01.0000
 3     mgo-SIE11     1        na-SIE11     1      naomg-SIE11    -1    0.11085082  01.0000
 3      li-SIE11     1        f2-SIE11     1      li_f2-SIE11    -1    0.15037211  01.0000

__xyg3 components__ :: 426
#G2             E[noXC]         X Energy HF    X Energy DFT   C Energy GGA  C osRPA      X_Energy_SCAN  C_Energy_SCAN    vdW_MBD
# 15+223
     H_0     -0.19247959     -0.30687159     -0.30179193    -0.00570858     0.00000000     -0.30755235     0.00000000    0.00000000
    Li_0     -5.65798850     -1.77224410     -1.75253153    -0.05103457     0.00000000     -1.77517123    -0.04600936    0.00000000
    Be_0    -11.90916606     -2.66090698     -2.63478636    -0.08560802    -0.05290639     -2.65640384    -0.08354853    0.00000000
     B_0    -20.77571233     -3.75290115     -3.72360801    -0.11262385    -0.06856123     -3.75004104    -0.11454377    0.00000000
     C_0    -32.63856543     -5.04913072     -5.01620383    -0.14382435    -0.08098988     -5.05383069    -0.14622523    0.00000000
     N_0    -47.82715490     -6.57104630     -6.52990170    -0.17862010    -0.09081553     -6.58109756    -0.18035276    0.00000000
     O_0    -66.63783339     -8.17291239     -8.14404239    -0.23302903    -0.14510197     -8.20047186    -0.23473172    0.00000000
     F_0    -89.41655029     -9.99000297     -9.97010860    -0.28936467    -0.19854588    -10.04094142    -0.28973833    0.00000000
    Na_0   -147.87798661    -13.97058000    -13.92511209    -0.36887943     0.00000000    -14.03333210    -0.36555158    0.00000000
    Mg_0   -183.64910989    -15.95591722    -15.89666982    -0.40918925    -0.04099331    -16.01382492    -0.41074617    0.00000000
    Al_0   -223.81999563    -18.04992258    -17.97165156    -0.44432482    -0.05393009    -18.10685199    -0.44684207    0.00000000
    Si_0   -268.58273011    -20.26453184    -20.16737589    -0.48339922    -0.07085251    -20.32473468    -0.48454653    0.00000000
     P_0   -318.10314948    -22.60608683    -22.48731988    -0.52498051    -0.08539973    -22.67093447    -0.52348949    0.00000000
     S_0   -372.51073475    -24.99023685    -24.85873538    -0.58309321    -0.13264595    -25.06460934    -0.57969818    0.00000000
    Cl_0   -431.97746601    -27.49953357    -27.35395335    -0.64311513    -0.17102559    -27.58534404    -0.63633399    0.00000000
    G2-1     -5.85793974     -2.12599115     -2.10596838    -0.08330068    -0.04216345     -2.13201301    -0.07794537   -0.00024758
    G2-2    -12.08307909     -3.06493715     -3.03170284    -0.10311703    -0.04863612     -3.06536169    -0.09687098   -0.00010854
    G2-3    -32.87853086     -5.39783489     -5.37077609    -0.18414428    -0.12344253     -5.41184739    -0.17914641   -0.00009723
    G2-4    -33.09043451     -5.84204343     -5.80403422    -0.21428712    -0.12828496     -5.85621915    -0.20626926   -0.00031937
    G2-5    -33.12104765     -5.76606542     -5.73927949    -0.22330965    -0.17309535     -5.78666838    -0.21105752   -0.00028961
    G2-6    -33.36992580     -6.20264080     -6.16426766    -0.25858067    -0.16957034     -6.22192944    -0.24550980   -0.00060227
    G2-7    -33.63843645     -6.56874258     -6.53000832    -0.29973118    -0.21667063     -6.58960536    -0.28059365   -0.00095985
    G2-8    -48.07429451     -6.90276366     -6.87788364    -0.22454128    -0.14341848     -6.92872524    -0.22157304   -0.00008975
    G2-9    -48.32331391     -7.25897374     -7.24336879    -0.26974845    -0.19217721     -7.29829457    -0.26209845   -0.00025507
   G2-10    -48.57195844     -7.64344202     -7.63119815    -0.31391418    -0.24020433     -7.68696970    -0.30105235   -0.00049982
   G2-11    -66.89444532     -8.52324165     -8.51654731    -0.27912632    -0.20203612     -8.57504838    -0.27659494   -0.00008685
   G2-12    -67.14877563     -8.90803852     -8.91503769    -0.32451454    -0.25683765     -8.97280691    -0.31725888   -0.00024018
   G2-13    -89.68425412    -10.37541788    -10.38329855    -0.33488425    -0.26078997    -10.44990969    -0.33135800   -0.00007886
   G2-14   -269.06650545    -20.95182891    -20.84945214    -0.55366826    -0.14975858    -21.02176362    -0.54265366   -0.00040085
   G2-15   -269.02175955    -20.98854631    -20.87811811    -0.54384415    -0.10942934    -21.05785511    -0.53354721   -0.00037861
   G2-16   -269.28239545    -21.34471440    -21.22573382    -0.58045106    -0.14732836    -21.41420395    -0.56389561   -0.00074598
   G2-17   -269.53840980    -21.70901475    -21.58033486    -0.61513957    -0.18810831    -21.77895640    -0.59153755   -0.00119765
   G2-18   -318.60198500    -23.27390394    -23.15502704    -0.60475160    -0.16362858    -23.35184567    -0.59336655   -0.00035665
   G2-19   -318.85338891    -23.62228574    -23.50084188    -0.64261730    -0.20633073    -23.70511043    -0.62462653   -0.00070375
   G2-20   -373.02868321    -25.67546549    -25.54824528    -0.66594285    -0.21606081    -25.76630498    -0.65107682   -0.00034012
   G2-21   -432.24703429    -27.85230414    -27.71107533    -0.68608721    -0.21944986    -27.94757501    -0.67310644   -0.00011236
   G2-22    -11.32339651     -3.54257657     -3.50836296    -0.12360603    -0.04253090     -3.54524886    -0.11856922   -0.00322811
   G2-23    -95.07183614    -11.90410172    -11.91244136    -0.37529857    -0.26625753    -11.99251796    -0.37508800   -0.00024703
   G2-24    -65.86569157    -10.97250536    -10.96340956    -0.42950133    -0.31871400    -11.03452404    -0.41902743   -0.00079816
   G2-25    -66.33029358    -11.72050606    -11.68429104    -0.49399227    -0.35587767    -11.77229509    -0.47375776   -0.00158960
   G2-26    -66.78101893    -12.46538116    -12.39973595    -0.55920877    -0.39453169    -12.50670249    -0.52828902   -0.00272922
   G2-27    -80.59977708    -11.60026537    -11.64919271    -0.40010431    -0.31543192    -11.71064507    -0.40142956   -0.00016677
   G2-28    -80.86261504    -12.03397372    -12.05187299    -0.43991840    -0.34369610    -12.12278144    -0.43413955   -0.00042788
   G2-29    -99.47800731    -13.29115419    -13.31561127    -0.44845156    -0.35229231    -13.39299100    -0.44688265   -0.00015110
   G2-30    -99.63076673    -13.64757758    -13.67538594    -0.47780824    -0.35074843    -13.75697256    -0.47421930   -0.00037649
   G2-31    -99.86031103    -14.03814916    -14.05399315    -0.51459084    -0.39807132    -14.14319251    -0.50430494   -0.00067743
   G2-32   -100.28606005    -14.79243073    -14.77615753    -0.58038699    -0.43436559    -14.88355537    -0.56056902   -0.00151815
   G2-33    -95.87562529    -13.09823596    -13.13208523    -0.45165206    -0.36249475    -13.20475680    -0.44953239   -0.00015545
   G2-34    -96.62773822    -14.58765716    -14.58103263    -0.58513311    -0.44245835    -14.67832293    -0.56712501   -0.00141840
   G2-35   -114.59798722    -14.68568344    -14.73652649    -0.49019971    -0.38451822    -14.81364382    -0.49179321   -0.00013265
   G2-36   -133.36939259    -16.29316011    -16.36032783    -0.52892808    -0.40159756    -16.44720235    -0.53229432   -0.00011345
   G2-37   -133.80051501    -17.02544723    -17.08108329    -0.59811446    -0.48848439    -17.18044554    -0.59162645   -0.00055820
   G2-38   -178.86847951    -19.87616305    -19.95455468    -0.61268724    -0.51029815    -20.07066672    -0.61300276   -0.00008168
   G2-39   -166.12323458    -21.55922340    -21.62929050    -0.73928897    -0.57885504    -21.75186250    -0.73673264   -0.00050259
   G2-40   -295.76690544    -27.92709719    -27.84953754    -0.75600896    -0.03723819    -28.05380686    -0.75473685   -0.00847251
   G2-41   -537.21348185    -40.54061972    -40.37480551    -1.00833706    -0.18240706    -40.68669314    -1.00803302   -0.00043443
   G2-42   -636.31955547    -45.14950158    -44.97834090    -1.12649760    -0.30570977    -45.33291409    -1.12123340   -0.00032689
   G2-43   -745.09879859    -49.97332595    -49.76839122    -1.22088534    -0.32874896    -50.17076654    -1.21362955   -0.00029261
   G2-44   -863.99075134    -54.98556130    -54.73803406    -1.32380139    -0.40922402    -55.18923539    -1.30990370   -0.00026787
   G2-45   -579.85318309    -41.58322015    -41.39778718    -1.04636919    -0.21518464    -41.74371060    -1.03290591   -0.00096036
   G2-46   -335.34626898    -28.47629443    -28.43989224    -0.77618200    -0.34370110    -28.64126215    -0.77748085   -0.00019076
   G2-47   -405.28800509    -30.04548773    -29.95621869    -0.79252602    -0.32828985    -30.18597952    -0.78660982   -0.00022149
   G2-48   -439.22524576    -33.15756678    -33.09372722    -0.87307933    -0.36941411    -33.33965508    -0.87189040   -0.00017093
   G2-49   -498.65922245    -35.61045305    -35.53484334    -0.92390892    -0.40541332    -35.80109274    -0.92052855   -0.00015913
   G2-50   -521.42505857    -37.45744442    -37.37138456    -0.96841371    -0.45795857    -37.65501616    -0.96218108   -0.00013936
   G2-51   -538.60339019    -42.74040510    -42.50024733    -1.19371768    -0.33917971    -42.88304030    -1.15434673   -0.00321532
   G2-52   -465.39213234    -33.73955842    -33.57611356    -0.94237508    -0.39798595    -33.85945240    -0.91821789   -0.00132887
   G2-53   -406.17057525    -31.56924651    -31.41865203    -0.92441166    -0.39495604    -31.68302108    -0.89843426   -0.00179559
   G2-54   -498.89566532    -36.00627351    -35.91239704    -0.96084142    -0.45095787    -36.18736501    -0.95098525   -0.00039666
   G2-55   -505.89261447    -41.36986239    -41.36731367    -1.16923194    -0.65129959    -41.65697053    -1.16628973   -0.00056423
   G2-56   -289.19296917    -34.11330833    -34.12497200    -1.08960609    -0.80291540    -34.35457236    -1.08341110   -0.00100454
   G2-57  -1316.83902298    -86.49679974    -86.07619175    -2.15510330    -0.69297430    -86.80605123    -2.12216266   -0.00205598
   G2-58   -492.17580024    -48.40606575    -48.36705688    -1.40275764    -0.79697916    -48.71358199    -1.39808541   -0.00109588
   G2-59  -1519.84299587   -100.83936723   -100.33484357    -2.47038646    -0.66478204   -101.19293817    -2.43451453   -0.00248298
   G2-60   -390.45205141    -45.33170691    -45.38475875    -1.46832630    -1.09836694    -45.68120893    -1.45935909   -0.00141428
   G2-61  -1760.67187238   -115.18743814   -114.67797763    -2.87792823    -0.96328866   -115.62596569    -2.84247196   -0.00334850
   G2-62   -471.98464251    -38.32718405    -38.27203837    -1.08245925    -0.54514493    -38.55012965    -1.07497469   -0.00066172
   G2-63   -777.82989960    -55.10728638    -54.92724800    -1.42705667    -0.51269539    -55.36088243    -1.41473153   -0.00093175
   G2-64   -278.27643966    -33.43116002    -33.50047765    -1.10302300    -0.84140139    -33.70735861    -1.09815052   -0.00087118
   G2-65   -626.42224458    -60.70955038    -60.64954301    -1.77926495    -1.06412769    -61.09145850    -1.76863480   -0.00190068
   G2-66  -1996.61987886   -130.57325395   -129.92327759    -3.20451515    -0.90715226   -131.03429262    -3.15643489   -0.00413798
   G2-67   -162.46725643    -21.25587975    -21.37277364    -0.74166349    -0.61153207    -21.47876770    -0.74153047   -0.00045904
   G2-68   -546.62825170    -42.10015597    -42.09284941    -1.16183671    -0.64617304    -42.39165944    -1.15589057   -0.00058913
   G2-69   -316.19327550    -36.44340001    -36.58468729    -1.17684538    -0.94670302    -36.79631673    -1.17695719   -0.00068785
   G2-70   -586.50672605    -52.76022926    -52.72324643    -1.51218566    -0.87679895    -53.09990958    -1.50620106   -0.00099451
   G2-71   -200.02485367    -24.29320576    -24.49880119    -0.81552824    -0.73908618    -24.61051314    -0.82069049   -0.00036152
   G2-72   -245.54738949    -27.98325580    -28.12763150    -0.88867365    -0.74864510    -28.28346246    -0.89080609   -0.00030776
   G2-73   -700.26043257    -57.34078332    -57.40106006    -1.60453054    -1.00748951    -57.79265088    -1.60420016   -0.00078920
   G2-74   -423.10590071    -50.45637293    -50.53767737    -1.66284524    -1.24779047    -50.85638816    -1.65414579   -0.00209650
   G2-75  -1793.33750868   -120.38261060   -119.87525452    -3.08057696    -1.10217600   -120.85324277    -3.04310613   -0.00444090
   G2-76   -381.62238061    -46.97428288    -47.05029557    -1.57406071    -1.18984657    -47.34459847    -1.56458751   -0.00237022
   G2-77    -99.01185789    -16.87707817    -16.84254382    -0.69098083    -0.49508153    -16.96035987    -0.66902326   -0.00237790
   G2-78    -99.01856144    -16.86539344    -16.84028700    -0.69135880    -0.49657382    -16.95589848    -0.67033683   -0.00227515
   G2-79    -98.95409414    -16.89250875    -16.85680163    -0.70384529    -0.49766120    -16.96951753    -0.68302070   -0.00251267
   G2-80    -99.47877736    -17.61663551    -17.55510323    -0.75504439    -0.53433794    -17.69073226    -0.72317127   -0.00357873
   G2-81    -99.42572000    -17.65647960    -17.58484163    -0.76989563    -0.53269556    -17.72106960    -0.73694039   -0.00381644
   G2-82    -99.92798940    -18.35901557    -18.26663948    -0.81953957    -0.57359622    -18.42179415    -0.77689292   -0.00510820
   G2-83   -132.17822769    -22.76963207    -22.71562783    -0.95047628    -0.67528578    -22.88025035    -0.91758794   -0.00449024
   G2-84   -132.15608748    -22.78162542    -22.72150688    -0.95242207    -0.67209283    -22.88581059    -0.91902333   -0.00400419
   G2-85   -132.11581837    -22.79899416    -22.73746451    -0.96552113    -0.67399228    -22.90058414    -0.93210442   -0.00464428
   G2-86   -132.07410843    -22.82561229    -22.75358674    -0.98037515    -0.67542228    -22.91802544    -0.94591347   -0.00510156
   G2-87   -132.12415268    -22.80035859    -22.73348883    -0.97000341    -0.67728994    -22.90037075    -0.93417694   -0.00507391
   G2-88   -132.57556470    -23.54648923    -23.44694334    -1.03341917    -0.71515984    -23.63394774    -0.98666398   -0.00677851
   G2-89   -132.62767528    -23.51221538    -23.42431707    -1.01678466    -0.71389695    -23.60866382    -0.97312034   -0.00621175
   G2-90   -133.07425393    -24.25312209    -24.13397169    -1.08001060    -0.75281472    -24.33728892    -1.02563878   -0.00766863
   G2-91   -133.07811987    -24.24964361    -24.13048277    -1.08087204    -0.75399415    -24.33467196    -1.02647551   -0.00816421
   G2-92   -165.21483097    -28.73534793    -28.63586186    -1.24049057    -0.85122001    -28.84783470    -1.19436816   -0.00763037
   G2-93   -197.55197428    -33.18938350    -33.11718769    -1.37086815    -0.94686330    -33.34922244    -1.33118424   -0.00783679
   G2-94   -212.04064103    -25.93641866    -25.94998174    -0.87898569    -0.65992592    -26.12589829    -0.86536027   -0.00112300
   G2-95   -301.25257055    -35.62835438    -35.66450139    -1.17294104    -0.88040044    -35.89990710    -1.16197683   -0.00125071
   G2-96   -897.15133127    -60.89823918    -60.61633343    -1.58651124    -0.58326896    -61.12156446    -1.55830758   -0.00185371
   G2-97  -1328.91185618    -88.04738276    -87.65074996    -2.23181703    -0.77190008    -88.37747386    -2.19990130   -0.00252754
   G2-98    -81.70680256    -13.53533020    -13.49758035    -0.57211428    -0.41781338    -13.60129818    -0.54724357   -0.00205151
   G2-99   -114.01048552    -17.94299070    -17.93462228    -0.70125778    -0.51890948    -18.05270705    -0.68386120   -0.00188008
  G2-100   -214.60071035    -29.12149424    -29.21360273    -1.07378346    -0.84790279    -29.38479866    -1.05874697   -0.00252249
  G2-101   -214.64502212    -29.06973833    -29.16800254    -1.06679020    -0.85243268    -29.34028270    -1.05247663   -0.00253402
  G2-102   -302.68666690    -27.61671310    -27.46164550    -0.87594188    -0.36620551    -27.70807813    -0.84060795   -0.00296497
  G2-103   -166.54100374    -22.27594353    -22.31937418    -0.80103931    -0.61778931    -22.45722559    -0.79039911   -0.00119458
  G2-104   -199.68265495    -28.15935071    -28.18014796    -1.05785361    -0.79773067    -28.36881157    -1.03478863   -0.00314648
  G2-105   -181.09613122    -26.93275760    -26.92618260    -1.05380422    -0.77684277    -27.11054226    -1.02576370   -0.00380329
  G2-106   -114.36676885    -18.70411258    -18.66576577    -0.78074298    -0.55947551    -18.79850780    -0.75390326   -0.00301987
  G2-107   -161.22802498    -23.39097912    -23.45848590    -0.84044462    -0.65515354    -23.58534913    -0.83704045   -0.00119010
  G2-108   -114.85043705    -19.42178598    -19.35968000    -0.83135556    -0.59702629    -19.51175105    -0.79476120   -0.00424846
  G2-109   -114.85852973    -19.42626856    -19.36289233    -0.83237671    -0.59713440    -19.51464907    -0.79587107   -0.00431195
  G2-110   -132.56261405    -19.19841354    -19.22441851    -0.71502930    -0.53831653    -19.34331439    -0.70335905   -0.00131628
  G2-111   -132.95585973    -19.94938848    -19.93762967    -0.78710888    -0.57811250    -20.07479898    -0.76502157   -0.00233385
  G2-112   -133.01637811    -19.93585594    -19.92752057    -0.77559876    -0.57553679    -20.06457354    -0.75375355   -0.00235427
  G2-113   -199.24719122    -27.39889315    -27.44773224    -0.98957027    -0.75885806    -27.61456406    -0.97668948   -0.00201199
  G2-114   -133.43784929    -20.68600314    -20.64339867    -0.84059840    -0.61305353    -20.79923467    -0.80899864   -0.00354695
  G2-115   -133.43282160    -20.67176147    -20.63315762    -0.83750643    -0.61364743    -20.79054680    -0.80549169   -0.00347866
  G2-116   -438.83439984    -36.75283542    -36.60171086    -1.13403841    -0.53758393    -36.89427458    -1.10701372   -0.00277838
  G2-117   -505.94862932    -45.66588185    -45.54279302    -1.46784703    -0.81045115    -45.89922848    -1.43197835   -0.00499324
  G2-118   -439.31875273    -37.46179156    -37.28508174    -1.18475027    -0.57441277    -37.59758409    -1.14708503   -0.00401154
  G2-119   -439.31634770    -37.46119005    -37.28762279    -1.18401082    -0.57488684    -37.59869251    -1.14703546   -0.00377845
  G2-120   -155.53292681    -21.40051885    -21.39557210    -0.78526697    -0.57936816    -21.54207117    -0.76772443   -0.00168337
  G2-121   -498.54339569    -39.63157717    -39.44260445    -1.20255617    -0.57713612    -39.77429867    -1.16665417   -0.00342495
  G2-122   -498.08804341    -38.88813153    -38.73309521    -1.13945502    -0.54021754    -39.04413036    -1.11464460   -0.00209343
  G2-123   -146.70539976    -23.09147492    -23.09188010    -0.89570524    -0.66105849    -23.23857322    -0.87720733   -0.00268454
  G2-124   -166.16743155    -25.83615814    -25.80076670    -1.03713412    -0.75371670    -25.98689318    -1.00341104   -0.00460213
  G2-125   -199.68970462    -28.18127456    -28.19544103    -1.06234027    -0.79411987    -28.38304371    -1.03948642   -0.00309139
  G2-126   -222.23418194    -29.63003579    -29.65097126    -1.06903677    -0.79929026    -29.84750888    -1.04990381   -0.00250342
  G2-127   -564.79606854    -47.09352623    -46.97411228    -1.42076002    -0.76432770    -47.33457449    -1.39469554   -0.00300918
  G2-128   -531.68918032    -45.52630466    -45.31042353    -1.46297952    -0.75636116    -45.69031244    -1.41532265   -0.00594739
  G2-129   -166.59166281    -26.57633125    -26.50759924    -1.10180048    -0.79326378    -26.71253769    -1.05844173   -0.00627786
  G2-130   -166.58376722    -26.56610928    -26.50100134    -1.09784679    -0.79253700    -26.70685345    -1.05403184   -0.00571314
  G2-131   -147.99926477    -25.30454439    -25.21830873    -1.09189683    -0.77832357    -25.41951595    -1.04370201   -0.00718458
  G2-132   -198.35758159    -30.31534359    -30.30239564    -1.19454143    -0.85670267    -30.50352270    -1.16747273   -0.00454011
  G2-133   -504.22946698    -47.11284529    -46.96559690    -1.54173773    -0.81969082    -47.32174245    -1.50951667   -0.00519878
  G2-134   -179.76985025    -29.08366430    -29.04318336    -1.18948656    -0.83670652    -29.23944260    -1.15785518   -0.00543175
  G2-135   -212.49274104    -34.24427186    -34.20447429    -1.38170210    -0.97241394    -34.43417026    -1.34744981   -0.00685702
  G2-136     -0.47699174     -0.65573782     -0.64684114    -0.04288584    -0.04369303     -0.65915613    -0.03561892   -0.00008167
  G2-137   -372.76944460    -25.32649631    -25.19830759    -0.62506837    -0.17193024    -25.41082999    -0.61630508   -0.00011827
  G2-138    -65.56056657    -10.59576487    -10.59176264    -0.38658337    -0.27178978    -10.65891256    -0.38275259   -0.00046376
  G2-139    -66.06237710    -11.33826382    -11.31074865    -0.45436918    -0.31178178    -11.39408038    -0.44069971   -0.00113030
  G2-140   -132.78496195    -19.54715265    -19.55144995    -0.73822300    -0.53905587    -19.68008892    -0.72329300   -0.00180557
  G2-141   -100.03281191    -14.41651573    -14.40957057    -0.54334019    -0.38822584    -14.51004428    -0.53063166   -0.00104618
  G2-142   -100.05203400    -14.38953046    -14.38063533    -0.53946767    -0.38110833    -14.48342888    -0.52578423   -0.00106497
  G2-143   -133.20545974    -20.27830882    -20.24691939    -0.79992914    -0.56286450    -20.39688852    -0.77468434   -0.00295676
  G2-144   -405.91951963    -31.21355843    -31.06685768    -0.88538956    -0.35208689    -31.32403365    -0.86602019   -0.00134736
  G2-145    -66.51825131    -12.09528359    -12.03470841    -0.52002356    -0.34748760    -12.13785670    -0.49577372   -0.00210521
  G2-146    -99.66899295    -17.98709933    -17.90334765    -0.78154294    -0.51797006    -18.05294470    -0.74598199   -0.00416506
  G2-147   -132.82098076    -23.87796476    -23.77016022    -1.04335957    -0.69841922    -23.96720315    -0.99630905   -0.00685023
  G2-148   -181.24118695    -22.84028738    -22.97516713    -0.77894891    -0.63013424    -23.08872263    -0.78184912   -0.00041469
  G2-149   -132.16460032    -22.76260799    -22.71181339    -0.95177156    -0.67528217    -22.87475198    -0.91914613   -0.00428548
  G2-150   -165.32460090    -28.66616833    -28.58500062    -1.21323571    -0.85564699    -28.79860959    -1.16858365   -0.00752473
  G2-151   -165.73062220    -29.46311227    -29.33070142    -1.29821505    -0.89363328    -29.56853118    -1.23903534   -0.01018560
  G2-152   -166.22049128    -30.14724555    -30.00127262    -1.34047231    -0.93214011    -30.25283711    -1.27436268   -0.01029227
  G2-153   -166.22758738    -30.14017027    -29.99356647    -1.34340588    -0.93584744    -30.24797014    -1.27708606   -0.01197094
  G2-154   -197.97823015    -33.88800662    -33.79208063    -1.43225018    -0.99489425    -34.04042670    -1.38265065   -0.00971330
  G2-155   -197.97583887    -33.89320446    -33.79371195    -1.43252761    -0.99297097    -34.04258425    -1.38255708   -0.00951136
  G2-156   -198.87630995    -35.36615971    -35.20430267    -1.56113777    -1.07342168    -35.49338979    -1.48966357   -0.01398035
  G2-157   -199.36663492    -36.04141457    -35.86864680    -1.60094100    -1.11144297    -36.16836575    -1.52310475   -0.01293760
  G2-158   -199.36594044    -36.03781685    -35.86539853    -1.60334438    -1.11433332    -36.16584929    -1.52574576   -0.01437556
  G2-159   -230.69935257    -39.08394393    -38.98622599    -1.63245470    -1.12707318    -39.26653054    -1.58102548   -0.01065279
  G2-160   -232.51243785    -41.93592463    -41.73632182    -1.86143784    -1.29074547    -42.08433053    -1.77184897   -0.01559896
  G2-161   -263.37115114    -44.19449544    -44.11240509    -1.82465532    -1.27756784    -44.41816710    -1.77349154   -0.01258435
  G2-162   -265.65889127    -47.82977267    -47.60341756    -2.12187884    -1.47006057    -47.99951598    -2.02057968   -0.01826039
  G2-163   -328.76807630    -54.64141911    -54.53869533    -2.24743484    -1.54475706    -54.91551772    -2.18819714   -0.01614679
  G2-164   -328.74829494    -54.58841879    -54.51255725    -2.24426022    -1.55902039    -54.88369280    -2.18682799   -0.01591951
  G2-165   -232.83079666    -34.06434413    -34.05564462    -1.31933416    -0.97431937    -34.29400743    -1.28407423   -0.00523996
  G2-166   -199.74359161    -32.46712162    -32.37112181    -1.36400182    -0.97458170    -32.62638114    -1.30864581   -0.00968690
  G2-167   -245.62416214    -40.16209782    -40.09598937    -1.64768022    -1.15139187    -40.37365642    -1.60214750   -0.00974592
  G2-168   -264.20924374    -41.41306750    -41.36867261    -1.65587462    -1.16794474    -41.64976339    -1.61537850   -0.00890573
  G2-169   -198.83091449    -30.97938712    -30.95598683    -1.23224041    -0.89619207    -31.16995514    -1.19851651   -0.00498679
  G2-170   -199.24243428    -31.77979113    -31.70097581    -1.31609968    -0.93293163    -31.94188537    -1.26726288   -0.00799622
  G2-171   -231.96894960    -36.94484670    -36.86947530    -1.51603196    -1.07326063    -37.13860547    -1.46556030   -0.00960189
  G2-172   -330.45889474    -48.83880368    -48.86570635    -1.86377893    -1.36145486    -49.17775313    -1.83104344   -0.00856672
  G2-173   -227.43598598    -35.30169175    -35.29177769    -1.39279187    -0.99688208    -35.51986360    -1.36375993   -0.00592972
  G2-174   -572.55397711    -53.95447016    -53.85266211    -1.76001811    -1.03365420    -54.26737877    -1.71987660   -0.00616049
  G2-175   -629.30954785    -60.35515154    -60.16400278    -2.01671025    -1.13275356    -60.62017443    -1.97211590   -0.00886732
  G2-176   -227.53036496    -35.20474212    -35.20150176    -1.36221198    -1.00208809    -35.42637278    -1.33479184   -0.00556022
  G2-177   -227.43478298    -35.29359444    -35.28752850    -1.39222318    -0.99883316    -35.51434595    -1.36359190   -0.00590160
  G2-178   -198.39534894    -30.23689611    -30.24072402    -1.16696711    -0.85938525    -30.43749074    -1.14199845   -0.00420251
  G2-179   -198.86120818    -30.98678686    -30.96069863    -1.23223328    -0.89552555    -31.17486068    -1.19750591   -0.00537206
  G2-180   -332.22281597    -47.43871462    -47.46316921    -1.79825180    -1.33512507    -47.78024450    -1.76045513   -0.00703939
  G2-181   -504.67733303    -47.82649509    -47.64497426    -1.59883664    -0.85657864    -48.01975602    -1.55592483   -0.00674386
  G2-182   -180.30556916    -29.72952473    -29.66747363    -1.22159088    -0.87777429    -29.88277368    -1.18046677   -0.00690682
  G2-183   -199.31178462    -31.73224971    -31.66973755    -1.29820384    -0.93322034    -31.90451817    -1.25266403   -0.00716362
  G2-184   -199.30981857    -31.72289653    -31.66115049    -1.29683786    -0.93498173    -31.89516823    -1.25153182   -0.00764524
  G2-185   -265.90219642    -39.98759258    -39.93624548    -1.59635792    -1.15384789    -40.22993580    -1.54613928   -0.00932405
  G2-186   -505.12702477    -48.56501006    -48.35195612    -1.66329271    -0.89621028    -48.74669702    -1.60970566   -0.00881400
  G2-187   -564.84871465    -51.41001143    -51.16834853    -1.72593739    -0.93950354    -51.59981824    -1.66617658   -0.00959889
  G2-188   -564.83553785    -51.42031524    -51.17762749    -1.72338202    -0.93571970    -51.60573249    -1.66399067   -0.00857291
  G2-189   -180.65962415    -30.52586341    -30.42348592    -1.30995231    -0.91696115    -30.65893010    -1.25659274   -0.00904351
  G2-190   -314.04432013    -46.80466540    -46.81645649    -1.85679473    -1.38781060    -47.13430598    -1.80645660   -0.01109566
  G2-191   -199.73453734    -32.46053397    -32.36888128    -1.35816798    -0.97149901    -32.62318724    -1.30256201   -0.00802418
  G2-192   -266.38859793    -40.67340575    -40.60796768    -1.63988069    -1.19357051    -40.91429790    -1.58332439   -0.01000388
  G2-193   -505.62243960    -49.23829085    -49.00908597    -1.70883567    -0.93780307    -49.42069383    -1.64757035   -0.01062267
  G2-194   -878.15900457    -74.23844021    -73.91216075    -2.32977066    -1.11820275    -74.52137757    -2.26472607   -0.00980968
  G2-195   -181.16115910    -31.20808729    -31.09010670    -1.35612860    -0.95901128    -31.34175009    -1.29572908   -0.01081755
  G2-196   -402.13499555    -45.33504179    -45.10063677    -1.65975706    -0.90349473    -45.49203964    -1.58946211   -0.01061017
  G2-197   -537.37679289    -53.00871034    -52.83553636    -1.80270707    -0.99916641    -53.23996483    -1.75864870   -0.00776151
  G2-198   -212.91362172    -34.97269880    -34.90769902    -1.44865760    -1.01693846    -35.15303314    -1.40506007   -0.00820832
  G2-199   -232.38936848    -37.67797721    -37.57122321    -1.57882765    -1.11343370    -37.86260372    -1.51799725   -0.01160114
  G2-200   -232.45582502    -37.62855614    -37.53883702    -1.55924388    -1.11271763    -37.82218709    -1.50190437   -0.00978446
  G2-201   -299.13206878    -45.85091518    -45.78946332    -1.84112788    -1.33415013    -46.12563068    -1.78225647   -0.01081923
  G2-202   -538.27001451    -54.46384117    -54.22292636    -1.92576356    -1.07629795    -54.66759967    -1.86022866   -0.01242990
  G2-203   -213.80389744    -36.42721509    -36.29658816    -1.57286111    -1.09729994    -36.58263819    -1.50746210   -0.01279825
  G2-204   -232.88019014    -38.34951618    -38.23080946    -1.62266024    -1.15592295    -38.53633056    -1.55526482   -0.01291323
  G2-205   -375.95243781    -52.55283001    -52.54161977    -1.95426118    -1.39346233    -52.89310478    -1.91902847   -0.00828400
  G2-206   -375.95103950    -52.55300068    -52.54210107    -1.95402373    -1.39370865    -52.89319359    -1.91893140   -0.00827234
  G2-207   -286.75279064    -42.87087995    -42.82945448    -1.66249344    -1.17032636    -43.12109340    -1.62510121   -0.00805430
  G2-208   -266.03479933    -44.24304339    -44.09857312    -1.88133673    -1.33368151    -44.45144561    -1.80231264   -0.01487910
  G2-209   -765.28168768    -72.99052307    -72.95402662    -2.16653846    -1.35684649    -73.47994427    -2.15208426   -0.00246043
  G2-210   -908.99068328    -85.25355975    -85.28226062    -2.55038299    -1.67068386    -85.88584043    -2.53563322   -0.00315339
  G2-211  -1272.57905184    -90.42475643    -90.05867869    -2.31699776    -0.61256465    -90.77102183    -2.30628710   -0.00217809
  G2-212   -572.49171608    -49.61808337    -49.64618199    -1.45948179    -0.87566866    -49.98831917    -1.45370799   -0.00117010
  G2-213  -1236.54626379    -79.97779381    -79.63376417    -1.94809928    -0.59295220    -80.28748727    -1.92943385   -0.00100860
  G2-214  -1680.78142627   -113.46227142   -113.00711321    -2.86561039    -0.98384317   -113.94024853    -2.83089759   -0.00336168
  G2-215  -2478.07975558   -160.23117239   -159.49884524    -3.93426758    -1.18131067   -160.84033754    -3.88511339   -0.00554834
  G2-216  -1369.80206863    -96.44176399    -96.18502928    -2.52509118    -1.06220150    -96.94119187    -2.50312115   -0.00280324
  G2-217  -1614.17188987   -105.15695301   -104.68511964    -2.57478559    -0.76013667   -105.55620989    -2.54629896   -0.00224480
  G2-218  -1609.10633815   -104.94853657   -104.52737785    -2.57293320    -0.78830966   -105.37997271    -2.55115472   -0.00203240
  G2-219  -1132.66249612    -75.35776775    -75.01180290    -1.84555545    -0.51286797    -75.63383217    -1.82623741   -0.00111977
  G2-220   -733.00997686    -62.78609563    -62.70386058    -1.81980926    -1.06591474    -63.16334026    -1.80403822   -0.00175212
  G2-221   -602.01250149    -70.57633952    -70.66067541    -2.30932118    -1.72421677    -71.12527974    -2.29373137   -0.00402899
  G2-222   -300.99090910    -35.24423182    -35.29350885    -1.13489870    -0.83893561    -35.51923999    -1.13215584   -0.00081003
  G2-223   -197.28295237    -32.80304506    -32.74312886    -1.33132382    -0.88862549    -32.96946421    -1.29840448   -0.00707326
#TMD-BE3       E[noXC]      X Energy HF      X Energy DFT    C Energy GGA   C Energy osRPA  X Energy SCAN  C Energy SCAN  vdW_MBD
 Cr2-BE3    -2009.08959198    -94.94589111    -95.54716199    -2.07854149    -1.60549619    -96.05892214    -2.11720196   -0.00123130
  V2-BE3    -1811.52860215    -88.77821173    -89.10875480    -1.94986679    -1.23248614    -89.62490477    -1.97916416   -0.00088276
 Fe2-BE3    -2440.75047272   -109.22499682   -109.63806731    -2.28949351    -1.37026018   -110.22005928    -2.33204306   -0.00067901
  Cr-BE3    -1004.37884285    -48.02111942    -47.96809942    -0.98142823    -0.36262858    -48.27960920    -0.99089050    0.00000000
   V-BE3     -905.77670495    -44.57210897    -44.50217778    -0.92954910    -0.38706252    -44.79793139    -0.94440962    0.00000000
  Fe-BE3    -1220.37243789    -54.79464899    -54.80267854    -1.11674382    -0.54286565    -55.11813491    -1.13722424    0.00000000
#TM-BE13             E[noXC]         X Energy HF   X Energy DFT     C Energy GGA  C Energy osRPA   X Energy SCAN   C Energy SCAN  vdW_MBD
   TiCl-BE13      -1247.28404133    -69.11116006    -68.92612431    -1.54994154    -0.53435545    -69.43746423    -1.54586196   -0.00044814
    VF5-BE13      -1354.00858772    -94.40715133    -94.76823480    -2.54929295    -1.87988836    -95.37970134    -2.54597285   -0.00377705
   CrCl-BE13      -1438.56441451    -75.63573359    -75.46979285    -1.66300381    -0.60500728    -76.01064232    -1.66221854   -0.00050171
   CrOF-BE13      -1161.00881373    -65.89005750    -66.06577644    -1.59858378    -1.00617068    -66.46901503    -1.60807531   -0.00066565
 Fe2Br4-BE13     -12547.70280306   -473.43670494   -472.83714630    -9.15829481    -2.27820977   -475.66462488    -9.19000923   -0.00628424
CoC4O4H-BE13      -1736.57687672   -111.70750364   -112.21577194    -3.15012886    -2.40033656   -112.84192392    -3.15672611   -0.00854935
 NiCH2+-BE13      -1496.88443922    -67.79853172    -67.93044768    -1.49795908    -0.81646827    -68.30911931    -1.50504076   -0.00131594
 FeC5O5-BE13      -1718.27670936   -121.06237286   -121.59390439    -3.51577867    -2.69017962   -122.28113321    -3.52166665   -0.01014870
     VS-BE13      -1279.94560698    -69.64204211    -69.58466642    -1.56646823    -0.59635822    -70.07143173    -1.56975407   -0.00045757
    CuH-BE13      -1593.49510511    -66.45831218    -66.58164285    -1.37148626    -0.82809262    -66.91365101    -1.39303768   -0.00017791
   CuCl-BE13      -2027.34497276    -93.86104840    -93.83639993    -2.01737054    -0.99266747    -94.39849455    -2.03040025   -0.00038950
     VO-BE13       -972.60072718    -52.68512413    -52.78189869    -1.22048162    -0.69862921    -53.10810688    -1.22990746   -0.00019295
   NiCl-BE13      -1897.82895697    -89.97432198    -89.91312981    -1.94598733    -0.76294988    -90.48612150    -1.95729599   -0.00047597
  CO_di-BE13        -99.57801040    -13.30121303    -13.32699975    -0.44825203    -0.35276871    -13.40400803    -0.44681169   -0.00015080
    CH2-BE13        -33.13498342     -5.77419483     -5.74607640    -0.22320979    -0.17408176     -5.79363049    -0.21093638   -0.00030462
    Fe2-BE13      -2440.75047272   -109.22499682   -109.63806731    -2.28949351    -1.37026018   -110.22005928    -2.33204306   -0.00067941
     Ti-BE13       -813.21138113    -41.36977583    -41.27641452    -0.87396618    -0.35908930    -41.55899292    -0.88546946    0.00000000
     Cl-BE13       -434.09205283    -27.62798992    -27.48780997    -0.64267036    -0.17032031    -27.71743502    -0.63630173    0.00000000
      V-BE13       -905.77670353    -44.57210986    -44.50217924    -0.92954916    -0.38706357    -44.79784461    -0.94440930    0.00000000
      F-BE13        -89.54437813    -10.00384616     -9.98475798    -0.28926842    -0.19863379    -10.05541171    -0.28971886    0.00000000
      O-BE13        -66.71424748     -8.18223344     -8.15390219    -0.23296432    -0.14514410     -8.21014298    -0.23472376    0.00000000
     Fe-BE13      -1220.37243789    -54.79464899    -54.80267854    -1.11674382    -0.54286565    -55.11813491    -1.13722424    0.00000000
     Br-BE13      -2526.66282403    -90.98234593    -90.76346694    -1.69124799    -0.23547749    -91.30938842    -1.69441869    0.00000000
     Co-BE13      -1337.93114629    -58.44050453    -58.49442681    -1.19065825    -0.62646021    -58.82261516    -1.21314678    0.00000000
      H-BE13         -0.19248167     -0.30687922     -0.30180010    -0.00570844    -0.00000000     -0.30756032    -0.00000000    0.00000000
     Ni-BE13      -1463.71183651    -62.28691071    -62.34607145    -1.26462505    -0.57450122    -62.68864186    -1.28853572    0.00000000
    Ni+-BE13      -1463.52562746    -62.25057147    -62.24466269    -1.25237057    -0.54656178    -62.58673968    -1.26729243    0.00000000
     Cu-BE13      -1593.18971918    -66.21427768    -66.30582446    -1.33825543    -0.76558810    -66.63250079    -1.36357303    0.00000000
     Cr-BE13      -1004.37884280    -48.02111928    -47.96809947    -0.98142823    -0.36262858    -48.27960928    -0.99089050    0.00000000
      S-BE13       -374.13109385    -25.09447481    -24.96735699    -0.58273460    -0.13229445    -25.17217825    -0.57961994    0.00000000
      C-BE13        -32.66003224     -5.05268609     -5.01995969    -0.14379503    -0.08099187     -5.05752063    -0.14622140    0.00000000
#S22             E[noXC]       X Energy HF    X Energy DFT   C Energy GGA   C Energy osRPA   X Energy SCAN  C Energy SCAN   vdW_MBD
  1-S22       -97.13608589    -15.29587858    -15.27213518    -0.63057571    -0.48245441    -15.38367467    -0.60548172    -0.00188207
01a-S22       -48.56785715     -7.64766940     -7.63509280    -0.31411888    -0.24018937     -7.69106361    -0.30119068    -0.00049756
  2-S22      -134.28757757    -17.83045440    -17.84443785    -0.65248983    -0.51498041    -17.96032901    -0.63848483    -0.00114492
02a-S22       -67.14382395     -8.91344633     -8.91961526    -0.32472975    -0.25642380     -8.97765060    -0.31738664    -0.00024094
  3-S22      -333.06461941    -44.58241434    -44.66969349    -1.61476168    -1.24206354    -44.94825960    -1.59374385    -0.00474199
03a-S22      -166.55024663    -22.26308040    -22.30881282    -0.80085034    -0.61915236    -22.44587424    -0.79045336    -0.00118413
  4-S22      -295.88286120    -42.08551037    -42.13107414    -1.59444491    -1.20589863    -42.40186081    -1.56340356    -0.00591158
04a-S22      -147.95370853    -21.02205191    -21.04640459    -0.79217996    -0.60096875    -21.18058110    -0.77646418    -0.00168876
  5-S22      -721.49706503   -103.62364850   -103.71767293    -3.94165070    -2.88553789   -104.37828070    -3.87753859    -0.02016009
05a-S22      -360.75857727    -51.79012706    -51.83915676    -1.96557750    -1.44092869    -52.16806561    -1.93329905    -0.00823036
  6-S22      -539.69003628    -83.73812040    -83.70117348    -3.33844158    -2.38306528    -84.25745950    -3.26353436    -0.02095346
06a-S22      -279.15118295    -42.47197744    -42.46976210    -1.66768274    -1.19961930    -42.74797951    -1.63248306    -0.00801770
06b-S22      -260.56075101    -41.23082920    -41.19587093    -1.65976281    -1.17609013    -41.47218618    -1.61938488    -0.00864516
  7-S22      -797.76021952   -118.44820181   -118.49396962    -4.61845905    -3.33837806   -119.25638226    -4.53339056    -0.02794501
07a-S22      -403.88339892    -60.72052731    -60.74375871    -2.37927255    -1.70925692    -61.12697355    -2.33725975    -0.01198783
07b-S22      -393.90152404    -57.69049576    -57.71354862    -2.22805607    -1.62140687    -58.09087219    -2.18419908    -0.01112617
  8-S22       -67.26982335    -13.14390621    -13.06628698    -0.60029914    -0.43409369    -13.18569064    -0.56241568    -0.00277014
08a-S22       -33.63519781     -6.57210281     -6.53305580    -0.29986207    -0.21654884     -6.59277631    -0.28070168    -0.00096015
  9-S22      -132.65625852    -23.44323533    -23.37108706    -0.99018042    -0.71451011    -23.54736613    -0.95056475    -0.00531989
09a-S22       -66.33148372    -11.71914423    -11.68316467    -0.49387666    -0.35610395    -11.77108761    -0.47367299    -0.00159104
 10-S22      -231.16793859    -39.77932422    -39.66626686    -1.67378301    -1.16545651    -39.95938681    -1.61539130    -0.01099117
10a-S22      -197.54162178    -33.20023573    -33.12686540    -1.37133629    -0.94633754    -33.35929165    -1.33157030    -0.00784457
10b-S22       -33.63066021     -6.57676541     -6.53728799    -0.30004309    -0.21638192     -6.59717926    -0.28085118    -0.00096056
 11-S22      -395.07070954    -66.40453866    -66.25755201    -2.74862802    -1.90098600    -66.72671195    -2.66959009    -0.02207369
11a-S22      -197.54042035    -33.20147244    -33.12799557    -1.37134921    -0.94629580    -33.36045894    -1.33158094    -0.00784491
 12-S22      -454.85996397    -70.58862872    -70.57748014    -2.79050519    -2.00769110    -71.03594003    -2.73380433    -0.01807735
12a-S22      -227.43748161    -35.29016473    -35.28499171    -1.39192561    -0.99960074    -35.51169260    -1.36334255    -0.00590021
 13-S22      -721.48819240   -103.61111292   -103.70373150    -3.94045763    -2.89083386   -104.37034665    -3.87625090    -0.02575099
13a-S22      -360.75211184    -51.79796985    -51.84605632    -1.96567938    -1.44036019    -52.17533370    -1.93330770    -0.00823204
 14-S22      -508.49080455    -83.76866232    -83.61996163    -3.44737031    -2.38967609    -84.20094259    -3.35644579    -0.03038627
14a-S22      -310.96320607    -50.56599276    -50.49114164    -2.06726116    -1.43112475    -50.83327593    -2.01555495    -0.01326701
14b-S22      -197.54045454    -33.20147294    -33.12791959    -1.37146606    -0.94624456    -33.36040424    -1.33167753    -0.00784649
 15-S22      -797.74991691   -118.44081308   -118.48111713    -4.62122035    -3.34615545   -119.25358936    -4.53560071    -0.03633209
15a-S22      -403.88334697    -60.72014900    -60.74352435    -2.37909628    -1.70989362    -61.12685397    -2.33703327    -0.01198165
15b-S22      -393.88979885    -57.70434779    -57.72561118    -2.22835135    -1.62043380    -58.10355701    -2.18428795    -0.01112225
 16-S22      -132.20223241    -22.68608998    -22.64239299    -0.92446114    -0.67671116    -22.80083216    -0.89434294    -0.00346080
16a-S22       -66.33062164    -11.72003160    -11.68396230    -0.49390727    -0.35607892    -11.77191719    -0.47369909    -0.00159192
16b-S22       -65.87564272    -10.96141326    -10.95396533    -0.42910621    -0.31986239    -11.02450544    -0.41877898    -0.00079609
 17-S22      -264.68535567    -42.11395526    -42.04701342    -1.69901333    -1.20575336    -42.33887901    -1.65233015    -0.01022678
17a-S22      -197.54369671    -33.19805025    -33.12494921    -1.37119146    -0.94646542    -33.35728743    -1.33145075    -0.00784232
17b-S22       -67.14539229     -8.91153159     -8.91810797    -0.32468729    -0.25671393     -8.97606941    -0.31736090    -0.00023957
 18-S22      -246.10543348    -40.85107068    -40.76487212    -1.68810587    -1.18932311    -41.05454619    -1.63585360    -0.01050839
18a-S22      -197.54200603    -33.19982930    -33.12651293    -1.37130341    -0.94636392    -33.35892173    -1.33154315    -0.00784408
18b-S22       -48.56786112     -7.64742348     -7.63501019    -0.31414363    -0.24035827     -7.69098441    -0.30120813    -0.00049578
 19-S22      -278.41897538    -45.21857534    -45.16513780    -1.81469620    -1.29561506    -45.46873648    -1.76989951    -0.01094468
19a-S22      -197.54419548    -33.19752159    -33.12448940    -1.37115101    -0.94649882    -33.35680531    -1.33141737    -0.00784170
19b-S22       -80.88229728    -12.01073317    -12.03296845    -0.43908819    -0.34689322    -12.10265912    -0.43361341    -0.00042500
 20-S22      -395.07703103    -66.40396886    -66.25652222    -2.74645869    -1.89723556    -66.72296732    -2.66755538    -0.01958368
20a-S22      -197.54275666    -33.19904095    -33.12581800    -1.37125676    -0.94640756    -33.35819608    -1.33150464    -0.00784334
20b-S22      -197.54469346    -33.19697588    -33.12403619    -1.37107773    -0.94654756    -33.35632316    -1.33135693    -0.00784064
 21-S22      -508.50022587    -83.76936826    -83.62028739    -3.44435007    -2.38408765    -84.19722341    -3.35354869    -0.02645968
21a-S22      -310.96682200    -50.56211089    -50.48773120    -2.06709641    -1.43135050    -50.82968790    -2.01544388    -0.01326207
21b-S22      -197.54322418    -33.19854957    -33.12538511    -1.37122733    -0.94643493    -33.35774396    -1.33148036    -0.00784288
 22-S22      -528.38699021    -82.85965487    -82.76762077    -3.31892555    -2.34088219    -83.33300047    -3.23859786    -0.02234919
22a-S22      -264.20072502    -41.42169093    -41.37657206    -1.65623664    -1.16773994    -41.65803180    -1.61566560    -0.00891842
22b-S22      -264.20072502    -41.42169093    -41.37657206    -1.65623664    -1.16773994    -41.65803180    -1.61566560    -0.00891842
#DC9                     E[noXC]     X Energy HF    X Energy DFT   C Energy GGA   C Energy osRPA   X Energy SCAN     C Energy SCAN  vdW_MBD
       13dip-DC9      -195.19050726    -30.78987672    -30.76447830    -1.25335324    -0.91110351    -30.97365609    -1.21700292   -0.00623031
         be4-DC9       -47.49297721    -10.84063012    -10.80410538    -0.41808393    -0.25669574    -10.88813831    -0.41129522   -0.00219705
          be-DC9       -11.90916606     -2.66090698     -2.63478636    -0.08560802    -0.05290639     -2.65640384    -0.08354853    0.00000000
     c20bowl-DC9      -653.53975794   -103.16929272   -103.33497851    -4.05700481    -2.92896527   -103.92427818    -4.02340703   -0.03199710
     c20cage-DC9      -653.27513074   -103.33617903   -103.46622862    -4.17699391    -2.98818795   -104.07298970    -4.12853368   -0.04290022
   carbooxo1-DC9      -494.30642116    -70.87832249    -71.06866724    -2.60114531    -1.96458996    -71.46945597    -2.58686025   -0.01104000
   carbooxo2-DC9      -494.13094407    -71.01985811    -71.18195717    -2.65148113    -1.94939904    -71.56789772    -2.64143910   -0.01101300
       ch2n2-DC9      -128.92027766    -18.95642911    -19.00998762    -0.71637675    -0.55880050    -19.11855425    -0.70629476   -0.00132807
       ethen-DC9       -66.32414293    -11.72698138    -11.69003480    -0.49426944    -0.35550414    -11.77829909    -0.47397838   -0.00159193
heptahexaene-DC9      -229.75962359    -37.45763145    -37.50375133    -1.47687221    -1.07730299    -37.73028350    -1.45253378   -0.00555293
 heptatriyne-DC9      -229.75666750    -37.50185656    -37.50962403    -1.47594029    -1.06229020    -37.74155610    -1.44944442   -0.00558829
     ISO_E35-DC9      -394.74200682    -66.65280300    -66.41835570    -2.86611756    -1.91883365    -66.90986681    -2.76901922   -0.03083911
     ISO_E36-DC9      -279.14902733    -42.48406463    -42.46982794    -1.66848880    -1.19235335    -42.74950520    -1.63316634   -0.00785472
     ISO_P35-DC9      -394.96671915    -66.40912142    -66.26037847    -2.77135796    -1.91867345    -66.73028901    -2.69016331   -0.02331868
     ISO_P36-DC9      -279.14727772    -42.47876988    -42.47491781    -1.66743094    -1.19840504    -42.75361486    -1.63210253   -0.00801488
        omcb-DC9      -397.74296608    -70.67393841    -70.36002442    -3.13916550    -2.17708720    -70.94474909    -2.99852100   -0.04344756
          s2-DC9      -745.09721875    -49.97521198    -49.76986400    -1.22104463    -0.32861228    -50.17235347    -1.21373932   -0.00029256
          s8-DC9     -2980.26854993   -200.02120272   -199.23241099    -5.01299335    -1.48337894   -200.84218975    -4.97714261   -0.00932130
     tmethen-DC9      -198.92477144    -35.28959291    -35.15260413    -1.54162997    -1.07662769    -35.43202119    -1.47506026   -0.01226315
#G2RC       E[noXC]       X Energy HF    X Energy DFT   C Energy GGA       C Energy osRPA   X Energy SCAN     C Energy SCAN  vdW_MBD
 100-G2RC    -114.00450510    -17.94954670    -17.94017877    -0.70149359    -0.51829963    -18.05856051    -0.68402709      -0.00188259
 104-G2RC    -166.53877217    -22.27839281    -22.32143394    -0.80116213    -0.61759795    -22.45941942    -0.79048246      -0.00119511
 106-G2RC    -181.08658717    -26.94298005    -26.93502509    -1.05431810    -0.77620734    -27.11985370    -1.02614435      -0.00380903
 113-G2RC    -133.01074706    -19.94182485    -19.93274382    -0.77588780    -0.57517918    -20.07006294    -0.75397321      -0.00235680
 117-G2RC    -438.83000147    -36.75742795    -36.60583225    -1.13419058    -0.53738843    -36.89857351    -1.10713531      -0.00278033
 118-G2RC    -505.93697518    -45.67883949    -45.55370360    -1.46864442    -0.80955765    -45.91088088    -1.43253227      -0.00501091
  11-G2RC     -48.56995545     -7.64549768     -7.63314538    -0.31402476    -0.24026303     -7.68902005    -0.30112537      -0.00049795
 121-G2RC    -155.52709564    -21.40679250    -21.40095877    -0.78559296    -0.57892095    -21.54774824    -0.76797484      -0.00168558
 126-G2RC    -199.68488432    -28.18640902    -28.19991551    -1.06259503    -0.79382699    -28.38773788    -1.03968111      -0.00309364
 128-G2RC    -564.79099478    -47.09640821    -46.97758429    -1.42081051    -0.76464406    -47.33784004    -1.39480962      -0.00299489
  13-G2RC     -67.14795049     -8.90894091     -8.91580808    -0.32455262    -0.25677746     -8.97362351    -0.31728123      -0.00024023
  14-G2RC     -89.68470581    -10.37490629    -10.38288082    -0.33486387    -0.26083748    -10.44946306    -0.33134763      -0.00007877
  18-G2RC    -269.53941614    -21.70797027    -21.57938836    -0.61510141    -0.18813599    -21.77797596    -0.59150354      -0.00119657
   1-G2RC      -0.47659892     -0.65614952     -0.64721842    -0.04289164    -0.04367755     -0.65954922    -0.03562281      -0.00008185
  21-G2RC    -373.02678231    -25.67751836    -25.55003080    -0.66602914    -0.21595370    -25.76818846    -0.65113269      -0.00034057
  22-G2RC    -432.24568159    -27.85377278    -27.71234678    -0.68615288    -0.21936996    -27.94892096    -0.67314477      -0.00011259
  23-G2RC     -11.32401309     -3.54199436     -3.50779090    -0.12357079    -0.04250870     -3.54470428    -0.11851503      -0.00323959
  24-G2RC     -95.06858672    -11.90761934    -11.91543072    -0.37556696    -0.26597049    -11.99562606    -0.37530094      -0.00024575
  25-G2RC     -65.86209463    -10.97641120    -10.96675708    -0.42963749    -0.31833205    -11.03806809    -0.41911464      -0.00079896
  26-G2RC     -66.32414293    -11.72698138    -11.69003480    -0.49426944    -0.35550414    -11.77829909    -0.47397838      -0.00159193
  30-G2RC     -99.47590118    -13.29356422    -13.31755324    -0.44854273    -0.35196501    -13.39506521    -0.44694013      -0.00015138
  32-G2RC     -99.85755883    -14.04117124    -14.05654426    -0.51471464    -0.39779997    -14.14589036    -0.50438946      -0.00067777
  33-G2RC    -100.28347126    -14.79515964    -14.77860502    -0.58047856    -0.43426392    -14.88612548    -0.56063374      -0.00151946
  34-G2RC     -95.86943029    -13.10526636    -13.13769199    -0.45190914    -0.36141019    -13.21073972    -0.44969828      -0.00015628
  39-G2RC    -178.86488650    -19.88074588    -19.95767963    -0.61308292    -0.50923990    -20.07400171    -0.61332367      -0.00008171
  40-G2RC    -166.12279183    -21.55972950    -21.62969565    -0.73931067    -0.57879110    -21.75229871    -0.73674521      -0.00050266
  45-G2RC    -863.98725526    -54.98970608    -54.74129466    -1.32432257    -0.40880313    -55.19266345    -1.31033282      -0.00026697
  47-G2RC    -335.34635600    -28.47618935    -28.43981133    -0.77617661    -0.34371678    -28.64117428    -0.77747780      -0.00019076
  51-G2RC    -521.41611945    -37.46861218    -37.37961504    -0.96946205    -0.45622337    -37.66387834    -0.96299084      -0.00013904
  52-G2RC    -538.60459757    -42.73916490    -42.49912246    -1.19365154    -0.33920381    -42.88186916    -1.15428976      -0.00321345
  56-G2RC    -505.88739866    -41.37649429    -41.37219506    -1.16958733    -0.65021533    -41.66232547    -1.16647700      -0.00056480
  57-G2RC    -289.19170819    -34.11471467    -34.12612388    -1.08969044    -0.80280113    -34.35581031    -1.08346839      -0.00100514
  58-G2RC   -1316.83811882    -86.49774252    -86.07701919    -2.15518854    -0.69294454    -86.80692248    -2.12222875      -0.00205607
  59-G2RC    -492.16075682    -48.42367708    -48.38116679    -1.40392877    -0.79544526    -48.72891051    -1.39887444      -0.00111197
  60-G2RC   -1519.84930959   -100.83260356   -100.32907627    -2.46976679    -0.66502638   -101.18672314    -2.43407972      -0.00247046
  61-G2RC    -390.45035100    -45.33366006    -45.38628467    -1.46845633    -1.09817213    -45.68286035    -1.45944477      -0.00141445
  62-G2RC   -1760.66915999   -115.19043669   -114.68042178    -2.87825652    -0.96311056   -115.62856299    -2.84273149      -0.00334712
  66-G2RC    -626.40675128    -60.72780813    -60.66402770    -1.78042147    -1.06253523    -61.10725966    -1.76938481      -0.00191746
  67-G2RC   -1996.62620905   -130.56638208   -129.91751655    -3.20383961    -0.90741387   -131.02806499    -3.15596354      -0.00412848
  68-G2RC    -162.46165788    -21.26260397    -21.37786032    -0.74192278    -0.61037102    -21.48421856    -0.74168480      -0.00045964
   6-G2RC     -33.11877325     -5.76850114     -5.74141565    -0.22338184    -0.17297962     -5.78890757    -0.21110682      -0.00029027
  73-G2RC    -245.54867681    -27.98166971    -28.12650296    -0.88853900    -0.74896589    -28.28227285    -0.89069721      -0.00030761
  82-G2RC     -99.41618512    -17.66642939    -17.59372680    -0.77040449    -0.53226970    -17.73032238    -0.73736205      -0.00382198
  88-G2RC    -132.11302065    -22.81202141    -22.74384823    -0.97059774    -0.67669151    -22.91116274    -0.93467080      -0.00508198
   8-G2RC     -33.63509223     -6.57221191     -6.53315477    -0.29986631    -0.21654490     -6.59287929    -0.28070519      -0.00096016
  94-G2RC    -197.53464955    -33.20753751    -33.13325618    -1.37184515    -0.94590241    -33.36598005    -1.33199082      -0.00785243
  97-G2RC    -897.15013688    -60.89946847    -60.61748040    -1.58647439    -0.58322375    -61.12278072    -1.55826756      -0.00185485
#SIE11             E[noXC]       X Energy HF    X Energy DFT   C Energy GGA    C Energy osRPA  X Energy SCAN   C Energy SCAN   vdW_MBD
 aceton+-SIE11   -166.15016706    -25.52953796    -25.50822843    -1.00125172    -0.70478700    -25.69658381    -0.96770920    -0.00439802
  acetyl-SIE11   -132.81760947    -19.27503512    -19.28717403    -0.71381114    -0.53557963    -19.41549194    -0.69557353    -0.00173103
    but+-SIE11   -133.03371325    -23.92548951    -23.83845978    -1.04556730    -0.69621280    -24.04050849    -0.99303449    -0.00776383
      bz-SIE11   -197.54794465    -33.19358953    -33.12099952    -1.37095554    -0.94670060    -33.35316886    -1.33125612    -0.00783854
   bz_li-SIE11   -203.08076133    -35.06529628    -34.97467761    -1.45521905    -0.94079829    -35.22842203    -1.41585185    -0.01715339
    c2h4-SIE11    -66.32743781    -11.72338904    -11.68694829    -0.49404469    -0.35589612    -11.77503562    -0.47380865    -0.00159315
 c2h4_f2-SIE11   -245.19503456    -31.58987504    -31.64574729    -1.10737895    -0.87098561    -31.84892610    -1.08833892    -0.00231251
     ch3-SIE11    -33.36345653     -6.20933784     -6.17033067    -0.25880680    -0.17041807     -6.22822216    -0.24569372    -0.00060374
   clclf-SIE11   -953.40913192    -64.93238282    -64.71828689    -1.61441790    -0.62871853    -65.23191877    -1.60251915    -0.00073158
   clfcl-SIE11   -953.43350708    -64.84676495    -64.71419517    -1.63025553    -0.64645866    -65.21444909    -1.62198983    -0.00056251
     clf-SIE11   -521.40948956    -37.47652881    -37.38550449    -0.97019320    -0.45504752    -37.67021427    -0.96355250    -0.00013889
   ethyl-SIE11    -66.50894101    -12.10509732    -12.04342194    -0.52029118    -0.34679796    -12.14694494    -0.49595921    -0.00211270
  ethyl+-SIE11    -66.51427388    -11.81573122    -11.76370337    -0.49866476    -0.34900382    -11.86342030    -0.47097362    -0.00205871
      f2-SIE11   -178.86930863    -19.87509257    -19.95382664    -0.61259458    -0.51054803    -20.06988927    -0.61292763    -0.00008167
   h2o2+-SIE11   -134.25672054    -17.47405318    -17.52379565    -0.62161795    -0.47704433    -17.63817565    -0.60800691    -0.00125492
     h2o-SIE11    -67.14531421     -8.91173876     -8.91822961    -0.32467956    -0.25663124     -8.97619294    -0.31735586    -0.00024010
    h2o+-SIE11    -67.05145091     -8.60418299     -8.58792315    -0.28383770    -0.20088506     -8.65448445    -0.27612961    -0.00022187
    he2+-SIE11     -3.34835189     -1.57808880     -1.60041398    -0.05906681    -0.05733478     -1.61567210    -0.05818180    -0.00002914
      he-SIE11     -1.84677136     -1.01337027     -1.00509969    -0.04106371    -0.04347607     -1.02022781    -0.03770439     0.00000000
     he+-SIE11     -1.37992061     -0.61918246     -0.60754425    -0.00608040     0.00000000     -0.61989334     0.00000000     0.00000000
      li-SIE11     -5.65798850     -1.77224410     -1.75253153    -0.05103457     0.00000000     -1.77517123    -0.04600936     0.00000000
   li_f2-SIE11   -184.52552302    -21.78717271    -21.89741844    -0.67116844    -0.49310938    -22.03094867    -0.67332842    -0.00064267
     mgo-SIE11   -250.24317701    -24.11443537    -24.15426624    -0.68128393    -0.32534017    -24.31015175    -0.68733533    -0.00022994
      na-SIE11   -147.87798661    -13.97058000    -13.92511209    -0.36887943     0.00000000    -14.03333210    -0.36555158     0.00000000
   naomg-SIE11   -398.10694906    -38.23598883    -38.18487976    -1.06669542    -0.28758569    -38.46482217    -1.06577551    -0.00284717
   nh32+-SIE11   -97.10905627     -15.03028343    -15.02121284    -0.60339485    -0.43906303    -15.13312498    -0.57864152    -0.00214833
 nh3_clf-SIE11   -569.97557690    -45.11936275    -45.03892447    -1.29457802    -0.70894697    -45.37917162    -1.27604477    -0.00148161
     nh3-SIE11    -48.56702347     -7.64853766     -7.63586277    -0.31415439    -0.24014946     -7.69187095    -0.30121552    -0.00049753
    nh3+-SIE11    -48.50251928     -7.39719183     -7.36375931    -0.27545400    -0.18426606     -7.42947635    -0.26174753    -0.00050339
