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
# For rsXYG3 and the fitting sets do not includes ADIM6
#   Normal version
#8.96834867E-01 -4.05821607E-02  4.66663441E-01 -3.69485918E-02  3.87234202E-01 3.70365920E-01
#   LDA version
#7.85062656E-01  5.23259075E-01  3.06465103E-01  4.20228491E+00
# For XYG3 without Non-Bonding sets
#   Normal version
#   LDA version
# For rsXYG3 and including ADIM6 in the fitting sets
#   Normal version
#8.46422651E-01 -1.64949413E-02  4.93384111E-01 -2.60319787E-02  3.52611772E-01 1.82056489E+00
#   LDA version
# For XYG3 and the fitting sets do not includes ADIM6
#   Normal version
#8.64066615E-01 -1.28752264E-02  4.86961406E-01 -3.44495130E-02  3.68505848E-01
#   LDA version
#8.72569320E-01  4.50154102E-01  4.05994141E-01
# For XYG3 and including ADIM6 in the fitting sets
#   Normal version
#8.97478325E-01 -3.83586543E-02  4.66430784E-01 -4.01641825E-02  3.88843580E-01
#   LDA version
#8.75253841E-01  4.31124241E-01  4.20233767E-01
# For XYG3 without Non-Bonding sets
#   Normal version
#7.01136916E-01  9.23448978E-02  5.77171494E-01  2.33140674E-02  2.68078467E-01
#   LDA version
#7.64362815E-01  5.27797771E-01  2.92789569E-01
  7.85190730E-01  5.20373238E-01  3.08529744E-01  4.10804918E+00








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

__optimization function__ :: 32
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a1, a4, a8, a11 = C
    a2  = 1. - a1
    a3  = 0.
    a5  = 0.
    a6  = 0.
    #a8  = 1. - a4
    a7  = a8
    a9  = a8
    #a11 = 0.
    a10 = a11
    a12 = a11

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
__energy__ :: 358 1.0
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
 3         S22_1  -1   01a_S22    1                            S22_01a    1                           0.00505171  100.0
 3         S22_2  -1   02a_S22    1                            S22_02a    1                           0.00799987  100.0
 3         S22_3  -1   03a_S22    1                            S22_03a    1                           0.02995968  100.0
 3         S22_4  -1   04a_S22    1                            S22_04a    1                           0.02568883  100.0
 3         S22_5  -1   05a_S22    1                            S22_05a    1                           0.03297159  100.0
 5         S22_6  -1   06a_S22    0.5      06b_S22  0.5        S22_06a    0.5      S22_06b  0.5       0.02709120  100.0
 5         S22_7  -1   07a_S22    0.5      07b_S22  0.5        S22_07a    0.5      S22_07b  0.5       0.02667687  100.0
 3         S22_8  -1   08a_S22    1                            S22_08a    1                           0.00084461  100.0
 3         S22_9  -1   09a_S22    1                            S22_09a    1                           0.00239040  100.0
 5         S22_10 -1   10a_S22    0.5      10b_S22  0.5        S22_10a    0.5      S22_10b  0.5       0.00231072  100.0
 3         S22_11 -1   11a_S22    1                            S22_11a    1                           0.00417523  100.0
 3         S22_12 -1   12a_S22    1                            S22_12a    1                           0.00669312  100.0
 3         S22_13 -1   13a_S22    1                            S22_13a    1                           0.01552166  100.0
 5         S22_14 -1   14a_S22    0.5      14b_S22  0.5        S22_14a    0.5      S22_14b  0.5       0.00731462  100.0
 5         S22_15 -1   15a_S22    0.5      15b_S22  0.5        S22_15a    0.5      S22_15b  0.5       0.01858138  100.0
 5         S22_16 -1   16a_S22    0.5      16b_S22  0.5        S22_16a    0.5      S22_16b  0.5       0.00240634  100.0
 5         S22_17 -1   17a_S22    0.5      17b_S22  0.5        S22_17a    0.5      S22_17b  0.5       0.00524294  100.0
 5         S22_18 -1   18a_S22    0.5      18b_S22  0.5        S22_18a    0.5      S22_18b  0.5       0.00369715  100.0
 5         S22_19 -1   19a_S22    0.5      19b_S22  0.5        S22_19a    0.5      S22_19b  0.5       0.00725088  100.0
 5         S22_20 -1   20a_S22    0.5      20b_S22  0.5        S22_20a    0.5      S22_20b  0.5       0.00431866  100.0
 5         S22_21 -1   21a_S22    0.5      21b_S22  0.5        S22_21a    0.5      S22_21b  0.5       0.00895603  100.0
 5         S22_22 -1   22a_S22    0.5      22b_S22  0.5        S22_22a    0.5      S22_22b  0.5       0.01129862  100.0
# 6 vDW interactions for ADIM6
 3         AD2    -1   AM2_BSSE   1                        AM2        1                       0.00207168  300.0
 3         AD3    -1   AM3_BSSE   1                        AM3        1                       0.00313939  300.0
 3         AD4    -1   AM4_BSSE   1                        AM4        1                       0.00444614  300.0
 3         AD5    -1   AM5_BSSE   1                        AM5        1                       0.00586445  300.0
 3         AD6    -1   AM6_BSSE   1                        AM6        1                       0.00734650  300.0
 3         AD7    -1   AM7_BSSE   1                        AM7        1                       0.00892416  300.0

