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
0.2, 0.7, 0.3

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
    a3, a4, a5 = C
    a1 = 0.75
    #a3 = 0.0
    a2 = 1. - a1
    #a5 = 0.0

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
 2  Cr2-BE3     -1    Cr-BE3    2                         0.057370000   10.0
 2  V2-BE3      -1    V-BE3     2                         0.102309000   10.0
 2  Fe2-BE3     -1    Fe-BE3    2                         0.042262000   10.0
# TM-BE13
 3 TiCl-BE13    -1 Ti-BE13   1 Cl-BE13    1                   0.16060302   10.0000
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
 3   118-G2RC   -1   117-G2RC   1    13-G2RC    1                    -0.00152986    10.0000
 3    40-G2RC   -1     1-G2RC  -1   104-G2RC    1                    -0.00323501    10.0000
 3   113-G2RC   -1    30-G2RC   1     8-G2RC    1                    -0.00406368    10.0000
 3    52-G2RC   -1     1-G2RC  -1    18-G2RC    2                    -0.00618317    10.0000
 4    30-G2RC   -1    13-G2RC  -1    40-G2RC    1     1-G2RC    1    -0.01117114    10.0000
 4   128-G2RC   -1    13-G2RC  -1   126-G2RC    1    22-G2RC    1    -0.01587226    10.0000
 3   100-G2RC   -1    13-G2RC  -1   106-G2RC    1                    -0.03207917    10.0000
 3    25-G2RC   -1    14-G2RC  -1   121-G2RC    1                    -0.04042963    10.0000
 3    39-G2RC   -1    45-G2RC  -1    51-G2RC    2                    -0.04210291    10.0000
 4    58-G2RC   -1    59-G2RC  -1    57-G2RC    1    60-G2RC    1    -0.04278816    10.0000
 4    67-G2RC   -1    61-G2RC  -1    66-G2RC    1    62-G2RC    1    -0.04195949    10.0000
 3    32-G2RC   -1     1-G2RC  -1    33-G2RC    1                    -0.04658093    10.0000
 3    25-G2RC   -1    26-G2RC  -1    88-G2RC    1                    -0.05215853    10.0000
 4    47-G2RC   -1     1-G2RC  -3    18-G2RC    1    13-G2RC    1    -0.05403898    10.0000
 3    34-G2RC   -1     1-G2RC  -3    11-G2RC    2                    -0.06194324    10.0000
 4     8-G2RC   -1    45-G2RC  -2    97-G2RC    1    22-G2RC    2    -0.07502669    10.0000
 3    25-G2RC   -1     1-G2RC  -1    26-G2RC    1                    -0.07716212    10.0000
 4    56-G2RC   -1     1-G2RC  -3    21-G2RC    1    13-G2RC    2    -0.09636500    10.0000
 4    30-G2RC   -1     1-G2RC  -3    13-G2RC    1     8-G2RC    1    -0.10323341    10.0000
 4    73-G2RC   -1     1-G2RC  -1    39-G2RC    1    13-G2RC    1    -0.10951220    10.0000
 4    68-G2RC   -1     1-G2RC  -1    34-G2RC    1    13-G2RC    1    -0.12866727    10.0000
 3    26-G2RC   -1     6-G2RC  -1    82-G2RC    1                    -0.17379803    10.0000
 3     1-G2RC   -1    39-G2RC  -1    14-G2RC    2                    -0.21400456    10.0000
 2    25-G2RC   -3    94-G2RC   1                                    -0.24154197    10.0000
 3    23-G2RC   -1    39-G2RC  -1    24-G2RC    2                    -0.33895874    10.0000

