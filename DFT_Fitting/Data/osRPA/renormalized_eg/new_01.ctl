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

__initial guess__ ::
0.7, 0.2, 0.7, 0.4

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

__optimization function__ :: 26
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a1, a3, a4, a5 = C
    #a1 = 0.8
    #a3 = 0.0
    a2 = 1. - a1
    #a5 = a4/2.0

    E_noXC, Ex_HF, Ex_PBE, Ec_PBE, rsspt2, rospt2, Ex_SCAN, Ec_SCAN = P
    #return E_noXC + a1*Ex_HF + a2*Ex_SCAN + a3*Ec_SCAN + a4*rospt2 + a5*rsspt2
    return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2 + a5*rsspt2
    #return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2 + \
    #           a5*(Ex_SCAN-Ex_PBE) + a6*(Ec_SCAN-Ec_PBE)

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
__batch__ :: 316
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
   TiCl-BE13      <PATH2>/G2                   XYG3_Comp      energy
    VF5-BE13      <PATH2>/G2                   XYG3_Comp      energy
   CrCl-BE13      <PATH2>/G2                   XYG3_Comp      energy
   CrOF-BE13      <PATH2>/G2                   XYG3_Comp      energy
CoC4O4H-BE13      <PATH2>/G2                   XYG3_Comp      energy
 FeC5O5-BE13      <PATH2>/G2                   XYG3_Comp      energy
     VS-BE13      <PATH2>/G2                   XYG3_Comp      energy
    CuH-BE13      <PATH2>/G2                   XYG3_Comp      energy
   CuCl-BE13      <PATH2>/G2                   XYG3_Comp      energy
     VO-BE13      <PATH2>/G2                   XYG3_Comp      energy
   NiCl-BE13      <PATH2>/G2                   XYG3_Comp      energy
  CO_di-BE13      <PATH2>/G2                   XYG3_Comp      energy
     Ti-BE13      <PATH2>/G2                   XYG3_Comp      energy
     Cl-BE13      <PATH2>/G2                   XYG3_Comp      energy
      V-BE13      <PATH2>/G2                   XYG3_Comp      energy
      F-BE13      <PATH2>/G2                   XYG3_Comp      energy
      O-BE13      <PATH2>/G2                   XYG3_Comp      energy
     Fe-BE13      <PATH2>/G2                   XYG3_Comp      energy
     Co-BE13      <PATH2>/G2                   XYG3_Comp      energy
      H-BE13      <PATH2>/G2                   XYG3_Comp      energy
     Ni-BE13      <PATH2>/G2                   XYG3_Comp      energy
     Cu-BE13      <PATH2>/G2                   XYG3_Comp      energy
     Cr-BE13      <PATH2>/G2                   XYG3_Comp      energy
      S-BE13      <PATH2>/G2                   XYG3_Comp      energy
      C-BE13      <PATH2>/G2                   XYG3_Comp      energy
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
    
# Training set for the atomization energy
#             304  = 223+3+13+22+9+25+11 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 262 1.0 #304 239
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
 2  Cr2-BE3     -1    Cr-BE3    2                         0.057370000   30.0
 2  V2-BE3      -1    V-BE3     2                         0.102309000   30.0
 2  Fe2-BE3     -1    Fe-BE3    2                         0.042262000   30.0
# TM-BE13
 3 TiCl-BE13    -1 Ti-BE13   1 Cl-BE13    1                   0.16060302   100.0000
 3 VF5-BE13     -1 V-BE13    1 F-BE13     5                   0.89902950   10.0000
 3 CrCl-BE13    -1 Cr-BE13   1 Cl-BE13    1                   0.14366305   10.0000
 4 CrOF-BE13    -1 Cr-BE13   1 O-BE13     1 F-BE13 1          0.39454351   10.0000
 5 CoC4O4H-BE13 -1 Co-BE13   1 C-BE13     4 O-BE13 4 H-BE13 1 1.96033529   10.0000
 3 FeC5O5-BE13  -1 Fe-BE13   1 CO_di-BE13 5                   0.23489666   10.0000
 3 VS-BE13      -1 V-BE13    1 S-BE13     1                   0.17035585   10.0000
 3 CuH-BE13     -1 Cu-BE13   1 H-BE13     1                   0.09975937   10.0000
 3 CuCl-BE13    -1 Cu-BE13   1 Cl-BE13    1                   0.13975873   10.0000
 3 VO-BE13      -1 V-BE13    1 O-BE13     1                   0.24063362   10.0000
 3 NiCl-BE13    -1 Ni-BE13   1 Cl-BE13    1                   0.14023681   10.0000 
# G2RC
 3   118-G2RC   -1   117-G2RC   1    13-G2RC    1                    -0.00152986    100.0000
 3    40-G2RC   -1     1-G2RC  -1   104-G2RC    1                    -0.00323501    100.0000
 3   113-G2RC   -1    30-G2RC   1     8-G2RC    1                    -0.00406368    100.0000
 3    52-G2RC   -1     1-G2RC  -1    18-G2RC    2                    -0.00618317    100.0000
 4    30-G2RC   -1    13-G2RC  -1    40-G2RC    1     1-G2RC    1    -0.01117114    100.0000
 4   128-G2RC   -1    13-G2RC  -1   126-G2RC    1    22-G2RC    1    -0.01587226    100.0000
 3   100-G2RC   -1    13-G2RC  -1   106-G2RC    1                    -0.03207917    100.0000
 3    25-G2RC   -1    14-G2RC  -1   121-G2RC    1                    -0.04042963    100.0000
 3    39-G2RC   -1    45-G2RC  -1    51-G2RC    2                    -0.04210291    100.0000
 4    58-G2RC   -1    59-G2RC  -1    57-G2RC    1    60-G2RC    1    -0.04278816    100.0000
 4    67-G2RC   -1    61-G2RC  -1    66-G2RC    1    62-G2RC    1    -0.04195949    100.0000
 3    32-G2RC   -1     1-G2RC  -1    33-G2RC    1                    -0.04658093    100.0000
 3    25-G2RC   -1    26-G2RC  -1    88-G2RC    1                    -0.05215853    100.0000
 4    47-G2RC   -1     1-G2RC  -3    18-G2RC    1    13-G2RC    1    -0.05403898    100.0000
 3    34-G2RC   -1     1-G2RC  -3    11-G2RC    2                    -0.06194324    100.0000
 4     8-G2RC   -1    45-G2RC  -2    97-G2RC    1    22-G2RC    2    -0.07502669    100.0000
 3    25-G2RC   -1     1-G2RC  -1    26-G2RC    1                    -0.07716212    100.0000
 4    56-G2RC   -1     1-G2RC  -3    21-G2RC    1    13-G2RC    2    -0.09636500    100.0000
 4    30-G2RC   -1     1-G2RC  -3    13-G2RC    1     8-G2RC    1    -0.10323341    100.0000
 4    73-G2RC   -1     1-G2RC  -1    39-G2RC    1    13-G2RC    1    -0.10951220    100.0000
 4    68-G2RC   -1     1-G2RC  -1    34-G2RC    1    13-G2RC    1    -0.12866727    100.0000
 3    26-G2RC   -1     6-G2RC  -1    82-G2RC    1                    -0.17379803    100.0000
 3     1-G2RC   -1    39-G2RC  -1    14-G2RC    2                    -0.21400456    100.0000
 2    25-G2RC   -3    94-G2RC   1                                    -0.24154197    100.0000
 3    23-G2RC   -1    39-G2RC  -1    24-G2RC    2                    -0.33895874    100.0000

