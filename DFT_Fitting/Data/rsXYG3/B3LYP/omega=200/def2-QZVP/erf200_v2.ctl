# The project environment :
#  "ProjDir" specifying the storage DIR of this project
#  "ProjCtrl" = 0 : to run all the jobs
#     = 1 : to fetch result from existed log and chk files
#     = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./B3LYP           2    QChem

# The project description
__title__ ::
"================================ Total(419) ================================"
"There are about :                                                           " 
" 1)  223 HOFs from the G3 set                                               "
" 2)   36 G21IP                                                              "
" 3)   25 G21EA                                                              "
" 4)   22 Non Bonding interactions from S22  set                             "
" 5)    6 n-alkane dimers from ADIM6                                         "
" 6)   27 WATER27                                                            "
" 7)  165 MB08_165                                                           "
" 8)   99 W4-08                                                              "
" 9)    6 O3Add6                                                           "
" NOTE :: "
" 1) G3 atomization is generated using freq scale factor 0.9877 and          "
"    correct SO contribution                                                 "
" 2) G3Large basis set is used here                                          "
" 3) BSSE is considered                                                      "
" 4) w=200 range-seperate PT2 used                                           "

__initial guess__ ::
# For rsXYG3 and the fitting sets include ADIM6 weighted by 300
#  0.793     0.127     0.618     0.497     0.320
#  8.58770164E-01  6.84266822E-02  5.06885278E-01  3.75717905E-01  3.71554214E-01
#  8.23743906E-01  6.62918991E-02  5.27998852E-01  3.72369576E-01  3.39630615E-01
#  8.23760345E-01  6.64323352E-02  5.28055556E-01  3.72588479E-01  3.39667943E-01
#  7.67125568E-01  8.07368521E-02  5.09970587E-01  3.12717631E-01  3.25510885E-01
#  7.60562827E-01  8.43039414E-02  5.13956987E-01  3.10939826E-01  3.21155137E-01
#  7.56472753E-01  8.31597290E-02  5.12850505E-01  3.05258341E-01  3.19083512E-01
#  7.56479493E-01  8.31711046E-02  5.12866543E-01  3.05290313E-01  3.19083373E-01
#  7.57033944E-01  8.34996785E-02  5.13701433E-01  3.06809550E-01  3.19093487E-01
#   XYG5 c1*Ex[HF]+(1-c1)Ex[LDA]+c2dEx[B88]+c3Ec[VWN]+c4dEc[LYP]+c5Ec[PT2,ss]+c6Ec[PT2,os]
#                   +c7Ec[lrcPT2,ss]+c8Ec[lrcPT2,os]
#   0.68  0.68 0.382  0.382  0.15  0.15
#   0.104, 0.330, 0.8, 0.1
   7.57033944E-01  8.34996785E-02  5.13701433E-01  3.06809550E-01  1.19093487E-01  3.19093487E-01  3.19093487E-01  1.19093487E-01
    

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

__optimization function__ :: 34
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a1, a3, a4, a5, a7, a8, a10, a11 = C
    a2  = 1. - a1
    a6  = 0.
    a9  = a7
    a10 = 0.
    a12 = a10

    E_noXC, Ex_HF, Ex_LDA, dEx_B, Ec_VWN, dEc_LYP, Ec_PT21, aaaa, abab, bbbb,\
    aaaa_erf200, abab_erf200, bbbb_erf200 = P
    return E_noXC + a1*Ex_HF + a2*Ex_LDA + a3*dEx_B + a4*Ec_VWN + a5* dEc_LYP \
           + a6*Ec_PT21 + a7*aaaa + a8*abab + a9*bbbb\
        + a10*aaaa_erf200 + a11*abab_erf200 + a12*bbbb_erf200

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
#               759 = 17+223+56+12+121+30+300 is the total number of jobs in this batch list
__batch__ ::  759
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
 G2-100         <PATH2>/G2                   XYG3_Comp      energy
 G2-101         <PATH2>/G2                   XYG3_Comp      energy
 G2-102         <PATH2>/G2                   XYG3_Comp      energy
 G2-103         <PATH2>/G2                   XYG3_Comp      energy
 G2-104         <PATH2>/G2                   XYG3_Comp      energy
 G2-105         <PATH2>/G2                   XYG3_Comp      energy
 G2-106         <PATH2>/G2                   XYG3_Comp      energy
 G2-107         <PATH2>/G2                   XYG3_Comp      energy
 G2-108         <PATH2>/G2                   XYG3_Comp      energy
 G2-109         <PATH2>/G2                   XYG3_Comp      energy
 G2-110         <PATH2>/G2                   XYG3_Comp      energy
 G2-111         <PATH2>/G2                   XYG3_Comp      energy
 G2-112         <PATH2>/G2                   XYG3_Comp      energy
 G2-113         <PATH2>/G2                   XYG3_Comp      energy
 G2-114         <PATH2>/G2                   XYG3_Comp      energy
 G2-115         <PATH2>/G2                   XYG3_Comp      energy
 G2-116         <PATH2>/G2                   XYG3_Comp      energy
 G2-117         <PATH2>/G2                   XYG3_Comp      energy
 G2-118         <PATH2>/G2                   XYG3_Comp      energy
 G2-119         <PATH2>/G2                   XYG3_Comp      energy
 G2-120         <PATH2>/G2                   XYG3_Comp      energy
 G2-121         <PATH2>/G2                   XYG3_Comp      energy
 G2-122         <PATH2>/G2                   XYG3_Comp      energy
 G2-123         <PATH2>/G2                   XYG3_Comp      energy
 G2-124         <PATH2>/G2                   XYG3_Comp      energy
 G2-125         <PATH2>/G2                   XYG3_Comp      energy
 G2-126         <PATH2>/G2                   XYG3_Comp      energy
 G2-127         <PATH2>/G2                   XYG3_Comp      energy
 G2-128         <PATH2>/G2                   XYG3_Comp      energy
 G2-129         <PATH2>/G2                   XYG3_Comp      energy
 G2-130         <PATH2>/G2                   XYG3_Comp      energy
 G2-131         <PATH2>/G2                   XYG3_Comp      energy
 G2-132         <PATH2>/G2                   XYG3_Comp      energy
 G2-133         <PATH2>/G2                   XYG3_Comp      energy
 G2-134         <PATH2>/G2                   XYG3_Comp      energy
 G2-135         <PATH2>/G2                   XYG3_Comp      energy
 G2-136         <PATH2>/G2                   XYG3_Comp      energy
 G2-137         <PATH2>/G2                   XYG3_Comp      energy
 G2-138         <PATH2>/G2                   XYG3_Comp      energy
 G2-139         <PATH2>/G2                   XYG3_Comp      energy
 G2-140         <PATH2>/G2                   XYG3_Comp      energy
 G2-141         <PATH2>/G2                   XYG3_Comp      energy
 G2-142         <PATH2>/G2                   XYG3_Comp      energy
 G2-143         <PATH2>/G2                   XYG3_Comp      energy
 G2-144         <PATH2>/G2                   XYG3_Comp      energy
 G2-145         <PATH2>/G2                   XYG3_Comp      energy
 G2-146         <PATH2>/G2                   XYG3_Comp      energy
 G2-147         <PATH2>/G2                   XYG3_Comp      energy
 G2-148         <PATH2>/G2                   XYG3_Comp      energy
 G2-149         <PATH2>/G2                   XYG3_Comp      energy
 G2-150         <PATH2>/G2                   XYG3_Comp      energy
 G2-151         <PATH2>/G2                   XYG3_Comp      energy
 G2-152         <PATH2>/G2                   XYG3_Comp      energy
 G2-153         <PATH2>/G2                   XYG3_Comp      energy
 G2-154         <PATH2>/G2                   XYG3_Comp      energy
 G2-155         <PATH2>/G2                   XYG3_Comp      energy
 G2-156         <PATH2>/G2                   XYG3_Comp      energy
 G2-157         <PATH2>/G2                   XYG3_Comp      energy
 G2-158         <PATH2>/G2                   XYG3_Comp      energy
 G2-159         <PATH2>/G2                   XYG3_Comp      energy
 G2-160         <PATH2>/G2                   XYG3_Comp      energy
 G2-161         <PATH2>/G2                   XYG3_Comp      energy
 G2-162         <PATH2>/G2                   XYG3_Comp      energy
 G2-163         <PATH2>/G2                   XYG3_Comp      energy
 G2-164         <PATH2>/G2                   XYG3_Comp      energy
 G2-165         <PATH2>/G2                   XYG3_Comp      energy
 G2-166         <PATH2>/G2                   XYG3_Comp      energy
 G2-167         <PATH2>/G2                   XYG3_Comp      energy
 G2-168         <PATH2>/G2                   XYG3_Comp      energy
 G2-169         <PATH2>/G2                   XYG3_Comp      energy
 G2-170         <PATH2>/G2                   XYG3_Comp      energy
 G2-171         <PATH2>/G2                   XYG3_Comp      energy
 G2-172         <PATH2>/G2                   XYG3_Comp      energy
 G2-173         <PATH2>/G2                   XYG3_Comp      energy
 G2-174         <PATH2>/G2                   XYG3_Comp      energy
 G2-175         <PATH2>/G2                   XYG3_Comp      energy
 G2-176         <PATH2>/G2                   XYG3_Comp      energy
 G2-177         <PATH2>/G2                   XYG3_Comp      energy
 G2-178         <PATH2>/G2                   XYG3_Comp      energy
 G2-179         <PATH2>/G2                   XYG3_Comp      energy
 G2-180         <PATH2>/G2                   XYG3_Comp      energy
 G2-181         <PATH2>/G2                   XYG3_Comp      energy
 G2-182         <PATH2>/G2                   XYG3_Comp      energy
 G2-183         <PATH2>/G2                   XYG3_Comp      energy
 G2-184         <PATH2>/G2                   XYG3_Comp      energy
 G2-185         <PATH2>/G2                   XYG3_Comp      energy
 G2-186         <PATH2>/G2                   XYG3_Comp      energy
 G2-187         <PATH2>/G2                   XYG3_Comp      energy
 G2-188         <PATH2>/G2                   XYG3_Comp      energy
 G2-189         <PATH2>/G2                   XYG3_Comp      energy
 G2-190         <PATH2>/G2                   XYG3_Comp      energy
 G2-191         <PATH2>/G2                   XYG3_Comp      energy
 G2-192         <PATH2>/G2                   XYG3_Comp      energy
 G2-193         <PATH2>/G2                   XYG3_Comp      energy
 G2-194         <PATH2>/G2                   XYG3_Comp      energy
 G2-195         <PATH2>/G2                   XYG3_Comp      energy
 G2-196         <PATH2>/G2                   XYG3_Comp      energy
 G2-197         <PATH2>/G2                   XYG3_Comp      energy
 G2-198         <PATH2>/G2                   XYG3_Comp      energy
 G2-199         <PATH2>/G2                   XYG3_Comp      energy
 G2-200         <PATH2>/G2                   XYG3_Comp      energy
 G2-201         <PATH2>/G2                   XYG3_Comp      energy
 G2-202         <PATH2>/G2                   XYG3_Comp      energy
 G2-203         <PATH2>/G2                   XYG3_Comp      energy
 G2-204         <PATH2>/G2                   XYG3_Comp      energy
 G2-205         <PATH2>/G2                   XYG3_Comp      energy
 G2-206         <PATH2>/G2                   XYG3_Comp      energy
 G2-207         <PATH2>/G2                   XYG3_Comp      energy
 G2-208         <PATH2>/G2                   XYG3_Comp      energy
 G2-209         <PATH2>/G2                   XYG3_Comp      energy
 G2-210         <PATH2>/G2                   XYG3_Comp      energy
 G2-211         <PATH2>/G2                   XYG3_Comp      energy
 G2-212         <PATH2>/G2                   XYG3_Comp      energy
 G2-213         <PATH2>/G2                   XYG3_Comp      energy
 G2-214         <PATH2>/G2                   XYG3_Comp      energy
 G2-215         <PATH2>/G2                   XYG3_Comp      energy
 G2-216         <PATH2>/G2                   XYG3_Comp      energy
 G2-217         <PATH2>/G2                   XYG3_Comp      energy
 G2-218         <PATH2>/G2                   XYG3_Comp      energy
 G2-219         <PATH2>/G2                   XYG3_Comp      energy
 G2-220         <PATH2>/G2                   XYG3_Comp      energy
 G2-221         <PATH2>/G2                   XYG3_Comp      energy
 G2-222         <PATH2>/G2                   XYG3_Comp      energy
 G2-223         <PATH2>/G2                   XYG3_Comp      energy
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
# Molecules for ADIM6 :: 12
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
# G2IP + G2EA = 121
  IP_11         <PATH2>/.                    XYG3_Comp      energy
  IP_12         <PATH2>/.                    XYG3_Comp      energy
  IP_137        <PATH2>/.                    XYG3_Comp      energy
  IP_13         <PATH2>/.                    XYG3_Comp      energy
  IP_14         <PATH2>/.                    XYG3_Comp      energy
  IP_18         <PATH2>/.                    XYG3_Comp      energy
  IP_19         <PATH2>/.                    XYG3_Comp      energy
  IP_20         <PATH2>/.                    XYG3_Comp      energy
  IP_22         <PATH2>/.                    XYG3_Comp      energy
  IP_25         <PATH2>/.                    XYG3_Comp      energy
  IP_26         <PATH2>/.                    XYG3_Comp      energy
  IP_30         <PATH2>/.                    XYG3_Comp      energy
  IP_34         <PATH2>/.                    XYG3_Comp      energy
  IP_37         <PATH2>/.                    XYG3_Comp      energy
  IP_43         <PATH2>/.                    XYG3_Comp      energy
  IP_44         <PATH2>/.                    XYG3_Comp      energy
  IP_45         <PATH2>/.                    XYG3_Comp      energy
  IP_48         <PATH2>/.                    XYG3_Comp      energy
  IP_51         <PATH2>/.                    XYG3_Comp      energy
  IP_08         <PATH2>/.                    XYG3_Comp      energy
  IP_al         <PATH2>/.                    XYG3_Comp      energy
  IP_al+        <PATH2>/.                    XYG3_Comp      energy
  IP_b          <PATH2>/.                    XYG3_Comp      energy
  IP_b+         <PATH2>/.                    XYG3_Comp      energy
  IP_be         <PATH2>/.                    XYG3_Comp      energy
  IP_be+        <PATH2>/.                    XYG3_Comp      energy
  IP_c          <PATH2>/.                    XYG3_Comp      energy
  IP_c+         <PATH2>/.                    XYG3_Comp      energy
  IP_cl         <PATH2>/.                    XYG3_Comp      energy
  IP_cl+        <PATH2>/.                    XYG3_Comp      energy
  IP_f          <PATH2>/.                    XYG3_Comp      energy
  IP_f+         <PATH2>/.                    XYG3_Comp      energy
  IP_h          <PATH2>/.                    XYG3_Comp      energy
  IP_59         <PATH2>/.                    XYG3_Comp      energy
  IP_60         <PATH2>/.                    XYG3_Comp      energy
  IP_61         <PATH2>/.                    XYG3_Comp      energy
  IP_62         <PATH2>/.                    XYG3_Comp      energy
  IP_63         <PATH2>/.                    XYG3_Comp      energy
  IP_64         <PATH2>/.                    XYG3_Comp      energy
  IP_65         <PATH2>/.                    XYG3_Comp      energy
  IP_66         <PATH2>/.                    XYG3_Comp      energy
  IP_67         <PATH2>/.                    XYG3_Comp      energy
  IP_68         <PATH2>/.                    XYG3_Comp      energy
  IP_70         <PATH2>/.                    XYG3_Comp      energy
  IP_71         <PATH2>/.                    XYG3_Comp      energy
  IP_72         <PATH2>/.                    XYG3_Comp      energy
  IP_73         <PATH2>/.                    XYG3_Comp      energy
  IP_74         <PATH2>/.                    XYG3_Comp      energy
  IP_75         <PATH2>/.                    XYG3_Comp      energy
  IP_76         <PATH2>/.                    XYG3_Comp      energy
  IP_77         <PATH2>/.                    XYG3_Comp      energy
  IP_78         <PATH2>/.                    XYG3_Comp      energy
  IP_79         <PATH2>/.                    XYG3_Comp      energy
  IP_80         <PATH2>/.                    XYG3_Comp      energy
  IP_n65        <PATH2>/.                    XYG3_Comp      energy
  IP_li         <PATH2>/.                    XYG3_Comp      energy
  IP_li+        <PATH2>/.                    XYG3_Comp      energy
  IP_mg         <PATH2>/.                    XYG3_Comp      energy
  IP_mg+        <PATH2>/.                    XYG3_Comp      energy
  IP_na         <PATH2>/.                    XYG3_Comp      energy
  IP_na+        <PATH2>/.                    XYG3_Comp      energy
  IP_n          <PATH2>/.                    XYG3_Comp      energy
  IP_n+         <PATH2>/.                    XYG3_Comp      energy
  IP_o          <PATH2>/.                    XYG3_Comp      energy
  IP_o+         <PATH2>/.                    XYG3_Comp      energy
  IP_P          <PATH2>/.                    XYG3_Comp      energy
  IP_P+         <PATH2>/.                    XYG3_Comp      energy
  IP_s          <PATH2>/.                    XYG3_Comp      energy
  IP_s+         <PATH2>/.                    XYG3_Comp      energy
  IP_si         <PATH2>/.                    XYG3_Comp      energy
  IP_si+        <PATH2>/.                    XYG3_Comp      energy
  EA_10         <PATH2>/.                    XYG3_Comp      energy
  EA_10n        <PATH2>/.                    XYG3_Comp      energy
  EA_11         <PATH2>/.                    XYG3_Comp      energy
  EA_11n        <PATH2>/.                    XYG3_Comp      energy
  EA_12         <PATH2>/.                    XYG3_Comp      energy
  EA_12n        <PATH2>/.                    XYG3_Comp      energy
  EA_13         <PATH2>/.                    XYG3_Comp      energy
  EA_13n        <PATH2>/.                    XYG3_Comp      energy
  EA_14         <PATH2>/.                    XYG3_Comp      energy
  EA_14n        <PATH2>/.                    XYG3_Comp      energy
  EA_15         <PATH2>/.                    XYG3_Comp      energy
  EA_15n        <PATH2>/.                    XYG3_Comp      energy
  EA_16         <PATH2>/.                    XYG3_Comp      energy
  EA_16n        <PATH2>/.                    XYG3_Comp      energy
  EA_17         <PATH2>/.                    XYG3_Comp      energy
  EA_17n        <PATH2>/.                    XYG3_Comp      energy
  EA_18         <PATH2>/.                    XYG3_Comp      energy
  EA_18n        <PATH2>/.                    XYG3_Comp      energy
  EA_19         <PATH2>/.                    XYG3_Comp      energy
  EA_19n        <PATH2>/.                    XYG3_Comp      energy
  EA_20         <PATH2>/.                    XYG3_Comp      energy
  EA_20n        <PATH2>/.                    XYG3_Comp      energy
  EA_21         <PATH2>/.                    XYG3_Comp      energy
  EA_21n        <PATH2>/.                    XYG3_Comp      energy
  EA_22         <PATH2>/.                    XYG3_Comp      energy
  EA_22n        <PATH2>/.                    XYG3_Comp      energy
  EA_23         <PATH2>/.                    XYG3_Comp      energy
  EA_23n        <PATH2>/.                    XYG3_Comp      energy
  EA_24         <PATH2>/.                    XYG3_Comp      energy
  EA_24n        <PATH2>/.                    XYG3_Comp      energy
  EA_25         <PATH2>/.                    XYG3_Comp      energy
  EA_25n        <PATH2>/.                    XYG3_Comp      energy
  EA_8          <PATH2>/.                    XYG3_Comp      energy
  EA_8n         <PATH2>/.                    XYG3_Comp      energy
  EA_9          <PATH2>/.                    XYG3_Comp      energy
  EA_9n         <PATH2>/.                    XYG3_Comp      energy
  EA_c-         <PATH2>/.                    XYG3_Comp      energy
  EA_c          <PATH2>/.                    XYG3_Comp      energy
  EA_cl-        <PATH2>/.                    XYG3_Comp      energy
  EA_cl         <PATH2>/.                    XYG3_Comp      energy
  EA_f-         <PATH2>/.                    XYG3_Comp      energy
  EA_f          <PATH2>/.                    XYG3_Comp      energy
  EA_o-         <PATH2>/.                    XYG3_Comp      energy
  EA_o          <PATH2>/.                    XYG3_Comp      energy
  EA_p-         <PATH2>/.                    XYG3_Comp      energy
  EA_p          <PATH2>/.                    XYG3_Comp      energy
  EA_s-         <PATH2>/.                    XYG3_Comp      energy
  EA_s          <PATH2>/.                    XYG3_Comp      energy
  EA_si-        <PATH2>/.                    XYG3_Comp      energy
  EA_si         <PATH2>/.                    XYG3_Comp      energy
# WATER27 = 30
      H2O20     <PATH2>/.                    XYG3_Comp      energy
    H2O20es     <PATH2>/.                    XYG3_Comp      energy
    H2O20fc     <PATH2>/.                    XYG3_Comp      energy
    H2O20fs     <PATH2>/.                    XYG3_Comp      energy
       H2O2     <PATH2>/.                    XYG3_Comp      energy
       H2O3     <PATH2>/.                    XYG3_Comp      energy
       H2O4     <PATH2>/.                    XYG3_Comp      energy
       H2O5     <PATH2>/.                    XYG3_Comp      energy
      H2O6b     <PATH2>/.                    XYG3_Comp      energy
     H2O6c2     <PATH2>/.                    XYG3_Comp      energy
      H2O6c     <PATH2>/.                    XYG3_Comp      energy
       H2O6     <PATH2>/.                    XYG3_Comp      energy
    H2O8d2d     <PATH2>/.                    XYG3_Comp      energy
     H2O8s4     <PATH2>/.                    XYG3_Comp      energy
        H2O     <PATH2>/.                    XYG3_Comp      energy
       H3Op     <PATH2>/.                    XYG3_Comp      energy
   H3OpH2O2     <PATH2>/.                    XYG3_Comp      energy
   H3OpH2O3     <PATH2>/.                    XYG3_Comp      energy
 H3OpH2O62d     <PATH2>/.                    XYG3_Comp      energy
 H3OpH2O63d     <PATH2>/.                    XYG3_Comp      energy
H3OpH2O6OHm     <PATH2>/.                    XYG3_Comp      energy
    H3OpH2O     <PATH2>/.                    XYG3_Comp      energy
        OHm     <PATH2>/.                    XYG3_Comp      energy
    OHmH2O2     <PATH2>/.                    XYG3_Comp      energy
    OHmH2O3     <PATH2>/.                    XYG3_Comp      energy
  OHmH2O4c4     <PATH2>/.                    XYG3_Comp      energy
  OHmH2O4cs     <PATH2>/.                    XYG3_Comp      energy
    OHmH2O5     <PATH2>/.                    XYG3_Comp      energy
    OHmH2O6     <PATH2>/.                    XYG3_Comp      energy
     OHmH2O     <PATH2>/.                    XYG3_Comp      energy