__xyg3 components__ :: 316 #426 275
#G2             E[noXC]         X Energy HF    X Energy DFT   C Energy GGA     C ssRPA       C osRPA      X_Energy_SCAN  C_Energy_SCAN
# 15+223
     H_0      -0.19102678     -0.30867667     -0.30309140    -0.00579958    -0.01808036     0.00000000      -0.30911815    -0.00000000
    Li_0      -5.65538219     -1.77579326     -1.75477446    -0.05123606    -0.01783304     0.00000000      -1.77816817    -0.04587353
    Be_0     -11.90704819     -2.66416263     -2.63652410    -0.08579969    -0.02923560     -0.04176732     -2.65906039    -0.08341814
     B_0     -20.77185642     -3.75858145     -3.72691196    -0.11288086    -0.05515989     -0.05722110     -3.75458329    -0.11438989
     C_0     -32.63223571     -5.05796875     -5.02170416    -0.14423989    -0.08433136     -0.07147583     -5.06099413    -0.14604970
     N_0     -47.81790091     -6.58323013     -6.53795671    -0.17930767    -0.11505054     -0.08343645     -6.59108770    -0.18036112
     O_0     -66.62631316     -8.18835780     -8.15397074    -0.23393653    -0.13819271     -0.13446819     -8.21288202    -0.23474328
     F_0     -89.40283870    -10.00836417     -9.98190072    -0.29046823    -0.16344533     -0.18542838    -10.05549740    -0.28980676
    Na_0    -147.86510396    -13.98826982    -13.93619259    -0.36986209    -0.01523606     0.00000000     -14.04724926    -0.36531628
    Mg_0    -183.63915431    -15.97028273    -15.90503159    -0.41003754    -0.02444014     -0.03363340    -16.02482332    -0.41049303
    Al_0    -223.80948407    -18.06530875    -17.98064744    -0.44504753    -0.04531959     -0.04733487    -18.11870314    -0.44647045
    Si_0    -268.57225171    -20.28014741    -20.17635223    -0.48407856    -0.06834042     -0.06295003    -20.33675175    -0.48410646
     P_0    -318.09252950    -22.62119100    -22.49638593    -0.52578579    -0.09050264     -0.07811712    -22.68277712    -0.52325673
     S_0    -372.49928988    -25.00711315    -24.86854650    -0.58384998    -0.11174829     -0.11790745    -25.07776007    -0.57924820
    Cl_0    -431.96578184    -27.51698097    -27.36389744    -0.64392504    -0.13309759     -0.15830856    -27.59888280    -0.63588762
    G2-1      -5.85157986     -2.13422034     -2.11117367    -0.08408570    -0.02875150     -0.03632355     -2.13882486    -0.07802834
    G2-2     -12.07828706     -3.07206359     -3.03589099    -0.10335959    -0.05081889     -0.04223631     -3.07117557    -0.09634669
    G2-3     -32.87330059     -5.40661566     -5.37485246    -0.18471693    -0.09938663     -0.11249946     -5.41805538    -0.17884592
    G2-4     -33.08430879     -5.85176211     -5.80886260    -0.21498112    -0.12142748     -0.11546871     -5.86335963    -0.20607249
    G2-5     -33.11653424     -5.77465326     -5.74229934    -0.22411608    -0.11547471     -0.15006695     -5.79205682    -0.21082932
    G2-6     -33.36509371     -6.21137118     -6.16746201    -0.25953555    -0.13628332     -0.15835357     -6.22756664    -0.24545908
    G2-7     -33.63434741     -6.57734019     -6.53218826    -0.30084998    -0.15439728     -0.19643936     -6.59448457    -0.28049143
    G2-8     -48.06626059     -6.91498893     -6.88438020    -0.22537030    -0.13174991     -0.13107928     -6.93768500    -0.22148187
    G2-9     -48.31669561     -7.27024960     -7.24804968    -0.27087167    -0.14872948     -0.17715533     -7.30565943    -0.26215423
   G2-10     -48.56628965     -7.65384287     -7.63458564    -0.31532983    -0.16748304     -0.21866208     -7.69307274    -0.30125911
   G2-11     -66.88429852     -8.53836248     -8.52465514    -0.28029764    -0.15793233     -0.18676090     -8.58601740    -0.27666376
   G2-12     -67.14005282     -8.92207571     -8.92131474    -0.32600183    -0.17837153     -0.23512964     -8.98199503    -0.31750222
   G2-13     -89.67145465    -10.39377564    -10.39366472    -0.33632917    -0.18549948     -0.24101972    -10.46329809    -0.33158320
   G2-14    -269.05589472    -20.97003566    -20.85795609    -0.55458056    -0.09979057     -0.12992858    -21.03418056    -0.54188867
   G2-15    -269.00989081    -21.00833769    -20.88820449    -0.54443124    -0.10598457     -0.10075459    -21.07222218    -0.53242641
   G2-16    -269.27006608    -21.36564833    -21.23598597    -0.58121425    -0.11942473     -0.13499593    -21.42891952    -0.56274940
   G2-17    -269.52554898    -21.73125445    -21.59081631    -0.61607230    -0.13369758     -0.16701952    -21.79414055    -0.59034139
   G2-18    -318.59160174    -23.29165666    -23.16334931    -0.60564863    -0.12498816     -0.14834266    -23.36402002    -0.59273638
   G2-19    -318.84343936    -23.64046823    -23.50841493    -0.64368384    -0.14174535     -0.18304220    -23.71693747    -0.62386394
   G2-20    -373.01932320    -25.69179347    -25.55531052    -0.66709110    -0.14739193     -0.19288960    -25.77717011    -0.65066726
   G2-21    -432.23689224    -27.86845622    -27.71909278    -0.68720328    -0.15118716     -0.19752284    -27.95918208    -0.67282608
   G2-22     -11.31692248     -3.55146248     -3.51373679    -0.12427375    -0.02308609     -0.03302521     -3.55285932    -0.11833780
   G2-23     -95.04750734    -11.93760022    -11.93297892    -0.37750026    -0.18368394     -0.24402723    -12.01787553    -0.37548426
   G2-24     -65.86561240    -10.98058837    -10.96107647    -0.43062638    -0.20721531     -0.28520593    -11.03585933    -0.41866977
   G2-25     -66.32792161    -11.73185371    -11.68385339    -0.49535426    -0.24283496     -0.32038061    -11.77631344    -0.47325578
   G2-26     -66.77508319    -12.48045903    -12.40228634    -0.56105558    -0.27829208     -0.35763854    -12.51439999    -0.52784664
   G2-27     -80.59427588    -11.62053733    -11.65217935    -0.40043456    -0.20924194     -0.28676610    -11.71895391    -0.40026329
   G2-28     -80.86193150    -12.04372560    -12.04989598    -0.44112963    -0.21981597     -0.30788834    -12.12462037    -0.43387607
   G2-29     -99.47276094    -13.30637677    -13.31810817    -0.44962659    -0.22862240     -0.31658414    -13.39973194    -0.44648536
   G2-30     -99.62345391    -13.66655013    -13.67959740    -0.47908990    -0.25255875     -0.32943175    -13.76619098    -0.47376688
   G2-31     -99.85321792    -14.05692207    -14.05766865    -0.51615578    -0.26635608     -0.35961645    -14.15218224    -0.50376441
   G2-32    -100.27627795    -14.81322886    -14.78210620    -0.58239593    -0.30182639     -0.39542885    -14.89500115    -0.56021469
   G2-33     -95.87654179    -13.10626068    -13.12856530    -0.45282501    -0.23094980     -0.32579308    -13.20478145    -0.44936076
   G2-34     -96.62028027    -14.60536912    -14.58445756    -0.58741060    -0.30465172     -0.40218761    -14.68697320    -0.56713459
   G2-35    -114.59315129    -14.70204352    -14.73826686    -0.49148493    -0.26466313     -0.35082505    -14.81986511    -0.49155174
   G2-36    -133.36364716    -16.31189320    -16.36275999    -0.53022233    -0.30889886     -0.36735313    -16.45448456    -0.53214468
   G2-37    -133.78996643    -17.04863700    -17.08720956    -0.60043303    -0.32834087     -0.44369150    -17.19183505    -0.59177915
   G2-38    -178.85387891    -19.90424667    -19.96499466    -0.61465965    -0.34427626     -0.46467897    -20.08616247    -0.61303335
   G2-39    -166.11554498    -21.58701351    -21.63193343    -0.74123160    -0.37889266     -0.52330950    -21.76293848    -0.73548855
   G2-40    -295.74001604    -27.96486715    -27.87191402    -0.75861693    -0.02089902     -0.02963803    -28.08321953    -0.75441049
   G2-41    -537.19859802    -40.56846317    -40.38658322    -1.00945479    -0.14854584     -0.16437667    -40.70472146    -1.00674432
   G2-42    -636.30863225    -45.17391559    -44.98583148    -1.12783582    -0.18397117     -0.26661794    -45.34636411    -1.12030851
   G2-43    -745.08475626    -50.00245053    -49.77892669    -1.22209032    -0.23930903     -0.29643403    -50.18805924    -1.21263784
   G2-44    -863.97363000    -55.01679869    -54.75128225    -1.32544769    -0.27278754     -0.36555828    -55.20929777    -1.30895702
   G2-45    -579.82242849    -41.62628955    -41.42366392    -1.04914376    -0.14601278     -0.19294101    -41.77728370    -1.03279450
   G2-46    -335.32971484    -28.50755476    -28.45251801    -0.77781742    -0.21467656     -0.30490255    -28.65979329    -0.77685826
   G2-47    -405.28217779    -30.06386527    -29.95909460    -0.79356034    -0.20160292     -0.28711626    -30.19419246    -0.78569025
   G2-48    -439.21322135    -33.18506002    -33.10225599    -0.87423339    -0.27220294     -0.33771408    -33.35441958    -0.87110672
   G2-49    -498.64202160    -35.64876102    -35.54780711    -0.92497076    -0.28726786     -0.37224205    -35.82240183    -0.91906759
   G2-50    -521.40694954    -37.49050822    -37.38546062    -0.97009833    -0.30845358     -0.41384772    -37.67544581    -0.96145942
   G2-51    -538.57949630    -42.78262903    -42.51975951    -1.19530578    -0.23688426     -0.30025678    -42.91146526    -1.15190583
   G2-52    -465.38027519    -33.76277190    -33.58436092    -0.94413866    -0.27431796     -0.35872170    -33.87389469    -0.91745341
   G2-53    -406.15941199    -31.59241165    -31.42601831    -0.92626071    -0.27097203     -0.35471481    -31.69669451    -0.89762314
   G2-54    -498.88156503    -36.03431264    -35.92233282    -0.96277158    -0.30092246     -0.40617583    -36.20345348    -0.95050012
   G2-55    -505.88111302    -41.40672057    -41.37303604    -1.17118897    -0.41461419     -0.58411424    -41.67193031    -1.16469232
   G2-56    -289.15532405    -34.17681419    -34.15580471    -1.09242754    -0.56532785     -0.73891866    -34.39647825    -1.08212857
   G2-57   -1316.80799956    -86.55385604    -86.10080327    -2.15752287    -0.46670995     -0.62106096    -86.84375686    -2.11947483
   G2-58    -492.11947647    -48.49162919    -48.41458122    -1.40690915    -0.55482279     -0.73174318    -48.77410676    -1.39726134
   G2-59   -1519.79910981   -100.91022466   -100.37134456    -2.47355862    -0.45021198     -0.59613764   -101.24429259    -2.43203616
   G2-60    -390.41624490    -45.40325342    -45.41158726    -1.47182315    -0.77030756     -1.01037717    -45.72223487    -1.45721716
   G2-61   -1760.63927728   -115.25597124   -114.70164970    -2.88132853    -0.64078660     -0.86300588   -115.66676013    -2.83921098
   G2-62    -471.97591326    -38.35612569    -38.27582465    -1.08429239    -0.35016244     -0.48757421    -38.56247036    -1.07358310
   G2-63    -777.82004444    -55.13699721    -54.93226275    -1.42883767    -0.32199306     -0.45359323    -55.37461773    -1.41322006
   G2-64    -278.25429510    -33.48205822    -33.51546918    -1.10578037    -0.57539694     -0.76873417    -33.73384698    -1.09644429
   G2-65    -626.36582926    -60.80273964    -60.69669142    -1.78290395    -0.74614732     -0.97910462    -61.15430136    -1.76648207
   G2-66   -1996.57325085   -130.65584838   -129.96118234    -3.20773566    -0.61197260     -0.81379409   -131.09070373    -3.15251995
   G2-67    -162.46915040    -21.27410405    -21.36578362    -0.74364121    -0.38702127     -0.55002428    -21.47849750    -0.74094059
   G2-68    -546.62255928    -42.13253149    -42.09242769    -1.16392694    -0.40724239     -0.57380673    -42.39968616    -1.15477125
   G2-69    -316.16997397    -36.50328090    -36.59929218    -1.18000765    -0.63914268     -0.86019727    -36.82306429    -1.17545668
   G2-70    -586.46550503    -52.83524613    -52.75679159    -1.51477321    -0.60438124     -0.80106342    -53.14609369    -1.50392172
   G2-71    -200.02553275    -24.31675180    -24.49224609    -0.81770601    -0.45416116     -0.66193416    -24.61101592    -0.82015641
   G2-72    -245.53007797    -28.02846128    -28.13809814    -0.89129102    -0.49574295     -0.67650693    -28.30246861    -0.89019678
   G2-73    -700.22855207    -57.41514521    -57.42353448    -1.60759688    -0.66694436     -0.90953495    -57.82802817    -1.60250873
   G2-74    -423.06876793    -50.53586376    -50.56440112    -1.66681193    -0.86250726     -1.14220949    -50.89932384    -1.65170056
   G2-75   -1793.30532451   -120.45506268   -119.89753975    -3.08430419    -0.73082864     -0.98796307   -120.89393677    -3.03969678
   G2-76    -381.59476542    -47.04162332    -47.06832526    -1.57761263    -0.80736077     -1.08452453    -47.37767552    -1.56223048
   G2-77     -99.00955019    -16.89251431    -16.84095165    -0.69278812    -0.33114192     -0.44540152    -16.96498571    -0.66824854
   G2-78     -99.01723915    -16.88090384    -16.83773568    -0.69301556    -0.33266025     -0.44590655    -16.95962100    -0.66943020
   G2-79     -98.95183084    -16.90762052    -16.85493351    -0.70589947    -0.33477629     -0.44824968    -16.97379596    -0.68248980
   G2-80     -99.47416876    -17.63524747    -17.55539366    -0.75711800    -0.36716085     -0.48221500    -17.69800678    -0.72227881
   G2-81     -99.42035536    -17.67480275    -17.58572364    -0.77224082    -0.36941553     -0.48251518    -17.72877513    -0.73627190
   G2-82     -99.92008319    -18.38082703    -18.26968476    -0.82209688    -0.40272781     -0.51991469    -18.43245141    -0.77608722
   G2-83    -132.17566610    -22.79154080    -22.71287938    -0.95276898    -0.45634055     -0.60766493    -22.88621421    -0.91629903
   G2-84    -132.15168259    -22.80421867    -22.72053233    -0.95491277    -0.45525427     -0.60611979    -22.89358875    -0.91783430
   G2-85    -132.11165128    -22.82141289    -22.73614298    -0.96811178    -0.45891513     -0.60829507    -22.90809502    -0.93092919
   G2-86    -132.06948961    -22.84737291    -22.75251648    -0.98326519    -0.46172752     -0.61108554    -22.92574464    -0.94497765
   G2-87    -132.11891265    -22.82426916    -22.73310615    -0.97264718    -0.46032097     -0.61109403    -22.90906328    -0.93295570
   G2-88    -132.56744828    -23.57293420    -23.44899730    -1.03649121    -0.49551814     -0.64756489    -23.64568072    -0.98549367
   G2-89    -132.62126502    -23.53752440    -23.42493623    -1.01955262    -0.49192469     -0.64504026    -23.61877241    -0.97184040
   G2-90    -133.06451723    -24.28150586    -24.13739356    -1.08326325    -0.52721864     -0.68232560    -24.35075562    -1.02446457
   G2-91    -133.06839955    -24.27808946    -24.13388922    -1.08411280    -0.52767897     -0.68337281    -24.34812590    -1.02529027
   G2-92    -165.20774430    -28.76450128    -28.63580766    -1.24406773    -0.58543253     -0.77070312    -28.85904151    -1.19301177
   G2-93    -197.55273607    -33.21379489    -33.10956494    -1.37380100    -0.63848458     -0.85464882    -33.35328415    -1.32947527
   G2-94    -212.01677694    -25.98073880    -25.96812854    -0.88149176    -0.46260442     -0.60500157    -26.15263497    -0.86438519
   G2-95    -301.22113141    -35.68849232    -35.68845205    -1.17599382    -0.61666082     -0.80848798    -35.93539520    -1.16042145
   G2-96    -897.13180953    -60.93698360    -60.63044294    -1.58888967    -0.39554741     -0.52419861    -61.14548909    -1.55677851
   G2-97   -1328.88536373    -88.10150259    -87.67004028    -2.23473430    -0.51778847     -0.69241423    -88.41022018    -2.19752683
   G2-98     -81.69987060    -13.55209562    -13.50081776    -0.57414819    -0.29123492     -0.37940669    -13.60978870    -0.54696710
   G2-99    -114.00773407    -17.96004324    -17.93326687    -0.70310182    -0.34335692     -0.46708274    -18.05770769    -0.68312920
   G2-100   -214.59499198    -29.15434883    -29.21225771    -1.07665172    -0.55836791     -0.76591110    -29.39377159    -1.05748621
   G2-101   -214.63738312    -29.10881289    -29.16809324    -1.06954115    -0.55842929     -0.76633448    -29.35127658    -1.05087717
   G2-102   -302.67150814    -27.64554582    -27.47294146    -0.87765192    -0.25744979     -0.32866940    -27.72625805    -0.83923694
   G2-103   -166.52777360    -22.30979221    -22.32699395    -0.80344256    -0.41451413     -0.55989154    -22.47358340    -0.78932733
   G2-104   -199.66885506    -28.19959355    -28.18710933    -1.06061673    -0.53882443     -0.72232242    -28.38707087    -1.03297685
   G2-105   -181.08478093    -26.96794963    -26.93076651    -1.05683466    -0.52768701     -0.70359728    -27.12611144    -1.02427700
   G2-106   -114.36117773    -18.72408439    -18.66653808    -0.78320743    -0.38300671     -0.50671332    -18.80629319    -0.75332410
   G2-107   -161.23050647    -23.40903098    -23.45104701    -0.84226911    -0.41123575     -0.58573003    -23.58521446    -0.83612190
   G2-108   -114.84149309    -19.44599301    -19.36342345    -0.83404736    -0.41565712     -0.54154905    -19.52338978    -0.79399993
   G2-109   -114.84923871    -19.45043030    -19.36696261    -0.83513548    -0.41567815     -0.54178920    -19.52651037    -0.79520985
   G2-110   -132.55761197    -19.22069833    -19.22492400    -0.71684239    -0.35606092     -0.48497152    -19.35113588    -0.70228027
   G2-111   -132.94758099    -19.97400372    -19.94095413    -0.78944958    -0.39368681     -0.52403790    -20.08556910    -0.76420693
   G2-112   -133.00659120    -19.96293112    -19.93235001    -0.77783800    -0.39027899     -0.52044647    -20.07736776    -0.75272408
   G2-113   -199.23632899    -27.43412827    -27.45226013    -0.99214765    -0.50240550     -0.68501858    -27.62930327    -0.97525270
   G2-114   -133.42580100    -20.71398828    -20.65014218    -0.84329737    -0.42603357     -0.55731482    -20.81394123    -0.80825105
   G2-115   -133.42114782    -20.70049340    -20.63951218    -0.84008009    -0.42600604     -0.55727692    -20.80511345    -0.80453092
   G2-116   -438.82421292    -36.77922457    -36.60696951    -1.13636603    -0.36271449     -0.48303677    -36.90763853    -1.10594721
   G2-117   -505.92975029    -45.71373173    -45.55405383    -1.47098105    -0.54642229     -0.72961620    -45.92332779    -1.42974252
   G2-118   -439.30554873    -37.49186441    -37.29300878    -1.18730266    -0.39541511     -0.51729459    -37.61432927    -1.14588290
   G2-119   -439.30312518    -37.49160521    -37.29553378    -1.18655342    -0.39503560     -0.51751342    -37.61544289    -1.14579924
   G2-120   -155.51988477    -21.43116649    -21.40377572    -0.78735740    -0.39769079     -0.52612597    -21.55784189    -0.76675023
   G2-121   -498.52941805    -39.66194848    -39.45148072    -1.20501245    -0.39861839     -0.52098010    -39.79191118    -1.16547201
   G2-122   -498.07724736    -38.91575818    -38.73922918    -1.14147715    -0.36397968     -0.48524226    -39.05836323    -1.11341973
   G2-123   -146.70437298    -23.11208589    -23.08778614    -0.89779516    -0.43273267     -0.59337510    -23.24264137    -0.87607005
   G2-124   -166.15637901    -25.86943272    -25.80550096    -1.03996640    -0.51455057     -0.68205333    -26.00204432    -1.00190553
   G2-125   -199.67550523    -28.22067918    -28.20274098    -1.06531781    -0.53830388     -0.72009188    -28.40144440    -1.03795109
   G2-126   -222.21663223    -29.67369053    -29.66173907    -1.07179691    -0.54511387     -0.72648864    -29.86932948    -1.04824663
   G2-127   -564.78080480    -47.13505645    -46.98259627    -1.42349345    -0.51225666     -0.68843458    -47.35488225    -1.39272116
   G2-128   -531.67341873    -45.56319459    -45.31963002    -1.46613186    -0.52308654     -0.68339611    -45.71067886    -1.41377657
   G2-129   -166.57765193    -26.61130347    -26.51485861    -1.10515437    -0.55085344     -0.72050357    -26.73023398    -1.05726889
   G2-130   -166.57005105    -26.60176029    -26.50795047    -1.10109496    -0.55030768     -0.71935408    -26.72447853    -1.05266743
   G2-131   -147.98822201    -25.33638818    -25.22262524    -1.09524850    -0.54087784     -0.70551339    -25.43438552    -1.04245472
   G2-132   -198.35379960    -30.34349197    -30.29956888    -1.19733459    -0.57446748     -0.77471169    -30.51146066    -1.16591255
   G2-133   -504.22267445    -47.14490911    -46.96566543    -1.54452036    -0.54421606     -0.73645619    -47.33328478    -1.50767242
   G2-134   -179.76932032    -29.10610983    -29.03731323    -1.19240150    -0.56355963     -0.75669062    -29.24374050    -1.15661316
   G2-135   -212.49317162    -34.27068247    -34.19688510    -1.38469504    -0.65166348     -0.87766283    -34.43869454    -1.34566200
   G2-136     -0.47585118     -0.65738702     -0.64753419    -0.04321542    -0.03243345     -0.03929309     -0.66034127    -0.03568470
   G2-137   -372.75887448    -25.34353116    -25.20692116    -0.62598246    -0.12962362     -0.15559351    -25.42311783    -0.61582808
   G2-138    -65.55686109    -10.60905449    -10.59362600    -0.38700788    -0.19150471     -0.24581741    -10.66516288    -0.38167323
   G2-139    -66.05671089    -11.35442510    -11.31395974    -0.45523601    -0.22601051     -0.28450615    -11.40201286    -0.43982107
   G2-140   -132.77341874    -19.57642898    -19.55822243    -0.74023927    -0.37583288     -0.49001917    -19.69474547    -0.72238744
   G2-141   -100.02054394    -14.44080338    -14.41828510    -0.54497872    -0.28565616     -0.36156892    -14.52439266    -0.53011949
   G2-142   -100.03715977    -14.42215582    -14.39175400    -0.54061639    -0.28337478     -0.35346088    -14.50167524    -0.52437061
   G2-143   -133.18723224    -20.32093054    -20.25982695    -0.80166085    -0.40786083     -0.51604742    -20.41977701    -0.77268352
   G2-144   -405.90572764    -31.24028337    -31.07718558    -0.88684533    -0.25357872     -0.31916543    -31.34076369    -0.86495077
   G2-145    -66.51023812    -12.11301832    -12.03963408    -0.52154519    -0.26033856     -0.32113305    -12.14796220    -0.49518796
   G2-146    -99.65823033    -18.01304583    -17.90954614    -0.78369642    -0.38472862     -0.48424613    -18.06694991    -0.74494941
   G2-147   -132.80756923    -23.91195612    -23.77750446    -1.04617594    -0.50956318     -0.64795405    -23.98494020    -0.99486716
   G2-148   -181.23820680    -22.86561315    -22.97266742    -0.78099664    -0.42224899     -0.57718253    -23.09392723    -0.78124220
   G2-149   -132.16128226    -22.78499246    -22.70974868    -0.95415687    -0.45692031     -0.60795379    -22.88147342    -0.91787420
   G2-150   -165.32038869    -28.69460856    -28.58247198    -1.21618780    -0.58151179     -0.77122146    -28.80728679    -1.16688254
   G2-151   -165.72064673    -29.49609092    -29.33321675    -1.30193924    -0.62055809     -0.80972906    -29.58316494    -1.23745947
   G2-152   -166.20896519    -30.18217302    -30.00502747    -1.34442098    -0.65177837     -0.84482974    -30.26909713    -1.27281436
   G2-153   -166.21648677    -30.17484397    -29.99693126    -1.34730099    -0.65324449     -0.84814663    -30.26381086    -1.27550752
   G2-154   -197.97357779    -33.92091295    -33.78887951    -1.43568303    -0.67473017     -0.89766214    -34.05053706    -1.38054087
   G2-155   -197.97107202    -33.92627131    -33.79067242    -1.43592143    -0.67410267     -0.89592112    -34.05299444    -1.38034580
   G2-156   -198.86491847    -35.40569581    -35.20685458    -1.56544200    -0.74578992     -0.97276459    -35.51058855    -1.48758247
   G2-157   -199.35330255    -36.08289259    -35.87275535    -1.60558365    -0.77631230     -1.00731082    -36.18740259    -1.52119085
   G2-158   -199.35294821    -36.07918548    -35.86922497    -1.60790722    -0.77757112     -1.00984062    -36.18458534    -1.52375939
   G2-159   -230.69805536    -39.11535908    -38.97916765    -1.63609604    -0.76342507     -1.01800945    -39.27368944    -1.57892364
   G2-160   -232.49729737    -41.98395417    -41.74078636    -1.86677410    -0.90085339     -1.16979404    -42.10618519    -1.76955521
   G2-161   -263.36965226    -44.23489252    -44.10409928    -1.82852837    -0.85365558     -1.14956196    -44.42704612    -1.77041507
   G2-162   -265.64194893    -47.88434922    -47.60823047    -2.12790974    -1.02538857     -1.33228229    -48.02413245    -2.01792536
   G2-163   -328.77170989    -54.68063434    -54.52399333    -2.25189959    -1.03568271     -1.39431962    -54.92016092    -2.18504651
   G2-164   -328.75325493    -54.62779095    -54.49638430    -2.24868215    -1.03898221     -1.40579516    -54.88711921    -2.18355166
   G2-165   -232.81596882    -34.11020212    -34.06233076    -1.32268352    -0.66275312     -0.88275334    -34.31439145    -1.28180088
   G2-166   -199.72844011    -32.50811926    -32.37815256    -1.36795956    -0.67617350     -0.88475140    -32.64625815    -1.30703974
   G2-167   -245.62204527    -40.19611283    -40.08936086    -1.65145142    -0.77681776     -1.04035783    -40.38167994    -1.60002071
   G2-168   -264.20400081    -41.45150215    -41.36501395    -1.65962706    -0.78730928     -1.05621420    -41.66094139    -1.61320294
   G2-169   -198.82281714    -31.01531563    -30.95681546    -1.23521751    -0.60473681     -0.80864335    -31.18278878    -1.19656465
   G2-170   -199.22909670    -31.81943691    -31.70649914    -1.31973240    -0.64347998     -0.84633641    -31.96012426    -1.26542979
   G2-171   -231.95597495    -36.98928198    -36.87354030    -1.52000420    -0.73230794     -0.97141235    -37.15764707    -1.46322811
   G2-172   -330.45085957    -48.89284534    -48.86289077    -1.86768595    -0.89916483     -1.22631040    -49.19346068    -1.82766637
   G2-173   -227.43571924    -35.33060916    -35.28456012    -1.39584802    -0.66443675     -0.89967834    -35.52536910    -1.36182313
   G2-174   -572.53260912    -54.01348802    -53.86489876    -1.76342570    -0.69539842     -0.93369020    -54.29582320    -1.71652983
   G2-175   -629.30220853    -60.39548206    -60.16266693    -2.02027548    -0.76009465     -1.02090361    -60.63420839    -1.96963668
   G2-176   -227.52742898    -35.23658061    -35.19667949    -1.36546623    -0.65713405     -0.90150898    -35.43393843    -1.33307167
   G2-177   -227.43558931    -35.32096226    -35.27934432    -1.39525080    -0.66506173     -0.90144421    -35.51845654    -1.36180228
   G2-178   -198.38909712    -30.27044344    -30.24005218    -1.16971266    -0.56836859     -0.77349767    -30.44830479    -1.14012990
   G2-179   -198.85174678    -31.02410942    -30.96274985    -1.23533419    -0.60394953     -0.80804420    -31.18919343    -1.19560293
   G2-180   -332.20484364    -47.50149248    -47.47003800    -1.80253348    -0.89927575     -1.20835943    -47.80611740    -1.75707201
   G2-181   -504.66530422    -47.86525671    -47.64957817    -1.60207078    -0.57755050     -0.77043237    -48.03714094    -1.55382178
   G2-182   -180.29920105    -29.75975579    -29.66681053    -1.22482723    -0.59231634     -0.79223025    -29.89333352    -1.17900208
   G2-183   -199.29914106    -31.77198257    -31.67466795    -1.30166325    -0.63924770     -0.84469193    -31.92230380    -1.25072666
   G2-184   -199.29659065    -31.76305903    -31.66653759    -1.30042457    -0.63955600     -0.84610468    -31.91333953    -1.24973271
   G2-185   -265.88326924    -40.04178854    -39.94552380    -1.60051341    -0.79192787     -1.04718092    -40.25510347    -1.54354355
   G2-186   -505.11183234    -48.60676325    -48.35923213    -1.66697225    -0.61326893     -0.80839948    -48.76737570    -1.60765303
   G2-187   -564.83172891    -51.45341557    -51.17736932    -1.72967667    -0.64889498     -0.84913704    -51.62256973    -1.66412432
   G2-188   -564.81801608    -51.46372491    -51.18713754    -1.72723085    -0.64764290     -0.84592096    -51.62884245    -1.66207818
   G2-189   -180.64847870    -30.56152789    -30.42682907    -1.31379755    -0.63336012     -0.83118494    -30.67470106    -1.25503621
   G2-190   -314.03332650    -46.85753135    -46.81610811    -1.86161347    -0.93275004     -1.25499212    -47.15156818    -1.80396390
   G2-191   -199.71881448    -32.50305090    -32.37639114    -1.36209061    -0.67463746     -0.88149145    -32.64381370    -1.30080237
   G2-192   -266.36941465    -40.72788435    -40.61731567    -1.64418815    -0.82352244     -1.08350072    -40.93971076    -1.58075586
   G2-193   -505.60613088    -49.28143101    -49.01721974    -1.71270882    -0.64612446     -0.84641569    -49.44261250    -1.64554280
   G2-194   -878.13481283    -74.29898398    -73.92610763    -2.33429353    -0.76169778     -1.00542074    -74.55318612    -2.26163761
   G2-195   -181.14889029    -31.24488086    -31.09433468    -1.36017714    -0.66601937     -0.86967228    -31.35859999    -1.29426219
   G2-196   -402.11297362    -45.38364443    -45.11444548    -1.66371580    -0.62996367     -0.81619379    -45.51938542    -1.58746758
   G2-197   -537.36811497    -53.04766805    -52.83600290    -1.80618361    -0.66876696     -0.89915571    -53.25445961    -1.75638938
   G2-198   -212.91157404    -35.00179441    -34.90193577    -1.45218545    -0.68833280     -0.91990585    -35.15997036    -1.40333011
   G2-199   -232.37418026    -37.72481489    -37.57715819    -1.58307113    -0.76882982     -1.00984747    -37.88380069    -1.51567101
   G2-200   -232.44164585    -37.67465495    -37.54391614    -1.56332838    -0.76392074     -1.00732598    -37.84253856    -1.49953940
   G2-201   -299.11384703    -45.91004762    -45.79668967    -1.84577113    -0.91221210     -1.20865024    -46.15142299    -1.77915098
   G2-202   -538.25307159    -54.51260841    -54.23053570    -1.93004578    -0.73845662     -0.97160137    -54.69119763    -1.85766168
   G2-203   -213.79153043    -36.46935710    -36.29979402    -1.57725502    -0.75874135     -0.99461384    -36.60080826    -1.50536133
   G2-204   -232.86440203    -38.39715054    -38.23716431    -1.62703598    -0.80129540     -1.04842874    -38.55815685    -1.55295064
   G2-205   -375.93345893    -52.61402746    -52.54988578    -1.95850100    -0.94841539     -1.26582581    -52.91935083    -1.91617071
   G2-206   -375.93202152    -52.61404114    -52.55041479    -1.95828071    -0.94848490     -1.26607530    -52.91942363    -1.91611043
   G2-207   -286.74345478    -42.91393917    -42.82999259    -1.66608661    -0.79347547     -1.06035266    -43.13646517    -1.62282163
   G2-208   -266.01626431    -44.29834513    -44.10614843    -1.88644691    -0.92507288     -1.20942874    -44.47698336    -1.79962193
   G2-209   -765.22634780    -73.09401258    -72.99850439    -2.17016049    -0.94707022     -1.24692909    -73.54338722    -2.14867490
   G2-210   -908.94019456    -85.36362281    -85.31961926    -2.55454752    -1.15521349     -1.53231349    -85.94512880    -2.53110078
   G2-211  -1272.55397755    -90.47808341    -90.07628838    -2.32004505    -0.37880996     -0.53874930    -90.80130986    -2.30422248
   G2-212   -572.47714257    -49.66883407    -49.65276875    -1.46208009    -0.56361988     -0.78795377    -50.00834442    -1.45103443
   G2-213  -1236.52149649    -80.02742251    -79.65250203    -1.95032779    -0.39024257     -0.52734161    -80.31741996    -1.92725169
   G2-214  -1680.74304931   -113.54166681   -113.03612144    -2.86879653    -0.65163506     -0.88216796   -113.98751948    -2.82672162
   G2-215  -2478.03162647   -160.32748372   -159.53574264    -3.93816661    -0.78386565     -1.05630127   -160.90034820    -3.87979026
   G2-216  -1369.77435131    -96.51388583    -96.20277985    -2.52838438    -0.69310050     -0.95290478    -96.97744028    -2.49911011
   G2-217  -1614.13810137   -105.22359229   -104.71123536    -2.57746777    -0.50356579     -0.67770486   -105.59760866    -2.54284556
   G2-218  -1609.07579408   -105.01784879   -104.54940837    -2.57565490    -0.51027316     -0.69697024   -105.41787115    -2.54754258
   G2-219  -1132.63319026    -75.40979959    -75.03555101    -1.84763497    -0.33983808     -0.45600982    -75.66852461    -1.82396168
   G2-220   -732.97393522    -62.85861443    -62.73086663    -1.82326312    -0.73831701     -0.97428687    -63.20539306    -1.80155336
   G2-221   -601.95786436    -70.68888452    -70.70148055    -2.31437973    -1.20409100     -1.58358957    -71.18836920    -2.28988470
   G2-222   -300.95714827    -35.30852508    -35.32013824    -1.13741974    -0.60115193     -0.77400797    -35.55772192    -1.13037158
   G2-223   -197.27973537    -32.83405337    -32.73975547    -1.33370932    -0.62176851     -0.82050312    -32.97826916    -1.29621786