#               534 = 17+223+31+15+21+19+52+48+56+34+18 is the total number of jobs in this batch list
__xyg3 components__ ::  534
#        E_noXC  E_K   Ex_LDA   dEx_Becke  Ec_VWN  dEc_LYP  PT2_1ST  aaaa  abab  bbbb aaaa_erf200 abab_erf200 bbbb_erf200
# 17 atoms 
#223 molecule
#        E_noXC     E_K         Ex_LDA       dEx_Becke     Ec_VWN   dEc_LYP      PT2_1ST    aaaa   abab   bbbb  aaaa_erf200 abab_erf200 bbbb_erf200
   H_0 -0.19120627 -0.30821881 -0.26483415 -0.04163629 -0.03979738 0.03979738 -0.00043702 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
  He_0 -1.84240056 -1.01649219 -0.87763046 -0.14148003 -0.14969531 0.10595107 -0.00138221 0.00000000 -0.03749550 0.00000000 0.00000000 -0.00000009 0.00000000
  Li_0 -5.65066623 -1.78065766 -1.53861169 -0.23727194 -0.20630448 0.15246209 -0.00051426 -0.00039780 -0.03620243 0.00000000 -0.00000026 -0.00000029 0.00000000
  Be_0 -11.90161367 -2.66925722 -2.31662729 -0.34548650 -0.29865863 0.20353282 -0.00076928 -0.00056396 -0.09210284 -0.00056396 -0.00000004 -0.00002315 -0.00000004
   B_0 -20.76330091 -3.76523125 -3.29760185 -0.46332109 -0.38254427 0.25664887 -0.00193152 -0.00644491 -0.10892006 -0.00067706 -0.00000156 -0.00000717 -0.00000001
   C_0 -32.62137433 -5.06547531 -4.48380116 -0.58018981 -0.47031187 0.31115067 -0.00308389 -0.02057471 -0.12141320 -0.00072869 -0.00000106 -0.00000277 0.00000000
   N_0 -47.80676342 -6.58844454 -5.89213339 -0.69500165 -0.56021181 0.36781508 -0.00389075 -0.04360432 -0.12975643 -0.00076501 -0.00000062 -0.00000122 0.00000000
   O_0 -66.61492200 -8.18893679 -7.37011649 -0.83765673 -0.68765628 0.43017794 -0.00576307 -0.04538343 -0.18310823 -0.00756734 -0.00000024 -0.00000064 -0.00000008
   F_0 -89.38890704 -10.00641205 -9.06942612 -0.97343212 -0.81668281 0.49540208 -0.00768670 -0.04707123 -0.23597065 -0.02358331 -0.00000011 -0.00000035 -0.00000007
  Ne_0 -116.45861732 -12.06115024 -11.00696824 -1.10336479 -0.94568153 0.56258287 -0.00926285 -0.04864921 -0.28681273 -0.04864921 -0.00000005 -0.00000020 -0.00000005
  Na_0 -147.84526782 -13.99419248 -12.77641625 -1.24324916 -1.02472190 0.61521097 -0.00660157 -0.04411970 -0.22589274 -0.04082458 -0.00000185 -0.00000206 -0.00000005
  Mg_0 -183.62238884 -15.97784045 -14.61034606 -1.38721443 -1.13134065 0.67050079 -0.00596324 -0.04233917 -0.26323356 -0.04233917 -0.00000064 -0.00005002 -0.00000064
  Al_0 -223.79423147 -18.07220490 -16.54923506 -1.53467066 -1.22396862 0.72872604 -0.00653348 -0.04993406 -0.28393330 -0.04459851 -0.00001002 -0.00003262 -0.00000026
  Si_0 -268.56216238 -20.28182616 -18.60597098 -1.68085391 -1.31968335 0.78850779 -0.00722204 -0.06356023 -0.30512838 -0.04568955 -0.00001318 -0.00001975 -0.00000012
   P_0 -318.07908131 -22.62528265 -20.79316984 -1.82692192 -1.41715428 0.84979107 -0.00662228 -0.08359643 -0.32268595 -0.04584095 -0.00001240 -0.00001236 -0.00000006
   S_0 -372.48765905 -25.00763836 -23.01854248 -1.98331700 -1.54305554 0.91316046 -0.00783990 -0.08533035 -0.36775788 -0.05265933 -0.00000642 -0.00001144 -0.00000118
  Cl_0 -431.95286969 -27.51673592 -25.37185042 -2.13691877 -1.66967393 0.97840219 -0.00854831 -0.08667092 -0.41161171 -0.06652895 -0.00000366 -0.00000893 -0.00000196
  G2-1 -5.84909897 -2.13540692 -1.84886324 -0.28369947 -0.29087432 0.20232552 -0.00229286 -0.00032382 -0.07630596 -0.00032382 -0.00000008 -0.00000733 -0.00000008
  G2-2 -12.07377145 -3.07526244 -2.67648382 -0.38832987 -0.35901741 0.25042508 -0.00229991 -0.00331702 -0.08347817 -0.00040586 -0.00000277 -0.00000764 -0.00000002
  G2-3 -32.86605136 -5.40897609 -4.80015351 -0.61514262 -0.55431837 0.35731397 -0.00472440 -0.01927306 -0.16847117 -0.00555180 -0.00000137 -0.00000476 -0.00000046
  G2-4 -33.07798686 -5.85197296 -5.21642633 -0.63391278 -0.61415583 0.40000858 -0.00496391 -0.03777992 -0.16732372 -0.00416208 -0.00000286 -0.00000463 -0.00000037
  G2-5 -33.10991137 -5.77540004 -5.14268108 -0.64082811 -0.63495664 0.40227403 -0.00586783 -0.01671983 -0.21134028 -0.01671983 -0.00000150 -0.00000686 -0.00000150
  G2-6 -33.35835099 -6.21166451 -5.54798819 -0.66256625 -0.70131815 0.44373905 -0.00587607 -0.03406355 -0.21548954 -0.01278876 -0.00000302 -0.00000695 -0.00000128
  G2-7 -33.62574387 -6.57944251 -5.89333679 -0.68555944 -0.78215978 0.48756908 -0.00706424 -0.02824080 -0.25904967 -0.02824080 -0.00000292 -0.00000971 -0.00000292
  G2-8 -48.05739595 -6.91607080 -6.20231600 -0.72980529 -0.64962658 0.41292832 -0.00585127 -0.04397527 -0.18545279 -0.00613274 -0.00000105 -0.00000270 -0.00000023
  G2-9 -48.30764138 -7.27038180 -6.54337619 -0.75322608 -0.73557162 0.45690207 -0.00710585 -0.04262566 -0.24024507 -0.01910508 -0.00000149 -0.00000452 -0.00000083
 G2-10 -48.55672030 -7.65377753 -6.91636403 -0.76849570 -0.81766949 0.49993381 -0.00796861 -0.03961757 -0.29063432 -0.03961757 -0.00000187 -0.00000661 -0.00000187
 G2-11 -66.87265274 -8.53796644 -7.72154892 -0.85780954 -0.77462606 0.47437963 -0.00790262 -0.04747267 -0.24792495 -0.02314409 -0.00000053 -0.00000176 -0.00000034
 G2-12 -67.12730966 -8.92180824 -8.10875993 -0.86921538 -0.85754644 0.51733627 -0.00916964 -0.04774581 -0.31028937 -0.04774581 -0.00000089 -0.00000330 -0.00000089
 G2-13 -89.65572748 -10.39247670 -9.47502115 -0.98200056 -0.90066049 0.53851088 -0.01004323 -0.05079921 -0.30929957 -0.05079921 -0.00000030 -0.00000114 -0.00000030
 G2-14 -269.04070960 -20.97601009 -19.22773027 -1.75104881 -1.47789143 0.87991002 -0.01064247 -0.05599988 -0.37664902 -0.05599988 -0.00000676 -0.00003037 -0.00000676
 G2-15 -268.99761309 -21.01036679 -19.25933123 -1.74723870 -1.45764504 0.87860593 -0.01026323 -0.07070390 -0.34011976 -0.04671928 -0.00001729 -0.00002206 -0.00000142
 G2-16 -269.25389407 -21.37179844 -19.57598722 -1.78444154 -1.54002946 0.92397375 -0.01150716 -0.06456427 -0.37481762 -0.05130692 -0.00001259 -0.00002579 -0.00000384
 G2-17 -269.50615890 -21.74075649 -19.90068919 -1.81999049 -1.61965084 0.96975930 -0.01281160 -0.05826815 -0.40755936 -0.05826815 -0.00000805 -0.00002737 -0.00000805
 G2-18 -318.57711996 -23.29529580 -21.40240993 -1.89073191 -1.58095097 0.93853171 -0.01038207 -0.07524359 -0.39720011 -0.05750302 -0.00001080 -0.00002519 -0.00000409
 G2-19 -318.82530903 -23.64791250 -21.72613862 -1.91784776 -1.65896394 0.98261942 -0.01184570 -0.06952506 -0.43444364 -0.06952506 -0.00000892 -0.00003076 -0.00000892
 G2-20 -373.00470319 -25.69477362 -23.66612018 -2.02959999 -1.70222416 1.00003758 -0.01053521 -0.07859451 -0.44958099 -0.07859451 -0.00000692 -0.00002282 -0.00000692
 G2-21 -432.22280737 -27.86907641 -25.71276677 -2.15416768 -1.74838074 1.02118558 -0.00941322 -0.08460930 -0.45557282 -0.08460930 -0.00000429 -0.00001357 -0.00000429
 G2-22 -11.31019316 -3.55774452 -3.07896345 -0.47081160 -0.44033347 0.30625975 -0.00210800 -0.00056178 -0.11484991 -0.00056178 -0.00000053 -0.00016356 -0.00000053
 G2-23 -95.02802354 -11.93966869 -10.82542593 -1.18544736 -1.07005183 0.65261938 -0.01647913 -0.05627057 -0.35850061 -0.05627057 -0.00000066 -0.00000247 -0.00000066
 G2-24 -65.84749039 -10.98895769 -9.88550414 -1.15136262 -1.15216485 0.70684242 -0.01193066 -0.05950422 -0.43493506 -0.05950422 -0.00000786 -0.00002245 -0.00000786
 G2-25 -66.30878166 -11.74001197 -10.55065151 -1.21466125 -1.29309633 0.79430245 -0.01324651 -0.05638379 -0.45540559 -0.05638379 -0.00000907 -0.00002662 -0.00000907
 G2-26 -66.75553005 -12.48786258 -11.21270763 -1.27665954 -1.43403377 0.88187103 -0.01394934 -0.05790808 -0.48398815 -0.05790808 -0.00001027 -0.00002842 -0.00001027
 G2-27 -80.58330235 -11.61568963 -10.50431881 -1.21919604 -1.10435384 0.67656911 -0.01915908 -0.07470011 -0.47999666 -0.07930469 -0.00000500 -0.00001796 -0.00000606
 G2-28 -80.84660975 -12.04666947 -10.88268948 -1.24440608 -1.18652265 0.72164996 -0.01367449 -0.07023883 -0.47299279 -0.07023883 -0.00000534 -0.00001497 -0.00000534
 G2-29 -99.45580620 -13.30701516 -12.05216369 -1.34867444 -1.22410599 0.73912110 -0.01646431 -0.07344699 -0.47459656 -0.07344699 -0.00000314 -0.00000844 -0.00000314
 G2-30 -99.60619126 -13.66653133 -12.38727170 -1.37781588 -1.28859367 0.78036811 -0.01884032 -0.07503443 -0.48574248 -0.07772462 -0.00000412 -0.00001137 -0.00000387
 G2-31 -99.83193072 -14.06148475 -12.74151878 -1.40748231 -1.36712845 0.82631428 -0.01886917 -0.07502174 -0.51237295 -0.07502174 -0.00000449 -0.00001325 -0.00000449
 G2-32 -100.25109535 -14.82023107 -13.41654610 -1.46465645 -1.50852066 0.91219625 -0.01727460 -0.07535006 -0.53401075 -0.07535006 -0.00000576 -0.00001651 -0.00000576
 G2-33 -95.86237538 -13.10496024 -11.87270147 -1.33571801 -1.21990339 0.73598944 -0.01342959 -0.07845634 -0.49899432 -0.07845634 -0.00000334 -0.00000904 -0.00000334
 G2-34 -96.59874845 -14.60872676 -13.23422685 -1.44541617 -1.50354714 0.90679338 -0.01637763 -0.07875540 -0.54810701 -0.07875540 -0.00000661 -0.00001869 -0.00000661
 G2-35 -114.57439095 -14.70112848 -13.35980934 -1.46907474 -1.32235646 0.79450011 -0.01776669 -0.08207825 -0.51998237 -0.09005807 -0.00000224 -0.00000711 -0.00000295
 G2-36 -133.33691037 -16.31489539 -14.86829461 -1.59862549 -1.42415233 0.85232106 -0.01751470 -0.08746764 -0.52478554 -0.12330681 -0.00000123 -0.00000548 -0.00000377
 G2-37 -133.75576125 -17.05876588 -15.54537175 -1.65638006 -1.57844873 0.94188697 -0.01947727 -0.09419242 -0.60759644 -0.09419242 -0.00000301 -0.00000979 -0.00000301
 G2-38 -178.80767135 -19.92024390 -18.20868346 -1.88953303 -1.66026481 0.98414383 -0.01989864 -0.09817282 -0.62779660 -0.09817282 -0.00000083 -0.00000390 -0.00000083
 G2-39 -166.08702235 -21.58779128 -19.64501813 -2.11802858 -1.95609563 1.16447567 -0.03309339 -0.13093168 -0.76923952 -0.13093168 -0.00000661 -0.00001889 -0.00000661
 G2-40 -295.70227294 -27.97411602 -25.55131850 -2.48051355 -2.07305109 1.22923395 -0.01520160 -0.08607102 -0.49217652 -0.08607102 -0.00000386 -0.00025153 -0.00000386
 G2-41 -537.20429010 -40.52074131 -37.24614491 -3.32682654 -2.67362487 1.57392578 -0.01844946 -0.15389778 -0.70614333 -0.11124826 -0.00010570 -0.00022122 -0.00003711
 G2-42 -636.28235011 -45.18070160 -41.62039882 -3.60857869 -2.91218405 1.69680867 -0.01966960 -0.15421146 -0.81364976 -0.15421146 -0.00004440 -0.00012719 -0.00004440
 G2-43 -745.05189584 -50.01354654 -46.13863802 -3.91186893 -3.12738771 1.82014959 -0.02068378 -0.16807281 -0.82241389 -0.16689357 -0.00002421 -0.00007687 -0.00003513
 G2-44 -863.93012887 -55.03513146 -50.82787785 -4.22541743 -3.36542292 1.95128431 -0.02079289 -0.17017304 -0.89185955 -0.17017304 -0.00001628 -0.00004835 -0.00001628
 G2-45 -579.79172430 -41.62953107 -38.28749747 -3.36134520 -2.73170543 1.59841014 -0.01862363 -0.12994824 -0.68134404 -0.12994824 -0.00000809 -0.00002652 -0.00000809
 G2-46 -335.29609970 -28.52252319 -26.15828431 -2.46415010 -2.07047248 1.21728308 -0.02594465 -0.11878772 -0.66156969 -0.11878772 -0.00001054 -0.00002892 -0.00001054
 G2-47 -405.26373824 -30.06706554 -27.61885521 -2.50653318 -2.07034141 1.22131969 -0.01939635 -0.11435609 -0.64489881 -0.11435609 -0.00001622 -0.00004523 -0.00001622
 G2-48 -439.17812170 -33.19915066 -30.53792327 -2.75765115 -2.27764088 1.33701521 -0.02189761 -0.12967017 -0.68559541 -0.14346036 -0.00000799 -0.00002437 -0.00001063
 G2-49 -498.60339973 -35.66169559 -32.83682523 -2.91812990 -2.39546888 1.40260796 -0.02549272 -0.13321129 -0.72170356 -0.13587619 -0.00000641 -0.00002284 -0.00000954
 G2-50 -521.35792828 -37.51222511 -34.54984895 -3.05666090 -2.51477748 1.46790596 -0.02328070 -0.13477981 -0.75441870 -0.13477981 -0.00000538 -0.00001702 -0.00000538
 G2-51 -538.54171831 -42.80127437 -39.22791173 -3.54185131 -3.10907935 1.84615119 -0.02492448 -0.12130546 -0.78527661 -0.12130546 -0.00003123 -0.00009163 -0.00003123
 G2-52 -465.35430387 -33.76922646 -31.02268154 -2.75120620 -2.39972984 1.41674182 -0.01731151 -0.11398843 -0.68348187 -0.11398843 -0.00001268 -0.00003546 -0.00001268
 G2-53 -406.13295065 -31.60121647 -28.98409628 -2.62367400 -2.35428198 1.39520808 -0.01796107 -0.10903930 -0.67817502 -0.10903930 -0.00001720 -0.00004875 -0.00001720
 G2-54 -498.83966839 -36.05145804 -33.19218483 -2.94073866 -2.47230321 1.44652497 -0.02085532 -0.13324410 -0.75314935 -0.13324410 -0.00000805 -0.00002451 -0.00000805
 G2-55 -505.81854626 -41.43986354 -38.10251243 -3.52647028 -3.02021649 1.76393000 -0.03911302 -0.19474094 -1.04633939 -0.19474094 -0.00001411 -0.00003741 -0.00001411
 G2-56 -289.08587309 -34.19699283 -31.14212270 -3.23239655 -2.92447234 1.72992074 -0.03978822 -0.16728698 -0.99461672 -0.16728698 -0.00000452 -0.00001127 -0.00000452
 G2-57 -1316.75433214 -86.56580341 -79.82147175 -6.74005548 -5.46783878 3.17802949 -0.03857114 -0.28034467 -1.46109865 -0.28034467 -0.00004656 -0.00011593 -0.00004656
 G2-58 -492.03049161 -48.52612565 -44.37359971 -4.34390918 -3.76700821 2.21266713 -0.04608076 -0.20897031 -1.17988656 -0.20897031 -0.00000572 -0.00001438 -0.00000572
 G2-59 -1519.73705144 -100.92506609 -93.06135934 -7.84619630 -6.30872930 3.65919533 -0.03901088 -0.31396906 -1.61270171 -0.31396906 -0.00004778 -0.00012051 -0.00004778
 G2-60 -390.31839170 -45.43291239 -41.46555541 -4.23737065 -3.85850085 2.26535041 -0.05492064 -0.23117614 -1.34582213 -0.23117614 -0.00000738 -0.00001803 -0.00000738
 G2-61 -1760.54840331 -115.28960286 -106.40134878 -8.92814048 -7.25275419 4.19886777 -0.05318138 -0.38607191 -1.99463983 -0.38607191 -0.00008107 -0.00019714 -0.00008107
 G2-62 -471.94016057 -38.36498070 -35.21835667 -3.27630393 -2.80244608 1.64653904 -0.03297168 -0.16784893 -0.92263139 -0.16784893 -0.00002269 -0.00006573 -0.00002269
 G2-63 -777.77708621 -55.15377964 -50.80544153 -4.43339759 -3.64995566 2.12878129 -0.03175333 -0.20660778 -1.07942121 -0.20660778 -0.00005755 -0.00017183 -0.00005755
 G2-64 -278.18981075 -33.49883705 -30.54937155 -3.17857976 -2.90690345 1.71514524 -0.04527865 -0.18062516 -1.05938276 -0.18062516 -0.00000659 -0.00001734 -0.00000659
 G2-65 -626.24454562 -60.85445181 -55.68638273 -5.39562614 -4.71389891 2.75689925 -0.05511925 -0.26641010 -1.49726515 -0.26641010 -0.00000890 -0.00002145 -0.00000890
 G2-66 -1996.49189506 -130.67536102 -120.58597393 -10.06689921 -8.10399361 4.68673780 -0.05213419 -0.41505002 -2.10444691 -0.41505002 -0.00008325 -0.00020337 -0.00008325
 G2-67 -162.43760518 -21.27813298 -19.39830120 -2.10087797 -1.94705558 1.15907720 -0.03423716 -0.14530359 -0.83538138 -0.14530359 -0.00001086 -0.00003248 -0.00001086
 G2-68 -546.57933200 -42.14161023 -38.76976296 -3.56449613 -3.01124561 1.76747976 -0.04206332 -0.18849463 -1.04434935 -0.18849463 -0.00002105 -0.00006752 -0.00002105
 G2-69 -316.08891435 -36.52929948 -33.39037713 -3.44861184 -3.11256640 1.83301147 -0.05411444 -0.19777237 -1.17185693 -0.19777237 -0.00000634 -0.00001715 -0.00000634
 G2-70 -586.35421003 -52.89145123 -48.49869229 -4.59910020 -3.97474300 2.32087351 -0.05056302 -0.22689637 -1.26649094 -0.22689637 -0.00001006 -0.00002661 -0.00001006
 G2-71 -199.97774314 -24.32878122 -22.28008959 -2.37259305 -2.15690518 1.27805484 -0.03491886 -0.17296651 -1.01662934 -0.17296651 -0.00000913 -0.00003103 -0.00000913
 G2-72 -245.46557227 -28.05011729 -25.65395806 -2.67197011 -2.38133174 1.40754942 -0.03867089 -0.15151348 -0.93286832 -0.15151348 -0.00000331 -0.00001089 -0.00000331
 G2-73 -700.09826788 -57.49296120 -52.90219474 -4.90118842 -4.18825296 2.44267198 -0.06452962 -0.25816105 -1.42731687 -0.25816105 -0.00001353 -0.00004133 -0.00001353
 G2-74 -422.96679624 -50.56700150 -46.11966242 -4.76775820 -4.37036539 2.57341859 -0.06599071 -0.26121580 -1.55733417 -0.26121580 -0.00001433 -0.00003735 -0.00001433
 G2-75 -1793.20670138 -120.49177460 -111.10924045 -9.44863782 -7.76811606 4.50541902 -0.05966217 -0.41779388 -2.19081626 -0.41779388 -0.00009942 -0.00024209 -0.00009942
 G2-76 -381.50122112 -47.07249031 -42.86943428 -4.50102206 -4.14487786 2.44923611 -0.06028407 -0.25484754 -1.52415671 -0.25484754 -0.00001791 -0.00004428 -0.00001791
 G2-77 -98.98143318 -16.90522295 -15.21653561 -1.73998953 -1.80492238 1.10103610 -0.01938946 -0.09018884 -0.65740106 -0.09018884 -0.00001706 -0.00004664 -0.00001706
 G2-78 -98.98721516 -16.89566494 -15.21610522 -1.73879551 -1.80483166 1.10049738 -0.02048149 -0.08788473 -0.65319071 -0.08788473 -0.00001957 -0.00005641 -0.00001957
 G2-79 -98.92154632 -16.92154692 -15.24604429 -1.72544861 -1.80871330 1.09934212 -0.01937414 -0.08991467 -0.65547216 -0.08991467 -0.00001756 -0.00004636 -0.00001756
 G2-80 -99.44385866 -17.64896284 -15.87477769 -1.80237667 -1.94533612 1.18786768 -0.02058398 -0.08754451 -0.68124871 -0.08754451 -0.00001980 -0.00005319 -0.00001980
 G2-81 -99.38912719 -17.68852445 -15.92133728 -1.78630598 -1.95056128 1.18636715 -0.01968504 -0.08983210 -0.67706058 -0.08983210 -0.00001939 -0.00004951 -0.00001939
 G2-82 -99.88918201 -18.39387483 -16.53197036 -1.86492086 -2.08590739 1.27526224 -0.02096482 -0.08863039 -0.71068781 -0.08863039 -0.00002170 -0.00005540 -0.00002170
 G2-83 -132.13354972 -22.81261902 -20.54118457 -2.32920420 -2.45698101 1.49414086 -0.02775879 -0.11815550 -0.88042055 -0.11815550 -0.00003221 -0.00009532 -0.00003221
 G2-84 -132.11336175 -22.82143540 -20.54722031 -2.32885282 -2.45775002 1.49532545 -0.02677052 -0.12099457 -0.88105655 -0.12099457 -0.00002831 -0.00007532 -0.00002831
 G2-85 -132.06892383 -22.84259325 -20.58157700 -2.31252986 -2.46169759 1.49274112 -0.02686904 -0.12033282 -0.87638672 -0.12033282 -0.00003133 -0.00008103 -0.00003133
 G2-86 -132.02604683 -22.86815443 -20.61505783 -2.29471084 -2.46574355 1.49015052 -0.02602981 -0.12373389 -0.87755987 -0.12373389 -0.00003140 -0.00007737 -0.00003140
 G2-87 -132.07619798 -22.84519110 -20.58339753 -2.30773447 -2.46269467 1.49140662 -0.02750663 -0.12048563 -0.88041721 -0.12048563 -0.00003179 -0.00008080 -0.00003179
 G2-88 -132.52382697 -23.59369630 -21.24098894 -2.37169217 -2.60334154 1.57890218 -0.02750720 -0.12019347 -0.90728819 -0.12019347 -0.00003326 -0.00008176 -0.00003326
 G2-89 -132.57886922 -23.55775617 -21.19923819 -2.38818441 -2.59772007 1.58081764 -0.02776888 -0.11936872 -0.90887766 -0.11936872 -0.00003469 -0.00008814 -0.00003469
 G2-90 -133.02182338 -24.30080163 -21.85214588 -2.45300640 -2.73789297 1.66865812 -0.02797444 -0.11946227 -0.93763774 -0.11946227 -0.00003523 -0.00008661 -0.00003523
 G2-91 -133.02463199 -24.29850128 -21.85179870 -2.45036305 -2.73792605 1.66780030 -0.02805110 -0.12040072 -0.93953655 -0.12040072 -0.00003726 -0.00009080 -0.00003726
 G2-92 -165.15329850 -28.79097363 -25.94888581 -2.88472117 -3.11880131 1.88461218 -0.03307412 -0.15352802 -1.09913612 -0.15352802 -0.00004645 -0.00011208 -0.00004645
 G2-93 -197.48712708 -33.24967893 -29.98838354 -3.34921952 -3.49224651 2.10213667 -0.03671275 -0.18909429 -1.25729931 -0.18909429 -0.00007525 -0.00016733 -0.00007525
 G2-94 -211.96141323 -25.99944818 -23.66948269 -2.47019430 -2.31999768 1.37837973 -0.03200953 -0.12812005 -0.80459959 -0.12812005 -0.00000473 -0.00001286 -0.00000473
 G2-95 -301.14373295 -35.71365461 -32.56609271 -3.35452831 -3.08911307 1.82187422 -0.04427408 -0.18012055 -1.07660217 -0.18012055 -0.00000609 -0.00001544 -0.00000609
 G2-96 -897.08748156 -60.94891818 -56.15039070 -4.81293757 -4.01723401 2.34480409 -0.02876780 -0.20269706 -1.11460069 -0.20269706 -0.00002877 -0.00007469 -0.00002877
 G2-97 -1328.81962477 -88.12220679 -81.27711504 -6.87161584 -5.63491772 3.27209186 -0.04089757 -0.29360885 -1.55178239 -0.29360885 -0.00005162 -0.00012855 -0.00005162
 G2-98 -81.67852684 -13.55842343 -12.23155412 -1.36108437 -1.46929861 0.89447114 -0.01538571 -0.06833785 -0.51495541 -0.06833785 -0.00000820 -0.00002307 -0.00000820
 G2-99 -113.98324580 -17.96651047 -16.21596057 -1.83353538 -1.83936877 1.11597313 -0.02123251 -0.10051653 -0.69351151 -0.10051653 -0.00001323 -0.00003558 -0.00001323
