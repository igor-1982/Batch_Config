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
  0.2, 1.0


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

__optimization function__ :: 25
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a3, a4 = C
    a1  = 0.45
    a2  = 1. - a1
    #a3  = 1. - a4

    E_noXC, Ex_HF, Ex_PBE, Ec_PBE, ospt2, rospt2, Ex_SCAN, Ec_SCAN = P
    return E_noXC + a1*Ex_HF + a2*Ex_SCAN + a3*Ec_SCAN + a4*rospt2
    #return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2
    #return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2 + \
    #	       a5*(Ex_SCAN-Ex_PBE) + a6*(Ec_SCAN-Ec_PBE)

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
 3 TiCl-BE13    -1 Ti-BE13   1 Cl-BE13    1                   0.16060302   00.0000
 3 VF5-BE13     -1 V-BE13    1 F-BE13     5                   0.89902950   00.0000
 3 CrCl-BE13    -1 Cr-BE13   1 Cl-BE13    1                   0.14366305   00.0000
 4 CrOF-BE13    -1 Cr-BE13   1 O-BE13     1 F-BE13 1          0.39454351   00.0000
 3 Fe2Br4-BE13  -1 Fe2-BE13  1 Br-BE13    4                   0.58453252   00.0000
 5 CoC4O4H-BE13 -1 Co-BE13   1 C-BE13     4 O-BE13 4 H-BE13 1 1.96033529   00.0000
 3 NiCH2+-BE13  -1 Ni+-BE13  1 CH2-BE13   1                   0.12159169   00.0000
 3 FeC5O5-BE13  -1 Fe-BE13   1 CO_di-BE13 5                   0.23489666   00.0000
 3 VS-BE13      -1 V-BE13    1 S-BE13     1                   0.17035585   00.0000
 3 CuH-BE13     -1 Cu-BE13   1 H-BE13     1                   0.09975937   00.0000
 3 CuCl-BE13    -1 Cu-BE13   1 Cl-BE13    1                   0.13975873   00.0000
 3 VO-BE13      -1 V-BE13    1 O-BE13     1                   0.24063362   00.0000
 3 NiCl-BE13    -1 Ni-BE13   1 Cl-BE13    1                   0.14023681   00.0000 
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

