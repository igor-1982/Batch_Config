# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BH76            2             QChem

# The project description
__title__ ::
"============================== BH76 set ============================="
"        This is BH76 subset from GMTKN30 proposed by Grimme          "
" The first 76 training cases :: BH76                                 "
" The rest 30  training cases :: BH76RC                               "

# $rem group of Q-Chem Package
__qchem__ ::  1  rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static      = 200
mem_total       = 7500
exchange        = b3lyp
basis           = g3large
max_scf_cycles  = 50
scf_convergence = 7
symmetry        = false
xc_grid         = 000075000302
$end


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#              95 is the total number of jobs in this batch list
__batch__ :: 95
#  "Flag"         "DIR"                               "InpName"       "JobType"
         c2h4    <PATH1>/BH76                         c2h4.in         energy
         c2h5    <PATH1>/BH76                         c2h5.in         energy
         C2H5    <PATH1>/BH76                         C2H5.in         energy
       c2h5ts    <PATH1>/BH76                       c2h5ts.in         energy
         C2H6    <PATH1>/BH76                         C2H6.in         energy
         c3h7    <PATH1>/BH76                         c3h7.in         energy
       c3h7ts    <PATH1>/BH76                       c3h7ts.in         energy
         C5H8    <PATH1>/BH76                         C5H8.in         energy
        CH2OH    <PATH1>/BH76                        CH2OH.in         energy
        ch3cl    <PATH1>/BH76                        ch3cl.in         energy
          ch3    <PATH1>/BH76                          ch3.in         energy
          CH3    <PATH1>/BH76                          CH3.in         energy
     ch3fclts    <PATH1>/BH76                     ch3fclts.in         energy
         ch3f    <PATH1>/BH76                         ch3f.in         energy
        ch3oh    <PATH1>/BH76                        ch3oh.in         energy
        CH3OH    <PATH1>/BH76                        CH3OH.in         energy
          CH4    <PATH1>/BH76                          CH4.in         energy
  clch3clcomp    <PATH1>/BH76                  clch3clcomp.in         energy
    clch3clts    <PATH1>/BH76                    clch3clts.in         energy
          cl-    <PATH1>/BH76                          cl-.in         energy
           cl    <PATH1>/BH76                           cl.in         energy
           Cl    <PATH1>/BH76                           Cl.in         energy
       clf2ts    <PATH1>/BH76                       clf2ts.in         energy
          clf    <PATH1>/BH76                          clf.in         energy
           co    <PATH1>/BH76                           co.in         energy
           f2    <PATH1>/BH76                           f2.in         energy
  fch3clcomp1    <PATH1>/BH76                  fch3clcomp1.in         energy
  fch3clcomp2    <PATH1>/BH76                  fch3clcomp2.in         energy
     fch3clts    <PATH1>/BH76                     fch3clts.in         energy
    fch3fcomp    <PATH1>/BH76                    fch3fcomp.in         energy
      fch3fts    <PATH1>/BH76                      fch3fts.in         energy
           f-    <PATH1>/BH76                           f-.in         energy
            f    <PATH1>/BH76                            f.in         energy
            F    <PATH1>/BH76                            F.in         energy
           H2    <PATH1>/BH76                           H2.in         energy
          H2O    <PATH1>/BH76                          H2O.in         energy
          H2S    <PATH1>/BH76                          H2S.in         energy
     hch3clts    <PATH1>/BH76                     hch3clts.in         energy
          hcl    <PATH1>/BH76                          hcl.in         energy
          HCl    <PATH1>/BH76                          HCl.in         energy
       hclhts    <PATH1>/BH76                       hclhts.in         energy
          hcn    <PATH1>/BH76                          hcn.in         energy
        hcnts    <PATH1>/BH76                        hcnts.in         energy
          hco    <PATH1>/BH76                          hco.in         energy
            h    <PATH1>/BH76                            h.in         energy
            H    <PATH1>/BH76                            H.in         energy
        hcots    <PATH1>/BH76                        hcots.in         energy
        hf2ts    <PATH1>/BH76                        hf2ts.in         energy
      hfch3ts    <PATH1>/BH76                      hfch3ts.in         energy
           hf    <PATH1>/BH76                           hf.in         energy
           HF    <PATH1>/BH76                           HF.in         energy
        hfhts    <PATH1>/BH76                        hfhts.in         energy
          hn2    <PATH1>/BH76                          hn2.in         energy
        hn2ts    <PATH1>/BH76                        hn2ts.in         energy
          hnc    <PATH1>/BH76                          hnc.in         energy
  hoch3fcomp1    <PATH1>/BH76                  hoch3fcomp1.in         energy
  hoch3fcomp2    <PATH1>/BH76                  hoch3fcomp2.in         energy
     hoch3fts    <PATH1>/BH76                     hoch3fts.in         energy
           HS    <PATH1>/BH76                           HS.in         energy
           n2    <PATH1>/BH76                           n2.in         energy
         N2H2    <PATH1>/BH76                         N2H2.in         energy
          N2H    <PATH1>/BH76                          N2H.in         energy
          n2o    <PATH1>/BH76                          n2o.in         energy
       n2ohts    <PATH1>/BH76                       n2ohts.in         energy
          NH2    <PATH1>/BH76                          NH2.in         energy
          NH3    <PATH1>/BH76                          NH3.in         energy
           NH    <PATH1>/BH76                           NH.in         energy
            O    <PATH1>/BH76                            O.in         energy
          oh-    <PATH1>/BH76                          oh-.in         energy
           oh    <PATH1>/BH76                           oh.in         energy
           OH    <PATH1>/BH76                           OH.in         energy
          PH2    <PATH1>/BH76                          PH2.in         energy
          PH3    <PATH1>/BH76                          PH3.in         energy
        RKT01    <PATH1>/BH76                        RKT01.in         energy
        RKT02    <PATH1>/BH76                        RKT02.in         energy
        RKT03    <PATH1>/BH76                        RKT03.in         energy
        RKT04    <PATH1>/BH76                        RKT04.in         energy
        RKT05    <PATH1>/BH76                        RKT05.in         energy
        RKT06    <PATH1>/BH76                        RKT06.in         energy
        RKT07    <PATH1>/BH76                        RKT07.in         energy
        RKT08    <PATH1>/BH76                        RKT08.in         energy
        RKT09    <PATH1>/BH76                        RKT09.in         energy
        RKT10    <PATH1>/BH76                        RKT10.in         energy
        RKT11    <PATH1>/BH76                        RKT11.in         energy
        RKT12    <PATH1>/BH76                        RKT12.in         energy
        RKT13    <PATH1>/BH76                        RKT13.in         energy
        RKT14    <PATH1>/BH76                        RKT14.in         energy
        RKT15    <PATH1>/BH76                        RKT15.in         energy
        RKT16    <PATH1>/BH76                        RKT16.in         energy
        RKT17    <PATH1>/BH76                        RKT17.in         energy
        RKT18    <PATH1>/BH76                        RKT18.in         energy
        RKT19    <PATH1>/BH76                        RKT19.in         energy
        RKT20    <PATH1>/BH76                        RKT20.in         energy
        RKT21    <PATH1>/BH76                        RKT21.in         energy
        RKT22    <PATH1>/BH76                        RKT22.in         energy