G2-100 -214.54023248 -29.17301316 -26.55483778 -2.84998258 -2.77793174 1.65483710 -0.04256261 -0.17774447 -1.10249865 -0.17774447 -0.00001819 -0.00004852 -0.00001819
G2-101 -214.58003889 -29.12934366 -26.50514335 -2.85782246 -2.77459522 1.65467537 -0.04729094 -0.17810451 -1.10166675 -0.17810451 -0.00001881 -0.00004715 -0.00001881
G2-102 -302.64140912 -27.66001209 -25.23242766 -2.41054072 -2.27271130 1.36438919 -0.01920863 -0.09006400 -0.63468334 -0.09006400 -0.00001825 -0.00005219 -0.00001825
G2-103 -166.49046897 -22.31862992 -20.29335567 -2.17629248 -2.09510105 1.24893786 -0.03220288 -0.12752732 -0.79014869 -0.12752732 -0.00000822 -0.00002196 -0.00000822
G2-104 -199.61678571 -28.21837516 -25.60476598 -2.76900482 -2.74657549 1.64292677 -0.04061633 -0.15706405 -1.01775888 -0.15706405 -0.00001797 -0.00004484 -0.00001797
G2-105 -181.03686521 -26.98604251 -24.44957287 -2.65979482 -2.70931058 1.62476761 -0.03686161 -0.15015142 -0.99045197 -0.15015142 -0.00002178 -0.00005496 -0.00002178
G2-106 -114.32766174 -18.73745013 -16.91944881 -1.87475040 -1.98451355 1.19961013 -0.02199782 -0.10017279 -0.71333091 -0.10017279 -0.00001635 -0.00004260 -0.00001635
G2-107 -161.20213857 -23.41335619 -21.20130614 -2.39463146 -2.24361439 1.35053758 -0.03040958 -0.14810953 -0.92680835 -0.14810953 -0.00002091 -0.00006267 -0.00002091
G2-108 -114.80729215 -19.45979518 -17.54723800 -1.94976974 -2.12085221 1.28773072 -0.02324510 -0.09861118 -0.74149278 -0.09861118 -0.00001898 -0.00004862 -0.00001898
G2-109 -114.81636134 -19.46270398 -17.55006704 -1.94898786 -2.12103057 1.28768138 -0.02264915 -0.09931615 -0.74187185 -0.09931615 -0.00001911 -0.00004913 -0.00001911
G2-110 -132.52780435 -19.22908400 -17.42207480 -1.92746596 -1.87983350 1.13202871 -0.02748411 -0.10978250 -0.71149645 -0.10978250 -0.00001231 -0.00003589 -0.00001231
G2-111 -132.91033546 -19.98842688 -18.09509775 -1.98133302 -2.02304681 1.21779322 -0.02523602 -0.10746412 -0.73637736 -0.10746412 -0.00001258 -0.00003333 -0.00001258
G2-112 -132.97509952 -19.97234012 -18.06835688 -1.99472869 -2.01927549 1.21959337 -0.02672238 -0.10635997 -0.73593650 -0.10635997 -0.00001296 -0.00003452 -0.00001296
G2-113 -199.19096915 -27.44742422 -24.91161022 -2.71717112 -2.60384174 1.55815954 -0.03811314 -0.15403807 -0.99388595 -0.15403807 -0.00001549 -0.00004161 -0.00001549
G2-114 -133.38885232 -20.72749771 -18.73728696 -2.05264805 -2.16035405 1.30541036 -0.02447264 -0.10609977 -0.76012407 -0.10609977 -0.00001495 -0.00003883 -0.00001495
G2-115 -133.38244500 -20.71595009 -18.72557491 -2.05571551 -2.15945406 1.30560210 -0.02601146 -0.10483635 -0.76027153 -0.10483635 -0.00001505 -0.00003874 -0.00001505
G2-116 -438.78777946 -36.79236022 -33.68563750 -3.13666835 -2.87056742 1.70022602 -0.02436772 -0.14347899 -0.88133307 -0.14347899 -0.00003056 -0.00008133 -0.00003056
G2-117 -505.85909416 -45.75110548 -41.85343933 -3.98988354 -3.73559754 2.21350800 -0.04370750 -0.19739369 -1.21068983 -0.19739369 -0.00003973 -0.00010128 -0.00003973
G2-118 -439.26778611 -37.50622757 -34.30297869 -3.21191650 -3.00614665 1.78862979 -0.02509904 -0.14019947 -0.90610098 -0.14019947 -0.00003096 -0.00008083 -0.00003096
G2-119 -439.26500022 -37.50603022 -34.30312226 -3.21477101 -3.00637902 1.78947317 -0.02551946 -0.14071892 -0.90843493 -0.14071892 -0.00003181 -0.00008333 -0.00003181
G2-120 -155.47685343 -21.44860786 -19.44454103 -2.10385703 -2.06251398 1.23925147 -0.02704719 -0.10780228 -0.73093636 -0.10780228 -0.00001028 -0.00002890 -0.00001028
G2-121 -498.49250772 -39.67373244 -36.34137337 -3.33949665 -3.05149619 1.81010618 -0.02463566 -0.14513446 -0.91077724 -0.14513446 -0.00002501 -0.00006481 -0.00002501
G2-122 -498.04030852 -38.92876765 -35.68837215 -3.27530436 -2.91143665 1.72257544 -0.02479787 -0.14528573 -0.88506522 -0.14528573 -0.00002352 -0.00006303 -0.00002352
G2-123 -146.66861411 -23.12542248 -20.87731785 -2.36222882 -2.35071688 1.42266620 -0.02860228 -0.13091514 -0.89529509 -0.13091514 -0.00002388 -0.00006671 -0.00002388
G2-124 -166.11300260 -25.88560151 -23.39580395 -2.58126596 -2.67177366 1.61279040 -0.03370583 -0.13756184 -0.96066489 -0.13756184 -0.00002486 -0.00006242 -0.00002486
G2-125 -199.62676920 -28.23605616 -25.62256680 -2.76353802 -2.74766694 1.64234431 -0.03871973 -0.15776300 -1.01200676 -0.15776300 -0.00001773 -0.00004473 -0.00001773
G2-126 -222.16056671 -29.69331609 -26.97455619 -2.88113621 -2.78948512 1.66413184 -0.04041450 -0.15981296 -1.01196527 -0.15981296 -0.00001402 -0.00003592 -0.00001402
G2-127 -564.73128896 -47.14919483 -43.20161234 -4.05486943 -3.63705659 2.14757708 -0.04041587 -0.19868000 -1.17313369 -0.19868000 -0.00003029 -0.00007860 -0.00003029
G2-128 -531.62506926 -45.58085199 -41.66144999 -3.92789165 -3.70348961 2.20359671 -0.03160298 -0.17600289 -1.13789422 -0.17600289 -0.00003867 -0.00009639 -0.00003867
G2-129 -166.52816073 -26.63215147 -24.05752211 -2.63812060 -2.81229745 1.69790470 -0.03173645 -0.13786570 -0.98857312 -0.13786570 -0.00002857 -0.00007027 -0.00002857
G2-130 -166.51950016 -26.62385065 -24.04684583 -2.64366839 -2.81137561 1.69887563 -0.03315083 -0.13573273 -0.98669699 -0.13573273 -0.00002663 -0.00006591 -0.00002663
G2-131 -147.94034843 -25.35845486 -22.86320667 -2.53487411 -2.77250151 1.67983901 -0.03133055 -0.13045092 -0.97123065 -0.13045092 -0.00003450 -0.00008392 -0.00003450
G2-132 -198.29135247 -30.37474971 -27.49733357 -3.01035843 -3.05233925 1.82582661 -0.03659777 -0.17531028 -1.12825912 -0.17531028 -0.00004014 -0.00009310 -0.00004014
G2-133 -504.15771920 -47.17827733 -43.08763070 -4.16909278 -3.90073975 2.30950318 -0.03683619 -0.21402956 -1.27915196 -0.21402956 -0.00007092 -0.00016597 -0.00007092
G2-134 -179.70801473 -29.13926869 -26.33801788 -2.90189717 -3.01489035 1.80762021 -0.03275408 -0.16896140 -1.10298649 -0.16896140 -0.00004717 -0.00010862 -0.00004717
G2-135 -212.42690068 -34.30509198 -30.99141589 -3.43807351 -3.52658252 2.11575858 -0.03934033 -0.19967918 -1.29255888 -0.19967918 -0.00006808 -0.00015182 -0.00006808
G2-136 -0.47516982 -0.65705264 -0.56665001 -0.08945789 -0.13022993 0.09200804 -0.00091567 0.00000000 -0.04139019 0.00000000 0.00000000 -0.00000076 0.00000000
G2-137 -372.74641103 -25.34441635 -23.33507746 -2.00816605 -1.62398928 0.95681122 -0.00942716 -0.08250873 -0.40829660 -0.06314984 -0.00000689 -0.00001701 -0.00000336
G2-138 -65.54321223 -10.61152874 -9.53771420 -1.12597707 -1.06643091 0.66250676 -0.01179919 -0.06346602 -0.39479813 -0.04884423 -0.00000734 -0.00001933 -0.00000563
G2-139 -66.04084156 -11.35866555 -10.20246343 -1.18805779 -1.21195127 0.74963500 -0.01370778 -0.06120175 -0.41691556 -0.04652344 -0.00000947 -0.00002413 -0.00000708
G2-140 -132.74752682 -19.57950160 -17.71444479 -1.96743251 -1.94124324 1.17471275 -0.02694516 -0.10769278 -0.70863548 -0.10650187 -0.00001287 -0.00003181 -0.00001127
G2-141 -99.99892756 -14.44385425 -13.07606139 -1.43602992 -1.42990891 0.86720103 -0.01809882 -0.07930407 -0.49832803 -0.06824293 -0.00000567 -0.00001417 -0.00000454
G2-142 -100.01610713 -14.42444769 -13.03948356 -1.44645610 -1.42814122 0.86823721 -0.02166534 -0.07474374 -0.48362424 -0.06160054 -0.00000461 -0.00001443 -0.00000538
G2-143 -133.15556801 -20.32838209 -18.35922325 -2.03458444 -2.08007125 1.26160986 -0.02994316 -0.10546642 -0.71126944 -0.09335223 -0.00001325 -0.00003635 -0.00001473
G2-144 -405.88234043 -31.24573445 -28.65409424 -2.59985207 -2.27691426 1.35154649 -0.01810172 -0.11284302 -0.63953630 -0.09641298 -0.00001687 -0.00004197 -0.00001300
G2-145 -66.49346014 -12.11737770 -10.87083973 -1.25136965 -1.35446784 0.83769201 -0.01385444 -0.06361840 -0.44249515 -0.04464300 -0.00001060 -0.00002485 -0.00000759
G2-146 -99.63011424 -18.02304646 -16.19366015 -1.83874199 -2.00726816 1.23115744 -0.02148339 -0.09418496 -0.67005641 -0.07662397 -0.00002233 -0.00005090 -0.00001781
G2-147 -132.76749310 -23.92803842 -21.51637186 -2.42448692 -2.65992136 1.62408676 -0.02904223 -0.12576133 -0.89904136 -0.10899750 -0.00003834 -0.00008528 -0.00003181
G2-148 -181.20647469 -22.86470277 -20.87659965 -2.23594540 -2.04981277 1.21753995 -0.03619910 -0.14427755 -0.86234606 -0.16486500 -0.00000677 -0.00002383 -0.00000988
G2-149 -132.12027645 -22.80504699 -20.53913892 -2.32801259 -2.45702016 1.49445470 -0.02766901 -0.11897320 -0.88000615 -0.11897320 -0.00003246 -0.00008763 -0.00003246
G2-150 -165.26541405 -28.72302234 -25.86800387 -2.91319087 -3.10977842 1.88667979 -0.03493735 -0.15044126 -1.10912553 -0.15044126 -0.00005120 -0.00013746 -0.00005120
G2-151 -165.66517151 -29.52332203 -26.58334489 -2.95388803 -3.25756270 1.97099183 -0.03435444 -0.15234026 -1.13254339 -0.15234026 -0.00005059 -0.00012000 -0.00005059
G2-152 -166.15464549 -30.20745070 -27.17203578 -3.04116730 -3.38986296 2.06207301 -0.03498409 -0.15030146 -1.16467433 -0.15030146 -0.00005023 -0.00012077 -0.00005023
G2-153 -166.15986001 -30.20269971 -27.17276036 -3.03324923 -3.39024173 2.05963575 -0.03516736 -0.15315567 -1.17090531 -0.15315567 -0.00005688 -0.00013461 -0.00005688
G2-154 -197.90772614 -33.95533030 -30.60867920 -3.41363336 -3.63012486 2.18922521 -0.04094063 -0.18374384 -1.30162870 -0.18374384 -0.00006860 -0.00016350 -0.00006860
G2-155 -197.90501338 -33.96087618 -30.61086291 -3.41350974 -3.63032667 2.18942027 -0.04097114 -0.18179903 -1.29833550 -0.18179903 -0.00006613 -0.00016135 -0.00006613
G2-156 -198.79622226 -35.44082496 -31.91516551 -3.53678667 -3.91081798 2.36301362 -0.04179175 -0.18375604 -1.35987631 -0.18375604 -0.00007029 -0.00016489 -0.00007029
G2-157 -199.28736270 -36.11420996 -32.49204071 -3.62930274 -4.04184337 2.45548243 -0.04199206 -0.18115322 -1.39172638 -0.18115322 -0.00006614 -0.00015675 -0.00006614
G2-158 -199.28471434 -36.11304239 -32.49524589 -3.62375290 -4.04258597 2.45393642 -0.04226392 -0.18304482 -1.39596619 -0.18304482 -0.00007214 -0.00016880 -0.00007214
G2-159 -230.62105634 -39.15700244 -35.31189942 -3.93559385 -4.14461217 2.49535014 -0.04400485 -0.22114194 -1.48646497 -0.22114194 -0.00009563 -0.00021350 -0.00009563
G2-160 -232.42012292 -42.02092860 -37.81198636 -4.21745611 -4.69381552 2.84889359 -0.04899961 -0.21200449 -1.61878657 -0.21200449 -0.00008272 -0.00019407 -0.00008272
G2-161 -263.28100992 -44.28338046 -39.94419468 -4.46357062 -4.65412909 2.80109119 -0.05538595 -0.24663714 -1.70240703 -0.24663714 -0.00011531 -0.00027515 -0.00011531
G2-162 -265.55285323 -47.92767707 -43.13197977 -4.80558773 -5.34579374 3.24230268 -0.05600864 -0.24285952 -1.84585387 -0.24285952 -0.00009976 -0.00023230 -0.00009976
G2-163 -328.65872345 -54.74510570 -49.41716394 -5.48207789 -5.69098491 3.40927622 -0.06209577 -0.32221706 -2.07233069 -0.32221706 -0.00018687 -0.00041180 -0.00018687
G2-164 -328.63781913 -54.69479090 -49.38883787 -5.48505817 -5.68865846 3.40945791 -0.06439662 -0.32824669 -2.09614776 -0.32824669 -0.00022863 -0.00052336 -0.00022863
G2-165 -232.75224254 -34.13575000 -30.93405868 -3.35579616 -3.39917555 2.03621493 -0.04713051 -0.18744386 -1.23996243 -0.18744386 -0.00002982 -0.00007235 -0.00002982
G2-166 -199.66574620 -32.53703667 -29.37849943 -3.22176874 -3.46451338 2.08993094 -0.03879951 -0.17025147 -1.21896147 -0.17025147 -0.00004582 -0.00010917 -0.00004582
G2-167 -245.54222746 -40.23808704 -36.34704540 -4.01629248 -4.18093948 2.50750652 -0.04688359 -0.23265692 -1.51805915 -0.23265692 -0.00009287 -0.00020959 -0.00009287
G2-168 -264.12126497 -41.49337639 -37.52576121 -4.12002511 -4.21964480 2.52512821 -0.04904261 -0.23951003 -1.53725953 -0.23951003 -0.00008507 -0.00019013 -0.00008507
G2-169 -198.76131933 -31.04491030 -28.06668591 -3.10289295 -3.18313140 1.91720100 -0.04127958 -0.16697796 -1.15975530 -0.16697796 -0.00003497 -0.00009263 -0.00003497
G2-170 -199.16549230 -31.84991873 -28.78025780 -3.14557181 -3.33124655 2.00170888 -0.03936220 -0.16845933 -1.18067213 -0.16845933 -0.00004016 -0.00009598 -0.00004016
G2-171 -231.88873859 -37.01891917 -33.45087617 -3.67057022 -3.84365237 2.30886986 -0.04737956 -0.20135524 -1.38205225 -0.20135524 -0.00005345 -0.00012622 -0.00005345
G2-172 -330.35901382 -48.93463261 -44.33294318 -4.85352119 -4.80185046 2.86565980 -0.06815423 -0.28224036 -1.81499961 -0.28224036 -0.00008426 -0.00022693 -0.00008426
G2-173 -227.36909694 -35.36301568 -31.99445674 -3.52691898 -3.56087382 2.12938974 -0.04239880 -0.20975345 -1.32558438 -0.20975345 -0.00006056 -0.00013536 -0.00006056
G2-174 -572.42743000 -54.07658379 -49.46535043 -4.75711535 -4.46904440 2.63767696 -0.05645146 -0.25139567 -1.49409672 -0.25139567 -0.00004350 -0.00010749 -0.00004350
G2-175 -629.21838463 -60.43688542 -55.12525043 -5.40879678 -5.11067473 3.03011453 -0.04816354 -0.27907604 -1.69039137 -0.27907604 -0.00010184 -0.00022942 -0.00010184
G2-176 -227.47475429 -35.25409960 -31.85272533 -3.57082606 -3.54809884 2.13785906 -0.04250627 -0.20446270 -1.35896947 -0.20446270 -0.00004027 -0.00009940 -0.00004027
G2-177 -227.36834955 -35.35404601 -31.98942649 -3.52725566 -3.56053382 2.12931063 -0.04112078 -0.21045804 -1.32905202 -0.21045804 -0.00006201 -0.00013912 -0.00006201
G2-178 -198.33667356 -30.29238493 -27.39246993 -3.04854592 -3.04227989 1.83279446 -0.04067469 -0.17151557 -1.14388054 -0.17151557 -0.00003418 -0.00008864 -0.00003418
G2-179 -198.79756820 -31.04636154 -28.05989210 -3.10952514 -3.18339834 1.91957016 -0.04170281 -0.16828196 -1.16171687 -0.16828196 -0.00003679 -0.00009980 -0.00003679
G2-180 -332.11715032 -47.53576300 -43.12260640 -4.65961915 -4.63710698 2.76736477 -0.06795858 -0.26945038 -1.72077764 -0.26945038 -0.00004757 -0.00011260 -0.00004757
G2-181 -504.60257823 -47.89498865 -43.70355037 -4.24046529 -4.03794354 2.39789204 -0.03891102 -0.20510084 -1.30320497 -0.20510084 -0.00006471 -0.00015935 -0.00006471
G2-182 -180.25054704 -29.77920922 -26.85410213 -3.01071532 -3.14319185 1.90292116 -0.03532253 -0.16252324 -1.14888392 -0.16252324 -0.00003983 -0.00009699 -0.00003983
G2-183 -199.24298966 -31.79544606 -28.71912686 -3.16848779 -3.32416469 2.00605858 -0.04082604 -0.16858729 -1.18785290 -0.16858729 -0.00003911 -0.00009487 -0.00003911
G2-184 -199.24038268 -31.78607557 -28.70921275 -3.17014757 -3.32340863 2.00618684 -0.04078101 -0.16886176 -1.19181418 -0.16886176 -0.00004043 -0.00009764 -0.00004043
G2-185 -265.80032085 -40.08122781 -36.29959710 -3.91975202 -4.05736063 2.42386204 -0.05245292 -0.21627017 -1.45892491 -0.21627017 -0.00004821 -0.00011377 -0.00004821
G2-186 -505.04855506 -48.63594817 -44.35652548 -4.30227692 -4.17821941 2.48474273 -0.03921398 -0.20582076 -1.33290741 -0.20582076 -0.00006680 -0.00016146 -0.00006680
G2-187 -564.76778559 -51.48147588 -46.98147782 -4.50853754 -4.35571111 2.59469763 -0.03919899 -0.20996427 -1.37178070 -0.20996427 -0.00006222 -0.00014941 -0.00006222
G2-188 -564.75769292 -51.48770063 -46.98141181 -4.51621457 -4.35546848 2.59705621 -0.03861549 -0.20684018 -1.36500280 -0.20684018 -0.00005374 -0.00013072 -0.00005374
G2-189 -180.58957363 -30.58967636 -27.59855679 -3.03889231 -3.29236556 1.98345690 -0.03676221 -0.16234894 -1.16298625 -0.16234894 -0.00004652 -0.00011062 -0.00004652
G2-190 -313.94151907 -46.89715259 -42.52124151 -4.60999069 -4.73469064 2.83383355 -0.06409287 -0.27242369 -1.78719674 -0.27242369 -0.00006796 -0.00015994 -0.00006796
G2-191 -199.65629461 -32.53190926 -29.36813436 -3.23168152 -3.46330420 2.09217124 -0.04025676 -0.16663571 -1.21317814 -0.16663571 -0.00003996 -0.00009658 -0.00003996
G2-192 -266.28456343 -40.76869753 -36.89305349 -4.00475972 -4.19021366 2.51463383 -0.05254495 -0.21589191 -1.49361768 -0.21589191 -0.00005014 -0.00011752 -0.00005014
G2-193 -505.54114740 -49.31208066 -44.94251006 -4.37980657 -4.31044280 2.57296336 -0.03960108 -0.20563899 -1.36884737 -0.20563899 -0.00007212 -0.00017363 -0.00007212
G2-194 -878.04833680 -74.33891775 -68.04166789 -6.32887702 -5.88355072 3.48421957 -0.05276427 -0.28855458 -1.79413037 -0.28855458 -0.00010413 -0.00025432 -0.00010413
G2-195 -181.08962311 -31.27284683 -28.19159476 -3.11741701 -3.42533133 2.07204172 -0.03676894 -0.16366954 -1.20147720 -0.16366954 -0.00005246 -0.00012453 -0.00005246
G2-196 -402.04988966 -45.41444730 -41.22745167 -4.17725757 -4.23199060 2.54673525 -0.03837304 -0.18761032 -1.32075576 -0.18761032 -0.00006667 -0.00016155 -0.00006667
G2-197 -537.29196462 -53.08660988 -48.41046299 -4.75693179 -4.55300405 2.70314181 -0.04419714 -0.24558031 -1.50752398 -0.24558031 -0.00009144 -0.00021307 -0.00009144
G2-198 -212.83837949 -35.04138845 -31.65428364 -3.49128465 -3.66663775 2.20118121 -0.04029071 -0.20009660 -1.33226024 -0.20009660 -0.00006509 -0.00014946 -0.00006509
G2-199 -232.29869518 -37.76178253 -34.10831114 -3.72803173 -3.98414986 2.39340096 -0.04713080 -0.20011812 -1.40931175 -0.20011812 -0.00005894 -0.00013867 -0.00005894
G2-200 -232.37302073 -37.70513782 -34.04221683 -3.75579463 -3.97654162 2.39934429 -0.04792903 -0.19961857 -1.41511898 -0.19961857 -0.00005483 -0.00013021 -0.00005483
G2-201 -299.02475577 -45.95055431 -41.57775980 -4.52884802 -4.70339570 2.82198850 -0.06153141 -0.25046113 -1.69587805 -0.25046113 -0.00006254 -0.00014599 -0.00006254
G2-202 -538.17702924 -54.54919224 -49.68508781 -4.88581759 -4.83124407 2.87695226 -0.04677835 -0.23721115 -1.56075029 -0.23721115 -0.00008862 -0.00021038 -0.00008862
G2-203 -213.72030394 -36.50460045 -32.92886794 -3.62186139 -3.94559315 2.37550575 -0.04424371 -0.19400241 -1.39119025 -0.19400241 -0.00006602 -0.00015505 -0.00006602
G2-204 -232.78609316 -38.43682033 -34.69274396 -3.81073275 -4.11645226 2.48304747 -0.04741758 -0.20068360 -1.44790548 -0.20068360 -0.00006367 -0.00014852 -0.00006367
G2-205 -375.82176664 -52.66793394 -47.77705161 -5.12619076 -5.03121791 2.99164442 -0.06376538 -0.29139746 -1.80764080 -0.29139746 -0.00007847 -0.00017487 -0.00007847
G2-206 -375.82049701 -52.66778005 -47.77708868 -5.12654601 -5.03126203 2.99174221 -0.06350621 -0.29134708 -1.80820715 -0.29134708 -0.00007843 -0.00017439 -0.00007843
G2-207 -286.65481586 -42.95886011 -38.88288551 -4.23775856 -4.26175936 2.54690018 -0.05022980 -0.24030081 -1.53269365 -0.24030081 -0.00007688 -0.00017106 -0.00007688
G2-208 -265.92745332 -44.34315431 -40.01053724 -4.40171547 -4.76780339 2.87707240 -0.05461566 -0.23087254 -1.67241570 -0.23087254 -0.00007963 -0.00018414 -0.00007963
G2-209 -765.04995840 -73.18418030 -67.05046252 -6.43262980 -5.66166603 3.29756611 -0.07121429 -0.33116289 -1.84242174 -0.33116289 -0.00001342 -0.00003176 -0.00001342
G2-210 -908.69561019 -85.51328619 -78.44404309 -7.47329956 -6.60824912 3.83873304 -0.08792098 -0.40125940 -2.21510836 -0.40125940 -0.00002000 -0.00004719 -0.00002000
G2-211 -1272.48261117 -90.50660964 -83.42642225 -7.14583678 -5.84799887 3.38465672 -0.04100701 -0.32182153 -1.60988376 -0.32182153 -0.00017263 -0.00045121 -0.00017263
G2-212 -572.37867549 -49.72584571 -45.67938937 -4.29757045 -3.75132755 2.18899881 -0.05517164 -0.24673092 -1.32732434 -0.24673092 -0.00001758 -0.00004706 -0.00001758
G2-213 -1236.45387206 -80.05868601 -73.93097283 -6.16404105 -4.93880557 2.85925091 -0.03540791 -0.25588318 -1.31962156 -0.25588318 -0.00004331 -0.00011815 -0.00004331
G2-214 -1680.63985678 -113.58445379 -104.78210923 -8.88295828 -7.25109928 4.19585289 -0.06167082 -0.39426755 -2.01751418 -0.39426755 -0.00007243 -0.00018122 -0.00007243
G2-215 -2477.89065795 -160.39439885 -148.13494184 -12.28352072 -9.89768400 5.71184410 -0.07097840 -0.52567492 -2.64114823 -0.52567492 -0.00014469 -0.00034996 -0.00014469
G2-216 -1369.64791941 -96.58398751 -89.06651476 -7.70547766 -6.39941857 3.70719122 -0.06795017 -0.37319742 -1.92869852 -0.37319742 -0.00005792 -0.00015098 -0.00005792
G2-217 -1614.05666863 -105.25560740 -97.17326111 -8.11018953 -6.51719065 3.77020215 -0.04757352 -0.33903016 -1.72674080 -0.33903016 -0.00007298 -0.00018859 -0.00007298
G2-218 -1608.98392642 -105.06301144 -97.03097323 -8.10133156 -6.51199233 3.76691540 -0.05227663 -0.34688230 -1.76344495 -0.34688230 -0.00008919 -0.00023742 -0.00008919
G2-219 -1132.58541192 -75.42269855 -69.56175966 -5.87732335 -4.71931477 2.73856685 -0.03350472 -0.23747765 -1.23050805 -0.23747765 -0.00004230 -0.00011373 -0.00004230
G2-220 -732.87837838 -62.88954159 -57.69494019 -5.41119874 -4.70659197 2.74868533 -0.05595810 -0.26921223 -1.50740653 -0.26921223 -0.00001775 -0.00004497 -0.00001775
G2-221 -601.80049107 -70.74486401 -64.55519599 -6.60410967 -6.04761009 3.54709143 -0.08856119 -0.36399377 -2.12396289 -0.36399377 -0.00002055 -0.00004773 -0.00002055
G2-222 -300.88906837 -35.32276646 -32.21470276 -3.32776889 -3.00837655 1.77716252 -0.04627293 -0.18099334 -1.04334860 -0.17798933 -0.00000580 -0.00001351 -0.00000491
G2-223 -197.21777744 -32.86545540 -29.63930959 -3.32352894 -3.41119321 2.05790813 -0.03823361 -0.19456546 -1.22213115 -0.18002581 -0.00007534 -0.00016441 -0.00007227
# Non Hydrogon Local Minimums : 31
# Non Hydrogon Transition States : 15
# Hydrogon Local Minimums : 21
# Hydrogon Transition States : 19
NHL1  -0.19120627 -0.30821881 -0.26483415 -0.04163629 -0.03979738 -0.04163629 -0.00043702 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
NHL2  -95.86022091 -13.10748306 -11.87478038 -1.33566440 -1.22001205 -1.33566440 -0.01339960 -0.07829047 -0.49820944 -0.07829047 -0.00000333 -0.00000899 -0.00000333
NHL3  -95.98929565 -13.45591727 -12.19529663 -1.36474805 -1.28384951 -1.36474805 -0.01709492 -0.07820337 -0.49729609 -0.07708031 -0.00000448 -0.00001280 -0.00000457
NHL4  -99.45442336 -13.30860139 -12.05349731 -1.34862903 -1.22417619 -1.34862903 -0.01642167 -0.07335924 -0.47418601 -0.07335924 -0.00000314 -0.00000841 -0.00000314
NHL5  -99.60262733 -13.67041048 -12.39047384 -1.37795374 -1.28880028 -1.37795374 -0.01881140 -0.07504309 -0.48537525 -0.07762258 -0.00000411 -0.00001129 -0.00000384
NHL6  -66.30486506 -11.74405829 -10.55411164 -1.21489824 -1.29333974 -1.21489824 -0.01322290 -0.05640653 -0.45541459 -0.05640653 -0.00000904 -0.00002654 -0.00000904
NHL7  -66.48451424 -12.12679893 -10.87891135 -1.25172386 -1.35499854 -1.25172386 -0.01376863 -0.06357702 -0.44187917 -0.04456655 -0.00001051 -0.00002454 -0.00000750
NHL8  -33.35386659 -6.21632190 -5.55206751 -0.66271384 -0.70160288 -0.66271384 -0.00585297 -0.03404298 -0.21524800 -0.01278876 -0.00000299 -0.00000688 -0.00000127
NHL9  -99.61257882 -18.03765970 -16.20202452 -1.84113620 -2.00721058 -1.84113620 -0.02093135 -0.09489430 -0.66878260 -0.07463825 -0.00002243 -0.00005051 -0.00001735
NHL10 -80.84792538 -12.04514589 -10.88141807 -1.24444276 -1.18645281 -1.24444276 -0.01369543 -0.07033626 -0.47347053 -0.07033626 -0.00000535 -0.00001503 -0.00000535
NHL11 -80.82892426 -12.04865719 -10.87882964 -1.24222371 -1.18549474 -1.24222371 -0.01397536 -0.06621747 -0.45533467 -0.06621747 -0.00000530 -0.00001450 -0.00000530
NHL12 -89.21110878 -10.22515601 -9.34093164 -0.97166098 -0.89026502 -0.97166098 -0.01594011 -0.05715219 -0.32601026 -0.05715219 -0.00000012 -0.00000081 -0.00000012
NHL13 -122.77950597 -16.29532779 -14.78355401 -1.58163582 -1.55143799 -1.58163582 -0.01901623 -0.07695651 -0.53104153 -0.07695651 -0.00000359 -0.00001073 -0.00000359
NHL14 -212.00721017 -26.52050340 -24.13514989 -2.54319130 -2.44348028 -2.54319130 -0.04152026 -0.13647772 -0.86399157 -0.13647772 -0.00000681 -0.00001909 -0.00000681
NHL15 -431.83911970 -27.71797783 -25.58185453 -2.13820544 -1.73571053 -2.13820544 -0.01092967 -0.08792758 -0.45441633 -0.08792758 -0.00000558 -0.00002064 -0.00000558
NHL16 -465.34307818 -33.78089999 -31.03337503 -2.75073302 -2.40046940 -2.75073302 -0.01718274 -0.11400934 -0.68262440 -0.11400934 -0.00001255 -0.00003495 -0.00001255
NHL17 -897.19260971 -61.50017624 -56.62382458 -4.88092255 -4.13794334 -4.88092255 -0.03111788 -0.20400166 -1.14139077 -0.20400166 -0.00003162 -0.00008644 -0.00003162
NHL18 -554.58361096 -43.99478993 -40.37815351 -3.71149415 -3.29178172 -3.71149415 -0.04533900 -0.17454088 -1.01783843 -0.17454088 -0.00001857 -0.00005284 -0.00001857
NHL19 -554.62225854 -44.02026915 -40.37764453 -3.71236486 -3.28930364 -3.71236486 -0.03108728 -0.16648283 -0.98937099 -0.16648283 -0.00001787 -0.00004999 -0.00001787
NHL20 -66.68636550 -8.71233841 -7.94012633 -0.85664220 -0.84366705 -0.85664220 -0.01417349 -0.05635107 -0.33662512 -0.05635107 -0.00000088 -0.00000455 -0.00000088
NHL21 -100.24081843 -14.83126173 -13.42589557 -1.46504060 -1.50913599 -1.46504060 -0.01716943 -0.07523081 -0.53306329 -0.07523081 -0.00000568 -0.00001625 -0.00000568
NHL22 -189.48052982 -25.06553297 -22.80017187 -2.41354027 -2.40313290 -2.41354027 -0.03597731 -0.13677032 -0.86709889 -0.13677032 -0.00001038 -0.00002819 -0.00001038
NHL23 -189.48011389 -25.01078579 -22.73577803 -2.42807237 -2.39690678 -2.42807237 -0.03760576 -0.13550659 -0.87339206 -0.13550659 -0.00000978 -0.00002737 -0.00000978
NHL24 -162.42982823 -21.28759514 -19.40553009 -2.10072500 -1.94743694 -2.10072500 -0.03415250 -0.14443040 -0.83149994 -0.14443040 -0.00001066 -0.00003179 -0.00001066
NHL25 -66.86933513 -8.54161298 -7.72454102 -0.85786893 -0.77481062 -0.85786893 -0.00786278 -0.04740612 -0.24746208 -0.02310124 -0.00000053 -0.00000174 -0.00000034
NHL26 -178.81157800 -19.91550075 -18.20488340 -1.89001526 -1.66005232 -1.89001526 -0.01997673 -0.09831575 -0.62989141 -0.09831575 -0.00000084 -0.00000397 -0.00000084
NHL27 -89.65346892 -10.39496559 -9.47704744 -0.98202753 -0.90077501 -0.98202753 -0.01000795 -0.05074317 -0.30892833 -0.05074317 -0.00000030 -0.00000113 -0.00000030
NHL28 -521.35167575 -37.51938639 -34.55593964 -3.05597975 -2.51514314 -3.05597975 -0.02316775 -0.13464059 -0.75255267 -0.13464059 -0.00000534 -0.00001675 -0.00000534
NHL29 -432.21959456 -27.87249322 -25.71568124 -2.15423087 -1.74857388 -2.15423087 -0.00937683 -0.08459429 -0.45529774 -0.08459429 -0.00000426 -0.00001346 -0.00000426
NHL30 -89.38890704 -10.00641205 -9.06942612 -0.97343212 -0.81668281 -0.97343212 -0.00768670 -0.04707123 -0.23597065 -0.02358331 -0.00000011 -0.00000035 -0.00000007
NHL31 -431.95286969 -27.51673592 -25.37185042 -2.13691877 -1.66967393 -2.13691877 -0.00854831 -0.08667092 -0.41161171 -0.06652895 -0.00000366 -0.00000893 -0.00000196
NHT1  -96.02742359 -13.39349938 -12.14982458 -1.36460436 -1.27538731 -1.36460436 -0.01733193 -0.08423644 -0.51125545 -0.07851782 -0.00000607 -0.00001562 -0.00000424
NHT2  -99.64157743 -13.60009840 -12.32236348 -1.38107718 -1.27438193 -1.38107718 -0.02022461 -0.07599659 -0.48433232 -0.07509449 -0.00000488 -0.00001328 -0.00000378
NHT3  -66.49672563 -12.03722546 -10.81553502 -1.24947111 -1.34248671 -1.24947111 -0.01640551 -0.06001727 -0.46004460 -0.05541073 -0.00001232 -0.00003560 -0.00001035
NHT4  -99.64115724 -17.94696061 -16.12546256 -1.85644700 -2.00137346 -1.85644700 -0.02510781 -0.09729137 -0.68712125 -0.07616014 -0.00002493 -0.00006681 -0.00002058
NHT5  -80.82909977 -11.98590579 -10.83112835 -1.23972831 -1.18272749 -1.23972831 -0.01453160 -0.07042802 -0.46948249 -0.07042802 -0.00000612 -0.00001623 -0.00000612
NHT6  -212.01713382 -26.47145356 -24.11452268 -2.54209690 -2.44323654 -2.54209690 -0.05052081 -0.14318058 -0.89406502 -0.14318058 -0.00000783 -0.00002598 -0.00000783
NHT7  -897.21066177 -61.44837204 -56.59577311 -4.88169067 -4.13661123 -4.88169067 -0.03986767 -0.20874453 -1.16186552 -0.20874453 -0.00003789 -0.00012861 -0.00003789
NHT8  -554.60730029 -43.95989636 -40.35714045 -3.71200977 -3.29032855 -3.71200977 -0.04965394 -0.17705554 -1.03130082 -0.17705554 -0.00002069 -0.00006823 -0.00002069
NHT9  -189.48309264 -24.96998312 -22.72586843 -2.42671354 -2.39805343 -2.42671354 -0.04769710 -0.14314654 -0.90552056 -0.14314654 -0.00001190 -0.00003961 -0.00001190
NHT10 -162.62431588 -21.53873869 -19.64779021 -2.13137432 -2.00017371 -2.13137432 -0.03384118 -0.15770731 -0.84299750 -0.13686403 -0.00002089 -0.00004359 -0.00000984
NHT11 -122.99608858 -16.49573831 -14.99022835 -1.61777081 -1.60086083 -1.61777081 -0.02130031 -0.09624480 -0.56335257 -0.07434885 -0.00001000 -0.00002477 -0.00000370
NHT12 -179.01057968 -20.19248997 -18.47486955 -1.92389212 -1.70896243 -1.92389212 -0.02928208 -0.11077891 -0.63636249 -0.09872392 -0.00000219 -0.00001145 -0.00000104
NHT13 -554.73115388 -43.66998024 -40.09565299 -3.70718915 -3.22118449 -3.70718915 -0.03201908 -0.18620759 -0.99753541 -0.15003845 -0.00002372 -0.00006406 -0.00001162
NHT14 -432.39500767 -28.14071849 -25.97722580 -2.18161458 -1.80205810 -2.18161458 -0.01243635 -0.09198862 -0.47790805 -0.08655809 -0.00000954 -0.00002776 -0.00000544
NHT15 -89.85588524 -10.59555976 -9.69161261 -1.00657943 -0.94809656 -1.00657943 -0.01132149 -0.06237605 -0.33205198 -0.05212618 -0.00000296 -0.00000709 -0.00000039
HL1   -0.19120627 -0.30821881 -0.26483415 -0.04163629 -0.03979738 -0.04163629 -0.00043702 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
HL2   -432.21959456 -27.87249322 -25.71568124 -2.15423087 -1.74857388 -2.15423087 -0.00937683 -0.08459429 -0.45529774 -0.08459429 -0.00000426 -0.00001346 -0.00000426
HL3   -0.47485429 -0.65738017 -0.56691799 -0.08949237 -0.13025076 -0.08949237 -0.00091453 0.00000000 -0.04137515 0.00000000 0.00000000 -0.00000076 0.00000000
HL4   -431.95286969 -27.51673592 -25.37185042 -2.13691877 -1.66967393 -2.13691877 -0.00854831 -0.08667092 -0.41161171 -0.06652895 -0.00000366 -0.00000893 -0.00000196
HL5   -66.86933513 -8.54161298 -7.72454102 -0.85786893 -0.77481062 -0.85786893 -0.00786278 -0.04740612 -0.24746208 -0.02310124 -0.00000053 -0.00000174 -0.00000034
HL6   -67.12236191 -8.92726763 -8.11330337 -0.86926457 -0.85781425 -0.86926457 -0.00911493 -0.04762938 -0.30948241 -0.04762938 -0.00000088 -0.00000326 -0.00000088
HL7   -33.35386659 -6.21632190 -5.55206751 -0.66271384 -0.70160288 -0.66271384 -0.00585297 -0.03404298 -0.21524800 -0.01278876 -0.00000299 -0.00000688 -0.00000127
HL8   -33.61929958 -6.58610868 -5.89925883 -0.68570748 -0.78256526 -0.68570748 -0.00702609 -0.02824120 -0.25868923 -0.02824120 -0.00000290 -0.00000959 -0.00000290
HL9   -48.55010149 -7.66113055 -6.92265289 -0.76850063 -0.81805363 -0.76850063 -0.00789885 -0.03952314 -0.28965810 -0.03952314 -0.00000185 -0.00000650 -0.00000185
HL10  -48.30182865 -7.27676507 -6.54870433 -0.75333348 -0.73591323 -0.75333348 -0.00704972 -0.04253049 -0.23949449 -0.01904795 -0.00000147 -0.00000444 -0.00000082
HL11  -66.74362919 -12.50017709 -11.22373956 -1.27676471 -1.43478530 -1.27676471 -0.01387310 -0.05789854 -0.48328729 -0.05789854 -0.00001016 -0.00002807 -0.00001016
HL12  -66.48461755 -12.12667781 -10.87885001 -1.25169081 -1.35499701 -1.25169081 -0.01377395 -0.06357973 -0.44189642 -0.04457666 -0.00001051 -0.00002456 -0.00000751
HL13  -89.38890704 -10.00641205 -9.06942612 -0.97343212 -0.81668281 -0.97343212 -0.00768670 -0.04707123 -0.23597065 -0.02358331 -0.00000011 -0.00000035 -0.00000007
HL14  -89.65346892 -10.39496559 -9.47704744 -0.98202753 -0.90077501 -0.98202753 -0.01000795 -0.05074317 -0.30892833 -0.05074317 -0.00000030 -0.00000113 -0.00000030
HL15  -66.61492200 -8.18893679 -7.37011649 -0.83765673 -0.68765628 -0.83765673 -0.00576307 -0.04538343 -0.18310823 -0.00756734 -0.00000024 -0.00000064 -0.00000008
HL16  -318.81759371 -23.65614708 -21.73302731 -1.91809542 -1.65945504 -1.91809542 -0.01177487 -0.06948347 -0.43381438 -0.06948347 -0.00000881 -0.00003027 -0.00000881
HL17  -318.57161023 -23.30114035 -21.40736804 -1.89088400 -1.58130980 -1.89088400 -0.01033182 -0.07523656 -0.39681456 -0.05748508 -0.00001071 -0.00002486 -0.00000404
HL18  -372.99877428 -25.70106405 -23.67149374 -2.02973385 -1.70259389 -2.02973385 -0.01047844 -0.07857326 -0.44911097 -0.07857326 -0.00000685 -0.00002255 -0.00000685
HL19  -372.74325734 -25.34776664 -23.33793758 -2.00823538 -1.62418832 -2.00823538 -0.00939507 -0.08250313 -0.40804867 -0.06314147 -0.00000685 -0.00001687 -0.00000333
HL20  -48.05415078 -6.91959666 -6.20523422 -0.72990436 -0.64982889 -0.72990436 -0.00581977 -0.04392827 -0.18511103 -0.00612296 -0.00000105 -0.00000266 -0.00000022
HL21  -165.25215307 -28.73537001 -25.87856605 -2.91608926 -3.11042950 -2.91608926 -0.03506555 -0.14988625 -1.10702097 -0.14988625 -0.00004755 -0.00013173 -0.00004755
HT1   -432.39072251 -28.17446646 -25.98577194 -2.19850696 -1.80684125 -2.19850696 -0.01247606 -0.09079037 -0.47035006 -0.07859854 -0.00000608 -0.00002041 -0.00000542
HT2   -67.33768863 -9.16180404 -8.31990089 -0.91614836 -0.91095196 -0.91614836 -0.01498658 -0.05203835 -0.32392648 -0.04267549 -0.00000169 -0.00000768 -0.00000159
HT3   -33.81523748 -6.84793062 -6.13588969 -0.72503224 -0.83645344 -0.72503224 -0.00976622 -0.03635984 -0.27421506 -0.02239345 -0.00000511 -0.00001690 -0.00000327
HT4   -100.48203608 -15.08257339 -13.64929122 -1.51389191 -1.56525915 -1.51389191 -0.02090194 -0.08354666 -0.55063436 -0.07218073 -0.00000723 -0.00002383 -0.00000759
HT5   -0.66346275 -0.93713739 -0.82557146 -0.12074484 -0.18161601 -0.12074484 -0.00269672 -0.00318235 -0.05277375 0.00000000 -0.00000026 -0.00000363 0.00000000
HT6   -115.42621706 -16.13900520 -14.66981717 -1.59578343 -1.60097547 -1.59578343 -0.02286074 -0.09368855 -0.59444908 -0.09276742 -0.00000540 -0.00002162 -0.00000830
HT7   -465.57208120 -34.06440352 -31.28278902 -2.79594315 -2.45774763 -2.79594315 -0.01947708 -0.12388753 -0.69266257 -0.10511270 -0.00001491 -0.00004478 -0.00001361
HT8   -133.61202130 -20.99357052 -18.97353484 -2.10454742 -2.21765597 -2.10454742 -0.02956308 -0.11295261 -0.77707920 -0.10431881 -0.00001638 -0.00004900 -0.00001910
HT9   -89.86913724 -10.61937800 -9.66060242 -1.03806900 -0.95286719 -1.03806900 -0.02095296 -0.05051447 -0.31150872 -0.04290158 -0.00000059 -0.00000374 -0.00000070
HT10  -100.22446732 -14.71938128 -13.28483397 -1.49790676 -1.48101253 -1.49790676 -0.01882020 -0.08298389 -0.48611220 -0.04795408 -0.00000591 -0.00001960 -0.00000541
HT11  -319.01839623 -23.93308587 -21.98729680 -1.95224797 -1.71034771 -1.95224797 -0.01465170 -0.07511904 -0.44740589 -0.06831078 -0.00001311 -0.00004375 -0.00000984
HT12  -67.07474980 -8.80120274 -7.96480731 -0.89540964 -0.82577798 -0.89540964 -0.01151635 -0.05093671 -0.26310954 -0.02293699 -0.00000113 -0.00000560 -0.00000065
HT13  -373.19595821 -25.97946669 -23.92771964 -2.06419282 -1.75414087 -2.06419282 -0.01318425 -0.08473334 -0.46360930 -0.07707015 -0.00001035 -0.00003362 -0.00000813
HT14  -498.84442137 -35.97531749 -33.09733319 -2.96322272 -2.44731557 -2.96322272 -0.03930697 -0.13781076 -0.70047748 -0.12826637 -0.00000765 -0.00003410 -0.00002071
HT15  -81.65550027 -13.45374183 -12.10922558 -1.39161271 -1.44207990 -1.39161271 -0.01792385 -0.08109268 -0.48018511 -0.04287105 -0.00000937 -0.00002822 -0.00000720
HT16  -114.78259404 -19.36683484 -17.43626119 -1.98078035 -2.09488457 -1.98078035 -0.02519538 -0.11130907 -0.70692959 -0.07439777 -0.00001978 -0.00005389 -0.00001819
HT17  -115.03348086 -19.73373235 -17.79205953 -1.99923701 -2.17841969 -1.99923701 -0.02632583 -0.10875375 -0.76076974 -0.09444121 -0.00002101 -0.00005993 -0.00002210
HT18  -81.90585648 -13.82082566 -12.46580928 -1.40954910 -1.52580227 -1.40954910 -0.01874352 -0.07878655 -0.53404471 -0.06269684 -0.00001039 -0.00003281 -0.00000993
HT19  -165.21572312 -28.67935292 -25.87408827 -2.89281675 -3.11182165 -2.89281675 -0.03370594 -0.16588723 -1.13343806 -0.16588723 -0.00006885 -0.00016088 -0.00006885
# 52 + 48 molecules for NCIE + BSSE
# 56 + 34 molecules for S22 + BSSE
# 12 +  6 molecules for ADIM6 + BSSE
NB1         -48.55539973 -7.65546679 -6.91777707 -0.76843095 -0.81774730 -0.76843095 -0.00794173 -0.03958090 -0.29024710 -0.03958090 -0.00000186 -0.00000657 -0.00000186
NB2         -89.65632056 -10.39181533 -9.47448314 -0.98199354 -0.90063003 -0.98199354 -0.01005271 -0.05081416 -0.30939897 -0.05081416 -0.00000030 -0.00000114 -0.00000030
NB3         -67.12713225 -8.92202642 -8.10893631 -0.86921297 -0.85755603 -0.86921297 -0.00916677 -0.04773731 -0.31023532 -0.04773731 -0.00000089 -0.00000330 -0.00000089
NB4         -147.90217350 -21.07026289 -19.12158501 -2.07310811 -2.05680192 -2.07310811 -0.03041113 -0.11968184 -0.76798562 -0.11968184 -0.00001093 -0.00002951 -0.00001093
NB5         -166.49160941 -22.31734352 -20.29211117 -2.17655364 -2.09505665 -2.17655364 -0.03225392 -0.12760397 -0.79063320 -0.12760397 -0.00000822 -0.00002195 -0.00000822
NB6         -66.31267794 -11.73579948 -10.54679008 -1.21485782 -1.29285814 -1.21485782 -0.01328561 -0.05648413 -0.45626131 -0.05648413 -0.00000912 -0.00002682 -0.00000912
NB7         -178.82179343 -19.90263499 -18.19462959 -1.89133717 -1.65947435 -1.89133717 -0.02019075 -0.09870900 -0.63582603 -0.09870900 -0.00000085 -0.00000420 -0.00000085
NB8         -521.35757612 -37.51263447 -34.55019643 -3.05662172 -2.51479843 -3.05662172 -0.02327418 -0.13477181 -0.75431006 -0.13477181 -0.00000538 -0.00001700 -0.00000538
NB9         -65.85978806 -10.97545314 -9.87389596 -1.15129668 -1.15144100 -1.15129668 -0.01206230 -0.05995861 -0.43750971 -0.05995861 -0.00000806 -0.00002306 -0.00000806
NB10        -80.85462850 -12.03750805 -10.87499967 -1.24449258 -1.18607925 -1.24449258 -0.01379390 -0.07071454 -0.47539766 -0.07071454 -0.00000543 -0.00001527 -0.00000543
NB11        -863.92801080 -55.03744514 -50.82998653 -4.22516021 -3.36557247 -4.22516021 -0.02077606 -0.17019269 -0.89149088 -0.17019269 -0.00001624 -0.00004810 -0.00001624
NB12        -373.00187546 -25.69768429 -23.66872921 -2.02961923 -1.70240792 -2.02961923 -0.01050683 -0.07861606 -0.44946367 -0.07861606 -0.00000689 -0.00002270 -0.00000689
NB13        -432.22125194 -27.87074420 -25.71418844 -2.15419821 -1.74847509 -2.15419821 -0.00939533 -0.08460192 -0.45543727 -0.08460192 -0.00000427 -0.00001352 -0.00000427
NB14        -465.34681780 -33.77702205 -31.02993159 -2.75070350 -2.40023581 -2.75070350 -0.01721467 -0.11401896 -0.68288719 -0.11401896 -0.00001259 -0.00003508 -0.00001259
NB15        -406.12493293 -31.60956642 -28.99176586 -2.62330034 -2.35482306 -2.62330034 -0.01788496 -0.10906379 -0.67762007 -0.10906379 -0.00001707 -0.00004827 -0.00001707
NB16        -116.45861734 -12.06115022 -11.00696822 -1.10336478 -0.94568153 -1.10336478 -0.00926285 -0.04864921 -0.28681273 -0.04864921 -0.00000005 -0.00000020 -0.00000005
NB17        -197.49267955 -33.24384580 -29.98287345 -3.34964109 -3.49190624 -3.34964109 -0.03676814 -0.18917323 -1.25797058 -0.18917323 -0.00007554 -0.00016794 -0.00007554
NB18        -33.62226517 -6.58305426 -5.89654450 -0.68563951 -0.78237954 -0.68563951 -0.00704349 -0.02824092 -0.25885345 -0.02824092 -0.00000291 -0.00000964 -0.00000291
NB19        -1.84240057 -1.01649219 -0.87763045 -0.14148003 -0.14969531 -0.14148003 -0.00138221 0.00000000 -0.03749550 0.00000000 0.00000000 -0.00000009 0.00000000
NB20        -496.63170260 -30.16304169 -27.85921339 -2.28914074 -1.79632398 -2.28914074 -0.00802700 -0.08769684 -0.45141355 -0.08769684 -0.00000223 -0.00000671 -0.00000223
NB21        -97.10999840 -15.31388733 -13.84367744 -1.53013985 -1.63679606 -1.53013985 -0.01637336 -0.08028329 -0.58270963 -0.08028329 -0.00000736 -0.00002086 -0.00000736
NB22        -179.31191988 -20.78985037 -18.96013439 -1.95677971 -1.80264464 -1.95677971 -0.02067410 -0.10239990 -0.61983609 -0.10239990 -0.00000130 -0.00000384 -0.00000130
NB23        -134.25268338 -17.85113723 -16.23085936 -1.73017473 -1.71676835 -1.73017473 -0.01896382 -0.09662254 -0.62216304 -0.09662254 -0.00000382 -0.00001096 -0.00000382
NB24        -115.68134967 -16.58488166 -15.04228433 -1.62808113 -1.67741200 -1.62808113 -0.01798686 -0.08892951 -0.60336972 -0.08892951 -0.00000553 -0.00001591 -0.00000553
NB25        -295.79539546 -42.16389122 -38.28142516 -4.12594306 -4.11840493 -4.12594306 -0.06210581 -0.24267444 -1.54131596 -0.24267444 -0.00003858 -0.00009351 -0.00003858
NB26        -332.96440419 -44.67056650 -40.63741856 -4.32845259 -4.19606992 -4.32845259 -0.06641781 -0.25857152 -1.58381030 -0.25857152 -0.00002960 -0.00007129 -0.00002960
NB27        -245.13384275 -31.63369304 -28.74789901 -3.10132592 -2.95332946 -3.10132592 -0.04065750 -0.15763517 -1.09736579 -0.15763517 -0.00001394 -0.00004325 -0.00001394
NB28        -227.38156245 -27.54566080 -25.11779609 -2.65369706 -2.47828582 -2.65369706 -0.04120136 -0.14171362 -0.93731437 -0.14171362 -0.00000486 -0.00001959 -0.00000486
NB29        -587.21458544 -48.48656588 -44.44045306 -4.19493015 -3.66890411 -4.19493015 -0.03952361 -0.19892353 -1.19962974 -0.19892353 -0.00002499 -0.00007000 -0.00002499
NB30        -602.20973389 -49.55280592 -45.44078841 -4.28979178 -3.70315470 -4.28979178 -0.04069065 -0.20883402 -1.23711975 -0.20883402 -0.00001741 -0.00004781 -0.00001741
NB31        -912.48904926 -62.68427756 -57.75850537 -4.98173757 -4.18534426 -4.98173757 -0.03514151 -0.21397343 -1.19288928 -0.21397343 -0.00002805 -0.00008609 -0.00002805
NB32        -588.48596740 -46.43409064 -42.67353334 -3.91377835 -3.37455344 -3.91377835 -0.03750042 -0.18573167 -1.07189014 -0.18573167 -0.00001092 -0.00003258 -0.00001092
NB33        -569.91223798 -45.16691969 -41.50170895 -3.80546835 -3.33706494 -3.80546835 -0.03819456 -0.18213464 -1.06602024 -0.18213464 -0.00001517 -0.00005000 -0.00001517
NB34        -746.00224894 -51.39610079 -47.34324179 -4.05357657 -3.40592871 -4.05357657 -0.02161627 -0.15857395 -0.90160671 -0.15857395 -0.00002374 -0.00006682 -0.00002374
NB35        -864.44052533 -55.74314325 -51.43542740 -4.30219910 -3.49814967 -4.30219910 -0.01943163 -0.17054692 -0.91351692 -0.17054692 -0.00001500 -0.00004094 -0.00001500
NB36        -805.22185477 -53.56989644 -49.39307176 -4.17554917 -3.45259865 -4.17554917 -0.02102451 -0.16524130 -0.90871063 -0.16524130 -0.00001971 -0.00005566 -0.00001971
NB37        -897.56562537 -61.64994077 -56.75503403 -4.89481037 -4.15055341 -4.89481037 -0.02768906 -0.20097795 -1.14286645 -0.20097795 -0.00002873 -0.00007383 -0.00002873
NB38        -486.97807728 -43.65054717 -39.87604660 -3.85984417 -3.54248092 -3.85984417 -0.03232647 -0.18137509 -1.15550532 -0.18137509 -0.00003322 -0.00008583 -0.00003322
NB39        -838.34406438 -59.48234298 -54.72052129 -4.76531639 -4.10567073 -4.76531639 -0.02883371 -0.19686257 -1.13911855 -0.19686257 -0.00003572 -0.00009368 -0.00003572
NB40        -313.94955804 -45.30624725 -40.99280394 -4.44947830 -4.43815972 -4.44947830 -0.04611774 -0.23826774 -1.54606520 -0.23826774 -0.00007900 -0.00017572 -0.00007900
NB41        -150.08046507 -18.64467587 -16.90449014 -1.78773722 -1.72827039 -1.78773722 -0.01628953 -0.07700918 -0.54606354 -0.07700918 -0.00000360 -0.00001115 -0.00000360
NB42        -498.47371812 -31.17983304 -28.73742185 -2.42992576 -1.94613854 -2.42992576 -0.00937674 -0.08774739 -0.48902707 -0.08774739 -0.00000261 -0.00000757 -0.00000261
NB43        -118.30080733 -13.07783977 -11.88497685 -1.24432735 -1.09545631 -1.24432735 -0.01060336 -0.04867097 -0.32436976 -0.04867097 -0.00000013 -0.00000045 -0.00000013
NB44        -232.91699729 -24.12257106 -22.01452174 -2.20592361 -1.89148288 -2.20592361 -0.01848379 -0.09735235 -0.57382549 -0.09735235 -0.00000023 -0.00000065 -0.00000023
NB45        -613.08982943 -42.22461735 -38.86712806 -3.39138403 -2.74219447 -3.39138403 -0.01726732 -0.13644202 -0.73852954 -0.13644202 -0.00000280 -0.00000797 -0.00000280
NB46        -67.24201859 -13.16767787 -11.79637817 -1.36765507 -1.56540902 -1.36765507 -0.01412887 -0.05701526 -0.51896275 -0.05701526 -0.00001080 -0.00002939 -0.00001080
NB47        -131.71805145 -21.95272223 -19.75195477 -2.29827059 -2.30368532 -2.29827059 -0.02432991 -0.12066190 -0.87627934 -0.12066190 -0.00002454 -0.00006367 -0.00002454
NB48        -132.62025446 -23.47515592 -21.10128364 -2.42202599 -2.58711185 -2.42202599 -0.02676709 -0.11442664 -0.91555977 -0.11442664 -0.00003162 -0.00008088 -0.00003162
NB49        -394.92996885 -66.54009440 -60.01904348 -6.68984022 -6.98847135 -6.68984022 -0.07353005 -0.38146301 -2.52087047 -0.38146301 -0.00023801 -0.00051092 -0.00023801
NB50        -394.92946548 -66.54449984 -60.02242160 -6.68925022 -6.98857864 -6.68925022 -0.07344244 -0.38057611 -2.51756085 -0.38057611 -0.00020811 -0.00045186 -0.00020811
NB51        -394.92893121 -66.54169358 -60.02184482 -6.68705466 -6.98888004 -6.68705466 -0.07365449 -0.38214249 -2.52204461 -0.38214249 -0.00023775 -0.00051147 -0.00023775
NB52        -197.46851447 -33.26907193 -30.00568378 -3.34926720 -3.49338074 -3.34926720 -0.03656052 -0.18892470 -1.25571373 -0.18892470 -0.00007465 -0.00016597 -0.00007465
  S22_1     -97.10232131 -15.32169663 -13.85056571 -1.52959162 -1.63725957 -1.52959162 -0.01632774 -0.08026556 -0.58219723 -0.08026556 -0.00000755 -0.00002106 -0.00000755