__xyg3 components__ :: 426
#G2             E[noXC]         X Energy HF    X Energy DFT   C Energy GGA     C PT2os       C osRPA      X_Energy_SCAN  C_Energy_SCAN
# 15+223
     H_0  -0.18942396    -0.31037941    -0.30459630    -0.00582642    0.00000000    0.00000000    -0.31074277    -0.00000006
    Li_0  -5.65188497    -1.77940472    -1.76396208    -0.05125048    0.00000000    0.00000000    -1.78173673    -0.04588509
    Be_0  -11.90628666    -2.66532997    -2.63669730    -0.08592566    0.00000000    -0.04973588    -2.66030211    -0.08322440
     B_0  -20.76600216    -3.76520745    -3.77019291    -0.11262332    0.00000000    -0.06394593    -3.76132704    -0.11411343
     C_0  -32.62307290    -5.06807113    -5.11667046    -0.14404749    0.00000000    -0.07654572    -5.07100472    -0.14581220
     N_0  -47.80902452    -6.59274528    -6.69317421    -0.17917904    0.00000000    -0.08681959    -6.60065353    -0.18018335
     O_0  -66.61942446    -8.19573602    -8.30859460    -0.23389944    0.00000000    -0.13748498    -8.22030909    -0.23453227
     F_0  -89.39378636    -10.01759563    -10.09725120    -0.29048132    0.00000000    -0.19071501    -10.06518476    -0.28969901
    Na_0  -147.85435135    -13.99846736    -13.94976190    -0.37004590    0.00000000    0.00000000    -14.05818585    -0.36535423
    Mg_0  -183.63228558    -15.97696987    -15.91137259    -0.41008452    0.00000000    -0.03924955    -16.03173657    -0.41033412
    Al_0  -223.80210321    -18.07253988    -18.01081676    -0.44487379    0.00000000    -0.05332433    -18.12659745    -0.44599443
    Si_0  -268.56242874    -20.28985353    -20.24667074    -0.48385535    0.00000000    -0.06915914    -20.34724260    -0.48361122
     P_0  -318.07929132    -22.63426489    -22.62209454    -0.52616259    0.00000000    -0.08477050    -22.69698746    -0.52295909
     S_0  -372.48621658    -25.02068575    -24.98645779    -0.58379413    0.00000000    -0.12569706    -25.09165800    -0.57866212
    Cl_0  -431.95333280    -27.53025181    -27.44589287    -0.64400035    0.00000000    -0.16714664    -27.61227415    -0.63527155
    G2-1  -5.84621712    -2.13978016    -2.11620081    -0.08404283    0.00000000    -0.03978978    -2.14461330    -0.07784531
    G2-2  -12.07481303    -3.07571241    -3.05524179    -0.10319949    0.00000000    -0.04587220    -3.07521666    -0.09624983
    G2-3  -32.86629206    -5.41378520    -5.42908656    -0.18448681    0.00000000    -0.12142883    -5.42594054    -0.17849795
    G2-4  -33.07663880    -5.86005222    -5.87864135    -0.21458769    0.00000000    -0.12095381    -5.87219608    -0.20550067
    G2-5  -33.11085292    -5.77984035    -5.74758914    -0.22402570    0.00000000    -0.16216338    -5.79848839    -0.21048581
    G2-6  -33.35770240    -6.21844337    -6.21235175    -0.25938373    0.00000000    -0.16659091    -6.23601393    -0.24513230
    G2-7  -33.62771999    -6.58334400    -6.53860989    -0.30065313    0.00000000    -0.20707586    -6.60200339    -0.28003754
    G2-8  -48.05950856    -6.92199570    -7.00075795    -0.22516423    0.00000000    -0.13717271    -6.94529829    -0.22116338
    G2-9  -48.30953412    -7.27700461    -7.31712332    -0.27078503    0.00000000    -0.18569972    -7.31362683    -0.26192446
   G2-10  -48.55970177    -7.65934435    -7.64094725    -0.31529974    0.00000000    -0.22909171    -7.70028521    -0.30110109
   G2-11  -66.87497133    -8.54767009    -8.61820233    -0.28032002    0.00000000    -0.19311653    -8.59584020    -0.27649363
   G2-12  -67.13105669    -8.93011589    -8.92982778    -0.32609934    0.00000000    -0.24410813    -8.99119611    -0.31746790
   G2-13  -89.66235237    -10.40217503    -10.40232836    -0.33646182    0.00000000    -0.24908612    -10.47262092    -0.33164342
   G2-14  -269.04582655    -20.97878804    -20.86749376    -0.55435821    0.00000000    -0.14222577    -21.04488325    -0.54141656
   G2-15  -268.99721226    -21.02077530    -20.95338009    -0.54390629    0.00000000    -0.10792588    -21.08600575    -0.53164217
   G2-16  -269.25774779    -21.37700239    -21.27495245    -0.58073513    0.00000000    -0.14483986    -21.44212731    -0.56213525
   G2-17  -269.51334386    -21.74168266    -21.60273805    -0.61568614    0.00000000    -0.17940243    -21.80699491    -0.58995572
   G2-18  -318.57620364    -23.30608912    -23.21793527    -0.60559690    0.00000000    -0.15901722    -23.38098517    -0.59221318
   G2-19  -318.82858652    -23.65393763    -23.52262440    -0.64355840    0.00000000    -0.19648515    -23.73327447    -0.62325676
   G2-20  -373.00557478    -25.70454823    -25.56798635    -0.66706252    0.00000000    -0.20547800    -25.79187965    -0.65010210
   G2-21  -432.22536650    -27.87964576    -27.72910455    -0.68744465    0.00000000    -0.20881000    -27.97148371    -0.67240147
   G2-22  -11.31130805    -3.55779432    -3.51817332    -0.12451251    0.00000000    -0.03935517    -3.55928410    -0.11798421
   G2-23  -95.03592915    -11.94833280    -11.94433618    -0.37743323    0.00000000    -0.25285874    -12.02994777    -0.37538320
   G2-24  -65.85553342    -10.98894884    -10.97048377    -0.43102479    0.00000000    -0.30303382    -11.04671967    -0.41877136
   G2-25  -66.31645054    -11.74201487    -11.69489237    -0.49521864    0.00000000    -0.33943778    -11.78921090    -0.47269375
   G2-26  -66.76274979    -12.49182073    -12.41446361    -0.56048177    0.00000000    -0.37715398    -12.52867387    -0.52679007
   G2-27  -80.58137547    -11.63173479    -11.72677485    -0.40062902    0.00000000    -0.30616289    -11.73290981    -0.40025686
   G2-28  -80.84959802    -12.05376508    -12.06175218    -0.44147165    0.00000000    -0.32706760    -12.13787233    -0.43395835
   G2-29  -99.45880884    -13.31856874    -13.33162874    -0.44970630    0.00000000    -0.33415278    -13.41487419    -0.44619806
   G2-30  -99.60811368    -13.68027784    -13.77723361    -0.47902494    0.00000000    -0.34587628    -13.78279591    -0.47347027
   G2-31  -99.83839747    -14.06967499    -14.07217661    -0.51606201    0.00000000    -0.37822013    -14.16830876    -0.50330487
   G2-32  -100.26162941    -14.82578649    -14.79650043    -0.58207718    0.00000000    -0.41391309    -14.91102202    -0.55956719
   G2-33  -95.86317101    -13.11691609    -13.14176746    -0.45297713    0.00000000    -0.34571003    -13.21911552    -0.44930692
   G2-34  -96.60611154    -14.61733602    -14.59844668    -0.58700697    0.00000000    -0.42240542    -14.70296723    -0.56633821
   G2-35  -114.57610995    -14.71649476    -14.86733293    -0.49147380    0.00000000    -0.36901545    -14.83828754    -0.49138216
   G2-36  -133.34537701    -16.32772219    -16.63528891    -0.53034722    0.00000000    -0.37975047    -16.47375622    -0.53196800
   G2-37  -133.77015198    -17.06477190    -17.10687268    -0.60026740    0.00000000    -0.46455123    -17.21296708    -0.59133328
   G2-38  -178.83278399    -19.92107747    -19.98623935    -0.61461656    0.00000000    -0.48863063    -20.10876437    -0.61282545
   G2-39  -166.09261508    -21.60633591    -21.65442818    -0.74158457    0.00000000    -0.54732433    -21.78680754    -0.73564971
   G2-40  -295.72068352    -27.98392322    -27.88951140    -0.75913102    0.00000000    -0.03497100    -28.10343202    -0.75409019
   G2-41  -537.17987673    -40.58478644    -40.46420618    -1.00945372    0.00000000    -0.17946726    -40.72447691    -1.00600685
   G2-42  -636.27969021    -45.19939818    -45.01294185    -1.12844726    0.00000000    -0.28970507    -45.37756932    -1.11965229
   G2-43  -745.05600150    -50.02945410    -49.96589713    -1.22228004    0.00000000    -0.31541434    -50.21869162    -1.21177566
   G2-44  -863.95170974    -55.03678111    -54.77107463    -1.32561558    0.00000000    -0.38993552    -55.23336671    -1.30793315
   G2-45  -579.79815638    -41.65064334    -41.44561360    -1.04950505    0.00000000    -0.20353922    -41.80242859    -1.03221939
   G2-46  -335.31460410    -28.51864512    -28.46743460    -0.77759674    0.00000000    -0.32530524    -28.67584264    -0.77643011
   G2-47  -405.26299660    -30.08085160    -29.97703588    -0.79372734    0.00000000    -0.31035985    -30.21486018    -0.78519365
   G2-48  -439.18965908    -33.20618230    -33.31601563    -0.87435216    0.00000000    -0.35383020    -33.37951497    -0.87062569
   G2-49  -498.62098970    -35.66718514    -35.67998340    -0.92503084    0.00000000    -0.39247016    -35.84521221    -0.91839817
   G2-50  -521.38692507    -37.50745691    -37.40447809    -0.97017524    0.00000000    -0.43719164    -37.69723128    -0.96086490
   G2-51  -538.55744021    -42.80087417    -42.54121720    -1.19465847    0.00000000    -0.32305429    -42.93465031    -1.15124478
   G2-52  -465.36294759    -33.77891889    -33.60021749    -0.94399716    0.00000000    -0.37937523    -33.89309936    -0.91637112
   G2-53  -406.14006258    -31.61006346    -31.44435982    -0.92590542    0.00000000    -0.37643119    -31.71796559    -0.89652877
   G2-54  -498.86108934    -36.05157425    -35.94171437    -0.96275803    0.00000000    -0.42913674    -36.22555290    -0.94980297
   G2-55  -505.84861155    -41.43139520    -41.40513044    -1.17116801    0.00000000    -0.61755747    -41.70629357    -1.16433696
   G2-56  -289.12589366    -34.20221377    -34.18469689    -1.09265435    0.00000000    -0.76517464    -34.42706157    -1.08229290
   G2-57  -1316.77179953    -86.58761950    -86.13306317    -2.15809051    0.00000000    -0.65782963    -86.88272945    -2.11838170
   G2-58  -492.08929340    -48.51669635    -48.44458992    -1.40671784    0.00000000    -0.75906595    -48.80533541    -1.39724236
   G2-59  -1519.75651617    -100.95222633    -100.40919200    -2.47387502    0.00000000    -0.63022580    -101.28948918    -2.43038064
   G2-60  -390.37903307    -45.43159776    -45.44875907    -1.47201597    0.00000000    -1.04899617    -45.76101167    -1.45766062
   G2-61  -1760.59134318    -115.29915393    -114.74498845    -2.88153154    0.00000000    -0.91637418    -115.71937070    -2.83690401
   G2-62  -471.94771250    -38.38050825    -38.30277346    -1.08463192    0.00000000    -0.51602410    -38.59222973    -1.07329209
   G2-63  -777.78583224    -55.16745186    -54.96441106    -1.42921418    0.00000000    -0.48583827    -55.41081814    -1.41262081
   G2-64  -278.22482208    -33.50492593    -33.54483924    -1.10603323    0.00000000    -0.80075354    -33.76466808    -1.09673064
   G2-65  -626.32242016    -60.84042476    -60.73945674    -1.78297274    0.00000000    -1.01420261    -61.19905839    -1.76660743
   G2-66  -1996.51909319    -130.70741780    -130.00957329    -3.20821607    0.00000000    -0.86098659    -131.14814223    -3.15069900
   G2-67  -162.44496213    -21.29053060    -21.39028466    -0.74393557    0.00000000    -0.58198949    -21.50431266    -0.74105060
   G2-68  -546.59271411    -42.15150195    -42.12220845    -1.16411139    0.00000000    -0.61449491    -42.43207105    -1.15435478
   G2-69  -316.13739092    -36.52368259    -36.63329655    -1.17987717    0.00000000    -0.90280542    -36.85826072    -1.17542107
   G2-70  -586.42897594    -52.86251300    -52.79312224    -1.51516818    0.00000000    -0.83618793    -53.18437338    -1.50428523
   G2-71  -199.99129781    -24.34025232    -24.52710871    -0.81768764    0.00000000    -0.70299106    -24.64735483    -0.81987618
   G2-72  -245.50094038    -28.04669959    -28.16841996    -0.89105926    0.00000000    -0.71313214    -28.33390538    -0.88998788
   G2-73  -700.19080519    -57.43685093    -57.46221423    -1.60770932    0.00000000    -0.96138499    -57.86907740    -1.60234059
   G2-74  -423.02957555    -50.56398723    -50.60399341    -1.66691010    0.00000000    -1.19149126    -50.94149235    -1.65178999
   G2-75  -1793.25317579    -120.50066433    -119.94528260    -3.08450335    0.00000000    -1.04916224    -120.95179456    -3.03717919
   G2-76  -381.55557712    -47.06985923    -47.10745336    -1.57797055    0.00000000    -1.13510538    -47.41936218    -1.56254928
   G2-77  -98.99430752    -16.90530808    -16.85557951    -0.69278795    0.00000000    -0.47153965    -16.98192797    -0.66774953
   G2-78  -99.00113125    -16.89392302    -16.85324282    -0.69303856    0.00000000    -0.47290977    -16.97753978    -0.66891816
   G2-79  -98.93529464    -16.92161838    -16.87100293    -0.70573938    0.00000000    -0.47480549    -16.99230462    -0.68178031
   G2-80  -99.45732668    -17.65007387    -17.57183408    -0.75663355    0.00000000    -0.50995930    -17.71723574    -0.72116286
   G2-81  -99.40255107    -17.69069814    -17.60325160    -0.77167917    0.00000000    -0.50900586    -17.74910906    -0.73504139
   G2-82  -99.90237997    -18.39698700    -18.28725146    -0.82115352    0.00000000    -0.54831440    -18.45301093    -0.77446607
   G2-83  -132.15393734    -22.80974859    -22.73411470    -0.95237662    0.00000000    -0.64403061    -22.91089780    -0.91514755
   G2-84  -132.13095708    -22.82182989    -22.74071489    -0.95450007    0.00000000    -0.64071335    -22.91695889    -0.91672194
   G2-85  -132.08978070    -22.84007241    -22.75751405    -0.96764789    0.00000000    -0.64309882    -22.93279406    -0.92971107
   G2-86  -132.04633674    -22.86790723    -22.77524274    -0.98259710    0.00000000    -0.64503873    -22.95225327    -0.94334095
   G2-87  -132.09693667    -22.84334995    -22.75475568    -0.97197826    0.00000000    -0.64662357    -22.93420019    -0.93150705
   G2-88  -132.54431689    -23.59403896    -23.47200868    -1.03537390    0.00000000    -0.68359057    -23.67250050    -0.98352210
   G2-89  -132.59931448    -23.55683750    -23.44647792    -1.01874109    0.00000000    -0.68153537    -23.64401065    -0.97019749
   G2-90  -133.04145995    -24.30251871    -24.16036026    -1.08198133    0.00000000    -0.71967015    -24.37762533    -1.02231722
   G2-91  -133.04545359    -24.29887561    -24.15672312    -1.08286286    0.00000000    -0.72077548    -24.37480893    -1.02319846
   G2-92  -165.17973465    -28.78915296    -28.66348588    -1.24309741    0.00000000    -0.81324317    -28.89107444    -1.19103792
   G2-93  -197.51852229    -33.24492828    -33.14293214    -1.37312413    0.00000000    -0.90382284    -33.39185428    -1.32756233
   G2-94  -211.99552278    -25.99703685    -25.98929349    -0.88138620    0.00000000    -0.63043994    -26.17525773    -0.86424213
   G2-95  -301.19229818    -35.71010027    -35.71726540    -1.17601655    0.00000000    -0.84082474    -35.96576070    -1.16054291
   G2-96  -897.10429594    -60.96224833    -60.65545022    -1.58882395    0.00000000    -0.55543065    -61.17580096    -1.55526476
   G2-97  -1328.84782101    -88.13540775    -87.70406914    -2.23478709    0.00000000    -0.73460173    -88.45150960    -2.19562292
   G2-98  -81.68695871    -13.56333220    -13.51354562    -0.57368782    0.00000000    -0.39905741    -13.62448921    -0.54610368
   G2-99  -113.99006818    -17.97457633    -17.95044886    -0.70310777    0.00000000    -0.49438115    -18.07714472    -0.68267310
   G2-100 -214.56180694    -29.17934790    -29.24573639    -1.07632182    0.00000000    -0.80706407    -29.42982495    -1.05666512
   G2-101 -214.60585207    -29.12945434    -29.20054209    -1.06916824    0.00000000    -0.81056522    -29.38581772    -1.05022576
   G2-102 -302.65416828    -27.66030245    -27.48988304    -0.87710779    0.00000000    -0.34927451    -27.74498456    -0.83851491
   G2-103 -166.50612666    -22.32705662    -22.34849316    -0.80338799    0.00000000    -0.58596837    -22.49673777    -0.78903498
   G2-104 -199.64123750    -28.22166624    -28.21463637    -1.06024066    0.00000000    -0.75796249    -28.41711643    -1.03218642
   G2-105 -181.05878582    -26.98977779    -26.95637071    -1.05643289    0.00000000    -0.73862319    -27.15465609    -1.02332346
   G2-106 -114.34217468    -18.74016846    -18.68539272    -0.78266980    0.00000000    -0.53453770    -18.82769175    -0.75227920
   G2-107 -161.20751767    -23.42553507    -23.47366369    -0.84284206    0.00000000    -0.62356774    -23.61028503    -0.83627707
   G2-108 -114.82274873    -19.46232934    -19.38208008    -0.83317988    0.00000000    -0.57051233    -19.54497209    -0.79252339
   G2-109 -114.83115031    -19.46618240    -19.38490939    -0.83433634    0.00000000    -0.57033628    -19.54725410    -0.79385439
   G2-110 -132.53769050    -19.23687388    -19.24429095    -0.71703563    0.00000000    -0.51070111    -19.37263385    -0.70201419
   G2-111 -132.92601312    -19.99200200    -19.96230011    -0.78897737    0.00000000    -0.55128940    -20.10956437    -0.76316878
   G2-112 -132.98697973    -19.97951599    -19.95167191    -0.77748934    0.00000000    -0.54749424    -20.09908821    -0.75186861
   G2-113 -199.20806081    -27.45732873    -27.48018548    -0.99195743    0.00000000    -0.72072790    -27.66023754    -0.97442994
   G2-114 -133.40623186    -20.73084460    -20.66955628    -0.84261998    0.00000000    -0.58465794    -20.83581530    -0.80709718
   G2-115 -133.40095909    -20.71739993    -20.65967937    -0.83936965    0.00000000    -0.58536095    -20.82777754    -0.80333577
   G2-116 -438.79894425    -36.80192199    -36.63114405    -1.13591743    0.00000000    -0.51276199    -36.93569028    -1.10448495
   G2-117 -505.89675291    -45.74058682    -45.58644763    -1.47031392    0.00000000    -0.77014862    -45.95922606    -1.42843452
   G2-118 -439.28083007    -37.51433157    -37.31672597    -1.18659036    0.00000000    -0.54792852    -37.64188308    -1.14423275
   G2-119 -439.27861183    -37.51357368    -37.31912144    -1.18587987    0.00000000    -0.54837219    -37.64273932    -1.14424002
   G2-120 -155.50121524    -21.44592069    -21.42211341    -0.78733148    0.00000000    -0.55270457    -21.57829028    -0.76636406
   G2-121 -498.50680473    -39.68282333    -39.47270175    -1.20451883    0.00000000    -0.55055611    -39.81736469    -1.16386801
   G2-122 -498.05562408    -38.93488750    -38.75929051    -1.14146030    0.00000000    -0.51452804    -39.08250560    -1.11233378
   G2-123 -146.68187844    -23.13018779    -23.10969937    -0.89788520    0.00000000    -0.62955143    -23.26757016    -0.87554572
   G2-124 -166.13130505    -25.89078177    -25.83021452    -1.03939220    0.00000000    -0.71762646    -26.02995846    -1.00067164
   G2-125 -199.64838646    -28.24289625    -28.22961457    -1.06501474    0.00000000    -0.75440140    -28.43082167    -1.03723084
   G2-126 -222.18945233    -29.69540001    -29.68871478    -1.07166355    0.00000000    -0.76064715    -29.89858056    -1.04780104
   G2-127 -564.75032828    -47.16098684    -47.01168859    -1.42338412    0.00000000    -0.72607771    -47.38815419    -1.39161260
   G2-128 -531.64534560    -45.58898661    -45.34634460    -1.46529511    0.00000000    -0.72187183    -45.74253944    -1.41163379
   G2-129 -166.55309252    -26.63249451    -26.53934636    -1.10416081    0.00000000    -0.75688583    -26.75801668    -1.05565727
   G2-130 -166.54488136    -26.62310033    -26.53316890    -1.10002041    0.00000000    -0.75627179    -26.75304898    -1.05094266
   G2-131 -147.96378580    -25.35760140    -25.24708895    -1.09399975    0.00000000    -0.74390095    -25.46265032    -1.04042490
   G2-132 -198.32144712    -30.37113981    -30.33130636    -1.19679052    0.00000000    -0.81667626    -30.54768129    -1.16431928
   G2-133 -504.18579919    -47.17735568    -47.00123696    -1.54404367    0.00000000    -0.78132338    -47.37416462    -1.50591246
   G2-134 -179.73808805    -29.13344407    -29.06778461    -1.19180275    0.00000000    -0.79873188    -29.27889671    -1.15488267
   G2-135 -212.45764608    -34.30233770    -34.23161732    -1.38403282    0.00000000    -0.92797256    -34.47871083    -1.34376446
   G2-136 -0.47444696    -0.65872970    -0.64891704    -0.04322006    0.00000000    -0.04222872    -0.66174909    -0.03570787
   G2-137 -372.74500342    -25.35718191    -25.27536805    -0.62591436    0.00000000    -0.16551598    -25.43798740    -0.61523896
   G2-138 -65.54258402    -10.62457249    -10.64498879    -0.38651613    0.00000000    -0.25865910    -10.68160079    -0.38070482
   G2-139 -66.04485506    -11.36520088    -11.37252397    -0.45508413    0.00000000    -0.30094001    -11.41542385    -0.43938990
   G2-140 -132.75284690    -19.59450323    -19.66413659    -0.74000676    0.00000000    -0.51491565    -19.71737144    -0.72178805
   G2-141 -100.00500171    -14.45461213    -14.50180394    -0.54478418    0.00000000    -0.37760579    -14.54127211    -0.52969210
   G2-142 -100.02343826    -14.43318762    -14.50405142    -0.54038178    0.00000000    -0.37036546    -14.51677027    -0.52387159
   G2-143 -133.16874394    -20.33566591    -20.37728998    -0.80113595    0.00000000    -0.54213704    -20.44050772    -0.77175897
   G2-144 -405.88680564    -31.25770080    -31.15858287    -0.88649380    0.00000000    -0.33848793    -31.36154968    -0.86392557
   G2-145 -66.49736238    -12.12496814    -12.09868341    -0.52107412    0.00000000    -0.33815389    -12.16283716    -0.49433771
   G2-146 -99.63994349    -18.02983573    -17.97959309    -0.78290605    0.00000000    -0.51007997    -18.08812068    -0.74360505
   G2-147 -132.78388751    -23.93344923    -23.85713302    -1.04508818    0.00000000    -0.68272805    -24.01232765    -0.99308139
   G2-148 -181.21121682    -22.88582036    -23.12661682    -0.78105560    0.00000000    -0.60768360    -23.12302552    -0.78103367
   G2-149 -132.13953754    -22.80307431    -22.73093476    -0.95379374    0.00000000    -0.64375838    -22.90597854    -0.91677243
   G2-150 -165.29322223    -28.71764630    -28.60911396    -1.21547519    0.00000000    -0.81638610    -28.83829677    -1.16519805
   G2-151 -165.69151482    -29.52286545    -29.36235295    -1.30029820    0.00000000    -0.85429373    -29.61711874    -1.23474498
   G2-152 -166.18051031    -30.20803839    -30.03342249    -1.34276836    0.00000000    -0.89107562    -30.30230531    -1.27009863
   G2-153 -166.18815103    -30.20042812    -30.02520690    -1.34575218    0.00000000    -0.89462814    -30.29678616    -1.27295331
   G2-154 -197.94059280    -33.94975571    -33.82141098    -1.43454294    0.00000000    -0.94955811    -34.08827651    -1.37822372
   G2-155 -197.93859868    -33.95482044    -33.82263923    -1.43478015    0.00000000    -0.94754153    -34.09023052    -1.37799275
   G2-156 -198.83081410    -35.43684860    -35.24103293    -1.56342896    0.00000000    -1.02619485    -35.55044841    -1.48431319
   G2-157 -199.31946682    -36.11361609    -35.90657300    -1.60359008    0.00000000    -1.06252504    -36.22693799    -1.51794474
   G2-158 -199.31919271    -36.10963030    -35.90296870    -1.60597660    0.00000000    -1.06529194    -36.22400959    -1.52060656
   G2-159 -230.65860619    -39.15103292    -39.01773528    -1.63507223    0.00000000    -1.07598727    -39.31838617    -1.57644880
   G2-160 -232.45814867    -42.01952822    -41.77997607    -1.86441824    0.00000000    -1.23394102    -42.15201977    -1.76575381
   G2-161 -263.32832285    -44.26979213    -44.14462626    -1.82753778    0.00000000    -1.21830239    -44.47423032    -1.76794129
   G2-162 -265.59747480    -47.92471165    -47.65278697    -2.12521346    0.00000000    -1.40541399    -48.07622822    -2.01359672
   G2-163 -328.71561623    -54.73109441    -54.57883225    -2.25070007    0.00000000    -1.47440806    -54.98345494    -2.18183815
   G2-164 -328.69715803    -54.67749033    -54.55124369    -2.24752101    0.00000000    -1.48768144    -54.95058730    -2.18031148
   G2-165 -232.78272380    -34.13745099    -34.09539900    -1.32203728    0.00000000    -0.92664381    -34.35085857    -1.28054858
   G2-166 -199.69866384    -32.53390041    -32.40788988    -1.36668653    0.00000000    -0.93015020    -32.68008907    -1.30500387
   G2-167 -245.58193650    -40.23149291    -40.12851785    -1.65061232    0.00000000    -1.09826601    -40.42703292    -1.59773163
   G2-168 -264.16262031    -41.48758930    -41.40556410    -1.65889873    0.00000000    -1.11331149    -41.70733150    -1.61112119
   G2-169 -198.79324079    -31.03882855    -30.98591655    -1.23477180    0.00000000    -0.85347241    -31.21601774    -1.19525276
   G2-170 -199.19792767    -31.84646303    -31.73779334    -1.31832590    0.00000000    -0.89039131    -31.99567329    -1.26317316
   G2-171 -231.91981844    -37.02080631    -36.90950058    -1.51870619    0.00000000    -1.02305271    -37.19864149    -1.46086149
   G2-172 -330.40177913    -48.93215718    -48.91154776    -1.86713511    0.00000000    -1.29490016    -49.24814541    -1.82582454
   G2-173 -227.39903784    -35.36291427    -35.32049224    -1.39521153    0.00000000    -0.95082199    -35.56659790    -1.35999023
   G2-174 -572.49098836    -54.04705842    -53.90613080    -1.76289232    0.00000000    -0.98118767    -54.34026610    -1.71568947
   G2-175 -629.25799052    -60.43557549    -60.20489069    -2.01968924    0.00000000    -1.08030470    -60.68393859    -1.96712942
   G2-176 -227.49349327    -35.26409241    -35.22992865    -1.36532561    0.00000000    -0.95475674    -35.47148754    -1.33208199
   G2-177 -227.39859070    -35.35312189    -35.31567151    -1.39460041    0.00000000    -0.95327634    -35.56012653    -1.35992154
   G2-178 -198.36047966    -30.29311064    -30.26803505    -1.16970642    0.00000000    -0.81693601    -30.47987572    -1.13939447
   G2-179 -198.82154494    -31.04906896    -30.99255254    -1.23472691    0.00000000    -0.85247533    -31.22305985    -1.19411629
   G2-180 -332.15992613    -47.53739882    -47.51478477    -1.80188121    0.00000000    -1.26842709    -47.85515453    -1.75571671
   G2-181 -504.63040133    -47.89604387    -47.68346589    -1.60110849    0.00000000    -0.81680221    -48.07633420    -1.55160815
   G2-182 -180.27084220    -29.78376829    -29.69474404    -1.22414415    0.00000000    -0.83747857    -29.92532228    -1.17748303
   G2-183 -199.26861740    -31.79812883    -31.70484364    -1.30073694    0.00000000    -0.88919024    -31.95659538    -1.24892866
   G2-184 -199.26644093    -31.78880902    -31.69649667    -1.29939064    0.00000000    -0.89124361    -31.94748971    -1.24782106
   G2-185 -265.84512552    -40.07299636    -39.98402942    -1.59901100    0.00000000    -1.10004557    -40.29808486    -1.54127231
   G2-186 -505.07603862    -48.63907339    -48.39427647    -1.66555741    0.00000000    -0.85552433    -48.80795247    -1.60494952
   G2-187 -564.79839979    -51.48379471    -51.20937440    -1.72856938    0.00000000    -0.89673765    -51.66047017    -1.66158788
   G2-188 -564.78460033    -51.49426958    -51.21922778    -1.72602865    0.00000000    -0.89333474    -51.66695339    -1.65938175
   G2-189 -180.61867999    -30.58800920    -30.45670005    -1.31220854    0.00000000    -0.87623040    -30.70926191    -1.25246727
   G2-190 -313.98527909    -46.89553053    -46.86468490    -1.86026358    0.00000000    -1.32314669    -47.20527621    -1.80162911
   G2-191 -199.68865223    -32.52881461    -32.40668090    -1.36066878    0.00000000    -0.92728881    -32.67830596    -1.29857499
   G2-192 -266.33173056    -40.75841961    -40.65522937    -1.64278281    0.00000000    -1.13815152    -40.98205918    -1.57863117
   G2-193 -505.57061621    -49.31344558    -49.05183755    -1.71138496    0.00000000    -0.89527817    -49.48276758    -1.64295072
   G2-194 -878.08649982    -74.34149968    -73.97287654    -2.33280619    0.00000000    -1.06614123    -74.60705030    -2.25850632
   G2-195 -181.12041329    -31.26982970    -31.12275099    -1.35877704    0.00000000    -0.91626361    -31.39149671    -1.29199274
   G2-196 -402.08126220    -45.41087146    -45.14552923    -1.66254433    0.00000000    -0.86171483    -45.55474424    -1.58561723
   G2-197 -537.32588532    -53.08480619    -52.87693869    -1.80536106    0.00000000    -0.95280909    -53.30156335    -1.75409833
   G2-198 -212.87463735    -35.03412594    -34.93822245    -1.45120260    0.00000000    -0.97127512    -35.20185079    -1.40102456
   G2-199 -232.33824198    -37.75583890    -37.61332582    -1.58130852    0.00000000    -1.06293630    -37.92502222    -1.51290390
   G2-200 -232.40569543    -37.70567050    -37.57957511    -1.56205068    0.00000000    -1.06084403    -37.88324972    -1.49718691
   G2-201 -299.07059956    -45.94593674    -45.83987812    -1.84445979    0.00000000    -1.27044588    -46.19965053    -1.77693559
   G2-202 -538.21231680    -54.54925618    -54.27059862    -1.92829080    0.00000000    -1.02765938    -54.73761816    -1.85445156
   G2-203 -213.75670914    -36.50015667    -36.33474067    -1.57535667    0.00000000    -1.04860822    -36.64124262    -1.50232786
   G2-204 -232.82893550    -38.42740269    -38.27272840    -1.62542968    0.00000000    -1.10353817    -38.59869618    -1.55040596
   G2-205 -375.88536811    -52.65438060    -52.59731361    -1.95804206    0.00000000    -1.32958312    -52.97253960    -1.91457990
   G2-206 -375.88374043    -52.65463981    -52.59807202    -1.95782137    0.00000000    -1.33000407    -52.97280091    -1.91453706
   G2-207 -286.70225002    -42.94970594    -42.87045465    -1.66552333    0.00000000    -1.11688013    -43.18239965    -1.62107852
   G2-208 -265.97590159    -44.33280288    -44.14667674    -1.88443241    0.00000000    -1.27332346    -44.52335224    -1.79651418
   G2-209 -765.16877992    -73.14196927    -73.05555847    -2.17057803    0.00000000    -1.29382512    -73.60319315    -2.14905053
   G2-210 -908.87255710    -85.41425020    -85.38758397    -2.55474243    0.00000000    -1.59527481    -86.01501798    -2.53205074
   G2-211 -1272.49683723    -90.52797661    -90.13077100    -2.32030544    0.00000000    -0.58309354    -90.86429095    -2.30182385
   G2-212 -572.43603309    -49.69970412    -49.69385080    -1.46224649    0.00000000    -0.82789057    -50.05080762    -1.45137137
   G2-213 -1236.48656209    -80.05763712    -79.68470933    -1.95043310    0.00000000    -0.56356663    -80.35525463    -1.92593600
   G2-214 -1680.68771841    -113.58875256    -113.08753383    -2.86943576    0.00000000    -0.93341781    -114.04618134    -2.82593636
   G2-215 -2477.96024363    -160.39194501    -159.60090070    -3.93867643    0.00000000    -1.12253419    -160.97682788    -3.87752300
   G2-216 -1369.72076796    -96.55788973    -96.25410973    -2.52851399    0.00000000    -1.00632265    -97.03417468    -2.49821897
   G2-217 -1614.09111223    -105.26474574    -104.75424365    -2.57794862    0.00000000    -0.72183225    -105.64787940    -2.54159729
   G2-218 -1609.02711285    -105.05679500    -104.59509925    -2.57577252    0.00000000    -0.74755752    -105.47033147    -2.54606403
   G2-219 -1132.60326865    -75.43601215    -75.06259500    -1.84783925    0.00000000    -0.48684501    -75.70029860    -1.82298592
   G2-220 -732.93504280    -62.88928132    -62.76864449    -1.82345944    0.00000000    -1.01699110    -63.24668352    -1.80132711
   G2-221 -601.90303159    -70.72833135    -70.75672608    -2.31445166    0.00000000    -1.64699952    -71.24621374    -2.29034662
   G2-222 -300.92715492    -35.33204227    -35.43911782    -1.13764075    0.00000000    -0.80399597    -35.58931201    -1.13066378
   G2-223 -197.24001226    -32.87307576    -32.82933607    -1.33234433    0.00000000    -0.86373586    -33.02356439    -1.29365486
