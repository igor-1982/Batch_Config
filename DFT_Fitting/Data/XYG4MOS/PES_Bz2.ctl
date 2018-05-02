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
"================================ Total(118) ================================"
"There are about :                                                           " 
" 1)  118 points in the potential energy surfaces of Bz2 PPS                 "

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
#               119 is the total number of jobs in this batch list
__batch__ ::  119
#"Flag"         "DIR"                         "InpName"       "JobType"
# PESs for Bz2 1+118=119
 C6H6           <PATH2>/G2                   XYG3_Comp      energy
#     118 points in Bz2 PESs
 s32            <PATH2>/G2                   XYG3_Comp      energy
 s33            <PATH2>/G2                   XYG3_Comp      energy
 s34            <PATH2>/G2                   XYG3_Comp      energy
 s35            <PATH2>/G2                   XYG3_Comp      energy
 s36            <PATH2>/G2                   XYG3_Comp      energy
 s37            <PATH2>/G2                   XYG3_Comp      energy
 s38            <PATH2>/G2                   XYG3_Comp      energy
 s39            <PATH2>/G2                   XYG3_Comp      energy
 s40            <PATH2>/G2                   XYG3_Comp      energy
 s41            <PATH2>/G2                   XYG3_Comp      energy
 s42            <PATH2>/G2                   XYG3_Comp      energy
 s45            <PATH2>/G2                   XYG3_Comp      energy
 s50            <PATH2>/G2                   XYG3_Comp      energy
 s55            <PATH2>/G2                   XYG3_Comp      energy
 s60            <PATH2>/G2                   XYG3_Comp      energy
 s65            <PATH2>/G2                   XYG3_Comp      energy
 t44            <PATH2>/G2                   XYG3_Comp      energy
 t45            <PATH2>/G2                   XYG3_Comp      energy
 t46            <PATH2>/G2                   XYG3_Comp      energy
 t47            <PATH2>/G2                   XYG3_Comp      energy
 t48            <PATH2>/G2                   XYG3_Comp      energy
 t49            <PATH2>/G2                   XYG3_Comp      energy
 t50            <PATH2>/G2                   XYG3_Comp      energy
 t51            <PATH2>/G2                   XYG3_Comp      energy
 t52            <PATH2>/G2                   XYG3_Comp      energy
 t53            <PATH2>/G2                   XYG3_Comp      energy
 t54            <PATH2>/G2                   XYG3_Comp      energy
 t55            <PATH2>/G2                   XYG3_Comp      energy
 t56            <PATH2>/G2                   XYG3_Comp      energy
 t59            <PATH2>/G2                   XYG3_Comp      energy
 t64            <PATH2>/G2                   XYG3_Comp      energy
 t69            <PATH2>/G2                   XYG3_Comp      energy
 t74            <PATH2>/G2                   XYG3_Comp      energy
 t79            <PATH2>/G2                   XYG3_Comp      energy
 pd32L20        <PATH2>/G2                   XYG3_Comp      energy
 pd32L18        <PATH2>/G2                   XYG3_Comp      energy
 pd32L16        <PATH2>/G2                   XYG3_Comp      energy
 pd32L14        <PATH2>/G2                   XYG3_Comp      energy
 pd32L12        <PATH2>/G2                   XYG3_Comp      energy
 pd32L10        <PATH2>/G2                   XYG3_Comp      energy
 pd32L08        <PATH2>/G2                   XYG3_Comp      energy
 pd32L06        <PATH2>/G2                   XYG3_Comp      energy
 pd32L04        <PATH2>/G2                   XYG3_Comp      energy
 pd32L02        <PATH2>/G2                   XYG3_Comp      energy
 pd32L00        <PATH2>/G2                   XYG3_Comp      energy
 pd32R02        <PATH2>/G2                   XYG3_Comp      energy
 pd32R04        <PATH2>/G2                   XYG3_Comp      energy
 pd32R06        <PATH2>/G2                   XYG3_Comp      energy
 pd32R08        <PATH2>/G2                   XYG3_Comp      energy
 pd32R10        <PATH2>/G2                   XYG3_Comp      energy
 pd32R12        <PATH2>/G2                   XYG3_Comp      energy
 pd32R14        <PATH2>/G2                   XYG3_Comp      energy
 pd32R16        <PATH2>/G2                   XYG3_Comp      energy
 pd32R18        <PATH2>/G2                   XYG3_Comp      energy
 pd32R20        <PATH2>/G2                   XYG3_Comp      energy
 pd34L20        <PATH2>/G2                   XYG3_Comp      energy
 pd34L18        <PATH2>/G2                   XYG3_Comp      energy
 pd34L16        <PATH2>/G2                   XYG3_Comp      energy
 pd34L14        <PATH2>/G2                   XYG3_Comp      energy
 pd34L12        <PATH2>/G2                   XYG3_Comp      energy
 pd34L10        <PATH2>/G2                   XYG3_Comp      energy
 pd34L08        <PATH2>/G2                   XYG3_Comp      energy
 pd34L06        <PATH2>/G2                   XYG3_Comp      energy
 pd34L04        <PATH2>/G2                   XYG3_Comp      energy
 pd34L02        <PATH2>/G2                   XYG3_Comp      energy
 pd34L00        <PATH2>/G2                   XYG3_Comp      energy
 pd34R02        <PATH2>/G2                   XYG3_Comp      energy
 pd34R04        <PATH2>/G2                   XYG3_Comp      energy
 pd34R06        <PATH2>/G2                   XYG3_Comp      energy
 pd34R08        <PATH2>/G2                   XYG3_Comp      energy
 pd34R10        <PATH2>/G2                   XYG3_Comp      energy
 pd34R12        <PATH2>/G2                   XYG3_Comp      energy
 pd34R14        <PATH2>/G2                   XYG3_Comp      energy
 pd34R16        <PATH2>/G2                   XYG3_Comp      energy
 pd34R18        <PATH2>/G2                   XYG3_Comp      energy
 pd34R20        <PATH2>/G2                   XYG3_Comp      energy
 pd36L20        <PATH2>/G2                   XYG3_Comp      energy
 pd36L18        <PATH2>/G2                   XYG3_Comp      energy
 pd36L16        <PATH2>/G2                   XYG3_Comp      energy
 pd36L14        <PATH2>/G2                   XYG3_Comp      energy
 pd36L12        <PATH2>/G2                   XYG3_Comp      energy
 pd36L10        <PATH2>/G2                   XYG3_Comp      energy
 pd36L08        <PATH2>/G2                   XYG3_Comp      energy
 pd36L06        <PATH2>/G2                   XYG3_Comp      energy
 pd36L04        <PATH2>/G2                   XYG3_Comp      energy
 pd36L02        <PATH2>/G2                   XYG3_Comp      energy
 pd36L00        <PATH2>/G2                   XYG3_Comp      energy
 pd36R02        <PATH2>/G2                   XYG3_Comp      energy
 pd36R04        <PATH2>/G2                   XYG3_Comp      energy
 pd36R06        <PATH2>/G2                   XYG3_Comp      energy
 pd36R08        <PATH2>/G2                   XYG3_Comp      energy
 pd36R10        <PATH2>/G2                   XYG3_Comp      energy
 pd36R12        <PATH2>/G2                   XYG3_Comp      energy
 pd36R14        <PATH2>/G2                   XYG3_Comp      energy
 pd36R16        <PATH2>/G2                   XYG3_Comp      energy
 pd36R18        <PATH2>/G2                   XYG3_Comp      energy
 pd36R20        <PATH2>/G2                   XYG3_Comp      energy
 pd38L20        <PATH2>/G2                   XYG3_Comp      energy
 pd38L18        <PATH2>/G2                   XYG3_Comp      energy
 pd38L16        <PATH2>/G2                   XYG3_Comp      energy
 pd38L14        <PATH2>/G2                   XYG3_Comp      energy
 pd38L12        <PATH2>/G2                   XYG3_Comp      energy
 pd38L10        <PATH2>/G2                   XYG3_Comp      energy
 pd38L08        <PATH2>/G2                   XYG3_Comp      energy
 pd38L06        <PATH2>/G2                   XYG3_Comp      energy
 pd38L04        <PATH2>/G2                   XYG3_Comp      energy
 pd38L02        <PATH2>/G2                   XYG3_Comp      energy
 pd38L00        <PATH2>/G2                   XYG3_Comp      energy
 pd38R02        <PATH2>/G2                   XYG3_Comp      energy
 pd38R04        <PATH2>/G2                   XYG3_Comp      energy
 pd38R06        <PATH2>/G2                   XYG3_Comp      energy
 pd38R08        <PATH2>/G2                   XYG3_Comp      energy
 pd38R10        <PATH2>/G2                   XYG3_Comp      energy
 pd38R12        <PATH2>/G2                   XYG3_Comp      energy
 pd38R14        <PATH2>/G2                   XYG3_Comp      energy
 pd38R16        <PATH2>/G2                   XYG3_Comp      energy
 pd38R18        <PATH2>/G2                   XYG3_Comp      energy
 pd38R20        <PATH2>/G2                   XYG3_Comp      energy