S22_01a     -48.55155753 -7.65951213 -6.92126712 -0.76851690 -0.81797109 -0.76851690 -0.00791663 -0.03954575 -0.28990334 -0.03954575 -0.00000185 -0.00000652 -0.00000185
  S22_2     -134.24470126 -17.85954833 -16.23837924 -1.72987440 -1.71726460 -1.72987440 -0.01894274 -0.09654128 -0.62128305 -0.09654128 -0.00000383 -0.00001095 -0.00000383
S22_02a     -67.12260965 -8.92702665 -8.11309364 -0.86925158 -0.85780002 -0.86925158 -0.00911586 -0.04762646 -0.30947076 -0.04762646 -0.00000088 -0.00000325 -0.00000088
  S22_3     -332.96392473 -44.66966507 -40.63875487 -4.32710504 -4.19632594 -4.32710504 -0.06664512 -0.25908581 -1.58524069 -0.25908581 -0.00002985 -0.00007188 -0.00002985
S22_03a     -166.50081471 -22.30482867 -20.28235825 -2.17577674 -2.09449524 -2.17577674 -0.03246789 -0.12806931 -0.79277731 -0.12806931 -0.00000833 -0.00002234 -0.00000833
  S22_4     -295.79367248 -42.16497702 -38.28326213 -4.12535528 -4.11861784 -4.12535528 -0.06218588 -0.24290055 -1.54191243 -0.24290055 -0.00003876 -0.00009394 -0.00003876