# MB08+W4+O3Add = 300
MB_001          <PATH2>/.                    XYG3_Comp      energy
MB_002          <PATH2>/.                    XYG3_Comp      energy
MB_003          <PATH2>/.                    XYG3_Comp      energy
MB_004          <PATH2>/.                    XYG3_Comp      energy
MB_005          <PATH2>/.                    XYG3_Comp      energy
MB_006          <PATH2>/.                    XYG3_Comp      energy
MB_007          <PATH2>/.                    XYG3_Comp      energy
MB_008          <PATH2>/.                    XYG3_Comp      energy
MB_009          <PATH2>/.                    XYG3_Comp      energy
MB_010          <PATH2>/.                    XYG3_Comp      energy
MB_011          <PATH2>/.                    XYG3_Comp      energy
MB_012          <PATH2>/.                    XYG3_Comp      energy
MB_013          <PATH2>/.                    XYG3_Comp      energy
MB_014          <PATH2>/.                    XYG3_Comp      energy
MB_015          <PATH2>/.                    XYG3_Comp      energy
MB_016          <PATH2>/.                    XYG3_Comp      energy
MB_017          <PATH2>/.                    XYG3_Comp      energy
MB_018          <PATH2>/.                    XYG3_Comp      energy
MB_019          <PATH2>/.                    XYG3_Comp      energy
MB_020          <PATH2>/.                    XYG3_Comp      energy
MB_021          <PATH2>/.                    XYG3_Comp      energy
MB_022          <PATH2>/.                    XYG3_Comp      energy
MB_023          <PATH2>/.                    XYG3_Comp      energy
MB_024          <PATH2>/.                    XYG3_Comp      energy
MB_025          <PATH2>/.                    XYG3_Comp      energy
MB_026          <PATH2>/.                    XYG3_Comp      energy
MB_027          <PATH2>/.                    XYG3_Comp      energy
MB_028          <PATH2>/.                    XYG3_Comp      energy
MB_029          <PATH2>/.                    XYG3_Comp      energy
MB_030          <PATH2>/.                    XYG3_Comp      energy
MB_031          <PATH2>/.                    XYG3_Comp      energy
MB_032          <PATH2>/.                    XYG3_Comp      energy
MB_033          <PATH2>/.                    XYG3_Comp      energy
MB_034          <PATH2>/.                    XYG3_Comp      energy
MB_035          <PATH2>/.                    XYG3_Comp      energy
MB_036          <PATH2>/.                    XYG3_Comp      energy
MB_037          <PATH2>/.                    XYG3_Comp      energy
MB_038          <PATH2>/.                    XYG3_Comp      energy
MB_039          <PATH2>/.                    XYG3_Comp      energy
MB_040          <PATH2>/.                    XYG3_Comp      energy
MB_041          <PATH2>/.                    XYG3_Comp      energy
MB_042          <PATH2>/.                    XYG3_Comp      energy
MB_043          <PATH2>/.                    XYG3_Comp      energy
MB_044          <PATH2>/.                    XYG3_Comp      energy
MB_045          <PATH2>/.                    XYG3_Comp      energy
MB_046          <PATH2>/.                    XYG3_Comp      energy
MB_047          <PATH2>/.                    XYG3_Comp      energy
MB_048          <PATH2>/.                    XYG3_Comp      energy
MB_049          <PATH2>/.                    XYG3_Comp      energy
MB_050          <PATH2>/.                    XYG3_Comp      energy
MB_051          <PATH2>/.                    XYG3_Comp      energy
MB_052          <PATH2>/.                    XYG3_Comp      energy
MB_053          <PATH2>/.                    XYG3_Comp      energy
MB_054          <PATH2>/.                    XYG3_Comp      energy
MB_055          <PATH2>/.                    XYG3_Comp      energy
MB_056          <PATH2>/.                    XYG3_Comp      energy
MB_057          <PATH2>/.                    XYG3_Comp      energy
MB_058          <PATH2>/.                    XYG3_Comp      energy
MB_059          <PATH2>/.                    XYG3_Comp      energy
MB_060          <PATH2>/.                    XYG3_Comp      energy
MB_061          <PATH2>/.                    XYG3_Comp      energy
MB_062          <PATH2>/.                    XYG3_Comp      energy
MB_063          <PATH2>/.                    XYG3_Comp      energy
MB_064          <PATH2>/.                    XYG3_Comp      energy
MB_065          <PATH2>/.                    XYG3_Comp      energy
MB_066          <PATH2>/.                    XYG3_Comp      energy
MB_067          <PATH2>/.                    XYG3_Comp      energy
MB_068          <PATH2>/.                    XYG3_Comp      energy
MB_069          <PATH2>/.                    XYG3_Comp      energy
MB_070          <PATH2>/.                    XYG3_Comp      energy
MB_071          <PATH2>/.                    XYG3_Comp      energy
MB_072          <PATH2>/.                    XYG3_Comp      energy
MB_073          <PATH2>/.                    XYG3_Comp      energy
MB_074          <PATH2>/.                    XYG3_Comp      energy
MB_075          <PATH2>/.                    XYG3_Comp      energy
MB_076          <PATH2>/.                    XYG3_Comp      energy
MB_077          <PATH2>/.                    XYG3_Comp      energy
MB_078          <PATH2>/.                    XYG3_Comp      energy
MB_079          <PATH2>/.                    XYG3_Comp      energy
MB_080          <PATH2>/.                    XYG3_Comp      energy
MB_081          <PATH2>/.                    XYG3_Comp      energy
MB_082          <PATH2>/.                    XYG3_Comp      energy
MB_083          <PATH2>/.                    XYG3_Comp      energy
MB_084          <PATH2>/.                    XYG3_Comp      energy
MB_085          <PATH2>/.                    XYG3_Comp      energy
MB_086          <PATH2>/.                    XYG3_Comp      energy
MB_087          <PATH2>/.                    XYG3_Comp      energy
MB_088          <PATH2>/.                    XYG3_Comp      energy
MB_089          <PATH2>/.                    XYG3_Comp      energy
MB_090          <PATH2>/.                    XYG3_Comp      energy
MB_091          <PATH2>/.                    XYG3_Comp      energy
MB_092          <PATH2>/.                    XYG3_Comp      energy
MB_093          <PATH2>/.                    XYG3_Comp      energy
MB_094          <PATH2>/.                    XYG3_Comp      energy
MB_095          <PATH2>/.                    XYG3_Comp      energy
MB_096          <PATH2>/.                    XYG3_Comp      energy
MB_097          <PATH2>/.                    XYG3_Comp      energy
MB_098          <PATH2>/.                    XYG3_Comp      energy
MB_099          <PATH2>/.                    XYG3_Comp      energy
MB_100          <PATH2>/.                    XYG3_Comp      energy
MB_101          <PATH2>/.                    XYG3_Comp      energy
MB_102          <PATH2>/.                    XYG3_Comp      energy
MB_103          <PATH2>/.                    XYG3_Comp      energy
MB_104          <PATH2>/.                    XYG3_Comp      energy
MB_105          <PATH2>/.                    XYG3_Comp      energy
MB_106          <PATH2>/.                    XYG3_Comp      energy
MB_107          <PATH2>/.                    XYG3_Comp      energy
MB_108          <PATH2>/.                    XYG3_Comp      energy
MB_109          <PATH2>/.                    XYG3_Comp      energy
MB_110          <PATH2>/.                    XYG3_Comp      energy
MB_111          <PATH2>/.                    XYG3_Comp      energy
MB_112          <PATH2>/.                    XYG3_Comp      energy
MB_113          <PATH2>/.                    XYG3_Comp      energy
MB_114          <PATH2>/.                    XYG3_Comp      energy
MB_115          <PATH2>/.                    XYG3_Comp      energy
MB_116          <PATH2>/.                    XYG3_Comp      energy
MB_117          <PATH2>/.                    XYG3_Comp      energy
MB_118          <PATH2>/.                    XYG3_Comp      energy
MB_119          <PATH2>/.                    XYG3_Comp      energy
MB_120          <PATH2>/.                    XYG3_Comp      energy
MB_121          <PATH2>/.                    XYG3_Comp      energy
MB_122          <PATH2>/.                    XYG3_Comp      energy
MB_123          <PATH2>/.                    XYG3_Comp      energy
MB_124          <PATH2>/.                    XYG3_Comp      energy
MB_125          <PATH2>/.                    XYG3_Comp      energy
MB_126          <PATH2>/.                    XYG3_Comp      energy
MB_127          <PATH2>/.                    XYG3_Comp      energy
MB_128          <PATH2>/.                    XYG3_Comp      energy
MB_129          <PATH2>/.                    XYG3_Comp      energy
MB_130          <PATH2>/.                    XYG3_Comp      energy
MB_131          <PATH2>/.                    XYG3_Comp      energy
MB_132          <PATH2>/.                    XYG3_Comp      energy
MB_133          <PATH2>/.                    XYG3_Comp      energy
MB_134          <PATH2>/.                    XYG3_Comp      energy
MB_135          <PATH2>/.                    XYG3_Comp      energy
MB_136          <PATH2>/.                    XYG3_Comp      energy
MB_137          <PATH2>/.                    XYG3_Comp      energy
MB_138          <PATH2>/.                    XYG3_Comp      energy
MB_139          <PATH2>/.                    XYG3_Comp      energy
MB_140          <PATH2>/.                    XYG3_Comp      energy
MB_141          <PATH2>/.                    XYG3_Comp      energy
MB_142          <PATH2>/.                    XYG3_Comp      energy
MB_143          <PATH2>/.                    XYG3_Comp      energy
MB_144          <PATH2>/.                    XYG3_Comp      energy
MB_145          <PATH2>/.                    XYG3_Comp      energy
MB_146          <PATH2>/.                    XYG3_Comp      energy
MB_147          <PATH2>/.                    XYG3_Comp      energy
MB_148          <PATH2>/.                    XYG3_Comp      energy
MB_149          <PATH2>/.                    XYG3_Comp      energy
MB_150          <PATH2>/.                    XYG3_Comp      energy
MB_151          <PATH2>/.                    XYG3_Comp      energy
MB_152          <PATH2>/.                    XYG3_Comp      energy
MB_153          <PATH2>/.                    XYG3_Comp      energy
MB_154          <PATH2>/.                    XYG3_Comp      energy
MB_155          <PATH2>/.                    XYG3_Comp      energy
MB_156          <PATH2>/.                    XYG3_Comp      energy
MB_157          <PATH2>/.                    XYG3_Comp      energy
MB_158          <PATH2>/.                    XYG3_Comp      energy
MB_159          <PATH2>/.                    XYG3_Comp      energy
MB_160          <PATH2>/.                    XYG3_Comp      energy
MB_161          <PATH2>/.                    XYG3_Comp      energy
MB_162          <PATH2>/.                    XYG3_Comp      energy
MB_163          <PATH2>/.                    XYG3_Comp      energy
MB_164          <PATH2>/.                    XYG3_Comp      energy
MB_165          <PATH2>/.                    XYG3_Comp      energy
MB_166_h        <PATH2>/.                    XYG3_Comp      energy
MB_167_li       <PATH2>/.                    XYG3_Comp      energy
MB_168_be       <PATH2>/.                    XYG3_Comp      energy
MB_169_b        <PATH2>/.                    XYG3_Comp      energy
MB_170_c        <PATH2>/.                    XYG3_Comp      energy
MB_171_n        <PATH2>/.                    XYG3_Comp      energy
MB_172_o        <PATH2>/.                    XYG3_Comp      energy
MB_173_f        <PATH2>/.                    XYG3_Comp      energy
MB_174_na       <PATH2>/.                    XYG3_Comp      energy
MB_175_mg       <PATH2>/.                    XYG3_Comp      energy
MB_176_al       <PATH2>/.                    XYG3_Comp      energy
MB_177_si       <PATH2>/.                    XYG3_Comp      energy
MB_178_p        <PATH2>/.                    XYG3_Comp      energy
MB_179_s        <PATH2>/.                    XYG3_Comp      energy
MB_180_cl       <PATH2>/.                    XYG3_Comp      energy
W4_alcl3        <PATH2>/.                    XYG3_Comp      energy
W4_alcl         <PATH2>/.                    XYG3_Comp      energy
W4_al           <PATH2>/.                    XYG3_Comp      energy
W4_alf3         <PATH2>/.                    XYG3_Comp      energy
W4_alf          <PATH2>/.                    XYG3_Comp      energy
W4_alh3         <PATH2>/.                    XYG3_Comp      energy
W4_alh          <PATH2>/.                    XYG3_Comp      energy
W4_b2           <PATH2>/.                    XYG3_Comp      energy
W4_b2h6         <PATH2>/.                    XYG3_Comp      energy
W4_b            <PATH2>/.                    XYG3_Comp      energy
W4_be2          <PATH2>/.                    XYG3_Comp      energy
W4_becl2        <PATH2>/.                    XYG3_Comp      energy
W4_be           <PATH2>/.                    XYG3_Comp      energy
W4_bef2         <PATH2>/.                    XYG3_Comp      energy
W4_bf2h         <PATH2>/.                    XYG3_Comp      energy
W4_bf3          <PATH2>/.                    XYG3_Comp      energy
W4_bf           <PATH2>/.                    XYG3_Comp      energy
W4_bh3          <PATH2>/.                    XYG3_Comp      energy
W4_bh           <PATH2>/.                    XYG3_Comp      energy
W4_bn_S         <PATH2>/.                    XYG3_Comp      energy
W4_bn_T         <PATH2>/.                    XYG3_Comp      energy
W4_c2           <PATH2>/.                    XYG3_Comp      energy
W4_c2h2         <PATH2>/.                    XYG3_Comp      energy
W4_c2h4         <PATH2>/.                    XYG3_Comp      energy
W4_c2h6         <PATH2>/.                    XYG3_Comp      energy
W4_c2h          <PATH2>/.                    XYG3_Comp      energy
W4_ccl2         <PATH2>/.                    XYG3_Comp      energy
W4_c            <PATH2>/.                    XYG3_Comp      energy
W4_cf2          <PATH2>/.                    XYG3_Comp      energy
W4_cf           <PATH2>/.                    XYG3_Comp      energy
W4_ch2c         <PATH2>/.                    XYG3_Comp      energy
W4_ch2ch        <PATH2>/.                    XYG3_Comp      energy
W4_ch2          <PATH2>/.                    XYG3_Comp      energy
W4_ch2nh2       <PATH2>/.                    XYG3_Comp      energy
W4_ch2nh        <PATH2>/.                    XYG3_Comp      energy
W4_ch2o         <PATH2>/.                    XYG3_Comp      energy
W4_ch3          <PATH2>/.                    XYG3_Comp      energy
W4_ch3nh2       <PATH2>/.                    XYG3_Comp      energy
W4_ch3nh        <PATH2>/.                    XYG3_Comp      energy
W4_ch4          <PATH2>/.                    XYG3_Comp      energy
W4_ch           <PATH2>/.                    XYG3_Comp      energy
W4_cl2          <PATH2>/.                    XYG3_Comp      energy
W4_cl2o         <PATH2>/.                    XYG3_Comp      energy
W4_clcn         <PATH2>/.                    XYG3_Comp      energy
W4_cl           <PATH2>/.                    XYG3_Comp      energy
W4_clf          <PATH2>/.                    XYG3_Comp      energy
W4_clo          <PATH2>/.                    XYG3_Comp      energy
W4_cloo         <PATH2>/.                    XYG3_Comp      energy
W4_cn           <PATH2>/.                    XYG3_Comp      energy
W4_co2          <PATH2>/.                    XYG3_Comp      energy
W4_co           <PATH2>/.                    XYG3_Comp      energy
W4_cs2          <PATH2>/.                    XYG3_Comp      energy
W4_cs           <PATH2>/.                    XYG3_Comp      energy
W4_f2           <PATH2>/.                    XYG3_Comp      energy
W4_f2o          <PATH2>/.                    XYG3_Comp      energy
W4_f            <PATH2>/.                    XYG3_Comp      energy
W4_fo2          <PATH2>/.                    XYG3_Comp      energy
W4_foof         <PATH2>/.                    XYG3_Comp      energy
W4_h2cn         <PATH2>/.                    XYG3_Comp      energy
W4_h2           <PATH2>/.                    XYG3_Comp      energy
W4_h2o2         <PATH2>/.                    XYG3_Comp      energy
W4_h2o          <PATH2>/.                    XYG3_Comp      energy
W4_h2s          <PATH2>/.                    XYG3_Comp      energy
W4_hcl          <PATH2>/.                    XYG3_Comp      energy
W4_hcn          <PATH2>/.                    XYG3_Comp      energy
W4_hco          <PATH2>/.                    XYG3_Comp      energy
W4_h            <PATH2>/.                    XYG3_Comp      energy
W4_hf           <PATH2>/.                    XYG3_Comp      energy
W4_hno          <PATH2>/.                    XYG3_Comp      energy
W4_hocl         <PATH2>/.                    XYG3_Comp      energy
W4_hof          <PATH2>/.                    XYG3_Comp      energy
W4_hoo          <PATH2>/.                    XYG3_Comp      energy
W4_hs           <PATH2>/.                    XYG3_Comp      energy
W4_n2           <PATH2>/.                    XYG3_Comp      energy
W4_n2h2         <PATH2>/.                    XYG3_Comp      energy
W4_n2h4         <PATH2>/.                    XYG3_Comp      energy
W4_n2h          <PATH2>/.                    XYG3_Comp      energy
W4_n2o          <PATH2>/.                    XYG3_Comp      energy
W4_nccn         <PATH2>/.                    XYG3_Comp      energy
W4_n            <PATH2>/.                    XYG3_Comp      energy
W4_nh2          <PATH2>/.                    XYG3_Comp      energy
W4_nh3          <PATH2>/.                    XYG3_Comp      energy
W4_nh           <PATH2>/.                    XYG3_Comp      energy
W4_no2          <PATH2>/.                    XYG3_Comp      energy
W4_no           <PATH2>/.                    XYG3_Comp      energy
W4_o2           <PATH2>/.                    XYG3_Comp      energy
W4_o3           <PATH2>/.                    XYG3_Comp      energy
W4_oclo         <PATH2>/.                    XYG3_Comp      energy
W4_o            <PATH2>/.                    XYG3_Comp      energy
W4_ocs          <PATH2>/.                    XYG3_Comp      energy
W4_of           <PATH2>/.                    XYG3_Comp      energy
W4_oh           <PATH2>/.                    XYG3_Comp      energy
W4_P2           <PATH2>/.                    XYG3_Comp      energy
W4_P4           <PATH2>/.                    XYG3_Comp      energy
W4_P            <PATH2>/.                    XYG3_Comp      energy
W4_Ph3          <PATH2>/.                    XYG3_Comp      energy
W4_s2           <PATH2>/.                    XYG3_Comp      energy
W4_s2o          <PATH2>/.                    XYG3_Comp      energy
W4_s3           <PATH2>/.                    XYG3_Comp      energy
W4_s4           <PATH2>/.                    XYG3_Comp      energy
W4_s            <PATH2>/.                    XYG3_Comp      energy
W4_si2h6        <PATH2>/.                    XYG3_Comp      energy
W4_si           <PATH2>/.                    XYG3_Comp      energy
W4_sif          <PATH2>/.                    XYG3_Comp      energy
W4_sih4         <PATH2>/.                    XYG3_Comp      energy
W4_sih          <PATH2>/.                    XYG3_Comp      energy
W4_sio          <PATH2>/.                    XYG3_Comp      energy
W4_so2          <PATH2>/.                    XYG3_Comp      energy
W4_so3          <PATH2>/.                    XYG3_Comp      energy 
W4_so           <PATH2>/.                    XYG3_Comp      energy
W4_ssh          <PATH2>/.                    XYG3_Comp      energy
O3_c2h2         <PATH2>/.                    XYG3_Comp      energy
O3_c2h4         <PATH2>/.                    XYG3_Comp      energy
O3_o3_c2h2_add  <PATH2>/.                    XYG3_Comp      energy
O3_o3_c2h2_ts   <PATH2>/.                    XYG3_Comp      energy
O3_o3_c2h2_vdw  <PATH2>/.                    XYG3_Comp      energy
O3_o3_c2h4_add  <PATH2>/.                    XYG3_Comp      energy
O3_o3_c2h4_ts   <PATH2>/.                    XYG3_Comp      energy
O3_o3_c2h4_vdw  <PATH2>/.                    XYG3_Comp      energy
O3_o3           <PATH2>/.                    XYG3_Comp      energy


# Training set for the atomization energy
#              609 = 223+61+22+6+27+165+99+6 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 609 1.0
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
# G2IP + G2EA =  36 + 25 = 61
 1         IP_h  -1                                     0.50182467   3.0
 2         IP_li+ 1   IP_li       -1                    0.19649089   3.0
 2         IP_be+ 1   IP_b        -1                    0.34246466   3.0
 2         IP_b+  1   IP_b        -1                    0.30342146   3.0
 2         IP_c+  1   IP_c        -1                    0.41369859   3.0
 2         IP_n+  1   IP_n        -1                    0.53433411   3.0
 2         IP_o+  1   IP_o        -1                    0.50007171   3.0
 2         IP_f+  1   IP_f        -1                    0.64014916   3.0
 2         IP_na+ 1   IP_na       -1                    0.18884161   3.0
 2         IP_mg+ 1   IP_mg       -1                    0.28095170   3.0
 2         IP_al+ 1   IP_al       -1                    0.21991681   3.0
 2         IP_si+ 1   IP_si       -1                    0.29959682   3.0
 2         IP_p+  1   IP_p        -1                    0.38549186   3.0
 2         IP_s+  1   IP_s        -1                    0.38087042   3.0
 2         IP_cl+ 1   IP_cl       -1                    0.47664579   3.0
 2         IP_59  1   IP_08       -1                    0.47224586   3.0
 2         IP_60  1   IP_11       -1                    0.37559561   3.0
 2         IP_61  1   IP_12       -1                    0.47954136   3.0
 2         IP_62  1   IP_13       -1                    0.46636388   3.0
 2         IP_63  1   IP_14       -1                    0.59172125   3.0
 2         IP_64  1   IP_18       -1                    0.40698475   3.0
 2         IP_65  1   IP_n65      -1                    0.37307294   3.0
 2         IP_66  1   IP_19       -1                    0.36073847   3.0
 2         IP_67  1   IP_20       -1                    0.36305716   3.0
 2         IP_68  1   IP_137      -1                    0.38134850   3.0
 2         IP_70  1   IP_22       -1                    0.46924989   3.0
 2         IP_71  1   IP_25       -1                    0.42164268   3.0
 2         IP_72  1   IP_26       -1                    0.38837469   3.0
 2         IP_73  1   IP_30       -1                    0.51471052   3.0
 2         IP_74  1   IP_34       -1                    0.57268410   3.0
 2         IP_75  1   IP_37       -1                    0.44258578   3.0
 2         IP_76  1   IP_43       -1                    0.38701216   3.0
 2         IP_77  1   IP_44       -1                    0.34379851   3.0
 2         IP_78  1   IP_45       -1                    0.42243630   3.0
 2         IP_79  1   IP_51       -1                    0.46485156   3.0
 2         IP_80  1   IP_48       -1                    0.41617345   3.0
 2         EA_c   1   EA_c-       -1                    0.04653312   3.0
 2         EA_o   1   EA_o-       -1                    0.05370432   3.0
 2         EA_f   1   EA_f-       -1                    0.12493825   3.0
 2         EA_si  1   EA_si-      -1                    0.05115456   3.0
 2         EA_p   1   EA_p-       -1                    0.02756928   3.0
 2         EA_s   1   EA_s-       -1                    0.07649280   3.0
 2         EA_cl  1   EA_cl-      -1                    0.13306561   3.0
 2         EA_8n  1   EA_8        -1                    0.04446144   3.0
 2         EA_9n  1   EA_9        -1                    0.02135424   3.0
 2         EA_10n 1   EA_10       -1                    0.00191232   3.0
 2         EA_11n 1   EA_11       -1                    0.01322688   3.0
 2         EA_12n 1   EA_12       -1                    0.02677248   3.0
 2         EA_13n 1   EA_13       -1                    0.06645312   3.0
 2         EA_14n 1   EA_14       -1                    0.04669248   3.0
 2         EA_15n 1   EA_15       -1                    0.03999936   3.0
 2         EA_16n 1   EA_16       -1                    0.05003904   3.0
 2         EA_17n 1   EA_17       -1                    0.03744960   3.0
 2         EA_18n 1   EA_18       -1                    0.04589568   3.0
 2         EA_19n 1   EA_19       -1                    0.08637313   3.0
 2         EA_20n 1   EA_20       -1                    0.01513920   3.0
 2         EA_21n 1   EA_21       -1                    0.00031872   3.0
 2         EA_22n 1   EA_22       -1                    0.14262721   3.0
 2         EA_23n 1   EA_23       -1                    0.03968064   3.0
 2         EA_24n 1   EA_24       -1                    0.06055680   3.0
 2         EA_25n 1   EA_25       -1                    0.08716993   3.0
# 22 Non bond interaction for S22 set
 2         S22_1  -1   S22_01a    2                       0.00505171   10.0
 2         S22_2  -1   S22_02a    2                       0.00799987   10.0
 2         S22_3  -1   S22_03a    2                       0.02995968   10.0
 2         S22_4  -1   S22_04a    2                       0.02568883   10.0
 2         S22_5  -1   S22_05a    2                       0.03297159   10.0
 3         S22_6  -1   S22_06a    1        S22_06b  1     0.02709120   10.0
 3         S22_7  -1   S22_07a    1        S22_07b  1     0.02667687   10.0
 2         S22_8  -1   S22_08a    2                       0.00084461   10.0
 2         S22_9  -1   S22_09a    2                       0.00239040   10.0
 3         S22_10 -1   S22_10a    1        S22_10b  1     0.00231072   10.0
 2         S22_11 -1   S22_11a    2                       0.00417523   10.0
 2         S22_12 -1   S22_12a    2                       0.00669312   10.0
 2         S22_13 -1   S22_13a    2                       0.01552166   10.0
 3         S22_14 -1   S22_14a    1        S22_14b  1     0.00731462   10.0
 3         S22_15 -1   S22_15a    1        S22_15b  1     0.01858138   10.0
 3         S22_16 -1   S22_16a    1        S22_16b  1     0.00240634   10.0
 3         S22_17 -1   S22_17a    1        S22_17b  1     0.00524294   10.0
 3         S22_18 -1   S22_18a    1        S22_18b  1     0.00369715   10.0
 3         S22_19 -1   S22_19a    1        S22_19b  1     0.00725088   10.0
 3         S22_20 -1   S22_20a    1        S22_20b  1     0.00431866   10.0
 3         S22_21 -1   S22_21a    1        S22_21b  1     0.00895603   10.0
 3         S22_22 -1   S22_22a    1        S22_22b  1     0.01129862   10.0
# 6 vDW interactions for ADIM6
 2         AD2    -1   AM2        2                       0.00207168   30.0
 2         AD3    -1   AM3        2                       0.00313939   30.0
 2         AD4    -1   AM4        2                       0.00444614   30.0
 2         AD5    -1   AM5        2                       0.00586445   30.0
 2         AD6    -1   AM6        2                       0.00734650   30.0
 2         AD7    -1   AM7        2                       0.00892416   30.0
# 27 Hydrogon bonds for WATER27
 2    H2O2        -1   H2O        2                       0.00798394    3.0
 2    H2O3        -1   H2O        3                       0.02517888    3.0
 2    H2O4        -1   H2O        4                       0.04366464    3.0
 2    H2O5        -1   H2O        5                       0.05721024    3.0
 2    H2O6        -1   H2O        6                       0.07330560    3.0
 2    H2O6c       -1   H2O        6                       0.07298688    3.0
 2    H2O6b       -1   H2O        6                       0.07219008    3.0
 2    H2O6c2      -1   H2O        6                       0.07059648    3.0
 2    H2O8d2d     -1   H2O        8                       0.11569537    3.0
 2    H2O8s4      -1   H2O        8                       0.11569537    3.0
 2    H2O20       -1   H2O       20                       0.31887938    3.0
 2    H2O20fc     -1   H2O       20                       0.33879938    3.0
 2    H2O20fs     -1   H2O       20                       0.34262402    3.0
 2    H2O20es     -1   H2O       20                       0.34724546    3.0
 3    H3OpH2O     -1   H3Op       1      H2O        1     0.05338560    3.0
 3    H3OpH2O2    -1   H3Op       1      H2O        2     0.09067585    3.0
 3    H3OpH2O3    -1   H3Op       1      H2O        3     0.12191041    3.0
 3    H3OpH2O63d  -1   H3Op       1      H2O        6     0.18772609    3.0
 3    H3OpH2O62d  -1   H3Op       1      H2O        6     0.18310465    3.0
 3    OHmH2O      -1   OHm        1      H2O        1     0.04238976    3.0
 3    OHmH2O2     -1   OHm        1      H2O        2     0.07713024    3.0
 3    OHmH2O3     -1   OHm        1      H2O        3     0.10772737    3.0
 3    OHmH2O4c4   -1   OHm        1      H2O        4     0.13513729    3.0
 3    OHmH2O4cs   -1   OHm        1      H2O        4     0.13513729    3.0
 3    OHmH2O5     -1   OHm        1      H2O        5     0.16047553    3.0
 3    OHmH2O6     -1   OHm        1      H2O        6     0.18437953    3.0
 2    H3OpH2O6OHm  1   H2O8s4    -1                       0.04541760    3.0
