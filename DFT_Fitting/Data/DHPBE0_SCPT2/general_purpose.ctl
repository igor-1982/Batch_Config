# The project environment :
#  "ProjDir" specifying the storage DIR of this project
#  "ProjCtrl" = 0 : to run all the jobs
#     = 1 : to fetch result from existed log and chk files
#     = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./DHPBE0           2    QChem

# The project description
__title__ ::
"================================ Total(80)  ================================"
"There are about :                                                           " 
" 1)   55 HOFs from the G2-1 set                                             "
" 2)   25 RC from the G2RC set                                               "
" NOTE :: "
" 1) G3-1 atomization is generated using freq scale factor 0.9877 and        "
"    correct SO contribution                                                 "
" 2) NAO-VCC-5Z basis set is used here                                       "

__initial guess__ ::
# for SCPT2+
1.0 0.5, 0.5


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
    a1, a3, a4 = C
    #a1  = 1.0
    a2  = 1. - a1
    a5  = 1. - a3
    #a4  = 0.0

    E_noXC, Ex_HF, Ex_PBE, Ec_PBE, Ec_SS, Ec_OS = P
    return E_noXC + a1*Ex_HF + a2*Ex_PBE +  a3 * Ec_PBE \
           + a4*Ec_SS + a5*Ec_OS 

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
#               268 = 15+55+47+95+56 is the total number of jobs in this batch list
__batch__ ::  268
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
# G2RC 47
  100           <PATH1>/G2RC                 XYG3_Comp        energy
  104           <PATH1>/G2RC                 XYG3_Comp        energy
  106           <PATH1>/G2RC                 XYG3_Comp        energy
  113           <PATH1>/G2RC                 XYG3_Comp        energy
  117           <PATH1>/G2RC                 XYG3_Comp        energy
  118           <PATH1>/G2RC                 XYG3_Comp        energy
   11           <PATH1>/G2RC                 XYG3_Comp        energy
  121           <PATH1>/G2RC                 XYG3_Comp        energy
  126           <PATH1>/G2RC                 XYG3_Comp        energy
  128           <PATH1>/G2RC                 XYG3_Comp        energy
   13           <PATH1>/G2RC                 XYG3_Comp        energy
   14           <PATH1>/G2RC                 XYG3_Comp        energy
   18           <PATH1>/G2RC                 XYG3_Comp        energy
    1           <PATH1>/G2RC                 XYG3_Comp        energy
   21           <PATH1>/G2RC                 XYG3_Comp        energy
   22           <PATH1>/G2RC                 XYG3_Comp        energy
   23           <PATH1>/G2RC                 XYG3_Comp        energy
   24           <PATH1>/G2RC                 XYG3_Comp        energy
   25           <PATH1>/G2RC                 XYG3_Comp        energy
   26           <PATH1>/G2RC                 XYG3_Comp        energy
   30           <PATH1>/G2RC                 XYG3_Comp        energy
   32           <PATH1>/G2RC                 XYG3_Comp        energy
   33           <PATH1>/G2RC                 XYG3_Comp        energy
   34           <PATH1>/G2RC                 XYG3_Comp        energy
   39           <PATH1>/G2RC                 XYG3_Comp        energy
   40           <PATH1>/G2RC                 XYG3_Comp        energy
   45           <PATH1>/G2RC                 XYG3_Comp        energy
   47           <PATH1>/G2RC                 XYG3_Comp        energy
   51           <PATH1>/G2RC                 XYG3_Comp        energy
   52           <PATH1>/G2RC                 XYG3_Comp        energy
   56           <PATH1>/G2RC                 XYG3_Comp        energy
   57           <PATH1>/G2RC                 XYG3_Comp        energy
   58           <PATH1>/G2RC                 XYG3_Comp        energy
   59           <PATH1>/G2RC                 XYG3_Comp        energy
   60           <PATH1>/G2RC                 XYG3_Comp        energy
   61           <PATH1>/G2RC                 XYG3_Comp        energy
   62           <PATH1>/G2RC                 XYG3_Comp        energy
   66           <PATH1>/G2RC                 XYG3_Comp        energy
   67           <PATH1>/G2RC                 XYG3_Comp        energy
   68           <PATH1>/G2RC                 XYG3_Comp        energy
    6           <PATH1>/G2RC                 XYG3_Comp        energy
   73           <PATH1>/G2RC                 XYG3_Comp        energy
   82           <PATH1>/G2RC                 XYG3_Comp        energy
   88           <PATH1>/G2RC                 XYG3_Comp        energy
    8           <PATH1>/G2RC                 XYG3_Comp        energy
   94           <PATH1>/G2RC                 XYG3_Comp        energy
   97           <PATH1>/G2RC                 XYG3_Comp        energy