S22_04a     -147.91001714 -21.06025028 -19.11363284 -2.07286950 -2.05636849 -2.07286950 -0.03068294 -0.12014969 -0.77019257 -0.12014969 -0.00001105 -0.00002987 -0.00001105
  S22_5     -721.28637762 -103.82011821 -94.27340686 -10.11175958 -10.04212601 -10.11175958 -0.15152202 -0.62169077 -3.78626876 -0.62169077 -0.00018506 -0.00042958 -0.00018506
S22_05a     -360.65436943 -51.88647034 -47.10719873 -5.06687882 -5.01804814 -5.06687882 -0.07537591 -0.30887423 -1.89286830 -0.30887423 -0.00007011 -0.00016999 -0.00007011
  S22_6     -539.52593571 -83.89193455 -75.95392100 -8.28931301 -8.47651433 -8.28931301 -0.10876616 -0.49912051 -3.14543374 -0.49912051 -0.00021871 -0.00048917 -0.00021871
S22_06a     -279.06817922 -42.54903771 -38.53799264 -4.20811239 -4.25462482 -4.20811239 -0.05676152 -0.25070582 -1.58533386 -0.25070582 -0.00007516 -0.00017676 -0.00007516
S22_06b     -260.48195299 -41.30340270 -37.36054481 -4.10342346 -4.21583661 -4.10342346 -0.05033333 -0.24328385 -1.55221584 -0.24328385 -0.00008465 -0.00019277 -0.00008465
  S22_7     -797.52393585 -118.66855578 -107.66089272 -11.59420546 -11.68449914 -11.59420546 -0.16239481 -0.72259537 -4.40344592 -0.72259537 -0.00030043 -0.00067064 -0.00030043