# MB08 : 165
4  MB_001  -2  MB_170_c   2  MB_172_o  1  MB_166_h  2                                         0.2055441348  1.0
5  MB_002  -2  MB_171_n   1  MB_172_o  1  MB_178_p  1  MB_166_h  5                            0.0162539242  1.0
6  MB_003  -2  MB_166_h  -8  MB_169_b  4  MB_170_c  2  MB_167_li 2  MB_171_n  1              -0.1028187599  1.0
4  MB_004  -2  MB_168_be  2  MB_179_s  1  MB_166_h  4                                         0.1023339867  1.0
5  MB_005  -2  MB_168_be  2  MB_180_cl 1  MB_171_n  1  MB_166_h  3                            0.1646842281  1.0
6  MB_006  -2  MB_166_h  -4  MB_176_al 2  MB_169_b  2  MB_168_be 2  MB_171_n  1               0.1511728897  1.0
3  MB_007  -2  MB_177_si  2  MB_166_h  3                                                     -0.1335314178  1.0
4  MB_008  -1  MB_166_h  -2  MB_170_c  2  MB_167_li 1                                        -0.1400151392  1.0
6  MB_009  -2  MB_166_h  -4  MB_176_al 2  MB_169_b  2  MB_168_be 2  MB_173_f  1               0.1623161384  1.0
4  MB_010  -1  MB_174_na  1  MB_172_o  1  MB_166_h  2                                         0.1170202865  1.0
3  MB_011  -2  MB_168_be  2  MB_166_h  5                                                     -0.1114350369  1.0
3  MB_012  -1  MB_169_b   1  MB_166_h  2                                                      0.0100277446  1.0
4  MB_013  -2  MB_168_be  2  MB_178_p  1  MB_166_h  4                                        -0.0123144332  1.0
4  MB_014  -2  MB_167_li  4  MB_172_o  1  MB_166_h  3                                         0.3391818457  1.0
4  MB_015  -2  MB_168_be  2  MB_172_o  1  MB_166_h  4                                         0.2673821931  1.0
4  MB_016  -1  MB_169_b   1  MB_167_li 1  MB_166_h  1                                         0.1125924686  1.0
5  MB_017  -2  MB_168_be  2  MB_180_cl 1  MB_179_s  1  MB_166_h  3                            0.1494694905  1.0
3  MB_018  -1  MB_175_mg  1  MB_177_si 1                                                     -0.0034119138  1.0
4  MB_019  -2  MB_169_b   2  MB_175_mg 2  MB_178_p  1                                         0.1271847461  1.0
5  MB_020  -2  MB_169_b   2  MB_173_f  1  MB_167_li 2  MB_166_h  1                            0.5021896065  1.0
6  MB_021  -2  MB_166_h  -7  MB_168_be 2  MB_170_c  4  MB_173_f  1  MB_179_s  1               0.2316839572  1.0
4  MB_022  -2  MB_172_o   1  MB_178_p  1  MB_166_h  6                                         0.1307136141  1.0
3  MB_023  -1  MB_169_b   1  MB_167_li 2                                                      0.0532370799  1.0
4  MB_024  -2  MB_169_b   2  MB_168_be 2  MB_179_s  1                                         0.2655272426  1.0
4  MB_025  -2  MB_171_n   1  MB_179_s  1  MB_166_h  6                                        -0.0554542557  1.0
4  MB_026  -1  MB_169_b   1  MB_171_n  1  MB_166_h  1                                        -0.0859318577  1.0
4  MB_027  -1  MB_166_h  -1  MB_170_c  1  MB_177_si 1                                        -0.1024007586  1.0
5  MB_028  -2  MB_169_b   2  MB_173_f  1  MB_172_o  1  MB_166_h  2                            0.3638093417  1.0
6  MB_029  -2  MB_166_h  -2  MB_170_c  2  MB_173_f  1  MB_175_mg 2  MB_172_o  1               0.2255294736  1.0
4  MB_030  -2  MB_168_be  2  MB_171_n  1  MB_166_h  4                                        -0.0083487116  1.0
4  MB_031  -2  MB_169_b   2  MB_173_f  1  MB_166_h  3                                         0.3176905547  1.0
7  MB_032  -2  MB_166_h  -7  MB_176_al 2  MB_167_li 4  MB_171_n  1  MB_172_o  1  MB_177_si 2  0.5526047394  1.0
5  MB_033  -2  MB_169_b   2  MB_180_cl 1  MB_173_f  1  MB_166_h  2                            0.3933610620  1.0
4  MB_034  -2  MB_170_c   2  MB_173_f  1  MB_167_li 2                                        -0.0154829086  1.0
6  MB_035  -1  MB_166_h  -3  MB_169_b  1  MB_170_c  1  MB_167_li 1  MB_175_mg 1              -0.0078368472  1.0
5  MB_036  -2  MB_166_h  -1  MB_170_c  2  MB_167_li 2  MB_174_na 2                           -0.0548678109  1.0
5  MB_037  -2  MB_166_h  -5  MB_170_c  2  MB_175_mg 2  MB_177_si 2                           -0.3177001163  1.0
6  MB_038  -2  MB_166_h  -2  MB_168_be 2  MB_170_c  2  MB_171_n  1  MB_172_o  1               0.0663812529  1.0
6  MB_039  -2  MB_166_h  -3  MB_169_b  2  MB_170_c  2  MB_180_cl 1  MB_178_p  1               0.0406731367  1.0
6  MB_040  -2  MB_166_h  -3  MB_168_be 4  MB_180_cl 1  MB_167_li 2  MB_171_n  2               0.2310369556  1.0
5  MB_041  -2  MB_176_al  2  MB_173_f  2  MB_178_p  1  MB_166_h  1                            0.4352663703  1.0
5  MB_042  -2  MB_169_b   2  MB_173_f  1  MB_167_li 2  MB_166_h  1                            0.5037099010  1.0
6  MB_043  -2  MB_166_h  -3  MB_176_al 2  MB_170_c  2  MB_180_cl 1  MB_179_s   1              0.0507545696  1.0
3  MB_044  -1  MB_176_al  1  MB_166_h  2                                                      0.0059778012  1.0
4  MB_045  -1  MB_169_b   1  MB_174_na 1  MB_166_h  1                                         0.1044542716  1.0
6  MB_046  -1  MB_166_h  -3  MB_169_b  1  MB_168_be 1  MB_174_na 1  MB_177_si  1              0.0583632133  1.0
4  MB_047  -2  MB_167_li  2  MB_178_p  1  MB_166_h  5                                         0.0789085433  1.0
5  MB_048  -2  MB_166_h  -2  MB_176_al 2  MB_170_c  2  MB_172_o  1                            0.1535052828  1.0
4  MB_049  -2  MB_168_be  2  MB_179_s  1  MB_166_h  4                                         0.1490065497  1.0
4  MB_050  -2  MB_176_al  2  MB_180_cl 1  MB_166_h  3                                         0.0997942662  1.0
5  MB_051  -2  MB_173_f   1  MB_167_li 2  MB_171_n  1  MB_166_h  4                            0.1407066023  1.0
5  MB_052  -2  MB_166_h  -2  MB_169_b  2  MB_170_c  2  MB_179_s  1                           -0.0202290003  1.0
5  MB_053  -2  MB_166_h  -2  MB_169_b  2  MB_170_c  2  MB_172_o  1                            0.0764658731  1.0
4  MB_054  -2  MB_168_be  4  MB_171_n  1  MB_166_h  1                                         0.0270086532  1.0
6  MB_055  -2  MB_180_cl  1  MB_173_f  1  MB_175_mg 2  MB_179_s  1  MB_166_h   2              0.6910869946  1.0
4  MB_056  -2  MB_173_f   1  MB_167_li 2  MB_166_h  5                                         0.3959411005  1.0
4  MB_057  -1  MB_169_b   1  MB_174_na 1  MB_166_h  1                                         0.1040569871  1.0
4  MB_058  -1  MB_167_li  1  MB_171_n  1  MB_166_h  2                                         0.0210694650  1.0
3  MB_059  -2  MB_180_cl  1  MB_166_h  7                                                      0.0793855078  1.0
5  MB_060  -2  MB_169_b   2  MB_173_f  1  MB_171_n  1  MB_166_h  2                            0.4495896480  1.0
4  MB_061  -2  MB_168_be  2  MB_179_s  1  MB_166_h  4                                         0.1544834345  1.0
3  MB_062  -1  MB_174_na  1  MB_166_h  3                                                      0.0035205017  1.0
6  MB_063  -2  MB_166_h  -1  MB_176_al 2  MB_173_f  1  MB_175_mg 2  MB_179_s   1              0.5276394002  1.0
5  MB_064  -2  MB_166_h  -3  MB_170_c  2  MB_171_n  1  MB_177_si 2                           -0.0722815573  1.0
4  MB_065  -2  MB_175_mg  2  MB_172_o  1  MB_166_h  4                                         0.2953865277  1.0
4  MB_066  -2  MB_176_al  2  MB_171_n  1  MB_166_h  3                                         0.0125515769  1.0
5  MB_067  -2  MB_166_h  -1  MB_176_al 2  MB_169_b  2  MB_171_n  1                            0.2130898312  1.0
4  MB_068  -2  MB_169_b   2  MB_171_n  1  MB_166_h  3                                         0.1653344170  1.0
4  MB_069  -2  MB_173_f   1  MB_171_n  1  MB_166_h  6                                         0.3207088333  1.0
5  MB_070  -2  MB_166_h  -1  MB_168_be 2  MB_170_c  2  MB_173_f  1                            0.0997494861  1.0
5  MB_071  -2  MB_166_h  -2  MB_176_al 2  MB_170_c  2  MB_172_o  1                            0.1518947905  1.0
4  MB_072  -2  MB_174_na  2  MB_172_o  1  MB_177_si 2                                         0.2373460184  1.0
5  MB_073  -1  MB_166_h  -2  MB_169_b  1  MB_168_be 1  MB_170_c  1                           -0.0597649440  1.0
6  MB_074  -1  MB_166_h  -5  MB_169_b  2  MB_168_be 1  MB_167_li 1  MB_177_si  1              0.0277144587  1.0
5  MB_075  -2  MB_170_c   2  MB_173_f  1  MB_171_n  1  MB_172_o  1                            0.0518825198  1.0
4  MB_076  -1  MB_169_b   1  MB_167_li 1  MB_166_h  1                                         0.1043752291  1.0
5  MB_077  -2  MB_169_b   2  MB_173_f  1  MB_171_n  2  MB_166_h  1                            0.1460338481  1.0
4  MB_078  -2  MB_176_al  2  MB_168_be 2  MB_172_o  1                                         0.3589377062  1.0
3  MB_079  -2  MB_173_f   1  MB_166_h  7                                                      0.2223661774  1.0
6  MB_080  -1  MB_166_h  -3  MB_169_b  1  MB_168_be 1  MB_170_c  1  MB_167_li  1              0.0593137958  1.0
4  MB_081  -2  MB_167_li  2  MB_178_p  1  MB_166_h  5                                         0.1383654444  1.0
4  MB_082  -2  MB_166_h  -3  MB_170_c  4  MB_171_n  1                                        -0.1919331963  1.0
5  MB_083  -2  MB_166_h -10  MB_170_c  6  MB_173_f  1  MB_167_li 2                           -0.2693949100  1.0
3  MB_084  -1  MB_166_h  -1  MB_170_c  2                                                     -0.0292317254  1.0
4  MB_085  -2  MB_166_h  -3  MB_170_c  4  MB_172_o  1                                        -0.1875938232  1.0
3  MB_086  -1  MB_169_b   1  MB_166_h  2                                                      0.0101328903  1.0
6  MB_087  -1  MB_166_h  -4  MB_176_al 1  MB_169_b  1  MB_170_c  1  MB_175_mg  1             -0.0867900113  1.0
5  MB_088  -2  MB_166_h  -9  MB_170_c  6  MB_171_n  1  MB_179_s  1                           -0.6292903699  1.0
5  MB_089  -2  MB_166_h  -7  MB_169_b  2  MB_170_c  4  MB_171_n  1                           -0.3190052748  1.0
3  MB_090  -2  MB_170_c   2  MB_166_h  3                                                     -0.1737008175  1.0
5  MB_091  -2  MB_166_h  -3  MB_169_b  2  MB_170_c  2  MB_172_o  2                            0.0600192826  1.0
3  MB_092  -1  MB_170_c   1  MB_175_mg 1                                                     -0.0124976654  1.0
5  MB_093  -2  MB_171_n   1  MB_178_p  1  MB_177_si 2  MB_166_h  1                            0.0277348568  1.0
5  MB_094  -2  MB_170_c   2  MB_172_o  1  MB_179_s  1  MB_166_h  1                            0.0711086676  1.0
5  MB_095  -2  MB_166_h -11  MB_170_c  6  MB_175_mg 2  MB_178_p  1                           -0.5447180125  1.0
4  MB_096  -2  MB_166_h  -3  MB_170_c  4  MB_178_p  1                                        -0.1398368153  1.0
4  MB_097  -2  MB_166_h  -3  MB_170_c  4  MB_179_s  1                                        -0.2094962630  1.0
4  MB_098  -2  MB_172_o   1  MB_179_s  1  MB_166_h  6                                         0.2894057465  1.0
4  MB_099  -2  MB_170_c   2  MB_172_o  1  MB_166_h  2                                         0.1081533362  1.0
4  MB_100  -1  MB_166_h  -3  MB_169_b  1  MB_170_c  2                                        -0.1575313541  1.0
3  MB_101  -2  MB_172_o   1  MB_166_h  7                                                      0.0325934248  1.0
5  MB_102  -2  MB_166_h  -1  MB_170_c  2  MB_175_mg 2  MB_172_o  1                           -0.0167807684  1.0
5  MB_103  -2  MB_166_h  -4  MB_170_c  4  MB_171_n  1  MB_172_o  1                           -0.2736163567  1.0
5  MB_104  -2  MB_166_h  -9  MB_170_c  4  MB_167_li 2  MB_177_si 2                           -0.3313110548  1.0
4  MB_105  -2  MB_166_h  -3  MB_170_c  4  MB_171_n  1                                        -0.1709725741  1.0
5  MB_106  -2  MB_166_h  -4  MB_170_c  4  MB_173_f  1  MB_178_p  1                           -0.1608213415  1.0
4  MB_107  -2  MB_170_c   2  MB_171_n  2  MB_166_h  1                                        -0.1988749183  1.0
5  MB_108  -2  MB_170_c   2  MB_171_n  1  MB_178_p  1  MB_179_s  1                           -0.2007298688  1.0
3  MB_109  -1  MB_171_n   1  MB_166_h  3                                                     -0.0135058565  1.0
4  MB_110  -1  MB_166_h  -5  MB_170_c  3  MB_175_mg 1                                        -0.2980239359  1.0
4  MB_111  -2  MB_166_h  -8  MB_170_c  6  MB_171_n  1                                        -0.5774473714  1.0
5  MB_112  -2  MB_166_h  -9  MB_170_c  6  MB_172_o  1  MB_178_p  1                           -0.5734426543  1.0
6  MB_113  -2  MB_166_h  -8  MB_170_c  4  MB_167_li 2  MB_175_mg 2  MB_172_o  1               0.0724554190  1.0
5  MB_114  -2  MB_166_h  -2  MB_176_al 2  MB_170_c  2  MB_171_n  1                           -0.2340982614  1.0
5  MB_115  -2  MB_170_c   2  MB_171_n  1  MB_172_o  1  MB_166_h  1                           -0.1082744498  1.0
6  MB_116  -2  MB_176_al  2  MB_173_f  1  MB_172_o  1  MB_178_p  1  MB_166_h  1               0.4384854425  1.0
4  MB_117  -2  MB_166_h  -3  MB_170_c  4  MB_173_f  1                                        -0.0405693933  1.0
4  MB_118  -1  MB_176_al  1  MB_172_o  1  MB_166_h  1                                         0.0837710953  1.0
5  MB_119  -2  MB_173_f   1  MB_172_o  1  MB_178_p  1  MB_166_h  5                            0.3846440694  1.0
4  MB_120  -2  MB_167_li  2  MB_179_s  1  MB_166_h  5                                         0.0719907252  1.0
4  MB_121  -1  MB_166_h  -3  MB_176_al 1  MB_170_c  2                                        -0.0947379325  1.0
6  MB_122  -2  MB_166_h  -5  MB_170_c  2  MB_172_o  2  MB_178_p  1  MB_177_si 2               0.3073496837  1.0
4  MB_123  -2  MB_170_c   2  MB_171_n  1  MB_166_h  2                                        -0.2001083648  1.0
5  MB_124  -2  MB_166_h  -8  MB_170_c  4  MB_178_p  1  MB_177_si 2                           -0.4962231678  1.0
6  MB_125  -2  MB_166_h  -1  MB_170_c  2  MB_180_cl 1  MB_167_li 2  MB_179_s  1               0.0997960192  1.0
5  MB_126  -2  MB_166_h  -2  MB_169_b  2  MB_170_c  2  MB_172_o  1                            0.0956945706  1.0
4  MB_127  -1  MB_166_h  -1  MB_170_c  1  MB_177_si 1                                        -0.1021497665  1.0
5  MB_128  -2  MB_166_h  -1  MB_170_c  2  MB_175_mg 2  MB_178_p  1                           -0.0990903731  1.0
4  MB_129  -2  MB_166_h -18  MB_170_c 10  MB_172_o  1                                        -0.9093337158  1.0
5  MB_130  -2  MB_166_h  -8  MB_170_c  4  MB_179_s  1  MB_177_si 2                           -0.3061417348  1.0
4  MB_131  -2  MB_166_h  -3  MB_170_c  4  MB_178_p  1                                        -0.1529848130  1.0
5  MB_132  -2  MB_166_h  -7  MB_169_b  2  MB_170_c  4  MB_173_f  1                           -0.0604111488  1.0
4  MB_133  -2  MB_173_f   1  MB_178_p  1  MB_166_h  6                                         0.1715478638  1.0
5  MB_134  -1  MB_166_h  -2  MB_170_c  1  MB_171_n  1  MB_177_si 1                           -0.1305762458  1.0
5  MB_135  -2  MB_180_cl  1  MB_171_n  2  MB_178_p  1  MB_166_h  4                            0.0629632994  1.0
5  MB_136  -2  MB_166_h  -2  MB_169_b  2  MB_170_c  2  MB_172_o  1                            0.0783665599  1.0
4  MB_137  -1  MB_166_h  -1  MB_170_c  1  MB_177_si 1                                        -0.0101173368  1.0
4  MB_138  -2  MB_171_n   1  MB_174_na 2  MB_166_h  5                                         0.0756477188  1.0
4  MB_139  -2  MB_166_h  -3  MB_170_c  4  MB_171_n  1                                        -0.4250067728  1.0
5  MB_140  -2  MB_166_h  -2  MB_169_b  2  MB_170_c  2  MB_172_o  1                            0.0404586381  1.0
4  MB_141  -2  MB_170_c   2  MB_179_s  1  MB_166_h  2                                        -0.1829405109  1.0
5  MB_142  -2  MB_166_h  -4  MB_170_c  4  MB_172_o  1  MB_179_s  1                           -0.1374754187  1.0
4  MB_143  -2  MB_166_h  -3  MB_170_c  4  MB_171_n  1                                        -0.3066325636  1.0
5  MB_144  -2  MB_176_al  2  MB_180_cl 1  MB_178_p  1  MB_166_h  2                            0.2853484407  1.0
5  MB_145  -2  MB_166_h -11  MB_169_b  4  MB_170_c  4  MB_178_p  1                           -0.2771111217  1.0
5  MB_146  -1  MB_166_h  -4  MB_176_al 1  MB_170_c  2  MB_174_na 1                           -0.0876569298  1.0
5  MB_147  -2  MB_166_h  -3  MB_170_c  2  MB_173_f  1  MB_177_si 2                           -0.1084553234  1.0
6  MB_148  -2  MB_166_h -12  MB_169_b  2  MB_170_c  4  MB_179_s  1  MB_177_si 2              -0.4139758729  1.0
5  MB_149  -2  MB_170_c   2  MB_171_n  1  MB_179_s  1  MB_166_h  1                           -0.1864448375  1.0
5  MB_150  -2  MB_166_h  -7  MB_176_al 2  MB_170_c  4  MB_171_n  1                           -0.1902216698  1.0
4  MB_151  -2  MB_166_h  -3  MB_170_c  4  MB_171_n  1                                        -0.3588914918  1.0
5  MB_152  -2  MB_170_c   2  MB_171_n  1  MB_172_o  1  MB_166_h  1                            0.0943197718  1.0
4  MB_153  -2  MB_180_cl  2  MB_172_o  1  MB_177_si 2                                         0.4807126580  1.0
5  MB_154  -2  MB_166_h -13  MB_170_c  6  MB_173_f  1  MB_177_si 2                           -0.4982502271  1.0
5  MB_155  -1  MB_166_h  -6  MB_176_al 2  MB_170_c  2  MB_167_li 1                           -0.1151105162  1.0
4  MB_156  -2  MB_166_h  -3  MB_180_cl 1  MB_177_si 4                                        -0.1239643990  1.0
3  MB_157  -1  MB_166_h  -6  MB_170_c  4                                                     -0.3835492661  1.0
5  MB_158  -2  MB_166_h  -8  MB_170_c  4  MB_172_o  1  MB_177_si 2                           -0.2615464295  1.0
5  MB_159  -2  MB_175_mg  2  MB_172_o  1  MB_178_p  1  MB_166_h  3                            0.2874711160  1.0
4  MB_160  -2  MB_180_cl  2  MB_178_p  1  MB_166_h  5                                         0.2036939650  1.0
4  MB_161  -2  MB_180_cl  1  MB_171_n  2  MB_166_h  5                                        -0.1264604548  1.0
4  MB_162  -1  MB_166_h  -1  MB_170_c  1  MB_177_si 1                                        -0.1023856194  1.0
5  MB_163  -2  MB_166_h  -4  MB_170_c  4  MB_172_o  1  MB_179_s  1                           -0.0677009131  1.0
5  MB_164  -2  MB_170_c   2  MB_171_n  1  MB_172_o  1  MB_166_h  1                            0.0833247279  1.0
5  MB_165  -2  MB_166_h -10  MB_170_c  6  MB_167_li 2  MB_172_o  1                           -0.2177335819  1.0
#  W4  : 99
3  W4_h     6  W4_b       2  W4_b2h6  -1                                                      0.9673471339  1.0
4  W4_h     1  W4_b       1  W4_f      2  W4_bf2h   -1                                        0.6549218339  1.0
3  W4_f     3  W4_b       1  W4_bf3   -1                                                      0.7505378400  1.0
3  W4_h     6  W4_c       2  W4_c2h6  -1                                                      1.1363643607  1.0
4  W4_h     2  W4_c       1  W4_n      1  W4_h2cn   -1                                        0.5478000351  1.0
3  W4_c     2  W4_n       2  W4_nccn  -1                                                      0.8000509952  1.0
4  W4_h     4  W4_c       1  W4_n      1  W4_ch2nh2 -1                                        0.7685614572  1.0
4  W4_h     4  W4_c       1  W4_n      1  W4_ch3nh  -1                                        0.7563704164  1.0
4  W4_h     5  W4_c       1  W4_n      1  W4_ch3nh2 -1                                        0.9279533394  1.0
3  W4_f     2  W4_c       1  W4_cf2   -1                                                      0.4123918344  1.0
3  W4_h     1  W4_n       2  W4_n2h   -1                                                      0.3583369189  1.0
3  W4_h     2  W4_n       2  W4_n2h2  -1                                                      0.4725502382  1.0
3  W4_h     4  W4_n       2  W4_n2h4  -1                                                      0.6984430527  1.0
3  W4_f     1  W4_o       2  W4_fo2   -1                                                      0.2146898057  1.0
3  W4_f     2  W4_o       2  W4_foof  -1                                                      0.2428168475  1.0
3  W4_f     3  W4_al      1  W4_alf3  -1                                                      0.6867938360  1.0
3  W4_h     6  W4_si      2  W4_si2h6 -1                                                      0.8539943587  1.0
2  W4_p     4  W4_p4     -1                                                                   0.4630683176  1.0
3  W4_s     1  W4_o       2  W4_so2   -1                                                      0.4153240586  1.0
3  W4_s     1  W4_o       3  W4_so3   -1                                                      0.5528836194  1.0
4  W4_o     1  W4_c       1  W4_s      1  W4_ocs    -1                                        0.5350512342  1.0
3  W4_c     1  W4_s       2  W4_cs2   -1                                                      0.4474510366  1.0
3  W4_o     1  W4_s       2  W4_s2o   -1                                                      0.3327118293  1.0
2  W4_s     3  W4_s3     -1                                                                   0.2682985132  1.0
2  W4_s     4  W4_s4     -1                                                                   0.3734601839  1.0
3  W4_be    1  W4_cl      2  W4_becl2 -1                                                      0.3589902950  1.0
3  W4_c     1  W4_cl      2  W4_ccl2  -1                                                      0.2826409141  1.0
3  W4_al    1  W4_cl      3  W4_alcl3 -1                                                      0.4982390719  1.0
4  W4_cl    1  W4_c       1  W4_n      1  W4_clcn   -1                                        0.4548931491  1.0
3  W4_o     2  W4_cl      1  W4_oclo  -1                                                      0.2041720451  1.0
3  W4_o     2  W4_cl      1  W4_cloo  -1                                                      0.2014151169  1.0
3  W4_o     1  W4_cl      2  W4_cl2o  -1                                                      0.1616866663  1.0
2  W4_h     2  W4_h2     -1                                                                   0.1744832752  1.0
3  W4_h     1  W4_o       1  W4_oh    -1                                                      0.1708498669  1.0
3  W4_h     1  W4_f       1  W4_hf    -1                                                      0.2257175184  1.0
3  W4_h     2  W4_o       1  W4_h2o   -1                                                      0.3712610158  1.0
3  W4_h     1  W4_c       1  W4_ch    -1                                                      0.1342130006  1.0
3  W4_h     2  W4_c       1  W4_ch2   -1                                                      0.3039632835  1.0
3  W4_h     3  W4_c       1  W4_ch3   -1                                                      0.4906216634  1.0
3  W4_h     4  W4_c       1  W4_ch4   -1                                                      0.6699813549  1.0
3  W4_h     1  W4_c       2  W4_c2h   -1                                                      0.4241526031  1.0
3  W4_h     2  W4_c       2  W4_c2h2  -1                                                      0.6462367134  1.0
3  W4_h     3  W4_n       1  W4_nh3   -1                                                      0.4749247024  1.0
2  W4_c     2  W4_c2     -1                                                                   0.2342910870  1.0
2  W4_n     2  W4_n2     -1                                                                   0.3641057513  1.0
3  W4_c     1  W4_o       1  W4_co    -1                                                      0.4139057545  1.0
3  W4_c     1  W4_n       1  W4_cn    -1                                                      0.2889993785  1.0
3  W4_o     1  W4_n       1  W4_no    -1                                                      0.2434224156  1.0
2  W4_o     2  W4_o2     -1                                                                   0.1925387643  1.0
3  W4_o     1  W4_f       1  W4_of    -1                                                      0.0845882934  1.0
2  W4_f     2  W4_f2     -1                                                                   0.0622141480  1.0
3  W4_h     3  W4_p       1  W4_ph3   -1                                                      0.3860814967  1.0
3  W4_h     1  W4_s       1  W4_hs    -1                                                      0.1398065369  1.0
3  W4_h     2  W4_s       1  W4_h2s   -1                                                      0.2930789948  1.0
3  W4_h     1  W4_cl      1  W4_hcl   -1                                                      0.1713120110  1.0
3  W4_s     1  W4_o       1  W4_so    -1                                                      0.2015426049  1.0
3  W4_cl    1  W4_o       1  W4_clo   -1                                                      0.1043011267  1.0
3  W4_cl    1  W4_f       1  W4_clf   -1                                                      0.1000780864  1.0
2  W4_p     2  W4_p2     -1                                                                   0.1873914360  1.0
2  W4_s     2  W4_s2     -1                                                                   0.1661328106  1.0
2  W4_cl    2  W4_cl2    -1                                                                   0.0952176061  1.0
2  W4_be    2  W4_be2    -1                                                                   0.0042549123  1.0
2  W4_b     2  W4_b2     -1                                                                   0.1075042629  1.0
3  W4_h     1  W4_b       1  W4_bh    -1                                                      0.1354400727  1.0
3  W4_h     3  W4_b       1  W4_bh3   -1                                                      0.4482637727  1.0
3  W4_n     1  W4_b       1  W4_bn_S  -1                                                      0.1677104747  1.0
3  W4_f     1  W4_b       1  W4_bf    -1                                                      0.2908638906  1.0
3  W4_n     1  W4_h       1  W4_nh    -1                                                      0.1324281685  1.0
3  W4_n     1  W4_h       2  W4_nh2   -1                                                      0.2909754426  1.0
4  W4_h     1  W4_c       1  W4_n      1  W4_hcn    -1                                        0.4994661440  1.0
4  W4_h     1  W4_o       1  W4_f      1  W4_hof    -1                                        0.2528246562  1.0
3  W4_h     1  W4_al      1  W4_alh   -1                                                      0.1172411595  1.0
3  W4_h     3  W4_al      1  W4_alh3  -1                                                      0.3397077337  1.0
3  W4_f     1  W4_al      1  W4_alf   -1                                                      0.2609998247  1.0
3  W4_cl    1  W4_al      1  W4_alcl  -1                                                      0.1954072445  1.0
3  W4_h     1  W4_si      1  W4_sih   -1                                                      0.1177989195  1.0
3  W4_h     4  W4_si      1  W4_sih4  -1                                                      0.5178403531  1.0
3  W4_o     1  W4_si      1  W4_sio   -1                                                      0.3076444997  1.0
3  W4_f     1  W4_si      1  W4_sif   -1                                                      0.2274226706  1.0
3  W4_c     1  W4_s       1  W4_cs    -1                                                      0.2744498096  1.0
3  W4_n     1  W4_b       1  W4_bn_T  -1                                                      0.1686347628  1.0
3  W4_c     1  W4_f       1  W4_cf    -1                                                      0.2115026055  1.0
3  W4_be    1  W4_f       2  W4_bef2  -1                                                      0.4925817915  1.0
3  W4_h     2  W4_c       2  W4_ch2c  -1                                                      0.5735844847  1.0
3  W4_h     3  W4_c       2  W4_ch2ch -1                                                      0.7108731335  1.0
3  W4_h     4  W4_c       2  W4_c2h4  -1                                                      0.8989498175  1.0
4  W4_h     3  W4_c       1  W4_n      1  W4_ch2nh  -1                                        0.7002916288  1.0
4  W4_h     1  W4_c       1  W4_o      1  W4_hco    -1                                        0.4452837405  1.0
4  W4_h     2  W4_c       1  W4_o      1  W4_ch2o   -1                                        0.5970582142  1.0
3  W4_c     1  W4_o       2  W4_co2   -1                                                      0.6217271438  1.0
4  W4_h     1  W4_n       1  W4_o      1  W4_hno    -1                                        0.3281063250  1.0
3  W4_n     1  W4_o       2  W4_no2   -1                                                      0.3631495912  1.0
3  W4_n     2  W4_o       1  W4_n2o   -1                                                      0.4316265876  1.0
2  W4_o     3  W4_o3     -1                                                                   0.2349444630  1.0
3  W4_h     1  W4_o       2  W4_hoo   -1                                                      0.2797246259  1.0
3  W4_h     2  W4_o       2  W4_h2o2  -1                                                      0.4288218514  1.0
3  W4_f     2  W4_o       1  W4_f2o   -1                                                      0.1494478176  1.0
4  W4_h     1  W4_o       1  W4_cl     1  W4_hocl   -1                                        0.2649041450  1.0
3  W4_h     1  W4_s       2  W4_ssh   -1                                                      0.2631511848  1.0
# O3ADD6  : 6
3  O3_o3   -1  O3_c2h2   -1  O3_o3_c2h2_vdw  1                                               -0.0030278402 10.0
3  O3_o3   -1  O3_c2h2   -1  O3_o3_c2h2_ts   1                                                0.0123344648 10.0
3  O3_o3   -1  O3_c2h2   -1  O3_o3_c2h2_add  1                                               -0.1016716865 10.0
3  O3_o3   -1  O3_c2h4   -1  O3_o3_c2h4_vdw  1                                               -0.0030915842 10.0
3  O3_o3   -1  O3_c2h4   -1  O3_o3_c2h4_ts   1                                                0.0053704323 10.0
3  O3_o3   -1  O3_c2h4   -1  O3_o3_c2h4_add  1                                               -0.0910742458 10.0