# Training set for the atomization energy
#              118 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 118  1.0
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
# "118 points in PESs of Bz2"
 2         s32      1   C6H6  -2                         0.00591544   30.0
 2         s33      1   C6H6  -2                         0.00267087   30.0
 2         s34      1   C6H6  -2                         0.00047967   30.0
 2         s35      1   C6H6  -2                        -0.00098006   30.0
 2         s36      1   C6H6  -2                        -0.00188842   30.0
 2         s37      1   C6H6  -2                        -0.00241112   30.0
 2         s38      1   C6H6  -2                        -0.00264856   30.0
 2         s39      1   C6H6  -2                        -0.00271071   30.0
 2         s40      1   C6H6  -2                        -0.00265334   30.0
 2         s41      1   C6H6  -2                        -0.00251948   30.0
 2         s42      1   C6H6  -2                        -0.00232506   30.0
 2         s45      1   C6H6  -2                        -0.00172268   30.0
 2         s50      1   C6H6  -2                        -0.00091632   30.0
 2         s55      1   C6H6  -2                        -0.00043665   30.0
 2         s60      1   C6H6  -2                        -0.00018167   30.0
 2         s65      1   C6H6  -2                        -0.00005737   30.0
 2         t44      1   C6H6  -2                         0.00174977   30.0
 2         t45      1   C6H6  -2                        -0.00063425   30.0
 2         t46      1   C6H6  -2                        -0.00222785   30.0
 2         t47      1   C6H6  -2                        -0.00323660   30.0
 2         t48      1   C6H6  -2                        -0.00381827   30.0
 2         t49      1   C6H6  -2                        -0.00409555   30.0
 2         t50      1   C6H6  -2                        -0.00415930   30.0
 2         t51      1   C6H6  -2                        -0.00407962   30.0
 2         t52      1   C6H6  -2                        -0.00390910   30.0
 2         t53      1   C6H6  -2                        -0.00368281   30.0
 2         t54      1   C6H6  -2                        -0.00342624   30.0
 2         t55      1   C6H6  -2                        -0.00316011   30.0
 2         t56      1   C6H6  -2                        -0.00289557   30.0
 2         t59      1   C6H6  -2                        -0.00217367   30.0
 2         t64      1   C6H6  -2                        -0.00131631   30.0
 2         t69      1   C6H6  -2                        -0.00081114   30.0
 2         t74      1   C6H6  -2                        -0.00051792   30.0
 2         t79      1   C6H6  -2                        -0.00034262   30.0
 2         pd32L20  1   C6H6  -2                        -0.00290035   30.0
 2         pd32L18  1   C6H6  -2                        -0.00290832   30.0
 2         pd32L16  1   C6H6  -2                        -0.00270593   30.0
 2         pd32L14  1   C6H6  -2                        -0.00218961   30.0
 2         pd32L12  1   C6H6  -2                        -0.00129878   30.0
 2         pd32L10  1   C6H6  -2                        -0.00005259   30.0
 2         pd32L08  1   C6H6  -2                         0.00148045   30.0
 2         pd32L06  1   C6H6  -2                         0.00309636   30.0
 2         pd32L04  1   C6H6  -2                         0.00453220   30.0
 2         pd32L02  1   C6H6  -2                         0.00555848   30.0
 2         pd32L00  1   C6H6  -2                         0.00591544   30.0
 2         pd32R02  1   C6H6  -2                         0.00555848   30.0
 2         pd32R04  1   C6H6  -2                         0.00453220   30.0
 2         pd32R06  1   C6H6  -2                         0.00309636   30.0
 2         pd32R08  1   C6H6  -2                         0.00148045   30.0
 2         pd32R10  1   C6H6  -2                        -0.00005259   30.0
 2         pd32R12  1   C6H6  -2                        -0.00129878   30.0
 2         pd32R14  1   C6H6  -2                        -0.00218961   30.0
 2         pd32R16  1   C6H6  -2                        -0.00270593   30.0
 2         pd32R18  1   C6H6  -2                        -0.00290832   30.0
 2         pd32R20  1   C6H6  -2                        -0.00290035   30.0
 2         pd34L20  1   C6H6  -2                        -0.00401906   30.0
 2         pd34L18  1   C6H6  -2                        -0.00410671   30.0
 2         pd34L16  1   C6H6  -2                        -0.00405253   30.0
 2         pd34L14  1   C6H6  -2                        -0.00381189   30.0
 2         pd34L12  1   C6H6  -2                        -0.00335134   30.0
 2         pd34L10  1   C6H6  -2                        -0.00268362   30.0
 2         pd34L08  1   C6H6  -2                        -0.00186451   30.0
 2         pd34L06  1   C6H6  -2                        -0.00101034   30.0
 2         pd34L04  1   C6H6  -2                        -0.00026454   30.0
 2         pd34L02  1   C6H6  -2                         0.00027569   30.0
 2         pd34L00  1   C6H6  -2                         0.00047967   30.0
 2         pd34R02  1   C6H6  -2                         0.00027569   30.0
 2         pd34R04  1   C6H6  -2                        -0.00026454   30.0
 2         pd34R06  1   C6H6  -2                        -0.00101034   30.0
 2         pd34R08  1   C6H6  -2                        -0.00186451   30.0
 2         pd34R10  1   C6H6  -2                        -0.00268362   30.0
 2         pd34R12  1   C6H6  -2                        -0.00335134   30.0
 2         pd34R14  1   C6H6  -2                        -0.00381189   30.0
 2         pd34R16  1   C6H6  -2                        -0.00405253   30.0
 2         pd34R18  1   C6H6  -2                        -0.00410671   30.0
 2         pd34R20  1   C6H6  -2                        -0.00401906   30.0
 2         pd36L20  1   C6H6  -2                        -0.00406846   30.0
 2         pd36L18  1   C6H6  -2                        -0.00416089   30.0
 2         pd36L16  1   C6H6  -2                        -0.00418001   30.0
 2         pd36L14  1   C6H6  -2                        -0.00407962   30.0
 2         pd36L12  1   C6H6  -2                        -0.00385651   30.0
 2         pd36L10  1   C6H6  -2                        -0.00351229   30.0
 2         pd36L08  1   C6H6  -2                        -0.00308680   30.0
 2         pd36L06  1   C6H6  -2                        -0.00262944   30.0
 2         pd36L04  1   C6H6  -2                        -0.00223901   30.0
 2         pd36L02  1   C6H6  -2                        -0.00197288   30.0
 2         pd36L00  1   C6H6  -2                        -0.00188842   30.0
 2         pd36R02  1   C6H6  -2                        -0.00197288   30.0
 2         pd36R04  1   C6H6  -2                        -0.00223901   30.0
 2         pd36R06  1   C6H6  -2                        -0.00262944   30.0
 2         pd36R08  1   C6H6  -2                        -0.00308680   30.0
 2         pd36R10  1   C6H6  -2                        -0.00351229   30.0
 2         pd36R12  1   C6H6  -2                        -0.00385651   30.0
 2         pd36R14  1   C6H6  -2                        -0.00407962   30.0
 2         pd36R16  1   C6H6  -2                        -0.00418001   30.0
 2         pd36R18  1   C6H6  -2                        -0.00416089   30.0
 2         pd36R20  1   C6H6  -2                        -0.00406846   30.0
 2         pd38L20  1   C6H6  -2                        -0.00363978   30.0
 2         pd38L18  1   C6H6  -2                        -0.00374018   30.0
 2         pd38L16  1   C6H6  -2                        -0.00378480   30.0
 2         pd38L14  1   C6H6  -2                        -0.00374177   30.0
 2         pd38L12  1   C6H6  -2                        -0.00363500   30.0
 2         pd38L10  1   C6H6  -2                        -0.00346608   30.0
 2         pd38L08  1   C6H6  -2                        -0.00324935   30.0
 2         pd38L06  1   C6H6  -2                        -0.00301668   30.0
 2         pd38L04  1   C6H6  -2                        -0.00280314   30.0
 2         pd38L02  1   C6H6  -2                        -0.00267725   30.0
 2         pd38L00  1   C6H6  -2                        -0.00264856   30.0
 2         pd38R02  1   C6H6  -2                        -0.00267725   30.0
 2         pd38R04  1   C6H6  -2                        -0.00280314   30.0
 2         pd38R06  1   C6H6  -2                        -0.00301668   30.0
 2         pd38R08  1   C6H6  -2                        -0.00324935   30.0
 2         pd38R10  1   C6H6  -2                        -0.00346608   30.0
 2         pd38R12  1   C6H6  -2                        -0.00363500   30.0
 2         pd38R14  1   C6H6  -2                        -0.00374177   30.0
 2         pd38R16  1   C6H6  -2                        -0.00378480   30.0
 2         pd38R18  1   C6H6  -2                        -0.00374018   30.0
 2         pd38R20  1   C6H6  -2                        -0.00363978   30.0