#TMD-BE3       E[noXC]         X Energy HF   X Energy DFT     C Energy GGA  C Energy PT2os   C Energy osRPA   X Energy SCAN     C Energy SCAN
 Cr2-BE3     -2009.12074428     -94.94417432    -95.51074671    -2.07948012    -0.80358463	-1.48230634    -96.03068748    -2.11623877
  V2-BE3     -1811.54895039     -88.78482109    -89.08349673    -1.95080115    -0.74321629	-1.13359205    -89.60802464    -1.97794884
 Fe2-BE3     -2440.75384735    -109.48930021   -109.63189375    -2.26771848    -0.98494622	-1.09986944   -110.26163364    -2.30255193
  Cr-BE3     -1004.34229130     -48.07098706    -48.00023496    -0.98364435    -0.41961978	-0.34303041    -48.31513661    -0.99192177
   V-BE3      -905.80874107     -44.57741121    -44.46446633    -0.92813758    -0.32556944	-0.35410808    -44.77276261    -0.93963196
  Fe-BE3     -1220.40984982     -54.83362447    -54.75926802    -1.11189205    -0.43774196	-0.47292825    -55.08179434    -1.13143992
#TM-BE13           E[noXC]         X Energy HF   X Energy DFT     C Energy GGA  C Energy PT2os   C Energy osRPA   X Energy SCAN     C Energy SCAN
   TiCl-BE13   -1247.25618160     -69.16824179     -68.94775726   -1.55189867   -0.45256520   -0.50305238     -69.46822744    -1.54475476
    VF5-BE13   -1353.99254020     -94.50952376     -94.76793787   -2.55290534   -1.22490053   -1.69496682     -95.40237969    -2.54190431
   CrCl-BE13   -1438.50982188     -75.71994050     -75.51647359   -1.66640734   -0.54428461   -0.55088778     -76.06706671    -1.66225991
   CrOF-BE13   -1160.95618934     -66.00574497     -66.10678955   -1.60095514   -0.72133258   -0.91726419     -66.52611250    -1.60572462