#TMD-BE3       E[noXC]         X Energy HF   X Energy DFT     C Energy GGA  C Energy PT2os   C Energy osRPA   X Energy SCAN     C Energy SCAN
 Cr2-BE3    -2009.12074433    -94.94417425    -95.51074666    -2.07948012    -3.55121903    -1.45147880       -96.03068748    -2.11623877
  V2-BE3    -1811.54895034    -88.78482107    -89.08349675    -1.95080116    -2.01206009    -1.11475669       -89.60802464    -1.97794884
 Fe2-BE3    -2440.67954515   -109.40308945   -109.69445752    -2.28913881    -0.00000000    -1.19410435      -110.29664088    -2.32693742
  Cr-BE3    -1004.34229130    -48.07098706    -48.00023496    -0.98364435    -0.39250108    -0.34281434       -48.31513661    -0.99192177
   V-BE3     -905.79438937    -44.58492681    -44.48085723    -0.92862927    -0.39646335    -0.35395904       -44.77295914    -0.93963467
  Fe-BE3    -1220.40984963    -54.83362439    -54.75926836    -1.11189206    -0.55091334    -0.47200980       -55.08179116    -1.13143991
#TM-BE13           E[noXC]         X Energy HF   X Energy DFT     C Energy GGA  C Energy PT2os   C Energy osRPA   X Energy SCAN     C Energy SCAN
   TiCl-BE13     -1247.25618160     -69.16824179    -68.94775726    -1.55189867    -0.71108242    -0.61361869     -69.46822744    -1.54475476
    VF5-BE13     -1353.99254020     -94.50952376    -94.76793787    -2.55290534    -2.19989344    -1.69487957     -95.40237969    -2.54190431
   CrCl-BE13     -1438.50982192     -75.71994143    -75.51647327    -1.66640728    -0.78285720    -0.67604883     -76.06706671    -1.66225991
   CrOF-BE13     -1160.80211869     -66.15687783    -66.21620019    -1.61012697    -1.14187817    -0.88188650     -66.63937892    -1.61260603
 Fe2Br4-BE13    -12547.48637803    -473.80521120   -473.03053219    -9.16076064    -2.80404409    -2.25414697    -475.89588106    -9.18015444