__xyg3 components__ :: 316 #426 275
#G2             E[noXC]         X Energy HF    X Energy DFT   C Energy GGA     C ssRPA       C osRPA      X_Energy_SCAN  C_Energy_SCAN
# 15+223
     H_0      -0.19102678     -0.30867667     -0.30309140    -0.00579958    -0.01808036      0.00000000    -0.30911815    -0.00000000
    Li_0      -5.65538219     -1.77579326     -1.75477446    -0.05123606    -0.01951088      0.00000000    -1.77816817    -0.04587353
    Be_0     -11.90704819     -2.66416263     -2.63652410    -0.08579969    -0.02953001     -0.04260229    -2.65906039    -0.08341814
     B_0     -20.77185642     -3.75858145     -3.72691196    -0.11288086    -0.05538763     -0.05725337    -3.75458329    -0.11438989
     C_0     -32.63223571     -5.05796875     -5.02170416    -0.14423989    -0.08456124     -0.07148099    -5.06099413    -0.14604970
     N_0     -47.81790091     -6.58323013     -6.53795671    -0.17930767    -0.11505054     -0.08343645    -6.59108770    -0.18036112
     O_0     -66.62631316     -8.18835780     -8.15397074    -0.23393653    -0.13825575     -0.13447010    -8.21288202    -0.23474328
     F_0     -89.40283870    -10.00836417     -9.98190072    -0.29046823    -0.16349983     -0.18542946   -10.05549740    -0.28980676
    Na_0    -147.86510396    -13.98826982    -13.93619259    -0.36986209    -0.01625748      0.00000000   -14.04724926    -0.36531628
    Mg_0    -183.63915431    -15.97028273    -15.90503159    -0.41003754    -0.02474455     -0.03443460   -16.02482332    -0.41049303
    Al_0    -223.80948407    -18.06530875    -17.98064744    -0.44504753    -0.04562762     -0.04750385   -18.11870314    -0.44647045
    Si_0    -268.57225171    -20.28014741    -20.17635223    -0.48407856    -0.06870338     -0.06297162   -20.33675175    -0.48410646
     P_0    -318.09252950    -22.62119100    -22.49638593    -0.52578579    -0.09050265     -0.07811714   -22.68277712    -0.52325673
     S_0    -372.49928988    -25.00711315    -24.86854650    -0.58384998    -0.11193544     -0.11791723   -25.07776007    -0.57924820
    Cl_0    -431.96578184    -27.51698097    -27.36389744    -0.64392504    -0.13336097     -0.15831702   -27.59888280    -0.63588762
    G2-1      -5.85157986     -2.13422034     -2.11117367    -0.08408570    -0.02879317     -0.03641906    -2.13882486    -0.07802834
    G2-2     -12.07828706     -3.07206359     -3.03589099    -0.10335959    -0.05111093     -0.04226923    -3.07117557    -0.09634669
    G2-3     -32.87330059     -5.40661566     -5.37485246    -0.18471693    -0.09958129     -0.11268558    -5.41805538    -0.17884592
    G2-4     -33.08430879     -5.85176211     -5.80886260    -0.21498112    -0.12142769     -0.11546886    -5.86335963    -0.20607249
    G2-5     -33.11653424     -5.77465326     -5.74229934    -0.22411608    -0.11558836     -0.15053757    -5.79205682    -0.21082932
    G2-6     -33.36509371     -6.21137118     -6.16746201    -0.25953555    -0.13628367     -0.15835381    -6.22756664    -0.24545908
    G2-7     -33.63434741     -6.57734019     -6.53218826    -0.30084998    -0.15439728     -0.19643936    -6.59448457    -0.28049143
    G2-8     -48.06626059     -6.91498893     -6.88438020    -0.22537030    -0.13175422     -0.13108046    -6.93768500    -0.22148187
    G2-9     -48.31669561     -7.27024960     -7.24804968    -0.27087167    -0.14875515     -0.17716028    -7.30565943    -0.26215423
   G2-10     -48.56628965     -7.65384287     -7.63458564    -0.31532983    -0.16748337     -0.21866284    -7.69307274    -0.30125911
   G2-11     -66.88429852     -8.53836248     -8.52465514    -0.28029764    -0.15799804     -0.18676302    -8.58601740    -0.27666376
   G2-12     -67.14005282     -8.92207571     -8.92131474    -0.32600183    -0.17837156     -0.23512967    -8.98199503    -0.31750222
   G2-13     -89.67145465    -10.39377564    -10.39366472    -0.33632917    -0.18549948     -0.24101972   -10.46329809    -0.33158320
   G2-14    -269.05589472    -20.97003566    -20.85795609    -0.55458056    -0.09990896     -0.13038310   -21.03418056    -0.54188867
   G2-15    -269.00989081    -21.00833769    -20.88820449    -0.54443124    -0.10600793     -0.10076776   -21.07222218    -0.53242641
   G2-16    -269.27006608    -21.36564833    -21.23598597    -0.58121425    -0.11943264     -0.13500028   -21.42891952    -0.56274940
   G2-17    -269.52554898    -21.73125445    -21.59081631    -0.61607230    -0.13369759     -0.16701952   -21.79414055    -0.59034139
   G2-18    -318.59160174    -23.29165666    -23.16334931    -0.60564863    -0.12501970     -0.14836475   -23.36402002    -0.59273638
   G2-19    -318.84343936    -23.64046823    -23.50841493    -0.64368384    -0.14174656     -0.18304536   -23.71693747    -0.62386394
   G2-20    -373.01932320    -25.69179347    -25.55531052    -0.66709110    -0.14739262     -0.19289085   -25.77717011    -0.65066726
   G2-21    -432.23689224    -27.86845622    -27.71909278    -0.68720328    -0.15118718     -0.19752290   -27.95918208    -0.67282608
   G2-22     -11.31692248     -3.55146248     -3.51373679    -0.12427375    -0.02389008     -0.03539286    -3.55285932    -0.11833780
   G2-23     -95.04750734    -11.93760022    -11.93297892    -0.37750026    -0.18368476     -0.24402937   -12.01787553    -0.37548426
   G2-24     -65.86561240    -10.98058837    -10.96107647    -0.43062638    -0.20721625     -0.28521126   -11.03585933    -0.41866977
   G2-25     -66.32792161    -11.73185371    -11.68385339    -0.49535426    -0.24284166     -0.32041503   -11.77631344    -0.47325578
   G2-26     -66.77508319    -12.48045903    -12.40228634    -0.56105558    -0.27829209     -0.35763854   -12.51439999    -0.52784664
   G2-27     -80.59427588    -11.62053733    -11.65217935    -0.40043456    -0.20972656     -0.28710872   -11.71895391    -0.40026329
   G2-28     -80.86193150    -12.04372560    -12.04989598    -0.44112963    -0.21981598     -0.30788847   -12.12462037    -0.43387607
   G2-29     -99.47276094    -13.30637677    -13.31810817    -0.44962659    -0.22862249     -0.31658434   -13.39973194    -0.44648536
   G2-30     -99.62345391    -13.66655013    -13.67959740    -0.47908990    -0.25262130     -0.32944635   -13.76619098    -0.47376688
   G2-31     -99.85321792    -14.05692207    -14.05766865    -0.51615578    -0.26636328     -0.35962857   -14.15218224    -0.50376441
   G2-32    -100.27627795    -14.81322886    -14.78210620    -0.58239593    -0.30182647     -0.39542899   -14.89500115    -0.56021469
   G2-33     -95.87654179    -13.10626068    -13.12856530    -0.45282501    -0.23094981     -0.32579308   -13.20478145    -0.44936076
   G2-34     -96.62028027    -14.60536912    -14.58445756    -0.58741060    -0.30465260     -0.40218941   -14.68697320    -0.56713459
   G2-35    -114.59315129    -14.70204352    -14.73826686    -0.49148493    -0.26483781     -0.35082528   -14.81986511    -0.49155174
   G2-36    -133.36364716    -16.31189320    -16.36275999    -0.53022233    -0.30889931     -0.36735329   -16.45448456    -0.53214468
   G2-37    -133.78996643    -17.04863700    -17.08720956    -0.60043303    -0.32834169     -0.44369317   -17.19183505    -0.59177915
   G2-38    -178.85387891    -19.90424667    -19.96499466    -0.61465965    -0.34428176     -0.46468962   -20.08616247    -0.61303335
   G2-39    -166.11554498    -21.58701351    -21.63193343    -0.74123160    -0.37889266     -0.52330950   -21.76293848    -0.73548855
   G2-40    -295.74001604    -27.96486715    -27.87191402    -0.75861693    -0.02190028     -0.03254117   -28.08321953    -0.75441049
   G2-41    -537.19859802    -40.56846317    -40.38658322    -1.00945479    -0.15104467     -0.16530066   -40.70472146    -1.00674432
   G2-42    -636.30863225    -45.17391559    -44.98583148    -1.12783582    -0.18431601     -0.26918240   -45.34636411    -1.12030851
   G2-43    -745.08475626    -50.00245053    -49.77892669    -1.22209032    -0.24040873     -0.29683557   -50.18805924    -1.21263784
   G2-44    -863.97363000    -55.01679869    -54.75128225    -1.32544769    -0.27284760     -0.36571589   -55.20929777    -1.30895702
   G2-45    -579.82242849    -41.62628955    -41.42366392    -1.04914376    -0.14602925     -0.19298550   -41.77728370    -1.03279450
   G2-46    -335.32971484    -28.50755476    -28.45251801    -0.77781742    -0.21475439     -0.30521968   -28.65979329    -0.77685826
   G2-47    -405.28217779    -30.06386527    -29.95909460    -0.79356034    -0.20168476     -0.28742649   -30.19419246    -0.78569025
   G2-48    -439.21322135    -33.18506002    -33.10225599    -0.87423339    -0.27232315     -0.33777184   -33.35441958    -0.87110672
   G2-49    -498.64202160    -35.64876102    -35.54780711    -0.92497076    -0.28762140     -0.37233859   -35.82240183    -0.91906759
   G2-50    -521.40694954    -37.49050822    -37.38546062    -0.97009833    -0.30850354     -0.41397242   -37.67544581    -0.96145942
   G2-51    -538.57949630    -42.78262903    -42.51975951    -1.19530578    -0.23688517     -0.30025894   -42.91146526    -1.15190583
   G2-52    -465.38027519    -33.76277190    -33.58436092    -0.94413866    -0.27431821     -0.35872230   -33.87389469    -0.91745341
   G2-53    -406.15941199    -31.59241165    -31.42601831    -0.92626071    -0.27097436     -0.35471949   -31.69669451    -0.89762314
   G2-54    -498.88156503    -36.03431264    -35.92233282    -0.96277158    -0.30095049     -0.40624642   -36.20345348    -0.95050012
   G2-55    -505.88111302    -41.40672057    -41.37303604    -1.17118897    -0.41467454     -0.58446719   -41.67193031    -1.16469232
   G2-56    -289.15532405    -34.17681419    -34.15580471    -1.09242754    -0.56532785     -0.73891866   -34.39647825    -1.08212857
   G2-57   -1316.80799956    -86.55385604    -86.10080327    -2.15752287    -0.46671408     -0.62107302   -86.84375686    -2.11947483
   G2-58    -492.11947647    -48.49162919    -48.41458122    -1.40690915    -0.55482279     -0.73174318   -48.77410676    -1.39726134
   G2-59   -1519.79910981   -100.91022466   -100.37134456    -2.47355862    -0.45021333     -0.59614106  -101.24429259    -2.43203616
   G2-60    -390.41624490    -45.40325342    -45.41158726    -1.47182315    -0.77030756     -1.01037717   -45.72223487    -1.45721716
   G2-61   -1760.63927728   -115.25597124   -114.70164970    -2.88132853    -0.64079454     -0.86302535  -115.66676013    -2.83921098
   G2-62    -471.97591326    -38.35612569    -38.27582465    -1.08429239    -0.35018111     -0.48768085   -38.56247036    -1.07358310
   G2-63    -777.82004444    -55.13699721    -54.93226275    -1.42883767    -0.32218645     -0.45490459   -55.37461773    -1.41322006
   G2-64    -278.25429510    -33.48205822    -33.51546918    -1.10578037    -0.57539695     -0.76873418   -33.73384698    -1.09644429
   G2-65    -626.36582926    -60.80273964    -60.69669142    -1.78290395    -0.74614732     -0.97910462   -61.15430136    -1.76648207
   G2-66   -1996.57325085   -130.65584838   -129.96118234    -3.20773566    -0.61197304     -0.81379511  -131.09070373    -3.15251995
   G2-67    -162.46915040    -21.27410405    -21.36578362    -0.74364121    -0.38702180     -0.55002908   -21.47849750    -0.74094059
   G2-68    -546.62255928    -42.13253149    -42.09242769    -1.16392694    -0.40743240     -0.57512447   -42.39968616    -1.15477125
   G2-69    -316.16997397    -36.50328090    -36.59929218    -1.18000765    -0.63914268     -0.86019730   -36.82306429    -1.17545668
   G2-70    -586.46550503    -52.83524613    -52.75679159    -1.51477321    -0.60438244     -0.80106692   -53.14609369    -1.50392172
   G2-71    -200.02553275    -24.31675180    -24.49224609    -0.81770601    -0.45422284     -0.66506537   -24.61101592    -0.82015641
   G2-72    -245.53007797    -28.02846128    -28.13809814    -0.89129102    -0.49575034     -0.67652228   -28.30246861    -0.89019678
   G2-73    -700.22855207    -57.41514521    -57.42353448    -1.60759688    -0.66699365     -0.90971374   -57.82802817    -1.60250873
   G2-74    -423.06876793    -50.53586376    -50.56440112    -1.66681193    -0.86251021     -1.14222477   -50.89932384    -1.65170056
   G2-75   -1793.30532451   -120.45506268   -119.89753975    -3.08430419    -0.73088371     -0.98824921  -120.89393677    -3.03969678
   G2-76    -381.59476542    -47.04162332    -47.06832526    -1.57761263    -0.80736084     -1.08452496   -47.37767552    -1.56223048
   G2-77     -99.00955019    -16.89251431    -16.84095165    -0.69278812    -0.33114354     -0.44541000   -16.96498571    -0.66824854
   G2-78     -99.01723915    -16.88090384    -16.83773568    -0.69301556    -0.33267222     -0.44596120   -16.95962100    -0.66943020
   G2-79     -98.95183084    -16.90762052    -16.85493351    -0.70589947    -0.33478846     -0.44832355   -16.97379596    -0.68248980
   G2-80     -99.47416876    -17.63524747    -17.55539366    -0.75711800    -0.36716940     -0.48225905   -17.69800678    -0.72227881
   G2-81     -99.42035536    -17.67480275    -17.58572364    -0.77224082    -0.36941555     -0.48251523   -17.72877513    -0.73627190
   G2-82     -99.92008319    -18.38082703    -18.26968476    -0.82209688    -0.40272781     -0.51991470   -18.43245141    -0.77608722
   G2-83    -132.17566610    -22.79154080    -22.71287938    -0.95276898    -0.45642007     -0.60813282   -22.88621421    -0.91629903
   G2-84    -132.15168259    -22.80421867    -22.72053233    -0.95491277    -0.45525686     -0.60613213   -22.89358875    -0.91783430
   G2-85    -132.11165128    -22.82141289    -22.73614298    -0.96811178    -0.45892699     -0.60835501   -22.90809502    -0.93092919
   G2-86    -132.06948961    -22.84737291    -22.75251648    -0.98326519    -0.46172807     -0.61108704   -22.92574464    -0.94497765
   G2-87    -132.11891265    -22.82426916    -22.73310615    -0.97264718    -0.46033133     -0.61115258   -22.90906328    -0.93295570
   G2-88    -132.56744828    -23.57293420    -23.44899730    -1.03649121    -0.49551817     -0.64756496   -23.64568072    -0.98549367
   G2-89    -132.62126502    -23.53752440    -23.42493623    -1.01955262    -0.49193590     -0.64509828   -23.61877241    -0.97184040
   G2-90    -133.06451723    -24.28150586    -24.13739356    -1.08326325    -0.52721866     -0.68232561   -24.35075562    -1.02446457
   G2-91    -133.06839955    -24.27808946    -24.13388922    -1.08411280    -0.52767898     -0.68337283   -24.34812590    -1.02529027
   G2-92    -165.20774430    -28.76450128    -28.63580766    -1.24406773    -0.58543271     -0.77070362   -28.85904151    -1.19301177
   G2-93    -197.55273607    -33.21379489    -33.10956494    -1.37380100    -0.63854442     -0.85493596   -33.35328415    -1.32947527
   G2-94    -212.01677694    -25.98073880    -25.96812854    -0.88149176    -0.46260442     -0.60500157   -26.15263497    -0.86438519
   G2-95    -301.22113141    -35.68849232    -35.68845205    -1.17599382    -0.61666082     -0.80848798   -35.93539520    -1.16042145
   G2-96    -897.13180953    -60.93698360    -60.63044294    -1.58888967    -0.39554837     -0.52420108   -61.14548909    -1.55677851
   G2-97   -1328.88536373    -88.10150259    -87.67004028    -2.23473430    -0.51779141     -0.69242184   -88.41022018    -2.19752683
   G2-98     -81.69987060    -13.55209562    -13.50081776    -0.57414819    -0.29123554     -0.37940792   -13.60978870    -0.54696710
   G2-99    -114.00773407    -17.96004324    -17.93326687    -0.70310182    -0.34335696     -0.46708301   -18.05770769    -0.68312920
   G2-100   -214.59499198    -29.15434883    -29.21225771    -1.07665172    -0.55839287     -0.76613195   -29.39377159    -1.05748621
   G2-101   -214.63738312    -29.10881289    -29.16809324    -1.06954115    -0.55846284     -0.76647485   -29.35127658    -1.05087717
   G2-102   -302.67150814    -27.64554582    -27.47294146    -0.87765192    -0.25744982     -0.32866945   -27.72625805    -0.83923694
   G2-103   -166.52777360    -22.30979221    -22.32699395    -0.80344256    -0.41451468     -0.55989342   -22.47358340    -0.78932733
   G2-104   -199.66885506    -28.19959355    -28.18710933    -1.06061673    -0.53882520     -0.72232583   -28.38707087    -1.03297685
   G2-105   -181.08478093    -26.96794963    -26.93076651    -1.05683466    -0.52768929     -0.70360696   -27.12611144    -1.02427700
   G2-106   -114.36117773    -18.72408439    -18.66653808    -0.78320743    -0.38300701     -0.50671395   -18.80629319    -0.75332410
   G2-107   -161.23050647    -23.40903098    -23.45104701    -0.84226911    -0.41124655     -0.58580909   -23.58521446    -0.83612190
   G2-108   -114.84149309    -19.44599301    -19.36342345    -0.83404736    -0.41565823     -0.54155135   -19.52338978    -0.79399993
   G2-109   -114.84923871    -19.45043030    -19.36696261    -0.83513548    -0.41567891     -0.54179110   -19.52651037    -0.79520985
   G2-110   -132.55761197    -19.22069833    -19.22492400    -0.71684239    -0.35606773     -0.48498770   -19.35113588    -0.70228027
   G2-111   -132.94758099    -19.97400372    -19.94095413    -0.78944958    -0.39368686     -0.52403801   -20.08556910    -0.76420693
   G2-112   -133.00659120    -19.96293112    -19.93235001    -0.77783800    -0.39028384     -0.52045540   -20.07736776    -0.75272408
   G2-113   -199.23632899    -27.43412827    -27.45226013    -0.99214765    -0.50244516     -0.68510981   -27.62930327    -0.97525270
   G2-114   -133.42580100    -20.71398828    -20.65014218    -0.84329737    -0.42603366     -0.55731499   -20.81394123    -0.80825105
   G2-115   -133.42114782    -20.70049340    -20.63951218    -0.84008009    -0.42600617     -0.55727719   -20.80511345    -0.80453092
   G2-116   -438.82421292    -36.77922457    -36.60696951    -1.13636603    -0.36272160     -0.48305300   -36.90763853    -1.10594721
   G2-117   -505.92975029    -45.71373173    -45.55405383    -1.47098105    -0.54643077     -0.72964638   -45.92332779    -1.42974252
   G2-118   -439.30554873    -37.49186441    -37.29300878    -1.18730266    -0.39541763     -0.51729960   -37.61432927    -1.14588290
   G2-119   -439.30312518    -37.49160521    -37.29553378    -1.18655342    -0.39503905     -0.51752068   -37.61544289    -1.14579924
   G2-120   -155.51988477    -21.43116649    -21.40377572    -0.78735740    -0.39769715     -0.52615876   -21.55784189    -0.76675023
   G2-121   -498.52941805    -39.66194848    -39.45148072    -1.20501245    -0.39861865     -0.52098070   -39.79191118    -1.16547201
   G2-122   -498.07724736    -38.91575818    -38.73922918    -1.14147715    -0.36399482     -0.48531854   -39.05836323    -1.11341973
   G2-123   -146.70437298    -23.11208589    -23.08778614    -0.89779516    -0.43277367     -0.59361051   -23.24264137    -0.87607005
   G2-124   -166.15637901    -25.86943272    -25.80550096    -1.03996640    -0.51455477     -0.68206144   -26.00204432    -1.00190553
   G2-125   -199.67550523    -28.22067918    -28.20274098    -1.06531781    -0.53830445     -0.72009369   -28.40144440    -1.03795109
   G2-126   -222.21663223    -29.67369053    -29.66173907    -1.07179691    -0.54511409     -0.72648916   -29.86932948    -1.04824663
   G2-127   -564.78080480    -47.13505645    -46.98259627    -1.42349345    -0.51226001     -0.68844630   -47.35488225    -1.39272116
   G2-128   -531.67341873    -45.56319459    -45.31963002    -1.46613186    -0.52308681     -0.68339676   -45.71067886    -1.41377657
   G2-129   -166.57765193    -26.61130347    -26.51485861    -1.10515437    -0.55085357     -0.72050386   -26.73023398    -1.05726889
   G2-130   -166.57005105    -26.60176029    -26.50795047    -1.10109496    -0.55030784     -0.71935440   -26.72447853    -1.05266743
   G2-131   -147.98822201    -25.33638818    -25.22262524    -1.09524850    -0.54087993     -0.70551950   -25.43438552    -1.04245472
   G2-132   -198.35379960    -30.34349197    -30.29956888    -1.19733459    -0.57449387     -0.77484958   -30.51146066    -1.16591255
   G2-133   -504.22267445    -47.14490911    -46.96566543    -1.54452036    -0.54427673     -0.73679201   -47.33328478    -1.50767242
   G2-134   -179.76932032    -29.10610983    -29.03731323    -1.19240150    -0.56358274     -0.75680306   -29.24374050    -1.15661316
   G2-135   -212.49317162    -34.27068247    -34.19688510    -1.38469504    -0.65172125     -0.87792994   -34.43869454    -1.34566200
   G2-136     -0.47585118     -0.65738702     -0.64753419    -0.04321542    -0.03243345     -0.03929309    -0.66034127    -0.03568470
   G2-137   -372.75887448    -25.34353116    -25.20692116    -0.62598246    -0.12974667     -0.15560523   -25.42311783    -0.61582808
   G2-138    -65.55686109    -10.60905449    -10.59362600    -0.38700788    -0.19179879     -0.24589695   -10.66516288    -0.38167323
   G2-139    -66.05671089    -11.35442510    -11.31395974    -0.45523601    -0.22602167     -0.28453332   -11.40201286    -0.43982107
   G2-140   -132.77341874    -19.57642898    -19.55822243    -0.74023927    -0.37589145     -0.49003894   -19.69474547    -0.72238744
   G2-141   -100.02054394    -14.44080338    -14.41828510    -0.54497872    -0.28565965     -0.36157148   -14.52439266    -0.53011949
   G2-142   -100.03715977    -14.42215582    -14.39175400    -0.54061639    -0.28348865     -0.35346631   -14.50167524    -0.52437061
   G2-143   -133.18723224    -20.32093054    -20.25982695    -0.80166085    -0.40799417     -0.51606192   -20.41977701    -0.77268352
   G2-144   -405.90572764    -31.24028337    -31.07718558    -0.88684533    -0.25374818     -0.31918386   -31.34076369    -0.86495077
   G2-145    -66.51023812    -12.11301832    -12.03963408    -0.52154519    -0.26033958     -0.32113388   -12.14796220    -0.49518796
   G2-146    -99.65823033    -18.01304583    -17.90954614    -0.78369642    -0.38473071     -0.48424819   -18.06694991    -0.74494941
   G2-147   -132.80756923    -23.91195612    -23.77750446    -1.04617594    -0.50956711     -0.64795876   -23.98494020    -0.99486716
   G2-148   -181.23820680    -22.86561315    -22.97266742    -0.78099664    -0.42242418     -0.57738627   -23.09392723    -0.78124220
   G2-149   -132.16128226    -22.78499246    -22.70974868    -0.95415687    -0.45693454     -0.60801953   -22.88147342    -0.91787420
   G2-150   -165.32038869    -28.69460856    -28.58247198    -1.21618780    -0.58158977     -0.77168035   -28.80728679    -1.16688254
   G2-151   -165.72064673    -29.49609092    -29.33321675    -1.30193924    -0.62055810     -0.80972911   -29.58316494    -1.23745947
   G2-152   -166.20896519    -30.18217302    -30.00502747    -1.34442098    -0.65177838     -0.84482977   -30.26909713    -1.27281436
   G2-153   -166.21648677    -30.17484397    -29.99693126    -1.34730099    -0.65324451     -0.84814666   -30.26381086    -1.27550752
   G2-154   -197.97357779    -33.92091295    -33.78887951    -1.43568303    -0.67480343     -0.89814492   -34.05053706    -1.38054087
   G2-155   -197.97107202    -33.92627131    -33.79067242    -1.43592143    -0.67412396     -0.89603588   -34.05299444    -1.38034580
   G2-156   -198.86491847    -35.40569581    -35.20685458    -1.56544200    -0.74578998     -0.97276472   -35.51058855    -1.48758247
   G2-157   -199.35330255    -36.08289259    -35.87275535    -1.60558365    -0.77631233     -1.00731086   -36.18740259    -1.52119085
   G2-158   -199.35294821    -36.07918548    -35.86922497    -1.60790722    -0.77757114     -1.00984068   -36.18458534    -1.52375939
   G2-159   -230.69805536    -39.11535908    -38.97916765    -1.63609604    -0.76349381     -1.01834623   -39.27368944    -1.57892364
   G2-160   -232.49729737    -41.98395417    -41.74078636    -1.86677410    -0.90085343     -1.16979409   -42.10618519    -1.76955521
   G2-161   -263.36965226    -44.23489252    -44.10409928    -1.82852837    -0.85377274     -1.15026466   -44.42704612    -1.77041507
   G2-162   -265.64194893    -47.88434922    -47.60823047    -2.12790974    -1.02538861     -1.33228236   -48.02413245    -2.01792536
   G2-163   -328.77170989    -54.68063434    -54.52399333    -2.25189959    -1.03588024     -1.39543457   -54.92016092    -2.18504651
   G2-164   -328.75325493    -54.62779095    -54.49638430    -2.24868215    -1.03936742     -1.40886407   -54.88711921    -2.18355166
   G2-165   -232.81596882    -34.11020212    -34.06233076    -1.32268352    -0.66275379     -0.88275598   -34.31439145    -1.28180088
   G2-166   -199.72844011    -32.50811926    -32.37815256    -1.36795956    -0.67617362     -0.88475163   -32.64625815    -1.30703974
   G2-167   -245.62204527    -40.19611283    -40.08936086    -1.65145142    -0.77691310     -1.04083312   -40.38167994    -1.60002071
   G2-168   -264.20400081    -41.45150215    -41.36501395    -1.65962706    -0.78738631     -1.05659608   -41.66094139    -1.61320294
   G2-169   -198.82281714    -31.01531563    -30.95681546    -1.23521751    -0.60477413     -0.80883501   -31.18278878    -1.19656465
   G2-170   -199.22909670    -31.81943691    -31.70649914    -1.31973240    -0.64348023     -0.84633701   -31.96012426    -1.26542979
   G2-171   -231.95597495    -36.98928198    -36.87354030    -1.52000420    -0.73231351     -0.97142365   -37.15764707    -1.46322811
   G2-172   -330.45085957    -48.89284534    -48.86289077    -1.86768595    -0.89935665     -1.22766380   -49.19346068    -1.82766637
   G2-173   -227.43571924    -35.33060916    -35.28456012    -1.39584802    -0.66448196     -0.89987463   -35.52536910    -1.36182313
   G2-174   -572.53260912    -54.01348802    -53.86489876    -1.76342570    -0.69539854     -0.93369052   -54.29582320    -1.71652983
   G2-175   -629.30220853    -60.39548206    -60.16266693    -2.02027548    -0.76016989     -1.02126917   -60.63420839    -1.96963668
   G2-176   -227.52742898    -35.23658061    -35.19667949    -1.36546623    -0.65713427     -0.90151016   -35.43393843    -1.33307167
   G2-177   -227.43558931    -35.32096226    -35.27934432    -1.39525080    -0.66513478     -0.90176628   -35.51845654    -1.36180228
   G2-178   -198.38909712    -30.27044344    -30.24005218    -1.16971266    -0.56839940     -0.77365103   -30.44830479    -1.14012990
   G2-179   -198.85174678    -31.02410942    -30.96274985    -1.23533419    -0.60400508     -0.80833266   -31.18919343    -1.19560293
   G2-180   -332.20484364    -47.50149248    -47.47003800    -1.80253348    -0.89927824     -1.20836680   -47.80611740    -1.75707201
   G2-181   -504.66530422    -47.86525671    -47.64957817    -1.60207078    -0.57756684     -0.77049998   -48.03714094    -1.55382178
   G2-182   -180.29920105    -29.75975579    -29.66681053    -1.22482723    -0.59231643     -0.79223078   -29.89333352    -1.17900208
   G2-183   -199.29914106    -31.77198257    -31.67466795    -1.30166325    -0.63925179     -0.84470001   -31.92230380    -1.25072666
   G2-184   -199.29659065    -31.76305903    -31.66653759    -1.30042457    -0.63956190     -0.84611598   -31.91333953    -1.24973271
   G2-185   -265.88326924    -40.04178854    -39.94552380    -1.60051341    -0.79192841     -1.04718244   -40.25510347    -1.54354355
   G2-186   -505.11183234    -48.60676325    -48.35923213    -1.66697225    -0.61327388     -0.80841042   -48.76737570    -1.60765303
   G2-187   -564.83172891    -51.45341557    -51.17736932    -1.72967667    -0.64889549     -0.84913832   -51.62256973    -1.66412432
   G2-188   -564.81801608    -51.46372491    -51.18713754    -1.72723085    -0.64764318     -0.84592162   -51.62884245    -1.66207818
   G2-189   -180.64847870    -30.56152789    -30.42682907    -1.31379755    -0.63336168     -0.83118877   -30.67470106    -1.25503621
   G2-190   -314.03332650    -46.85753135    -46.81610811    -1.86161347    -0.93277523     -1.25520688   -47.15156818    -1.80396390
   G2-191   -199.71881448    -32.50305090    -32.37639114    -1.36209061    -0.67463765     -0.88149185   -32.64381370    -1.30080237
   G2-192   -266.36941465    -40.72788435    -40.61731567    -1.64418815    -0.82352255     -1.08350093   -40.93971076    -1.58075586
   G2-193   -505.60613088    -49.28143101    -49.01721974    -1.71270882    -0.64612769     -0.84642260   -49.44261250    -1.64554280
   G2-194   -878.13481283    -74.29898398    -73.92610763    -2.33429353    -0.76172440     -1.00549395   -74.55318612    -2.26163761
   G2-195   -181.14889029    -31.24488086    -31.09433468    -1.36017714    -0.66602003     -0.86967385   -31.35859999    -1.29426219
   G2-196   -402.11297362    -45.38364443    -45.11444548    -1.66371580    -0.62996374     -0.81619394   -45.51938542    -1.58746758
   G2-197   -537.36811497    -53.04766805    -52.83600290    -1.80618361    -0.66883321     -0.89953485   -53.25445961    -1.75638938
   G2-198   -212.91157404    -35.00179441    -34.90193577    -1.45218545    -0.68836240     -0.92005315   -35.15997036    -1.40333011
   G2-199   -232.37418026    -37.72481489    -37.57715819    -1.58307113    -0.76883021     -1.00984861   -37.88380069    -1.51567101
   G2-200   -232.44164585    -37.67465495    -37.54391614    -1.56332838    -0.76392479     -1.00733403   -37.84253856    -1.49953940
   G2-201   -299.11384703    -45.91004762    -45.79668967    -1.84577113    -0.91221288     -1.20865347   -46.15142299    -1.77915098
   G2-202   -538.25307159    -54.51260841    -54.23053570    -1.93004578    -0.73846080     -0.97161082   -54.69119763    -1.85766168
   G2-203   -213.79153043    -36.46935710    -36.29979402    -1.57725502    -0.75874287     -0.99461780   -36.60080826    -1.50536133
   G2-204   -232.86440203    -38.39715054    -38.23716431    -1.62703598    -0.80129557     -1.04842909   -38.55815685    -1.55295064
   G2-205   -375.93345893    -52.61402746    -52.54988578    -1.95850100    -0.94847499     -1.26611445   -52.91935083    -1.91617071
   G2-206   -375.93202152    -52.61404114    -52.55041479    -1.95828071    -0.94855264     -1.26641184   -52.91942363    -1.91611043
   G2-207   -286.74345478    -42.91393917    -42.82999259    -1.66608661    -0.79353681     -1.06064993   -43.13646517    -1.62282163
   G2-208   -266.01626431    -44.29834513    -44.10614843    -1.88644691    -0.92507311     -1.20942936   -44.47698336    -1.79962193
   G2-209   -765.22634780    -73.09401258    -72.99850439    -2.17016049    -0.94707022     -1.24692909   -73.54338722    -2.14867490
   G2-210   -908.94019456    -85.36362281    -85.31961926    -2.55454752    -1.15521350     -1.53231350   -85.94512880    -2.53110078
   G2-211  -1272.55397755    -90.47808341    -90.07628838    -2.32004505    -0.37895593     -0.53940050   -90.80130986    -2.30422248
   G2-212   -572.47714257    -49.66883407    -49.65276875    -1.46208009    -0.56362426     -0.78797368   -50.00834442    -1.45103443
   G2-213  -1236.52149649    -80.02742251    -79.65250203    -1.95032779    -0.39033789     -0.52761361   -80.31741996    -1.92725169
   G2-214  -1680.74304931   -113.54166681   -113.03612144    -2.86879653    -0.65164336     -0.88219061  -113.98751948    -2.82672162
   G2-215  -2478.03162647   -160.32748372   -159.53574264    -3.93816661    -0.78396182     -1.05660158  -160.90034820    -3.87979026
   G2-216  -1369.77435131    -96.51388583    -96.20277985    -2.52838438    -0.69314626     -0.95305542   -96.97744028    -2.49911011
   G2-217  -1614.13810137   -105.22359229   -104.71123536    -2.57746777    -0.50360801     -0.67784161  -105.59760866    -2.54284556
   G2-218  -1609.07579408   -105.01784879   -104.54940837    -2.57565490    -0.51049020     -0.69785082  -105.41787115    -2.54754258
   G2-219  -1132.63319026    -75.40979959    -75.03555101    -1.84763497    -0.33994470     -0.45638793   -75.66852461    -1.82396168
   G2-220   -732.97393522    -62.85861443    -62.73086663    -1.82326312    -0.73831704     -0.97428694   -63.20539306    -1.80155336
   G2-221   -601.95786436    -70.68888452    -70.70148055    -2.31437973    -1.20409100     -1.58358957   -71.18836920    -2.28988470
   G2-222   -300.95714827    -35.30852508    -35.32013824    -1.13741974    -0.60115194     -0.77400797   -35.55772192    -1.13037158
   G2-223   -197.27973537    -32.83405337    -32.73975547    -1.33370932    -0.62183588     -0.82079402   -32.97826916    -1.29621786
