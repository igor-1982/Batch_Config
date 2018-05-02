# The project environment :
#  "ProjDir" specifying the storage DIR of this project
#  "ProjCtrl" = 0 : to run all the jobs
#     = 1 : to fetch result from existed log and chk files
#     = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./DHPBE0           2             QChem

# The project description
__title__ ::
"================================ Total(110) ================================"
"There are about :                                                           " 
" 1)   25 G2RC (N4Z basis set)                                               "
" 2)   31 H2 PEC (a4Z basis set)                                             "
" 3)   30 Li2 PEC (a4Z basis set)                                            "

__initial guess__ ::
# For rsXYG3 and the fitting sets include ADIM6 weighted by 300
#   XYG5 c1*Ex[HF]+(1-c1)Ex[HF]+c2*Ec[SCPT2]+(1-c2)*Ec[LYP]
#   where c2 = p1*erfc(p2*(hlg+p3))
#   c1,      p1,       p2,         p3
#    1.0000   0.50000   1.00000     0.00000
#	9.04091553E-01  5.17223650E-01  1.09038934E-00  7.43260206E-03
#	6.64279732E-01  5.78907774E-01  1.13390260E+00  7.91500393E-03
#   6.57865787E-01  1.43093901E+01  5.61853618E-01 -8.96692764E-03
#   6.57864916E-01  1.53643054E+01  5.74182587E-01 -1.84989542E-02
#	6.62820583E-01  1.41730410E+01  5.63154173E-01 -9.19703541E-03
#   9.04161922E-01  8.91796602E-01  2.34115819E-02 -2.51329698E-02
#   p1,             p2,             p3,           
    9.04161922E-01  1.01796602E-01  2.34115819E-02 0.0


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

__optimization function__ :: 30 
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    from scipy.special import erfc, erf
    p1, p2, p3, p4 = C
    Ex_HF, Ex_PBE, Ex_LDA, Ec_LDA, Ec_PBE, Ec_PT2, Ec_PT2ss, Ec_PT2os,\
    Ec_SCPT2, Ec_SCPT2ss, Ec_SCPT2os, HLG, E_noXC = P
    c1 = p1*erfc(p3*HLG**3)
    c2 = p2*erf(p3*HLG**3)
    #c3 = p2
    #c4 = p3
    return E_noXC + c1*Ex_HF + c2*Ex_PBE + c1*Ec_SCPT2os + c2*Ec_PBE

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







----------------------------------------------------------------

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , '.'
<PATH2> , '.'

# The molecular set to batch: 
#               204 = 47+32+31+94 is the total number of jobs in this batch list
__batch__ :: 157
#"Flag"         "DIR"                         "InpName"       "JobType"
# H2 PEC 32
 H             <PATH1>/H2                    XYG3_Comp        energy
 H2_0_6        <PATH1>/H2                    XYG3_Comp        energy
 H2_0_6_5      <PATH1>/H2                    XYG3_Comp        energy
 H2_0_7        <PATH1>/H2                    XYG3_Comp        energy
 H2_0_7_5      <PATH1>/H2                    XYG3_Comp        energy
 H2_0_8        <PATH1>/H2                    XYG3_Comp        energy
 H2_0_9        <PATH1>/H2                    XYG3_Comp        energy
 H2_1_0        <PATH1>/H2                    XYG3_Comp        energy
 H2_1_2        <PATH1>/H2                    XYG3_Comp        energy
 H2_1_4        <PATH1>/H2                    XYG3_Comp        energy
 H2_1_6        <PATH1>/H2                    XYG3_Comp        energy
 H2_1_8        <PATH1>/H2                    XYG3_Comp        energy
 H2_2_0        <PATH1>/H2                    XYG3_Comp        energy
 H2_2_2        <PATH1>/H2                    XYG3_Comp        energy
 H2_2_4        <PATH1>/H2                    XYG3_Comp        energy
 H2_2_6        <PATH1>/H2                    XYG3_Comp        energy
 H2_2_8        <PATH1>/H2                    XYG3_Comp        energy
 H2_3_0        <PATH1>/H2                    XYG3_Comp        energy
 H2_3_2        <PATH1>/H2                    XYG3_Comp        energy
 H2_3_4        <PATH1>/H2                    XYG3_Comp        energy
 H2_3_6        <PATH1>/H2                    XYG3_Comp        energy
 H2_3_8        <PATH1>/H2                    XYG3_Comp        energy
 H2_4_0        <PATH1>/H2                    XYG3_Comp        energy
 H2_4_2        <PATH1>/H2                    XYG3_Comp        energy
 H2_4_6        <PATH1>/H2                    XYG3_Comp        energy
 H2_5_0        <PATH1>/H2                    XYG3_Comp        energy
 H2_5_4        <PATH1>/H2                    XYG3_Comp        energy
 H2_5_8        <PATH1>/H2                    XYG3_Comp        energy
 H2_6_2        <PATH1>/H2                    XYG3_Comp        energy
 H2_6_6        <PATH1>/H2                    XYG3_Comp        energy
 H2_7_0        <PATH1>/H2                    XYG3_Comp        energy
 H2_7_4        <PATH1>/H2                    XYG3_Comp        energy
# Li2 PEC 31
 Li             <PATH1>/Li2                  XYG3_Comp        energy
 Li2_1_8        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_0        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_2        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_3        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_4        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_5        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_6        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_6_5      <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_7        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_7_5      <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_8        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_2_9        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_3_0        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_3_1        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_3_2        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_3_4        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_3_6        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_3_8        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_4_0        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_4_2        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_4_4        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_4_6        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_4_8        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_5_0        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_5_4        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_5_8        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_6_2        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_6_6        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_7_0        <PATH1>/Li2                  XYG3_Comp        energy
 Li2_7_4        <PATH1>/Li2                  XYG3_Comp        energy
# BH76(94)
         c2h4   <PATH1>/BH76                 XYG3_Comp        energy
         c2h5   <PATH1>/BH76                 XYG3_Comp        energy
        lC2H5   <PATH1>/BH76                 XYG3_Comp        energy
       c2h5ts   <PATH1>/BH76                 XYG3_Comp        energy
        lC2H6   <PATH1>/BH76                 XYG3_Comp        energy
         c3h7   <PATH1>/BH76                 XYG3_Comp        energy
       c3h7ts   <PATH1>/BH76                 XYG3_Comp        energy
        lC5H8   <PATH1>/BH76                 XYG3_Comp        energy
       lCH2OH   <PATH1>/BH76                 XYG3_Comp        energy
        ch3cl   <PATH1>/BH76                 XYG3_Comp        energy
          ch3   <PATH1>/BH76                 XYG3_Comp        energy
         lCH3   <PATH1>/BH76                 XYG3_Comp        energy
     ch3fclts   <PATH1>/BH76                 XYG3_Comp        energy
         ch3f   <PATH1>/BH76                 XYG3_Comp        energy
        ch3oh   <PATH1>/BH76                 XYG3_Comp        energy
       lCH3OH   <PATH1>/BH76                 XYG3_Comp        energy
         lCH4   <PATH1>/BH76                 XYG3_Comp        energy
  clch3clcomp   <PATH1>/BH76                 XYG3_Comp        energy
    clch3clts   <PATH1>/BH76                 XYG3_Comp        energy
          cl-   <PATH1>/BH76                 XYG3_Comp        energy
           cl   <PATH1>/BH76                 XYG3_Comp        energy
          lCl   <PATH1>/BH76                 XYG3_Comp        energy
       clf2ts   <PATH1>/BH76                 XYG3_Comp        energy
          clf   <PATH1>/BH76                 XYG3_Comp        energy
           co   <PATH1>/BH76                 XYG3_Comp        energy
           f2   <PATH1>/BH76                 XYG3_Comp        energy
  fch3clcomp1   <PATH1>/BH76                 XYG3_Comp        energy
  fch3clcomp2   <PATH1>/BH76                 XYG3_Comp        energy
     fch3clts   <PATH1>/BH76                 XYG3_Comp        energy
    fch3fcomp   <PATH1>/BH76                 XYG3_Comp        energy
      fch3fts   <PATH1>/BH76                 XYG3_Comp        energy
           f-   <PATH1>/BH76                 XYG3_Comp        energy
            f   <PATH1>/BH76                 XYG3_Comp        energy
           lF   <PATH1>/BH76                 XYG3_Comp        energy
          lH2   <PATH1>/BH76                 XYG3_Comp        energy
         lH2O   <PATH1>/BH76                 XYG3_Comp        energy
         lH2S   <PATH1>/BH76                 XYG3_Comp        energy
     hch3clts   <PATH1>/BH76                 XYG3_Comp        energy
          hcl   <PATH1>/BH76                 XYG3_Comp        energy
         lHCl   <PATH1>/BH76                 XYG3_Comp        energy
       hclhts   <PATH1>/BH76                 XYG3_Comp        energy
          hcn   <PATH1>/BH76                 XYG3_Comp        energy
        hcnts   <PATH1>/BH76                 XYG3_Comp        energy
          hco   <PATH1>/BH76                 XYG3_Comp        energy
           lH   <PATH1>/BH76                 XYG3_Comp        energy
        hcots   <PATH1>/BH76                 XYG3_Comp        energy
        hf2ts   <PATH1>/BH76                 XYG3_Comp        energy
      hfch3ts   <PATH1>/BH76                 XYG3_Comp        energy
           hf   <PATH1>/BH76                 XYG3_Comp        energy
          lHF   <PATH1>/BH76                 XYG3_Comp        energy
        hfhts   <PATH1>/BH76                 XYG3_Comp        energy
          hn2   <PATH1>/BH76                 XYG3_Comp        energy
        hn2ts   <PATH1>/BH76                 XYG3_Comp        energy
          hnc   <PATH1>/BH76                 XYG3_Comp        energy
  hoch3fcomp1   <PATH1>/BH76                 XYG3_Comp        energy
  hoch3fcomp2   <PATH1>/BH76                 XYG3_Comp        energy
     hoch3fts   <PATH1>/BH76                 XYG3_Comp        energy
          lHS   <PATH1>/BH76                 XYG3_Comp        energy
           n2   <PATH1>/BH76                 XYG3_Comp        energy
        lN2H2   <PATH1>/BH76                 XYG3_Comp        energy
         lN2H   <PATH1>/BH76                 XYG3_Comp        energy
          n2o   <PATH1>/BH76                 XYG3_Comp        energy
       n2ohts   <PATH1>/BH76                 XYG3_Comp        energy
         lNH2   <PATH1>/BH76                 XYG3_Comp        energy
         lNH3   <PATH1>/BH76                 XYG3_Comp        energy
          lNH   <PATH1>/BH76                 XYG3_Comp        energy
           lO   <PATH1>/BH76                 XYG3_Comp        energy
          oh-   <PATH1>/BH76                 XYG3_Comp        energy
           oh   <PATH1>/BH76                 XYG3_Comp        energy
          lOH   <PATH1>/BH76                 XYG3_Comp        energy
         lPH2   <PATH1>/BH76                 XYG3_Comp        energy
         lPH3   <PATH1>/BH76                 XYG3_Comp        energy
        RKT01   <PATH1>/BH76                 XYG3_Comp        energy
        RKT02   <PATH1>/BH76                 XYG3_Comp        energy
        RKT03   <PATH1>/BH76                 XYG3_Comp        energy
        RKT04   <PATH1>/BH76                 XYG3_Comp        energy
        RKT05   <PATH1>/BH76                 XYG3_Comp        energy
        RKT06   <PATH1>/BH76                 XYG3_Comp        energy
        RKT07   <PATH1>/BH76                 XYG3_Comp        energy
        RKT08   <PATH1>/BH76                 XYG3_Comp        energy
        RKT09   <PATH1>/BH76                 XYG3_Comp        energy
        RKT10   <PATH1>/BH76                 XYG3_Comp        energy
        RKT11   <PATH1>/BH76                 XYG3_Comp        energy
        RKT12   <PATH1>/BH76                 XYG3_Comp        energy
        RKT13   <PATH1>/BH76                 XYG3_Comp        energy
        RKT14   <PATH1>/BH76                 XYG3_Comp        energy
        RKT15   <PATH1>/BH76                 XYG3_Comp        energy
        RKT16   <PATH1>/BH76                 XYG3_Comp        energy
        RKT17   <PATH1>/BH76                 XYG3_Comp        energy
        RKT18   <PATH1>/BH76                 XYG3_Comp        energy
        RKT19   <PATH1>/BH76                 XYG3_Comp        energy
        RKT20   <PATH1>/BH76                 XYG3_Comp        energy
        RKT21   <PATH1>/BH76                 XYG3_Comp        energy
        RKT22   <PATH1>/BH76                 XYG3_Comp        energy
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