CoC4O4H-BE13     -1736.54602322    -111.83493810   -112.22746983    -3.15484070    -3.08513572    -2.15871780    -112.88091471    -3.15231288
 NiCH2+-BE13     -1496.83319816     -67.92373247    -67.97161966    -1.49824697    -0.92391448    -0.70071666     -68.37145562    -1.50098561
 FeC5O5-BE13     -1718.23760789    -121.22686179   -121.60974053    -3.52062725    -3.42501348    -2.40093332    -122.33205346    -3.51504489
     VS-BE13     -1279.91010284     -69.72152083    -69.61106417    -1.56896193    -0.80539909    -0.65145738     -70.11069500    -1.56838426
    CuH-BE13     -1593.43037094     -66.55071618    -66.63842168    -1.37500527    -0.97539594    -0.76653808     -66.97723077    -1.39410915
   CuCl-BE13     -2027.26109977     -93.98127890    -93.90943781    -2.02238128    -1.28233271    -1.03894627     -94.48251693    -2.03145310
     VO-BE13      -972.58243190     -52.74009355    -52.79353835    -1.22178941    -0.82455079    -0.62262914     -53.12954704    -1.22823167
   NiCl-BE13     -1897.69133038     -90.14362833    -90.03021136    -1.95465646    -1.02256023    -0.82204523     -90.61084358    -1.96120819
  CO_di-BE13       -99.57280365     -13.31643679    -13.32945043    -0.44942765    -0.40455257    -0.31696436     -13.41070924    -0.44641463
    CH2-BE13       -33.13020913      -5.78291714     -5.74936354    -0.22402652    -0.17606331    -0.14897275      -5.79926545    -0.21071991
    Fe2-BE13     -2440.67954515    -109.40308945   -109.69445752    -2.28913881    -0.00000000    -1.19410435    -110.29664088    -2.32693742
     Ti-BE13      -813.22928648     -41.38042270    -41.25468850    -0.87431306    -0.37970121    -0.32620905     -41.54211717    -0.88383308
     Cl-BE13      -434.08034899     -27.64543875    -27.49779009    -0.64346610    -0.31396409    -0.27622912     -27.73096546    -0.63586379
      V-BE13      -905.79438937     -44.58492681    -44.48085723    -0.92862927    -0.39646335    -0.35395904     -44.77295914    -0.93963467
      F-BE13       -89.53064650     -10.02223247     -9.99656970    -0.29037216    -0.21320729    -0.18493055     -10.06990557    -0.28978856
      O-BE13       -66.70271983      -8.19770016     -8.16383487    -0.23387377    -0.15367718    -0.13381840      -8.22245805    -0.23473458
     Fe-BE13     -1220.40984979     -54.83362447    -54.75926812    -1.11189206    -0.55091330    -0.47200978     -55.08179122    -1.13143991
     Br-BE13     -2526.62242654     -91.02907032    -90.80177215    -1.69229622    -0.31059176    -0.26700401     -91.35073363    -1.69417039
     Co-BE13     -1338.00114232     -58.46592044    -58.41705724    -1.18225848    -0.63579383    -0.53919194     -58.89737063    -1.21495432
      H-BE13        -0.19102678      -0.30867667     -0.30309140    -0.00579958     0.00000000     0.00000000      -0.30912620    -0.00000000
     Ni-BE13     -1463.74846866     -62.29639017    -62.30535456    -1.25994288    -0.65199212    -0.51732274     -62.66636231    -1.28247236
    Ni+-BE13     -1463.48179221     -62.30825476    -62.28368787    -1.25486177    -0.63913087    -0.50805840     -62.63092010    -1.26808074
     Cu-BE13     -1593.13431835     -66.29169938    -66.35514159    -1.34085006    -0.90067387    -0.71615687     -66.68719664    -1.36435351
     Cr-BE13     -1004.34229129     -48.07098707    -48.00023496    -0.98364435    -0.39250108    -0.34281434     -48.31513660    -0.99192177
      S-BE13      -374.11959072     -25.11134551    -24.97725146    -0.58347755    -0.26940133    -0.23621111     -25.18533959    -0.57918877
      C-BE13       -32.65369733      -5.06153259     -5.02546335    -0.14421176    -0.08310644    -0.07049636      -5.06466819    -0.14604735
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
#DC9                      E[noXC]     X Energy HF    X Energy DFT   C Energy GGA C Energy PT2os  C Energy osRPA   X Energy SCAN     C Energy SCAN
       13dip-DC9    -195.18395190    -30.82377879    -30.76339871    -1.25670542    -0.00000001    -0.82187774     -30.98445619    -1.21534932
         be4-DC9     -47.48261515    -10.86280576    -10.81115913    -0.41954161    -0.00000001    -0.21239150     -10.90204520    -0.41001538
          be-DC9     -11.90704819     -2.66416263     -2.63652410    -0.08579969    -0.00000001    -0.04161617      -2.65906039    -0.08341814
     c20bowl-DC9    -653.57461538   -103.22847308   -103.27898388    -4.06410260    -0.00000001    -2.61853436    -103.90350648    -4.01722375
     c20cage-DC9    -653.31336807   -103.39017915   -103.40623520    -4.18476959    -0.00000001    -2.67719106    -104.04996147    -4.12214554
   carbooxo1-DC9    -494.30851823    -70.94737190    -71.05123928    -2.60590404    -0.00000001    -1.76117007     -71.47805820    -2.58155368
   carbooxo2-DC9    -494.12813247    -71.09093635    -71.16861313    -2.65731704    -0.00000001    -1.75333983     -71.58179089    -2.63680476
       ch2n2-DC9    -128.92294799    -18.97030567    -19.00299011    -0.71812780    -0.00000001    -0.50185335     -19.11788462    -0.70550344
       ethen-DC9     -66.32168234    -11.73838864    -11.68969411    -0.49562769    -0.00000001    -0.32012032     -11.78240836    -0.47347594