# BH76 : 95
         c2h4    <PATH1>/BH76                XYG3_Comp        energy
       1_c2h5    <PATH1>/BH76                XYG3_Comp        energy
         C2H5    <PATH1>/BH76                XYG3_Comp        energy
       c2h5ts    <PATH1>/BH76                XYG3_Comp        energy
         C2H6    <PATH1>/BH76                XYG3_Comp        energy
         c3h7    <PATH1>/BH76                XYG3_Comp        energy
       c3h7ts    <PATH1>/BH76                XYG3_Comp        energy
         C5H8    <PATH1>/BH76                XYG3_Comp        energy
        CH2OH    <PATH1>/BH76                XYG3_Comp        energy
        ch3cl    <PATH1>/BH76                XYG3_Comp        energy
        1_ch3    <PATH1>/BH76                XYG3_Comp        energy
          CH3    <PATH1>/BH76                XYG3_Comp        energy
     ch3fclts    <PATH1>/BH76                XYG3_Comp        energy
         ch3f    <PATH1>/BH76                XYG3_Comp        energy
      1_ch3oh    <PATH1>/BH76                XYG3_Comp        energy
        CH3OH    <PATH1>/BH76                XYG3_Comp        energy
          CH4    <PATH1>/BH76                XYG3_Comp        energy
  clch3clcomp    <PATH1>/BH76                XYG3_Comp        energy
    clch3clts    <PATH1>/BH76                XYG3_Comp        energy
          cl-    <PATH1>/BH76                XYG3_Comp        energy
         1_cl    <PATH1>/BH76                XYG3_Comp        energy
           Cl    <PATH1>/BH76                XYG3_Comp        energy
       clf2ts    <PATH1>/BH76                XYG3_Comp        energy
          clf    <PATH1>/BH76                XYG3_Comp        energy
           co    <PATH1>/BH76                XYG3_Comp        energy
           f2    <PATH1>/BH76                XYG3_Comp        energy
  fch3clcomp1    <PATH1>/BH76                XYG3_Comp        energy
  fch3clcomp2    <PATH1>/BH76                XYG3_Comp        energy
     fch3clts    <PATH1>/BH76                XYG3_Comp        energy
    fch3fcomp    <PATH1>/BH76                XYG3_Comp        energy
      fch3fts    <PATH1>/BH76                XYG3_Comp        energy
           f-    <PATH1>/BH76                XYG3_Comp        energy
          1_f    <PATH1>/BH76                XYG3_Comp        energy
            F    <PATH1>/BH76                XYG3_Comp        energy
           H2    <PATH1>/BH76                XYG3_Comp        energy
          H2O    <PATH1>/BH76                XYG3_Comp        energy
          H2S    <PATH1>/BH76                XYG3_Comp        energy
     hch3clts    <PATH1>/BH76                XYG3_Comp        energy
        1_hcl    <PATH1>/BH76                XYG3_Comp        energy
          HCl    <PATH1>/BH76                XYG3_Comp        energy
       hclhts    <PATH1>/BH76                XYG3_Comp        energy
          hcn    <PATH1>/BH76                XYG3_Comp        energy
        hcnts    <PATH1>/BH76                XYG3_Comp        energy
          hco    <PATH1>/BH76                XYG3_Comp        energy
          1_h    <PATH1>/BH76                XYG3_Comp        energy
            H    <PATH1>/BH76                XYG3_Comp        energy
        hcots    <PATH1>/BH76                XYG3_Comp        energy
        hf2ts    <PATH1>/BH76                XYG3_Comp        energy
      hfch3ts    <PATH1>/BH76                XYG3_Comp        energy
         1_hf    <PATH1>/BH76                XYG3_Comp        energy
           HF    <PATH1>/BH76                XYG3_Comp        energy
        hfhts    <PATH1>/BH76                XYG3_Comp        energy
          hn2    <PATH1>/BH76                XYG3_Comp        energy
        hn2ts    <PATH1>/BH76                XYG3_Comp        energy
          hnc    <PATH1>/BH76                XYG3_Comp        energy
  hoch3fcomp1    <PATH1>/BH76                XYG3_Comp        energy
  hoch3fcomp2    <PATH1>/BH76                XYG3_Comp        energy
     hoch3fts    <PATH1>/BH76                XYG3_Comp        energy
           HS    <PATH1>/BH76                XYG3_Comp        energy
           n2    <PATH1>/BH76                XYG3_Comp        energy
         N2H2    <PATH1>/BH76                XYG3_Comp        energy
          N2H    <PATH1>/BH76                XYG3_Comp        energy
          n2o    <PATH1>/BH76                XYG3_Comp        energy
       n2ohts    <PATH1>/BH76                XYG3_Comp        energy
          NH2    <PATH1>/BH76                XYG3_Comp        energy
          NH3    <PATH1>/BH76                XYG3_Comp        energy
           NH    <PATH1>/BH76                XYG3_Comp        energy
            O    <PATH1>/BH76                XYG3_Comp        energy
          oh-    <PATH1>/BH76                XYG3_Comp        energy
         1_oh    <PATH1>/BH76                XYG3_Comp        energy
           OH    <PATH1>/BH76                XYG3_Comp        energy
          PH2    <PATH1>/BH76                XYG3_Comp        energy
          PH3    <PATH1>/BH76                XYG3_Comp        energy
        RKT01    <PATH1>/BH76                XYG3_Comp        energy
        RKT02    <PATH1>/BH76                XYG3_Comp        energy
        RKT03    <PATH1>/BH76                XYG3_Comp        energy
        RKT04    <PATH1>/BH76                XYG3_Comp        energy
        RKT05    <PATH1>/BH76                XYG3_Comp        energy
        RKT06    <PATH1>/BH76                XYG3_Comp        energy
        RKT07    <PATH1>/BH76                XYG3_Comp        energy
        RKT08    <PATH1>/BH76                XYG3_Comp        energy
        RKT09    <PATH1>/BH76                XYG3_Comp        energy
        RKT10    <PATH1>/BH76                XYG3_Comp        energy
        RKT11    <PATH1>/BH76                XYG3_Comp        energy
        RKT12    <PATH1>/BH76                XYG3_Comp        energy
        RKT13    <PATH1>/BH76                XYG3_Comp        energy
        RKT14    <PATH1>/BH76                XYG3_Comp        energy
        RKT15    <PATH1>/BH76                XYG3_Comp        energy
        RKT16    <PATH1>/BH76                XYG3_Comp        energy
        RKT17    <PATH1>/BH76                XYG3_Comp        energy
        RKT18    <PATH1>/BH76                XYG3_Comp        energy
        RKT19    <PATH1>/BH76                XYG3_Comp        energy
        RKT20    <PATH1>/BH76                XYG3_Comp        energy
        RKT21    <PATH1>/BH76                XYG3_Comp        energy
        RKT22    <PATH1>/BH76                XYG3_Comp        energy
# Molecules for S22 :: 56
 S22_1           <PATH1>/S22                 XYG3_Comp        energy
 S22_01a         <PATH1>/S22                 XYG3_Comp        energy
 S22_2           <PATH1>/S22                 XYG3_Comp        energy
 S22_02a         <PATH1>/S22                 XYG3_Comp        energy
 S22_3           <PATH1>/S22                 XYG3_Comp        energy
 S22_03a         <PATH1>/S22                 XYG3_Comp        energy
 S22_4           <PATH1>/S22                 XYG3_Comp        energy
 S22_04a         <PATH1>/S22                 XYG3_Comp        energy
 S22_5           <PATH1>/S22                 XYG3_Comp        energy
 S22_05a         <PATH1>/S22                 XYG3_Comp        energy
 S22_6           <PATH1>/S22                 XYG3_Comp        energy
 S22_06a         <PATH1>/S22                 XYG3_Comp        energy
 S22_06b         <PATH1>/S22                 XYG3_Comp        energy
 S22_7           <PATH1>/S22                 XYG3_Comp        energy
 S22_07a         <PATH1>/S22                 XYG3_Comp        energy
 S22_07b         <PATH1>/S22                 XYG3_Comp        energy
 S22_8           <PATH1>/S22                 XYG3_Comp        energy
 S22_08a         <PATH1>/S22                 XYG3_Comp        energy
 S22_9           <PATH1>/S22                 XYG3_Comp        energy
 S22_09a         <PATH1>/S22                 XYG3_Comp        energy
 S22_10          <PATH1>/S22                 XYG3_Comp        energy
 S22_10a         <PATH1>/S22                 XYG3_Comp        energy
 S22_10b         <PATH1>/S22                 XYG3_Comp        energy
 S22_11          <PATH1>/S22                 XYG3_Comp        energy
 S22_11a         <PATH1>/S22                 XYG3_Comp        energy
 S22_12          <PATH1>/S22                 XYG3_Comp        energy
 S22_12a         <PATH1>/S22                 XYG3_Comp        energy
 S22_13          <PATH1>/S22                 XYG3_Comp        energy
 S22_13a         <PATH1>/S22                 XYG3_Comp        energy
 S22_14          <PATH1>/S22                 XYG3_Comp        energy
 S22_14a         <PATH1>/S22                 XYG3_Comp        energy
 S22_14b         <PATH1>/S22                 XYG3_Comp        energy
 S22_15          <PATH1>/S22                 XYG3_Comp        energy
 S22_15a         <PATH1>/S22                 XYG3_Comp        energy
 S22_15b         <PATH1>/S22                 XYG3_Comp        energy
 S22_16          <PATH1>/S22                 XYG3_Comp        energy
 S22_16a         <PATH1>/S22                 XYG3_Comp        energy
 S22_16b         <PATH1>/S22                 XYG3_Comp        energy
 S22_17          <PATH1>/S22                 XYG3_Comp        energy
 S22_17a         <PATH1>/S22                 XYG3_Comp        energy
 S22_17b         <PATH1>/S22                 XYG3_Comp        energy
 S22_18          <PATH1>/S22                 XYG3_Comp        energy
 S22_18a         <PATH1>/S22                 XYG3_Comp        energy
 S22_18b         <PATH1>/S22                 XYG3_Comp        energy
 S22_19          <PATH1>/S22                 XYG3_Comp        energy
 S22_19a         <PATH1>/S22                 XYG3_Comp        energy
 S22_19b         <PATH1>/S22                 XYG3_Comp        energy
 S22_20          <PATH1>/S22                 XYG3_Comp        energy
 S22_20a         <PATH1>/S22                 XYG3_Comp        energy
 S22_20b         <PATH1>/S22                 XYG3_Comp        energy
 S22_21          <PATH1>/S22                 XYG3_Comp        energy
 S22_21a         <PATH1>/S22                 XYG3_Comp        energy
 S22_21b         <PATH1>/S22                 XYG3_Comp        energy
 S22_22          <PATH1>/S22                 XYG3_Comp        energy
 S22_22a         <PATH1>/S22                 XYG3_Comp        energy
 S22_22b         <PATH1>/S22                 XYG3_Comp        energy