# Training set for the atomization energy
#             192 = 25+31+30+106 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 167 627.51 
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
# H2 PEC 31
  2        H2_0_6      1         H  -2                   -97.79415790  1.000
  2        H2_0_6_5    1         H  -2                  -105.07321742  1.000
  2        H2_0_7      1         H  -2                  -108.56557413  1.000
  2        H2_0_7_5    1         H  -2                  -109.32284692  1.000
  2        H2_0_8      1         H  -2                  -108.10198856  1.000
  2        H2_0_9      1         H  -2                  -101.79703164  1.000
  2        H2_1_0      1         H  -2                   -92.59054377  1.000
  2        H2_1_2      1         H  -2                   -71.47890481  1.000
  2        H2_1_4      1         H  -2                   -51.50026653  1.000
  2        H2_1_6      1         H  -2                   -34.99439410  1.000
  2        H2_1_8      1         H  -2                   -22.54435724  1.000
  2        H2_2_0      1         H  -2                   -13.86265599  1.000
  2        H2_2_2      1         H  -2                    -8.21469576  1.000
  2        H2_2_4      1         H  -2                    -4.74242565  1.000
  2        H2_2_6      1         H  -2                    -2.69437106  1.000
  2        H2_2_8      1         H  -2                    -1.51901973  1.000
  2        H2_3_0      1         H  -2                    -0.85543418  1.000
  2        H2_3_2      1         H  -2                    -0.48392316  1.000
  2        H2_3_4      1         H  -2                    -0.27645581  1.000
  2        H2_3_6      1         H  -2                    -0.16037901  1.000
  2        H2_3_8      1         H  -2                    -0.09501756  1.000
  2        H2_4_0      1         H  -2                    -0.05781877  1.000
  2        H2_4_2      1         H  -2                    -0.03630773  1.000
  2        H2_4_6      1         H  -2                    -0.01597013  1.000
  2        H2_5_0      1         H  -2                    -0.00808233  1.000
  2        H2_5_4      1         H  -2                    -0.00457267  1.000
  2        H2_5_8      1         H  -2                    -0.00279681  1.000
  2        H2_6_2      1         H  -2                    -0.00181790  1.000
  2        H2_6_6      1         H  -2                    -0.00121298  1.000
  2        H2_7_0      1         H  -2                    -0.00084839  1.000
  2        H2_7_4      1         H  -2                    -0.00060429  1.000
# Li2 PEC 30
 2         Li2_1_8     1        Li   -2                   -2.95769308  1.000
 2         Li2_2_0     1        Li   -2                  -14.55665067  1.000
 2         Li2_2_2     1        Li   -2                  -21.93045793  1.000
 2         Li2_2_3     1        Li   -2                  -24.12655468  1.000
 2         Li2_2_4     1        Li   -2                  -25.56003852  1.000
 2         Li2_2_5     1        Li   -2                  -26.37278948  1.000
 2         Li2_2_6     1        Li   -2                  -26.68045763  1.000
 2         Li2_2_6_5   1        Li   -2                  -26.67575130  1.000
 2         Li2_2_7     1        Li   -2                  -26.57993053  1.000
 2         Li2_2_7_5   1        Li   -2                  -26.40272170  1.000
 2         Li2_2_8     1        Li   -2                  -26.15309823  1.000
 2         Li2_2_9     1        Li   -2                  -25.46679054  1.000
 2         Li2_3_0     1        Li   -2                  -24.57378106  1.000
 2         Li2_3_1     1        Li   -2                  -23.51686596  1.000
 2         Li2_3_2     1        Li   -2                  -22.33520188  1.000
 2         Li2_3_4     1        Li   -2                  -19.74578187  1.000
 2         Li2_3_6     1        Li   -2                  -17.06499640  1.000
 2         Li2_3_8     1        Li   -2                  -14.46792076  1.000
 2         Li2_4_0     1        Li   -2                  -12.06135716  1.000
 2         Li2_4_2     1        Li   -2                   -9.91646523  1.000
 2         Li2_4_4     1        Li   -2                   -8.06229868  1.000
 2         Li2_4_6     1        Li   -2                   -6.48674657  1.000
 2         Li2_4_8     1        Li   -2                   -5.17098360  1.000
 2         Li2_5_0     1        Li   -2                   -4.09863177  1.000
 2         Li2_5_4     1        Li   -2                   -2.58821520  1.000
 2         Li2_5_8     1        Li   -2                   -1.71622730  1.000
 2         Li2_6_2     1        Li   -2                   -1.24710082  1.000
 2         Li2_6_6     1        Li   -2                   -1.01015305  1.000
 2         Li2_7_0     1        Li   -2                   -0.90052705  1.000
 2         Li2_7_4     1        Li   -2                   -0.85754262  1.000