#TMD-BE3       E[noXC]         X Energy HF   X Energy DFT     C Energy GGA  C Energy PT2os   C Energy osRPA   X Energy SCAN     C Energy SCAN
 Cr2-BE3     -2009.12074428     -94.94417432    -95.51074671    -2.07948012    -0.83260355    -1.50842292    -96.03068748    -2.11623877
  V2-BE3     -1811.54895039     -88.78482109    -89.08349673    -1.95080115    -0.74501895    -1.15053947    -89.60802464    -1.97794884
 Fe2-BE3     -2440.75384735    -109.48930021   -109.63189375    -2.26771848    -0.97842928    -1.10235322   -110.26163364    -2.30255193
  Cr-BE3     -1004.34229130     -48.07098706    -48.00023496    -0.98364435    -0.42407754    -0.34723046    -48.31513661    -0.99192177
   V-BE3      -905.80874107     -44.57741121    -44.46446633    -0.92813758    -0.32639661    -0.36490214    -44.77276261    -0.93963196
  Fe-BE3     -1220.40984982     -54.83362447    -54.75926802    -1.11189205    -0.43883869    -0.47409888    -55.08179434    -1.13143992
#TM-BE13           E[noXC]         X Energy HF   X Energy DFT     C Energy GGA  C Energy PT2os   C Energy osRPA   X Energy SCAN     C Energy SCAN
   TiCl-BE13   -1247.25618160     -69.16824179     -68.94775726   -1.55189867   -0.45681356      -0.50352001    -69.46822744    -1.54475476
    VF5-BE13   -1353.99254020     -94.50952376     -94.76793787   -2.55290534   -1.22496578      -1.69547575    -95.40237969    -2.54190431
   CrCl-BE13   -1438.50982188     -75.71994050     -75.51647359   -1.66640734   -0.54589022      -0.55101690    -76.06706671    -1.66225991
   CrOF-BE13   -1160.95618934     -66.00574497     -66.10678955   -1.60095514   -0.72189162      -0.91760969    -66.52611250    -1.60572462