# Training set for the atomization energy
#              106 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 106  627.51
#"Number"    "Flag" "Scale"                                                    "Ref"      "Weight"
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
  3              H    -1           HCl    -1    RKT01       1                   5.70      1.0000
  3             H2    -1            Cl    -1    RKT01       1                   8.70      1.0000
  3             OH    -1            H2    -1    RKT02       1                   5.10      1.0000
  3            H2O    -1             H    -1    RKT02       1                  21.20      1.0000
  3            CH3    -1            H2    -1    RKT03       1                  12.10      1.0000
  3            CH4    -1             H    -1    RKT03       1                  15.30      1.0000
  3             OH    -1           CH4    -1    RKT04       1                   6.70      1.0000
  3            H2O    -1           CH3    -1    RKT04       1                  19.60      1.0000
  3              H    -1            H2    -1    RKT06       1                   9.60      1.0000
  3              H    -1            H2    -1    RKT06       1                   9.60      1.0000
  3             OH    -1           NH3    -1    RKT07       1                   3.20      1.0000
  3            H2O    -1           NH2    -1    RKT07       1                  12.70      1.0000
  3            HCl    -1           CH3    -1    RKT08       1                   1.70      1.0000
  3             Cl    -1           CH4    -1    RKT08       1                   7.90      1.0000
  3             OH    -1          C2H6    -1    RKT09       1                   3.40      1.0000
  3            H2O    -1          C2H5    -1    RKT09       1                  19.90      1.0000
  3              F    -1            H2    -1    RKT10       1                   1.80      1.0000
  3             HF    -1             H    -1    RKT10       1                  33.40      1.0000
  3              O    -1           CH4    -1    RKT11       1                  13.70      1.0000
  3             OH    -1           CH3    -1    RKT11       1                   8.10      1.0000
  3              H    -1           PH3    -1    RKT12       1                   3.10      1.0000
  3             H2    -1           PH2    -1    RKT12       1                  23.20      1.0000
  3              H    -1            OH    -1    RKT14       1                  10.70      1.0000
  3             H2    -1             O    -1    RKT14       1                  13.10      1.0000
  3              H    -1           H2S    -1    RKT16       1                   3.50      1.0000
  3             H2    -1            HS    -1    RKT16       1                  17.30      1.0000
  3              O    -1           HCl    -1    RKT17       1                   9.80      1.0000
  3             OH    -1            Cl    -1    RKT17       1                  10.40      1.0000
  3            NH2    -1           CH3    -1    RKT18       1                   8.00      1.0000
  3             NH    -1           CH4    -1    RKT18       1                  22.40      1.0000
  3            NH2    -1          C2H5    -1    RKT19       1                   7.50      1.0000
  3             NH    -1          C2H6    -1    RKT19       1                  18.30      1.0000
  3           C2H6    -1           NH2    -1    RKT20       1                  10.40      1.0000
  3           C2H5    -1           NH3    -1    RKT20       1                  17.40      1.0000
  3            NH2    -1           CH4    -1    RKT21       1                  14.50      1.0000
  3            NH3    -1           CH3    -1    RKT21       1                  17.80      1.0000
  2           C5H8    -1         RKT22     1                                   38.40      1.0000
  2           C5H8    -1         RKT22     1                                   38.40      1.0000
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
  4              H    -1           HCl    -1       H2       1      Cl    1     -3.00      1.0000
  4             OH    -1            H2    -1      H2O       1       H    1    -16.10      1.0000
  4            CH3    -1            H2    -1      CH4       1       H    1     -3.20      1.0000
  4             OH    -1           CH4    -1      H2O       1     CH3    1    -12.90      1.0000
  4             OH    -1           NH3    -1      H2O       1     NH2    1     -9.50      1.0000
  4            HCl    -1           CH3    -1       Cl       1     CH4    1     -6.20      1.0000
  4             OH    -1          C2H6    -1      H2O       1    C2H5    1    -16.50      1.0000
  4              F    -1            H2    -1       HF       1       H    1    -31.60      1.0000
  4              O    -1           CH4    -1       OH       1     CH3    1      5.60      1.0000
  4              H    -1           PH3    -1       H2       1     PH2    1    -20.10      1.0000
  4              H    -1            OH    -1       H2       1       O    1     -2.40      1.0000
  4              H    -1           H2S    -1       H2       1      HS    1    -13.80      1.0000
  4              O    -1           HCl    -1       OH       1      Cl    1     -0.60      1.0000
  4            NH2    -1           CH3    -1       NH       1     CH4    1    -14.40      1.0000
  4            NH2    -1          C2H5    -1       NH       1    C2H6    1    -10.80      1.0000
  4           C2H6    -1           NH2    -1     C2H5       1     NH3    1     -7.00      1.0000
  4            NH2    -1           CH4    -1      NH3       1     CH3    1     -3.30      1.0000