# Molecules for ADIM6 :: 12
# G2IP + G2EA = 121
# WATER27 = 30


# Training set for the atomization energy
#             208 = 55+25+106+22 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 208 1.0
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
# "55 HOFs in the G3 set"
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
# G2RC 25
  3   118     -1   117     1     13    1                -0.0015298561        5.0000
  3    40     -1     1    -1    104    1                -0.0032350082        5.0000
  3   113     -1    30     1      8    1                -0.0040636803        5.0000
  3    52     -1     1    -1     18    2                -0.0061831684        5.0000
  4    30     -1    13    -1     40    1     1      1   -0.0111711367        5.0000
  4   128     -1    13    -1    126    1    22      1   -0.015872257         5.0000
  3   100     -1    13    -1    106    1                -0.0320791701        5.0000
  3    25     -1    14    -1    121    1                -0.0404296346        5.0000
  3    39     -1    45    -1     51    2                -0.0421029147        5.0000
  4    58     -1    59    -1     57    1    60      1   -0.0427881627        5.0000
  4    67     -1    61    -1     66    1    62      1   -0.0419594907        5.0000
  3    32     -1     1    -1     33    1                -0.046580931         5.0000
  3    25     -1    26    -1     88    1                -0.0521585313        5.0000
  4    47     -1     1    -3     18    1    13      1   -0.0540389795        5.0000
  3    34     -1     1    -3     11    2                -0.061943236         5.0000
  4     8     -1    45    -2     97    1    22      2   -0.0750266928        5.0000
  3    25     -1     1    -1     26    1                -0.0771621169        5.0000
  4    56     -1     1    -3     21    1    13      2   -0.0963649982        5.0000
  4    30     -1     1    -3     13    1     8      1   -0.1032334146        5.0000
  4    73     -1     1    -1     39    1    13      1   -0.109512199         5.0000
  4    68     -1     1    -1     34    1    13      1   -0.1286672722        5.0000
  3    26     -1     6    -1     82    1                -0.1737980271        5.0000
  3     1     -1    39    -1     14    2                -0.2140045577        5.0000
  2    25     -3    94     1                            -0.2415419675        5.0000
  3    23     -1    39    -1     24    2                -0.3389587417        5.0000