heptahexaene-DC9    -229.76636023    -37.48758686    -37.48876617    -1.47959559    -0.00000001    -0.96177311     -37.72816785    -1.45026929
 heptatriyne-DC9    -229.75937551    -37.53336192    -37.49869307    -1.47895463    -0.00000001    -0.95192087     -37.74379732    -1.44726160
     ISO_E35-DC9    -394.73066150    -66.71715746    -66.41414399    -2.87325843    -0.00000001    -1.73840944     -66.93186154    -2.76492293
     ISO_E36-DC9    -279.14296267    -42.52556129    -42.46660392    -1.67230868    -0.00000001    -1.07813524     -42.76179507    -1.63083056
     ISO_P35-DC9    -394.96352117    -66.46805376    -66.24904917    -2.77727939    -0.00000001    -1.73012729     -66.74409325    -2.68584847
     ISO_P36-DC9    -279.14201343    -42.52128513    -42.47070851    -1.67118491    -0.00000001    -1.08223437     -42.76574488    -1.62936584
        omcb-DC9    -397.72520535    -70.75010585    -70.36059412    -3.14708901    -0.00000001    -1.97162718     -70.97459011    -2.99377142
          s2-DC9    -745.08313798    -50.00436028    -49.78044009    -1.22224950    -0.00000001    -0.29147980     -50.18968719    -1.21274750
          s8-DC9   -2980.21279436   -200.15569126   -199.27195133    -5.01754699    -0.00000001    -1.30790861    -200.91454759    -4.96822826
     tmethen-DC9    -198.91515846    -35.32823225    -35.15348621    -1.54574115    -0.00000001    -0.97363622     -35.44737024    -1.47295863