S22_07a     -403.76827972 -60.82594912 -55.16558703 -5.96529624 -6.00712373 -5.96529624 -0.07830121 -0.37638969 -2.27354863 -0.37638969 -0.00013424 -0.00030181 -0.00013424
S22_07b     -393.78275595 -57.80098906 -52.43837430 -5.65189493 -5.67107322 -5.65189493 -0.08243628 -0.34128942 -2.12215557 -0.34128942 -0.00009121 -0.00021758 -0.00009121
  S22_8     -67.24109663 -13.16893048 -11.79711059 -1.36830713 -1.56538757 -1.36830713 -0.01409954 -0.05693226 -0.51867218 -0.05693226 -0.00001060 -0.00002896 -0.00001060
S22_08a     -33.62111625 -6.58424025 -5.89759827 -0.68566587 -0.78245166 -0.68566587 -0.00703672 -0.02824101 -0.25878950 -0.02824101 -0.00000290 -0.00000962 -0.00000290
  S22_9     -132.61211324 -23.48377647 -21.10886304 -2.42216579 -2.58760649 -2.42216579 -0.02670048 -0.11434664 -0.91473907 -0.11434664 -0.00003146 -0.00008043 -0.00003146
S22_09a     -66.30997363 -11.73866036 -10.54931765 -1.21488745 -1.29302545 -1.21488745 -0.01326440 -0.05646026 -0.45599143 -0.05646026 -0.00000909 -0.00002673 -0.00000909
 S22_10     -231.09050227 -39.85047592 -35.90485308 -4.02801425 -4.27682183 -4.02801425 -0.04389625 -0.21898186 -1.51917592 -0.21898186 -0.00009898 -0.00022013 -0.00009898