# 76 reaction barrier heights + associated 30 reaction energies
  3              h    -1           n2o    -1    n2ohts      1                  18.14      1.0000
  3             oh    -1            n2    -1    n2ohts      1                  83.22      1.0000
  3              h    -1            hf    -1    hfhts       1                  42.18      1.0000
  3             hf    -1             h    -1    hfhts       1                  42.18      1.0000
  3              h    -1           hcl    -1    hclhts      1                  18.00      1.0000
  3            hcl    -1             h    -1    hclhts      1                  18.00      1.0000
  3              h    -1          ch3f    -1    hfch3ts     1                  30.38      1.0000
  3             hf    -1           ch3    -1    hfch3ts     1                  57.02      1.0000
  3              h    -1            f2    -1    hf2ts       1                   2.27      1.0000
  3             hf    -1             f    -1    hf2ts       1                 106.18      1.0000
  3            ch3    -1           clf    -1    ch3fclts    1                   7.43      1.0000
  3           ch3f    -1            cl    -1    ch3fclts    1                  60.17      1.0000
  3             f-    -1          ch3f    -1    fch3fts     1                  -0.34      1.0000
  3           ch3f    -1            f-    -1    fch3fts     1                  -0.34      1.0000
  2      fch3fcomp    -1       fch3fts     1                                   13.38      1.0000
  2      fch3fcomp    -1       fch3fts     1                                   13.38      1.0000
  3            cl-    -1         ch3cl    -1    clch3clts   1                   3.10      1.0000
  3          ch3cl    -1           cl-    -1    clch3clts   1                   3.10      1.0000
  2    clch3clcomp    -1     clch3clts     1                                   13.61      1.0000
  2    clch3clcomp    -1     clch3clts     1                                   13.61      1.0000
  3             f-    -1         ch3cl    -1    fch3clts    1                 -12.54      1.0000
  3            cl-    -1          ch3f    -1    fch3clts    1                  20.11      1.0000
  2    fch3clcomp1    -1      fch3clts     1                                    2.89      1.0000
  2    fch3clcomp2    -1      fch3clts     1                                   29.62      1.0000
  3            oh-    -1          ch3f    -1    hoch3fts    1                  -2.78      1.0000
  3          ch3oh    -1            f-    -1    hoch3fts    1                  17.33      1.0000
  2    hoch3fcomp2    -1      hoch3fts     1                                   10.96      1.0000
  2    hoch3fcomp1    -1      hoch3fts     1                                   47.20      1.0000
  3              h    -1            n2    -1    hn2ts       1                  14.69      1.0000
  2            hn2    -1         hn2ts     1                                   10.72      1.0000
  3              h    -1            co    -1    hcots       1                   3.17      1.0000
  2            hco    -1         hcots     1                                   22.68      1.0000
  3              h    -1          c2h4    -1    c2h5ts      1                   1.72      1.0000
  2           c2h5    -1        c2h5ts     1                                   41.75      1.0000
  3            ch3    -1          c2h4    -1    c3h7ts      1                   6.85      1.0000
  2           c3h7    -1        c3h7ts     1                                   32.97      1.0000
  2            hcn    -1         hcnts     1                                   48.16      1.0000
  2            hnc    -1         hcnts     1                                   33.11      1.0000
  3             lH    -1          lHCl    -1    RKT01       1                   5.70      1.0000
  3            lH2    -1           lCl    -1    RKT01       1                   8.70      1.0000
  3            lOH    -1           lH2    -1    RKT02       1                   5.10      1.0000
  3           lH2O    -1            lH    -1    RKT02       1                  21.20      1.0000
  3           lCH3    -1           lH2    -1    RKT03       1                  12.10      1.0000
  3           lCH4    -1            lH    -1    RKT03       1                  15.30      1.0000
  3            lOH    -1          lCH4    -1    RKT04       1                   6.70      1.0000
  3           lH2O    -1          lCH3    -1    RKT04       1                  19.60      1.0000
  3             lH    -1           lH2    -1    RKT06       1                   9.60      1.0000
  3             lH    -1           lH2    -1    RKT06       1                   9.60      1.0000
  3            lOH    -1          lNH3    -1    RKT07       1                   3.20      1.0000
  3           lH2O    -1          lNH2    -1    RKT07       1                  12.70      1.0000
  3           lHCl    -1          lCH3    -1    RKT08       1                   1.70      1.0000
  3            lCl    -1          lCH4    -1    RKT08       1                   7.90      1.0000
  3            lOH    -1         lC2H6    -1    RKT09       1                   3.40      1.0000
  3           lH2O    -1         lC2H5    -1    RKT09       1                  19.90      1.0000
  3             lF    -1           lH2    -1    RKT10       1                   1.80      1.0000
  3            lHF    -1            lH    -1    RKT10       1                  33.40      1.0000
  3             lO    -1          lCH4    -1    RKT11       1                  13.70      1.0000
  3            lOH    -1          lCH3    -1    RKT11       1                   8.10      1.0000
  3             lH    -1          lPH3    -1    RKT12       1                   3.10      1.0000
  3            lH2    -1          lPH2    -1    RKT12       1                  23.20      1.0000
  3             lH    -1           lOH    -1    RKT14       1                  10.70      1.0000
  3            lH2    -1            lO    -1    RKT14       1                  13.10      1.0000
  3             lH    -1          lH2S    -1    RKT16       1                   3.50      1.0000
  3            lH2    -1           lHS    -1    RKT16       1                  17.30      1.0000
  3             lO    -1          lHCl    -1    RKT17       1                   9.80      1.0000
  3            lOH    -1           lCl    -1    RKT17       1                  10.40      1.0000
  3           lNH2    -1          lCH3    -1    RKT18       1                   8.00      1.0000
  3            lNH    -1          lCH4    -1    RKT18       1                  22.40      1.0000
  3           lNH2    -1         lC2H5    -1    RKT19       1                   7.50      1.0000
  3            lNH    -1         lC2H6    -1    RKT19       1                  18.30      1.0000
  3          lC2H6    -1          lNH2    -1    RKT20       1                  10.40      1.0000
  3          lC2H5    -1          lNH3    -1    RKT20       1                  17.40      1.0000
  3           lNH2    -1          lCH4    -1    RKT21       1                  14.50      1.0000
  3           lNH3    -1          lCH3    -1    RKT21       1                  17.80      1.0000
  2          lC5H8    -1         RKT22     1                                   38.40      1.0000
  2          lC5H8    -1         RKT22     1                                   38.40      1.0000
  4              h    -1           n2o    -1       oh       1      n2    1    -65.08      1.0000
  4              h    -1          ch3f    -1       hf       1     ch3    1    -26.64      1.0000
  4              h    -1            f2    -1       hf       1       f    1   -103.91      1.0000
  4            ch3    -1           clf    -1     ch3f       1      cl    1    -52.74      1.0000
  4             f-    -1         ch3cl    -1      cl-       1    ch3f    1    -32.65      1.0000
  2    fch3clcomp1    -1   fch3clcomp2     1                                  -26.73      1.0000
  4            oh-    -1          ch3f    -1    ch3oh       1      f-    1    -20.11      1.0000
  2    hoch3fcomp2    -1   hoch3fcomp1     1                                  -36.24      1.0000
  3              h    -1            n2    -1      hn2       1                   3.97      1.0000
  3              h    -1            co    -1      hco       1                 -19.51      1.0000
  3              h    -1          c2h4    -1     c2h5       1                 -40.03      1.0000
  3            ch3    -1          c2h4    -1     c3h7       1                 -26.12      1.0000
  2            hnc    -1           hcn     1                                  -15.05      1.0000
  4             lH    -1          lHCl    -1      lH2       1     lCl    1     -3.00      1.0000
  4            lOH    -1           lH2    -1     lH2O       1      lH    1    -16.10      1.0000
  4           lCH3    -1           lH2    -1     lCH4       1      lH    1     -3.20      1.0000
  4            lOH    -1          lCH4    -1     lH2O       1    lCH3    1    -12.90      1.0000
  4            lOH    -1          lNH3    -1     lH2O       1    lNH2    1     -9.50      1.0000
  4           lHCl    -1          lCH3    -1      lCl       1    lCH4    1     -6.20      1.0000
  4            lOH    -1         lC2H6    -1     lH2O       1   lC2H5    1    -16.50      1.0000
  4             lF    -1           lH2    -1      lHF       1      lH    1    -31.60      1.0000
  4             lO    -1          lCH4    -1      lOH       1    lCH3    1      5.60      1.0000
  4             lH    -1          lPH3    -1      lH2       1    lPH2    1    -20.10      1.0000
  4             lH    -1           lOH    -1      lH2       1      lO    1     -2.40      1.0000
  4             lH    -1          lH2S    -1      lH2       1     lHS    1    -13.80      1.0000
  4             lO    -1          lHCl    -1      lOH       1     lCl    1     -0.60      1.0000
  4           lNH2    -1          lCH3    -1      lNH       1    lCH4    1    -14.40      1.0000
  4           lNH2    -1         lC2H5    -1      lNH       1   lC2H6    1    -10.80      1.0000
  4          lC2H6    -1          lNH2    -1    lC2H5       1    lNH3    1     -7.00      1.0000
  4           lNH2    -1          lCH4    -1     lNH3       1    lCH3    1     -3.30      1.0000
# G2RC 25
  3   118     -1   117     1     13    1                  -0.96        5.0000
  3    40     -1     1    -1    104    1                  -2.03        5.0000
  3   113     -1    30     1      8    1                  -2.55        5.0000
  3    52     -1     1    -1     18    2                  -3.88        5.0000
  4    30     -1    13    -1     40    1     1      1     -7.01        5.0000
  4   128     -1    13    -1    126    1    22      1     -9.96        5.0000
  3   100     -1    13    -1    106    1                 -20.13        5.0000
  3    25     -1    14    -1    121    1                 -25.37        5.0000
  3    39     -1    45    -1     51    2                 -26.42        5.0000
  4    58     -1    59    -1     57    1    60      1    -26.85        5.0000
  4    67     -1    61    -1     66    1    62      1    -26.33        5.0000
  3    32     -1     1    -1     33    1                 -29.23        5.0000
  3    25     -1    26    -1     88    1                 -32.73        5.0000
  4    47     -1     1    -3     18    1    13      1    -33.91        5.0000
  3    34     -1     1    -3     11    2                 -38.87        5.0000
  4     8     -1    45    -2     97    1    22      2    -47.08        5.0000
  3    25     -1     1    -1     26    1                 -48.42        5.0000
  4    56     -1     1    -3     21    1    13      2    -60.47        5.0000
  4    30     -1     1    -3     13    1     8      1    -64.78        5.0000
  4    73     -1     1    -1     39    1    13      1    -68.72        5.0000
  4    68     -1     1    -1     34    1    13      1    -80.74        5.0000
  3    26     -1     6    -1     82    1                -109.06        5.0000
  3     1     -1    39    -1     14    2                -134.29        5.0000
  2    25     -3    94     1                            -151.57        5.0000
  3    23     -1    39    -1     24    2                -212.70        5.0000