# BH76 : 106
  3            1_h    -1           n2o    -1    n2ohts      1                 0.0289079059       5.0000
  3           1_oh    -1            n2    -1    n2ohts      1                 0.1326194005       5.0000
  3            1_h    -1          1_hf    -1    hfhts       1                 0.0672180523       5.0000
  3           1_hf    -1           1_h    -1    hfhts       1                 0.0672180523       5.0000
  3            1_h    -1         1_hcl    -1    hclhts      1                 0.0286848018       5.0000
  3          1_hcl    -1           1_h    -1    hclhts      1                 0.0286848018       5.0000
  3            1_h    -1          ch3f    -1    hfch3ts     1                 0.0484135711       5.0000
  3           1_hf    -1         1_ch3    -1    hfch3ts     1                 0.0908670778       5.0000
  3            1_h    -1            f2    -1    hf2ts       1                 0.0036174722       5.0000
  3           1_hf    -1           1_f    -1    hf2ts       1                 0.1692084588       5.0000
  3          1_ch3    -1           clf    -1    ch3fclts    1                 0.0118404488       5.0000
  3           ch3f    -1          1_cl    -1    ch3fclts    1                 0.0958869181       5.0000
  3             f-    -1          ch3f    -1    fch3fts     1                 -0.000541824       5.0000
  3           ch3f    -1            f-    -1    fch3fts     1                 -0.000541824       5.0000
  2      fch3fcomp    -1       fch3fts     1                                  0.0213223694       5.0000
  2      fch3fcomp    -1       fch3fts     1                                  0.0213223694       5.0000
  3            cl-    -1         ch3cl    -1    clch3clts   1                 0.0049401603       5.0000
  3          ch3cl    -1           cl-    -1    clch3clts   1                 0.0049401603       5.0000
  2    clch3clcomp    -1     clch3clts     1                                  0.0216888974       5.0000
  2    clch3clcomp    -1     clch3clts     1                                  0.0216888974       5.0000
  3             f-    -1         ch3cl    -1    fch3clts    1                 -0.0199837453      5.0000
  3            cl-    -1          ch3f    -1    fch3clts    1                 0.0320472981       5.0000
  2    fch3clcomp1    -1      fch3clts     1                                  0.0046055043       5.0000
  2    fch3clcomp2    -1      fch3clts     1                                  0.047202435        5.0000
  3            oh-    -1          ch3f    -1    hoch3fts    1                 -0.0044302083      5.0000
  3        1_ch3oh    -1            f-    -1    hoch3fts    1                 0.0276170898       5.0000
  2    hoch3fcomp2    -1      hoch3fts     1                                  0.0174658571       5.0000
  2    hoch3fcomp1    -1      hoch3fts     1                                  0.0752179248       5.0000
  3            1_h    -1            n2    -1    hn2ts       1                 0.0234099855       5.0000
  2            hn2    -1         hn2ts     1                                  0.0170833931       5.0000
  3            1_h    -1            co    -1    hcots       1                 0.0050517123       5.0000
  2            hco    -1         hcots     1                                  0.0361428503       5.0000
  3            1_h    -1          c2h4    -1    c2h5ts      1                 0.0027409922       5.0000
  2         1_c2h5    -1        c2h5ts     1                                  0.0665328043       5.0000
  3          1_ch3    -1          c2h4    -1    c3h7ts      1                 0.0109161607       5.0000
  2           c3h7    -1        c3h7ts     1                                  0.0525409954       5.0000
  2            hcn    -1         hcnts     1                                  0.0767477809       5.0000
  2            hnc    -1         hcnts     1                                  0.0527640994       5.0000
  3              H    -1           HCl    -1    RKT01       1                 0.0090835206       5.0000
  3             H2    -1            Cl    -1    RKT01       1                 0.0138643209       5.0000
  3             OH    -1            H2    -1    RKT02       1                 0.0081273605       5.0000
  3            H2O    -1             H    -1    RKT02       1                 0.0337843222       5.0000
  3            CH3    -1            H2    -1    RKT03       1                 0.0192825612       5.0000
  3            CH4    -1             H    -1    RKT03       1                 0.0243820816       5.0000
  3             OH    -1           CH4    -1    RKT04       1                 0.0106771207       5.0000
  3            H2O    -1           CH3    -1    RKT04       1                 0.031234562        5.0000
  3              H    -1            H2    -1    RKT06       1                 0.015298561        5.0000
  3              H    -1            H2    -1    RKT06       1                 0.015298561        5.0000
  3             OH    -1           NH3    -1    RKT07       1                 0.0050995203       5.0000
  3            H2O    -1           NH2    -1    RKT07       1                 0.0202387213       5.0000
  3            HCl    -1           CH3    -1    RKT08       1                 0.0027091202       5.0000
  3             Cl    -1           CH4    -1    RKT08       1                 0.0125894408       5.0000
  3             OH    -1          C2H6    -1    RKT09       1                 0.0054182403       5.0000
  3            H2O    -1          C2H5    -1    RKT09       1                 0.031712642        5.0000
  3              F    -1            H2    -1    RKT10       1                 0.0028684802       5.0000
  3             HF    -1             H    -1    RKT10       1                 0.0532262434       5.0000
  3              O    -1           CH4    -1    RKT11       1                 0.0218323214       5.0000
  3             OH    -1           CH3    -1    RKT11       1                 0.0129081608       5.0000
  3              H    -1           PH3    -1    RKT12       1                 0.0049401603       5.0000
  3             H2    -1           PH2    -1    RKT12       1                 0.0369715224       5.0000
  3              H    -1            OH    -1    RKT14       1                 0.0170515211       5.0000
  3             H2    -1             O    -1    RKT14       1                 0.0208761613       5.0000
  3              H    -1           H2S    -1    RKT16       1                 0.0055776004       5.0000
  3             H2    -1            HS    -1    RKT16       1                 0.0275692818       5.0000
  3              O    -1           HCl    -1    RKT17       1                 0.015617281        5.0000
  3             OH    -1            Cl    -1    RKT17       1                 0.0165734411       5.0000
  3            NH2    -1           CH3    -1    RKT18       1                 0.0127488008       5.0000
  3             NH    -1           CH4    -1    RKT18       1                 0.0356966423       5.0000
  3            NH2    -1          C2H5    -1    RKT19       1                 0.0119520008       5.0000
  3             NH    -1          C2H6    -1    RKT19       1                 0.0291628819       5.0000
  3           C2H6    -1           NH2    -1    RKT20       1                 0.0165734411       5.0000
  3           C2H5    -1           NH3    -1    RKT20       1                 0.0277286418       5.0000
  3            NH2    -1           CH4    -1    RKT21       1                 0.0231072015       5.0000
  3            NH3    -1           CH3    -1    RKT21       1                 0.0283660818       5.0000
  2           C5H8    -1         RKT22     1                                  0.0611942439       5.0000
  2           C5H8    -1         RKT22     1                                  0.0611942439       5.0000
  4            1_h    -1           n2o    -1     1_oh       1      n2    1    -0.1037114946      5.0000
  4            1_h    -1          ch3f    -1     1_hf       1   1_ch3    1    -0.0424535067      5.0000
  4            1_h    -1            f2    -1     1_hf       1     1_f    1    -0.1655909866      5.0000
  4          1_ch3    -1           clf    -1     ch3f       1    1_cl    1    -0.0840464694      5.0000
  4             f-    -1         ch3cl    -1      cl-       1    ch3f    1    -0.0520310433      5.0000
  2    fch3clcomp1    -1   fch3clcomp2     1                                  -0.0425969307      5.0000
  4            oh-    -1          ch3f    -1  1_ch3oh       1      f-    1    -0.0320472981      5.0000
  2    hoch3fcomp2    -1   hoch3fcomp1     1                                  -0.0577520677      5.0000
  3            1_h    -1            n2    -1      hn2       1                 0.0063265924       5.0000
  3            1_h    -1            co    -1      hco       1                 -0.031091138       5.0000
  3            1_h    -1          c2h4    -1   1_c2h5       1                 -0.0637918121      5.0000
  3          1_ch3    -1          c2h4    -1     c3h7       1                 -0.0416248347      5.0000
  2            hnc    -1           hcn     1                                  -0.0239836815      5.0000
  4              H    -1           HCl    -1       H2       1      Cl    1    -0.0047808003      5.0000
  4             OH    -1            H2    -1      H2O       1       H    1    -0.0256569616      5.0000
  4            CH3    -1            H2    -1      CH4       1       H    1    -0.0050995203      5.0000
  4             OH    -1           CH4    -1      H2O       1     CH3    1    -0.0205574413      5.0000
  4             OH    -1           NH3    -1      H2O       1     NH2    1    -0.015139201       5.0000
  4            HCl    -1           CH3    -1       Cl       1     CH4    1    -0.0098803206      5.0000
  4             OH    -1          C2H6    -1      H2O       1    C2H5    1    -0.0262944017      5.0000
  4              F    -1            H2    -1       HF       1       H    1    -0.0503577632      5.0000
  4              O    -1           CH4    -1       OH       1     CH3    1    0.0089241606       5.0000
  4              H    -1           PH3    -1       H2       1     PH2    1    -0.0320313621      5.0000
  4              H    -1            OH    -1       H2       1       O    1    -0.0038246402      5.0000
  4              H    -1           H2S    -1       H2       1      HS    1    -0.0219916814      5.0000
  4              O    -1           HCl    -1       OH       1      Cl    1    -0.0009561601      5.0000
  4            NH2    -1           CH3    -1       NH       1     CH4    1    -0.0229478415      5.0000
  4            NH2    -1          C2H5    -1       NH       1    C2H6    1    -0.0172108811      5.0000
  4           C2H6    -1           NH2    -1     C2H5       1     NH3    1    -0.0111552007      5.0000
  4            NH2    -1           CH4    -1      NH3       1     CH3    1    -0.0052588803      5.0000
# G2IP + G2EA =  36 + 25 = 61
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
# 27 Hydrogon bonds for WATER27

#               268 = 15+55+47+95+56 is the total number of jobs in this batch list
__xyg3 components__ ::  268
#              E[noXC]         X Energy HF        X Energy PBE        C Energy PBE     C Energy SCPT2ss     C Energy SCPT2os
# 15 atoms
     H_0    -0.19101773    -0.30869067    -0.30310118    -0.00579893    0.00000000    0.00000000
    Li_0    -5.65492415    -1.77622718    -1.75516092    -0.05131086    0.00000000    0.00000000
    Be_0    -11.90688766    -2.66432286    -2.63663947    -0.08583632    0.00000000    -0.05050255
     B_0    -20.77160180    -3.75896907    -3.72714227    -0.11291807    -0.00528536    -0.07052209
     C_0    -32.63157542    -5.05898744    -5.02232987    -0.14429421    -0.01910012    -0.08617920
     N_0    -47.81763822    -6.58366035    -6.53820720    -0.17933124    -0.04206967    -0.09784067
     O_0    -66.62606082    -8.18877157    -8.15426541    -0.23394743    -0.04993680    -0.15898076
     F_0    -89.40217987    -10.00932535    -9.98252015    -0.29053532    -0.06727452    -0.22056888
    Na_0    -147.86510115    -13.98837151    -13.93632738    -0.36987648    0.00000000    0.00000000
    Mg_0    -183.63876318    -15.97076753    -15.90537373    -0.41006953    0.00000000    -0.03979788
    Al_0    -223.80926987    -18.06555770    -17.98085186    -0.44507858    -0.00456246    -0.05827175
    Si_0    -268.57211095    -20.28035200    -20.17651298    -0.48408752    -0.01604914    -0.07753363
     P_0    -318.09273626    -22.62107790    -22.49618583    -0.52577916    -0.03524084    -0.09569289
     S_0    -372.49930706    -25.00722876    -24.86856670    -0.58384898    -0.04144557    -0.14464159
    Cl_0    -431.96569466    -27.51718916    -27.36396041    -0.64395842    -0.05493325    -0.19367756