CoC4O4H-BE13   -1736.54602349    -111.83493843    -112.22746959   -3.15484070   -1.47830021   -2.15896941    -112.88091471    -3.15231288
 FeC5O5-BE13   -1718.23760836    -121.22686171   -121.60973989    -3.52062721   -1.65174495   -2.40245891    -122.33205346    -3.51504489
     VS-BE13   -1279.91010278     -69.72152128    -69.61106442    -1.56896189   -0.48734136   -0.56028851     -70.11069500    -1.56838426
    CuH-BE13   -1593.43037094     -66.55071618    -66.63842168    -1.37500527   -0.56503110   -0.76671758     -66.97723077    -1.39410915
   CuCl-BE13   -2027.26109977     -93.98127890    -93.90943781    -2.02238128   -0.67908313   -0.91423934     -94.48251693    -2.03145310
     VO-BE13    -972.58243190     -52.74009355    -52.79353835    -1.22178941   -0.51469281   -0.62844615     -53.12954704    -1.22823167
   NiCl-BE13   -1897.69133038     -90.14362833    -90.03021136    -1.95465646   -0.54109593   -0.73260870     -90.61084358    -1.96120819
  CO_di-BE13     -99.57280365     -13.31643679    -13.32945043    -0.44942765   -0.22874807   -0.31696430     -13.41070924    -0.44641463
     Ti-BE13    -813.22928700     -41.38042272    -41.25468756    -0.87431303   -0.28464583   -0.32808866     -41.54209935    -0.88383347
     Cl-BE13    -434.08034901     -27.64543878    -27.49779006    -0.64346610   -0.13299661   -0.15816929     -27.73096544    -0.63586368
      V-BE13    -905.80874107     -44.57741121    -44.46446633    -0.92813758   -0.32556944   -0.35410808     -44.77276261    -0.93963196
      F-BE13     -89.53064645     -10.02223254     -9.99656975    -0.29037216   -0.16346878   -0.18548076     -10.06979940    -0.28978730
      O-BE13     -66.70271977      -8.19770031     -8.16383495    -0.23387377   -0.13821803   -0.13450872      -8.22248625    -0.23473505
     Fe-BE13   -1220.40984982     -54.83362447    -54.75926802    -1.11189205   -0.43774196   -0.47292825     -55.08179434    -1.13143992
     Co-BE13   -1338.00114229     -58.46592041    -58.41705730    -1.18225848   -0.46519917   -0.54055526     -58.75752956    -1.20347032
      H-BE13      -0.19102882      -0.30868435     -0.30309962    -0.00579945   -0.01808092    0.00000000      -0.30912620    -0.00000006
     Ni-BE13   -1463.79390051     -62.28778010    -62.25314588    -1.25508105   -0.38729183   -0.49238502     -62.62615734    -1.27671928
     Cu-BE13   -1593.13431835     -66.29169938    -66.35514159    -1.34085006   -0.54672032   -0.71620996     -66.68719664    -1.36435353
     Cr-BE13   -1004.34229129     -48.07098707    -48.00023496    -0.98364435   -0.41961978   -0.34303041     -48.31513660    -0.99192177
      S-BE13    -374.11959074     -25.11134556    -24.97725139    -0.58347755   -0.11153963   -0.11764077     -25.18533721    -0.57918886
      C-BE13     -32.65369717      -5.06153279     -5.02546362    -0.14421175   -0.08434322   -0.07148394      -5.06463620    -0.14604109