S22_10a     -197.47945337 -33.25768969 -29.99532820 -3.34951977 -3.49271580 -3.34951977 -0.03665568 -0.18904112 -1.25676363 -0.18904112 -0.00007507 -0.00016690 -0.00007507
S22_10b     -33.61655895 -6.58891165 -5.90175104 -0.68577002 -0.78273559 -0.68577002 -0.00701024 -0.02824158 -0.25853992 -0.02824158 -0.00000288 -0.00000954 -0.00000288
 S22_11     -394.94367000 -66.52275355 -60.00817508 -6.68291215 -6.98854193 -6.68291215 -0.07401841 -0.38382569 -2.52764167 -0.38382569 -0.00024418 -0.00052525 -0.00024418
S22_11a     -197.47825041 -33.25892445 -29.99635720 -3.34962657 -3.49278819 -3.34962657 -0.03664832 -0.18903681 -1.25670853 -0.18903681 -0.00007506 -0.00016686 -0.00007506
 S22_12     -454.72850301 -70.70874948 -63.99095127 -7.03839718 -7.12410678 -7.03839718 -0.08308036 -0.42749110 -2.67592259 -0.42749110 -0.00020819 -0.00044849 -0.00020819
S22_12a     -227.37342652 -35.34810520 -31.98389437 -3.52814800 -3.56025893 -3.52814800 -0.04115661 -0.21075149 -1.33087308 -0.21075149 -0.00006226 -0.00013960 -0.00006226
 S22_13     -721.27643343 -103.80899657 -94.25970994 -10.10993123 -10.04152677 -10.10993123 -0.15117226 -0.62488706 -3.79883795 -0.62488706 -0.00025109 -0.00056288 -0.00025109
S22_13a     -360.64786992 -51.89432516 -47.11358999 -5.06740947 -5.01840363 -5.06740947 -0.07527683 -0.30864164 -1.89181024 -0.30864164 -0.00007008 -0.00016996 -0.00007008
 S22_14     -508.32898020 -83.91921028 -75.80010520 -8.36293664 -8.71154200 -8.36293664 -0.09593572 -0.49917794 -3.19016678 -0.49917794 -0.00036130 -0.00077591 -0.00036130
S22_14a     -310.86739914 -50.65416857 -45.78241928 -5.03637205 -5.21465395 -5.03637205 -0.05823192 -0.30141042 -1.91250662 -0.30141042 -0.00014348 -0.00031956 -0.00014348
S22_14b     -197.47827439 -33.25893447 -29.99657264 -3.34933324 -3.49278821 -3.34933324 -0.03664179 -0.18901847 -1.25657898 -0.18901847 -0.00007499 -0.00016672 -0.00007499
 S22_15     -797.50974959 -118.66536864 -107.65798353 -11.58404255 -11.68535743 -11.58404255 -0.16210262 -0.72916837 -4.41969602 -0.72916837 -0.00039906 -0.00086869 -0.00039906
S22_15a     -403.76773454 -60.82602894 -55.16468743 -5.96640609 -6.00709758 -5.96640609 -0.07834079 -0.37654578 -2.27425906 -0.37654578 -0.00013509 -0.00030366 -0.00013509
S22_15b     -393.77106369 -57.81471342 -52.44963661 -5.65271222 -5.67174183 -5.65271222 -0.08230091 -0.34096544 -2.12048270 -0.34096544 -0.00009076 -0.00021642 -0.00009076
 S22_16     -132.16336403 -22.72134149 -20.43227184 -2.36205146 -2.44560341 -2.36205146 -0.02546816 -0.11714241 -0.89417192 -0.11714241 -0.00002442 -0.00006462 -0.00002442
S22_16a     -66.30911059 -11.73954514 -10.55008827 -1.21491566 -1.29307811 -1.21491566 -0.01325847 -0.05646152 -0.45596105 -0.05646152 -0.00000908 -0.00002670 -0.00000908
S22_16b     -65.85889483 -10.97638333 -9.87470374 -1.15134194 -1.15149530 -1.15134194 -0.01205716 -0.05995839 -0.43746663 -0.05995839 -0.00000805 -0.00002304 -0.00000805
 S22_17     -264.60093805 -42.18707366 -38.11581555 -4.21047873 -4.35197808 -4.21047873 -0.04620136 -0.23843978 -1.57034616 -0.23843978 -0.00008975 -0.00019933 -0.00008975
S22_17a     -197.48154173 -33.25549764 -29.99328675 -3.34963694 -3.49258783 -3.34963694 -0.03667560 -0.18906807 -1.25699726 -0.18906807 -0.00007517 -0.00016711 -0.00007517
S22_17b     -67.12416903 -8.92513425 -8.11156172 -0.86927423 -0.85771738 -0.86927423 -0.00914065 -0.04770076 -0.30994244 -0.04770076 -0.00000088 -0.00000328 -0.00000088
 S22_18     -246.02578628 -40.92215670 -36.92548950 -4.11051504 -4.31217847 -4.11051504 -0.04482873 -0.23029435 -1.55056343 -0.23029435 -0.00009541 -0.00021205 -0.00009541
S22_18a     -197.47984064 -33.25728155 -29.99493759 -3.34955650 -3.49269201 -3.34955650 -0.03665971 -0.18904706 -1.25681365 -0.18904706 -0.00007509 -0.00016694 -0.00007509
S22_18b     -48.55146746 -7.65936671 -6.92117615 -0.76858853 -0.81797528 -0.76858853 -0.00792961 -0.03956397 -0.29009957 -0.03956397 -0.00000185 -0.00000654 -0.00000185
 S22_19     -278.33731313 -45.29334136 -40.87487973 -4.58380629 -4.68037044 -4.58380629 -0.05103108 -0.26247154 -1.73868212 -0.26247154 -0.00010065 -0.00022487 -0.00010065
S22_19a     -197.48204423 -33.25496694 -29.99278318 -3.34967882 -3.49255687 -3.34967882 -0.03668074 -0.18907547 -1.25705995 -0.18907547 -0.00007520 -0.00016717 -0.00007520
S22_19b     -80.86384684 -12.02641519 -10.86576700 -1.24470232 -1.18555886 -1.24470232 -0.01394786 -0.07140027 -0.47878086 -0.07140027 -0.00000555 -0.00001568 -0.00000555
 S22_20     -394.95136561 -66.52082448 -60.00179572 -6.68857395 -6.98740387 -6.68857395 -0.07369723 -0.38117857 -2.52064231 -0.38117857 -0.00021105 -0.00045810 -0.00021105
S22_20a     -197.48059563 -33.25649129 -29.99421142 -3.34958474 -3.49264585 -3.34958474 -0.03666659 -0.18905589 -1.25689167 -0.18905589 -0.00007513 -0.00016701 -0.00007513
S22_20b     -197.48254885 -33.25441653 -29.99220635 -3.34980096 -3.49252488 -3.34980096 -0.03668788 -0.18908819 -1.25716033 -0.18908819 -0.00007524 -0.00016726 -0.00007524
 S22_21     -508.34094171 -83.91724704 -75.79182443 -8.37110447 -8.71001229 -8.37110447 -0.09548499 -0.49496354 -3.17955064 -0.49496354 -0.00030381 -0.00065945 -0.00030381
S22_21a     -310.87103891 -50.65027082 -45.77900408 -5.03635390 -5.21444027 -5.03635390 -0.05825547 -0.30147192 -1.91289981 -0.30147192 -0.00014364 -0.00031990 -0.00014364
S22_21b     -197.48106589 -33.25599869 -29.99375820 -3.34960320 -3.49261707 -3.34960320 -0.03667089 -0.18906146 -1.25694071 -0.18906146 -0.00007515 -0.00016706 -0.00007515
 S22_22     -528.21893111 -83.01329576 -75.08581713 -8.22477375 -8.44327436 -8.22477375 -0.09852861 -0.48290722 -3.08215086 -0.48290722 -0.00023288 -0.00050696 -0.00023288
S22_22a     -264.11734863 -41.49723656 -37.52891351 -4.12068848 -4.21989500 -4.12068848 -0.04904878 -0.23952234 -1.53735345 -0.23952234 -0.00008478 -0.00018941 -0.00008478
S22_22b     -264.11734863 -41.49723656 -37.52891351 -4.12068848 -4.21989500 -4.12068848 -0.04904879 -0.23952234 -1.53735345 -0.23952234 -0.00008478 -0.00018941 -0.00008478
    AM2     -66.75008927 -12.49348615 -11.21782083 -1.27660052 -1.43438207 -1.27660052 -0.01391678 -0.05790837 -0.48368113 -0.05790837 -0.00001022 -0.00002827 -0.00001022
    AD2     -133.49625729 -24.98942541 -22.44147319 -2.54670626 -2.86987511 -2.54670626 -0.02796525 -0.11708548 -0.97009631 -0.11708548 -0.00003429 -0.00008449 -0.00003429
    AM3     -99.88086853 -18.40239692 -16.53994219 -1.86452630 -2.08645313 -1.86452630 -0.02091891 -0.08866951 -0.71027424 -0.08866951 -0.00002164 -0.00005519 -0.00002164
    AD3     -199.75561943 -36.80849251 -33.08863404 -3.71983644 -4.17452937 -3.71983644 -0.04212752 -0.17943963 -1.42514835 -0.17943963 -0.00006955 -0.00016334 -0.00006955
    AM4     -133.01087346 -24.31200795 -21.86269258 -2.45238974 -2.73861413 -2.45238974 -0.02791383 -0.11951963 -0.93709911 -0.11951963 -0.00003514 -0.00008633 -0.00003514
    AD4     -266.01267585 -48.62959715 -43.73816151 -4.89180398 -5.47957507 -4.89180398 -0.05628005 -0.24215166 -1.88108542 -0.24215166 -0.00011248 -0.00025764 -0.00011248
    AM5     -166.14068511 -30.22173100 -27.18552120 -3.04031292 -3.39078676 -3.04031292 -0.03490622 -0.15037702 -1.16399462 -0.15037702 -0.00005012 -0.00012041 -0.00005012
    AD5     -332.26944957 -60.45088630 -54.38764527 -6.06397607 -6.78458562 -6.06397607 -0.07041108 -0.30486203 -2.33708785 -0.30486203 -0.00016002 -0.00036115 -0.00016002
    AM6     -199.27054751 -36.13140329 -32.50830880 -3.62822150 -4.04295688 -3.62822150 -0.04189789 -0.18124530 -1.39090805 -0.18124530 -0.00006601 -0.00015632 -0.00006601
    AD6     -398.52611211 -72.27203561 -65.03727576 -7.23602960 -8.08963742 -7.23602960 -0.08459087 -0.36771251 -2.79344620 -0.36771251 -0.00021152 -0.00047258 -0.00021152
    AM7     -232.40038610 -42.04110124 -37.83111461 -4.21612790 -4.69512568 -4.21612790 -0.04888917 -0.21211542 -1.61783047 -0.21211542 -0.00008258 -0.00019359 -0.00008258
    AD7     -464.78222910 -84.09370728 -75.68739422 -8.40760349 -9.39467714 -8.40760349 -0.09869079 -0.43061387 -3.24977570 -0.43061387 -0.00026491 -0.00058776 -0.00026491
 1-1_NCIE   -48.55649928 -7.65446297 -6.91696382 -0.76836764 -0.81770165 -0.76836764 -0.00796193 -0.03967407 -0.29079227 -0.03967407 -0.00000197 -0.00000689 -0.00000197
 2-1_NCIE   -89.65801931 -10.39040643 -9.47333370 -0.98193992 -0.90056092 -0.98193992 -0.01014794 -0.05097516 -0.31034932 -0.05097516 -0.00000034 -0.00000128 -0.00000034
 3-1_NCIE   -67.12964853 -8.91944805 -8.10680846 -0.86915031 -0.85741507 -0.86915031 -0.00924956 -0.04783033 -0.31080326 -0.04783033 -0.00000093 -0.00000343 -0.00000093
 4-1_NCIE   -48.55671816 -7.65431215 -6.91687268 -0.76832807 -0.81769250 -0.76832807 -0.00797396 -0.03970796 -0.29103837 -0.03970796 -0.00000198 -0.00000692 -0.00000198
 4-2_NCIE   -67.13189820 -8.91694710 -8.10470799 -0.86910973 -0.85728781 -0.86910973 -0.00927851 -0.04787473 -0.31114483 -0.04787473 -0.00000094 -0.00000346 -0.00000094
 5-1_NCIE   -147.90970234 -21.06105229 -19.11430933 -2.07274374 -2.05641742 -2.07274374 -0.03070324 -0.12027918 -0.77109849 -0.12027918 -0.00001135 -0.00003059 -0.00001135
 6-1_NCIE   -166.49848952 -22.30847819 -20.28529484 -2.17567394 -2.09467780 -2.17567394 -0.03244255 -0.12811618 -0.79335132 -0.12811618 -0.00000857 -0.00002290 -0.00000857
 7-1_NCIE   -66.31294139 -11.73553283 -10.54658257 -1.21484478 -1.29284785 -1.21484478 -0.01329629 -0.05653291 -0.45655179 -0.05653291 -0.00000927 -0.00002719 -0.00000927
 7-2_NCIE   -178.82502253 -19.89903574 -18.19172372 -1.89168522 -1.65930970 -1.89168522 -0.02032393 -0.09890951 -0.63803823 -0.09890951 -0.00000091 -0.00000439 -0.00000091
 8-1_NCIE   -48.55633238 -7.65463328 -6.91715689 -0.76836161 -0.81769518 -0.76836161 -0.00797821 -0.03967447 -0.29069262 -0.03967447 -0.00000197 -0.00000689 -0.00000197
 8-2_NCIE   -178.82760639 -19.89543280 -18.18889225 -1.89206642 -1.65914617 -1.89206642 -0.02036273 -0.09899051 -0.63965351 -0.09899051 -0.00000089 -0.00000442 -0.00000089
 9-1_NCIE   -65.86252161 -10.97244642 -9.87135382 -1.15126739 -1.15129010 -1.15126739 -0.01210882 -0.06015744 -0.43877029 -0.06015744 -0.00000847 -0.00002426 -0.00000847
 9-2_NCIE   -521.36449105 -37.50473088 -34.54351852 -3.05732738 -2.51439906 -3.05732738 -0.02346400 -0.13501045 -0.75713012 -0.13501045 -0.00000550 -0.00001749 -0.00000550