# 55 molecules in G3 set
    G2-1    -5.85149030    -2.13432668    -2.11125333    -0.08410118    0.00000000    -0.04203257
    G2-2    -12.07946543    -3.07107819    -3.03502384    -0.10326229    -0.00249788    -0.04874331
    G2-3    -32.87361992    -5.40644183    -5.37468109    -0.18467884    -0.02220972    -0.13555197
    G2-4    -33.08407142    -5.85208821    -5.80906714    -0.21499877    -0.03895195    -0.13577798
    G2-5    -33.11722396    -5.77394622    -5.74180069    -0.22403733    -0.03063530    -0.18039056
    G2-6    -33.36503592    -6.21145800    -6.16752011    -0.25953841    -0.04332306    -0.18719713
    G2-7    -33.63434627    -6.57736570    -6.53222834    -0.30083685    -0.05289038    -0.23349097
    G2-8    -48.06646441    -6.91487836    -6.88427538    -0.22534343    -0.04705072    -0.15650184
    G2-9    -48.31712650    -7.26986190    -7.24778475    -0.27082257    -0.05808947    -0.21446588
   G2-10    -48.56647116    -7.65364796    -7.63447697    -0.31529614    -0.07487026    -0.26704802
   G2-11    -66.88459203    -8.53811225    -8.52448412    -0.28026454    -0.06691414    -0.22694614
   G2-12    -67.14082348    -8.92125993    -8.92077042    -0.32592088    -0.09102677    -0.29149075
   G2-13    -89.67172595    -10.39346704    -10.39345677    -0.33630323    -0.09765594    -0.29665327
   G2-14    -269.05613336    -20.96999749    -20.85789369    -0.55456413    -0.01915496    -0.15578217
   G2-15    -269.00983913    -21.00850011    -20.88835138    -0.54442923    -0.02579379    -0.11886497
   G2-16    -269.27001668    -21.36583737    -21.23614162    -0.58122163    -0.02412594    -0.15810185
   G2-17    -269.52542833    -21.73152280    -21.59103237    -0.61609564    -0.02483329    -0.19462223
   G2-18    -318.59193383    -23.29153122    -23.16320800    -0.60561239    -0.03830193    -0.17867555
   G2-19    -318.84364806    -23.64049448    -23.50840799    -0.64365662    -0.04488717    -0.21991242
   G2-20    -373.01965860    -25.69175466    -25.55517022    -0.66707290    -0.06059625    -0.23543875
   G2-21    -432.23718824    -27.86835535    -27.71889636    -0.68719498    -0.07095566    -0.24222834
   G2-22    -11.31675138    -3.55166191    -3.51385202    -0.12431124    0.00000000    -0.03819493
   G2-23    -95.04753621    -11.93765454    -11.93299409    -0.37752254    -0.10679823    -0.30767974
   G2-24    -65.86506414    -10.98159598    -10.96160128    -0.43075787    -0.10956851    -0.36760111
   G2-25    -66.32765650    -11.73231788    -11.68409867    -0.49541464    -0.10488168    -0.39445609
   G2-26    -66.77512612    -12.48060636    -12.40234664    -0.56104045    -0.10856456    -0.42888393
   G2-27    -80.59440552    -11.62108067    -11.65227732    -0.40046704    -0.13952028    -0.39990568
   G2-28    -80.86192042    -12.04422680    -12.05001409    -0.44118456    -0.12969182    -0.40510895
   G2-29    -99.47311642    -13.30646335    -13.31804038    -0.44961963    -0.13677254    -0.41183073
   G2-30    -99.62406410    -13.66625324    -13.67930749    -0.47905619    -0.14265430    -0.42570040
   G2-31    -99.85338643    -14.05699206    -14.05767176    -0.51614734    -0.14099009    -0.45652980
   G2-32    -100.27691122    -14.81266413    -14.78176324    -0.58231582    -0.14273147    -0.48559386
   G2-33    -95.87643570    -13.10666112    -13.12861302    -0.45287911    -0.14533991    -0.43222253
   G2-34    -96.62071320    -14.60491417    -14.58422832    -0.58733093    -0.14885531    -0.49597960
   G2-35    -114.59336962    -14.70218349    -14.73830105    -0.49148585    -0.16089122    -0.45994211
   G2-36    -133.36269773    -16.31311952    -16.36368782    -0.53031878    -0.19790184    -0.47334097
   G2-37    -133.79066275    -17.04805358    -17.08680216    -0.60038473    -0.17989655    -0.56395103
   G2-38    -178.85321517    -19.90589777    -19.96572219    -0.61493721    -0.18978941    -0.59671531
   G2-39    -166.11581467    -21.58726496    -21.63203504    -0.74120285    -0.24514326    -0.68065439
   G2-40    -295.74019305    -27.96497453    -27.87210269    -0.75859623    0.00000000    -0.03400444
   G2-41    -537.19916391    -40.56832203    -40.38632403    -1.00940952    -0.06501062    -0.20725818
   G2-42    -636.31015611    -45.17294829    -44.98476757    -1.12771388    -0.11366487    -0.35725373
   G2-43    -745.08612692    -50.00192589    -49.77826412    -1.22196199    -0.13935773    -0.37992465
   G2-44    -863.97389233    -55.01709847    -54.75126980    -1.32548189    -0.14345674    -0.45890773
   G2-45    -579.82278859    -41.62615508    -41.42354409    -1.04914013    -0.07624477    -0.23959340
   G2-46    -335.33000732    -28.50762922    -28.45254649    -0.77782634    -0.13719795    -0.40799750
   G2-47    -405.28217965    -30.06439760    -29.95925936    -0.79362953    -0.12418348    -0.38131309
   G2-48    -439.21504127    -33.18409576    -33.10139731    -0.87410287    -0.17029442    -0.43945377
   G2-49    -498.64190689    -35.64928511    -35.54812474    -0.92502936    -0.16391750    -0.47715642
   G2-50    -521.40719131    -37.49112748    -37.38562574    -0.97019544    -0.16803293    -0.52427874
   G2-51    -538.57922988    -42.78319025    -42.52023054    -1.19533639    -0.05856373    -0.35464365
   G2-52    -465.38076641    -33.76256819    -33.58413119    -0.94408540    -0.12583707    -0.43942273
   G2-53    -406.15987107    -31.59238638    -31.42589849    -0.92621271    -0.11756596    -0.43337515
   G2-54    -498.88197880    -36.03434140    -35.92222527    -0.96279010    -0.16375961    -0.51531337
   G2-55    -505.88559408    -41.40390201    -41.37084836    -1.17090841    -0.28317857    -0.77828768