#G2RC       E[noXC]       X Energy HF    X Energy DFT   C Energy GGA  C Energy PT2os  C Energy osRPA   X Energy SCAN     C Energy SCAN
 100-G2RC   -114.00165065    -17.96665851    -17.93893577    -0.70333471    -0.34326892 	-0.46662279     -18.06366620    -0.68329553
 104-G2RC   -166.52552292    -22.31223995    -22.32907739    -0.80356366    -0.41449104 	-0.55975400     -22.47579462    -0.78941160
 106-G2RC   -181.07513270    -26.97820190    -26.93973174    -1.05734117    -0.52762586 	-0.70315302     -27.13552750    -1.02465767
 113-G2RC   -133.00089124    -19.96893633    -19.93765103    -0.77812290    -0.39024992 	-0.52019569     -20.08292762    -0.75294339
 117-G2RC   -438.81976630    -36.78384585    -36.61114777    -1.13651294    -0.36269834 	-0.48290056     -36.91198798    -1.10606730
 118-G2RC   -505.91800228    -45.72664555    -45.56509164    -1.47176588    -0.54635553 	-0.72902076     -45.93507954    -1.43029619
  11-G2RC    -48.56427880     -7.65591899     -7.63653947    -0.31544004    -0.16753319 	-0.21871460      -7.69512437    -0.30133548
 121-G2RC   -155.51399408    -21.43745612    -21.40923205    -0.78767980    -0.39764726 	-0.52581046     -21.56358883    -0.76699656
 126-G2RC   -199.67063753    -28.22582910    -28.20727128    -1.06556864    -0.53828149 	-0.71988844     -28.40618038    -1.03814889
 128-G2RC   -564.77555364    -47.13816804    -46.98622156    -1.42356039    -0.51238022 	-0.68865269     -47.35831363    -1.39284203
  13-G2RC    -67.13922285     -8.92297869     -8.92209119    -0.32603934    -0.17836231 	-0.23508474      -8.98281662    -0.31752443
  14-G2RC    -89.67190778    -10.39326602    -10.39324483    -0.33630900    -0.18550908 	-0.24105633     -10.46285000    -0.33157285
  18-G2RC   -269.52657267    -21.73019707    -21.58985078    -0.61603510    -0.13369517 	-0.16703451     -21.79314439    -0.59030646
   1-G2RC     -0.47545269     -0.65780352     -0.64791750    -0.04322102    -0.03243192 	-0.03928310      -0.66074006    -0.03568863
  21-G2RC   -373.01739656    -25.69386085    -25.55712640    -0.66717471    -0.14738075 	-0.19281731     -25.77908061    -0.65072248
  22-G2RC   -432.23552706    -27.86992853    -27.72037998    -0.68726716    -0.15117882 	-0.19746837     -27.96054080    -0.67286408
  23-G2RC    -11.31754245     -3.55088606     -3.51315598    -0.12424212    -0.02306794 	-0.03300466      -3.55231509    -0.11828276
  24-G2RC    -95.04433916    -11.94099429    -11.93590030    -0.37776200    -0.18363944 	-0.24381936     -12.02090397    -0.37569437
  25-G2RC    -65.86194484    -10.98454266    -10.96449873    -0.43076171    -0.20716764 	-0.28492166     -11.03947471    -0.41875745
  26-G2RC    -66.32168234    -11.73838864    -11.68969411    -0.49562769    -0.24280918 	-0.32012184     -11.78240836    -0.47347594
  30-G2RC    -99.47063034    -13.30878442    -13.32007869    -0.44971752    -0.22856424 	-0.31633834     -13.40182955    -0.44654407
  32-G2RC    -99.85043137    -14.05995584    -14.06025897    -0.51627808    -0.26631716 	-0.35941711     -14.15491477    -0.50384943
  33-G2RC   -100.27366659    -14.81596577    -14.78458143    -0.58248511    -0.30181971 	-0.39536149     -14.89759162    -0.56028039
  34-G2RC    -95.87019028    -13.11340302    -13.13433301    -0.45308375    -0.23072576 	-0.32493304     -13.21092521    -0.44952917
  39-G2RC   -178.85024811    -19.90880933    -19.96816376    -0.61505699    -0.34413059 	-0.46392091     -20.08953869    -0.61335440
  40-G2RC   -166.11509767    -21.58751788    -21.63234428    -0.74125308    -0.37888153 	-0.52326148     -21.76337936    -0.73550126
  45-G2RC   -863.97007421    -55.02098358    -54.75461060    -1.32596435    -0.27273313 	-0.36527710     -55.21279977    -1.30937905
  47-G2RC   -335.32980281    -28.50745019    -28.45243592    -0.77781205    -0.21467901 	-0.30491427     -28.65970444    -0.77685519
  51-G2RC   -521.39791036    -37.50170308    -37.39381326    -0.97113655    -0.30818806 	-0.41259469     -37.68445397    -0.96224652
  52-G2RC   -538.58072415    -42.78137398    -42.51861159    -1.19524126    -0.23687690 	-0.30026675     -42.91027483    -1.15184817
  56-G2RC   -505.87579060    -41.41336240    -41.37803801    -1.17154382    -0.41442780 	-0.58328690     -41.67739710    -1.16488279
  57-G2RC   -289.15407262    -34.17819300    -34.15695024    -1.09251126    -0.56531162 	-0.73883621     -34.39770602    -1.08218660
  58-G2RC  -1316.80709325    -86.55479086    -86.10163535    -2.15760712    -0.46671638 	-0.62104797     -86.84462922    -2.11954167
  59-G2RC   -492.10468478    -48.50872305    -48.42849594    -1.40806266    -0.55456426 	-0.73062691     -48.78917126    -1.39805595
  60-G2RC  -1519.80540584   -100.90355739   -100.36557269    -2.47294907    -0.45020840 	-0.59627490    -101.23810271    -2.43159639
  61-G2RC   -390.41454040    -45.40518279    -45.41312243    -1.47195202    -0.77027552 	-1.01023481     -45.72388883    -1.45730435
  62-G2RC  -1760.63653132   -115.25896979   -114.70413655    -2.88165280    -0.64078594 	-0.86289741    -115.66939532    -2.83946937
  66-G2RC   -626.35046153    -60.82061487    -60.71109492    -1.78405246    -0.74587141 	-0.97793021     -61.16996994    -1.76724203
  67-G2RC  -1996.57961700   -130.64901161   -129.95536613    -3.20706840    -0.61197142 	-0.81394163    -131.08443692    -3.15204340
  68-G2RC   -162.46340384    -21.28093060    -21.37102860    -0.74389725    -0.38681346 	-0.54909964     -21.48410704    -0.74109287
   6-G2RC    -33.11422445     -5.77710928     -5.74447442    -0.22418702    -0.11544994 	-0.14996862      -5.79433011    -0.21087936
  73-G2RC   -245.53137387    -28.02689273    -28.13695748    -0.89115658    -0.49578805 	-0.67673814     -28.30126557    -0.89008938
  82-G2RC    -99.41070721    -17.68482401    -17.59473721    -0.77274155    -0.36940767 	-0.48223298     -17.73814383    -0.73669223
  88-G2RC   -132.10763035    -22.83602905    -22.74363414    -0.97323200    -0.46029754 	-0.61068652     -22.92001116    -0.93344700
   8-G2RC    -33.63096396     -6.58083702     -6.53537847    -0.30098255    -0.15439436 	-0.19635734      -6.59779777    -0.28060273
  94-G2RC   -197.53517749    -33.23209729    -33.12589404    -1.37476507    -0.63844463 	-0.85398817     -33.37028391    -1.33027897
  97-G2RC   -897.13060181    -60.93822743    -60.63160500    -1.58885106    -0.39553198 	-0.52415895     -61.14672076    -1.55673699