#               759 = 17+223+56+12+121+30+300 is the total number of jobs in this batch list
__xyg3 components__ ::  759
#        E_noXC  E_K   Ex_LDA   dEx_Becke  Ec_VWN  dEc_LYP  PT2_1ST  aaaa  abab  bbbb aaaa_erf200 abab_erf200 bbbb_erf200
# 17 atoms
# 223 molecules in G3 set
   H_0 -0.19104055 -0.30856519 -0.26510153 -0.04167383 -0.03982214 0.03982214 -0.00041034 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
  He_0 -1.84290558 -1.01762809 -0.87854197 -0.14163427 -0.14977119 0.10602829 -0.00134402 0.00000000 -0.04395916 0.00000000 0.00000000 -0.00000371 0.00000000
  Li_0 -5.65621156 -1.77489959 -1.53482893 -0.23741672 -0.20611693 0.15211412 -0.00133310 -0.00040716 -0.03538369 0.00000000 -0.00000713 -0.00000838 0.00000000
  Be_0 -11.90783558 -2.66311785 -2.31274310 -0.34543358 -0.29852585 0.20321243 -0.00165509 -0.00049614 -0.09124156 -0.00049614 -0.00000157 -0.00069048 -0.00000157
   B_0 -20.77065700 -3.75899026 -3.29358824 -0.46309383 -0.38252202 0.25651717 -0.00275112 -0.00785727 -0.08986693 -0.00037998 -0.00006146 -0.00027807 -0.00000047
   C_0 -32.62998698 -5.05933308 -4.47982807 -0.57977203 -0.47036693 0.31109395 -0.00386903 -0.02099099 -0.10747598 -0.00041432 -0.00005586 -0.00012722 -0.00000017
   N_0 -47.81680802 -6.58297760 -5.88865521 -0.69440980 -0.56034516 0.36782304 -0.00459921 -0.04476842 -0.11848211 -0.00043869 -0.00003966 -0.00006319 -0.00000007
   O_0 -66.62738365 -8.18491416 -7.36763884 -0.83697391 -0.68781490 0.43027670 -0.00644920 -0.04625977 -0.17826774 -0.00731857 -0.00001833 -0.00003987 -0.00000507
   F_0 -89.40469929 -10.00383118 -9.06794726 -0.97267191 -0.81688215 0.49552010 -0.00835083 -0.04781623 -0.23773897 -0.02367319 -0.00000922 -0.00002498 -0.00000574
  Ne_0 -116.47907128 -12.06014915 -11.00617795 -1.10267225 -0.94594369 0.56267197 -0.00978811 -0.04853540 -0.29158273 -0.04853540 -0.00000502 -0.00001604 -0.00000502
  Na_0 -147.88074091 -13.97389123 -12.75324684 -1.24261164 -1.02428462 0.61512896 -0.00495891 -0.02535565 -0.13699940 -0.02275200 -0.00004175 -0.00004646 -0.00000133
  Mg_0 -183.65179911 -15.95790925 -14.58753762 -1.38675228 -1.13095698 0.67026488 -0.00488538 -0.02753035 -0.18852221 -0.02753035 -0.00002313 -0.00123037 -0.00002313
  Al_0 -223.81220273 -18.05986517 -16.54040191 -1.53413553 -1.22376571 0.72843047 -0.00748977 -0.03651947 -0.21817383 -0.03120721 -0.00025723 -0.00090466 -0.00001088
  Si_0 -268.57594628 -20.27367087 -18.60087070 -1.68047423 -1.31961686 0.78836033 -0.00810829 -0.05083183 -0.24340152 -0.03276624 -0.00039858 -0.00063393 -0.00000562
   P_0 -318.09429743 -22.61644958 -20.78885770 -1.82597090 -1.41720141 0.84960606 -0.00780015 -0.07844456 -0.26513021 -0.03407460 -0.00041656 -0.00043810 -0.00000313
   S_0 -372.50414351 -24.99855714 -23.01402273 -1.98209584 -1.54315504 0.91298766 -0.00890185 -0.07367719 -0.31283819 -0.04026823 -0.00023443 -0.00040280 -0.00004384
  Cl_0 -431.97346084 -27.50574996 -25.36578503 -2.13517786 -1.66977140 0.97819484 -0.00940420 -0.07396463 -0.35769473 -0.05336776 -0.00013982 -0.00032438 -0.00007450
  G2-1 -5.85121576 -2.13348220 -1.84861426 -0.28380784 -0.29100512 0.20209125 -0.00301401 -0.00037099 -0.07872220 -0.00037099 -0.00000269 -0.00021968 -0.00000269
  G2-2 -12.07944235 -3.07017235 -2.67325492 -0.38836349 -0.35891384 0.25019606 -0.00296758 -0.00339723 -0.08595802 -0.00041185 -0.00007484 -0.00023576 -0.00000081
  G2-3 -32.87320124 -5.40476065 -4.79765976 -0.61490096 -0.55442391 0.35729487 -0.00542121 -0.01967981 -0.15885964 -0.00543010 -0.00006443 -0.00019976 -0.00001942
  G2-4 -33.08606629 -5.84710110 -5.21342482 -0.63366142 -0.61421850 0.39991023 -0.00554682 -0.03888506 -0.15982774 -0.00404952 -0.00013063 -0.00019180 -0.00001372
  G2-5 -33.11645523 -5.77245753 -5.14109683 -0.64065717 -0.63513974 0.40224013 -0.00647876 -0.01706560 -0.20563213 -0.01706560 -0.00006435 -0.00027569 -0.00006435
  G2-6 -33.36613194 -6.20747842 -5.54541526 -0.66254680 -0.70133063 0.44368764 -0.00644074 -0.03490995 -0.21223602 -0.01293887 -0.00012900 -0.00027568 -0.00004837
  G2-7 -33.63367876 -6.57524518 -5.89077022 -0.68553937 -0.78219953 0.48750183 -0.00765485 -0.02893356 -0.25968634 -0.02893356 -0.00011645 -0.00037437 -0.00011645
  G2-8 -48.06668777 -6.91177840 -6.19970867 -0.72934329 -0.64977659 0.41296635 -0.00649764 -0.04515889 -0.17923252 -0.00598822 -0.00005652 -0.00012300 -0.00001031
  G2-9 -48.31693339 -7.26661921 -6.54113628 -0.75277961 -0.73575194 0.45691521 -0.00770331 -0.04374418 -0.23877166 -0.01941814 -0.00007139 -0.00019514 -0.00003709
 G2-10 -48.56589823 -7.65054125 -6.91453284 -0.76787671 -0.81793740 0.49989726 -0.00844381 -0.04055143 -0.29311330 -0.04055143 -0.00008163 -0.00027065 -0.00008163
 G2-11 -66.88477252 -8.53456352 -7.71951035 -0.85710608 -0.77484610 0.47444997 -0.00848563 -0.04844690 -0.24806901 -0.02336915 -0.00003046 -0.00008923 -0.00001834
 G2-12 -67.13978773 -8.91838967 -8.10665940 -0.86840151 -0.85784792 0.51735733 -0.00966727 -0.04865877 -0.31467975 -0.04865877 -0.00004379 -0.00015050 -0.00004379
 G2-13 -89.67228097 -10.38929384 -9.47300951 -0.98109782 -0.90092799 0.53855004 -0.01051919 -0.05168707 -0.31587793 -0.05168707 -0.00001785 -0.00006221 -0.00001785
 G2-14 -269.05528467 -20.96746228 -19.22212209 -1.75088683 -1.47782541 0.87980149 -0.01157240 -0.04328772 -0.32292227 -0.04328772 -0.00020600 -0.00092372 -0.00020600
 G2-15 -269.01163470 -21.00254654 -19.25433830 -1.74715940 -1.45756797 0.87848920 -0.01118268 -0.05836054 -0.28422338 -0.03382895 -0.00052103 -0.00067195 -0.00004370
 G2-16 -269.26867911 -21.36343932 -19.57052382 -1.78447531 -1.53991904 0.92386579 -0.01244976 -0.05212089 -0.32321840 -0.03852948 -0.00037796 -0.00077197 -0.00011456
 G2-17 -269.52130059 -21.73225091 -19.89512996 -1.82016035 -1.61954535 0.96968081 -0.01378230 -0.04572312 -0.35990549 -0.04572312 -0.00023817 -0.00082058 -0.00023817
 G2-18 -318.59259084 -23.28657378 -21.39810174 -1.89003630 -1.58094703 0.93833788 -0.01159924 -0.06509605 -0.34946027 -0.04614781 -0.00035907 -0.00081547 -0.00013796
 G2-19 -318.84164437 -23.63851130 -21.72113285 -1.91729596 -1.65890086 0.98241599 -0.01306915 -0.05871391 -0.39077246 -0.05871391 -0.00029589 -0.00098889 -0.00029589
 G2-20 -373.02216582 -25.68505476 -23.66090788 -2.02864528 -1.70224991 0.99984172 -0.01158284 -0.06704406 -0.40481325 -0.06704406 -0.00024733 -0.00077884 -0.00024733
 G2-21 -432.24396502 -27.85774200 -25.70631085 -2.15254663 -1.74844491 1.02095469 -0.01023191 -0.07210888 -0.40716464 -0.07210888 -0.00016259 -0.00049159 -0.00016259
 G2-22 -11.31814757 -3.54966566 -3.07397688 -0.47109632 -0.44010190 0.30577949 -0.00334396 -0.00058302 -0.11372198 -0.00058302 -0.00001224 -0.00268622 -0.00001224
 G2-23 -95.05103419 -11.92845708 -10.81744134 -1.18509241 -1.06983176 0.65244414 -0.01798537 -0.05713627 -0.36291299 -0.05713627 -0.00003073 -0.00010818 -0.00003073
 G2-24 -65.86557655 -10.97651045 -9.87710549 -1.15072661 -1.15204303 0.70659882 -0.01305115 -0.06044957 -0.42135069 -0.06044957 -0.00028805 -0.00083762 -0.00028805
 G2-25 -66.32621518 -11.72901486 -10.54313122 -1.21443051 -1.29304723 0.79412035 -0.01441693 -0.05749380 -0.44715331 -0.05749380 -0.00030366 -0.00090671 -0.00030366
 G2-26 -66.77162310 -12.47884043 -11.20684166 -1.27655312 -1.43407901 0.88172188 -0.01516873 -0.05924919 -0.48074612 -0.05924919 -0.00032721 -0.00091765 -0.00032721
 G2-27 -80.59822521 -11.60906485 -10.50068334 -1.21825886 -1.10458902 0.67651597 -0.02042731 -0.07529223 -0.46109099 -0.07957419 -0.00020033 -0.00073278 -0.00026005
 G2-28 -80.86255342 -12.03873491 -10.87798918 -1.24360448 -1.18666346 0.72153277 -0.01481725 -0.07091661 -0.45842179 -0.07091661 -0.00020857 -0.00059581 -0.00020857
 G2-29 -99.47369192 -13.30104673 -12.04888937 -1.34755580 -1.22444521 0.73914619 -0.01765206 -0.07393647 -0.46038687 -0.07393647 -0.00012861 -0.00035394 -0.00012861
 G2-30 -99.62440262 -13.66002479 -12.38343783 -1.37691926 -1.28888410 0.78036739 -0.02005975 -0.07609608 -0.47498026 -0.07827631 -0.00016022 -0.00045586 -0.00015737
 G2-31 -99.85291432 -14.05183994 -12.73509170 -1.40682653 -1.36725763 0.82625792 -0.02017306 -0.07611432 -0.50619921 -0.07611432 -0.00017114 -0.00051317 -0.00017114
 G2-32 -100.27330685 -14.81006821 -13.40930174 -1.46430039 -1.50864670 0.91218752 -0.01861008 -0.07684969 -0.53412944 -0.07684969 -0.00020283 -0.00059029 -0.00020283
 G2-33 -95.87660307 -13.10142125 -11.87127059 -1.33467867 -1.22047028 0.73621083 -0.01452949 -0.07894827 -0.48456064 -0.07894827 -0.00014010 -0.00038633 -0.00014010
 G2-34 -96.61717197 -14.60151476 -13.23003543 -1.44398768 -1.50398487 0.90666473 -0.01754720 -0.08048346 -0.54736650 -0.08048346 -0.00022936 -0.00065105 -0.00022936
 G2-35 -114.59285329 -14.69671323 -13.35754882 -1.46779379 -1.32282934 0.79466225 -0.01894600 -0.08308181 -0.50936454 -0.09030810 -0.00010070 -0.00031691 -0.00012888
 G2-36 -133.36086783 -16.30805275 -14.86395206 -1.59704684 -1.42458188 0.85254665 -0.01902044 -0.08903177 -0.51904164 -0.12359263 -0.00006266 -0.00025635 -0.00017026
 G2-37 -133.78630550 -17.04495954 -15.53530208 -1.65514959 -1.57856302 0.94190030 -0.02092424 -0.09602076 -0.61171792 -0.09602076 -0.00012257 -0.00039996 -0.00012257
 G2-38 -178.85243728 -19.89983708 -18.19356158 -1.88877372 -1.66011584 0.98438398 -0.02170917 -0.10030427 -0.64029302 -0.10030427 -0.00004757 -0.00020410 -0.00004757
 G2-39 -166.11589895 -21.57813406 -19.63975789 -2.11640736 -1.95647844 1.16444021 -0.03485022 -0.13216875 -0.75437353 -0.13216875 -0.00024767 -0.00071478 -0.00024767
 G2-40 -295.77102047 -27.93529817 -25.50575275 -2.47957959 -2.07216165 1.22915057 -0.01192770 -0.04926436 -0.31577400 -0.04926436 -0.00007058 -0.00368427 -0.00007058
 G2-41 -537.23238027 -40.50341210 -37.23459724 -3.32648372 -2.67330111 1.57362005 -0.02027747 -0.12926467 -0.58624772 -0.08538669 -0.00259479 -0.00540870 -0.00094065
 G2-42 -636.31174872 -45.16374850 -41.61228987 -3.60706079 -2.91223205 1.69639552 -0.02215843 -0.13575232 -0.70561361 -0.13575232 -0.00129017 -0.00370318 -0.00129017
 G2-43 -745.09116353 -49.98881880 -46.12329309 -3.91040413 -3.12707691 1.81974247 -0.02289877 -0.14494627 -0.71957707 -0.14452290 -0.00071400 -0.00231222 -0.00116186
 G2-44 -863.98368549 -55.00025719 -50.80343089 -4.22370384 -3.36468159 1.95091996 -0.02254638 -0.14497159 -0.78984120 -0.14497159 -0.00049815 -0.00149674 -0.00049815
 G2-45 -579.84639633 -41.59845230 -38.25809197 -3.35951805 -2.73132272 1.59828365 -0.01784114 -0.09869346 -0.54075358 -0.09869346 -0.00025308 -0.00079274 -0.00025308
 G2-46 -335.32945708 -28.50131484 -26.14305842 -2.46349565 -2.07015054 1.21708884 -0.02800838 -0.10701452 -0.60180536 -0.10701452 -0.00034406 -0.00099036 -0.00034406
 G2-47 -405.28590500 -30.05489678 -27.61253291 -2.50515052 -2.07060406 1.22113524 -0.02101997 -0.10265728 -0.58154431 -0.10265728 -0.00055147 -0.00155122 -0.00055147
 G2-48 -439.21660868 -33.17493520 -30.52116987 -2.75642115 -2.27737231 1.33680798 -0.02388959 -0.11883888 -0.63202030 -0.13391874 -0.00028247 -0.00088390 -0.00041947
 G2-49 -498.64781252 -35.63498418 -32.81624200 -2.91717321 -2.39482565 1.40248641 -0.02780286 -0.12148706 -0.66838767 -0.12378313 -0.00023550 -0.00084540 -0.00035991
 G2-50 -521.41151220 -37.48013278 -34.52591615 -3.05585204 -2.51410989 1.46785667 -0.02517196 -0.12333692 -0.71008785 -0.12333692 -0.00020146 -0.00064239 -0.00020146
 G2-51 -538.57031203 -42.78556164 -39.21774763 -3.54233041 -3.10891159 1.84604748 -0.02680543 -0.09615683 -0.68497706 -0.09615683 -0.00075086 -0.00225004 -0.00075086
 G2-52 -465.38399327 -33.75286165 -31.01247309 -2.74984686 -2.39973860 1.41648985 -0.01875974 -0.10209741 -0.63012252 -0.10209741 -0.00039603 -0.00111349 -0.00039603
 G2-53 -406.15906067 -31.58633529 -28.97513605 -2.62285567 -2.35425749 1.39497138 -0.01962560 -0.09813594 -0.62863694 -0.09813594 -0.00051632 -0.00146688 -0.00051632
 G2-54 -498.88441267 -36.02441494 -33.17253820 -2.93948751 -2.47186829 1.44638207 -0.02252497 -0.12162875 -0.70483843 -0.12162875 -0.00027802 -0.00085654 -0.00027802
 G2-55 -505.88472202 -41.39337565 -38.06799943 -3.52557274 -3.01928635 1.76376852 -0.04266461 -0.18630512 -0.99959063 -0.18630512 -0.00050223 -0.00136134 -0.00050223
 G2-56 -289.15643992 -34.16548849 -31.11742885 -3.23145937 -2.92404173 1.73004376 -0.04285281 -0.17002183 -0.99157574 -0.17002183 -0.00016669 -0.00042921 -0.00016669
 G2-57 -1316.82100565 -86.52961863 -79.80059492 -6.73572342 -5.46785215 3.17721002 -0.04158451 -0.24407566 -1.29263944 -0.24407566 -0.00116707 -0.00295940 -0.00116707
 G2-58 -492.12576392 -48.47220409 -44.33052375 -4.34399939 -3.76559537 2.21265082 -0.05035266 -0.19831836 -1.12891800 -0.19831836 -0.00018352 -0.00048859 -0.00018352
 G2-59 -1519.81523720 -100.88108933 -93.03467701 -7.84145854 -6.30850793 3.65830063 -0.04248783 -0.26272198 -1.39284039 -0.26272198 -0.00113359 -0.00295695 -0.00113359
 G2-60 -390.41150320 -45.39390737 -41.43412790 -4.23624051 -3.85812995 2.26575769 -0.05912178 -0.23504333 -1.35198142 -0.23504333 -0.00027249 -0.00068126 -0.00027249
 G2-61 -1760.65037686 -115.22868763 -106.36104964 -8.92312825 -7.25202125 4.19789575 -0.05736618 -0.33649432 -1.77774360 -0.33649432 -0.00189758 -0.00471504 -0.00189758
 G2-62 -471.97738748 -38.34575305 -35.20707151 -3.27430538 -2.80250854 1.64623174 -0.03525250 -0.15694244 -0.85858733 -0.15694244 -0.00070622 -0.00202498 -0.00070622
 G2-63 -777.82315340 -55.12441622 -50.78742019 -4.43107842 -3.64965476 2.12820215 -0.03462086 -0.18355432 -0.96638255 -0.18355432 -0.00148798 -0.00432640 -0.00148798
 G2-64 -278.25236047 -33.47262119 -30.52968021 -3.17717543 -2.90685964 1.71529758 -0.04837858 -0.18334761 -1.05598559 -0.18334761 -0.00024861 -0.00066705 -0.00024861
 G2-65 -626.36305401 -60.79095410 -55.63433885 -5.39647368 -4.71226335 2.75732166 -0.05996720 -0.25701685 -1.45380631 -0.25701685 -0.00028283 -0.00071212 -0.00028283
 G2-66 -1996.58712553 -130.62595604 -120.55688625 -10.06132224 -8.10395820 4.68583755 -0.05624577 -0.35234325 -1.83897997 -0.35234325 -0.00184976 -0.00462501 -0.00184976
 G2-67 -162.46742673 -21.26667642 -19.39127981 -2.09910328 -1.94743250 1.15910399 -0.03609743 -0.14668147 -0.82000528 -0.14668147 -0.00039564 -0.00118537 -0.00039564
 G2-68 -546.62550992 -42.11855391 -38.75449596 -3.56255009 -3.01124579 1.76752461 -0.04486453 -0.17682890 -0.98426087 -0.17682890 -0.00065311 -0.00210281 -0.00065311
 G2-69 -316.16430610 -36.49528567 -33.36454123 -3.44724125 -3.11237275 1.83332082 -0.05800120 -0.20160146 -1.18031183 -0.20160146 -0.00024784 -0.00068990 -0.00024784
 G2-70 -586.46121925 -52.82833688 -48.44790922 -4.60007950 -3.97303967 2.32118222 -0.05563023 -0.21956242 -1.22905217 -0.21956242 -0.00033557 -0.00091938 -0.00033557
 G2-71 -200.01756070 -24.31412943 -22.26975404 -2.37023977 -2.15739633 1.27827383 -0.03730233 -0.17488396 -1.01095372 -0.17488396 -0.00035100 -0.00121899 -0.00035100
 G2-72 -245.52492809 -28.02297836 -25.63393783 -2.67056431 -2.38122424 1.40783584 -0.04169269 -0.15465443 -0.94334370 -0.15465443 -0.00014446 -0.00047995 -0.00014446
 G2-73 -700.22788795 -57.40228618 -52.83115727 -4.90474026 -4.18524907 2.44329068 -0.07147793 -0.25158536 -1.40826715 -0.25158536 -0.00047463 -0.00152099 -0.00047463
 G2-74 -423.06441795 -50.52433906 -46.08697002 -4.76583743 -4.37011240 2.57360995 -0.07065016 -0.26545453 -1.55393687 -0.26545453 -0.00046746 -0.00126251 -0.00046746
 G2-75 -1793.31615293 -120.42645332 -111.06571897 -9.44326228 -7.76741947 4.50436962 -0.06432013 -0.36857941 -1.96512549 -0.36857941 -0.00224947 -0.00558608 -0.00224947
 G2-76 -381.58989269 -47.03120340 -42.83831666 -4.49941841 -4.14459982 2.44934000 -0.06483847 -0.25866881 -1.51003255 -0.25866881 -0.00056505 -0.00144857 -0.00056505
 G2-77 -99.00679794 -16.88865128 -15.20538100 -1.73932402 -1.80482531 1.10072179 -0.02105801 -0.09176581 -0.63979673 -0.09176581 -0.00052284 -0.00145140 -0.00052284
 G2-78 -99.01437624 -16.87719042 -15.20311976 -1.73827632 -1.80461361 1.10017034 -0.02216576 -0.08943141 -0.63566853 -0.08943141 -0.00058001 -0.00167321 -0.00058001
 G2-79 -98.94932353 -16.90286274 -15.23267486 -1.72501018 -1.80847181 1.09903603 -0.02113006 -0.09162377 -0.63887826 -0.09162377 -0.00055807 -0.00149779 -0.00055807
 G2-80 -99.46937657 -17.63306372 -15.86390194 -1.80209520 -1.94527468 1.18759720 -0.02233010 -0.08932858 -0.66915026 -0.08932858 -0.00057482 -0.00158383 -0.00057482
 G2-81 -99.41490503 -17.67281857 -15.91043986 -1.78603633 -1.95048474 1.18611014 -0.02146219 -0.09170516 -0.66536869 -0.09170516 -0.00058588 -0.00151577 -0.00058588
 G2-82 -99.91313673 -18.38023024 -16.52303552 -1.86475953 -2.08596244 1.27502992 -0.02278313 -0.09064194 -0.70366895 -0.09064194 -0.00061020 -0.00160297 -0.00061020
 G2-83 -132.16964351 -22.78868744 -20.52416950 -2.32880986 -2.45672363 1.49375098 -0.03003652 -0.12036087 -0.85930611 -0.12036087 -0.00086912 -0.00254444 -0.00086912
 G2-84 -132.14603780 -22.80076645 -20.53326639 -2.32819895 -2.45766877 1.49495306 -0.02898921 -0.12317463 -0.85944805 -0.12317463 -0.00077964 -0.00210484 -0.00077964
 G2-85 -132.10526320 -22.81841946 -20.56427372 -2.31212769 -2.46140940 1.49235375 -0.02915836 -0.12264952 -0.85604395 -0.12264952 -0.00086423 -0.00227444 -0.00086423
 G2-86 -132.06234011 -22.84460810 -20.59808489 -2.29437582 -2.46546517 1.48977563 -0.02831935 -0.12627403 -0.85790553 -0.12627403 -0.00091684 -0.00229328 -0.00091684
 G2-87 -132.11094085 -22.82287762 -20.56772940 -2.30728506 -2.46254118 1.49104211 -0.02990224 -0.12290999 -0.86013718 -0.12290999 -0.00090825 -0.00235474 -0.00090825
 G2-88 -132.55706929 -23.57358097 -21.22728125 -2.37131454 -2.60330387 1.57856452 -0.02996329 -0.12280851 -0.89220984 -0.12280851 -0.00091309 -0.00230601 -0.00091309
 G2-89 -132.61264982 -23.53670957 -21.18483807 -2.38785186 -2.59762885 1.58044841 -0.03008239 -0.12182849 -0.89287658 -0.12182849 -0.00091769 -0.00240344 -0.00091769
 G2-90 -133.05409756 -24.28203044 -21.83969006 -2.45281470 -2.73792624 1.66833999 -0.03037932 -0.12213647 -0.92680664 -0.12213647 -0.00091730 -0.00233661 -0.00091730
 G2-91 -133.05724627 -24.27929641 -21.83900692 -2.45014998 -2.73793048 1.66746410 -0.03045398 -0.12310348 -0.92883238 -0.12310348 -0.00096826 -0.00243793 -0.00096826
 G2-92 -165.19756009 -28.76243990 -25.92848804 -2.88433605 -3.11850348 1.88415697 -0.03597120 -0.15658072 -1.07548438 -0.15658072 -0.00121245 -0.00298902 -0.00121245
 G2-93 -197.54053389 -33.21378151 -29.96268890 -3.34848292 -3.49186867 2.10155257 -0.04006125 -0.19238184 -1.21902107 -0.19238184 -0.00196130 -0.00443021 -0.00196130
 G2-94 -212.01458609 -25.97425873 -23.64934497 -2.47025545 -2.31969489 1.37857193 -0.03458082 -0.13064372 -0.80967202 -0.13064372 -0.00018017 -0.00050031 -0.00018017
 G2-95 -301.21803620 -35.68009770 -32.53909736 -3.35406139 -3.08870895 1.82216341 -0.04774059 -0.18339710 -1.08262600 -0.18339710 -0.00022820 -0.00059259 -0.00022820
 G2-96 -897.13913167 -60.92004283 -56.13233957 -4.81011700 -4.01716648 2.34430702 -0.03109501 -0.17825829 -1.00698416 -0.17825829 -0.00078321 -0.00207125 -0.00078321
 G2-97 -1328.89523320 -88.07865961 -81.24919699 -6.86758297 -5.63460622 3.27135476 -0.04413603 -0.25660628 -1.38967153 -0.25660628 -0.00128539 -0.00327287 -0.00128539
 G2-98 -81.69676320 -13.54915217 -12.22535850 -1.36066203 -1.46945073 0.89436920 -0.01658995 -0.06987536 -0.51334824 -0.06987536 -0.00027296 -0.00077498 -0.00027296
 G2-99 -114.00554656 -17.95533346 -16.20940410 -1.83258445 -1.83958203 1.11575998 -0.02288402 -0.10180463 -0.67475622 -0.10180463 -0.00042021 -0.00115218 -0.00042021