10-1_NCIE   -80.85285700 -12.03976322 -10.87689795 -1.24442125 -1.18619662 -1.24442125 -0.01378857 -0.07062606 -0.47518274 -0.07062606 -0.00000543 -0.00001524 -0.00000543
10-2_NCIE   -521.36430136 -37.50498622 -34.54372685 -3.05731567 -2.51441316 -3.05731567 -0.02345423 -0.13499843 -0.75697849 -0.13499843 -0.00000549 -0.00001744 -0.00000549
11-1_NCIE   -48.55684574 -7.65429322 -6.91682985 -0.76827407 -0.81768862 -0.76827407 -0.00796533 -0.03970346 -0.29093573 -0.03970346 -0.00000201 -0.00000698 -0.00000201
11-2_NCIE   -863.93698113 -55.02761750 -50.82107259 -4.22623229 -3.36494714 -4.22623229 -0.02086299 -0.17016899 -0.89365351 -0.17016899 -0.00001650 -0.00004943 -0.00001650
12-1_NCIE   -67.12930756 -8.92025630 -8.10752070 -0.86909441 -0.85745649 -0.86909441 -0.00927136 -0.04792863 -0.31120709 -0.04792863 -0.00000101 -0.00000363 -0.00000101
12-2_NCIE   -521.36448714 -37.50467567 -34.54346485 -3.05735036 -2.51439643 -3.05735036 -0.02344703 -0.13499139 -0.75699096 -0.13499139 -0.00000548 -0.00001744 -0.00000548
13-1_NCIE   -48.55661213 -7.65460505 -6.91711453 -0.76814224 -0.81769482 -0.76814224 -0.00795039 -0.03972952 -0.29107422 -0.03972952 -0.00000205 -0.00000707 -0.00000205
13-2_NCIE   -521.38239374 -37.48223742 -34.52463150 -3.05957727 -2.51324056 -3.05957727 -0.02385424 -0.13548802 -0.76402850 -0.13548802 -0.00000567 -0.00001848 -0.00000567
14-1_NCIE   -373.00263723 -25.69693038 -23.66808262 -2.02959742 -1.70236693 -2.02959742 -0.01052173 -0.07865000 -0.44977720 -0.07865000 -0.00000698 -0.00002296 -0.00000698
15-1_NCIE   -432.22199007 -27.87000811 -25.71358145 -2.15416294 -1.74843909 -2.15416294 -0.00941097 -0.08464583 -0.45587460 -0.08464583 -0.00000435 -0.00001373 -0.00000435
16-1_NCIE   -373.00296817 -25.69658436 -23.66781834 -2.02957598 -1.70234892 -2.02957598 -0.01052753 -0.07866804 -0.44998150 -0.07866804 -0.00000699 -0.00002298 -0.00000699
16-2_NCIE   -432.22497644 -27.86683843 -25.71093298 -2.15412203 -1.74826225 -2.15412203 -0.00946386 -0.08466345 -0.45608858 -0.08466345 -0.00000437 -0.00001382 -0.00000437
17-1_NCIE   -465.34876431 -33.77508389 -31.02808555 -2.75090076 -2.40010868 -2.75090076 -0.01726165 -0.11406169 -0.68356591 -0.11406169 -0.00001276 -0.00003557 -0.00001276
17-2_NCIE   -432.22424877 -27.86763305 -25.71161734 -2.15411309 -1.74830729 -2.15411309 -0.00945397 -0.08467461 -0.45614112 -0.08467461 -0.00000442 -0.00001393 -0.00000442
18-1_NCIE   -406.12603186 -31.60850629 -28.99079325 -2.62333588 -2.35475773 -2.62333588 -0.01790940 -0.10911950 -0.67815292 -0.10911950 -0.00001723 -0.00004868 -0.00001723
18-2_NCIE   -80.85807490 -12.03381057 -10.87185422 -1.24435961 -1.18588529 -1.24435961 -0.01386525 -0.07081775 -0.47612951 -0.07081775 -0.00000555 -0.00001558 -0.00000555
19-1_NCIE   -406.12585649 -31.60868483 -28.99096583 -2.62332278 -2.35477094 -2.62332278 -0.01790921 -0.10913198 -0.67829094 -0.10913198 -0.00001721 -0.00004865 -0.00001721
19-2_NCIE   -432.22727207 -27.86430404 -25.70878584 -2.15407323 -1.74812035 -2.15407323 -0.00949707 -0.08470320 -0.45653002 -0.08470320 -0.00000446 -0.00001407 -0.00000446
20-1_NCIE   -116.45896742 -12.06120563 -11.00697370 -1.10333758 -0.94567763 -1.10333758 -0.00935449 -0.04871291 -0.28717729 -0.04871291 -0.00000006 -0.00000024 -0.00000006
20-2_NCIE   -197.49313107 -33.24345250 -29.98253241 -3.34961132 -3.49188810 -3.34961132 -0.03678495 -0.18922942 -1.25825871 -0.18922942 -0.00007597 -0.00016953 -0.00007597
21-1_NCIE   -116.45887257 -12.06117389 -11.00695015 -1.10334307 -0.94568276 -1.10334307 -0.00931724 -0.04868566 -0.28704052 -0.04868566 -0.00000006 -0.00000021 -0.00000006
21-2_NCIE   -33.62227250 -6.58305013 -5.89653521 -0.68563836 -0.78237799 -0.68563836 -0.00704496 -0.02824455 -0.25887538 -0.02824455 -0.00000292 -0.00000968 -0.00000292
22-1_NCIE   -1.84239949 -1.01650054 -0.87763635 -0.14148004 -0.14969605 -0.14148004 -0.00138329 0.00000000 -0.03749757 0.00000000 0.00000000 -0.00000010 0.00000000
22-2_NCIE   -496.63171938 -30.16303515 -27.85922277 -2.28913807 -1.79632575 -2.28913807 -0.00802878 -0.08769974 -0.45144340 -0.08769974 -0.00000223 -0.00000673 -0.00000223
23-1_NCIE   -1.84240010 -1.01649730 -0.87763394 -0.14148007 -0.14969580 -0.14148007 -0.00138279 0.00000000 -0.03749709 0.00000000 0.00000000 -0.00000010 0.00000000
23-2_NCIE   -116.45866311 -12.06115538 -11.00696634 -1.10336228 -0.94568026 -1.10336228 -0.00927780 -0.04865563 -0.28685258 -0.04865563 -0.00000005 -0.00000020 -0.00000005
24-1_NCIE   -116.45869985 -12.06116191 -11.00696550 -1.10335943 -0.94568011 -1.10335943 -0.00928426 -0.04866364 -0.28689510 -0.04866364 -0.00000005 -0.00000021 -0.00000005
25-1_NCIE   -116.45873645 -12.06117692 -11.00697591 -1.10335431 -0.94568091 -1.10335431 -0.00929675 -0.04866633 -0.28691987 -0.04866633 -0.00000005 -0.00000021 -0.00000005
25-2_NCIE   -496.63172097 -30.16303516 -27.85922072 -2.28913747 -1.79632553 -2.28913747 -0.00802910 -0.08770440 -0.45148303 -0.08770440 -0.00000224 -0.00000674 -0.00000224
26-1_NCIE   -33.62240751 -6.58292232 -5.89641829 -0.68563332 -0.78237075 -0.68563332 -0.00704878 -0.02825763 -0.25895762 -0.02825763 -0.00000298 -0.00000980 -0.00000298
27-1_NCIE   -65.86048881 -10.97469384 -9.87325885 -1.15128566 -1.15140206 -1.15128566 -0.01208016 -0.06001523 -0.43783898 -0.06001523 -0.00000824 -0.00002359 -0.00000824
28-1_NCIE   -66.31328449 -11.73520500 -10.54624385 -1.21485697 -1.29282799 -1.21485697 -0.01330267 -0.05655598 -0.45665566 -0.05655598 -0.00000945 -0.00002760 -0.00000945
29-1_NCIE   -197.46906610 -33.26874073 -30.00544302 -3.34919320 -3.49339873 -3.34919320 -0.03660737 -0.18906142 -1.25650318 -0.18906142 -0.00007514 -0.00016747 -0.00007514
30-1_NCIE   -197.46903007 -33.26899418 -30.00557264 -3.34919444 -3.49340399 -3.34919444 -0.03661571 -0.18910522 -1.25673829 -0.18910522 -0.00007545 -0.00016878 -0.00007545
31-1_NCIE   -197.46906971 -33.26886553 -30.00550284 -3.34916400 -3.49339776 -3.34916400 -0.03661640 -0.18910488 -1.25672879 -0.18910488 -0.00007537 -0.00016839 -0.00007537
01a_S22     -48.55300991 -7.65806654 -6.92003542 -0.76846640 -0.81789987 -0.76846640 -0.00792683 -0.03961927 -0.29032571 -0.03961927 -0.00000197 -0.00000684 -0.00000197
02a_S22     -67.12623990 -8.92320314 -8.10994162 -0.86919405 -0.85760293 -0.86919405 -0.00921327 -0.04776095 -0.31031086 -0.04776095 -0.00000093 -0.00000340 -0.00000093
03a_S22     -166.50136201 -22.30483114 -20.28231588 -2.17570907 -2.09450865 -2.17570907 -0.03253480 -0.12828836 -0.79423261 -0.12828836 -0.00000862 -0.00002304 -0.00000862
04a_S22     -147.91037754 -21.06021925 -19.11356494 -2.07283389 -2.05637810 -2.07283389 -0.03072646 -0.12032893 -0.77137389 -0.12032893 -0.00001137 -0.00003064 -0.00001137
05a_S22     -360.65489712 -51.88639158 -47.10708531 -5.06682540 -5.01806206 -5.06682540 -0.07543469 -0.30909407 -1.89437028 -0.30909407 -0.00007066 -0.00017125 -0.00007066
06a_S22     -279.06874531 -42.54892417 -38.53781258 -4.20805450 -4.25462988 -4.20805450 -0.05681913 -0.25095310 -1.58687839 -0.25095310 -0.00007594 -0.00017867 -0.00007594
06b_S22     -260.48237483 -41.30332347 -37.36042498 -4.10338014 -4.21584093 -4.10338014 -0.05038822 -0.24343915 -1.55343429 -0.24343915 -0.00008498 -0.00019371 -0.00008498
07a_S22     -403.76963546 -60.82486655 -55.16462262 -5.96524847 -6.00708172 -5.96524847 -0.07836415 -0.37656370 -2.27489360 -0.37656370 -0.00013460 -0.00030266 -0.00013460
07b_S22     -393.78321908 -57.80105492 -52.43839692 -5.65182210 -5.67111012 -5.65182210 -0.08250061 -0.34150340 -2.12360725 -0.34150340 -0.00009172 -0.00021873 -0.00009172
08a_S22     -33.62156124 -6.58379518 -5.89719350 -0.68565278 -0.78242356 -0.68565278 -0.00704344 -0.02825492 -0.25889514 -0.02825492 -0.00000297 -0.00000977 -0.00000297
09a_S22     -66.30918307 -11.73953927 -10.55007290 -1.21490046 -1.29308150 -1.21490046 -0.01327031 -0.05652098 -0.45625177 -0.05652098 -0.00000940 -0.00002745 -0.00000940
10a_S22     -197.47976038 -33.25770855 -29.99529751 -3.34947885 -3.49273381 -3.34947885 -0.03668879 -0.18915711 -1.25739561 -0.18915711 -0.00007573 -0.00016936 -0.00007573
10b_S22     -33.61710287 -6.58838251 -5.90127426 -0.68575646 -0.78270256 -0.68575646 -0.00701930 -0.02828461 -0.25878135 -0.02828461 -0.00000309 -0.00001002 -0.00000309
11a_S22     -197.48027222 -33.25727042 -29.99493699 -3.34937635 -3.49271292 -3.34937635 -0.03672633 -0.18925942 -1.25804725 -0.18925942 -0.00007590 -0.00016971 -0.00007590
12a_S22     -227.37345370 -35.34857668 -31.98427200 -3.52803414 -3.56031355 -3.52803414 -0.04121004 -0.21090716 -1.33192809 -0.21090716 -0.00006283 -0.00014148 -0.00006283
13a_S22     -360.64874473 -51.89429664 -47.11347713 -5.06727883 -5.01843194 -5.06727883 -0.07538495 -0.30904683 -1.89404859 -0.30904683 -0.00007130 -0.00017290 -0.00007130
14a_S22     -310.86948477 -50.65258192 -45.78102175 -5.03621337 -5.21460756 -5.03621337 -0.05834009 -0.30175407 -1.91444196 -0.30175407 -0.00014487 -0.00032364 -0.00014487
14b_S22     -197.48175649 -33.25582599 -29.99368090 -3.34938793 -3.49266301 -3.34938793 -0.03676148 -0.18935277 -1.25869370 -0.18935277 -0.00007606 -0.00017009 -0.00007606
15a_S22     -403.76868929 -60.82593359 -55.16460997 -5.96621551 -6.00714415 -5.96621551 -0.07845959 -0.37697457 -2.27682051 -0.37697457 -0.00013622 -0.00030673 -0.00013622
15b_S22     -393.77223492 -57.81451844 -52.44944383 -5.65252738 -5.67179262 -5.65252738 -0.08244346 -0.34146674 -2.12331738 -0.34146674 -0.00009225 -0.00021996 -0.00009225
16a_S22     -66.30923083 -11.73947758 -10.55006287 -1.21488773 -1.29308182 -1.21488773 -0.01326936 -0.05651009 -0.45624722 -0.05651009 -0.00000923 -0.00002706 -0.00000923
16b_S22     -65.85784036 -10.97763122 -9.87578907 -1.15132437 -1.15156530 -1.15132437 -0.01206189 -0.05992511 -0.43730776 -0.05992511 -0.00000808 -0.00002311 -0.00000808
17a_S22     -197.48165338 -33.25569457 -29.99341845 -3.34959606 -3.49260881 -3.34959606 -0.03670472 -0.18917686 -1.25758127 -0.18917686 -0.00007579 -0.00016938 -0.00007579
17b_S22     -67.12653095 -8.92288871 -8.10981865 -0.86920710 -0.85757803 -0.86920710 -0.00930021 -0.04787134 -0.31076758 -0.04787134 -0.00000099 -0.00000360 -0.00000099
18a_S22     -197.48060169 -33.25680217 -29.99443432 -3.34954502 -3.49267039 -3.34954502 -0.03669474 -0.18916119 -1.25744580 -0.18916119 -0.00007576 -0.00016936 -0.00007576
18b_S22     -48.55152067 -7.65945635 -6.92129263 -0.76855672 -0.81797988 -0.76855672 -0.00795751 -0.03964786 -0.29047501 -0.03964786 -0.00000203 -0.00000701 -0.00000203
19a_S22     -197.48289503 -33.25452630 -29.99232835 -3.34963337 -3.49255455 -3.34963337 -0.03673147 -0.18923844 -1.25799815 -0.18923844 -0.00007595 -0.00016991 -0.00007595
19b_S22     -80.86420851 -12.02616408 -10.86556689 -1.24466018 -1.18556435 -1.24466018 -0.01400281 -0.07145914 -0.47925882 -0.07145914 -0.00000565 -0.00001593 -0.00000565
20a_S22     -197.48128971 -33.25626018 -29.99396859 -3.34949549 -3.49266153 -3.34949549 -0.03672705 -0.18925009 -1.25800653 -0.18925009 -0.00007595 -0.00016993 -0.00007595
20b_S22     -197.48064329 -33.25661053 -29.99433397 -3.34950680 -3.49266647 -3.34950680 -0.03669840 -0.18914100 -1.25740152 -0.18914100 -0.00007547 -0.00016819 -0.00007547
21a_S22     -310.87147892 -50.65008581 -45.77882199 -5.03630135 -5.21443258 -5.03630135 -0.05829622 -0.30160069 -1.91360324 -0.30160069 -0.00014415 -0.00032119 -0.00014415
21b_S22     -197.48406961 -33.25340961 -29.99135760 -3.34960889 -3.49251205 -3.34960889 -0.03677596 -0.18934241 -1.25868721 -0.18934241 -0.00007617 -0.00017047 -0.00007617
22a_S22     -264.11840085 -41.49666268 -37.52837102 -4.12060935 -4.21986675 -4.12060935 -0.04911971 -0.23976134 -1.53872440 -0.23976134 -0.00008552 -0.00019139 -0.00008552
22b_S22     -264.11792238 -41.49703019 -37.52917281 -4.12002296 -4.21989690 -4.12002296 -0.04907935 -0.23973423 -1.53818106 -0.23973423 -0.00008564 -0.00019174 -0.00008564
AM2_BSSE    -66.75011494 -12.49350233 -11.21782360 -1.27659527 -1.43438473 -1.27659527 -0.01392952 -0.05794157 -0.48386739 -0.05794157 -0.00001040 -0.00002865 -0.00001040
AM3_BSSE    -99.88095798 -18.40240803 -16.53990632 -1.86450956 -2.08645508 -1.86450956 -0.02094981 -0.08872139 -0.71060657 -0.08872139 -0.00002181 -0.00005558 -0.00002181
AM4_BSSE    -133.01106106 -24.31199117 -21.86264815 -2.45235912 -2.73862650 -2.45235912 -0.02796011 -0.11959677 -0.93760916 -0.11959677 -0.00003535 -0.00008679 -0.00003535
AM5_BSSE    -166.14093810 -30.22171809 -27.18543797 -3.04025950 -3.39079582 -3.04025950 -0.03497016 -0.15047869 -1.16468022 -0.15047869 -0.00005037 -0.00012097 -0.00005037
AM6_BSSE    -199.27090095 -36.13136573 -32.50819894 -3.62815488 -4.04297507 -3.62815488 -0.04198264 -0.18137959 -1.39180829 -0.18137959 -0.00006633 -0.00015702 -0.00006633
AM7_BSSE    -232.40079084 -42.04107089 -37.83098387 -4.21604407 -4.69514084 -4.21604407 -0.04898914 -0.21227587 -1.61891944 -0.21227587 -0.00008296 -0.00019441 -0.00008296