#S22          E[noXC]       X Energy HF    X Energy DFT   C Energy GGA  C Energy PT2os  C Energy osRPA   X Energy SCAN     C Energy SCAN
  1-S22    -97.12452640    -15.31758433    -15.27914117    -0.63332209    -0.00000001    -0.43908818      -15.39620658    -0.60576378
01a-S22    -48.56216409     -7.65810340     -7.63850534    -0.31553283    -0.00000001    -0.21866438       -7.69718326    -0.30140135
  2-S22   -134.27002161    -17.85949383    -17.85715841    -0.65531596    -0.00000001    -0.47143700      -17.97896014    -0.63878631
02a-S22    -67.13506398     -8.92749146     -8.92593715    -0.32621384    -0.00000001    -0.23481682       -8.98687774    -0.31762906
  3-S22   -333.04111197    -44.64899665    -44.68248691    -1.61889533    -0.00000001    -1.12566625      -44.97847599    -1.59098067
03a-S22   -166.53689516    -22.29718170    -22.31651455    -0.80327266    -0.00000001    -0.56092901      -22.46234907    -0.78938745
  4-S22   -295.86446833    -42.14371804    -42.13895524    -1.59880774    -0.00000001    -1.09126012      -42.42675754    -1.56091793
04a-S22   -147.94319552    -21.05198670    -21.05140834    -0.79464705    -0.00000001    -0.54366572      -21.19420047    -0.77545971
  5-S22   -721.47675688   -103.74304892   -103.71452320    -3.95014507    -0.00000001    -2.60925679     -104.41673679    -3.86954183