G2-100 -214.58683256 -29.15029943 -26.53879741 -2.84850971 -2.77804238 1.65472577 -0.04526725 -0.18043965 -1.09238335 -0.18043965 -0.00057462 -0.00159008 -0.00057462
G2-101 -214.62898108 -29.10460630 -26.48697989 -2.85694480 -2.77453996 1.65473202 -0.05036863 -0.18090669 -1.09149206 -0.18090669 -0.00059629 -0.00154647 -0.00059629
G2-102 -302.66511679 -27.64626613 -25.22311462 -2.41065179 -2.27257541 1.36426443 -0.02078339 -0.07811055 -0.58240411 -0.07811055 -0.00048884 -0.00143741 -0.00048884
G2-103 -166.52604991 -22.30261032 -20.28209231 -2.17505329 -2.09524973 1.24887785 -0.03423597 -0.12944884 -0.78321336 -0.12944884 -0.00029106 -0.00079202 -0.00029106
G2-104 -199.66229804 -28.19500408 -25.58773795 -2.76833041 -2.74652192 1.64286400 -0.04332908 -0.15959762 -1.00662555 -0.15959762 -0.00054422 -0.00141075 -0.00054422
G2-105 -181.07893036 -26.96266456 -24.43327588 -2.65866717 -2.70933023 1.62450868 -0.03939384 -0.15292839 -0.97908192 -0.15292839 -0.00063822 -0.00165856 -0.00063822
G2-106 -114.35558951 -18.72136627 -16.90818680 -1.87423180 -1.98451380 1.19940599 -0.02385255 -0.10223316 -0.70291714 -0.10223316 -0.00051816 -0.00136750 -0.00051816
G2-107 -161.23053930 -23.40050077 -21.19403400 -2.39295666 -2.24395657 1.35029792 -0.03240413 -0.14908118 -0.89132405 -0.14908118 -0.00061681 -0.00181145 -0.00061681
G2-108 -114.83480655 -19.44423913 -17.53636731 -1.94957530 -2.12088301 1.28757562 -0.02511723 -0.10076769 -0.73592856 -0.10076769 -0.00054690 -0.00144393 -0.00054690
G2-109 -114.84314784 -19.44809965 -17.54021266 -1.94855318 -2.12112899 1.28749365 -0.02452023 -0.10151514 -0.73641054 -0.10151514 -0.00055046 -0.00145119 -0.00055046
G2-110 -132.55597680 -19.21487382 -17.41282799 -1.92639327 -1.87989573 1.13182498 -0.02917973 -0.11117022 -0.69509895 -0.11117022 -0.00040415 -0.00118177 -0.00040415
G2-111 -132.94179672 -19.97149445 -18.08294208 -1.98088796 -2.02304488 1.21768886 -0.02725067 -0.10949973 -0.72754878 -0.10949973 -0.00041704 -0.00112474 -0.00041704
G2-112 -133.00363103 -19.95815747 -18.05906023 -1.99389781 -2.01944016 1.21943607 -0.02860118 -0.10816391 -0.72600919 -0.10816391 -0.00040695 -0.00110894 -0.00040695
G2-113 -199.23358818 -27.42666695 -24.89729301 -2.71579921 -2.60397614 1.55803315 -0.04064794 -0.15611307 -0.97646645 -0.15611307 -0.00047672 -0.00131067 -0.00047672
G2-114 -133.41990168 -20.71144568 -18.72596947 -2.05225260 -2.16041929 1.30529417 -0.02642605 -0.10829381 -0.75648889 -0.10829381 -0.00045087 -0.00120299 -0.00045087
G2-115 -133.41448891 -20.69871635 -18.71290266 -2.05570826 -2.15942169 1.30555998 -0.02807217 -0.10696087 -0.75625751 -0.10696087 -0.00044750 -0.00119979 -0.00044750
G2-116 -438.82160929 -36.77296298 -33.67354565 -3.13570216 -2.87053140 1.69991166 -0.02662272 -0.13314423 -0.82217426 -0.13314423 -0.00089563 -0.00238485 -0.00089563
G2-117 -505.92249830 -45.70831988 -41.82107873 -3.99007484 -3.73469272 2.21328260 -0.04737998 -0.18864535 -1.15816010 -0.18864535 -0.00106197 -0.00277908 -0.00106197
G2-118 -439.30169462 -37.48680769 -34.29097584 -3.21106062 -3.00612616 1.78831471 -0.02735801 -0.12992836 -0.85252879 -0.12992836 -0.00083267 -0.00222541 -0.00083267
G2-119 -439.29917400 -37.48656050 -34.29093389 -3.21406694 -3.00634265 1.78920303 -0.02780617 -0.13047149 -0.85408625 -0.13047149 -0.00085941 -0.00229101 -0.00085941
G2-120 -155.51743550 -21.42618799 -19.42756783 -2.10362422 -2.06224194 1.23917086 -0.02919382 -0.10980771 -0.72473231 -0.10980771 -0.00034289 -0.00098727 -0.00034289
G2-121 -498.52977596 -39.65300585 -36.32833435 -3.33810495 -3.05151800 1.80977391 -0.02670056 -0.13389252 -0.85345320 -0.13389252 -0.00069317 -0.00183621 -0.00069317
G2-122 -498.07957499 -38.90549065 -35.67310320 -3.27370263 -2.91131477 1.72218937 -0.02680176 -0.13381662 -0.82247817 -0.13381662 -0.00067093 -0.00183253 -0.00067093
G2-123 -146.70123146 -23.10653157 -20.86484279 -2.36116839 -2.35074310 1.42233423 -0.03077071 -0.13255760 -0.86734626 -0.13255760 -0.00068634 -0.00193820 -0.00068634
G2-124 -166.14964161 -25.86613426 -23.38304719 -2.58030980 -2.67191770 1.61251563 -0.03618593 -0.14011666 -0.94712901 -0.14011666 -0.00069769 -0.00180727 -0.00069769
G2-125 -199.67024591 -28.21480772 -25.60789985 -2.76219153 -2.74779675 1.64216570 -0.04132698 -0.16040163 -1.00131297 -0.16040163 -0.00053906 -0.00140037 -0.00053906
G2-126 -222.21260020 -29.66703196 -26.95572765 -2.88039662 -2.78936549 1.66409375 -0.04340978 -0.16272232 -1.00461868 -0.16272232 -0.00044677 -0.00117452 -0.00044677
G2-127 -564.78099231 -47.12340429 -43.18531433 -4.05256259 -3.63715181 2.14720098 -0.04310851 -0.18790303 -1.10866885 -0.18790303 -0.00083819 -0.00221462 -0.00083819
G2-128 -531.67027863 -45.55540079 -41.64523402 -3.92643517 -3.70351102 2.20317469 -0.03426380 -0.16542806 -1.07674199 -0.16542806 -0.00100069 -0.00256984 -0.00100069
G2-129 -166.56801837 -26.61020436 -24.04210569 -2.63771371 -2.81229401 1.69769154 -0.03429022 -0.14072628 -0.98114726 -0.14072628 -0.00077706 -0.00197406 -0.00077706
G2-130 -166.56019519 -26.60089662 -24.03023595 -2.64364406 -2.81128532 1.69873037 -0.03580644 -0.13854386 -0.97890007 -0.13854386 -0.00072378 -0.00186921 -0.00072378
G2-131 -147.97667811 -25.33705908 -22.84808831 -2.53475421 -2.77246544 1.67959568 -0.03379515 -0.13327317 -0.96173675 -0.13327317 -0.00091066 -0.00229409 -0.00091066
G2-132 -198.34327059 -30.34236590 -27.47360010 -3.00935142 -3.05199826 1.82540664 -0.03973159 -0.17828602 -1.10138908 -0.17828602 -0.00116831 -0.00276564 -0.00116831
G2-133 -504.21440055 -47.14082759 -43.06133195 -4.16804501 -3.90020497 2.30891624 -0.04029512 -0.20467330 -1.20243085 -0.20467330 -0.00188926 -0.00445920 -0.00188926
G2-134 -179.75868618 -29.10495558 -26.31259906 -2.90121141 -3.01440861 1.80712250 -0.03570691 -0.17206169 -1.07553566 -0.17206169 -0.00133494 -0.00312202 -0.00133494
G2-135 -212.48143103 -34.26961229 -30.96612336 -3.43718228 -3.52626781 2.11523344 -0.04270026 -0.20299148 -1.25476116 -0.20299148 -0.00182245 -0.00412721 -0.00182245
G2-136 -0.47618444 -0.65655637 -0.56624219 -0.08952499 -0.13021119 0.09201029 -0.00093900 0.00000000 -0.04512861 0.00000000 0.00000000 -0.00003773 0.00000000
G2-137 -372.76340447 -25.33498672 -23.33017005 -2.00707465 -1.62403962 0.95662154 -0.01048318 -0.07090843 -0.35863697 -0.05105335 -0.00024920 -0.00058727 -0.00012132
G2-138 -65.55952916 -10.60094484 -9.53085516 -1.12525798 -1.06642149 0.66230915 -0.01294820 -0.06433233 -0.37644495 -0.04936603 -0.00027538 -0.00074252 -0.00022111
G2-139 -66.05725444 -11.34852064 -10.19575113 -1.18767471 -1.21193748 0.74945308 -0.01485273 -0.06244143 -0.40466048 -0.04721050 -0.00032034 -0.00083492 -0.00024585
G2-140 -132.77162176 -19.57022803 -17.70939104 -1.96621633 -1.94166817 1.17459656 -0.02869350 -0.10945367 -0.69391621 -0.10768368 -0.00040239 -0.00103277 -0.00036642
G2-141 -100.02057017 -14.43413213 -13.06956677 -1.43518648 -1.43012917 0.86711053 -0.01932632 -0.08110262 -0.49453529 -0.06914565 -0.00020652 -0.00051581 -0.00016231
G2-142 -100.03618716 -14.41632348 -13.03380970 -1.44597833 -1.42826800 0.86823423 -0.02291738 -0.07625694 -0.47907079 -0.06228731 -0.00017394 -0.00054150 -0.00019908
G2-143 -133.18381286 -20.31500320 -18.35024863 -2.03387154 -2.08020350 1.26147469 -0.03181018 -0.10766065 -0.70292294 -0.09479665 -0.00041237 -0.00115109 -0.00045328
G2-144 -405.90737368 -31.23182094 -28.64596596 -2.59885810 -2.27694386 1.35131425 -0.01976036 -0.10188961 -0.58505092 -0.08494626 -0.00051297 -0.00127282 -0.00039245
G2-145 -66.50906530 -12.10868615 -10.86527487 -1.25120556 -1.35452802 0.83755118 -0.01502050 -0.06518712 -0.43567542 -0.04545868 -0.00034591 -0.00081337 -0.00024347
G2-146 -99.65399600 -18.00926295 -16.18466980 -1.83842392 -2.00734647 1.23089757 -0.02322157 -0.09652435 -0.65960421 -0.07807707 -0.00063510 -0.00148324 -0.00050279
G2-147 -132.79932684 -23.90970950 -21.50417635 -2.42410127 -2.65989159 1.62372032 -0.03135954 -0.12867897 -0.88462244 -0.11117275 -0.00099094 -0.00228840 -0.00082693
G2-148 -181.23600074 -22.85755700 -20.87266285 -2.23388196 -2.05047340 1.21769507 -0.03795557 -0.14571351 -0.84956551 -0.16580192 -0.00025310 -0.00091246 -0.00038241
G2-149 -132.15547700 -22.78173495 -20.52284506 -2.32746693 -2.45679516 1.49404780 -0.02993577 -0.12118360 -0.85866911 -0.12118360 -0.00087344 -0.00239071 -0.00087344
G2-150 -165.30999068 -28.69367158 -25.84717748 -2.91284067 -3.10946559 1.88620730 -0.03778673 -0.15332602 -1.08413918 -0.15332602 -0.00128068 -0.00348290 -0.00128068
G2-151 -165.70534456 -29.49934840 -26.56733211 -2.95346261 -3.25757323 1.97055582 -0.03736558 -0.15564705 -1.11361710 -0.15564705 -0.00129851 -0.00317088 -0.00129851
G2-152 -166.19497956 -30.18382617 -27.15630639 -3.04092767 -3.38989211 2.06166878 -0.03797455 -0.15363826 -1.15001263 -0.15363826 -0.00123734 -0.00309618 -0.00123734
G2-153 -166.20038137 -30.17858877 -27.15676095 -3.03303319 -3.39023796 2.05921186 -0.03814480 -0.15654613 -1.15633223 -0.15654613 -0.00139878 -0.00341882 -0.00139878
G2-154 -197.95906562 -33.92199766 -30.58551688 -3.41273959 -3.62990507 2.18859308 -0.04439701 -0.18728480 -1.26850404 -0.18728480 -0.00171363 -0.00421106 -0.00171363
G2-155 -197.95656997 -33.92740451 -30.58738288 -3.41279494 -3.63007890 2.18882528 -0.04442892 -0.18528988 -1.26519555 -0.18528988 -0.00163904 -0.00411631 -0.00163904
G2-156 -198.84488243 -35.41138668 -31.89522307 -3.53649732 -3.91075741 2.36250795 -0.04536142 -0.18770271 -1.33710008 -0.18770271 -0.00170587 -0.00412803 -0.00170587
G2-157 -199.33582741 -36.08565993 -32.47297825 -3.62901100 -4.04186449 2.45499154 -0.04557212 -0.18515359 -1.37323723 -0.18515359 -0.00156287 -0.00386669 -0.00156287
G2-158 -199.33373820 -36.08370205 -32.47552643 -3.62354190 -4.04254070 2.45343260 -0.04581939 -0.18707623 -1.37763741 -0.18707623 -0.00169285 -0.00412369 -0.00169285
G2-159 -230.68206927 -39.11657596 -35.28317529 -3.93486789 -4.14421862 2.49468042 -0.04787281 -0.22504688 -1.44401302 -0.22504688 -0.00235598 -0.00534590 -0.00235598
G2-160 -232.47631851 -41.98786569 -37.78998187 -4.21707600 -4.69385571 2.84831204 -0.05316601 -0.21667076 -1.59645473 -0.21667076 -0.00189063 -0.00464154 -0.00189063
G2-161 -263.35200810 -44.23524859 -39.90983748 -4.46253058 -4.65359493 2.80023920 -0.05986935 -0.25102636 -1.65138597 -0.25102636 -0.00261924 -0.00646916 -0.00261924
G2-162 -265.61747483 -47.88937535 -43.10634675 -4.80518272 -5.34580440 3.24163617 -0.06076467 -0.24818562 -1.81969072 -0.24818562 -0.00221928 -0.00541839 -0.00221928
G2-163 -328.74788289 -54.68421568 -49.37305500 -5.48102066 -5.69018428 3.40828524 -0.06749542 -0.32753105 -2.00318469 -0.32753105 -0.00411975 -0.00914474 -0.00411975
G2-164 -328.73002594 -54.63053420 -49.34180406 -5.48410858 -5.68769063 3.40844263 -0.06987651 -0.33370889 -2.02752193 -0.33370889 -0.00478882 -0.01096511 -0.00478882
G2-165 -232.80571264 -34.10708225 -30.91354183 -3.35505799 -3.39909293 2.03604088 -0.05040927 -0.19068284 -1.22502158 -0.19068284 -0.00082203 -0.00207777 -0.00082203
G2-166 -199.71397753 -32.50955828 -29.35940374 -3.22124958 -3.46445690 2.08958637 -0.04192932 -0.17379475 -1.20762771 -0.17379475 -0.00116766 -0.00287505 -0.00116766
G2-167 -245.60670129 -40.19576411 -36.31683045 -4.01515183 -4.18055077 2.50683711 -0.05087395 -0.23677755 -1.47743208 -0.23677755 -0.00229944 -0.00525626 -0.00229944
G2-168 -264.18936539 -41.45055694 -37.49487050 -4.11880339 -4.21924532 2.52452506 -0.05311934 -0.24359280 -1.49798660 -0.24359280 -0.00215707 -0.00489733 -0.00215707
G2-169 -198.81392152 -31.01208212 -28.04263550 -3.10220180 -3.18276543 1.91682933 -0.04441981 -0.16994359 -1.13748059 -0.16994359 -0.00094199 -0.00255354 -0.00094199
G2-170 -199.21446979 -31.82136395 -28.75976911 -3.14524320 -3.33111496 2.00140991 -0.04263328 -0.17191646 -1.16479383 -0.17191646 -0.00107687 -0.00265092 -0.00107687
G2-171 -231.94134944 -36.98935567 -33.43120797 -3.66937419 -3.84375258 2.30839421 -0.05101419 -0.20510538 -1.35626116 -0.20510538 -0.00137081 -0.00334102 -0.00137081
G2-172 -330.43710539 -48.88843211 -44.30049392 -4.85154846 -4.80162327 2.86507094 -0.07287214 -0.28652109 -1.76742618 -0.28652109 -0.00201898 -0.00541697 -0.00201898
G2-173 -227.42441926 -35.32846471 -31.97002002 -3.52578763 -3.56066717 2.12892221 -0.04579112 -0.21309438 -1.28825211 -0.21309438 -0.00166936 -0.00378770 -0.00166936
G2-174 -572.52160965 -54.00849582 -49.41187934 -4.75801723 -4.46713697 2.63740606 -0.06141018 -0.24410837 -1.44332381 -0.24410837 -0.00116443 -0.00296268 -0.00116443
G2-175 -629.29328935 -60.38878186 -55.09190702 -5.40674356 -5.11019688 3.02932440 -0.05231455 -0.26973488 -1.59755063 -0.26973488 -0.00246881 -0.00563634 -0.00246881
G2-176 -227.52021937 -35.23032207 -31.83811500 -3.56892686 -3.54839207 2.13738923 -0.04576137 -0.20692458 -1.31663123 -0.20692458 -0.00108333 -0.00276888 -0.00108333
G2-177 -227.42414928 -35.31909737 -31.96457775 -3.52610413 -3.56032181 2.12885134 -0.04456310 -0.21381009 -1.29180985 -0.21381009 -0.00170602 -0.00388111 -0.00170602
G2-178 -198.38333642 -30.26467861 -27.37368562 -3.04710830 -3.04220219 1.83237258 -0.04361175 -0.17417415 -1.11540449 -0.17417415 -0.00093624 -0.00249756 -0.00093624
G2-179 -198.84414419 -31.01964906 -28.04155350 -3.10860352 -3.18337712 1.91921909 -0.04465954 -0.17117172 -1.13896802 -0.17117172 -0.00097742 -0.00267746 -0.00097742
G2-180 -332.19193048 -47.49592040 -43.09469459 -4.65810337 -4.63703099 2.76709818 -0.07257257 -0.27385116 -1.69498608 -0.27385116 -0.00122060 -0.00302079 -0.00122060
G2-181 -504.65515516 -47.86235167 -43.68169899 -4.23940625 -4.03768466 2.39735327 -0.04231683 -0.19590561 -1.23167700 -0.19590561 -0.00163824 -0.00412032 -0.00163824
G2-182 -180.28995046 -29.75723753 -26.83996577 -3.00971583 -3.14330709 1.90251448 -0.03814138 -0.16509929 -1.12235901 -0.16509929 -0.00103783 -0.00262207 -0.00103783
G2-183 -199.28837936 -31.77029941 -28.70232302 -3.16766184 -3.32421783 2.00572640 -0.04390924 -0.17180284 -1.17043708 -0.17180284 -0.00102136 -0.00256976 -0.00102136
G2-184 -199.28608676 -31.76099012 -28.69220437 -3.16935837 -3.32346659 2.00585841 -0.04384637 -0.17197705 -1.17434615 -0.17197705 -0.00104684 -0.00262204 -0.00104684
G2-185 -265.86478895 -40.04450181 -36.27255082 -3.91941307 -4.05714874 2.42364892 -0.05658309 -0.22049963 -1.44197846 -0.22049963 -0.00125432 -0.00306595 -0.00125432
G2-186 -505.09915690 -48.60592109 -44.33705399 -4.30125381 -4.17811188 2.48423448 -0.04268585 -0.19686573 -1.26647620 -0.19686573 -0.00165958 -0.00410361 -0.00165958
G2-187 -564.82262349 -51.44917130 -46.96033240 -4.50722837 -4.35557110 2.59417868 -0.04247500 -0.20010687 -1.30681030 -0.20010687 -0.00151238 -0.00373907 -0.00151238
G2-188 -564.81130925 -51.45702243 -46.96160895 -4.51467217 -4.35546408 2.59653210 -0.04186552 -0.19693724 -1.30005506 -0.19693724 -0.00132271 -0.00333374 -0.00132271
G2-189 -180.63344026 -30.56366610 -27.58050163 -3.03832311 -3.29235772 1.98306927 -0.03981684 -0.16579170 -1.14540148 -0.16579170 -0.00121587 -0.00297586 -0.00121587
G2-190 -314.01370706 -46.85793874 -42.49350911 -4.60896000 -4.73456959 2.83354424 -0.06859515 -0.27700755 -1.76521677 -0.27700755 -0.00166046 -0.00410534 -0.00166046
G2-191 -199.70568795 -32.50318676 -29.34759045 -3.23163836 -3.46315760 2.09192541 -0.04351338 -0.17014560 -1.20164887 -0.17014560 -0.00101773 -0.00257377 -0.00101773
G2-192 -266.35139306 -40.72977055 -36.86391671 -4.00510965 -4.18978871 2.51452023 -0.05664842 -0.22019369 -1.48125546 -0.22019369 -0.00124672 -0.00306521 -0.00124672
G2-193 -505.59261548 -49.28119565 -44.92244967 -4.37904104 -4.31026593 2.57246747 -0.04305895 -0.19674143 -1.30750012 -0.19674143 -0.00171666 -0.00425310 -0.00171666
G2-194 -878.12248564 -74.29340543 -68.01079508 -6.32811190 -5.88291322 3.48360096 -0.05727101 -0.26791187 -1.68125539 -0.26791187 -0.00233770 -0.00590448 -0.00233770
G2-195 -181.13361447 -31.24705855 -28.17398367 -3.11695731 -3.42531248 2.07164153 -0.03979486 -0.16720978 -1.18832862 -0.16720978 -0.00130901 -0.00320647 -0.00130901
G2-196 -402.09826327 -45.38541252 -41.20762907 -4.17717468 -4.23178523 2.54643015 -0.04168750 -0.17737601 -1.25439511 -0.17737601 -0.00150406 -0.00378326 -0.00150406
G2-197 -537.35630016 -53.04459487 -48.38109127 -4.75585093 -4.55245764 2.70246874 -0.04820591 -0.23683062 -1.42661552 -0.23683062 -0.00227866 -0.00538132 -0.00227866
G2-198 -212.89691659 -35.00229094 -31.62541484 -3.49075917 -3.66611455 2.20063185 -0.04379297 -0.20377236 -1.30048378 -0.20377236 -0.00170184 -0.00398091 -0.00170184
G2-199 -232.35506465 -37.72887894 -34.08492990 -3.72778334 -3.98401777 2.39305326 -0.05095980 -0.20417263 -1.38932617 -0.20417263 -0.00147575 -0.00358706 -0.00147575
G2-200 -232.42697283 -37.67456383 -34.02151966 -3.75509734 -3.97651820 2.39895170 -0.05158923 -0.20346629 -1.39379619 -0.20346629 -0.00135775 -0.00335847 -0.00135775
G2-201 -299.09602653 -45.90982518 -41.54877480 -4.52830121 -4.70313060 2.82167122 -0.06601792 -0.25506393 -1.67343687 -0.25506393 -0.00151598 -0.00370207 -0.00151598
G2-202 -538.23592290 -54.51388007 -49.66180115 -4.88500403 -4.83107659 2.87639371 -0.05082357 -0.22887876 -1.49044603 -0.22887876 -0.00208016 -0.00508017 -0.00208016
G2-203 -213.77212945 -36.47359116 -32.90745988 -3.62144277 -3.94551511 2.37505017 -0.04790949 -0.19809101 -1.36960819 -0.19809101 -0.00162426 -0.00393181 -0.00162426
G2-204 -232.84447541 -38.40178085 -34.66781615 -3.81070567 -4.11619538 2.48267996 -0.05125302 -0.20492988 -1.43280709 -0.20492988 -0.00153745 -0.00373216 -0.00153745
G2-205 -375.91931642 -52.61044221 -47.73399838 -5.12526064 -5.03044930 2.99123371 -0.06894614 -0.29643986 -1.77294335 -0.29643986 -0.00203687 -0.00460974 -0.00203687
G2-206 -375.91806355 -52.61031140 -47.73399332 -5.12565170 -5.03048730 2.99133182 -0.06867146 -0.29637274 -1.77346876 -0.29637274 -0.00203905 -0.00460667 -0.00203905
G2-207 -286.73028426 -42.91214264 -38.84848434 -4.23698274 -4.26118606 2.54641113 -0.05449650 -0.24447069 -1.49623439 -0.24447069 -0.00200022 -0.00451963 -0.00200022
G2-208 -265.99394315 -44.30301363 -39.98228659 -4.40158190 -4.76754106 2.87660780 -0.05902569 -0.23578664 -1.65343174 -0.23578664 -0.00183624 -0.00444231 -0.00183624
G2-209 -765.21521500 -73.08870440 -66.97163059 -6.43484272 -5.65881561 3.29819418 -0.07787577 -0.32567354 -1.81370612 -0.32567354 -0.00043186 -0.00106386 -0.00043186
G2-210 -908.92333300 -85.35977375 -78.31785904 -7.48020961 -6.60291371 3.83993411 -0.09649892 -0.39825703 -2.20387664 -0.39825703 -0.00063631 -0.00157380 -0.00063631
G2-211 -1272.55098378 -90.46453925 -83.40156202 -7.14378080 -5.84717062 3.38381015 -0.04583986 -0.28660781 -1.39915441 -0.28660781 -0.00422448 -0.01088886 -0.00422448
G2-212 -572.47249646 -49.65867733 -45.62810122 -4.29687730 -3.74965515 2.18876272 -0.05978105 -0.23967240 -1.28158711 -0.23967240 -0.00060102 -0.00164699 -0.00060102
G2-213 -1236.53186617 -80.00666172 -73.89391820 -6.16252777 -4.93746457 2.85877200 -0.03852348 -0.21925557 -1.16740423 -0.21925557 -0.00113613 -0.00317220 -0.00113613
G2-214 -1680.74946972 -113.51788466 -104.73640053 -8.87972851 -7.24984756 4.19515641 -0.06655412 -0.34727200 -1.81000649 -0.34727200 -0.00171953 -0.00439408 -0.00171953
G2-215 -2478.04149135 -160.29597081 -148.06531812 -12.28105730 -9.89502735 5.71101095 -0.07679387 -0.45292523 -2.33121257 -0.45292523 -0.00306628 -0.00764291 -0.00306628
G2-216 -1369.77535471 -96.49415863 -88.99946955 -7.70488242 -6.39688014 3.70680991 -0.07350691 -0.33992639 -1.78018303 -0.33992639 -0.00150783 -0.00403142 -0.00150783
G2-217 -1614.14889534 -105.19870984 -97.13531143 -8.10717865 -6.51611912 3.76952887 -0.05165582 -0.29139544 -1.51981535 -0.29139544 -0.00172325 -0.00456927 -0.00172325
G2-218 -1609.08645753 -104.99221297 -96.98125188 -8.10006924 -6.51002220 3.76630501 -0.05680285 -0.29925358 -1.56275377 -0.29925358 -0.00210738 -0.00574676 -0.00210738
G2-219 -1132.64330362 -75.39013429 -69.54125935 -5.87447082 -4.71908736 2.73804891 -0.03617287 -0.19967770 -1.06794480 -0.19967770 -0.00106350 -0.00292566 -0.00106350
G2-220 -732.97308791 -62.84491110 -57.66157370 -5.40905478 -4.70624319 2.74874470 -0.06021237 -0.26008595 -1.45905770 -0.26008595 -0.00055688 -0.00142525 -0.00055688
G2-221 -601.94790819 -70.67697929 -64.50093173 -6.60301177 -6.04665675 3.54771842 -0.09530704 -0.37018047 -2.12921939 -0.37018047 -0.00063503 -0.00152693 -0.00063503
G2-222 -300.95677185 -35.29678938 -32.19434601 -3.32630538 -3.00835790 1.77740885 -0.04947744 -0.18410291 -1.04398497 -0.18069225 -0.00021853 -0.00052650 -0.00019145
G2-223 -197.26990481 -32.83072396 -29.61467488 -3.32262469 -3.41087827 2.05732469 -0.04156755 -0.19800331 -1.18005819 -0.18291488 -0.00197454 -0.00438548 -0.00191187
# G2IP + G2EA = 121
IP_11    -48.56392648 -7.65258480 -6.91632041 -0.76802353 -0.81805787 0.49996199 -0.00845526 -0.04055543 -0.29315045 -0.04055543 -0.00008142 -0.00027059 -0.00008142
IP_12    -66.88423362 -8.53516344 -7.72000265 -0.85711650 -0.77487637 0.47446154 -0.00847899 -0.04843564 -0.24799393 -0.02336192 -0.00003043 -0.00008906 -0.00001832
IP_137   -372.76231307 -25.33616758 -23.33117765 -2.00709868 -1.62410989 0.95664472 -0.01047164 -0.07090712 -0.35855348 -0.05105080 -0.00024878 -0.00058572 -0.00012107
IP_13    -67.13896408 -8.91928790 -8.10741498 -0.86841885 -0.85789356 0.51737532 -0.00965968 -0.04864559 -0.31458397 -0.04864559 -0.00004374 -0.00015025 -0.00004374
IP_14    -89.67273153 -10.38878629 -9.47259617 -0.98109196 -0.90090468 0.53854061 -0.01052630 -0.05169870 -0.31595286 -0.05169870 -0.00001787 -0.00006230 -0.00001787
IP_18    -269.52232213 -21.73119202 -19.89419449 -1.82013125 -1.61947457 0.96966043 -0.01378920 -0.04571924 -0.35993291 -0.04571924 -0.00023842 -0.00082192 -0.00023842
IP_19    -318.59193048 -23.28728318 -21.39870560 -1.89005326 -1.58099120 0.93835201 -0.01159292 -0.06509260 -0.34941633 -0.04614606 -0.00035875 -0.00081428 -0.00013781
IP_20    -318.84076727 -23.63938129 -21.72196911 -1.91728320 -1.65896397 0.98242686 -0.01306180 -0.05873309 -0.39078790 -0.05873309 -0.00029578 -0.00098795 -0.00029578
IP_22    -432.24260445 -27.85921660 -25.70756857 -2.15257311 -1.74852834 1.02098373 -0.01021624 -0.07210417 -0.40705646 -0.07210417 -0.00016223 -0.00049009 -0.00016223
IP_25    -65.86193738 -10.98045074 -9.88049650 -1.15073466 -1.15225180 0.70665334 -0.01301033 -0.06031195 -0.42059972 -0.06031195 -0.00028610 -0.00083139 -0.00028610
IP_26    -66.32001320 -11.73553529 -10.54891990 -1.21444905 -1.29342526 0.79421255 -0.01436323 -0.05743691 -0.44652017 -0.05743691 -0.00030181 -0.00089997 -0.00030181
IP_30    -99.47157856 -13.30344300 -12.05090793 -1.34748852 -1.22455084 0.73916165 -0.01758731 -0.07380557 -0.45977943 -0.07380557 -0.00012810 -0.00035245 -0.00012810
IP_34    -95.87041921 -13.10852648 -11.87713875 -1.33453401 -1.22077538 0.73627147 -0.01444083 -0.07849349 -0.48241680 -0.07849349 -0.00013835 -0.00038090 -0.00013835
IP_37    -133.36407937 -16.30415958 -14.86085601 -1.59727381 -1.42441505 0.85253117 -0.01908218 -0.08907568 -0.52018604 -0.12441609 -0.00006281 -0.00025868 -0.00017265
IP_43    -636.31242644 -45.16296562 -41.61164073 -3.60709127 -2.91218667 1.69638921 -0.02216839 -0.13580371 -0.70586854 -0.13580371 -0.00129306 -0.00371226 -0.00129306
IP_44    -745.08958427 -49.99069974 -46.12488638 -3.91028744 -3.12718176 1.81974939 -0.02287692 -0.14497363 -0.71928072 -0.14425352 -0.00071370 -0.00230290 -0.00115207
IP_45    -863.98020327 -55.00440225 -50.80714805 -4.22323627 -3.36495006 1.95090016 -0.02251263 -0.14502299 -0.78917601 -0.14502299 -0.00049700 -0.00148437 -0.00049700
IP_48    -405.28448901 -30.05648542 -27.61389503 -2.50509370 -2.07068977 1.22114546 -0.02096180 -0.10257452 -0.58115152 -0.10257452 -0.00054946 -0.00154495 -0.00054946
IP_51    -521.40262091 -37.49122473 -34.53521671 -3.05475367 -2.51468218 1.46780103 -0.02499023 -0.12313027 -0.70697482 -0.12313027 -0.00019918 -0.00062712 -0.00019918
IP_08    -33.63031281 -6.57873375 -5.89386860 -0.68561886 -0.78241084 0.48756810 -0.00763321 -0.02893350 -0.25950803 -0.02893350 -0.00011597 -0.00037234 -0.00011597
IP_al    -223.81220233 -18.05986558 -16.54040228 -1.53413542 -1.22376574 0.72843050 -0.00748978 -0.03651945 -0.21817384 -0.03120722 -0.00025723 -0.00090466 -0.00001088
IP_al+   -223.80160345 -17.86612417 -16.35935334 -1.52359561 -1.17820708 0.69641248 -0.00647851 -0.03161574 -0.20709353 -0.03161574 -0.00000997 -0.00042548 -0.00000997
IP_b     -20.77065702 -3.75899023 -3.29358822 -0.46309383 -0.38252202 0.25651717 -0.00275112 -0.00785727 -0.08986694 -0.00037998 -0.00006146 -0.00027807 -0.00000047
IP_b+    -20.74928102 -3.48632548 -3.03429575 -0.44578513 -0.32952372 0.22246518 -0.00166263 -0.00041593 -0.08703170 -0.00041593 -0.00000039 -0.00014160 -0.00000039
IP_be    -11.90783560 -2.66311783 -2.31274307 -0.34543359 -0.29852585 0.20321243 -0.00165509 -0.00049614 -0.09124156 -0.00049614 -0.00000157 -0.00069048 -0.00000157
IP_be+   -11.77600986 -2.49980795 -2.16436836 -0.32933452 -0.23111052 0.16939407 -0.00134384 -0.00061614 -0.03651786 0.00000000 -0.00000121 -0.00000146 0.00000000
IP_c     -32.62998700 -5.05933306 -4.47982805 -0.57977203 -0.47036693 0.31109395 -0.00386902 -0.02099099 -0.10747598 -0.00041432 -0.00005586 -0.00012722 -0.00000017
IP_c+    -32.55886152 -4.73468349 -4.15916038 -0.57202269 -0.41607968 0.27610605 -0.00257912 -0.00654735 -0.10170980 -0.00044788 -0.00001351 -0.00006462 -0.00000014
IP_cl    -431.97346091 -27.50574987 -25.36578497 -2.13517786 -1.66977141 0.97819484 -0.00940420 -0.07396464 -0.35769476 -0.05336776 -0.00013982 -0.00032438 -0.00007450
IP_cl+   -431.82068997 -27.22669890 -25.09178081 -2.12805457 -1.59244139 0.94096270 -0.00838037 -0.07446223 -0.31632974 -0.04006859 -0.00010378 -0.00017544 -0.00002145
IP_f     -89.40469922 -10.00383122 -9.06794731 -0.97267189 -0.81688217 0.49552011 -0.00835083 -0.04781624 -0.23773898 -0.02367318 -0.00000922 -0.00002498 -0.00000574
IP_f+    -89.18803803 -9.64722142 -8.69347368 -0.96156866 -0.72784524 0.45423103 -0.00513649 -0.04330374 -0.17272834 -0.00716318 -0.00000601 -0.00001252 -0.00000182
IP_h     -0.19104055 -0.30856519 -0.26510153 -0.04167383 -0.03982214 0.03982214 -0.00041033 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
IP_59    -33.53868272 -6.23108745 -5.58090908 -0.66808507 -0.70810038 0.44837635 -0.00698156 -0.03083953 -0.22263020 -0.01610983 -0.00010400 -0.00028187 -0.00006398
IP_60    -48.50644043 -7.39397245 -6.64450478 -0.76328415 -0.74325234 0.46383006 -0.00672530 -0.03975953 -0.22958887 -0.01659185 -0.00005237 -0.00012643 -0.00002531
IP_61    -66.74786241 -8.25557092 -7.42485949 -0.84574537 -0.69085955 0.43538200 -0.00611671 -0.04420416 -0.18002924 -0.00642135 -0.00001782 -0.00003970 -0.00000411
IP_62    -67.05277371 -8.60400694 -7.77571176 -0.86505119 -0.77912677 0.47968220 -0.00792485 -0.04563998 -0.24643139 -0.02146435 -0.00002708 -0.00007629 -0.00001584
IP_63    -89.51748174 -10.02150650 -9.08346601 -0.97858191 -0.81849138 0.49926789 -0.00839041 -0.04707135 -0.24435081 -0.02329769 -0.00001097 -0.00003225 -0.00000696
IP_64    -269.45078999 -21.42826566 -19.62070663 -1.80760377 -1.54549772 0.93246859 -0.01363019 -0.04860214 -0.32600224 -0.03705745 -0.00028101 -0.00064171 -0.00009221
IP_65    -318.26420532 -22.67130379 -20.82346336 -1.85459667 -1.44866406 0.86047805 -0.01020428 -0.05181173 -0.29820128 -0.03870296 -0.00014491 -0.00038654 -0.00003763
IP_66    -318.51923821 -23.01790936 -21.14213639 -1.88268711 -1.52700425 0.90555978 -0.01194794 -0.04767700 -0.34124139 -0.04767700 -0.00012219 -0.00051888 -0.00012219
IP_67    -318.74976450 -23.41569106 -21.49828366 -1.91032892 -1.58927667 0.94775642 -0.01252723 -0.05958459 -0.34143657 -0.04260513 -0.00024143 -0.00051740 -0.00008370
IP_68    -372.66977627 -25.09149514 -23.09131635 -1.99929207 -1.54915560 0.92053641 -0.00974920 -0.07156629 -0.31345520 -0.03855279 -0.00018795 -0.00031361 -0.00002450
IP_70    -432.11251708 -27.56534268 -25.41740018 -2.14852294 -1.67470765 0.98459256 -0.01015081 -0.07263106 -0.36383235 -0.05191944 -0.00012527 -0.00029335 -0.00006432
IP_71    -65.78495918 -10.69725865 -9.58463857 -1.15300233 -1.07929463 0.67276601 -0.01228640 -0.06509728 -0.35115994 -0.02636661 -0.00025220 -0.00049179 -0.00009793
IP_72    -66.26596107 -11.46119408 -10.26339415 -1.21581568 -1.22213292 0.76065274 -0.01543072 -0.05984169 -0.37886552 -0.03067946 -0.00026579 -0.00055046 -0.00013209
IP_73    -99.29487864 -12.99357460 -11.77149104 -1.33489244 -1.14483434 0.70141617 -0.02165744 -0.08116543 -0.44583583 -0.06964751 -0.00011230 -0.00028747 -0.00007661
IP_74    -95.72233329 -12.67541020 -11.50944242 -1.32530113 -1.14373476 0.69750288 -0.01854534 -0.08368488 -0.54122259 -0.10346221 -0.00011502 -0.00052413 -0.00022032
IP_75    -133.30724912 -15.91721176 -14.51024158 -1.58232046 -1.36229597 0.81777252 -0.01805621 -0.08830678 -0.57196613 -0.11321793 -0.00006235 -0.00022951 -0.00010140
IP_76    -636.21524780 -44.88857639 -41.36118776 -3.60206180 -2.84495941 1.66118322 -0.02321307 -0.13777528 -0.69439048 -0.12909341 -0.00110761 -0.00362585 -0.00129022
IP_77    -745.04273583 -49.69798642 -45.86477150 -3.90020401 -3.07043957 1.78591522 -0.02355626 -0.13938523 -0.74513457 -0.14255798 -0.00069588 -0.00224613 -0.00088508
IP_78    -863.89221386 -54.69082502 -50.53180567 -4.21268623 -3.29668241 1.91407671 -0.02336460 -0.14496669 -0.77268863 -0.14794363 -0.00041326 -0.00149172 -0.00066554
IP_79    -521.29433275 -37.16150881 -34.23720484 -3.04334108 -2.44302913 1.43011109 -0.03145788 -0.12092837 -0.68571546 -0.12819360 -0.00015750 -0.00051992 -0.00020152
IP_80    -405.15212100 -29.80800542 -27.38379582 -2.49434607 -1.99605449 1.18450696 -0.02090721 -0.10756443 -0.54985510 -0.09078315 -0.00044243 -0.00127943 -0.00041771
IP_n65   -318.34248115 -22.94740333 -21.08820244 -1.86004963 -1.50025652 0.89419669 -0.00991647 -0.07171670 -0.30599406 -0.03798287 -0.00039818 -0.00061971 -0.00004213
IP_li    -5.65621162 -1.77489953 -1.53482888 -0.23741671 -0.20611692 0.15211411 -0.00133310 -0.00040716 -0.03538369 0.00000000 -0.00000713 -0.00000838 0.00000000
IP_li+   -5.59275614 -1.64259778 -1.41404402 -0.22477478 -0.17433818 0.12664421 -0.00107249 0.00000000 -0.03458447 0.00000000 0.00000000 -0.00000021 0.00000000
IP_mg    -183.65179915 -15.95790921 -14.58753759 -1.38675227 -1.13095697 0.67026487 -0.00488538 -0.02753035 -0.18852221 -0.02753035 -0.00002313 -0.00123037 -0.00002313
IP_mg+   -183.54673304 -15.82104080 -14.45470817 -1.37682678 -1.06942365 0.64122677 -0.00431131 -0.02826095 -0.14334606 -0.02349873 -0.00001992 -0.00002268 -0.00000091
IP_na    -147.88074079 -13.97389137 -12.75324695 -1.24261165 -1.02428462 0.61512896 -0.00495891 -0.02535564 -0.13699939 -0.02275200 -0.00004175 -0.00004646 -0.00000133
IP_na+   -147.81908492 -13.85494474 -12.63656700 -1.23423023 -0.99083190 0.59176957 -0.00432652 -0.02245047 -0.13321867 -0.02245047 -0.00000126 -0.00000397 -0.00000126
IP_n     -47.81680801 -6.58297761 -5.88865523 -0.69440979 -0.56034516 0.36782304 -0.00459921 -0.04476842 -0.11848211 -0.00043869 -0.00003966 -0.00006319 -0.00000007
IP_n+    -47.69284445 -6.19697700 -5.49971790 -0.69315446 -0.50504092 0.33097080 -0.00341724 -0.02034393 -0.11212712 -0.00047018 -0.00001363 -0.00003338 -0.00000006
IP_o     -66.62738367 -8.18491413 -7.36763881 -0.83697391 -0.68781490 0.43027670 -0.00644920 -0.04625977 -0.17826774 -0.00731857 -0.00001833 -0.00003987 -0.00000507
IP_o+    -66.47941363 -7.89344896 -7.07310190 -0.81031233 -0.59548984 0.38823973 -0.00369037 -0.04199586 -0.11795935 -0.00044404 -0.00001123 -0.00001873 -0.00000003
IP_P     -318.09429730 -22.61644971 -20.78885783 -1.82597090 -1.41720142 0.84960607 -0.00780014 -0.07844456 -0.26513021 -0.03407460 -0.00041656 -0.00043810 -0.00000313
IP_P+    -318.00834255 -22.33754439 -20.51925452 -1.82224026 -1.36748566 0.81475385 -0.00811390 -0.05618764 -0.25504193 -0.03438391 -0.00014949 -0.00025850 -0.00000290
IP_s     -372.50414341 -24.99855722 -23.01402283 -1.98209582 -1.54315505 0.91298766 -0.00890184 -0.07367719 -0.31283821 -0.04026823 -0.00023443 -0.00040280 -0.00004384
IP_s+    -372.39932923 -24.76644301 -22.79050859 -1.96925704 -1.46449649 0.87575343 -0.00730799 -0.07422993 -0.27043888 -0.03409300 -0.00016861 -0.00019205 -0.00000171
IP_si    -268.57594626 -20.27367093 -18.60087071 -1.68047428 -1.31961685 0.78836034 -0.00810827 -0.05083182 -0.24340148 -0.03276624 -0.00039858 -0.00063393 -0.00000562
IP_si+   -268.52879544 -20.04069164 -18.37721068 -1.67400787 -1.27180427 0.75505797 -0.00750800 -0.03891071 -0.23178436 -0.03311256 -0.00009380 -0.00034073 -0.00000518
EA_10    -33.21870238 -6.29714800 -5.66508949 -0.66321299 -0.76014468 0.47299952 -0.01176680 -0.03620888 -0.28148855 -0.03620888 -0.00022697 -0.00093869 -0.00022697
EA_10n   -33.36379451 -6.20990964 -5.54759156 -0.66263507 -0.70146528 0.44372773 -0.00648633 -0.03492687 -0.21219697 -0.01294507 -0.00012963 -0.00027596 -0.00004817
EA_11    -47.90558454 -7.01551060 -6.34023020 -0.73528617 -0.71746579 0.44469089 -0.01433100 -0.05340782 -0.26363951 -0.02522690 -0.00010406 -0.00039364 -0.00006568
EA_11n   -48.06699743 -6.91159301 -6.19972327 -0.72936507 -0.64970356 0.41292173 -0.00669340 -0.04523290 -0.17935538 -0.00600882 -0.00005687 -0.00012427 -0.00001041
EA_12    -48.15623117 -7.38520697 -6.70050579 -0.75171448 -0.79834880 0.48742360 -0.01498565 -0.05007128 -0.32480580 -0.05007128 -0.00013656 -0.00058562 -0.00013656
EA_12n   -48.31677232 -7.26696198 -6.54166947 -0.75281349 -0.73568536 0.45686672 -0.00792168 -0.04381939 -0.23889878 -0.01945824 -0.00007200 -0.00019678 -0.00003731
EA_13    -66.72210669 -8.68414530 -7.92057434 -0.85583865 -0.84165413 0.50658005 -0.01927800 -0.05936974 -0.34886827 -0.05936974 -0.00006066 -0.00025451 -0.00006066
EA_13n   -66.88669222 -8.53267591 -7.71826520 -0.85710136 -0.77463228 0.47434194 -0.00889228 -0.04855610 -0.24847745 -0.02346184 -0.00003089 -0.00009129 -0.00001875
EA_14    -268.69918317 -20.75790859 -19.05117227 -1.71940844 -1.44026079 0.86339564 -0.01167651 -0.06508586 -0.29275868 -0.03591414 -0.00108081 -0.00147161 -0.00007920
EA_14n   -268.81641102 -20.61464168 -18.90533398 -1.71723318 -1.39982991 0.83410649 -0.00993588 -0.04741229 -0.28351501 -0.03630728 -0.00031120 -0.00080265 -0.00006859
EA_15    -268.93207326 -21.11049062 -19.36575731 -1.75443890 -1.52060088 0.90843175 -0.01286950 -0.05865860 -0.33340485 -0.04241448 -0.00080094 -0.00174471 -0.00024462
EA_15n   -269.05566994 -20.96708100 -19.22180361 -1.75088454 -1.47777957 0.87978378 -0.01159492 -0.04329351 -0.32295783 -0.04329351 -0.00020622 -0.00092555 -0.00020622
EA_16    -269.16218554 -21.47534286 -19.69204899 -1.78779248 -1.59890665 0.95382166 -0.01411167 -0.05208575 -0.37034012 -0.05208575 -0.00051582 -0.00185369 -0.00051582
EA_16n   -269.26935655 -21.36273996 -19.56990837 -1.78446981 -1.53986590 0.92384978 -0.01247402 -0.05210600 -0.32326762 -0.03853794 -0.00037843 -0.00077393 -0.00011483
EA_17    -318.21924207 -23.06359219 -21.21334092 -1.86458355 -1.56194430 0.92451392 -0.01269222 -0.07152096 -0.35182479 -0.05041579 -0.00056398 -0.00149440 -0.00026390
EA_17n   -318.34348874 -22.94639086 -21.08736759 -1.86005153 -1.50015808 0.89414915 -0.00998339 -0.07172716 -0.30607123 -0.03799140 -0.00039928 -0.00062331 -0.00004226
EA_18    -318.46422935 -23.41683414 -21.53906407 -1.89130645 -1.63965405 0.96833808 -0.01367403 -0.06451202 -0.39447435 -0.06451202 -0.00049519 -0.00178274 -0.00049519
EA_18n   -318.59245753 -23.28679098 -21.39830709 -1.89006180 -1.58092404 0.93831974 -0.01164533 -0.06510269 -0.34946808 -0.04615399 -0.00036044 -0.00081796 -0.00013794
EA_19    -372.64030652 -25.49726454 -23.50354411 -2.00831115 -1.68615569 0.98794670 -0.01321556 -0.07141111 -0.40575139 -0.07141111 -0.00034549 -0.00117922 -0.00034549
EA_19n   -372.76309258 -25.33542811 -23.33061548 -2.00710742 -1.62399906 0.95659511 -0.01056424 -0.07094015 -0.35870960 -0.05108121 -0.00024954 -0.00059115 -0.00012176
EA_20    -133.15724742 -16.47471634 -15.03739941 -1.61700396 -1.49017710 0.88840240 -0.02672855 -0.10010777 -0.59524533 -0.11310588 -0.00010283 -0.00042726 -0.00018897
EA_20n   -133.36772751 -16.30087251 -14.85827234 -1.59725034 -1.42412687 0.85235464 -0.01930372 -0.08919508 -0.52081954 -0.12468170 -0.00006388 -0.00026310 -0.00017502
EA_21    -114.36933687 -14.89895421 -13.55851494 -1.47974265 -1.37335212 0.82557084 -0.02771242 -0.09731998 -0.50866089 -0.09806159 -0.00015763 -0.00047836 -0.00022390
EA_21n   -114.59347036 -14.69656203 -13.35760361 -1.46766965 -1.32270332 0.79454751 -0.01914366 -0.08314453 -0.50925032 -0.09021111 -0.00010192 -0.00031874 -0.00012938
EA_22    -80.47284282 -11.86116170 -10.72364748 -1.22528399 -1.17230721 0.71052524 -0.01569849 -0.07368394 -0.45335098 -0.07368394 -0.00028247 -0.00077517 -0.00028247
EA_22n   -80.59441822 -11.61351002 -10.50443256 -1.21815344 -1.10473175 0.67653789 -0.02048518 -0.07507232 -0.45971301 -0.07917339 -0.00019952 -0.00072581 -0.00025650
EA_23    -384.66507185 -30.97000217 -28.45591778 -2.61694425 -2.21926439 1.30714920 -0.02936133 -0.12385761 -0.62247772 -0.12052114 -0.00061620 -0.00138654 -0.00043341
EA_23n   -384.82704035 -30.78346376 -28.27896446 -2.60883084 -2.17190291 1.27632517 -0.02686619 -0.11389102 -0.62752694 -0.11595581 -0.00034985 -0.00094841 -0.00032274
EA_24    -744.94743348 -50.16257454 -46.28482322 -3.92085437 -3.18751372 1.85335673 -0.02447542 -0.14560949 -0.75399032 -0.14234021 -0.00091217 -0.00292317 -0.00117822
EA_24n   -745.09055266 -49.98993945 -46.12427383 -3.91026876 -3.12705049 1.81967599 -0.02295219 -0.14505634 -0.71957305 -0.14427832 -0.00071838 -0.00231561 -0.00115515
EA_25    -863.87454107 -55.18826222 -50.96919174 -4.25167891 -3.41422814 1.98559321 -0.02325194 -0.15219094 -0.78699163 -0.14449488 -0.00050760 -0.00167522 -0.00065167
EA_25n   -863.98131862 -55.00339017 -50.80635685 -4.22323900 -3.36481351 1.95083773 -0.02263955 -0.14515103 -0.78976371 -0.14515103 -0.00050065 -0.00149919 -0.00050065
EA_8     -32.72107574 -5.56945057 -4.98447396 -0.61390345 -0.59836243 0.38667703 -0.01065554 -0.04997975 -0.17770373 -0.00560284 -0.00025744 -0.00047775 -0.00002787
EA_8n    -32.87283429 -5.40526021 -4.79813701 -0.61494142 -0.55441447 0.35728109 -0.00549374 -0.01970419 -0.15889917 -0.00544281 -0.00006465 -0.00020054 -0.00001954
EA_9     -32.96716242 -5.92664004 -5.31603642 -0.64139182 -0.68103284 0.43019350 -0.01107469 -0.04314535 -0.23262959 -0.01757126 -0.00024577 -0.00067561 -0.00010071
EA_9n    -33.08478957 -5.84845602 -5.21463172 -0.63373911 -0.61427617 0.39993365 -0.00561224 -0.03889799 -0.15980559 -0.00405398 -0.00013080 -0.00019172 -0.00001370
EA_c-    -32.47924017 -5.22362834 -4.66995726 -0.57830351 -0.51281609 0.34213578 -0.01085702 -0.05713616 -0.11904582 -0.00039424 -0.00027099 -0.00028396 -0.00000019
EA_c     -32.63041492 -5.05888225 -4.47950845 -0.57976742 -0.47031336 0.31106990 -0.00395772 -0.02102815 -0.10759395 -0.00042054 -0.00005593 -0.00012827 -0.00000017
EA_cl-   -431.86189259 -27.70444691 -25.57418159 -2.13647632 -1.73544051 1.01090536 -0.01226180 -0.07477780 -0.40218698 -0.07477780 -0.00019096 -0.00063718 -0.00019096
EA_cl    -431.97401259 -27.50517311 -25.36538099 -2.13518149 -1.66969172 0.97816249 -0.00950420 -0.07403058 -0.35801945 -0.05342989 -0.00013980 -0.00032889 -0.00007451
EA_f-    -89.24563460 -10.20181664 -9.32536563 -0.97095128 -0.88868467 0.52947973 -0.02169319 -0.05992158 -0.33903594 -0.05992158 -0.00001543 -0.00006925 -0.00001543
EA_f     -89.40609546 -10.00230589 -9.06691404 -0.97266401 -0.81674347 0.49545089 -0.00871612 -0.04788841 -0.23809954 -0.02373873 -0.00000923 -0.00002597 -0.00000576
EA_o-    -66.46450510 -8.32203390 -7.55213831 -0.84312275 -0.76024460 0.46402215 -0.01837727 -0.05709016 -0.27134865 -0.02975415 -0.00003182 -0.00012833 -0.00002301
EA_o     -66.62862744 -8.18360842 -7.36674598 -0.83695253 -0.68766977 0.43020806 -0.00672186 -0.04631996 -0.17855724 -0.00734441 -0.00001835 -0.00004115 -0.00000510
EA_p-    -317.97308997 -22.72254755 -20.90024690 -1.83517927 -1.48185129 0.88056166 -0.01148810 -0.07860887 -0.30809366 -0.04050037 -0.00060710 -0.00120512 -0.00010807
EA_p     -318.09491526 -22.61580479 -20.78835478 -1.82598424 -1.41713095 0.84956619 -0.00787929 -0.07845740 -0.26517598 -0.03408024 -0.00041679 -0.00043987 -0.00000313
EA_s-    -372.38544613 -25.14834234 -23.17287509 -1.98663960 -1.60838060 0.94493601 -0.01251760 -0.07448472 -0.35819178 -0.05400296 -0.00033046 -0.00089740 -0.00017766
EA_s     -372.50481845 -24.99787360 -23.01351878 -1.98209961 -1.54305568 0.91294370 -0.00899519 -0.07371525 -0.31302168 -0.04029835 -0.00023439 -0.00040731 -0.00004390
EA_si-   -268.46485441 -20.41529159 -18.74720048 -1.68166917 -1.35816261 0.81834081 -0.01033854 -0.07136591 -0.25196081 -0.03255134 -0.00136713 -0.00112461 -0.00000590
EA_si    -268.57634611 -20.27325398 -18.60054279 -1.68048021 -1.31956552 0.78832954 -0.00815723 -0.05084807 -0.24344961 -0.03277603 -0.00039899 -0.00063532 -0.00000562
# 56 molecules for S22 
# 12 molecules for ADIM6
  S22_1  -97.12317570 -15.31161636 -13.84403097 -1.52892407 -1.63758143 0.99792202 -0.01750245 -0.08229459 -0.58851219 -0.08229459 -0.00023169 -0.00068176 -0.00023169