#               204 = 47+32+31+94 is the total number of jobs in this batch list
__xyg3 components__ ::  157
#  H2	ExHF	ExPBE	ExLDA	EcLDA	EcGGA	EcPT2	EcPT2ss	EcPT2os	EcSCPT2	EcSCPT2os	EcSCPT2ss	HLG	EnoXC
H	    	-0.30863400	-0.30304228	-0.26511017	-0.02202999	-0.00579912	0.00000000	0.00000000	0.00000000	0.00000000	0.00000000	0.00000000	9.79484746	-0.19103085
H2_0_6		-0.71193999	-0.69854014	-0.61182380	-0.09756035	-0.04377506	-0.04249354	0.00000000	-0.04249354	-0.04247746	0.00000000	-0.04247746	13.60585002	-0.40399946
H2_0_6_5	-0.69187745	-0.67959912	-0.59508325	-0.09647169	-0.04361693	-0.04298554	0.00000000	-0.04298554	-0.04296361	0.00000000	-0.04296361	13.26648767	-0.43532241
H2_0_7		-0.67305212	-0.66201264	-0.57948684	-0.09543249	-0.04342308	-0.04358174	0.00000000	-0.04358174	-0.04355170	0.00000000	-0.04355170	12.95064631	-0.45926937
H2_0_7_5	-0.65537149	-0.64567475	-0.56494753	-0.09444094	-0.04319774	-0.04428611	0.00000000	-0.04428611	-0.04424482	0.00000000	-0.04424482	12.60388751	-0.47760640
H2_0_8		-0.63874881	-0.63048748	-0.55138422	-0.09349510	-0.04294492	-0.04510356	0.00000000	-0.04510356	-0.04504683	0.00000000	-0.04504683	12.23241878	-0.49162328
H2_0_9		-0.60836603	-0.60321892	-0.52689760	-0.09173300	-0.04237023	-0.04709815	0.00000000	-0.04709815	-0.04699218	0.00000000	-0.04699218	11.48379666	-0.51029517
H2_1_0		-0.58134683	-0.57959641	-0.50551704	-0.09013184	-0.04172054	-0.04960901	0.00000000	-0.04960901	-0.04941560	0.00000000	-0.04941560	10.70570915	-0.52049812
H2_1_2		-0.53561961	-0.54136319	-0.47046115	-0.08736104	-0.04026059	-0.05640267	0.00000000	-0.05640267	-0.05581762	0.00000000	-0.05581762	9.08254567	-0.52669560
H2_1_4		-0.49873143	-0.51270786	-0.44363965	-0.08509362	-0.03867778	-0.06601177	0.00000000	-0.06601177	-0.06445573	0.00000000	-0.06445573	7.54362761	-0.52347288
H2_1_6		-0.46872383	-0.49146273	-0.42324471	-0.08325784	-0.03706159	-0.07903909	0.00000000	-0.07903909	-0.07534607	0.00000000	-0.07534607	6.22021751	-0.51634401
H2_1_8		-0.44419446	-0.47601815	-0.40794055	-0.08179294	-0.03548270	-0.09612083	0.00000000	-0.09612083	-0.08820186	0.00000000	-0.08820186	5.13292804	-0.50777593
H2_2_0		-0.42410519	-0.46512233	-0.39669428	-0.08064585	-0.03399840	-0.11787543	0.00000000	-0.11787543	-0.10241641	0.00000000	-0.10241641	4.25681697	-0.49891717
H2_2_2		-0.40765357	-0.45776707	-0.38867299	-0.07976874	-0.03265278	-0.14484465	0.00000000	-0.14484465	-0.11719444	0.00000000	-0.11719444	3.55616297	-0.49031179
H2_2_4		-0.39419340	-0.45312543	-0.38318708	-0.07911767	-0.03147448	-0.17744684	0.00000000	-0.17744684	-0.13177287	0.00000000	-0.13177287	2.99678151	-0.48221675
H2_2_6		-0.38318868	-0.45051728	-0.37966013	-0.07865240	-0.03047609	-0.21593030	0.00000000	-0.21593030	-0.14558312	0.00000000	-0.14558312	2.54959047	-0.47475065
H2_2_8		-0.37418745	-0.44938988	-0.37761359	-0.07833675	-0.02965654	-0.26033708	0.00000000	-0.26033708	-0.15829676	0.00000000	-0.15829676	2.19101007	-0.46796159
H2_3_0		-0.36680765	-0.44929862	-0.37665336	-0.07813871	-0.02900558	-0.31046824	0.00000000	-0.31046824	-0.16977940	0.00000000	-0.16977940	1.90234897	-0.46186035
H2_3_2		-0.36072837	-0.44989359	-0.37646141	-0.07803067	-0.02850742	-0.36590023	0.00000000	-0.36590023	-0.18003082	0.00000000	-0.18003082	1.66891264	-0.45643510
H2_3_4		-0.35568225	-0.45090534	-0.37678583	-0.07798928	-0.02814313	-0.42599431	0.00000000	-0.42599431	-0.18912175	0.00000000	-0.18912175	1.47922162	-0.45166028
H2_3_6		-0.35144843	-0.45213166	-0.37743101	-0.07799506	-0.02789174	-0.48994079	0.00000000	-0.48994079	-0.19715561	0.00000000	-0.19715561	1.32430090	-0.44750213
H2_3_8		-0.34784694	-0.45342649	-0.37824888	-0.07803211	-0.02773128	-0.55682898	0.00000000	-0.55682898	-0.20424609	0.00000000	-0.20424609	1.19709452	-0.44392090
H2_4_0		-0.34473446	-0.45469106	-0.37913240	-0.07808793	-0.02764018	-0.62573684	0.00000000	-0.62573684	-0.21050617	0.00000000	-0.21050617	1.09201357	-0.44087090
H2_4_2		-0.34199996	-0.45586696	-0.38001072	-0.07815338	-0.02759891	-0.69581638	0.00000000	-0.69581638	-0.21604283	0.00000000	-0.21604283	1.00460875	-0.43829969
H2_4_6		-0.33735322	-0.45784694	-0.38159075	-0.07828890	-0.02760429	-0.83681891	0.00000000	-0.83681891	-0.22532837	0.00000000	-0.22532837	0.86936070	-0.43437454
H2_5_0		-0.33346937	-0.45932174	-0.38284169	-0.07841003	-0.02765939	-0.97604414	0.00000000	-0.97604414	-0.23275701	0.00000000	-0.23275701	0.77089397	-0.43171212
H2_5_4		-0.33011131	-0.46036988	-0.38376686	-0.07850751	-0.02772122	-1.11179844	0.00000000	-1.11179844	-0.23881192	0.00000000	-0.23881192	0.69645207	-0.42994384
H2_5_8		-0.32714660	-0.46109248	-0.38442101	-0.07858113	-0.02777331	-1.24374584	0.00000000	-1.24374584	-0.24383833	0.00000000	-0.24383833	0.63809011	-0.42878889
H2_6_2		-0.32449705	-0.46157988	-0.38486889	-0.07863433	-0.02781212	-1.37227596	0.00000000	-1.37227596	-0.24808308	0.00000000	-0.24808308	0.59080341	-0.42804446
H2_6_6		-0.32211259	-0.46190344	-0.38516867	-0.07867162	-0.02783925	-1.49806016	0.00000000	-1.49806016	-0.25172389	0.00000000	-0.25172389	0.55138976	-0.42756916
H2_7_0		-0.31995774	-0.46211591	-0.38536638	-0.07869719	-0.02785756	-1.62179492	0.00000000	-1.62179492	-0.25488970	0.00000000	-0.25488970	0.51776183	-0.42726747
H2_7_4		-0.31800466	-0.46225451	-0.38549561	-0.07871446	-0.02786969	-1.74408532	0.00000000	-1.74408532	-0.25767492	0.00000000	-0.25767492	0.48852840	-0.42707646
#Li2	ExHF	ExPBE	ExLDA	EcLDA	EcGGA	EcPT2	EcPT2ss	EcPT2os	EcSCPT2	EcSCPT2os	EcSCPT2ss	HLG	EnoXC
Li       	-1.77637834	-1.75393024	-1.53483390	-0.15088882	-0.05137475	-0.01794787	-0.00043168	-0.01751620	-0.01794787	-0.00043168	-0.01751620	2.99689098	-5.65578445
Li2_1_8  	-3.58261190	-3.54783236	-3.10797011	-0.33304299	-0.12564880	-0.09450705	-0.00207004	-0.09243701	-0.09014927	-0.00207004	-0.08807922	2.85751110	-11.23625831
Li2_2_0  	-3.57924865	-3.54272632	-3.10302948	-0.33269144	-0.12565350	-0.08985500	-0.00187811	-0.08797689	-0.08616980	-0.00187811	-0.08429169	2.91732380	-11.26236680
Li2_2_2  	-3.57297924	-3.53507520	-3.09558479	-0.33203018	-0.12544523	-0.08670212	-0.00170053	-0.08500158	-0.08340972	-0.00170053	-0.08170919	2.80105159	-11.28331618
Li2_2_3  	-3.56923521	-3.53076471	-3.09140923	-0.33162518	-0.12528930	-0.08528605	-0.00161339	-0.08367267	-0.08211713	-0.00161339	-0.08050375	2.73701016	-11.29199373
Li2_2_4  	-3.56526544	-3.52630646	-3.08710731	-0.33118850	-0.12511018	-0.08402151	-0.00153154	-0.08248997	-0.08093757	-0.00153154	-0.07940604	2.67015375	-11.29959790
Li2_2_5  	-3.56114544	-3.52180251	-3.08277015	-0.33073045	-0.12491071	-0.08306721	-0.00146134	-0.08160588	-0.08003422	-0.00146134	-0.07857288	2.60131568	-11.30625220
Li2_2_6		-3.55694909	-3.51730300	-3.07844905	-0.33025786	-0.12469512	-0.08205841	-0.00138839	-0.08067002	-0.07904587	-0.00138839	-0.07765748	2.53104638	-11.31204953
Li2_2_6_5	-3.55482875	-3.51507778	-3.07631123	-0.33001826	-0.12458053	-0.08161500	-0.00135385	-0.08026115	-0.07860176	-0.00135385	-0.07724791	2.49562535	-11.31466703
Li2_2_7		-3.55270131	-3.51287679	-3.07419551	-0.32977747	-0.12446184	-0.08121180	-0.00132064	-0.07989116	-0.07819080	-0.00132064	-0.07687016	2.46011255	-11.31711255
Li2_2_7_5	-3.55057231	-3.51070508	-3.07210652	-0.32953621	-0.12433937	-0.08084873	-0.00128879	-0.07955993	-0.07781295	-0.00128879	-0.07652416	2.42457580	-11.31939642
Li2_2_8  	-3.54844735	-3.50856707	-3.07004843	-0.32929515	-0.12421352	-0.08052571	-0.00125837	-0.07926734	-0.07746820	-0.00125837	-0.07620983	2.38907690	-11.32152791
Li2_2_9  	-3.54423192	-3.50440656	-3.06603970	-0.32881607	-0.12395339	-0.07999848	-0.00120190	-0.07879658	-0.07687652	-0.00120190	-0.07567462	2.31840643	-11.32536619
Li2_3_0  	-3.54009635	-3.50041728	-3.06219323	-0.32834456	-0.12368502	-0.07962309	-0.00115124	-0.07847185	-0.07640816	-0.00115124	-0.07525693	2.24846108	-11.32868640
Li2_3_1  	-3.53606925	-3.49661151	-3.05852310	-0.32788376	-0.12341132	-0.07938700	-0.00110589	-0.07828111	-0.07604942	-0.00110589	-0.07494353	2.17950668	-11.33154334
Li2_3_2  	-3.53216525	-3.49299491	-3.05503459	-0.32743569	-0.12313380	-0.07927975	-0.00106512	-0.07821462	-0.07578808	-0.00106512	-0.07472296	2.11174488	-11.33399121
Li2_3_4  	-3.52473896	-3.48633542	-3.04859966	-0.32658243	-0.12256886	-0.07944955	-0.00099516	-0.07845440	-0.07554598	-0.00099516	-0.07455082	1.98042000	-11.33786217
Li2_3_6  	-3.51781656	-3.48043367	-3.04286563	-0.32579107	-0.12199184	-0.08017378	-0.00093889	-0.07923489	-0.07570013	-0.00093889	-0.07476124	1.85544145	-11.34064755
Li2_3_8  	-3.51138608	-3.47526327	-3.03779663	-0.32506479	-0.12140582	-0.08148342	-0.00089446	-0.08058896	-0.07625259	-0.00089446	-0.07535813	1.73734369	-11.34260601
Li2_4_0  	-3.50543231	-3.47078361	-3.03334940	-0.32440449	-0.12081489	-0.08337104	-0.00085932	-0.08251172	-0.07716218	-0.00085932	-0.07630286	1.62634368	-11.34393031
Li2_4_2  	-3.49993962	-3.46694648	-3.02947868	-0.32380955	-0.12022445	-0.08583603	-0.00083187	-0.08500416	-0.07839090	-0.00083187	-0.07755903	1.52244388	-11.34476271
Li2_4_4  	-3.49490835	-3.46370009	-3.02614451	-0.32327907	-0.11964351	-0.08888809	-0.00081183	-0.08807626	-0.07990889	-0.00081183	-0.07909706	1.42547609	-11.34519719
Li2_4_6  	-3.49034138	-3.46099047	-3.02330796	-0.32281140	-0.11908157	-0.09250221	-0.00079800	-0.09170421	-0.08164959	-0.00079800	-0.08085159	1.33513034	-11.34529781
Li2_4_8  	-3.48621344	-3.45876311	-3.02092173	-0.32240290	-0.11854266	-0.09663674	-0.00078803	-0.09584871	-0.08352979	-0.00078803	-0.08274176	1.25106380	-11.34512993
Li2_5_0  	-3.48248410	-3.45696588	-3.01893597	-0.32204902	-0.11802757	-0.10128148	-0.00078034	-0.10050114	-0.08550041	-0.00078034	-0.08472008	1.17295708	-11.34475681
Li2_5_4  	-3.47606714	-3.45446757	-3.01598825	-0.32148755	-0.11707497	-0.11214982	-0.00076999	-0.11137983	-0.08962478	-0.00076999	-0.08885479	1.03335013	-11.34358297
Li2_5_8  	-3.47085119	-3.45313734	-3.01415193	-0.32109422	-0.11624127	-0.12516828	-0.00076537	-0.12440291	-0.09386502	-0.00076537	-0.09309965	0.91378574	-11.34204883
Li2_6_2  	-3.46663519	-3.45266812	-3.01316554	-0.32083883	-0.11554169	-0.14030258	-0.00076505	-0.13953754	-0.09806750	-0.00076504	-0.09730246	0.81183386	-11.34032614
Li2_6_6  	-3.46323756	-3.45280375	-3.01280820	-0.32069341	-0.11498248	-0.15743637	-0.00076760	-0.15666877	-0.10211220	-0.00076760	-0.10134460	0.72525118	-11.33853500
Li2_7_0  	-3.46049749	-3.45333410	-3.01289482	-0.32063252	-0.11456127	-0.17637233	-0.00077193	-0.17560040	-0.10592050	-0.00077193	-0.10514857	0.65200666	-11.33676318
Li2_7_4  	-3.45827396	-3.45408713	-3.01327007	-0.32063322	-0.11426940	-0.19681319	-0.00077717	-0.19603602	-0.10944309	-0.00077717	-0.10866591	0.59030441	-11.33507784
#BH76(94)		ExHF	ExPBE	ExLDA	EcLDA	EcGGA	EcPT2	EcPT2ss	EcPT2os	EcSCPT2	EcSCPT2os	EcSCPT2ss	HLG	EnoXC
c2h4		-11.73588658	-11.68753510	-10.54441203	-0.98354156	-0.49546303	-0.49215161	-0.10442749	-0.38772412	-0.49136961	-0.10439144	-0.38697817	7.93229284	-66.32400680
c2h5		-12.12027509	-12.04611099	-10.86987793	-1.02732637	-0.52171777	-0.47694691	-0.10021582	-0.37673109	-0.47691254	-0.10021174	-0.37670080	4.89295906	-66.50335676
lC2H5		-12.12014977	-12.04601400	-10.86981252	-1.02732487	-0.52172889	-0.47697695	-0.10022858	-0.37674837	-0.47694256	-0.10022451	-0.37671805	4.89126930	-66.50346514
c2h5ts		-12.03265207	-11.98228007	-10.80764735	-1.01476946	-0.50961113	-0.49833807	-0.10709996	-0.39123811	-0.49813636	-0.10709187	-0.39104448	4.88783052	-66.51481632
lC2H6		-12.49045071	-12.41134627	-11.21253667	-1.08772500	-0.56151854	-0.52862058	-0.10803521	-0.42058537	-0.52851017	-0.10802165	-0.42048852	10.50685827	-66.76539236
c3h7		-18.02476336	-17.91763520	-16.18591405	-1.52373423	-0.78254674	-0.72763460	-0.15748125	-0.57015335	-0.72759587	-0.15747655	-0.57011932	4.79834947	-99.64345184
c3h7ts		-17.93757647	-17.85754685	-16.11056375	-1.51854464	-0.76781193	-0.74464735	-0.16031564	-0.58433170	-0.74443699	-0.16030455	-0.58413244	3.94570542	-99.67007035
lC5H8		-28.70960342	-28.59776633	-25.84931052	-2.37024564	-1.21596138	-1.21263423	-0.27844858	-0.93418565	-1.21148493	-0.27839874	-0.93308619	5.80945827	-165.30458004
lCH2OH		-14.44721895	-14.42389927	-13.07395896	-1.09644870	-0.54521814	-0.57357494	-0.13783500	-0.43573994	-0.57353968	-0.13782969	-0.43570999	4.71529869	-100.01452074
ch3cl		-33.77493003	-33.59497283	-31.02548275	-1.87631493	-0.94521497	-0.55106672	-0.12464898	-0.42641774	-0.55083583	-0.12461018	-0.42622565	8.81332063	-465.36857161
ch3			-6.21523574	-6.17097924	-5.54944967	-0.52974975	-0.25966333	-0.22655381	-0.04308531	-0.18346850	-0.22652933	-0.04308230	-0.18344703	5.26379508	-33.36136326
lCH3		-6.21523574	-6.17097924	-5.54944967	-0.52974975	-0.25966333	-0.22655381	-0.04308531	-0.18346850	-0.22652933	-0.04308230	-0.18344703	5.26379508	-33.36136326
ch3fclts	-43.66432915	-43.55302508	-40.08322350	-2.51491258	-1.23577600	-0.94031839	-0.22693009	-0.71338830	-0.94002995	-0.22691318	-0.71311677	3.46053617	-554.77418428
ch3f		-16.29041778	-16.26002033	-14.77520499	-1.19484205	-0.59033011	-0.62218856	-0.14524311	-0.47694545	-0.62211469	-0.14523334	-0.47688134	10.79986152	-122.80637111
ch3oh		-14.82436601	-14.79183969	-13.41578165	-1.15594662	-0.58293306	-0.61584107	-0.14151210	-0.47432897	-0.61573974	-0.14149847	-0.47424127	8.49594917	-100.26574296
lCH3OH		-14.82436601	-14.79183969	-13.41578165	-1.15594662	-0.58293306	-0.61584107	-0.14151210	-0.47432897	-0.61573974	-0.14149847	-0.47424127	8.49594917	-100.26574296
lCH4		-6.58260606	-6.53699323	-5.89484620	-0.59127468	-0.30104949	-0.28179888	-0.05266391	-0.22913497	-0.28171452	-0.05265359	-0.22906093	11.96085766	-33.62924220
clch3clcomp	-61.51227664	-61.18731889	-56.62868036	-3.24836103	-1.62922256	-0.86009253	-0.20259834	-0.65749419	-0.85964405	-0.20250872	-0.65713533	5.77392632	-897.21178713
clch3clts	-61.45562151	-61.15544126	-56.59622457	-3.24671371	-1.62638196	-0.88793670	-0.21145046	-0.67648623	-0.88720710	-0.21136414	-0.67584296	6.32848004	-897.23561188
cl-			-27.74762161	-27.59801233	-25.60405940	-1.37162745	-0.68235790	-0.29932655	-0.07345595	-0.22587061	-0.29917024	-0.07341877	-0.22575147	15.26369848	-431.81989128
cl			-27.51698101	-27.36389738	-25.37125023	-1.32043028	-0.64392504	-0.24035549	-0.05396466	-0.18639083	-0.24032444	-0.05396013	-0.18636431	3.34814655	-431.96578185
lCl			-27.51698101	-27.36389738	-25.37125023	-1.32043028	-0.64392504	-0.24035549	-0.05396466	-0.18639083	-0.24032444	-0.05396013	-0.18636431	3.34814655	-431.96578185
clf2ts		-47.07611080	-47.21273247	-43.44328528	-2.61315335	-1.25174362	-1.66029633	-0.48891042	-1.17138591	-1.55386135	-0.44333224	-1.11052911	1.17678949	-610.93102942
clf			-37.51660535	-37.40506856	-34.54942823	-1.98152767	-0.97248831	-0.66769518	-0.16493949	-0.50275569	-0.66724522	-0.16490261	-0.50234261	6.35524352	-521.38513118
co			-13.30386664	-13.31605608	-12.04605589	-0.94566126	-0.44953152	-0.54059968	-0.13625170	-0.40434798	-0.53978266	-0.13611189	-0.40367077	10.01316783	-99.47496239
f2			-19.91335957	-19.97133705	-18.19763428	-1.29457036	-0.61545155	-0.76668463	-0.18734213	-0.57934250	-0.76574235	-0.18731981	-0.57842253	8.06517661	-178.84655754
fch3clcomp1	-44.01079469	-43.85813265	-40.38341032	-2.56902155	-1.27657010	-0.97226109	-0.23754043	-0.73472066	-0.97174196	-0.23743347	-0.73430849	5.94312451	-554.60162668
fch3clcomp2	-44.03356248	-43.85685643	-40.38224210	-2.56722655	-1.27426286	-0.93042603	-0.22244828	-0.70797776	-0.93015022	-0.22239101	-0.70775922	5.96673821	-554.64234233
fch3clts	-43.97156963	-43.83407212	-40.35923863	-2.56755465	-1.27448875	-0.99022329	-0.24254496	-0.74767833	-0.98946502	-0.24244136	-0.74702366	7.02127602	-554.62991478
fch3fcomp	-26.53761573	-26.53097594	-24.13991852	-1.88811808	-0.92162978	-1.03991688	-0.25636831	-0.78354856	-1.03965083	-0.25630962	-0.78334121	5.91856027	-212.02630297
fch3fts		-26.48316307	-26.50503178	-24.11513372	-1.88750012	-0.92134789	-1.08287990	-0.26987418	-0.81300571	-1.08243794	-0.26981967	-0.81261827	8.08031661	-212.04245560
f-			-10.26535536	-10.27940706	-9.36706169	-0.69287765	-0.32961412	-0.40022891	-0.10424652	-0.29598239	-0.40017693	-0.10423367	-0.29594326	21.06481978	-89.18493334
f			-10.00836655	-9.98190693	-9.06897282	-0.63566062	-0.29046801	-0.28023596	-0.06646063	-0.21377533	-0.28023420	-0.06646043	-0.21377378	5.88337319	-89.40283522
lF			-10.00836655	-9.98190693	-9.06897282	-0.63566062	-0.29046801	-0.28023596	-0.06646063	-0.21377533	-0.28023420	-0.06646043	-0.21377378	5.88337319	-89.40283522
lH2			-0.65825516	-0.64833326	-0.56731078	-0.09460532	-0.04322707	-0.04396076	0.00000000	-0.04396076	-0.04392166	0.00000000	-0.04392166	13.33587951	-0.47501832
lH2O		-8.92772892	-8.92615750	-8.11092899	-0.66035321	-0.32622877	-0.37447398	-0.09022184	-0.28425214	-0.37439420	-0.09020666	-0.28418754	9.21811427	-67.13482048
lH2S		-25.69977089	-25.56233044	-23.66885054	-1.33767494	-0.66741313	-0.28850548	-0.06004261	-0.22846286	-0.28816951	-0.05999017	-0.22817934	7.87083677	-373.01178057
hch3clts	-34.04117814	-33.87676645	-31.27611729	-1.91206224	-0.96262711	-0.58089022	-0.13322923	-0.44766099	-0.58074508	-0.13321580	-0.44752928	4.22357518	-465.56264927
hcl			-27.87311973	-27.72317742	-25.71538174	-1.38019884	-0.68740407	-0.30364149	-0.07001690	-0.23362459	-0.30346750	-0.06998343	-0.23348407	9.54851767	-432.23250141
lHCl			-27.87311973	-27.72317742	-25.71538174	-1.38019884	-0.68740407	-0.30364149	-0.07001690	-0.23362459	-0.30346750	-0.06998343	-0.23348407	9.54851767	-432.23250141
hclhts		-28.14427275	-28.01120778	-25.97846125	-1.41646623	-0.70916974	-0.33550236	-0.07947417	-0.25602818	-0.33538808	-0.07946293	-0.25592515	4.43836610	-432.40626154
hcn			-12.03908068	-12.04608932	-10.87305958	-0.91087746	-0.44096347	-0.52981372	-0.12981864	-0.39999507	-0.52830006	-0.12951364	-0.39878642	10.54829455	-80.86599505
hcnts		-11.97939127	-11.99027731	-10.82218105	-0.90763406	-0.44148130	-0.52717333	-0.13068091	-0.39649242	-0.52614047	-0.13052615	-0.39561432	8.00312434	-80.84849638
hco			-13.66742922	-13.68046073	-12.38356629	-0.99213869	-0.47907501	-0.55893751	-0.14185252	-0.41708499	-0.55862741	-0.14180789	-0.41681952	4.53252246	-99.62253000
lH			-0.30867667	-0.30309145	-0.26514909	-0.02203075	-0.00579958	0.00000000	0.00000000	0.00000000	0.00000000	0.00000000	0.00000000	11.93590008	-0.19102676
hcots		-13.59741789	-13.61517664	-12.31538332	-0.97808996	-0.46557826	-0.55454410	-0.14058515	-0.41395895	-0.55427939	-0.14055234	-0.41372705	5.11599201	-99.66206991
hf2ts		-20.19508786	-20.27453766	-18.46795766	-1.32547442	-0.62755003	-0.78189997	-0.19893662	-0.58296335	-0.78155767	-0.19892908	-0.58262859	5.47621676	-179.04457897
hfch3ts		-16.49327034	-16.50221260	-14.98285749	-1.22739581	-0.60242949	-0.67030671	-0.16189483	-0.50841188	-0.67022912	-0.16188730	-0.50834182	3.99053271	-123.02206722
hf			-10.39772150	-10.39692093	-9.47668912	-0.69978503	-0.33648442	-0.38465006	-0.09654088	-0.28810918	-0.38462131	-0.09653527	-0.28808605	11.93462826	-89.66788629
lHF			-10.39772150	-10.39692093	-9.47668912	-0.69978503	-0.33648442	-0.38465006	-0.09654088	-0.28810918	-0.38462131	-0.09653527	-0.28808605	11.93462826	-89.66788629
hfhts		-10.59817421	-10.63406577	-9.69051192	-0.73025654	-0.35196704	-0.42149652	-0.11011945	-0.31137707	-0.42146456	-0.11011603	-0.31134854	4.19347879	-89.87151751
hn2	        -13.45230020	-13.47263133	-12.18722553	-0.98766228	-0.48177381	-0.57060145	-0.14400453	-0.42659693	-0.57022700	-0.14396600	-0.42626100	4.77282420	-96.00913508
hn2ts		-13.39063720	-13.42725992	-12.14203470	-0.97948218	-0.47470114	-0.58957035	-0.15118323	-0.43838712	-0.58923221	-0.15114195	-0.43809025	4.62372971	-96.04713769
hnc			-12.04254873	-12.04118374	-10.87044315	-0.91013276	-0.44098961	-0.50536432	-0.12227926	-0.38308505	-0.50431853	-0.12210221	-0.38221632	9.52173096	-80.84711758
hoch3fcomp1	-25.07332172	-25.06702930	-22.79749842	-1.85047701	-0.92118049	-1.04164757	-0.25760139	-0.78404619	-1.04148165	-0.25757306	-0.78390858	6.55712424	-189.50650220
hoch3fcomp2	-25.02480212	-25.02175199	-22.73764455	-1.84566413	-0.90956802	-1.04119924	-0.25390325	-0.78729598	-1.04068876	-0.25379428	-0.78689449	4.73661347	-189.49821577
hoch3fts	-24.97812777	-25.00562118	-22.72335195	-1.84611306	-0.91103855	-1.08853483	-0.26941195	-0.81912288	-1.08782424	-0.26931735	-0.81850689	6.24763144	-189.50822518
lHS			-25.34794629	-25.21079301	-23.33627870	-1.27834663	-0.62616256	-0.23209214	-0.04832069	-0.18377145	-0.23199368	-0.04830992	-0.18368377	2.98821171	-372.75471584
n2			-13.10389798	-13.12665702	-11.86788951	-0.94180923	-0.45274384	-0.57057224	-0.14503933	-0.42553291	-0.56944333	-0.14481280	-0.42463052	11.61767736	-95.87857630
lN2H2		-13.82407628	-13.83785187	-12.52814013	-1.04554755	-0.51917813	-0.60876930	-0.14412793	-0.46464137	-0.60772178	-0.14407556	-0.46364622	5.52864940	-96.21394326
lN2H		-13.45209877	-13.47246374	-12.18705947	-0.98765257	-0.48176607	-0.57064338	-0.14401652	-0.42662686	-0.57026878	-0.14397798	-0.42629081	4.77231736	-96.00931901
n2o			-21.27971727	-21.36994819	-19.39086797	-1.50694448	-0.74378728	-0.99239218	-0.26921072	-0.72318146	-0.98961783	-0.26853815	-0.72107968	9.50003461	-162.46456550
n2ohts		-21.53173022	-21.64047561	-19.63268772	-1.54214014	-0.76101467	-1.01057336	-0.27547652	-0.73509684	-1.00996379	-0.27537623	-0.73458756	3.87038691	-162.66039243
lNH2		-7.27554521	-7.25264874	-6.54545198	-0.56136836	-0.27106341	-0.26716354	-0.05761379	-0.20954975	-0.26712994	-0.05761037	-0.20951957	5.99042933	-48.31176585
lNH3		-7.65978832	-7.63993522	-6.91905577	-0.62390042	-0.31557890	-0.33607887	-0.07444692	-0.26163195	-0.33596881	-0.07442951	-0.26153929	8.12301340	-48.56063559
lNH			-6.91795518	-6.88692968	-6.20190583	-0.49542310	-0.22547823	-0.19934861	-0.04657273	-0.15277588	-0.19932555	-0.04657028	-0.15275528	7.21576321	-48.06352273
lO			-8.18835938	-8.15397376	-7.36788706	-0.53043126	-0.23393655	-0.20383040	-0.04936227	-0.15446813	-0.20382507	-0.04936170	-0.15446337	5.19606289	-66.62631167
oh-			-8.73999762	-8.76262240	-7.95715674	-0.64988995	-0.31707497	-0.40688100	-0.10348106	-0.30339994	-0.40655135	-0.10340996	-0.30314139	4.98933362	-66.66833534
oh			-8.54202343	-8.52772813	-7.72251221	-0.59714031	-0.28043713	-0.28703757	-0.06623371	-0.22080386	-0.28701872	-0.06623164	-0.22078708	4.95525633	-66.88096370
lOH			-8.54202343	-8.52772813	-7.72251221	-0.59714031	-0.28043713	-0.28703757	-0.06623371	-0.22080386	-0.28701872	-0.06623164	-0.22078708	4.95525633	-66.88096370
lPH2		-23.29813274	-23.16904491	-21.40313812	-1.23840130	-0.60588981	-0.21179815	-0.03793783	-0.17386032	-0.21165817	-0.03792621	-0.17373196	4.15897836	-318.58546186
lPH3			-23.64996174	-23.51678419	-21.72674772	-1.29753424	-0.64402978	-0.25901850	-0.04453499	-0.21448351	-0.25859782	-0.04449407	-0.21410375	8.42223359	-318.83441274
RKT01		-28.17427775	-28.03268470	-25.98403401	-1.42099659	-0.70364587	-0.31822502	-0.07005166	-0.24817336	-0.31815992	-0.07004424	-0.24811568	4.15143641	-432.40553490
RKT02		-9.16161963	-9.17448264	-8.31584365	-0.69662213	-0.33805892	-0.38775324	-0.08954648	-0.29820676	-0.38769258	-0.08953814	-0.29815444	4.96694508	-67.35208916
RKT03		-6.84494746	-6.80908385	-6.13084185	-0.62816774	-0.31690609	-0.29958758	-0.05490600	-0.24468157	-0.29953067	-0.05490280	-0.24462787	4.27499936	-33.82605516
RKT04		-15.07832547	-15.06167473	-13.64011028	-1.19513740	-0.59621102	-0.63805636	-0.14617172	-0.49188464	-0.63797719	-0.14615937	-0.49181783	4.66720499	-100.50602926
RKT05		-15.08126003	-15.06397230	-13.65598322	-1.19321999	-0.60096678	-0.64183375	-0.14778254	-0.49405121	-0.64178415	-0.14777792	-0.49400623	3.98060297	-100.47185822
RKT06		-0.93800781	-0.93450889	-0.82528040	-0.12889959	-0.06121456	-0.05878834	-0.00328770	-0.05550064	-0.05875533	-0.00328752	-0.05546782	4.91420412	-0.66474748
RKT07		-16.13533213	-16.15930083	-14.65991838	-1.22784287	-0.61093118	-0.71189239	-0.17551515	-0.53637724	-0.71177147	-0.17549099	-0.53628048	4.52381777	-115.45246165
RKT08		-34.06194449	-33.88817504	-31.27681904	-1.91651447	-0.95975854	-0.56266342	-0.12525673	-0.43740669	-0.56256351	-0.12524487	-0.43731864	3.89674213	-465.59557060
RKT09		-20.98377857	-20.93590168	-18.95779235	-1.69174317	-0.85670861	-0.88795379	-0.20334772	-0.68460607	-0.88788070	-0.20333736	-0.68454333	4.47147719	-133.64733872
RKT10		-10.62357901	-10.63198607	-9.65877165	-0.73521018	-0.34384467	-0.37691903	-0.08767596	-0.28924307	-0.37687842	-0.08767186	-0.28920656	5.63484710	-89.88433986
RKT11		-14.71512027	-14.68309982	-13.27623323	-1.13094136	-0.55053840	-0.54870035	-0.12252236	-0.42617799	-0.54862751	-0.12251325	-0.42611425	4.71784617	-100.24734426
RKT12		-23.92947348	-23.80314237	-21.98179391	-1.33084226	-0.65949994	-0.27596476	-0.04883480	-0.22712996	-0.27580906	-0.04882498	-0.22698408	4.41394498	-319.03489225
RKT13		-28.14427275	-28.01120778	-25.97846125	-1.41646623	-0.70916974	-0.33550236	-0.07947417	-0.25602818	-0.33538808	-0.07946293	-0.25592515	4.43836610	-432.40626154
RKT14		-8.80065132	-8.80059346	-7.96121501	-0.63143629	-0.29384753	-0.30573271	-0.06977214	-0.23596057	-0.30567824	-0.06976689	-0.23591135	5.00404768	-67.08819065
RKT15		-14.07926777	-14.11113911	-12.76999666	-1.08078842	-0.53532883	-0.63794918	-0.15300770	-0.48494148	-0.63747027	-0.15298840	-0.48448187	3.99448730	-96.43247901
RKT16		-25.98007173	-25.85050060	-23.92547270	-1.37166347	-0.68329641	-0.30674298	-0.06459088	-0.24215210	-0.30661417	-0.06457775	-0.24203642	4.06545999	-373.20918042
RKT17		-35.98020618	-35.86236996	-33.09244526	-1.91976110	-0.93738379	-0.59665390	-0.15423475	-0.44241915	-0.59645639	-0.15415272	-0.44230366	3.77442105	-498.86993132
RKT18		-13.44792055	-13.40641280	-12.09932576	-1.09509028	-0.54223631	-0.53272660	-0.11579962	-0.41692698	-0.53264888	-0.11579247	-0.41685641	4.35885508	-81.67685316
RKT19		-19.35485093	-19.28170010	-17.41953713	-1.59204743	-0.80381149	-0.78370666	-0.17342120	-0.61028547	-0.78363992	-0.17341494	-0.61022499	4.06239833	-114.81570379
RKT20		-19.72116085	-19.65388560	-17.77465547	-1.65572118	-0.84881942	-0.85637774	-0.19020298	-0.66617476	-0.85629841	-0.19019437	-0.66610404	4.06830187	-115.06779323
RKT21		-13.81440135	-13.77884974	-12.45521915	-1.15892445	-0.58768457	-0.60558271	-0.13266840	-0.47291430	-0.60549854	-0.13265934	-0.47283920	4.19885868	-81.92843896
RKT22		-28.65035775	-28.56730065	-25.84175314	-2.37123189	-1.22952307	-1.26958139	-0.30963054	-0.95995085	-1.26831604	-0.30943738	-0.95887866	5.68983492	-165.27191593
#G2RC(47)		ExHF	ExPBE	ExLDA	EcLDA	EcGGA	EcPT2	EcPT2ss	EcPT2os	EcSCPT2	EcSCPT2os	EcSCPT2ss	HLG	EnoXC
100			-17.96665856	-17.93893578	-16.21144791	-1.40853381	-0.70333471	-0.77001641	-0.18530747	-0.58470893	-0.76891445	-0.18508959	-0.58382486	9.77263252	-114.00165056
104			-22.31223987	-22.32907736	-20.28058889	-1.61715334	-0.80356366	-0.93412282	-0.23907581	-0.69504701	-0.93362897	-0.23900952	-0.69461945	8.33127330	-166.52552292
106			-26.97820187	-26.93973177	-24.4351052	-2.07905470	-1.05734117	-1.14055484	-0.28089409	-0.85966074	-1.14008470	-0.28084060	-0.85924410	7.60555715	-181.07513298
113			-19.96893635	-19.93765101	-18.06038221	-1.54803149	-0.77812290	-0.83609338	-0.19861593	-0.63747745	-0.83560676	-0.19856706	-0.63703970	6.78046306	-133.00089117
117			-36.78384585	-36.61114777	-33.67247434	-2.23073006	-1.13651294	-0.76609786	-0.18022092	-0.58587694	-0.76545328	-0.18012346	-0.58532981	6.61568657	-438.81976567
118			-45.72664560	-45.56509160	-41.82333214	-2.89649608	-1.47176588	-1.17472690	-0.28358948	-0.89113742	-1.17418224	-0.28349700	-0.89068525	7.24007325	-505.91800233
11			-7.65591897	-7.63653947	-6.91571627	-0.62371295	-0.31544004	-0.33652905	-0.07453211	-0.26199694	-0.33641706	-0.07451441	-0.26190265	8.12463851	-48.56427856
121			-21.43745612	-21.40923204	-19.42930234	-1.58731161	-0.78767980	-0.84067081	-0.20219314	-0.63847767	-0.84003203	-0.20216305	-0.63786898	7.97593852	-155.51399358
126			-28.22582905	-28.20727124	-25.60552792	-2.11406050	-1.06556864	-1.17972524	-0.29578218	-0.88394306	-1.17929364	-0.29572394	-0.88356970	8.26977090	-199.67063770
128			-47.13816801	-46.98622148	-43.18559348	-2.83257714	-1.42356039	-1.12996441	-0.28293860	-0.84702581	-1.12937025	-0.28284112	-0.84652913	7.43041355	-564.77555328
13			-8.92297859	-8.92209120	-8.1069343	-0.66013882	-0.32603934	-0.37515665	-0.09037736	-0.28477929	-0.37507453	-0.09036179	-0.28471275	9.19359665	-67.13922274
14			-10.39326600	-10.39324483	-9.47305505	-0.69960101	-0.33630901	-0.38547605	-0.09674243	-0.28873362	-0.38544566	-0.09673657	-0.28870909	11.88391831	-89.67190687
18			-21.73019505	-21.58985122	-19.89060488	-1.26030716	-0.61603507	-0.21569343	-0.02466767	-0.19102576	-0.21547924	-0.02465664	-0.19082260	10.66897672	-269.52657203
1			-0.65780353	-0.64791751	-0.56694038	-0.09457986	-0.04322102	-0.04398013	0.00000000	-0.04398013	-0.04394071	0.00000000	-0.04394071	13.32332436	-0.47545266
21			-25.69386108	-25.55712630	-23.66375144	-1.33736247	-0.66717471	-0.28893588	-0.06008280	-0.22885309	-0.28859332	-0.06002970	-0.22856362	7.83636500	-373.01739611
22			-27.86992849	-27.72038000	-25.71263864	-1.38003723	-0.68726716	-0.30389778	-0.07004561	-0.23385218	-0.30372056	-0.07001178	-0.23370877	9.49232341	-432.23552681
23			-3.55088607	-3.51315603	-3.07368165	-0.32990070	-0.12424212	-0.04079590	0.00000000	-0.04079590	-0.03776367	0.00000000	-0.03776367	2.49951888	-11.31754242
24			-11.94099430	-11.93590029	-10.82431399	-0.82960502	-0.37776200	-0.40424996	-0.10548645	-0.29876351	-0.40406131	-0.10544155	-0.29861976	7.01675373	-95.04433922
25			-10.98454265	-10.96449873	-9.87913635	-0.87963955	-0.43076171	-0.47037654	-0.10905240	-0.36132414	-0.46890972	-0.10876453	-0.36014519	9.25637702	-65.86194459
26			-11.73838863	-11.68969412	-10.54674733	-0.98366708	-0.49562769	-0.49153719	-0.10430975	-0.38722744	-0.49078020	-0.10427455	-0.38650564	7.99395322	-66.32168085
30			-13.30878444	-13.32007868	-12.05021428	-0.94585870	-0.44971752	-0.53894377	-0.13574642	-0.40319735	-0.53815018	-0.13561157	-0.40253861	10.04330571	-99.47063035
32			-14.05995597	-14.06025894	-12.73624585	-1.05137032	-0.51627806	-0.58705699	-0.13993720	-0.44711978	-0.58633557	-0.13988231	-0.44645327	6.50869512	-99.85043089
33			-14.81596572	-14.78458143	-13.40838091	-1.15553071	-0.58248511	-0.61687236	-0.14171466	-0.47515769	-0.61676801	-0.14170063	-0.47506739	8.49279430	-100.27366650
34			-13.11340304	-13.13433301	-11.87577816	-0.94217849	-0.45308375	-0.56677505	-0.14390386	-0.42287120	-0.56571585	-0.14369221	-0.42202364	11.70337949	-95.87019008
39			-19.90880928	-19.96816385	-18.19399787	-1.29438413	-0.61505699	-0.76881267	-0.18760574	-0.58120693	-0.76779257	-0.18758249	-0.58021007	7.97118094	-178.85024795
40			-21.58751792	-21.63234427	-19.63772518	-1.51515401	-0.74125308	-0.90980307	-0.24358922	-0.66621385	-0.90894329	-0.24338100	-0.66556229	11.56628957	-166.11509760
45			-55.02098357	-54.75461059	-50.81273198	-2.66350258	-1.32596435	-0.58368699	-0.14123927	-0.44244772	-0.58306610	-0.14116215	-0.44190396	5.28330334	-863.97007423
47			-28.50745017	-28.45243588	-26.1408929	-1.62280597	-0.77781204	-0.53758200	-0.13665945	-0.40092255	-0.53511396	-0.13614967	-0.39896429	6.78349642	-335.32980303
51			-37.50170307	-37.39381327	-34.53675953	-1.98083355	-0.97113655	-0.67177058	-0.16544947	-0.50632111	-0.67122948	-0.16540962	-0.50581986	6.15650740	-521.39791032
52			-42.78137397	-42.51861154	-39.20818328	-2.42603699	-1.19524125	-0.40558280	-0.05816816	-0.34741465	-0.40518073	-0.05813573	-0.34704500	8.64065907	-538.58072420
56			-41.41336235	-41.37803802	-38.07251057	-2.36719406	-1.17154382	-1.03854721	-0.27972969	-0.75881751	-1.03631934	-0.27934710	-0.75697224	5.98636892	-505.87579056
57			-34.17819305	-34.15695021	-31.11720745	-2.27576395	-1.09251126	-1.20479995	-0.31576273	-0.88903721	-1.20474091	-0.31575249	-0.88898842	12.96142232	-289.15407249
58			-86.55479080	-86.10163541	-79.80804353	-4.31717378	-2.15760712	-1.00605684	-0.25795699	-0.74809984	-1.00565971	-0.25787956	-0.74778015	7.32951963	-1316.80709315
59			-48.50872289	-48.42849591	-44.3488288	-2.94916946	-1.40806266	-1.20001956	-0.31284942	-0.88717014	-1.19990471	-0.31282660	-0.88707811	10.16979642	-492.10468473
60			-100.90355740	-100.36557269	-93.03749015	-4.98856863	-2.47294907	-0.95310932	-0.23883431	-0.71427501	-0.95273602	-0.23876088	-0.71397514	7.93712770	-1519.80540584
61			-45.40518278	-45.41312241	-41.42787097	-3.00501379	-1.47195203	-1.65682218	-0.43859817	-1.21822401	-1.65678385	-0.43859174	-1.21819211	15.34691817	-390.41454079
62			-115.25896975	-114.70413657	-106.36641638	-5.72881439	-2.88165280	-1.42010395	-0.36747326	-1.05263070	-1.41965360	-0.36740283	-1.05225076	7.28314638	-1760.63653122
66			-60.82062073	-60.71109544	-55.64399327	-3.69026594	-1.78405249	-1.60009826	-0.41959312	-1.18050514	-1.60003936	-0.41958337	-1.18045599	13.10065553	-626.35046007
67			-130.64901174	-129.95536605	-120.55545621	-6.41094816	-3.20706839	-1.31702694	-0.33789612	-0.97913082	-1.31666223	-0.33783137	-0.97883087	8.54935061	-1996.57961692
68			-21.28093062	-21.37102858	-19.39206431	-1.50700374	-0.74389725	-0.99229858	-0.26919993	-0.72309866	-0.98951386	-0.26852429	-0.72098957	9.50624817	-162.46340401
6			-5.77710925	-5.74447443	-5.14281649	-0.48190419	-0.22418704	-0.20784140	-0.03041142	-0.17742998	-0.20718934	-0.03040068	-0.17678866	3.77798570	-33.11422430
73			-28.02689273	-28.13695748	-25.62526527	-1.85372408	-0.89115658	-1.14358966	-0.28842131	-0.85516834	-1.14292276	-0.28836314	-0.85455961	7.29198567	-245.53137384
82			-17.68482403	-17.59473720	-15.91372958	-1.48484037	-0.77274155	-0.74252416	-0.16700020	-0.57552396	-0.74233028	-0.16697539	-0.57535489	9.44802840	-99.41070587
88			-22.83602900	-22.74363419	-20.56969953	-1.87825387	-0.97323200	-0.96472353	-0.22396514	-0.74075838	-0.96403790	-0.22391877	-0.74011913	7.63091776	-132.10763165
8			-6.58083702	-6.53537848	-5.89326912	-0.59117891	-0.30098256	-0.28188856	-0.05266639	-0.22922217	-0.28180312	-0.05265602	-0.22914711	11.95275837	-33.63096463
94			-33.23209734	-33.12589404	-29.96601165	-2.66985340	-1.37476507	-1.39395404	-0.35110961	-1.04284443	-1.39262305	-0.35087169	-1.04175136	7.07376611	-197.53517626
97			-60.93822740	-60.63160502	-56.13638189	-3.16010816	-1.58885106	-0.83246634	-0.20185002	-0.63061632	-0.83214027	-0.20179928	-0.63034099	8.29815293	-897.13060087
