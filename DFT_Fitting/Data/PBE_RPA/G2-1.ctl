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
#0.55, 0.21, 0.60, 0.21
#0.21, 0.60
#0.55, 0.21, 0.21
#5.83862393E-01  8.16220860E-01  1.68055499E-01
0.51, 0.60

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
    a1, a3 = C
    #a1  = 0.
    a2  = 1.-a1 
    a4  = 1.-a3
    a5  = 0.

    E_noXC, Ex_HF, Ex_PBE, Ec_PBE, Ec_RPA, Ec_PT2 = P
    return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE \
           + a4*Ec_RPA + a5*Ec_PT2

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
#               72 = 17+55 is the total number of jobs in this batch list
__batch__ ::  72
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
# G2 set 55
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

# Training set for the atomization energy
#              358 = 223+38+38+31+22+6 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 55  1.0
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

#                72 = 17+55 is the total number of jobs in this batch list
__xyg3 components__ ::  72
#        E_noXC            E_K              Ex_PBE          Ec_PBE        Ec_RPA        Ec_PT2
# 17 atoms
   H_0    -0.19181462     -0.30758978     -0.30231676    -0.00572346    -0.01968641     0.00000000
  He_0    -1.84572172     -1.01439334     -1.00581730    -0.04111129    -0.08006674    -0.04690564
  Li_0    -5.65812016     -1.77351868     -1.75175382    -0.05128249    -0.05542113    -0.01931314
  Be_0   -11.90820037     -2.66313538     -2.63509187    -0.08567734    -0.12559146    -0.09675035
   B_0   -20.77335981     -3.75616329     -3.72493023    -0.11277081    -0.17494343    -0.12107541
   C_0   -32.63344793     -5.05523682     -5.01964180    -0.14407721    -0.22489422    -0.15057963
   N_0   -47.81969697     -6.57932238     -6.53486971    -0.17897700    -0.26275318    -0.18286088
   O_0   -66.62806222     -8.18275248     -8.15001499    -0.23358396    -0.34480380    -0.25513989
   F_0   -89.40433410    -10.00170244     -9.97720246    -0.29000648    -0.42495939    -0.33664264
  Ne_0  -116.47636719    -12.05900953    -12.03618057    -0.34775487    -0.49113480    -0.42470203
  Na_0  -147.89254788    -13.96085035    -13.90591974    -0.36975089    -0.04164281    -0.01811929
  Mg_0  -183.66731364    -15.94231244    -15.87268899    -0.41008235    -0.11860024    -0.09713169
  Al_0  -223.83659242    -18.03591752    -17.95240255    -0.44426760    -0.15621019    -0.11824422
  Si_0  -268.60652050    -20.24497438    -20.13938992    -0.48370274    -0.21838429    -0.16698170
   P_0  -318.12249259    -22.59083619    -22.46275928    -0.52552638    -0.26511291    -0.21499301
   S_0  -372.52667509    -24.97829103    -24.83720452    -0.58373819    -0.34180900    -0.28054679
  Cl_0  -431.99173437    -27.48910326    -27.33386641    -0.64379507    -0.41187057    -0.34824729