S22_01a  -48.56183583 -7.65475022 -6.91820161 -0.76809268 -0.81817880 0.50000962 -0.00844690 -0.04054296 -0.29302322 -0.04054296 -0.00008119 -0.00026984 -0.00008119
  S22_2  -134.26978725 -17.85194480 -16.23379714 -1.72851003 -1.71778259 1.03240113 -0.02009023 -0.09846294 -0.63044039 -0.09846294 -0.00012822 -0.00038447 -0.00012822
S22_02a  -67.13483907 -8.92377481 -8.11117339 -0.86848414 -0.85811711 0.51745855 -0.00961773 -0.04856451 -0.31402344 -0.04856451 -0.00004344 -0.00014887 -0.00004344
  S22_3  -333.03342100 -44.63894475 -40.61792811 -4.32435610 -4.19664276 2.49118129 -0.07070253 -0.26312160 -1.57167447 -0.26312160 -0.00082010 -0.00207493 -0.00082010
S22_03a  -166.53511337 -22.29002415 -20.27231978 -2.17432949 -2.09471992 1.24852749 -0.03446797 -0.13000398 -0.78574294 -0.13000398 -0.00029534 -0.00080596 -0.00029534
  S22_4  -295.85659462 -42.13377047 -38.26227428 -4.12335107 -4.11886162 2.45731881 -0.06604007 -0.24704844 -1.52622987 -0.24704844 -0.00100682 -0.00257622 -0.00100682
S22_04a  -147.94104200 -21.04519636 -19.10349637 -2.07179928 -2.05656176 1.23120451 -0.03255478 -0.12213616 -0.76214176 -0.12213616 -0.00036851 -0.00101408 -0.00036851
  S22_5  -721.44324922 -103.73513490 -94.21487751 -10.10678895 -10.04212782 5.94559820 -0.16101387 -0.63134185 -3.70683392 -0.63134185 -0.00412846 -0.00992213 -0.00412846
S22_05a  -360.73290489 -51.84409180 -47.07795678 -5.06432190 -5.01808313 2.97564319 -0.08013571 -0.31365372 -1.85318257 -0.31365372 -0.00177375 -0.00439260 -0.00177375
  S22_6  -539.65174046 -83.81626695 -75.90179891 -8.28620384 -8.47625180 5.05320622 -0.11671834 -0.50733937 -3.06590707 -0.50733937 -0.00473908 -0.01089479 -0.00473908
S22_06a  -279.13237558 -42.51151061 -38.51210778 -4.20634122 -4.25455247 2.53838268 -0.06078751 -0.25473775 -1.54619968 -0.25473775 -0.00191489 -0.00458278 -0.00191489
S22_06b  -260.54341019 -41.26587521 -37.33466600 -4.10192778 -4.21575913 2.52025898 -0.05428006 -0.24738276 -1.51186340 -0.24738276 -0.00213571 -0.00492286 -0.00213571
  S22_7  -797.70084143 -118.56721912 -107.59101191 -11.58929069 -11.68433031 6.92312246 -0.17332622 -0.73411579 -4.30008644 -0.73411579 -0.00614325 -0.01413420 -0.00614325
S22_07a  -403.85821144 -60.77318835 -55.12916484 -5.96276668 -6.00710395 3.56032377 -0.08393670 -0.38229643 -2.21353798 -0.38229643 -0.00316197 -0.00719074 -0.00316197
S22_07b  -393.86977679 -57.75297714 -52.40521264 -5.64930386 -5.67103101 3.36846486 -0.08773879 -0.34673927 -2.07855122 -0.34673927 -0.00220220 -0.00537444 -0.00220220
  S22_8  -67.25969552 -13.15766962 -11.78944244 -1.36823413 -1.56529107 0.97441741 -0.01529326 -0.05836875 -0.52025251 -0.05836875 -0.00031000 -0.00090146 -0.00031000
S22_08a  -33.63041908 -6.57862404 -5.89377114 -0.68561635 -0.78240419 0.48756601 -0.00763389 -0.02893350 -0.25951361 -0.02893350 -0.00011598 -0.00037240 -0.00011598
  S22_9  -132.64697244 -23.46164922 -21.09381756 -2.42176052 -2.58748253 1.58636958 -0.02904614 -0.11657854 -0.89804951 -0.11657854 -0.00080574 -0.00221739 -0.00080574
S22_09a  -66.32743176 -11.72762908 -10.54180063 -1.21461205 -1.29297283 0.79413380 -0.01443520 -0.05755023 -0.44760862 -0.05755023 -0.00030438 -0.00091042 -0.00030438
 S22_10  -231.15018517 -39.81180652 -35.87807954 -4.02721079 -4.27652804 2.58766046 -0.04778384 -0.22293256 -1.48126402 -0.22293256 -0.00234654 -0.00534650 -0.00234654
S22_10a  -197.53011331 -33.22469157 -29.97239793 -3.34854084 -3.49250396 2.10170943 -0.03996993 -0.19228816 -1.21818794 -0.19228816 -0.00195478 -0.00441468 -0.00195478
S22_10b  -33.62585248 -6.58331244 -5.89793818 -0.68572363 -0.78268795 0.48765506 -0.00760511 -0.02893376 -0.25927728 -0.02893376 -0.00011534 -0.00036970 -0.00011534
 S22_11  -395.04397133 -66.45692364 -59.96241496 -6.68154590 -6.98799993 4.19980892 -0.08055541 -0.39034241 -2.45014414 -0.39034241 -0.00504801 -0.01111591 -0.00504801
S22_11a  -197.52890640 -33.22593285 -29.97343268 -3.34864860 -3.49257637 2.10174721 -0.03996217 -0.19228278 -1.21813197 -0.19228278 -0.00195473 -0.00441425 -0.00195473
 S22_12  -454.83484999 -70.64341322 -63.94562585 -7.03622483 -7.12381526 4.25363532 -0.08984848 -0.43420461 -2.60068829 -0.43420461 -0.00451637 -0.00997568 -0.00451637
S22_12a  -227.42690124 -35.31561304 -31.96138028 -3.52674022 -3.56018091 2.12892827 -0.04457329 -0.21403261 -1.29320363 -0.21403261 -0.00171075 -0.00389025 -0.00171075
 S22_13  -721.43300393 -103.72316259 -94.20055686 -10.10559047 -10.04139025 5.94532453 -0.16058156 -0.63445605 -3.71876160 -0.63445605 -0.00497310 -0.01162735 -0.00497310
S22_13a  -360.72648937 -51.85189593 -47.08431845 -5.06485170 -5.01843591 2.97588050 -0.08004440 -0.31341276 -1.85212200 -0.31341276 -0.00177154 -0.00438804 -0.00177154
 S22_14  -508.45440642 -83.83787027 -75.74354763 -8.36107733 -8.71088915 5.21105823 -0.10402630 -0.50749002 -3.09207513 -0.50749002 -0.00700412 -0.01534387 -0.00700412
S22_14a  -310.94328380 -50.60589289 -45.74887992 -5.03475574 -5.21438382 3.11477192 -0.06312136 -0.30641594 -1.85321331 -0.30641594 -0.00332724 -0.00747753 -0.00332724
S22_14b  -197.52893412 -33.22593900 -29.97364328 -3.34835539 -3.49257623 2.10168948 -0.03995473 -0.19226778 -1.21802138 -0.19226778 -0.00195273 -0.00441039 -0.00195273
 S22_15  -797.68648394 -118.56315508 -107.58730915 -11.57988724 -11.68500598 6.92033666 -0.17290846 -0.74066311 -4.31584639 -0.74066311 -0.00755745 -0.01693377 -0.00755745
S22_15a  -403.85811138 -60.77287950 -55.12794259 -5.96386199 -6.00704799 3.56053188 -0.08398369 -0.38244399 -2.21417441 -0.38244399 -0.00317375 -0.00721262 -0.00317375
S22_15b  -393.85814142 -57.76669486 -52.41648066 -5.65011646 -5.67169811 3.36886194 -0.08760559 -0.34640762 -2.07691462 -0.34640762 -0.00219263 -0.00534910 -0.00219263
 S22_16  -132.19743470 -22.69933535 -20.41760182 -2.36125944 -2.44549040 1.49967019 -0.02773635 -0.11916405 -0.87193634 -0.11916405 -0.00071271 -0.00199730 -0.00071271
S22_16a  -66.32656522 -11.72851991 -10.54257576 -1.21464125 -1.29302557 0.79415067 -0.01442875 -0.05755115 -0.44757835 -0.05755115 -0.00030418 -0.00090986 -0.00030418
S22_16b  -65.87565326 -10.96531705 -9.86750008 -1.15073724 -1.15145297 0.70645028 -0.01317222 -0.06087453 -0.42363730 -0.06087453 -0.00029393 -0.00085658 -0.00029393
 S22_17  -264.66450337 -42.14964782 -38.09020351 -4.20885102 -4.35194984 2.61704706 -0.05010056 -0.24270100 -1.53644256 -0.24270100 -0.00220585 -0.00499427 -0.00220585
S22_17a  -197.53220498 -33.22249195 -29.97035130 -3.34865616 -3.49237612 2.10170287 -0.03999151 -0.19231351 -1.21840336 -0.19231351 -0.00195696 -0.00441948 -0.00195696
S22_17b  -67.13641992 -8.92186398 -8.10962970 -0.86850501 -0.85803284 0.51743855 -0.00964642 -0.04863998 -0.31447869 -0.04863998 -0.00004362 -0.00014986 -0.00004362
 S22_18  -246.08705024 -40.88369545 -36.89903120 -4.10930308 -4.31206251 2.59991956 -0.04873380 -0.23456602 -1.51505946 -0.23456602 -0.00228914 -0.00520371 -0.00228914
S22_18a  -197.53050106 -33.22428216 -29.97200655 -3.34857721 -3.49248020 2.10171116 -0.03997432 -0.19229363 -1.21823361 -0.19229363 -0.00195528 -0.00441577 -0.00195528
S22_18b  -48.56186896 -7.65449277 -6.91803103 -0.76815884 -0.81817449 0.50002339 -0.00846843 -0.04057043 -0.29323852 -0.04057043 -0.00008122 -0.00027066 -0.00008122
 S22_19  -278.40580095 -45.24962867 -40.84497407 -4.58232001 -4.68010434 2.82047887 -0.05545851 -0.26658341 -1.68614656 -0.26658341 -0.00246903 -0.00564888 -0.00246903
S22_19a  -197.53270812 -33.22195961 -29.96984670 -3.34869759 -3.49234519 2.10170394 -0.03999709 -0.19232037 -1.21846076 -0.19232037 -0.00195758 -0.00442082 -0.00195758
S22_19b  -80.88248799 -12.01533229 -10.85843690 -1.24395716 -1.18555710 0.72130222 -0.01514639 -0.07226356 -0.46505156 -0.07226356 -0.00021815 -0.00062691 -0.00021815
 S22_20  -395.05203679 -66.45488513 -59.95606656 -6.68691052 -6.98690874 4.20094725 -0.08026554 -0.38765770 -2.44316574 -0.38765770 -0.00456427 -0.01015215 -0.00456427
S22_20a  -197.53125741 -33.22348901 -29.97127830 -3.34860479 -3.49243407 2.10170602 -0.03998175 -0.19230204 -1.21830596 -0.19230204 -0.00195597 -0.00441731 -0.00195597
S22_20b  -197.53321239 -33.22140863 -29.96927018 -3.34881924 -3.49231328 2.10172057 -0.04000492 -0.19233163 -1.21855058 -0.19233163 -0.00195876 -0.00442326 -0.00195876
 S22_21  -508.46670150 -83.83612883 -75.73557859 -8.36888008 -8.70944111 5.21287511 -0.10361566 -0.50322398 -3.08140873 -0.50322398 -0.00618794 -0.01372036 -0.00618794
S22_21a  -310.94692742 -50.60198386 -45.74545446 -5.03473372 -5.21417037 3.11471426 -0.06314646 -0.30647680 -1.85358407 -0.30647680 -0.00333022 -0.00748394 -0.00333022
S22_21b  -197.53172849 -33.22299462 -29.97082380 -3.34862284 -3.49240533 2.10170300 -0.03998640 -0.19230734 -1.21835142 -0.19230734 -0.00195641 -0.00441829 -0.00195641
 S22_22  -528.34518163 -82.93716838 -75.03333373 -8.22174009 -8.44297028 5.04503045 -0.10652017 -0.49100983 -3.00248847 -0.49100983 -0.00498875 -0.01113888 -0.00498875
S22_22a  -264.18075691 -41.45930642 -37.50272404 -4.11897274 -4.21978187 2.52466945 -0.05306768 -0.24357111 -1.49765374 -0.24357111 -0.00214954 -0.00487882 -0.00214954
S22_22b  -264.18075692 -41.45930642 -37.50272404 -4.11897274 -4.21978187 2.52466945 -0.05306768 -0.24357111 -1.49765374 -0.24357111 -0.00214954 -0.00487882 -0.00214954
    AM2  -66.76845504 -12.48209615 -11.20986870 -1.27643031 -1.43428406 0.88174008 -0.01514994 -0.05925595 -0.48053967 -0.05925595 -0.00032682 -0.00091596 -0.00032682
    AD2  -133.53295232 -24.96657411 -22.42553191 -2.54648171 -2.86967068 1.76183408 -0.03042523 -0.11984597 -0.96398369 -0.11984597 -0.00085425 -0.00223320 -0.00085425
    AM3  -99.90818574 -18.38524789 -16.52792807 -1.86426136 -2.08629828 1.27497832 -0.02275851 -0.09070074 -0.70343550 -0.09070074 -0.00061085 -0.00160293 -0.00061085
    AD3  -199.81010485 -36.77411055 -33.06461227 -3.71949658 -4.17420655 2.54762716 -0.04578017 -0.18359282 -1.41174084 -0.18359282 -0.00157806 -0.00391861 -0.00157806
    AM4  -133.04713565 -24.28907409 -21.84661526 -2.45202057 -2.73840257 1.66824492 -0.03034457 -0.12222689 -0.92650071 -0.12222689 -0.00091856 -0.00233738 -0.00091856
    AD4  -266.08487874 -48.58366007 -43.70606724 -4.89136571 -5.47912872 3.33321640 -0.06110018 -0.24767426 -1.86017922 -0.24767426 -0.00238968 -0.00577978 -0.00238968
    AM5  -166.18588341 -30.19302501 -27.16538852 -3.03983803 -3.39051925 2.06153409 -0.03792844 -0.15375825 -1.14962535 -0.15375825 -0.00123941 -0.00309812 -0.00123941
    AD5  -332.35936754 -60.39341229 -54.34750352 -6.06342059 -6.78402151 4.11883948 -0.07639590 -0.31175157 -2.30865987 -0.31175157 -0.00323128 -0.00770051 -0.00323128
    AM6  -199.32467256 -36.09693737 -32.48412991 -3.62763999 -4.04263443 2.45481829 -0.04551518 -0.18530064 -1.37276837 -0.18530064 -0.00156573 -0.00386975 -0.00156573
    AD6  -398.63374488 -72.20301609 -64.98906504 -7.23537196 -8.08895275 4.90445075 -0.09174278 -0.37595893 -2.75748551 -0.37595893 -0.00410149 -0.00967886 -0.00410149
    AM7  -232.46343658 -42.00087621 -37.80288791 -4.21544196 -4.69474745 2.84810103 -0.05310041 -0.21684406 -1.59591540 -0.21684406 -0.00189432 -0.00464592 -0.00189432
    AD7  -464.90757709 -84.01318277 -75.63117272 -8.40681159 -9.39388186 5.68986492 -0.10701602 -0.44024520 -3.20639527 -0.44024520 -0.00496997 -0.01165264 -0.00496997
# WATER27  = 30
      H2O20 -1342.78608857 -178.53938030 -162.61515623 -17.03235955 -17.21847716 10.25133276 -0.22994097 -1.03695018 -6.42462944 -1.03695018 -0.00382335 -0.00909344 -0.00382335
    H2O20es -1342.77712740 -178.55234907 -162.63897564 -17.00756935 -17.22269913 10.24325842 -0.23118581 -1.04137288 -6.43313813 -1.04137288 -0.00427389 -0.00999173 -0.00427389
    H2O20fc -1342.77625864 -178.54817566 -162.63241847 -17.00389836 -17.22278174 10.24128381 -0.23129740 -1.04177542 -6.43500548 -1.04177542 -0.00427134 -0.00998356 -0.00427134
    H2O20fs -1342.77463107 -178.55182621 -162.63641059 -17.00666834 -17.22266195 10.24258844 -0.23080339 -1.04131044 -6.43344102 -1.04131044 -0.00431089 -0.01006293 -0.00431089
       H2O2 -134.28200107 -17.83933784 -16.22382451 -1.72837502 -1.71689814 1.03202274 -0.02092210 -0.09905636 -0.63367876 -0.09905636 -0.00013250 -0.00039775 -0.00013250
       H2O3 -201.42132877 -26.76647808 -24.35683759 -2.57702530 -2.57820065 1.54356671 -0.03287477 -0.15126250 -0.95560492 -0.15126250 -0.00028285 -0.00077128 -0.00028285
       H2O4 -268.56058331 -35.69577459 -32.49239879 -3.42733344 -3.43954233 2.05596176 -0.04444683 -0.20338574 -1.27719557 -0.20338574 -0.00043119 -0.00114297 -0.00043119
       H2O5 -335.69965914 -44.62313249 -40.62059584 -4.28224181 -4.29990936 2.56954246 -0.05553556 -0.25444489 -1.59639144 -0.25444489 -0.00056398 -0.00147886 -0.00056398
      H2O6b -402.83893935 -53.54845555 -48.74970282 -5.13290444 -5.16088642 3.08165178 -0.06717760 -0.30650843 -1.91843826 -0.30650843 -0.00076234 -0.00194797 -0.00076234
     H2O6c2 -402.83869373 -53.55100660 -48.74800438 -5.13780389 -5.16011872 3.08322267 -0.06649272 -0.30524990 -1.91489921 -0.30524990 -0.00068292 -0.00178440 -0.00068292
      H2O6c -402.83830408 -53.54740340 -48.75007337 -5.12916040 -5.16138390 3.08040106 -0.06744555 -0.30723019 -1.92034095 -0.30723019 -0.00083484 -0.00209355 -0.00083484
       H2O6 -402.83832198 -53.54728973 -48.74977919 -5.12796417 -5.16153622 3.07992039 -0.06751696 -0.30725946 -1.92061182 -0.30725946 -0.00085676 -0.00213589 -0.00085676
    H2O8d2d -537.11630463 -71.40670839 -65.02759894 -6.82085473 -6.88545497 4.10223670 -0.09145795 -0.41321146 -2.56743459 -0.41321146 -0.00131352 -0.00320104 -0.00131352
     H2O8s4 -537.11550961 -71.40741335 -65.02835569 -6.82072829 -6.88551503 4.10223337 -0.09144854 -0.41321568 -2.56741807 -0.41321568 -0.00131332 -0.00320090 -0.00131332
        H2O -67.14198171 -8.91633491 -8.10539380 -0.86840792 -0.85758869 0.51721860 -0.01016148 -0.04891003 -0.31587581 -0.04891003 -0.00004479 -0.00015462 -0.00004479
       H3Op -67.32410479 -9.01466918 -8.18559631 -0.87557567 -0.86414451 0.52320307 -0.00858096 -0.04481787 -0.30621214 -0.04481787 -0.00003535 -0.00011377 -0.00003535
   H3OpH2O2 -201.64377925 -26.88946568 -24.46879179 -2.57941868 -2.58721359 1.54929793 -0.03074894 -0.14747320 -0.94458212 -0.14747320 -0.00022838 -0.00063820 -0.00022838
   H3OpH2O3 -268.79684544 -35.82236286 -32.59746484 -3.43719061 -3.44746182 2.06358174 -0.04143581 -0.19776870 -1.26196158 -0.19776870 -0.00034602 -0.00093971 -0.00034602
 H3OpH2O62d -470.23311000 -62.60215126 -56.98145458 -5.99988903 -6.02894507 3.60354117 -0.07461209 -0.35174162 -2.22288118 -0.35174162 -0.00078614 -0.00203167 -0.00078614
 H3OpH2O63d -470.23037146 -62.60191396 -56.99124614 -5.98737332 -6.03096420 3.59943657 -0.07660287 -0.35422449 -2.22909647 -0.35422449 -0.00094531 -0.00235691 -0.00094531
H3OpH2O6OHm -537.08184961 -71.37042943 -65.04799799 -6.79352584 -6.88811011 4.09658224 -0.09506672 -0.42263302 -2.59270449 -0.42263302 -0.00130288 -0.00323333 -0.00130288
    H3OpH2O -134.49027744 -17.95152503 -16.33274546 -1.72419854 -1.72633917 1.03562144 -0.01987757 -0.09692673 -0.62772085 -0.09692673 -0.00012510 -0.00036610 -0.00012510
        OHm -66.72010497 -8.68636880 -7.92246682 -0.85585044 -0.84177377 0.50662315 -0.01924648 -0.05960141 -0.34969694 -0.05960141 -0.00006030 -0.00025015 -0.00006030
    OHmH2O2 -201.02119300 -26.56488184 -24.20867058 -2.55770638 -2.56655468 1.53298493 -0.03929359 -0.16214121 -0.98629902 -0.16214121 -0.00032618 -0.00093122 -0.00032618
    OHmH2O3 -268.17162842 -35.49761780 -32.33932891 -3.41387654 -3.42732684 2.04715771 -0.04992945 -0.21285927 -1.30468685 -0.21285927 -0.00048531 -0.00131596 -0.00048531
  OHmH2O4c4 -335.31474460 -44.43325585 -40.47206678 -4.26566742 -4.28859348 2.55985170 -0.06044513 -0.26407480 -1.62374345 -0.26407480 -0.00071532 -0.00183933 -0.00071532
  OHmH2O4cs -335.31023190 -44.43252209 -40.48331977 -4.25526079 -4.29028037 2.55689295 -0.06188117 -0.26635458 -1.62901240 -0.26635458 -0.00077089 -0.00196218 -0.00077089
    OHmH2O5 -402.45396145 -53.36359602 -48.61593022 -5.10514496 -5.15180163 3.06892025 -0.07339325 -0.31828283 -1.95046232 -0.31828283 -0.00100444 -0.00249799 -0.00100444
    OHmH2O6 -469.59762591 -62.29215853 -56.75097338 -5.95434223 -6.01339699 3.58093120 -0.08500685 -0.37084414 -2.27343023 -0.37084414 -0.00123914 -0.00304287 -0.00123914
     OHmH2O -133.87053688 -17.62665911 -16.07266392 -1.70264595 -1.70528502 1.01908230 -0.02875235 -0.11170593 -0.66950584 -0.11170593 -0.00020397 -0.00062598 -0.00020397