# G2RC 47
100    -114.00165056    -17.96665856    -17.93893578    -0.70333471    -0.18508959    -0.58382486
104    -166.52552292    -22.31223987    -22.32907736    -0.80356366    -0.23900952    -0.69461945
106    -181.07513298    -26.97820187    -26.93973177    -1.05734117    -0.28084060    -0.85924410
113    -133.00089117    -19.96893635    -19.93765101    -0.77812290    -0.19856706    -0.63703970
117    -438.81976567    -36.78384585    -36.61114777    -1.13651294    -0.18012346    -0.58532981
118    -505.91800233    -45.72664560    -45.56509160    -1.47176588    -0.28349700    -0.89068525
11    -48.56427856    -7.65591897    -7.63653947    -0.31544004    -0.07451441    -0.26190265
121    -155.51399358    -21.43745612    -21.40923204    -0.78767980    -0.20216305    -0.63786898
126    -199.67063770    -28.22582905    -28.20727124    -1.06556864    -0.29572394    -0.88356970
128    -564.77555328    -47.13816801    -46.98622148    -1.42356039    -0.28284112    -0.84652913
13    -67.13922274    -8.92297859    -8.92209120    -0.32603934    -0.09036179    -0.28471275
14    -89.67190687    -10.39326600    -10.39324483    -0.33630901    -0.09673657    -0.28870909
18    -269.52657203    -21.73019505    -21.58985122    -0.61603507    -0.02465664    -0.19082260
1    -0.47545266    -0.65780353    -0.64791751    -0.04322102    0.00000000    -0.04394071
21    -373.01739611    -25.69386108    -25.55712630    -0.66717471    -0.06002970    -0.22856362
22    -432.23552681    -27.86992849    -27.72038000    -0.68726716    -0.07001178    -0.23370877
23    -11.31754242    -3.55088607    -3.51315603    -0.12424212    0.00000000    -0.03776367
24    -95.04433922    -11.94099430    -11.93590029    -0.37776200    -0.10544155    -0.29861976
25    -65.86194459    -10.98454265    -10.96449873    -0.43076171    -0.10876453    -0.36014519
26    -66.32168085    -11.73838863    -11.68969412    -0.49562769    -0.10427455    -0.38650564
30    -99.47063035    -13.30878444    -13.32007868    -0.44971752    -0.13561157    -0.40253861
32    -99.85043089    -14.05995597    -14.06025894    -0.51627806    -0.13988231    -0.44645327
33    -100.27366650    -14.81596572    -14.78458143    -0.58248511    -0.14170063    -0.47506739
34    -95.87019008    -13.11340304    -13.13433301    -0.45308375    -0.14369221    -0.42202364
39    -178.85024795    -19.90880928    -19.96816385    -0.61505699    -0.18758249    -0.58021007
40    -166.11509760    -21.58751792    -21.63234427    -0.74125308    -0.24338100    -0.66556229
45    -863.97007423    -55.02098357    -54.75461059    -1.32596435    -0.14116215    -0.44190396
47    -335.32980303    -28.50745017    -28.45243588    -0.77781204    -0.13614967    -0.39896429
51    -521.39791032    -37.50170307    -37.39381327    -0.97113655    -0.16540962    -0.50581986
52    -538.58072420    -42.78137397    -42.51861154    -1.19524125    -0.05813573    -0.34704500
56    -505.87579056    -41.41336235    -41.37803802    -1.17154382    -0.27934710    -0.75697224
57    -289.15407249    -34.17819305    -34.15695021    -1.09251126    -0.31575249    -0.88898842
58    -1316.80709315    -86.55479080    -86.10163541    -2.15760712    -0.25787956    -0.74778015
59    -492.10468473    -48.50872289    -48.42849591    -1.40806266    -0.31282660    -0.88707811
60    -1519.80540584    -100.90355740    -100.36557269    -2.47294907    -0.23876088    -0.71397514
61    -390.41454079    -45.40518278    -45.41312241    -1.47195203    -0.43859174    -1.21819211
62    -1760.63653122    -115.25896975    -114.70413657    -2.88165280    -0.36740283    -1.05225076
66    -626.35046007    -60.82062073    -60.71109544    -1.78405249    -0.41958337    -1.18045599
67    -1996.57961692    -130.64901174    -129.95536605    -3.20706839    -0.33783137    -0.97883087
68    -162.46340401    -21.28093062    -21.37102858    -0.74389725    -0.26852429    -0.72098957
6    -33.11422430    -5.77710925    -5.74447443    -0.22418704    -0.03040068    -0.17678866
73    -245.53137384    -28.02689273    -28.13695748    -0.89115658    -0.28836314    -0.85455961
82    -99.41070587    -17.68482403    -17.59473720    -0.77274155    -0.16697539    -0.57535489
88    -132.10763165    -22.83602900    -22.74363419    -0.97323200    -0.22391877    -0.74011913
8    -33.63096463    -6.58083702    -6.53537848    -0.30098256    -0.05265602    -0.22914711
94    -197.53517626    -33.23209734    -33.12589404    -1.37476507    -0.35087169    -1.04175136
97    -897.13060087    -60.93822740    -60.63160502    -1.58885106    -0.20179928    -0.63034099
# BH76 : 95
         c2h4    -66.32400680    -11.73588658    -11.68753510    -0.49546303    -0.10439144    -0.38697817
       1_c2h5    -66.50335676    -12.12027509    -12.04611099    -0.52171777    -0.10021174    -0.37670080
         C2H5    -66.50346514    -12.12014977    -12.04601400    -0.52172889    -0.10022451    -0.37671805
       c2h5ts    -66.51481632    -12.03265207    -11.98228007    -0.50961113    -0.10709187    -0.39104448
         C2H6    -66.76539236    -12.49045071    -12.41134627    -0.56151854    -0.10802165    -0.42048852
         c3h7    -99.64345184    -18.02476336    -17.91763520    -0.78254674    -0.15747655    -0.57011932
       c3h7ts    -99.67007035    -17.93757647    -17.85754685    -0.76781193    -0.16030455    -0.58413244
         C5H8    -165.30458004    -28.70960342    -28.59776633    -1.21596138    -0.27839874    -0.93308619
        CH2OH    -100.01452074    -14.44721895    -14.42389927    -0.54521814    -0.13782969    -0.43570999
        ch3cl    -465.36857161    -33.77493003    -33.59497283    -0.94521497    -0.12461018    -0.42622565
        1_ch3    -33.36136326    -6.21523574    -6.17097924    -0.25966333    -0.04308230    -0.18344703
          CH3    -33.36136326    -6.21523574    -6.17097924    -0.25966333    -0.04308230    -0.18344703
     ch3fclts    -554.77418428    -43.66432915    -43.55302508    -1.23577600    -0.22691318    -0.71311677
         ch3f    -122.80637111    -16.29041778    -16.26002033    -0.59033011    -0.14523334    -0.47688134
      1_ch3oh    -100.26574296    -14.82436601    -14.79183969    -0.58293306    -0.14149847    -0.47424127
        CH3OH    -100.26574296    -14.82436601    -14.79183969    -0.58293306    -0.14149847    -0.47424127
          CH4    -33.62924220    -6.58260606    -6.53699323    -0.30104949    -0.05265359    -0.22906093
  clch3clcomp    -897.21178713    -61.51227664    -61.18731889    -1.62922256    -0.20250872    -0.65713533
    clch3clts    -897.23561188    -61.45562151    -61.15544126    -1.62638196    -0.21136414    -0.67584296
          cl-    -431.81989128    -27.74762161    -27.59801233    -0.68235790    -0.07341877    -0.22575147
         1_cl    -431.96578185    -27.51698101    -27.36389738    -0.64392504    -0.05396013    -0.18636431
           Cl    -431.96578185    -27.51698101    -27.36389738    -0.64392504    -0.05396013    -0.18636431
       clf2ts    -610.93102942    -47.07611080    -47.21273247    -1.25174362    -0.44333224    -1.11052911
          clf    -521.38513118    -37.51660535    -37.40506856    -0.97248831    -0.16490261    -0.50234261
           co    -99.47496239    -13.30386664    -13.31605608    -0.44953152    -0.13611189    -0.40367077
           f2    -178.84655754    -19.91335957    -19.97133705    -0.61545155    -0.18731981    -0.57842253
  fch3clcomp1    -554.60162668    -44.01079469    -43.85813265    -1.27657010    -0.23743347    -0.73430849
  fch3clcomp2    -554.64234233    -44.03356248    -43.85685643    -1.27426286    -0.22239101    -0.70775922
     fch3clts    -554.62991478    -43.97156963    -43.83407212    -1.27448875    -0.24244136    -0.74702366
    fch3fcomp    -212.02630297    -26.53761573    -26.53097594    -0.92162978    -0.25630962    -0.78334121
      fch3fts    -212.04245560    -26.48316307    -26.50503178    -0.92134789    -0.26981967    -0.81261827
           f-    -89.18493334    -10.26535536    -10.27940706    -0.32961412    -0.10423367    -0.29594326
          1_f    -89.40283522    -10.00836655    -9.98190693    -0.29046801    -0.06646043    -0.21377378
            F    -89.40283522    -10.00836655    -9.98190693    -0.29046801    -0.06646043    -0.21377378
           H2    -0.47501832    -0.65825516    -0.64833326    -0.04322707    0.00000000    -0.04392166
          H2O    -67.13482048    -8.92772892    -8.92615750    -0.32622877    -0.09020666    -0.28418754
          H2S    -373.01178057    -25.69977089    -25.56233044    -0.66741313    -0.05999017    -0.22817934
     hch3clts    -465.56264927    -34.04117814    -33.87676645    -0.96262711    -0.13321580    -0.44752928
        1_hcl    -432.23250141    -27.87311973    -27.72317742    -0.68740407    -0.06998343    -0.23348407
          HCl    -432.23250141    -27.87311973    -27.72317742    -0.68740407    -0.06998343    -0.23348407
       hclhts    -432.40626154    -28.14427275    -28.01120778    -0.70916974    -0.07946293    -0.25592515
          hcn    -80.86599505    -12.03908068    -12.04608932    -0.44096347    -0.12951364    -0.39878642
        hcnts    -80.84849638    -11.97939127    -11.99027731    -0.44148130    -0.13052615    -0.39561432
          hco    -99.62253000    -13.66742922    -13.68046073    -0.47907501    -0.14180789    -0.41681952
          1_h    -0.19102676    -0.30867667    -0.30309145    -0.00579958    0.00000000    0.00000000
            H    -0.19102676    -0.30867667    -0.30309145    -0.00579958    0.00000000    0.00000000
        hcots    -99.66206991    -13.59741789    -13.61517664    -0.46557826    -0.14055234    -0.41372705
        hf2ts    -179.04457897    -20.19508786    -20.27453766    -0.62755003    -0.19892908    -0.58262859
      hfch3ts    -123.02206722    -16.49327034    -16.50221260    -0.60242949    -0.16188730    -0.50834182
         1_hf    -89.66788629    -10.39772150    -10.39692093    -0.33648442    -0.09653527    -0.28808605
           HF    -89.66788629    -10.39772150    -10.39692093    -0.33648442    -0.09653527    -0.28808605
        hfhts    -89.87151751    -10.59817421    -10.63406577    -0.35196704    -0.11011603    -0.31134854
          hn2    -96.00913508    -13.45230020    -13.47263133    -0.48177381    -0.14396600    -0.42626100
        hn2ts    -96.04713769    -13.39063720    -13.42725992    -0.47470114    -0.15114195    -0.43809025
          hnc    -80.84711758    -12.04254873    -12.04118374    -0.44098961    -0.12210221    -0.38221632
  hoch3fcomp1    -189.50650220    -25.07332172    -25.06702930    -0.92118049    -0.25757306    -0.78390858
  hoch3fcomp2    -189.49821577    -25.02480212    -25.02175199    -0.90956802    -0.25379428    -0.78689449
     hoch3fts    -189.50822518    -24.97812777    -25.00562118    -0.91103855    -0.26931735    -0.81850689
           HS    -372.75471584    -25.34794629    -25.21079301    -0.62616256    -0.04830992    -0.18368377
           n2    -95.87857630    -13.10389798    -13.12665702    -0.45274384    -0.14481280    -0.42463052
         N2H2    -96.21394326    -13.82407628    -13.83785187    -0.51917813    -0.14407556    -0.46364622
          N2H    -96.00931901    -13.45209877    -13.47246374    -0.48176607    -0.14397798    -0.42629081
          n2o    -162.46456550    -21.27971727    -21.36994819    -0.74378728    -0.26853815    -0.72107968
       n2ohts    -162.66039243    -21.53173022    -21.64047561    -0.76101467    -0.27537623    -0.73458756
          NH2    -48.31176585    -7.27554521    -7.25264874    -0.27106341    -0.05761037    -0.20951957
          NH3    -48.56063559    -7.65978832    -7.63993522    -0.31557890    -0.07442951    -0.26153929
           NH    -48.06352273    -6.91795518    -6.88692968    -0.22547823    -0.04657028    -0.15275528
            O    -66.62631167    -8.18835938    -8.15397376    -0.23393655    -0.04936170    -0.15446337
          oh-    -66.66833534    -8.73999762    -8.76262240    -0.31707497    -0.10340996    -0.30314139
         1_oh    -66.88096370    -8.54202343    -8.52772813    -0.28043713    -0.06623164    -0.22078708
           OH    -66.88096370    -8.54202343    -8.52772813    -0.28043713    -0.06623164    -0.22078708
       PH2    -318.58546186    -23.29813274    -23.16904491    -0.60588981    -0.03792621    -0.17373196
       PH3    -318.83441274    -23.64996174    -23.51678419    -0.64402978    -0.04449407    -0.21410375
        RKT01    -432.40553490    -28.17427775    -28.03268470    -0.70364587    -0.07004424    -0.24811568
        RKT02    -67.35208916    -9.16161963    -9.17448264    -0.33805892    -0.08953814    -0.29815444
        RKT03    -33.82605516    -6.84494746    -6.80908385    -0.31690609    -0.05490280    -0.24462787
        RKT04    -100.50602926    -15.07832547    -15.06167473    -0.59621102    -0.14615937    -0.49181783
        RKT05    -100.47185822    -15.08126003    -15.06397230    -0.60096678    -0.14777792    -0.49400623
        RKT06    -0.66474748    -0.93800781    -0.93450889    -0.06121456    -0.00328752    -0.05546782
        RKT07    -115.45246165    -16.13533213    -16.15930083    -0.61093118    -0.17549099    -0.53628048
        RKT08    -465.59557060    -34.06194449    -33.88817504    -0.95975854    -0.12524487    -0.43731864
        RKT09    -133.64733872    -20.98377857    -20.93590168    -0.85670861    -0.20333736    -0.68454333
        RKT10    -89.88433986    -10.62357901    -10.63198607    -0.34384467    -0.08767186    -0.28920656
        RKT11    -100.24734426    -14.71512027    -14.68309982    -0.55053840    -0.12251325    -0.42611425
        RKT12    -319.03489225    -23.92947348    -23.80314237    -0.65949994    -0.04882498    -0.22698408
        RKT13    -432.40626154    -28.14427275    -28.01120778    -0.70916974    -0.07946293    -0.25592515
        RKT14    -67.08819065    -8.80065132    -8.80059346    -0.29384753    -0.06976689    -0.23591135
        RKT15    -96.43247901    -14.07926777    -14.11113911    -0.53532883    -0.15298840    -0.48448187
        RKT16    -373.20918042    -25.98007173    -25.85050060    -0.68329641    -0.06457775    -0.24203642
        RKT17    -498.86993132    -35.98020618    -35.86236996    -0.93738379    -0.15415272    -0.44230366
        RKT18    -81.67685316    -13.44792055    -13.40641280    -0.54223631    -0.11579247    -0.41685641
        RKT19    -114.81570379    -19.35485093    -19.28170010    -0.80381149    -0.17341494    -0.61022499
        RKT20    -115.06779323    -19.72116085    -19.65388560    -0.84881942    -0.19019437    -0.66610404
        RKT21    -81.92843896    -13.81440135    -13.77884974    -0.58768457    -0.13265934    -0.47283920
        RKT22    -165.27191593    -28.65035775    -28.56730065    -1.22952307    -0.30943738    -0.95887866