__xyg3 components__ :: 119 
#              E_noXC         E_K           Ex_LDA         dEx_Becke       Ec_VWN       dEc_LYP        PT2_1ST        PT2_MOS
C6H6    -197.47515157    -33.26188449    -29.99851455    -3.34847455    -3.49320032    2.10210932    -0.03668803    -1.42228098
s32    -394.89867133    -66.54872551    -60.04029709    -6.67224611    -6.99251878    4.19892869    -0.07415920    -2.88855186
s33    -394.91039097    -66.54319740    -60.03177598    -6.67552200    -6.99153975    4.19966035    -0.07408337    -2.88280250
s34    -394.91958752    -66.53860751    -60.02480478    -6.67838519    -6.99071648    4.20031320    -0.07401488    -2.87785642
s35    -394.92672451    -66.53494405    -60.01912780    -6.68093291    -6.99001420    4.20089099    -0.07395400    -2.87359078
s36    -394.93224447    -66.53204743    -60.01451465    -6.68315747    -6.98941054    4.20139358    -0.07389957    -2.86990212
s37    -394.93654625    -66.52973730    -60.01078090    -6.68506054    -6.98890675    4.20183449    -0.07384813    -2.86671051
s38    -394.93985867    -66.52794551    -60.00778323    -6.68673339    -6.98848371    4.20222158    -0.07380035    -2.86394715
s39    -394.94234969    -66.52662177    -60.00539808    -6.68824433    -6.98811814    4.20255659    -0.07375776    -2.86155195
s40    -394.94425041    -66.52562446    -60.00350234    -6.68956695    -6.98781297    4.20284828    -0.07371863    -2.85947704
s41    -394.94577650    -66.52480446    -60.00198521    -6.69066365    -6.98757970    4.20310922    -0.07368072    -2.85768396
s42    -394.94698034    -66.52415436    -60.00077737    -6.69158810    -6.98739782    4.20333829    -0.07364517    -2.85613504
s45    -394.94867163    -66.52348281    -59.99862320    -6.69390313    -6.98691912    4.20378684    -0.07355768    -2.85262093
s50    -394.94974245    -66.52319521    -59.99726192    -6.69580665    -6.98660908    4.20416676    -0.07346040    -2.84922565
s55    -394.95001242    -66.52329906    -59.99694277    -6.69655245    -6.98649557    4.20426965    -0.07341575    -2.84743287
s60    -394.95008029    -66.52343967    -59.99688887    -6.69683361    -6.98643960    4.20426640    -0.07339692    -2.84639987
s65    -394.95017021    -66.52348604    -59.99684767    -6.69695196    -6.98640917    4.20424488    -0.07338852    -2.84576151
t44    -394.91151563    -66.54830898    -60.03480519    -6.67552443    -6.99132386    4.19925570    -0.07415920    -2.86913093
t45    -394.92033496    -66.54362894    -60.02804150    -6.67821540    -6.99058596    4.19985412    -0.07408337    -2.86599754
t46    -394.92728137    -66.53979773    -60.02243245    -6.68059801    -6.98995079    4.20039781    -0.07401488    -2.86328033
t47    -394.93272201    -66.53667533    -60.01780203    -6.68271029    -6.98940701    4.20089126    -0.07395400    -2.86092648
t48    -394.93696234    -66.53414278    -60.01398941    -6.68457710    -6.98894298    4.20133700    -0.07389957    -2.85888520
t49    -394.94025143    -66.53209810    -60.01085904    -6.68621999    -6.98854861    4.20173713    -0.07384813    -2.85711728
t50    -394.94259351    -66.53057359    -60.00850071    -6.68755027    -6.98824064    4.20206534    -0.07380035    -2.85570636
t51    -394.94471648    -66.52912322    -60.00622645    -6.68893333    -6.98793143    4.20241056    -0.07375776    -2.85424967
t52    -394.94617662    -66.52810683    -60.00454157    -6.69004041    -6.98769280    4.20269045    -0.07371863    -2.85308856
t53    -394.94727579    -66.52729072    -60.00317829    -6.69101125    -6.98749140    4.20293689    -0.07368072    -2.85207534
t54    -394.94808961    -66.52666055    -60.00208060    -6.69186224    -6.98732196    4.20315300    -0.07364517    -2.85118381
t55    -394.94869066    -66.52615603    -60.00119734    -6.69260080    -6.98717921    4.20334059    -0.07355768    -2.85040104
t56    -394.94912434    -66.52577838    -60.00048454    -6.69323963    -6.98705805    4.20350126    -0.07346040    -2.84971893
t59    -394.94980928    -66.52507283    -59.99908079    -6.69468724    -6.98680177    4.20385298    -0.07341575    -2.84813609
t64    -394.95007384    -66.52461128    -59.99805315    -6.69596601    -6.98658847    4.20413514    -0.07339692    -2.84657758
t69    -394.95015031    -66.52433819    -59.99761507    -6.69651419    -6.98649463    4.20421237    -0.07338852    -2.84575773
t74    -394.95018810    -66.52418034    -59.99739550    -6.69674003    -6.98645028    4.20422284    -0.07336178    -2.84529899
t79    -394.95021169    -66.52409656    -59.99727546    -6.69683459    -6.98642811    4.20421994    -0.07336488    -2.84502816
pd32L20    -394.92756606    -66.53628769    -60.02159270    -6.67827600    -6.99029173    4.20003280    -0.07415920    -2.87290612
pd32L18    -394.92597639    -66.53706140    -60.02310786    -6.67710765    -6.99052527    4.19975695    -0.07408337    -2.87481228
pd32L16    -394.92396710    -66.53795480    -60.02482354    -6.67601947    -6.99077094    4.19950882    -0.07401488    -2.87675177
pd32L14    -394.92137630    -66.53909461    -60.02679476    -6.67503812    -6.99103543    4.19930050    -0.07395400    -2.87875945
pd32L12    -394.91814415    -66.54047902    -60.02903156    -6.67418971    -6.99132260    4.19914330    -0.07389957    -2.88076832
pd32L10    -394.91424049    -66.54215602    -60.03147655    -6.67351362    -6.99159794    4.19902494    -0.07384813    -2.88275236
pd32L08    -394.90993359    -66.54409176    -60.03400681    -6.67299841    -6.99186888    4.19895276    -0.07380035    -2.88458614
pd32L06    -394.90569652    -66.54587469    -60.03642159    -6.67263540    -6.99212266    4.19892226    -0.07375776    -2.88619699
pd32L04    -394.90203673    -66.54740717    -60.03844772    -6.67240525    -6.99232854    4.19891615    -0.07371863    -2.88745283
pd32L02    -394.89955861    -66.54836527    -60.03981448    -6.67228269    -6.99246898    4.19892389    -0.07368072    -2.88826375
pd32L00    -394.89867133    -66.54872551    -60.04029709    -6.67224611    -6.99251878    4.19892869    -0.07415920    -2.88855186
pd32R02    -394.89955861    -66.54836527    -60.03981448    -6.67228269    -6.99246898    4.19892389    -0.07368072    -2.88826375
pd32R04    -394.90203673    -66.54740717    -60.03844772    -6.67240525    -6.99232854    4.19891615    -0.07371863    -2.88745283
pd32R06    -394.90569652    -66.54587469    -60.03642159    -6.67263540    -6.99212266    4.19892226    -0.07375776    -2.88619699
pd32R08    -394.90993359    -66.54409176    -60.03400681    -6.67299841    -6.99186888    4.19895276    -0.07380035    -2.88458614
pd32R10    -394.91424049    -66.54215602    -60.03147655    -6.67351362    -6.99159794    4.19902494    -0.07384813    -2.88275236
pd32R12    -394.91814415    -66.54047902    -60.02903156    -6.67418971    -6.99132260    4.19914330    -0.07389957    -2.88076832
pd32R14    -394.92137630    -66.53909461    -60.02679476    -6.67503812    -6.99103543    4.19930050    -0.07395400    -2.87875945
pd32R16    -394.92396710    -66.53795480    -60.02482354    -6.67601947    -6.99077094    4.19950882    -0.07401488    -2.87675177
pd32R18    -394.92597639    -66.53706140    -60.02310786    -6.67710765    -6.99052527    4.19975695    -0.07408337    -2.87481228
pd32R20    -394.92756606    -66.53628769    -60.02159270    -6.67827600    -6.99029173    4.20003280    -0.07415920    -2.87290612
pd34L20    -394.93717394    -66.53119462    -60.01279471    -6.68301480    -6.98914452    4.20117597    -0.07415920    -2.86643454
pd34L18    -394.93628424    -66.53138438    -60.01374286    -6.68214400    -6.98931514    4.20097385    -0.07408337    -2.86788648
pd34L16    -394.93506127    -66.53186511    -60.01483569    -6.68133019    -6.98949158    4.20079051    -0.07401488    -2.86936534
pd34L14    -394.93342687    -66.53255407    -60.01610841    -6.68060150    -6.98967111    4.20062997    -0.07395400    -2.87086639
pd34L12    -394.93135099    -66.53358116    -60.01756211    -6.67997457    -6.98986293    4.20050387    -0.07389957    -2.87236226
pd34L10    -394.92895384    -66.53461080    -60.01916019    -6.67944974    -6.99006568    4.20041454    -0.07384813    -2.87379775
pd34L08    -394.92635093    -66.53572618    -60.02080294    -6.67903843    -6.99026380    4.20035763    -0.07380035    -2.87509036
pd34L06    -394.92380177    -66.53680999    -60.02235406    -6.67874036    -6.99044574    4.20032930    -0.07375776    -2.87621616
pd34L04    -394.92158061    -66.53776765    -60.02364008    -6.67854525    -6.99057901    4.20031059    -0.07371863    -2.87709012
pd34L02    -394.92010134    -66.53832344    -60.02449945    -6.67843118    -6.99067185    4.20030673    -0.07368072    -2.87764994
pd34L00    -394.91958752    -66.53860751    -60.02480478    -6.67838519    -6.99071648    4.20031320    -0.07401488    -2.87785642
pd34R02    -394.92010134    -66.53832344    -60.02449945    -6.67843118    -6.99067185    4.20030673    -0.07368072    -2.87764994
pd34R04    -394.92158061    -66.53776765    -60.02364008    -6.67854525    -6.99057901    4.20031059    -0.07371863    -2.87709012
pd34R06    -394.92380177    -66.53680999    -60.02235406    -6.67874036    -6.99044574    4.20032930    -0.07375776    -2.87621616
pd34R08    -394.92635093    -66.53572618    -60.02080294    -6.67903843    -6.99026380    4.20035763    -0.07380035    -2.87509036
pd34R10    -394.92895384    -66.53461080    -60.01916019    -6.67944974    -6.99006568    4.20041454    -0.07384813    -2.87379775
pd34R12    -394.93135099    -66.53358116    -60.01756211    -6.67997457    -6.98986293    4.20050387    -0.07389957    -2.87236226
pd34R14    -394.93342687    -66.53255407    -60.01610841    -6.68060150    -6.98967111    4.20062997    -0.07395400    -2.87086639
pd34R16    -394.93506127    -66.53186511    -60.01483569    -6.68133019    -6.98949158    4.20079051    -0.07401488    -2.86936534
pd34R18    -394.93628424    -66.53138438    -60.01374286    -6.68214400    -6.98931514    4.20097385    -0.07408337    -2.86788648
pd34R20    -394.93717394    -66.53119462    -60.01279471    -6.68301480    -6.98914452    4.20117597    -0.07415920    -2.86643454
pd36L20    -394.94288015    -66.52782865    -60.00704405    -6.68662899    -6.98833321    4.20206282    -0.07415920    -2.86153021
pd36L18    -394.94231011    -66.52803983    -60.00761820    -6.68599209    -6.98844308    4.20191086    -0.07408337    -2.86264374
pd36L16    -394.94159721    -66.52812593    -60.00829229    -6.68539600    -6.98856382    4.20177518    -0.07401488    -2.86377398
pd36L14    -394.94059144    -66.52863529    -60.00908899    -6.68484389    -6.98869701    4.20165995    -0.07395400    -2.86490336
pd36L12    -394.93936438    -66.52911010    -60.01000573    -6.68436247    -6.98883875    4.20156840    -0.07389957    -2.86599969
pd36L10    -394.93787800    -66.52973141    -60.01101300    -6.68397395    -6.98897069    4.20149414    -0.07384813    -2.86703064
pd36L08    -394.93627287    -66.53040974    -60.01204448    -6.68367053    -6.98909736    4.20144191    -0.07380035    -2.86794738
pd36L06    -394.93473216    -66.53104621    -60.01300910    -6.68344234    -6.98921794    4.20141281    -0.07375776    -2.86874482
pd36L04    -394.93345439    -66.53144818    -60.01380401    -6.68328297    -6.98931773    4.20139822    -0.07371863    -2.86935761
pd36L02    -394.93257297    -66.53183751    -60.01433003    -6.68318872    -6.98938675    4.20139438    -0.07368072    -2.86975232
pd36L00    -394.93224447    -66.53204743    -60.01451465    -6.68315747    -6.98941054    4.20139358    -0.07389957    -2.86990212
pd36R02    -394.93257297    -66.53183751    -60.01433003    -6.68318872    -6.98938675    4.20139438    -0.07368072    -2.86975232
pd36R04    -394.93345439    -66.53144818    -60.01380401    -6.68328297    -6.98931773    4.20139822    -0.07371863    -2.86935761
pd36R06    -394.93473216    -66.53104621    -60.01300910    -6.68344234    -6.98921794    4.20141281    -0.07375776    -2.86874482
pd36R08    -394.93627287    -66.53040974    -60.01204448    -6.68367053    -6.98909736    4.20144191    -0.07380035    -2.86794738
pd36R10    -394.93787800    -66.52973141    -60.01101300    -6.68397395    -6.98897069    4.20149414    -0.07384813    -2.86703064
pd36R12    -394.93936438    -66.52911010    -60.01000573    -6.68436247    -6.98883875    4.20156840    -0.07389957    -2.86599969
pd36R14    -394.94059144    -66.52863529    -60.00908899    -6.68484389    -6.98869701    4.20165995    -0.07395400    -2.86490336
pd36R16    -394.94159721    -66.52812593    -60.00829229    -6.68539600    -6.98856382    4.20177518    -0.07401488    -2.86377398
pd36R18    -394.94231011    -66.52803983    -60.00761820    -6.68599209    -6.98844308    4.20191086    -0.07408337    -2.86264374
pd36R20    -394.94288015    -66.52782865    -60.00704405    -6.68662899    -6.98833321    4.20206282    -0.07415920    -2.86153021
pd38L20    -394.94618887    -66.52580503    -60.00332625    -6.68936504    -6.98776034    4.20273670    -0.07415920    -2.85781549
pd38L18    -394.94590453    -66.52574992    -60.00366518    -6.68888905    -6.98784525    4.20263273    -0.07408337    -2.85867009
pd38L16    -394.94546771    -66.52582763    -60.00406702    -6.68845080    -6.98792881    4.20253550    -0.07401488    -2.85952370
pd38L14    -394.94485932    -66.52600503    -60.00454805    -6.68805881    -6.98801213    4.20244767    -0.07395400    -2.86036057
pd38L12    -394.94408611    -66.52640741    -60.00510107    -6.68770633    -6.98810649    4.20237817    -0.07389957    -2.86116529
pd38L10    -394.94321245    -66.52671885    -60.00571043    -6.68740238    -6.98820152    4.20232313    -0.07384813    -2.86191694
pd38L08    -394.94228612    -66.52705103    -60.00632951    -6.68715106    -6.98829593    4.20228468    -0.07380035    -2.86257007
pd38L06    -394.94139039    -66.52736916    -60.00690151    -6.68696292    -6.98838032    4.20226016    -0.07375776    -2.86313619
pd38L04    -394.94059699    -66.52766366    -60.00736763    -6.68683574    -6.98843539    4.20223823    -0.07371863    -2.86356577
pd38L02    -394.94006471    -66.52779729    -60.00767410    -6.68676066    -6.98846925    4.20222447    -0.07368072    -2.86384263
pd38L00    -394.93985867    -66.52794551    -60.00778323    -6.68673339    -6.98848371    4.20222158    -0.07380035    -2.86394715
pd38R02    -394.94006471    -66.52779729    -60.00767410    -6.68676066    -6.98846925    4.20222447    -0.07368072    -2.86384263
pd38R04    -394.94059699    -66.52766366    -60.00736763    -6.68683574    -6.98843539    4.20223823    -0.07371863    -2.86356577
pd38R06    -394.94139039    -66.52736916    -60.00690151    -6.68696292    -6.98838032    4.20226016    -0.07375776    -2.86313619
pd38R08    -394.94228612    -66.52705103    -60.00632951    -6.68715106    -6.98829593    4.20228468    -0.07380035    -2.86257007
pd38R10    -394.94321245    -66.52671885    -60.00571043    -6.68740238    -6.98820152    4.20232313    -0.07384813    -2.86191694
pd38R12    -394.94408611    -66.52640741    -60.00510107    -6.68770633    -6.98810649    4.20237817    -0.07389957    -2.86116529
pd38R14    -394.94485932    -66.52600503    -60.00454805    -6.68805881    -6.98801213    4.20244767    -0.07395400    -2.86036057
pd38R16    -394.94546771    -66.52582763    -60.00406702    -6.68845080    -6.98792881    4.20253550    -0.07401488    -2.85952370
pd38R18    -394.94590453    -66.52574992    -60.00366518    -6.68888905    -6.98784525    4.20263273    -0.07408337    -2.85867009
pd38R20    -394.94618887    -66.52580503    -60.00332625    -6.68936504    -6.98776034    4.20273670    -0.07415920    -2.85781549