#MB08+W4+O3Add6 = 300
MB_001         -100.78965443 -15.47522029 -13.98430862 -1.54997041 -1.63959324 1.00353488 -0.01782995 -0.07844449 -0.57765304 -0.07844449 -0.00021616 -0.00064333 -0.00021616
MB_002         -433.84598724 -39.05671541 -35.73684805 -3.43655753 -3.12192427 1.86046121 -0.03731335 -0.14927901 -0.93459386 -0.14413871 -0.00058952 -0.00177558 -0.00062107
MB_003         -128.44242548 -22.38081688 -20.10289464 -2.36126635 -2.37854978 1.46631838 -0.03128534 -0.13144878 -0.81321327 -0.11253373 -0.00136832 -0.00301003 -0.00097344
MB_004         -385.82012854 -29.78102951 -27.26157014 -2.50749937 -2.28343348 1.38025044 -0.01928719 -0.07646585 -0.58921881 -0.07646585 -0.00059883 -0.00174259 -0.00059883
MB_005         -492.90138597 -38.63783644 -35.36465482 -3.29708787 -2.92530409 1.76607902 -0.02417739 -0.12218169 -0.79157615 -0.12205101 -0.00050472 -0.00137489 -0.00048006
MB_006         -305.26273971 -32.80034026 -29.75704454 -3.08036146 -2.84714157 1.73099647 -0.03324259 -0.11445131 -0.76281408 -0.10225080 -0.00118307 -0.00250401 -0.00071599
MB_007         -270.23504752 -22.66086461 -20.69156241 -1.95902390 -1.80001433 1.10681472 -0.01451438 -0.05257280 -0.41507385 -0.03887272 -0.00045919 -0.00099553 -0.00016685
MB_008         -72.16311315 -13.80487537 -12.36762650 -1.48793498 -1.58554298 0.99235265 -0.02373229 -0.06900633 -0.55333422 -0.06900633 -0.00064786 -0.00195298 -0.00064786
MB_009         -346.81426564 -36.14090881 -32.87282686 -3.34872493 -3.05939701 1.85077935 -0.03532725 -0.12807508 -0.83796420 -0.11731807 -0.00116143 -0.00281341 -0.00075407
MB_010         -282.32951324 -32.05314046 -29.20588164 -3.02453140 -2.82417085 1.69717562 -0.03876279 -0.13077448 -0.86961015 -0.13077448 -0.00030415 -0.00093911 -0.00030415
MB_011         -13.49216135 -5.03600966 -4.42280475 -0.60786016 -0.76561216 0.51502962 -0.00672526 -0.01900708 -0.24104684 -0.00411925 -0.00045195 -0.00075414 -0.00009853
MB_012         -22.42381034 -6.22033602 -5.51189392 -0.69885366 -0.87478991 0.56705811 -0.00913952 -0.02075428 -0.28207666 -0.02075428 -0.00022228 -0.00070146 -0.00022228
MB_013         -331.42357308 -27.35911248 -24.95294483 -2.39777314 -2.15619066 1.32612837 -0.01708079 -0.07393892 -0.53014739 -0.05245816 -0.00074127 -0.00169620 -0.00036841
MB_014         -79.14925636 -13.50872587 -12.11125289 -1.45119790 -1.49846655 0.95716888 -0.01779141 -0.06044069 -0.48753413 -0.05119205 -0.00063818 -0.00104609 -0.00012931
MB_015         -79.96198630 -13.02060533 -11.69426362 -1.36151717 -1.43557669 0.90007523 -0.01572237 -0.05371054 -0.48799482 -0.05371054 -0.00021108 -0.00071655 -0.00021108
MB_016         -27.82330380 -7.77406654 -6.85732592 -0.89667512 -1.04320787 0.67954686 -0.01023481 -0.02221591 -0.31615646 -0.02221591 -0.00027220 -0.00086098 -0.00027220
MB_017         -817.60421480 -56.94448073 -52.36058758 -4.59741114 -3.89763223 2.31549048 -0.03101072 -0.15198306 -0.97054907 -0.15198306 -0.00109404 -0.00305790 -0.00109404
MB_018         -453.60870486 -38.35059277 -35.08534430 -3.27387137 -2.89015709 1.73094597 -0.02202391 -0.08270536 -0.61712384 -0.08270536 -0.00074232 -0.00242839 -0.00074232
MB_019         -523.64984617 -44.26541880 -40.48038900 -3.78648589 -3.34392622 1.99663307 -0.02750950 -0.12165720 -0.74747031 -0.10323968 -0.00114201 -0.00279874 -0.00084695
MB_020         -117.03272152 -17.52342880 -15.77463502 -1.79652666 -1.81525661 1.12726001 -0.02327216 -0.07305840 -0.58990408 -0.07305840 -0.00026057 -0.00080042 -0.00026057
MB_021         -539.92581668 -49.29233445 -45.03382212 -4.36528137 -3.95890397 2.35178314 -0.04474179 -0.19702839 -1.19768253 -0.19702839 -0.00125097 -0.00328319 -0.00125097
MB_022         -386.17048049 -32.85349649 -30.10683479 -2.81816668 -2.57896514 1.54035971 -0.02950741 -0.11849807 -0.73903158 -0.10910761 -0.00056013 -0.00149236 -0.00043657
MB_023         -33.20814094 -9.19338429 -8.06134153 -1.11265292 -1.19678035 0.79350962 -0.01121653 -0.01651552 -0.34225952 -0.01651552 -0.00031914 -0.00118913 -0.00031914
MB_024         -406.37055129 -33.41950922 -30.52577673 -2.87621852 -2.63705812 1.58807794 -0.02286278 -0.09764255 -0.69331903 -0.09764255 -0.00087910 -0.00238006 -0.00087910
MB_025         -421.82475480 -33.58279890 -30.76909174 -2.85456635 -2.57144207 1.54441763 -0.02864719 -0.11411672 -0.70392364 -0.09317094 -0.00049353 -0.00145085 -0.00048744
MB_026         -117.68913262 -18.70503571 -16.86527251 -1.92511748 -1.96804923 1.20580391 -0.02687378 -0.09475308 -0.69819437 -0.09475308 -0.00052828 -0.00150088 -0.00052828
MB_027         -302.69582107 -27.50974457 -25.10654072 -2.42636313 -2.26077854 1.36535203 -0.02215378 -0.08177314 -0.61153636 -0.08177314 -0.00063025 -0.00199054 -0.00063025
MB_028         -178.06067340 -23.83462959 -21.63765412 -2.33218101 -2.29860889 1.39071264 -0.03291564 -0.12293337 -0.80125853 -0.12275774 -0.00032406 -0.00093094 -0.00033969
MB_029         -373.28876678 -40.84347156 -37.20173904 -3.78819190 -3.47561113 2.07549686 -0.04167092 -0.16597294 -1.01380724 -0.15174329 -0.00050761 -0.00130494 -0.00038613
MB_030         -61.12142976 -11.38417090 -10.19684371 -1.22112729 -1.32038039 0.83514434 -0.01561409 -0.05225929 -0.44513416 -0.04683922 -0.00031153 -0.00083634 -0.00021849
MB_031         -111.67735548 -15.95548472 -14.38015680 -1.62761904 -1.64004785 1.02111328 -0.02236400 -0.06517595 -0.54214644 -0.06517595 -0.00016399 -0.00054095 -0.00016399
MB_032         -618.71724562 -57.70171462 -52.68570647 -5.13917661 -4.53941379 2.70447318 -0.04964193 -0.19789113 -1.23281893 -0.19789113 -0.00154750 -0.00442637 -0.00154750
MB_033         -543.44629241 -43.15515770 -39.51910543 -3.69037312 -3.25830443 1.95009112 -0.03174966 -0.13753004 -0.90498219 -0.13753004 -0.00037924 -0.00110276 -0.00037924
MB_034         -128.90031708 -18.67525412 -16.84967783 -1.91025415 -1.89702206 1.17797324 -0.03521414 -0.08513849 -0.62849867 -0.07530666 -0.00028570 -0.00099433 -0.00029582
MB_035         -243.63264876 -28.25427060 -25.54242179 -2.73123429 -2.55936933 1.57103735 -0.02360080 -0.07816735 -0.64311346 -0.07816735 -0.00072274 -0.00224317 -0.00072274
MB_036         -187.30960504 -22.68481538 -20.48668716 -2.22223846 -2.10791016 1.30919332 -0.01825386 -0.06646965 -0.48956465 -0.04302058 -0.00043162 -0.00111870 -0.00023704
MB_037         -486.01279951 -43.16887631 -39.44612243 -3.76929266 -3.32545099 1.99318957 -0.02976964 -0.12174537 -0.78170347 -0.11214408 -0.00117821 -0.00309297 -0.00088267
MB_038         -160.01857993 -24.14006718 -21.84292420 -2.42713398 -2.43268691 1.47408326 -0.03871709 -0.13978002 -0.87443014 -0.12803678 -0.00078091 -0.00169459 -0.00051201
MB_039         -804.54421718 -60.61213551 -55.62218595 -5.00364646 -4.33174616 2.55976442 -0.04261000 -0.19340415 -1.08688928 -0.17293617 -0.00140332 -0.00360234 -0.00133565
MB_040         -557.61017007 -48.74316261 -44.45840409 -4.37159143 -3.90948223 2.35447370 -0.04306404 -0.17590302 -1.16913831 -0.17590302 -0.00136177 -0.00393178 -0.00136177
MB_041         -721.77437222 -62.12483420 -56.97486788 -5.32358127 -4.63968624 2.73111372 -0.05399043 -0.21278553 -1.27856024 -0.21278553 -0.00107467 -0.00346806 -0.00107467
MB_042         -117.03437747 -17.52393962 -15.77288631 -1.79868106 -1.81501731 1.12760344 -0.02347224 -0.07261372 -0.58883154 -0.07261372 -0.00025221 -0.00078306 -0.00025221
MB_043         -1061.90275786 -77.26590173 -71.06285346 -6.23466852 -5.28792657 3.09764274 -0.04495766 -0.21970616 -1.27210092 -0.21970616 -0.00151787 -0.00402287 -0.00151787
MB_044         -225.43503696 -20.46527866 -18.64397823 -1.81227784 -1.70550015 1.04780343 -0.01480681 -0.03759561 -0.38937572 -0.03759561 -0.00025388 -0.00095729 -0.00025388
MB_045         -170.02819006 -19.96632476 -18.06486358 -1.90361724 -1.85826474 1.14415479 -0.01468327 -0.04608369 -0.41942617 -0.04608369 -0.00030174 -0.00093927 -0.00030174
MB_046         -450.03635851 -42.35739241 -38.60528342 -3.77625391 -3.39218396 2.03767782 -0.02724765 -0.11471809 -0.77614312 -0.11471809 -0.00172255 -0.00486178 -0.00172255
MB_047         -325.17897229 -26.41142587 -24.14393835 -2.27042720 -2.08370347 1.27137420 -0.01972451 -0.06395005 -0.52521725 -0.06395005 -0.00055450 -0.00183580 -0.00055450
MB_048         -324.36214504 -33.23318758 -30.28679910 -3.03192954 -2.81390528 1.68629032 -0.03218900 -0.11933318 -0.80745169 -0.11933318 -0.00054657 -0.00181822 -0.00054657
MB_049         -385.83158904 -29.79108816 -27.26794627 -2.51272220 -2.28380107 1.38203732 -0.01899876 -0.07858976 -0.59073160 -0.07858976 -0.00063342 -0.00183313 -0.00063342
MB_050         -657.20442933 -47.66889670 -43.78732416 -3.87349909 -3.32431028 1.97647911 -0.02441617 -0.11085658 -0.75483823 -0.11085658 -0.00056242 -0.00171935 -0.00056242
MB_051         -144.09392580 -20.07328103 -18.16350094 -2.04090616 -2.01023455 1.23899460 -0.03394929 -0.09748574 -0.73115146 -0.09748574 -0.00025774 -0.00082479 -0.00025774
MB_052         -427.19944822 -35.76603417 -32.70018428 -3.09400901 -2.82795613 1.69554983 -0.02773364 -0.12172890 -0.79204201 -0.12172890 -0.00097472 -0.00262965 -0.00097472
MB_053         -121.33923003 -18.96641745 -17.10936291 -1.94307286 -1.98034391 1.21374510 -0.02842293 -0.09802004 -0.70201376 -0.09802004 -0.00041545 -0.00116186 -0.00041545
MB_054         -72.80030688 -13.77007640 -12.29353895 -1.49597065 -1.57096165 0.99124729 -0.01817279 -0.05300178 -0.53101016 -0.05300178 -0.00059979 -0.00261871 -0.00059979
MB_055         -1078.54307792 -80.06867101 -73.60559133 -6.53608960 -5.50738272 3.23346116 -0.04628029 -0.22842305 -1.33420227 -0.22842305 -0.00087615 -0.00238553 -0.00087615
MB_056         -96.48790090 -13.89339390 -12.52677154 -1.43384369 -1.46348799 0.92235910 -0.02291200 -0.05931742 -0.50338357 -0.05931742 -0.00011797 -0.00041762 -0.00011797
MB_057         -170.02886809 -19.96591813 -18.06363111 -1.90516880 -1.85794105 1.14436082 -0.01459218 -0.04601393 -0.41976492 -0.04601393 -0.00028806 -0.00091161 -0.00028806
MB_058         -102.48373273 -16.73155053 -15.09922543 -1.71901212 -1.80087786 1.10617785 -0.02538731 -0.08976233 -0.65172137 -0.08976233 -0.00039499 -0.00114142 -0.00039499
MB_059         -433.67996037 -29.81818379 -27.40241843 -2.41236522 -2.13981802 1.29477782 -0.01339978 -0.07311697 -0.54513497 -0.07311697 -0.00025524 -0.00080239 -0.00025524
MB_060         -159.27273075 -22.33250366 -20.22325012 -2.18899807 -2.20448796 1.33098960 -0.02895447 -0.10996193 -0.75248454 -0.10996193 -0.00033659 -0.00093361 -0.00033659
MB_061         -385.84655709 -29.78437786 -27.25107577 -2.52490842 -2.28110667 1.38481581 -0.01845628 -0.07673300 -0.58799093 -0.07673300 -0.00058732 -0.00173091 -0.00058732
MB_062         -149.50975408 -16.27358458 -14.75250724 -1.54401997 -1.49782554 0.93723942 -0.01261097 -0.02566470 -0.32235781 -0.02566470 -0.00011940 -0.00071158 -0.00011940
MB_063         -870.37765860 -70.58556372 -64.73560790 -5.94357422 -5.05774162 2.98370740 -0.04546496 -0.19439531 -1.18955329 -0.19439531 -0.00109191 -0.00408403 -0.00109191
MB_064         -350.33666351 -33.85397434 -30.89614254 -3.01218335 -2.81907576 1.67992255 -0.02944096 -0.12338660 -0.81055360 -0.12338660 -0.00078548 -0.00220289 -0.00078548
MB_065         -251.66615314 -26.28730672 -23.93434976 -2.42007875 -2.26586321 1.37313523 -0.02319132 -0.08308214 -0.61162951 -0.08308214 -0.00023492 -0.00082273 -0.00023492
MB_066         -273.08749987 -26.72123619 -24.36968273 -2.39276355 -2.25634240 1.35868887 -0.02102713 -0.08206023 -0.60637920 -0.08206023 -0.00057895 -0.00211412 -0.00057895
MB_067         -293.61547011 -30.41380255 -27.65668123 -2.78334759 -2.61299814 1.57304211 -0.02783497 -0.09801592 -0.70045356 -0.09801592 -0.00059813 -0.00171718 -0.00059813
MB_068         -70.09071323 -12.55977451 -11.26336356 -1.31962588 -1.42723117 0.88998042 -0.01656022 -0.05595442 -0.47876412 -0.05595442 -0.00028289 -0.00082897 -0.00028289
MB_069         -138.72895414 -18.69145828 -16.97107617 -1.81886443 -1.85234875 1.12502098 -0.02241209 -0.09583017 -0.66256260 -0.09583017 -0.00017385 -0.00053173 -0.00017385
MB_070         -135.14409953 -19.68466053 -17.76256271 -1.99153265 -1.99746603 1.22652443 -0.02684501 -0.08732028 -0.67633190 -0.08732028 -0.00033854 -0.00101545 -0.00033854
MB_071         -324.36274656 -33.23292797 -30.28511304 -3.03421132 -2.81350771 1.68686884 -0.03210999 -0.11892796 -0.80655166 -0.11892796 -0.00051577 -0.00175714 -0.00051577
MB_072         -484.32373620 -44.22886904 -40.43345163 -3.90021723 -3.45080870 2.06154106 -0.03665156 -0.13245939 -0.86598989 -0.13245939 -0.00059373 -0.00188380 -0.00059373
MB_073         -66.48544969 -13.50737583 -12.06555015 -1.46153254 -1.57371279 0.98446528 -0.02064950 -0.06428945 -0.52426991 -0.06428945 -0.00079006 -0.00218608 -0.00079006
MB_074         -328.37454448 -33.68787126 -30.55160437 -3.15952201 -2.91896373 1.78412655 -0.02855755 -0.11482896 -0.79775169 -0.11482896 -0.00244000 -0.00686039 -0.00244000
MB_075         -237.61562910 -31.29210220 -28.46159995 -3.05553187 -2.95050500 1.76742912 -0.04867455 -0.17439532 -1.10236445 -0.17439532 -0.00048168 -0.00132837 -0.00048168
MB_076         -27.81967403 -7.77054942 -6.85227272 -0.89967636 -1.04263631 0.68030666 -0.01057478 -0.02176530 -0.31570455 -0.02176530 -0.00026529 -0.00085757 -0.00026529
MB_077         -206.88578842 -28.47318056 -25.82411648 -2.81278835 -2.74604650 1.65329013 -0.03783351 -0.15496869 -0.99162120 -0.15496869 -0.00053469 -0.00143636 -0.00053469
MB_078         -303.55572856 -30.82625405 -28.04438889 -2.83694092 -2.61523127 1.58330680 -0.02622242 -0.09570535 -0.71472718 -0.09570535 -0.00055671 -0.00198428 -0.00055671
MB_079         -91.10974000 -12.34725963 -11.17124958 -1.23752768 -1.29280200 0.81097034 -0.01448424 -0.05325762 -0.45536814 -0.05325762 -0.00007526 -0.00030123 -0.00007526
MB_080         -71.89377201 -15.07296036 -13.41817705 -1.65650955 -1.74264811 1.09727156 -0.01887151 -0.06402457 -0.55082160 -0.06402457 -0.00080097 -0.00220760 -0.00080097
MB_081         -325.18742799 -26.43248933 -24.15512484 -2.27687230 -2.08420847 1.27371817 -0.01752266 -0.06606179 -0.52479936 -0.06606179 -0.00062183 -0.00199076 -0.00062183
MB_082         -114.43297508 -18.66222226 -16.84446374 -1.89075778 -1.97824127 1.20071978 -0.02564513 -0.10028430 -0.70955254 -0.10028430 -0.00052359 -0.00143381 -0.00052359
MB_083         -193.77400397 -28.38864908 -25.67652919 -2.86978220 -2.80104694 1.70211620 -0.05416384 -0.15563415 -0.99231721 -0.15346376 -0.00075066 -0.00204070 -0.00078403
MB_084         -66.78488585 -12.46482190 -11.19450129 -1.27618152 -1.43323769 0.88144821 -0.01526857 -0.05927974 -0.48152804 -0.05927974 -0.00033067 -0.00092941 -0.00033067
MB_085         -133.33563307 -20.14246571 -18.14312120 -2.09647381 -2.05532871 1.27381905 -0.02553726 -0.11013184 -0.72277300 -0.08805061 -0.00033435 -0.00080999 -0.00023587
MB_086         -22.42383621 -6.22045561 -5.51187429 -0.69875172 -0.87482191 0.56704501 -0.00916056 -0.02073234 -0.28202890 -0.02073234 -0.00022287 -0.00070283 -0.00022287
MB_087         -461.74816556 -44.52086878 -40.61058109 -3.98170181 -3.57957899 2.13786144 -0.03598294 -0.14163733 -0.89700042 -0.14163733 -0.00202272 -0.00588928 -0.00202272
MB_088         -519.10261392 -48.06766707 -43.96905348 -4.25685673 -3.92891492 2.32196202 -0.04749780 -0.21789754 -1.28148666 -0.21789754 -0.00172683 -0.00443945 -0.00172683
MB_089         -134.98518526 -22.14550186 -19.96869070 -2.27251624 -2.31963411 1.40923872 -0.03106416 -0.12633772 -0.83593817 -0.12633772 -0.00089967 -0.00230597 -0.00089967
MB_090         -34.31071122 -7.52946146 -6.71382701 -0.81406452 -0.95214683 0.61878013 -0.00910522 -0.02926991 -0.30594457 -0.02907795 -0.00016585 -0.00048977 -0.00013947
MB_091         -187.75424769 -26.80987872 -24.28086958 -2.68691038 -2.63034005 1.59033895 -0.04456659 -0.15138763 -0.94082508 -0.13353800 -0.00058666 -0.00144749 -0.00049581
MB_092         -217.68124180 -23.23456156 -21.10187996 -2.15021533 -2.05469861 1.25178369 -0.01703051 -0.06216429 -0.50843680 -0.06216429 -0.00034224 -0.00118347 -0.00034224
MB_093         -635.73182729 -51.33241786 -47.07176134 -4.29192443 -3.76196355 2.22233525 -0.03639032 -0.15598318 -0.93802866 -0.14454416 -0.00099803 -0.00258316 -0.00086288
MB_094         -473.05599281 -40.11557267 -36.74115825 -3.45307907 -3.13577445 1.86474341 -0.03163009 -0.15511512 -0.91293195 -0.14049823 -0.00067578 -0.00179247 -0.00064323
MB_095         -600.44397583 -55.11196096 -50.35366136 -4.86318524 -4.33974955 2.57415858 -0.04341716 -0.19723644 -1.17731762 -0.19723644 -0.00191424 -0.00500051 -0.00191424
MB_096         -384.66058325 -34.71200536 -31.72580237 -3.01934702 -2.82677149 1.68119277 -0.02721690 -0.12639772 -0.81012790 -0.12639772 -0.00099171 -0.00269348 -0.00099171
MB_097         -439.06247703 -37.08947983 -33.92986444 -3.18654580 -2.92611368 1.74409655 -0.02940986 -0.13783814 -0.81408375 -0.11684892 -0.00090924 -0.00229994 -0.00078346
MB_098         -440.65327023 -35.24223973 -32.32998652 -2.97390267 -2.69150478 1.60559973 -0.02377778 -0.11823544 -0.77151731 -0.11823544 -0.00042540 -0.00126024 -0.00042540
MB_099         -100.76667020 -15.44755694 -13.96165392 -1.55003483 -1.63833405 1.00283997 -0.01997262 -0.07753613 -0.58206752 -0.07753613 -0.00023424 -0.00069792 -0.00023424
MB_100         -87.32890379 -15.90558470 -14.27121709 -1.67370548 -1.76822031 1.09066553 -0.02742863 -0.07692951 -0.59080662 -0.07692951 -0.00063474 -0.00176436 -0.00063474
MB_101         -68.29461752 -10.52595065 -9.49836904 -1.08085032 -1.15876169 0.73887007 -0.01282378 -0.04988764 -0.40852575 -0.04976509 -0.00010255 -0.00033875 -0.00008725
MB_102         -284.09274456 -31.09153395 -28.29488731 -2.88450010 -2.70611257 1.62776956 -0.03129633 -0.11437746 -0.74809454 -0.10565514 -0.00050310 -0.00148261 -0.00045548
MB_103         -180.83185515 -26.48869862 -24.00667533 -2.63238952 -2.62530880 1.57753634 -0.04324767 -0.16149042 -0.94334753 -0.13906183 -0.00078341 -0.00185427 -0.00062702
MB_104         -340.50131166 -33.87049581 -30.81606839 -3.09696372 -2.86868017 1.73524687 -0.03288248 -0.12130551 -0.79090924 -0.11046235 -0.00119981 -0.00310563 -0.00103328
MB_105         -114.41254235 -18.69262848 -16.88066409 -1.88215466 -1.98046411 1.19942491 -0.02510283 -0.10177432 -0.70449726 -0.10177432 -0.00052990 -0.00149895 -0.00052990
MB_106         -473.81509676 -44.34980863 -40.56709833 -3.92201008 -3.59185851 2.12793615 -0.04684028 -0.18164892 -1.11797886 -0.18164892 -0.00107287 -0.00333261 -0.00107287
MB_107         -129.55593624 -20.09338460 -18.17804966 -2.00660186 -2.07751643 1.25508977 -0.02884608 -0.11469043 -0.73483885 -0.10601026 -0.00047804 -0.00127997 -0.00049876
MB_108         -772.10138922 -60.72430448 -55.79288570 -5.03410186 -4.43273890 2.59802508 -0.04780644 -0.21602783 -1.24557253 -0.21602783 -0.00196802 -0.00520809 -0.00196802
MB_109         -97.10934222 -15.23995267 -13.78277720 -1.53015849 -1.63368068 0.99753218 -0.01884419 -0.08114136 -0.59552459 -0.08114136 -0.00027502 -0.00078843 -0.00027502
MB_110         -282.56192317 -32.82242803 -29.76098752 -3.13433351 -2.93967343 1.77698615 -0.02988113 -0.12017600 -0.82828532 -0.12017600 -0.00083388 -0.00229887 -0.00083388
MB_111         -146.83230654 -23.45024892 -21.17822188 -2.38090869 -2.41455598 1.46230408 -0.03391149 -0.14330196 -0.86367596 -0.12431687 -0.00080919 -0.00195767 -0.00070183
MB_112         -483.52597825 -47.23219799 -43.14975806 -4.25985113 -3.91926525 2.32160838 -0.05730160 -0.21481187 -1.28118494 -0.21481187 -0.00178778 -0.00464701 -0.00178778
MB_113         -322.01232757 -37.41962748 -33.97459115 -3.57810274 -3.32225882 2.00660371 -0.04126568 -0.15046521 -0.98550399 -0.15046521 -0.00085509 -0.00256572 -0.00085509
MB_114         -305.52349806 -31.54809215 -28.73006050 -2.89375921 -2.69569053 1.62317815 -0.02840512 -0.12098732 -0.75283618 -0.10064731 -0.00103341 -0.00245676 -0.00055762
MB_115         -148.40413530 -21.59073040 -19.59905947 -2.15876619 -2.18263122 1.32152687 -0.03687615 -0.12814382 -0.85150409 -0.12814382 -0.00049336 -0.00157329 -0.00049336
MB_116         -698.92652004 -60.44363335 -55.39621905 -5.18618601 -4.51554136 2.66883544 -0.05051678 -0.20646174 -1.21875346 -0.20599855 -0.00092215 -0.00254023 -0.00086182
MB_117         -156.01072096 -22.06367885 -19.97798247 -2.19176539 -2.19158014 1.33061314 -0.03039974 -0.11017798 -0.77216334 -0.11017798 -0.00037003 -0.00108715 -0.00037003
MB_118         -358.29607793 -36.14824527 -33.02031755 -3.31108645 -3.02323119 1.81028368 -0.04415242 -0.14990149 -0.98218963 -0.14990149 -0.00048748 -0.00151711 -0.00048748
MB_119         -475.42195401 -42.57180701 -38.96823233 -3.72936069 -3.34062440 1.99120960 -0.03385317 -0.16773735 -0.98702275 -0.14885931 -0.00056351 -0.00130080 -0.00031009
MB_120         -379.58550467 -28.79385282 -26.37756088 -2.42662365 -2.18723229 1.33277293 -0.01831805 -0.07784595 -0.55429472 -0.07035921 -0.00061723 -0.00179952 -0.00054249
MB_121         -290.34316736 -30.20322074 -27.46347670 -2.77213369 -2.60525043 1.56927111 -0.02632106 -0.09754494 -0.70826234 -0.09754494 -0.00066127 -0.00196408 -0.00066127
MB_122         -753.46384286 -65.66423345 -60.19493669 -5.63985762 -4.98493013 2.92461856 -0.05970855 -0.25454325 -1.45250674 -0.25454325 -0.00165413 -0.00442171 -0.00165413
MB_123         -81.90964125 -13.82216661 -12.46972220 -1.39532157 -1.51643326 0.93253442 -0.01949099 -0.07218566 -0.52408897 -0.07080461 -0.00034968 -0.00092416 -0.00030423
MB_124         -653.05036074 -54.54683159 -49.97673457 -4.66220483 -4.09145631 2.42639994 -0.04086067 -0.19896092 -1.10671745 -0.17825783 -0.00250635 -0.00605856 -0.00211359
MB_125         -843.82744775 -60.85304186 -55.91789061 -4.97661428 -4.26290785 2.52612188 -0.03872997 -0.18150368 -1.10537357 -0.18150368 -0.00123142 -0.00334868 -0.00123142
MB_126         -121.30023003 -19.02728178 -17.15958826 -1.92693168 -1.98545834 1.20998060 -0.02603473 -0.09282229 -0.67400682 -0.09282229 -0.00043042 -0.00117501 -0.00043042
MB_127         -302.69601724 -27.51025245 -25.10629361 -2.42677663 -2.26068285 1.36543411 -0.02204479 -0.08163391 -0.61109969 -0.08163391 -0.00062664 -0.00198046 -0.00062664
MB_128         -535.58518090 -45.46206753 -41.59973157 -3.91048586 -3.44440524 2.05410482 -0.02933941 -0.12658202 -0.84131893 -0.12658202 -0.00101488 -0.00305632 -0.00101488
MB_129         -230.60801307 -34.55990885 -31.28963579 -3.51047375 -3.40895648 2.05067763 -0.05442189 -0.21250537 -1.29818970 -0.21250537 -0.00161549 -0.00474073 -0.00161549
MB_130         -707.41536688 -57.05645376 -52.34752510 -4.76865995 -4.22190534 2.48193893 -0.03980306 -0.19312827 -1.13109059 -0.19312827 -0.00192132 -0.00500082 -0.00192132
MB_131         -384.69671432 -34.67794778 -31.67804459 -3.03633121 -2.82129677 1.68313720 -0.02814790 -0.12079732 -0.80564831 -0.12079732 -0.00087022 -0.00245466 -0.00087022
MB_132         -176.53798014 -25.64834147 -23.17083593 -2.57523788 -2.53712907 1.54067696 -0.02941770 -0.12833221 -0.86084623 -0.12833221 -0.00058632 -0.00155998 -0.00058632
MB_133         -408.88797618 -34.71370116 -31.82086270 -2.95826664 -2.69941705 1.60665990 -0.02982246 -0.11388512 -0.76227773 -0.11388512 -0.00040182 -0.00131968 -0.00040182
MB_134         -397.96859710 -40.03620459 -36.53705609 -3.62533655 -3.36394552 1.99879379 -0.04347145 -0.16725426 -1.04213997 -0.16725426 -0.00115816 -0.00310085 -0.00115816
MB_135         -846.76234934 -64.71886152 -59.48834835 -5.33447314 -4.65046277 2.72466377 -0.04655569 -0.22255376 -1.29698564 -0.22255376 -0.00119771 -0.00319639 -0.00119771
MB_136         -121.33900923 -18.96695014 -17.11080747 -1.94132287 -1.98062476 1.21317361 -0.02851322 -0.09827647 -0.70240286 -0.09827647 -0.00042791 -0.00118646 -0.00042791
MB_137         -302.68622573 -27.62398593 -25.20317948 -2.41042279 -2.27111791 1.36391086 -0.02094405 -0.07806697 -0.58324709 -0.07806697 -0.00049597 -0.00146636 -0.00049597
MB_138         -197.10600071 -22.61467419 -20.54923080 -2.13680388 -2.05908163 1.25461099 -0.02459438 -0.07414027 -0.54982545 -0.07414027 -0.00026555 -0.00094033 -0.00026555
MB_139         -114.43126873 -18.54767902 -16.73227865 -1.90870619 -1.96773218 1.20201417 -0.03542575 -0.09996177 -0.71517039 -0.09996177 -0.00058060 -0.00169937 -0.00058060
MB_140         -121.33418925 -18.96104709 -17.09756251 -1.94152165 -1.97789831 1.21193670 -0.02433159 -0.09539231 -0.68539739 -0.09539231 -0.00045209 -0.00130725 -0.00045209
MB_141         -406.53569359 -32.21604041 -29.56441852 -2.68186183 -2.48924635 1.47952828 -0.02314907 -0.10483385 -0.69685023 -0.10483385 -0.00069833 -0.00199880 -0.00069833
MB_142         -505.54389549 -44.87701364 -41.06753930 -3.93623811 -3.58310719 2.12637385 -0.03940304 -0.18210503 -1.11032780 -0.18210503 -0.00089866 -0.00247170 -0.00089866
MB_143         -114.40264699 -18.64062147 -16.81913643 -1.89108991 -1.97596541 1.19999884 -0.02675057 -0.09803640 -0.70053739 -0.09803640 -0.00052659 -0.00142374 -0.00052659
MB_144         -975.12610430 -70.01358386 -64.39429440 -5.62197013 -4.72397315 2.77883764 -0.03595899 -0.17641074 -1.06403267 -0.17641074 -0.00118048 -0.00334231 -0.00118048
MB_145         -425.73762745 -41.75708371 -38.06039580 -3.76772706 -3.51553014 2.09603454 -0.03685097 -0.18358903 -1.06583398 -0.18358903 -0.00223070 -0.00560656 -0.00223070
MB_146         -437.95735514 -43.83455059 -39.94399784 -3.96212694 -3.58084845 2.13952598 -0.03380333 -0.12917832 -0.86553735 -0.12917832 -0.00110141 -0.00364314 -0.00110141
MB_147         -391.88841913 -37.18636500 -33.96317823 -3.32106386 -3.02874667 1.81029666 -0.03822847 -0.13050100 -0.88425965 -0.13050100 -0.00060964 -0.00190096 -0.00060964
MB_148         -727.96535236 -60.55900778 -55.47252276 -5.16737933 -4.56224063 2.69309918 -0.04801702 -0.21310906 -1.25348963 -0.21310906 -0.00237181 -0.00616277 -0.00237181
MB_149         -454.20061944 -38.46830190 -35.25450503 -3.29628544 -3.03862666 1.80039797 -0.03662704 -0.14803830 -0.91862273 -0.14803830 -0.00087404 -0.00244367 -0.00087404
MB_150         -337.99487882 -36.44944222 -33.19116807 -3.35350288 -3.15652309 1.88119203 -0.03502005 -0.14831020 -0.93964980 -0.14831020 -0.00119458 -0.00335971 -0.00119458
MB_151         -114.42510077 -18.57850903 -16.76733225 -1.90632964 -1.97115149 1.20480405 -0.02464784 -0.10337728 -0.73071262 -0.10337728 -0.00052105 -0.00143075 -0.00052105
MB_152         -148.43174721 -21.68853887 -19.65101868 -2.15950686 -2.18665259 1.32171898 -0.02768321 -0.11953736 -0.80606948 -0.11953736 -0.00038121 -0.00106986 -0.00038121
MB_153         -1200.22177380 -85.07330472 -78.31306584 -6.80662333 -5.71870383 3.34318765 -0.04664111 -0.24654753 -1.41563324 -0.24654753 -0.00100924 -0.00269847 -0.00100924
MB_154         -456.72869072 -46.86057999 -42.77415449 -4.26009311 -3.92873897 2.32870090 -0.05472294 -0.20903378 -1.25349928 -0.20903378 -0.00160649 -0.00443686 -0.00160649
MB_155         -519.34225608 -49.35072558 -45.01740271 -4.42278942 -3.93993385 2.35752077 -0.03895454 -0.15966614 -1.02119130 -0.15966614 -0.00238497 -0.00714872 -0.00238497
MB_156         -970.37304300 -69.83696009 -64.24753379 -5.60106230 -4.71710559 2.77110086 -0.03684575 -0.17602697 -1.07645499 -0.17602697 -0.00145112 -0.00421872 -0.00145112
MB_157         -131.62850800 -21.98294761 -19.84647425 -2.24056568 -2.31792145 1.40224573 -0.03059930 -0.13385673 -0.85443010 -0.13385673 -0.00112125 -0.00306693 -0.00112125
MB_158         -401.57463944 -40.21453487 -36.70998108 -3.63228832 -3.36854971 2.00133259 -0.04187522 -0.16699693 -1.04644194 -0.16699693 -0.00115943 -0.00329584 -0.00115943
MB_159         -569.56005763 -48.57620325 -44.48605451 -4.15710886 -3.66068714 2.16982639 -0.03480461 -0.13812928 -0.90713298 -0.13812928 -0.00065272 -0.00205554 -0.00065272
MB_160         -1183.33104088 -79.33530829 -73.12743581 -6.21742554 -5.15727660 3.02304082 -0.03660736 -0.20686497 -1.21771861 -0.20686497 -0.00101455 -0.00288266 -0.00101455
MB_161         -528.92223119 -42.30588301 -38.79112588 -3.61832520 -3.23997085 1.92974660 -0.03399621 -0.15362924 -0.97598341 -0.15362924 -0.00059107 -0.00161769 -0.00059107
MB_162         -302.69623860 -27.50983281 -25.10581302 -2.42723664 -2.26059376 1.36549063 -0.02207684 -0.08163251 -0.61115658 -0.08163251 -0.00062447 -0.00197617 -0.00062447
MB_163         -505.50049149 -44.94980132 -41.14654759 -3.91396944 -3.59371005 2.12355681 -0.04121659 -0.18261646 -1.10601842 -0.18261646 -0.00096614 -0.00252948 -0.00096614
MB_164         -148.43363461 -21.68360585 -19.64402751 -2.16421560 -2.18616237 1.32301222 -0.03197530 -0.11952413 -0.80651927 -0.11952413 -0.00037930 -0.00106190 -0.00037930
MB_165         -171.05081880 -26.57164117 -24.01247770 -2.70406277 -2.69579213 1.63408852 -0.03774666 -0.15075042 -0.97307610 -0.15075042 -0.00100204 -0.00282183 -0.00100204
MB_166_h       -0.47854038 -0.65404621 -0.56418915 -0.08925839 -0.13005111 0.09190989 -0.00094773 0.00000000 -0.04524967 0.00000000 0.00000000 -0.00003846 0.00000000
MB_167_li      -5.85387563 -2.13081680 -1.84617443 -0.28374213 -0.29076347 0.20203393 -0.00303557 -0.00035924 -0.07875118 -0.00035924 -0.00000270 -0.00022417 -0.00000270
MB_168_be      -12.34056912 -3.42850300 -2.98510503 -0.42991901 -0.44263310 0.29746474 -0.00371462 -0.00211460 -0.12548201 -0.00211460 -0.00003647 -0.00027021 -0.00003647
MB_169_b       -21.49030573 -4.90604299 -4.32499443 -0.56484071 -0.60706623 0.39310880 -0.00555676 -0.01029569 -0.17217147 -0.01029569 -0.00007845 -0.00031106 -0.00007845
MB_170_c       -33.64167493 -6.56683878 -5.88331202 -0.68534903 -0.78168975 0.48734216 -0.00770774 -0.02893458 -0.26012489 -0.02893458 -0.00011761 -0.00037932 -0.00011761
MB_171_n       -95.88793429 -13.08797406 -11.86020899 -1.33495824 -1.21989230 0.73609685 -0.01470107 -0.07983762 -0.48873841 -0.07983762 -0.00014354 -0.00039704 -0.00014354
MB_172_o       -133.37607283 -16.28918034 -14.84900539 -1.59815779 -1.42377299 0.85247369 -0.01932463 -0.08925181 -0.52474057 -0.12770380 -0.00006339 -0.00026808 -0.00018231
MB_173_f       -178.85941152 -19.89079706 -18.18640070 -1.88971504 -1.65970695 0.98444095 -0.02185359 -0.10058915 -0.64459556 -0.10058915 -0.00004810 -0.00021137 -0.00004810
MB_174_na      -148.08234052 -14.30383963 -13.04590029 -1.28689111 -1.10473384 0.66320519 -0.00941390 -0.02422364 -0.18462867 -0.02422364 -0.00001816 -0.00041974 -0.00001816
MB_175_mg      -184.05619975 -16.67640291 -15.21417456 -1.47131428 -1.27084523 0.76535673 -0.00869041 -0.02772108 -0.23451005 -0.02772108 -0.00006543 -0.00048882 -0.00006543
MB_176_al      -224.48642551 -19.15038581 -17.49585116 -1.65083172 -1.44203250 0.86787776 -0.01201169 -0.03500806 -0.29453028 -0.03500806 -0.00013691 -0.00064020 -0.00013691
MB_177_si      -269.53627418 -21.71639592 -19.88115556 -1.81972431 -1.61848407 0.96937420 -0.01388899 -0.04566731 -0.36034172 -0.04566731 -0.00024194 -0.00084110 -0.00024194
MB_178_p       -636.32302859 -45.15034125 -41.60122358 -3.60758740 -2.91145404 1.69628773 -0.02233165 -0.13666575 -0.71013300 -0.13666575 -0.00134157 -0.00386487 -0.00134157
MB_179_s       -745.09643638 -49.98241282 -46.11788433 -3.91080483 -3.12671947 1.81971952 -0.02297386 -0.14485383 -0.72061400 -0.14546525 -0.00071504 -0.00234478 -0.00119628
MB_180_cl      -863.98201043 -55.00226434 -50.80522902 -4.22347680 -3.36481165 1.95091022 -0.02252998 -0.14499640 -0.78951560 -0.14499640 -0.00049759 -0.00149068 -0.00049759
W4_alcl3       -1519.80416777 -100.89255350 -93.04548273 -7.84050195 -6.30929190 3.65825364 -0.04225779 -0.26275604 -1.39242754 -0.26275604 -0.00112937 -0.00293958 -0.00112937
W4_alcl        -655.84441078 -45.65355725 -42.03458714 -3.63582180 -2.92437557 1.70531001 -0.01994631 -0.11196241 -0.62395829 -0.11196241 -0.00050871 -0.00174108 -0.00050871
W4_al          -223.81220233 -18.05986558 -16.54040228 -1.53413542 -1.22376574 0.72843050 -0.00748978 -0.03651945 -0.21817384 -0.03120722 -0.00025723 -0.00090466 -0.00001088
W4_alf3        -492.13270723 -48.46393775 -44.32324969 -4.34460132 -3.76515431 2.21269217 -0.05063015 -0.19855212 -1.13010887 -0.19855212 -0.00018418 -0.00049123 -0.00018418
W4_alf         -313.26657477 -28.20188973 -25.81769250 -2.46651090 -2.07783398 1.22243764 -0.02272958 -0.09051056 -0.53490858 -0.09051056 -0.00015763 -0.00084557 -0.00015763
W4_alh3        -224.47905470 -19.15819762 -17.50276627 -1.65102748 -1.44259359 0.86802904 -0.01194387 -0.03503622 -0.29434697 -0.03503622 -0.00013572 -0.00062947 -0.00013572
W4_alh         -224.04178555 -18.41295385 -16.85307649 -1.57351779 -1.30200857 0.77572264 -0.00913412 -0.03429698 -0.25698637 -0.03429698 -0.00011567 -0.00096407 -0.00011567
W4_b2          -41.55962495 -7.52099412 -6.69676164 -0.88534353 -0.78057719 0.50923437 -0.01240400 -0.08372083 -0.29193287 -0.00851464 -0.00133344 -0.00314759 -0.00009439
W4_b2h6        -42.95427940 -9.87129120 -8.76932472 -1.07478904 -1.22752385 0.77532781 -0.01324742 -0.03542256 -0.37463234 -0.03542256 -0.00036866 -0.00105557 -0.00036866
W4_b           -20.77065702 -3.75899023 -3.29358822 -0.46309383 -0.38252202 0.25651717 -0.00275112 -0.00785727 -0.08986694 -0.00037998 -0.00006146 -0.00027807 -0.00000047
W4_be2         -23.79334368 -5.33401697 -4.66241464 -0.67893474 -0.60307472 0.40581164 -0.00697746 -0.00610049 -0.20081234 -0.00610049 -0.00028908 -0.00335873 -0.00028908
W4_becl2       -875.91525296 -57.90940358 -53.34454260 -4.55593941 -3.68676302 2.15730861 -0.02454975 -0.15346735 -0.85512178 -0.15346735 -0.00057366 -0.00156127 -0.00057366
W4_be          -11.90783560 -2.66311783 -2.31274307 -0.34543359 -0.29852585 0.20321243 -0.00165509 -0.00049614 -0.09124156 -0.00049614 -0.00000157 -0.00069048 -0.00000157
W4_bef2        -190.78277824 -22.98188141 -20.89032062 -2.22085209 -1.99275302 1.19306630 -0.02975504 -0.11141869 -0.68027225 -0.11141869 -0.00008145 -0.00023286 -0.00008145
W4_bf2h        -199.93660080 -24.41328326 -22.19126085 -2.34208334 -2.15198412 1.28408946 -0.03224597 -0.11788850 -0.72182895 -0.11788850 -0.00014195 -0.00038811 -0.00014195
W4_bf3         -289.14371605 -34.17936061 -31.12974262 -3.23062005 -2.92474293 1.73002606 -0.04249275 -0.16968597 -0.98979747 -0.16968597 -0.00016557 -0.00042567 -0.00016557
W4_bf          -110.28548136 -13.86730946 -12.55523563 -1.38383912 -1.23485501 0.74800809 -0.01867078 -0.06280873 -0.41106209 -0.06280873 -0.00009802 -0.00038025 -0.00009802
W4_bh3         -21.48150724 -4.91513198 -4.33310076 -0.56519325 -0.60767284 0.39330090 -0.00550973 -0.01032196 -0.17199174 -0.01032196 -0.00007746 -0.00030515 -0.00007746
W4_bh          -21.00563207 -4.12137923 -3.61961479 -0.49977498 -0.46224278 0.30386282 -0.00413751 -0.00488947 -0.13346581 -0.00488947 -0.00004086 -0.00034965 -0.00004086
W4_bn_S        -68.65700578 -10.23528750 -9.26509957 -1.10817286 -1.00944927 0.62224652 -0.02766226 -0.08833413 -0.55188285 -0.08833413 -0.00044972 -0.00192142 -0.00044972
W4_bn_T        -68.63100291 -10.37148518 -9.31404233 -1.12088488 -0.99118333 0.62324877 -0.01710178 -0.07267635 -0.32751629 -0.02960078 -0.00029337 -0.00061709 -0.00010174
W4_c2          -65.35782342 -10.03008002 -9.07315633 -1.09790187 -1.00245185 0.61921821 -0.01859389 -0.08747950 -0.58786674 -0.08747950 -0.00053047 -0.00230095 -0.00053047
W4_c2h2        -65.87277710 -10.96849868 -9.87023436 -1.15076707 -1.15162426 0.70649879 -0.01314071 -0.06077687 -0.42308667 -0.06077687 -0.00029245 -0.00085196 -0.00029245
W4_c2h4        -66.32552939 -11.72962661 -10.54356286 -1.21463290 -1.29308943 0.79416420 -0.01441909 -0.05753873 -0.44745067 -0.05753873 -0.00030384 -0.00090856 -0.00030384
W4_c2h6        -66.76332557 -12.48742470 -11.21456902 -1.27657526 -1.43460330 0.88184518 -0.01511245 -0.05924591 -0.48030389 -0.05924591 -0.00032547 -0.00091147 -0.00032547
W4_c2h         -65.56738701 -10.59212964 -9.52333244 -1.12532524 -1.06594305 0.66219988 -0.01307814 -0.06474415 -0.37846063 -0.04975822 -0.00027997 -0.00075795 -0.00022603
W4_ccl2        -896.67773073 -60.10494855 -55.41686049 -4.75181419 -3.87285767 2.25688631 -0.03890317 -0.18179252 -0.98659927 -0.18179252 -0.00089684 -0.00240567 -0.00089684
W4_c           -32.62998700 -5.05933306 -4.47982805 -0.57977203 -0.47036693 0.31109395 -0.00386902 -0.02099099 -0.10747598 -0.00041432 -0.00005586 -0.00012722 -0.00000017
W4_cf2         -211.57545335 -25.17120220 -22.93296723 -2.40855909 -2.17466980 1.29019507 -0.03914742 -0.13034775 -0.77539938 -0.13034775 -0.00016454 -0.00044347 -0.00016454
W4_cf          -122.11411986 -15.10452800 -13.70048088 -1.49704924 -1.32610796 0.80121568 -0.02296016 -0.07452648 -0.44848853 -0.06862308 -0.00010084 -0.00027173 -0.00008095
W4_ch2c        -65.85834213 -10.92541795 -9.80953159 -1.16117456 -1.14710480 0.70729173 -0.01555075 -0.05161658 -0.39878432 -0.05161658 -0.00027417 -0.00079834 -0.00027417
W4_ch2ch       -66.05859397 -11.34727263 -10.19417850 -1.18801290 -1.21172744 0.74949962 -0.01486210 -0.06242512 -0.40491865 -0.04721161 -0.00031999 -0.00083736 -0.00024648
W4_ch2         -33.08356587 -5.84983788 -5.21566479 -0.63383388 -0.61431250 0.40000017 -0.00553325 -0.03878406 -0.15965120 -0.00407183 -0.00012966 -0.00019060 -0.00001378
W4_ch2nh2      -81.43869596 -13.18295948 -11.89614889 -1.33123893 -1.39233224 0.84946721 -0.01698843 -0.07493533 -0.47451739 -0.06132326 -0.00027604 -0.00070248 -0.00023047
W4_ch2nh       -81.27217515 -12.78719076 -11.54813710 -1.30283349 -1.32786555 0.80791007 -0.01657387 -0.06842854 -0.48517626 -0.06842854 -0.00024684 -0.00073063 -0.00024684
W4_ch2o        -99.85265175 -14.05186799 -12.73504556 -1.40710838 -1.36730828 0.82630875 -0.02016826 -0.07623451 -0.50688658 -0.07623451 -0.00017130 -0.00051295 -0.00017130
W4_ch3         -33.36286099 -6.21088000 -5.54839399 -0.66265721 -0.70153762 0.44375859 -0.00642193 -0.03489359 -0.21206680 -0.01293878 -0.00012844 -0.00027399 -0.00004812
W4_ch3nh2      -81.68912930 -13.55702884 -12.23229125 -1.36085460 -1.46991564 0.89452319 -0.01654525 -0.06985162 -0.51310373 -0.06985162 -0.00027171 -0.00077097 -0.00027171
W4_ch3nh       -81.45334179 -13.16704303 -11.86227718 -1.34239150 -1.38914742 0.85094378 -0.01809540 -0.07260154 -0.46326485 -0.05350629 -0.00025335 -0.00069455 -0.00023385
W4_ch4         -33.62926794 -6.57981081 -5.89482560 -0.68564346 -0.78247604 0.48758855 -0.00762657 -0.02893353 -0.25945342 -0.02893353 -0.00011582 -0.00037172 -0.00011582
W4_ch          -32.87106750 -5.40704573 -4.79957088 -0.61498821 -0.55455898 0.35734464 -0.00540043 -0.01966674 -0.15869735 -0.00542475 -0.00006416 -0.00019830 -0.00001934
W4_cl2         -863.98020327 -55.00440225 -50.80714805 -4.22323627 -3.36495006 1.95090016 -0.02251263 -0.14502299 -0.78917601 -0.14502299 -0.00049700 -0.00148437 -0.00049700
W4_cl2o        -930.60782142 -63.15117243 -58.26507882 -5.00547357 -4.08762884 2.37448504 -0.03829068 -0.19881382 -1.09911684 -0.19881382 -0.00064743 -0.00182590 -0.00064743
W4_clcn        -512.59931521 -39.21534977 -36.01464245 -3.30270239 -2.80576294 1.65009474 -0.02852527 -0.14907542 -0.83980473 -0.14907542 -0.00055019 -0.00151508 -0.00055019
W4_cl          -431.97346091 -27.50574987 -25.36578497 -2.13517786 -1.66977141 0.97819484 -0.00940420 -0.07396464 -0.35769476 -0.05336776 -0.00013982 -0.00032438 -0.00007450
W4_clf         -521.39076971 -37.50515614 -34.54699284 -3.05340949 -2.51539607 1.46774012 -0.02477018 -0.12287326 -0.70333261 -0.12287326 -0.00019642 -0.00060974 -0.00019642
W4_clo         -498.62731264 -35.65762072 -32.83752264 -2.91470544 -2.39639341 1.40246523 -0.02651684 -0.12145890 -0.66481659 -0.12321991 -0.00023148 -0.00080460 -0.00034101
W4_cloo        -565.35818127 -43.72812169 -40.23286511 -3.70494186 -3.10702064 1.82583059 -0.05424156 -0.16314816 -0.96276999 -0.20632255 -0.00037179 -0.00154722 -0.00057865
W4_cn          -80.60456917 -11.60169549 -10.49453395 -1.21841095 -1.10429296 0.67644934 -0.02041019 -0.07574758 -0.46363295 -0.08019305 -0.00020300 -0.00074550 -0.00026538
W4_co2         -166.11978054 -21.57372001 -19.63605550 -2.11653572 -1.95627920 1.16440640 -0.03498032 -0.13239272 -0.75540312 -0.13239272 -0.00024905 -0.00071897 -0.00024905
W4_co          -99.47776448 -13.29636763 -12.04495365 -1.34768791 -1.22423884 0.73911613 -0.01778034 -0.07419533 -0.46158608 -0.07419533 -0.00012962 -0.00035691 -0.00012962
W4_cs2         -777.81995195 -55.12791401 -50.79053566 -4.43093048 -3.64985228 2.12822484 -0.03452027 -0.18343750 -0.96576390 -0.18343750 -0.00148305 -0.00431167 -0.00148305
W4_cs          -405.28748192 -30.05311473 -27.61100644 -2.50521442 -2.07050788 1.22112379 -0.02108579 -0.10275095 -0.58198833 -0.10275095 -0.00055374 -0.00155832 -0.00055374
W4_f2          -178.84884129 -19.90436189 -18.19716080 -1.88830680 -1.66032005 0.98435708 -0.02163730 -0.10016322 -0.63821291 -0.10016322 -0.00004731 -0.00020065 -0.00004731
W4_f2o         -245.52249219 -28.02614124 -25.63627595 -2.67020767 -2.38136498 1.40778734 -0.04145266 -0.15441669 -0.94200627 -0.15441669 -0.00014366 -0.00047606 -0.00014366
W4_f           -89.40469922 -10.00383122 -9.06794731 -0.97267189 -0.81688217 0.49552011 -0.00835083 -0.04781624 -0.23773898 -0.02367318 -0.00000922 -0.00002498 -0.00000574
W4_fo2         -222.72524579 -26.16666922 -23.95434063 -2.52942868 -2.26330983 1.34265218 -0.06922736 -0.15288901 -0.95108216 -0.20645663 -0.00016470 -0.00075074 -0.00045485
W4_foof        -312.23220152 -36.07104461 -33.05835338 -3.45189196 -3.10124747 1.83126128 -0.06662902 -0.22664366 -1.33814240 -0.22664366 -0.00034053 -0.00117427 -0.00034053
W4_h2cn        -81.04504816 -12.40603654 -11.18862209 -1.28148121 -1.24776656 0.76371852 -0.01750879 -0.07091835 -0.43622489 -0.05554369 -0.00022117 -0.00063692 -0.00021551
W4_h2          -0.48819358 -0.64285771 -0.55506915 -0.08809030 -0.12933328 0.09146324 -0.00099130 0.00000000 -0.04583909 0.00000000 0.00000000 -0.00004200 0.00000000
W4_h2o2        -133.78081372 -17.05097357 -15.54044206 -1.65507074 -1.57887705 0.94197785 -0.02086192 -0.09595625 -0.61098536 -0.09595625 -0.00012217 -0.00039785 -0.00012217
W4_h2o         -67.13551878 -8.92298000 -8.11052821 -0.86849377 -0.85808187 0.51745037 -0.00962955 -0.04859498 -0.31420975 -0.04859498 -0.00004351 -0.00014928 -0.00004351
W4_h2s         -373.01574561 -25.69186060 -23.66678038 -2.02876676 -1.70265572 0.99996935 -0.01152061 -0.06703906 -0.40438301 -0.06703906 -0.00024518 -0.00076971 -0.00024518
W4_hcl         -432.24000506 -27.86197816 -25.70992785 -2.15262401 -1.74868428 1.02103819 -0.01018743 -0.07209556 -0.40685897 -0.07209556 -0.00016155 -0.00048732 -0.00016155
W4_hcn         -80.87061897 -12.02946813 -10.87023057 -1.24375275 -1.18622762 0.72144345 -0.01494602 -0.07144643 -0.46102942 -0.07144643 -0.00021229 -0.00060792 -0.00021229
W4_hco         -99.62611004 -13.65792078 -12.38164683 -1.37712627 -1.28882624 0.78039281 -0.02013195 -0.07617753 -0.47586265 -0.07862036 -0.00016022 -0.00045775 -0.00015884
W4_h           -0.19104055 -0.30856519 -0.26510153 -0.04167383 -0.03982214 0.03982214 -0.00041033 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
W4_hf          -89.66918505 -10.39272963 -9.47581023 -0.98113843 -0.90108549 0.53861394 -0.01047173 -0.05160866 -0.31537515 -0.05160866 -0.00001774 -0.00006162 -0.00001774
W4_hno         -114.79157680 -15.03805908 -13.67964065 -1.49515781 -1.39834176 0.83900179 -0.02018901 -0.08740645 -0.55947996 -0.08740645 -0.00014321 -0.00043405 -0.00014321
W4_hocl        -498.86604625 -36.04564234 -33.19086458 -2.93760395 -2.47305065 1.44634632 -0.02230921 -0.12133569 -0.70019194 -0.12133569 -0.00027293 -0.00082339 -0.00027293
W4_hof         -156.31910441 -18.48242311 -16.87208439 -1.77244509 -1.61971774 0.96331786 -0.02236855 -0.09797444 -0.62166277 -0.09797444 -0.00007896 -0.00028598 -0.00007896
W4_hoo         -133.55658266 -16.66722411 -15.18526151 -1.63010250 -1.50141749 0.89762667 -0.02438468 -0.09273165 -0.56465842 -0.09788911 -0.00009136 -0.00033644 -0.00014263
W4_hs          -372.76001697 -25.33860915 -23.33326440 -2.00714789 -1.62425498 0.95669273 -0.01044832 -0.07090464 -0.35838519 -0.05104564 -0.00024793 -0.00058256 -0.00012055
W4_n2          -95.88267432 -13.09428796 -11.86539548 -1.33482602 -1.22016377 0.73615024 -0.01461988 -0.07941528 -0.48675685 -0.07941528 -0.00014190 -0.00039194 -0.00014190
W4_n2h2        -96.21849477 -13.81274997 -12.52495229 -1.39076115 -1.36086732 0.82118756 -0.01736002 -0.07875517 -0.52784684 -0.07875517 -0.00019841 -0.00059052 -0.00019841
W4_n2h4        -96.61193239 -14.60682925 -13.23434206 -1.44470242 -1.50426304 0.90688035 -0.01755139 -0.08043410 -0.54781585 -0.08043410 -0.00022851 -0.00065084 -0.00022851
W4_n2h         -96.01126372 -13.44385002 -12.18675818 -1.36387871 -1.28394686 0.77638733 -0.01837174 -0.07965191 -0.48786811 -0.07803872 -0.00017686 -0.00051680 -0.00018595
W4_n2o         -162.47340994 -21.25953594 -19.38554050 -2.09932909 -1.94712682 1.15905285 -0.03626085 -0.14722960 -0.82248542 -0.14722960 -0.00040023 -0.00120001 -0.00040023
W4_nccn        -161.25094567 -23.37794827 -21.17430949 -2.39347473 -2.24281229 1.35011805 -0.03271718 -0.14997368 -0.89620627 -0.14997368 -0.00062601 -0.00183718 -0.00062601
W4_n           -47.81680801 -6.58297761 -5.88865523 -0.69440979 -0.56034516 0.36782304 -0.00459921 -0.04476842 -0.11848211 -0.00043869 -0.00003966 -0.00006319 -0.00000007
W4_nh2         -48.31280688 -7.27103404 -6.54489203 -0.75287916 -0.73599916 0.45700353 -0.00766664 -0.04369495 -0.23838988 -0.01939712 -0.00007095 -0.00019322 -0.00003681
W4_nh3         -48.56204357 -7.65447790 -6.91797943 -0.76810917 -0.81816664 0.50001009 -0.00845466 -0.04055233 -0.29310210 -0.04055233 -0.00008122 -0.00027017 -0.00008122
W4_nh          -48.06466913 -6.91397791 -6.20152881 -0.72940782 -0.64990158 0.41301403 -0.00647633 -0.04512801 -0.17902415 -0.00598186 -0.00005632 -0.00012204 -0.00001027
W4_no2         -181.24024078 -22.85252043 -20.86854926 -2.23415852 -2.05026164 1.21767983 -0.03808920 -0.14594205 -0.85126090 -0.16634657 -0.00025430 -0.00091912 -0.00038577
W4_no          -114.59057745 -14.69937221 -13.35972984 -1.46768100 -1.32294587 0.79467715 -0.01888102 -0.08296852 -0.50852748 -0.09004799 -0.00010036 -0.00031512 -0.00012805
W4_o2          -133.36407937 -16.30415958 -14.86085601 -1.59727381 -1.42441505 0.85253117 -0.01908218 -0.08907568 -0.52018604 -0.12441609 -0.00006281 -0.00025868 -0.00017265
W4_o3          -200.03584886 -24.29078492 -22.25173164 -2.37195252 -2.15641602 1.27826577 -0.03782837 -0.17718608 -1.02481859 -0.17718608 -0.00036297 -0.00126917 -0.00036297
W4_oclo        -565.19680390 -43.86131547 -40.39620441 -3.67637640 -3.12853329 1.82537856 -0.04367015 -0.18383661 -1.01539307 -0.21222450 -0.00040009 -0.00141499 -0.00068090
W4_o           -66.62738367 -8.18491413 -7.36763881 -0.83697391 -0.68781490 0.43027670 -0.00644920 -0.04625977 -0.17826774 -0.00731857 -0.00001833 -0.00003987 -0.00000507
W4_ocs         -471.97765238 -38.34532861 -35.20684709 -3.27429836 -2.80250892 1.64622888 -0.03527071 -0.15701997 -0.85888275 -0.15701997 -0.00070656 -0.00202624 -0.00070656
W4_of          -156.08762688 -18.09274032 -16.50191212 -1.75145363 -1.53987458 0.91910587 -0.03050026 -0.09445460 -0.57047231 -0.09737681 -0.00005699 -0.00022950 -0.00008795
W4_oh          -66.88231868 -8.53727370 -7.72173572 -0.85715350 -0.77498245 0.47450218 -0.00845581 -0.04839612 -0.24773167 -0.02333654 -0.00003032 -0.00008848 -0.00001824
W4_P2          -636.31426664 -45.16082579 -41.60986843 -3.60717480 -2.91206260 1.69637198 -0.02219573 -0.13594544 -0.70657124 -0.13594544 -0.00130103 -0.00373732 -0.00130103
W4_P4          -1272.52299072 -90.49507645 -83.42881444 -7.14168708 -5.84919509 3.38394281 -0.04549510 -0.28617639 -1.39469544 -0.28617639 -0.00412782 -0.01058261 -0.00412782
W4_P           -318.09429730 -22.61644971 -20.78885783 -1.82597090 -1.41720142 0.84960607 -0.00780014 -0.07844456 -0.26513021 -0.03407460 -0.00041656 -0.00043810 -0.00000313
W4_Ph3         -318.83461402 -23.64589945 -21.72753645 -1.91743972 -1.65936423 0.98255124 -0.01300462 -0.05871507 -0.39038164 -0.05871507 -0.00029341 -0.00097691 -0.00029341
W4_s2          -745.08958427 -49.99069974 -46.12488638 -3.91028744 -3.12718176 1.81974939 -0.02287692 -0.14497363 -0.71928072 -0.14425352 -0.00071370 -0.00230290 -0.00115207
W4_s2o         -811.72462270 -58.19453093 -53.66324887 -4.68118380 -3.86655481 2.24613646 -0.04227007 -0.20743690 -1.09009798 -0.20743690 -0.00118147 -0.00336011 -0.00118147
W4_s3          -1117.60712503 -74.97078484 -69.23143121 -5.83854202 -4.71204524 2.72844511 -0.03940828 -0.22787011 -1.18069804 -0.22787011 -0.00215690 -0.00636870 -0.00215690
W4_s4          -1490.14835654 -99.94266520 -92.32793964 -7.76664491 -6.28596840 3.63381780 -0.05032587 -0.32046435 -1.61668122 -0.32046435 -0.00424435 -0.01184936 -0.00424435
W4_s           -372.50414341 -24.99855722 -23.01402283 -1.98209582 -1.54315505 0.91298766 -0.00890184 -0.07367719 -0.31283821 -0.04026823 -0.00023443 -0.00040280 -0.00004384
W4_si2h6       -538.56158350 -42.79441404 -39.22588215 -3.54225355 -3.10954100 1.84615403 -0.02673904 -0.09624252 -0.68487095 -0.09624252 -0.00074838 -0.00223509 -0.00074838
W4_si          -268.57594626 -20.27367093 -18.60087071 -1.68047428 -1.31961685 0.78836034 -0.00810827 -0.05083182 -0.24340148 -0.03276624 -0.00039858 -0.00063393 -0.00000562
W4_sif         -358.04254078 -30.36767906 -27.83891222 -2.61088227 -2.17363377 1.28046108 -0.02529086 -0.10026400 -0.56490967 -0.09492804 -0.00027711 -0.00073431 -0.00013129
W4_sih4        -269.51638361 -21.73730306 -19.89959746 -1.82029925 -1.61988289 0.96977797 -0.01374976 -0.04574190 -0.35977802 -0.04574190 -0.00023699 -0.00081424 -0.00023699
W4_sih         -268.81623952 -20.61479490 -18.90544875 -1.71722492 -1.39986540 0.83412627 -0.00990412 -0.04740276 -0.28348236 -0.03629940 -0.00031072 -0.00080068 -0.00006853
W4_sio         -335.32557464 -28.50588494 -26.14682844 -2.46330871 -2.07037069 1.21710978 -0.02780956 -0.10669731 -0.60041947 -0.10669731 -0.00034096 -0.00098171 -0.00034096
W4_so2         -505.84850876 -41.43740829 -38.10329390 -3.52356464 -3.02126443 1.76393878 -0.04138013 -0.18323903 -0.98559562 -0.18323903 -0.00047446 -0.00127364 -0.00047446
W4_so3         -572.43267202 -49.70704930 -45.66727323 -4.29465474 -3.75188211 2.18899237 -0.05843724 -0.23673408 -1.26848188 -0.23673408 -0.00057385 -0.00156347 -0.00057385    
W4_so          -439.19959578 -33.19538837 -30.53787813 -2.75542235 -2.27825556 1.33690065 -0.02361619 -0.11868047 -0.62744905 -0.13041051 -0.00027990 -0.00084871 -0.00038792   
W4_ssh         -745.29818721 -50.35452000 -46.44572614 -3.93990758 -3.20229925 1.86429144 -0.02521086 -0.14188237 -0.74672880 -0.13468297 -0.00075244 -0.00224455 -0.00086685
O3_c2h2        -65.86621108 -10.97586390 -9.87654146 -1.15068096 -1.15200401 0.70658140 -0.01305370 -0.06044187 -0.42127877 -0.06044187 -0.00028810 -0.00083755 -0.00028810     
O3_c2h4        -66.32022578 -11.73531740 -10.54873613 -1.21442342 -1.29341218 0.79420398 -0.01436389 -0.05743848 -0.44646053 -0.05743848 -0.00030184 -0.00089997 -0.00030184
O3_o3_c2h2_add -265.75695265 -35.55952430 -32.37889844 -3.46421390 -3.33109345 1.97375523 -0.05410583 -0.21316331 -1.28907031 -0.21316331 -0.00082310 -0.00211769 -0.00082310
O3_o3_c2h2_ts  -265.81606860 -35.32834379 -32.22525016 -3.48396882 -3.31858144 1.97543432 -0.04989794 -0.24218171 -1.40776303 -0.24218171 -0.00118581 -0.00305889 -0.00118581
O3_o3_c2h2_vdw -265.84586216 -35.33341074 -32.18743638 -3.50987714 -3.31254675 1.98250173 -0.05091766 -0.23331513 -1.41068210 -0.23331513 -0.00090988 -0.00252256 -0.00090988
O3_o3_c2h4_add -266.20122084 -36.32249061 -33.04333992 -3.52849385 -3.47198757 2.06122648 -0.05402165 -0.21131269 -1.31090160 -0.21131269 -0.00080876 -0.00202077 -0.00080876
O3_o3_c2h4_ts  -266.27584629 -36.09059380 -32.89531041 -3.55088717 -3.45968951 2.06371094 -0.05068431 -0.24008388 -1.43735928 -0.24008388 -0.00122803 -0.00321793 -0.00122803
O3_o3_c2h4_vdw -266.29933116 -36.09048055 -32.86207397 -3.57167549 -3.45440605 2.06949344 -0.05343309 -0.23153780 -1.43718846 -0.23153780 -0.00096718 -0.00267135 -0.00096718
O3_o3          -199.97973575 -24.35964255 -22.30527143 -2.36689959 -2.15931906 1.27826902 -0.03607767 -0.17054740 -0.98663878 -0.17054740 -0.00032531 -0.00111313 -0.00032531   