05a-S22   -360.74766839    -51.84999924    -51.83814227    -1.97006817    -0.00000001    -1.30274150      -52.18791925    -1.92951238
  6-S22   -539.68418096    -83.81668179    -83.68883092    -3.34551515    -0.00000001    -2.15244668      -84.27663902    -3.25805668
06a-S22   -279.14589918    -42.51450723    -42.46556348    -1.67144575    -0.00000001    -1.08322932      -42.76008537    -1.62977721
06b-S22   -260.55800865    -41.26758776    -41.18951291    -1.66358706    -0.00000001    -1.06249007      -41.48115031    -1.61708634
  7-S22   -797.74720176   -118.56910946   -118.48055097    -4.62847689    -0.00000001    -3.01856659     -119.28881519    -4.52508862
07a-S22   -403.88105592    -60.77529596    -60.73258759    -2.38471416    -0.00000001    -1.54520512      -61.13849347    -2.33366654
07b-S22   -393.88870719    -57.75722237    -57.71300863    -2.23320335    -0.00000001    -1.46642717      -58.11359247    -2.18003409
  8-S22    -67.26174409    -13.16111248    -13.07061444    -0.60246545    -0.00000001    -0.39358618      -13.19539878    -0.56212807
08a-S22    -33.63107079     -6.58072706     -6.53527812    -0.30097839    -0.00000001    -0.19635991       -6.59769355    -0.28059923
  9-S22   -132.65188710    -23.46585948    -23.36994229    -0.99277636    -0.00000001    -0.64316615      -23.55511293    -0.94942633
09a-S22    -66.32915562    -11.73045760    -11.68268395    -0.49523668    -0.00000001    -0.32054085      -11.77506042    -0.47317036
 10-S22   -231.16474978    -39.81233832    -39.66076696    -1.67774367    -0.00000001    -1.05298304      -39.96821648    -1.61350832
10a-S22   -197.54226092    -33.22472215    -33.11938359    -1.37425887    -0.00000001    -0.85425520      -33.36348059    -1.32985844
10b-S22    -33.62648075     -6.58542646     -6.53956877    -0.30115601    -0.00000001    -0.19625121       -6.60214882    -0.28074848
 11-S22   -395.07285137    -66.45314216    -66.24170547    -2.75442704    -0.00000001    -1.71608588      -66.73431537    -2.66611829
11a-S22   -197.54105160    -33.22596264    -33.12052448    -1.37426976    -0.00000001    -0.85422479      -33.36465610    -1.32986837
 12-S22   -454.86260166    -70.64300467    -70.56010671    -2.79646481    -0.00000001    -1.81177556      -71.04325307    -2.73011862
12a-S22   -227.43841896    -35.31740585    -35.27667900    -1.39495023    -0.00000001    -0.90199969      -35.51565969    -1.36155571
 13-S22   -721.46810896   -103.72984294   -103.70039889    -3.94897580    -0.00000001    -2.61380530     -104.40851162    -3.86830603
13a-S22   -360.74120525    -51.85785350    -51.84505123    -1.97015976    -0.00000001    -1.30228937      -52.19519105    -1.92951161
 14-S22   -508.49454363    -83.83034887    -83.59880011    -3.45462912    -0.00000001    -2.15863543      -84.20951520    -3.35191874
14a-S22   -310.96494072    -50.60382580    -50.47882487    -2.07169087    -0.00000001    -1.29326806      -50.83889509    -2.01282230
14b-S22   -197.54106830    -33.22597694    -33.12046375    -1.37438913    -0.00000001    -0.85419365      -33.36461937    -1.32996609
 15-S22   -797.73699244   -118.56134443   -118.46759560    -4.63128597    -0.00000001    -3.02573904     -119.28583154    -4.52743936
15a-S22   -403.88091292    -60.77507523    -60.73244944    -2.38452728    -0.00000001    -1.54568396      -61.13840281    -2.33346294
15b-S22   -393.87696669    -57.77101510    -57.72511659    -2.23348139    -0.00000001    -1.46569332      -58.12630554    -2.18010838
 16-S22   -132.19995938    -22.70560881    -22.63942910    -0.92692905    -0.00000001    -0.60735408      -22.80600742    -0.89344983
16a-S22    -66.32828566    -11.73134913    -11.68349098    -0.49526639    -0.00000001    -0.32052480      -11.77589773    -0.47319646
16b-S22    -65.87577319    -10.96935263    -10.95141124    -0.43023293    -0.00000001    -0.28606240      -11.02562903    -0.41841960
 17-S22   -264.67727933    -42.15295196    -42.04585403    -1.70331803    -0.00000001    -1.09168280      -42.35228189    -1.65074787
17a-S22   -197.54436809    -33.22251558    -33.11743244    -1.37411502    -0.00000001    -0.85434193      -33.36144302    -1.32973897
17b-S22    -67.13666637     -8.92556291     -8.92439206    -0.32617217    -0.00000001    -0.23504570       -8.98525959    -0.31760401
 18-S22   -246.10063907    -40.88605834    -40.76060610    -1.69234632    -0.00000001    -1.07541534      -41.06461988    -1.63425726
18a-S22   -197.54265206    -33.22431110    -33.11902384    -1.37422604    -0.00000001    -0.85427290      -33.36310355    -1.32983124
18b-S22    -48.56218375     -7.65785920     -7.63840352    -0.31555855    -0.00000001    -0.21879718       -7.69708285    -0.30142172
 19-S22   -278.41964206    -45.25269061    -45.15495185    -1.81877046    -0.00000001    -1.16690602      -45.47405236    -1.76785624
19a-S22   -197.54487548    -33.22198118    -33.11696346    -1.37407469    -0.00000001    -0.85436443      -33.36095198    -1.32970556
19b-S22    -80.88207105    -12.02020204    -12.03050706    -0.44030158    -0.00000001    -0.31034587      -12.10403227    -0.43334505
 20-S22   -395.07875264    -66.45284080    -66.24116576    -2.75221679    -0.00000001    -1.71264973      -66.73094346    -2.66405069
20a-S22   -197.54341348    -33.22351580    -33.11831704    -1.37417986    -0.00000001    -0.85430267      -33.36236674    -1.32979282
20b-S22   -197.54538711    -33.22142583    -33.11649662    -1.37400085    -0.00000001    -0.85439638      -33.36045575    -1.32964479
 21-S22   -508.50350282    -83.83129296    -83.59969389    -3.45154592    -0.00000001    -2.15351626      -84.20619036    -3.34896874