#G2RC       E[noXC]       X Energy HF    X Energy DFT   C Energy GGA  C Energy PT2os  C Energy osRPA   X Energy SCAN     C Energy SCAN
 100-G2RC   -114.00165065    -17.96665851    -17.93893577    -0.70333471    -0.00000001    -0.46662279   -18.06366620    -0.68329553
 104-G2RC   -166.52552292    -22.31223995    -22.32907739    -0.80356366    -0.00000001    -0.55975397   -22.47579462    -0.78941160
 106-G2RC   -181.07513270    -26.97820190    -26.93973174    -1.05734117    -0.00000001    -0.70315271   -27.13552750    -1.02465767
 113-G2RC   -133.00089124    -19.96893633    -19.93765103    -0.77812290    -0.00000001    -0.52019469   -20.08292762    -0.75294339
 117-G2RC   -438.81976630    -36.78384585    -36.61114777    -1.13651294    -0.00000001    -0.48289918   -36.91198798    -1.10606730
 118-G2RC   -505.91800228    -45.72664555    -45.56509164    -1.47176588    -0.00000001    -0.72901859   -45.93507954    -1.43029619
  11-G2RC    -48.56427880     -7.65591899     -7.63653947    -0.31544004    -0.00000001    -0.21871458    -7.69512437    -0.30133548
 121-G2RC   -155.51399408    -21.43745612    -21.40923205    -0.78767980    -0.00000001    -0.52580897   -21.56358883    -0.76699656
 126-G2RC   -199.67063753    -28.22582910    -28.20727128    -1.06556864    -0.00000001    -0.71988840   -28.40618038    -1.03814889
 128-G2RC   -564.77555364    -47.13816804    -46.98622156    -1.42356039    -0.00000001    -0.68865201   -47.35831363    -1.39284203
  13-G2RC    -67.13922285     -8.92297869     -8.92209119    -0.32603934    -0.00000001    -0.23508474    -8.98281662    -0.31752443
  14-G2RC    -89.67190778    -10.39326602    -10.39324483    -0.33630900    -0.00000001    -0.24105633   -10.46285000    -0.33157285
  18-G2RC   -269.52657267    -21.73019707    -21.58985078    -0.61603510    -0.00000001    -0.16703451   -21.79314439    -0.59030646
   1-G2RC     -0.47545269     -0.65780352     -0.64791750    -0.04322102    -0.00000001    -0.03928310    -0.66074006    -0.03568863
  21-G2RC   -373.01739656    -25.69386085    -25.55712640    -0.66717471    -0.00000001    -0.19281726   -25.77908061    -0.65072248
  22-G2RC   -432.23552706    -27.86992853    -27.72037998    -0.68726716    -0.00000001    -0.19746837   -27.96054080    -0.67286408
  23-G2RC    -11.31754245     -3.55088606     -3.51315598    -0.12424212    -0.00000001    -0.03245785    -3.55231509    -0.11828276
  24-G2RC    -95.04433916    -11.94099429    -11.93590030    -0.37776200    -0.00000001    -0.24381925   -12.02090397    -0.37569437
  25-G2RC    -65.86194484    -10.98454266    -10.96449873    -0.43076171    -0.00000001    -0.28492160   -11.03947471    -0.41875745
  26-G2RC    -66.32168234    -11.73838864    -11.68969411    -0.49562769    -0.00000001    -0.32012032   -11.78240836    -0.47347594
  30-G2RC    -99.47063034    -13.30878442    -13.32007869    -0.44971752    -0.00000001    -0.31633834   -13.40182955    -0.44654407
  32-G2RC    -99.85043137    -14.05995584    -14.06025897    -0.51627808    -0.00000001    -0.35941530   -14.15491477    -0.50384943
  33-G2RC   -100.27366659    -14.81596577    -14.78458143    -0.58248511    -0.00000001    -0.39536149   -14.89759162    -0.56028039
  34-G2RC    -95.87019028    -13.11340302    -13.13433301    -0.45308375    -0.00000001    -0.32493304   -13.21092521    -0.44952917
  39-G2RC   -178.85024811    -19.90880933    -19.96816376    -0.61505699    -0.00000001    -0.46392043   -20.08953869    -0.61335440
  40-G2RC   -166.11509767    -21.58751788    -21.63234428    -0.74125308    -0.00000001    -0.52326148   -21.76337936    -0.73550126
  45-G2RC   -863.97007421    -55.02098358    -54.75461060    -1.32596435    -0.00000001    -0.36524339   -55.21279977    -1.30937905
  47-G2RC   -335.32980281    -28.50745019    -28.45243592    -0.77781205    -0.00000001    -0.30487598   -28.65970444    -0.77685519
  51-G2RC   -521.39791036    -37.50170308    -37.39381326    -0.97113655    -0.00000001    -0.41257559   -37.68445397    -0.96224652
  52-G2RC   -538.58072415    -42.78137398    -42.51861159    -1.19524126    -0.00000001    -0.30026671   -42.91027483    -1.15184817
  56-G2RC   -505.87579060    -41.41336240    -41.37803801    -1.17154382    -0.00000001    -0.58323070   -41.67739710    -1.16488279
  57-G2RC   -289.15407262    -34.17819300    -34.15695024    -1.09251126    -0.00000001    -0.73883621   -34.39770602    -1.08218660
  58-G2RC  -1316.80709325    -86.55479086    -86.10163535    -2.15760712    -0.00000001    -0.62104746   -86.84462922    -2.11954167
  59-G2RC   -492.10468478    -48.50872305    -48.42849594    -1.40806266    -0.00000001    -0.73062691   -48.78917126    -1.39805595
  60-G2RC  -1519.80540584   -100.90355739   -100.36557269    -2.47294907    -0.00000001    -0.59627480  -101.23810271    -2.43159639
  61-G2RC   -390.41454040    -45.40518279    -45.41312243    -1.47195202    -0.00000001    -1.01023481   -45.72388883    -1.45730435
  62-G2RC  -1760.63653132   -115.25896979   -114.70413655    -2.88165280    -0.00000001    -0.86289628  -115.66939532    -2.83946937
  66-G2RC   -626.35046153    -60.82061487    -60.71109492    -1.78405246    -0.00000001    -0.97793021   -61.16996994    -1.76724203
  67-G2RC  -1996.57961700   -130.64901161   -129.95536613    -3.20706840    -0.00000001    -0.81394161  -131.08443692    -3.15204340
  68-G2RC   -162.46340384    -21.28093060    -21.37102860    -0.74389725    -0.00000001    -0.54909959   -21.48410704    -0.74109287
   6-G2RC    -33.11422445     -5.77710928     -5.74447442    -0.22418702    -0.00000001    -0.14984626    -5.79433011    -0.21087936
  73-G2RC   -245.53137387    -28.02689273    -28.13695748    -0.89115658    -0.00000001    -0.67673676   -28.30126557    -0.89008938
  82-G2RC    -99.41070721    -17.68482401    -17.59473721    -0.77274155    -0.00000001    -0.48223298   -17.73814383    -0.73669223
  88-G2RC   -132.10763035    -22.83602905    -22.74363414    -0.97323200    -0.00000001    -0.61068288   -22.92001116    -0.93344700
   8-G2RC    -33.63096396     -6.58083702     -6.53537847    -0.30098255    -0.00000001    -0.19635734    -6.59779777    -0.28060273
  94-G2RC   -197.53517749    -33.23209729    -33.12589404    -1.37476507    -0.00000001    -0.85396114   -33.37028391    -1.33027897
  97-G2RC   -897.13060181    -60.93822743    -60.63160500    -1.58885106    -0.00000001    -0.52415888   -61.14672076    -1.55673699
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















































































































































































































