CoC4O4H-BE13   -1736.54602349    -111.83493843    -112.22746959   -3.15484070   -1.47836486      -2.16017636   -112.88091471    -3.15231288
 FeC5O5-BE13   -1718.23760836    -121.22686171   -121.60973989    -3.52062721   -1.65185819      -2.40651778   -122.33205346    -3.51504489
     VS-BE13   -1279.91010278     -69.72152128    -69.61106442    -1.56896189   -0.49070798      -0.56229670    -70.11069500    -1.56838426
    CuH-BE13   -1593.43037094     -66.55071618    -66.63842168    -1.37500527   -0.56518662      -0.76728480    -66.97723077    -1.39410915
   CuCl-BE13   -2027.26109977     -93.98127890    -93.90943781    -2.02238128   -0.67922192      -0.91469696    -94.48251693    -2.03145310
     VO-BE13    -972.58243190     -52.74009355    -52.79353835    -1.22178941   -0.51741920      -0.62864521    -53.12954704    -1.22823167
   NiCl-BE13   -1897.69133038     -90.14362833    -90.03021136    -1.95465646   -0.54162307      -0.73293025    -90.61084358    -1.96120819
  CO_di-BE13     -99.57280365     -13.31643679    -13.32945043    -0.44942765   -0.22874816      -0.31696451    -13.41070924    -0.44641463
     Ti-BE13    -813.22928700     -41.38042272    -41.25468756    -0.87431303   -0.28565008      -0.33011327    -41.54209935    -0.88383347
     Cl-BE13    -434.08034901     -27.64543878    -27.49779006    -0.64346610   -0.13325748      -0.15817751    -27.73096544    -0.63586368
      V-BE13    -905.80874107     -44.57741121    -44.46446633    -0.92813758   -0.32650175      -0.35588298    -44.77276261    -0.93963196
      F-BE13     -89.53064645     -10.02223254     -9.99656975    -0.29037216   -0.16352331      -0.18548184    -10.06979940    -0.28978730
      O-BE13     -66.70271977      -8.19770031     -8.16383495    -0.23387377   -0.13828087      -0.13451063     -8.22248625    -0.23473505
     Fe-BE13   -1220.40984982     -54.83362447    -54.75926802    -1.11189205   -0.43828101      -0.47384363    -55.08179434    -1.13143992
     Co-BE13   -1338.00114229     -58.46592041    -58.41705730    -1.18225848   -0.46589789      -0.54191478    -58.75752956    -1.20347032
      H-BE13      -0.19102882      -0.30868435     -0.30309962    -0.00579945   -0.01808092       0.00000000     -0.30912620    -0.00000006
     Ni-BE13   -1463.79390051     -62.28778010    -62.25314588    -1.25508105   -0.38743356      -0.49242065    -62.62615734    -1.27671928
     Cu-BE13   -1593.13431835     -66.29169938    -66.35514159    -1.34085006   -0.54741998      -0.71636522    -66.68719664    -1.36435353
     Cr-BE13   -1004.34229129     -48.07098707    -48.00023496    -0.98364435   -0.42163509      -0.34303560    -48.31513660    -0.99192177
      S-BE13    -374.11959074     -25.11134556    -24.97725139    -0.58347755   -0.11172500      -0.11765034    -25.18533721    -0.57918886
      C-BE13     -32.65369717      -5.06153279     -5.02546362    -0.14421175   -0.08457317      -0.07148907     -5.06463620    -0.14604109