21a-S22   -310.96859980    -50.59991591    -50.47536455    -2.07153008    -0.00000001    -1.29343557      -50.83525698    -2.01271534
21b-S22   -197.54388777    -33.22302005    -33.11787669    -1.37415073    -0.00000001    -0.85432134      -33.36190761    -1.32976859
 22-S22   -528.37721456    -82.93648336    -82.75988124    -3.32610007    -0.00000001    -2.11707850      -83.35484082    -3.23396516
22a-S22   -264.19535810    -41.46023531    -41.37305078    -1.65997855    -0.00000001    -1.05604121      -41.66933340    -1.61348883
22b-S22   -264.19535810    -41.46023531    -41.37305078    -1.65997855    -0.00000001    -1.05604121      -41.66933340    -1.61348883
#DC9                E[noXC]             X-HF           X-DFT           C-GGA      C-ssRPA         C-osRPA       X-SCAN        C-SCAN
       13dip-DC9  -195.18395190    -30.82377879    -30.76339871    -1.25670542  -0.00000001    -0.82187774   -30.98445619  -1.21534932
         be4-DC9   -47.48261515    -10.86280576    -10.81115913    -0.41954161  -0.00000001    -0.21239150   -10.90204520  -0.41001538
          be-DC9   -11.90704819     -2.66416263     -2.63652410    -0.08579969  -0.00000001    -0.04161617    -2.65906039  -0.08341814
     c20bowl-DC9  -653.57461538   -103.22847308   -103.27898388    -4.06410260  -0.00000001    -2.61853436  -103.90350648  -4.01722375
     c20cage-DC9  -653.31336807   -103.39017915   -103.40623520    -4.18476959  -0.00000001    -2.67719106  -104.04996147  -4.12214554
   carbooxo1-DC9  -494.30851823    -70.94737190    -71.05123928    -2.60590404  -0.00000001    -1.76117007   -71.47805820  -2.58155368
   carbooxo2-DC9  -494.12813247    -71.09093635    -71.16861313    -2.65731704  -0.00000001    -1.75333983   -71.58179089  -2.63680476
       ch2n2-DC9  -128.92294799    -18.97030567    -19.00299011    -0.71812780  -0.00000001    -0.50185335   -19.11788462  -0.70550344
       ethen-DC9   -66.32168234    -11.73838864    -11.68969411    -0.49562769  -0.00000001    -0.32012032   -11.78240836  -0.47347594
heptahexaene-DC9  -229.76636023    -37.48758686    -37.48876617    -1.47959559  -0.00000001    -0.96177311   -37.72816785  -1.45026929
 heptatriyne-DC9  -229.75937551    -37.53336192    -37.49869307    -1.47895463  -0.00000001    -0.95192087   -37.74379732  -1.44726160
     ISO_E35-DC9  -394.73066150    -66.71715746    -66.41414399    -2.87325843  -0.00000001    -1.73840944   -66.93186154  -2.76492293
     ISO_E36-DC9  -279.14296267    -42.52556129    -42.46660392    -1.67230868  -0.00000001    -1.07813524   -42.76179507  -1.63083056
     ISO_P35-DC9  -394.96352117    -66.46805376    -66.24904917    -2.77727939  -0.00000001    -1.73012729   -66.74409325  -2.68584847
     ISO_P36-DC9  -279.14201343    -42.52128513    -42.47070851    -1.67118491  -0.00000001    -1.08223437   -42.76574488  -1.62936584
        omcb-DC9  -397.72520535    -70.75010585    -70.36059412    -3.14708901  -0.00000001    -1.97162718   -70.97459011  -2.99377142
          s2-DC9  -745.08313798    -50.00436028    -49.78044009    -1.22224950  -0.00000001    -0.29147980   -50.18968719  -1.21274750
          s8-DC9  2980.21279436   -200.15569126   -199.27195133    -5.01754699  -0.00000001    -1.30790861  -200.91454759  -4.96822826
     tmethen-DC9  -198.91515846    -35.32823225    -35.15348621    -1.54574115  -0.00000001    -0.97363622   -35.44737024  -1.47295863
#SIE11              E[noXC]       X Energy HF    X Energy DFT   C Energy GGA  C Energy PT2os  C Energy osRPA   X Energy SCAN     C Energy SCAN
 aceton+-SIE11    -166.13731511    -25.57477682    -25.51471617    -1.00284435    -0.00000001    -0.63173292    -25.71562858    -0.96487861
  acetyl-SIE11    -132.81372576    -19.29647947    -19.28678988    -0.71539593    -0.00000001    -0.48278214    -19.42233231    -0.69439804
    but+-SIE11    -133.02646662    -23.95507140    -23.83956498    -1.04819938    -0.00000001    -0.63036118    -24.05198201    -0.99148359
      bz-SIE11    -197.54867296    -33.21801886    -33.11341915    -1.37388237    -0.00000001    -0.85450332    -33.35726550    -1.32954510
   bz_li-SIE11    -203.07447239    -35.10074056    -34.97305198    -1.45857588    -0.00000001    -0.84990707    -35.24111719    -1.41387154
    c2h4-SIE11     -66.32505792    -11.73473589    -11.68652548    -0.49540157    -0.00000001    -0.32039846    -11.77906141    -0.47330558
 c2h4_f2-SIE11    -245.18112498    -31.63307985    -31.65193646    -1.11067985    -0.00000001    -0.78761794    -31.86523218    -1.08761129
     ch3-SIE11     -33.35855421     -6.21811577     -6.17360260    -0.25975804    -0.00000001    -0.15420539     -6.23392688    -0.24564390
   clclf-SIE11    -953.37154866    -65.00242707    -64.74950348    -1.61637382    -0.00000001    -0.56471508    -65.27465521    -1.60050954
   clfcl-SIE11    -953.40533960    -64.91626525    -64.73432554    -1.63209799    -0.00000001    -0.57620857    -65.24689609    -1.62010479
     clf-SIE11    -521.39121295    -37.50963605    -37.39978592    -0.97186040    -0.00000001    -0.41172775    -37.69088903    -0.96279290
   ethyl-SIE11     -66.50082356    -12.12288126    -12.04846522    -0.52180786    -0.00000001    -0.31497055    -12.15714433    -0.49537585
  ethyl+-SIE11     -66.51186647    -11.82743065    -11.76345170    -0.49985641    -0.00000001    -0.31494392    -11.86792186    -0.47018765
      f2-SIE11    -178.85471693    -19.90318088    -19.96425626    -0.61456658    -0.00000001    -0.46485709    -20.08537531    -0.61295819
   h2o2+-SIE11    -134.24810267    -17.49657622    -17.52810038    -0.62368469    -0.00000001    -0.43624313    -17.64804957    -0.60815736
     h2o-SIE11     -67.13657730     -8.92577546     -8.92452546    -0.32616446    -0.00000001    -0.23497869     -8.98539518    -0.31759876
    h2o+-SIE11     -67.04484957     -8.61556185     -8.59273950    -0.28481380    -0.00000001    -0.18435157     -8.66190425    -0.27619377
    he2+-SIE11      -3.34829101     -1.58131972     -1.59981554    -0.05925034    -0.00000001    -0.05279930     -1.61632059    -0.05819616
      he-SIE11      -1.84362947     -1.01728008     -1.00777866    -0.04137363    -0.00000001    -0.04039777     -1.02349275    -0.03776741
     he+-SIE11      -1.37851517     -0.62094563     -0.60884417    -0.00612848    -0.00000001     0.00000000     -0.62155203     0.00000000
      li-SIE11      -5.65538219     -1.77579326     -1.75477446    -0.05123606    -0.00000001     0.00000000     -1.77816817    -0.04587353
   li_f2-SIE11    -184.49836919    -21.83238441    -21.91945236    -0.67341540    -0.00000001    -0.45532605    -22.06030133    -0.67316409
     mgo-SIE11    -250.21537632    -24.15855663    -24.17648491    -0.68416675    -0.00000001    -0.28055738    -24.33876483    -0.68774749
      na-SIE11    -147.86510396    -13.98826982    -13.93619259    -0.36986209    -0.00000001     0.00000000    -14.04724926    -0.36531628
   naomg-SIE11    -398.05845649    -38.30814096    -38.22565849    -1.07059323    -0.00000001    -0.25463249    -38.51724623    -1.06504734
   nh32+-SIE11     -97.10430730    -15.04659537    -15.02210613    -0.60535306    -0.00000001    -0.39987086    -15.13934634    -0.57870128
 nh3_clf-SIE11    -569.95267854    -45.16690033    -45.05523603    -1.29731593    -0.00000001    -0.64129843    -45.40511187    -1.27494889
     nh3-SIE11     -48.56132304     -7.65897630     -7.63928371    -0.31556776    -0.00000001    -0.21863609     -7.69799792    -0.30142619
    nh3+-SIE11     -48.49861175     -7.40518018     -7.36607690    -0.27634790    -0.00000001    -0.16812562     -7.43415211    -0.26175468