# G2IP + G2EA = 121
# 56 molecules for S22 
S22_1    -97.124526405    -15.31758441    -15.27914115    -0.63332209    -0.15128791    -0.52599646
S22_01a    -48.5621638125    -7.65810337    -7.63850534    -0.31553283    -0.07449206    -0.26178524
S22_2    -134.2700213    -17.85949387    -17.85715839    -0.65531596    -0.18282562    -0.57055537
S22_02a    -67.1350639825    -8.92749139    -8.92593716    -0.32621384    -0.09020022    -0.28417752
S22_3    -333.041111755    -44.64899662    -44.68248692    -1.61889533    -0.48662014    -1.39554761
S22_03a    -166.5368949325    -22.2971817    -22.31651455    -0.80327266    -0.24016167    -0.69717734
S22_4    -295.86446834    -42.14371803    -42.13895523    -1.59880774    -0.45480053    -1.34657977
S22_04a    -147.9431955775    -21.0519867    -21.05140833    -0.79464705    -0.22461054    -0.67197204
S22_5    -721.47675746    -103.74304883    -103.71452319    -3.95014508    -1.16165844    -3.23537284
S22_05a    -360.7476687025    -51.84999919    -51.83814228    -1.97006818    -0.57688537    -1.61690919
S22_6    -539.6841816875    -83.81668176    -83.68883091    -3.34551515    -0.93040777    -2.65196767
S22_06a    -279.14589864    -42.51450727    -42.46556347    -1.67144574    -0.46727139    -1.3390561
S22_06b    -260.558009095    -41.26758777    -41.18951291    -1.66358706    -0.45296034    -1.30458126
S22_7    -797.7472013925    -118.5691095    -118.48055095    -4.62847689    -1.34922201    -3.73696313
S22_07a    -403.8810559825    -60.77529598    -60.73258759    -2.38471415    -0.70181202    -1.91639013
S22_07b    -393.88870686    -57.7572224    -57.7130086    -2.23320335    -0.63753569    -1.81249195
S22_8    -67.261743505    -13.16111249    -13.07061443    -0.60246545    -0.10630806    -0.45952975
S22_08a    -33.6310714575    -6.58072706    -6.53527813    -0.30097839    -0.05265617    -0.22915434
S22_9    -132.6518881025    -23.46585945    -23.36994234    -0.99277636    -0.21185914    -0.77785031
S22_09a    -66.32915407    -11.7304576    -11.68268396    -0.49523668    -0.10449795    -0.38748278
S22_10    -231.1647484875    -39.81233837    -39.66076696    -1.67774367    -0.40691436    -1.2749225
S22_10a    -197.542259725    -33.22472221    -33.11938359    -1.37425887    -0.35104388    -1.04245136
S22_10b    -33.62648123    -6.58542646    -6.53956878    -0.30115601    -0.05264991    -0.22892336
S22_11    -395.0728495925    -66.45314225    -66.24170546    -2.75442704    -0.7129297    -2.09761531
S22_11a    -197.5410504775    -33.22596269    -33.12052448    -1.37426976    -0.35103161    -1.04239693
S22_12    -454.8626008475    -70.64300469    -70.56010668    -2.79646481    -0.79584574    -2.24493423
S22_12a    -227.438417565    -35.31740584    -35.27667902    -1.39495023    -0.39222588    -1.11601072
S22_13    -721.46810852    -103.72984294    -103.7003989    -3.9489758    -1.1670215    -3.24540886
S22_13a     -360.7412050525    -51.8578535    -51.84505123    -1.97015976    -0.57641643    -1.61594188
S22_14    -508.4945444225    -83.8303489    -83.59880011    -3.45462912    -0.92794357    -2.64919153
S22_14a     -310.964940285    -50.60382584    -50.47882486    -2.07169087    -0.56062418    -1.58838429
S22_14b     -197.5410670675    -33.225977    -33.12046375    -1.37438913    -0.35100445    -1.04229419
S22_15    -797.736992275    -118.56134439    -118.46759561    -4.63128598    -1.36100028    -3.75038362
S22_15a     -403.8809123875    -60.77507522    -60.73244945    -2.38452728    -0.70214239    -1.91714738
S22_15b     -393.8769662075    -57.77101509    -57.7251166    -2.23348139    -0.63689263    -1.81098364
S22_16    -132.19995765    -22.7056088    -22.63942912    -0.92692905    -0.21567753    -0.7509701
S22_16a     -66.328284185    -11.73134913    -11.68349099    -0.49526639    -0.10449908    -0.38745367
S22_16b     -65.8757729825    -10.96935263    -10.95141124    -0.43023293    -0.10980152    -0.36285667
S22_17    -264.677279975    -42.1529519    -42.04585404    -1.70331803    -0.44459206    -1.33039169
S22_17a     -197.5443669025    -33.22251563    -33.11743244    -1.37411501    -0.35109424    -1.04265575
S22_17b     -67.1366660625    -8.92556289    -8.92439206    -0.32617217    -0.09035262    -0.28461272
S22_18    -246.1006394225    -40.88605833    -40.7606061    -1.69234632    -0.42886211    -1.30793297
S22_18a     -197.5426508725    -33.22431115    -33.11902384    -1.37422604    -0.35105462    -1.04249459
S22_18b     -48.5621833875    -7.65785917    -7.63840352    -0.31555855    -0.07455817    -0.26200275
S22_19    -278.4196407475    -45.25269066    -45.15495185    -1.81877046    -0.48633724    -1.4486296
S22_19a     -197.544874295    -33.22198124    -33.11696346    -1.37407469    -0.35110774    -1.04271011
S22_19b     -80.8820708225    -12.02020204    -12.03050705    -0.44030158    -0.13146325    -0.40345549
S22_20    -395.0787501825    -66.45284091    -66.24116576    -2.75221679    -0.70791162    -2.09126704
S22_20a     -197.543412285    -33.22351586    -33.11831704    -1.37417986    -0.35107146    -1.04256335
S22_20b     -197.545385965    -33.22142588    -33.11649662    -1.37400085    -0.35112924    -1.04279458
S22_21    -508.5035031675    -83.83129294    -83.59969389    -3.45154592    -0.92026834    -2.64022489
S22_21a     -310.9685997425    -50.59991593    -50.47536454    -2.07153008    -0.56074452    -1.58873924
S22_21b     -197.5438865775    -33.2230201    -33.11787669    -1.37415073    -0.35108206    -1.04260654
S22_22    -528.377214915    -82.93648316    -82.75988126    -3.32610007    -0.900265    -2.59265736
S22_22a     -264.1953583475    -41.46023525    -41.3730508    -1.65997855    -0.44644476    -1.29281392
S22_22b     -264.1953583475    -41.46023525    -41.3730508    -1.65997855    -0.44644476    -1.29281392
# 12 molecules for ADIM6
# WATER27  = 30