# 223 molecules in G3 set
  G2-1    -5.85970030     -2.12479649     -2.10326200    -0.08344263    -0.10902083    -0.07164721
  G2-2   -12.08413301     -3.06479110     -3.03040944    -0.10310117    -0.14852440    -0.08538035
  G2-3   -32.87560744     -5.40099889     -5.37199103    -0.18432075    -0.28634616    -0.21546135
  G2-4   -33.08652011     -5.84622629     -5.80609022    -0.21445964    -0.30762289    -0.22566932
  G2-5   -33.11959962     -5.76701698     -5.73882696    -0.22350988    -0.34598698    -0.28698670
  G2-6   -33.36700209     -6.20542507     -6.16529524    -0.25879470    -0.37142760    -0.28871014
  G2-7   -33.63769518     -6.56918470     -6.52917970    -0.29983071    -0.43337652    -0.35245441
  G2-8   -48.06637640     -6.91085225     -6.88265468    -0.22502849    -0.33481923    -0.25610030
  G2-9   -48.31493183     -7.26681623     -7.24794238    -0.27037524    -0.40390400    -0.33434561
 G2-10   -48.56352228     -7.65054004     -7.63541188    -0.31467977    -0.46855493    -0.41302322
 G2-11   -66.88207167     -8.53508198     -8.52388523    -0.27992043    -0.42160114    -0.35169152
 G2-12   -67.13443086     -8.92103031     -8.92326389    -0.32550628    -0.49284825    -0.45180938
 G2-13   -89.66727783    -10.39116115    -10.39338566    -0.33585542    -0.50134057    -0.45647637
 G2-14  -269.08548059    -20.93575010    -20.82525069    -0.55407269    -0.32675765    -0.26659138
 G2-15  -269.04106885    -20.97229132    -20.85391968    -0.54420294    -0.30001068    -0.22511319
 G2-16  -269.29896697    -21.33043425    -21.20370583    -0.58090020    -0.35399581    -0.26859636
 G2-17  -269.55300637    -21.69589645    -21.55970212    -0.61568663    -0.40643370    -0.31225637
 G2-18  -318.62010456    -23.25869581    -23.13080391    -0.60529608    -0.38212593    -0.31439905
 G2-19  -318.87008433    -23.60784503    -23.47742797    -0.64328058    -0.43862301    -0.36966952
 G2-20  -373.04245904    -25.66446502    -25.52757208    -0.66669283    -0.45949484    -0.40591327
 G2-21  -432.25981258    -27.84275213    -27.69174502    -0.68681779    -0.46878492    -0.42087276
 G2-22   -11.32396764     -3.54426455     -3.50672790    -0.12397256    -0.14024203    -0.10163437
 G2-23   -95.06126114    -11.91392475    -11.91783189    -0.37602801    -0.54157143    -0.51327025
 G2-24   -65.85847024    -10.98017499    -10.96730012    -0.43007195    -0.63794861    -0.62022535
 G2-25   -66.32481631    -11.72589808    -11.68627551    -0.49447132    -0.71574449    -0.63216015
 G2-26   -66.77947965    -12.46660950    -12.39828714    -0.55942800    -0.79408020    -0.66574882
 G2-27   -80.59737649    -11.60296555    -11.64853654    -0.40034163    -0.64973210    -0.73547598
 G2-28   -80.85914679    -12.03748972    -12.05213059    -0.44020982    -0.67534769    -0.69071808
 G2-29   -99.47521090    -13.29345620    -13.31481486    -0.44855641    -0.69081162    -0.69746434
 G2-30   -99.62619458    -13.65130962    -13.67580803    -0.47805156    -0.73194928    -0.71787726
 G2-31   -99.85288276    -14.04479803    -14.05674905    -0.51499289    -0.77869020    -0.74370912
 G2-32  -100.27531070    -14.80180918    -14.78083799    -0.58127765    -0.85369546    -0.76186162
 G2-33   -95.87202795    -13.10145859    -13.13170819    -0.45192843    -0.70476858    -0.73690423
 G2-34   -96.61692233    -14.59670066    -14.58543756    -0.58599049    -0.86616492    -0.78488581
 G2-35  -114.59140043    -14.69155903    -14.73831691    -0.49050695    -0.76882651    -0.78093885
 G2-36  -133.35791076    -16.30369792    -16.36564803    -0.52951959    -0.82833192    -0.82966625
 G2-37  -133.77971086    -17.04581700    -17.09334789    -0.59970296    -0.92933864    -0.89325338
 G2-38  -178.84093396    -19.90557868    -19.97229468    -0.61480491    -0.96166860    -0.93333063
 G2-39  -166.11599295    -21.56510153    -21.63029553    -0.73959898    -1.12535860    -1.16036858
 G2-40  -295.78319374    -27.91931674    -27.82392458    -0.75768027    -0.12683262    -0.10646189
 G2-41  -537.25698670    -40.50567365    -40.32203544    -1.00907672    -0.48785940    -0.44333977
 G2-42  -636.35859650    -45.11766202    -44.92774866    -1.12751611    -0.66062193    -0.71397326
 G2-43  -745.12558291    -49.95471369    -49.72872758    -1.22259624    -0.76321981    -0.74547510
 G2-44  -864.00865754    -54.97684966    -54.70669534    -1.32670730    -0.87471043    -0.82211089
 G2-45  -579.87686531    -41.56613007    -41.36213576    -1.04793024    -0.48557089    -0.44661049
 G2-46  -335.35277468    -28.47182619    -28.42321714    -0.77718866    -0.68585465    -0.73902394
 G2-47  -405.30304242    -30.03396918    -29.93365501    -0.79312788    -0.67648301    -0.71731499
 G2-48  -439.22615376    -33.16019700    -33.08139802    -0.87449908    -0.79907219    -0.80383079
 G2-49  -498.65380914    -35.62104970    -35.52877910    -0.92623859    -0.86186182    -0.84508782
 G2-50  -521.41566642    -37.47290973    -37.36841615    -0.97119354    -0.91502561    -0.87178304
 G2-51  -538.63469188    -42.71300898    -42.45711798    -1.19481386    -0.74027515    -0.59588503
 G2-52  -465.40433308    -33.73060848    -33.55594702    -0.94335245    -0.82984695    -0.73728505
 G2-53  -406.18309924    -31.55954559    -31.39769489    -0.92540351    -0.82136664    -0.72506760
 G2-54  -498.89133697    -36.01506126    -35.90508601    -0.96322626    -0.90377679    -0.86485029
 G2-55  -505.87272378    -41.39057452    -41.36594712    -1.17142539    -1.26566745    -1.36059581