#G2RC       E[noXC]       X Energy HF    X Energy DFT   C Energy GGA  C Energy PT2os  C Energy osRPA   X Energy SCAN     C Energy SCAN
 100-G2RC   -114.00165065    -17.96665851    -17.93893577    -0.70333471    -0.34326897 	-0.46662301    -18.06366620    -0.68329553
 104-G2RC   -166.52552292    -22.31223995    -22.32907739    -0.80356366    -0.41449158 	-0.55975581    -22.47579462    -0.78941160
 106-G2RC   -181.07513270    -26.97820190    -26.93973174    -1.05734117    -0.52762803 	-0.70316221    -27.13552750    -1.02465767
 113-G2RC   -133.00089124    -19.96893633    -19.93765103    -0.77812290    -0.39025470 	-0.52020445    -20.08292762    -0.75294339
 117-G2RC   -438.81976630    -36.78384585    -36.61114777    -1.13651294    -0.36270547 	-0.48291683    -36.91198798    -1.10606730
 118-G2RC   -505.91800228    -45.72664555    -45.56509164    -1.47176588    -0.54636376 	-0.72904990    -45.93507954    -1.43029619
  11-G2RC    -48.56427880     -7.65591899     -7.63653947    -0.31544004    -0.16753347 	-0.21871528     -7.69512437    -0.30133548
 121-G2RC   -155.51399408    -21.43745612    -21.40923205    -0.78767980    -0.39765326 	-0.52584123    -21.56358883    -0.76699656
 126-G2RC   -199.67063753    -28.22582910    -28.20727128    -1.06556864    -0.53828203 	-0.71989018    -28.40618038    -1.03814889
 128-G2RC   -564.77555364    -47.13816804    -46.98622156    -1.42356039    -0.51238423 	-0.68866716    -47.35831363    -1.39284203
  13-G2RC    -67.13922285     -8.92297869     -8.92209119    -0.32603934    -0.17836233 	-0.23508478     -8.98281662    -0.31752443
  14-G2RC    -89.67190778    -10.39326602    -10.39324483    -0.33630900    -0.18550908 	-0.24105633    -10.46285000    -0.33157285
  18-G2RC   -269.52657267    -21.73019707    -21.58985078    -0.61603510    -0.13369518 	-0.16703451    -21.79314439    -0.59030646
   1-G2RC     -0.47545269     -0.65780352     -0.64791750    -0.04322102    -0.03243192 	-0.03928310     -0.66074006    -0.03568863
  21-G2RC   -373.01739656    -25.69386085    -25.55712640    -0.66717471    -0.14738142 	-0.19281851    -25.77908061    -0.65072248
  22-G2RC   -432.23552706    -27.86992853    -27.72037998    -0.68726716    -0.15117885 	-0.19746842    -27.96054080    -0.67286408
  23-G2RC    -11.31754245     -3.55088606     -3.51315598    -0.12424212    -0.02388193 	-0.03540417     -3.55231509    -0.11828276
  24-G2RC    -95.04433916    -11.94099429    -11.93590030    -0.37776200    -0.18364017 	-0.24382123    -12.02090397    -0.37569437
  25-G2RC    -65.86194484    -10.98454266    -10.96449873    -0.43076171    -0.20716850 	-0.28492652    -11.03947471    -0.41875745
  26-G2RC    -66.32168234    -11.73838864    -11.68969411    -0.49562769    -0.24281541 	-0.32015350    -11.78240836    -0.47347594
  30-G2RC    -99.47063034    -13.30878442    -13.32007869    -0.44971752    -0.22856433 	-0.31633853    -13.40182955    -0.44654407
  32-G2RC    -99.85043137    -14.05995584    -14.06025897    -0.51627808    -0.26632426 	-0.35942906    -14.15491477    -0.50384943
  33-G2RC   -100.27366659    -14.81596577    -14.78458143    -0.58248511    -0.30181978 	-0.39536163    -14.89759162    -0.56028039
  34-G2RC    -95.87019028    -13.11340302    -13.13433301    -0.45308375    -0.23072576 	-0.32493304    -13.21092521    -0.44952917
  39-G2RC   -178.85024811    -19.90880933    -19.96816376    -0.61505699    -0.34413518 	-0.46392981    -20.08953869    -0.61335440
  40-G2RC   -166.11509767    -21.58751788    -21.63234428    -0.74125308    -0.37888153 	-0.52326148    -21.76337936    -0.73550126
  45-G2RC   -863.97007421    -55.02098358    -54.75461060    -1.32596435    -0.27278931 	-0.36542443    -55.21279977    -1.30937905
  47-G2RC   -335.32980281    -28.50745019    -28.45243592    -0.77781205    -0.21475691 	-0.30523178    -28.65970444    -0.77685519
  51-G2RC   -521.39791036    -37.50170308    -37.39381326    -0.97113655    -0.30823020 	-0.41269966    -37.68445397    -0.96224652
  52-G2RC   -538.58072415    -42.78137398    -42.51861159    -1.19524126    -0.23687781 	-0.30026893    -42.91027483    -1.15184817
  56-G2RC   -505.87579060    -41.41336240    -41.37803801    -1.17154382    -0.41448639 	-0.58362489    -41.67739710    -1.16488279
  57-G2RC   -289.15407262    -34.17819300    -34.15695024    -1.09251126    -0.56531162 	-0.73883621    -34.39770602    -1.08218660
  58-G2RC  -1316.80709325    -86.55479086    -86.10163535    -2.15760712    -0.46672048 	-0.62105994    -86.84462922    -2.11954167
  59-G2RC   -492.10468478    -48.50872305    -48.42849594    -1.40806266    -0.55456427 	-0.73062691    -48.78917126    -1.39805595
  60-G2RC  -1519.80540584   -100.90355739   -100.36557269    -2.47294907    -0.45020989 	-0.59627873   -101.23810271    -2.43159639
  61-G2RC   -390.41454040    -45.40518279    -45.41312243    -1.47195202    -0.77027552 	-1.01023481    -45.72388883    -1.45730435
  62-G2RC  -1760.63653132   -115.25896979   -114.70413655    -2.88165280    -0.64079361 	-0.86291623   -115.66939532    -2.83946937
  66-G2RC   -626.35046153    -60.82061487    -60.71109492    -1.78405246    -0.74587141 	-0.97793021    -61.16996994    -1.76724203
  67-G2RC  -1996.57961700   -130.64901161   -129.95536613    -3.20706840    -0.61197192 	-0.81394281   -131.08443692    -3.15204340
  68-G2RC   -162.46340384    -21.28093060    -21.37102860    -0.74389725    -0.38681394 	-0.54910378    -21.48410704    -0.74109287
   6-G2RC    -33.11422445     -5.77710928     -5.74447442    -0.22418702    -0.11556386 	-0.15044111     -5.79433011    -0.21087936
  73-G2RC   -245.53137387    -28.02689273    -28.13695748    -0.89115658    -0.49579556 	-0.67675370    -28.30126557    -0.89008938
  82-G2RC    -99.41070721    -17.68482401    -17.59473721    -0.77274155    -0.36940768 	-0.48223303    -17.73814383    -0.73669223
  88-G2RC   -132.10763035    -22.83602905    -22.74363414    -0.97323200    -0.46030730 	-0.61074121    -22.92001116    -0.93344700
   8-G2RC    -33.63096396     -6.58083702     -6.53537847    -0.30098255    -0.15439436 	-0.19635734     -6.59779777    -0.28060273
  94-G2RC   -197.53517749    -33.23209729    -33.12589404    -1.37476507    -0.63850180 	-0.85426091    -33.37028391    -1.33027897
  97-G2RC   -897.13060181    -60.93822743    -60.63160500    -1.58885106    -0.39553296 	-0.52416146    -61.14672076    -1.55673699
