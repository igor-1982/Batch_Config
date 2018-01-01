# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BH76            2              Aims

# The project description
__title__ ::
"============================== BH76 set ============================="
"        This is BH76 subset from GMTKN30 proposed by Grimme          "
" The first 76 training cases :: BH76                                 "
" The rest 30  training cases :: BH76RC                               "

#several global statements of control.in for aims Package
__aims_basis__ :: /eos/u/igor1982/export/aims/aimsfiles/species_defaults/NAO-VCC-nZ/NAO-VCC-4Z
__aims_batch_type__ :: queue  sbatch  aims_runscr_eos
__aims__ ::  32  171221.scalapack.mpi
xc                       pbe
total_energy_method      osrpa                                                                                                                                                                                     
frequency_points         60
frozen_core_postSCF      1
RI_method                V
KS_method                lapack_old
relativistic             none
occupation_type          gaussian 0.0001
mixer                    pulay
n_max_pulay              10
charge_mix_param         0.6
sc_iter_limit            1000
sc_accuracy_rho          1E-6
sc_accuracy_eev          1E-4
sc_accuracy_etot         1E-6
override_illconditioning .true.
printout_dft_components  pbe
printout_dft_components  blyp
printout_dft_components  scan
printout_dft_components  tpss
switch_external_pert     6 safe
end aims



# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/eos/u/igor1982/export/Batch_Config/Data/Aims/GMTKN30'

# The molecular set to batch: 
#              87 is the total number of jobs in this batch list
__batch__ :: 87
#  "Flag"         "DIR"                               "InpName"       "JobType"
         c2h4    <PATH1>/BH76                         c2h4         energy|osrpa|vdw
         c2h5_D0   <PATH1>/BH76                         c2h5_D0    energy|osrpa|vdw
         c2h5_D1   <PATH1>/BH76                         c2h5_D1    energy|osrpa|vdw
       c2h5ts    <PATH1>/BH76                       c2h5ts         energy|osrpa|vdw
         C2H6    <PATH1>/BH76                         C2H6         energy|osrpa|vdw
         c3h7    <PATH1>/BH76                         c3h7         energy|osrpa|vdw
       c3h7ts    <PATH1>/BH76                       c3h7ts         energy|osrpa|vdw
         C5H8    <PATH1>/BH76                         C5H8         energy|osrpa|vdw
        CH2OH    <PATH1>/BH76                        CH2OH         energy|osrpa|vdw
        ch3cl    <PATH1>/BH76                        ch3cl         energy|osrpa|vdw
          ch3    <PATH1>/BH76                          ch3         energy|osrpa|vdw
     ch3fclts    <PATH1>/BH76                     ch3fclts         energy|osrpa|vdw
         ch3f    <PATH1>/BH76                         ch3f         energy|osrpa|vdw
        ch3oh    <PATH1>/BH76                        ch3oh         energy|osrpa|vdw
          CH4    <PATH1>/BH76                          CH4         energy|osrpa|vdw
  clch3clcomp    <PATH1>/BH76                  clch3clcomp         energy|osrpa|vdw
    clch3clts    <PATH1>/BH76                    clch3clts         energy|osrpa|vdw
          cl-    <PATH1>/BH76                          cl-         energy|osrpa|vdw
           cl    <PATH1>/BH76                           cl         energy|osrpa|vdw
       clf2ts    <PATH1>/BH76                       clf2ts         energy|osrpa|vdw
          clf    <PATH1>/BH76                          clf         energy|osrpa|vdw
           co    <PATH1>/BH76                           co         energy|osrpa|vdw
           f2    <PATH1>/BH76                           f2         energy|osrpa|vdw
  fch3clcomp1    <PATH1>/BH76                  fch3clcomp1         energy|osrpa|vdw
  fch3clcomp2    <PATH1>/BH76                  fch3clcomp2         energy|osrpa|vdw
     fch3clts    <PATH1>/BH76                     fch3clts         energy|osrpa|vdw
    fch3fcomp    <PATH1>/BH76                    fch3fcomp         energy|osrpa|vdw
      fch3fts    <PATH1>/BH76                      fch3fts         energy|osrpa|vdw
           f-    <PATH1>/BH76                           f-         energy|osrpa|vdw
            f    <PATH1>/BH76                            f         energy|osrpa|vdw
           H2    <PATH1>/BH76                           H2         energy|osrpa|vdw
          H2O    <PATH1>/BH76                          H2O         energy|osrpa|vdw
          H2S    <PATH1>/BH76                          H2S         energy|osrpa|vdw
     hch3clts    <PATH1>/BH76                     hch3clts         energy|osrpa|vdw
          hcl    <PATH1>/BH76                          hcl         energy|osrpa|vdw
       hclhts    <PATH1>/BH76                       hclhts         energy|osrpa|vdw
          hcn    <PATH1>/BH76                          hcn         energy|osrpa|vdw
        hcnts    <PATH1>/BH76                        hcnts         energy|osrpa|vdw
          hco    <PATH1>/BH76                          hco         energy|osrpa|vdw
            h    <PATH1>/BH76                            h         energy|osrpa|vdw
        hcots    <PATH1>/BH76                        hcots         energy|osrpa|vdw
        hf2ts    <PATH1>/BH76                        hf2ts         energy|osrpa|vdw
      hfch3ts    <PATH1>/BH76                      hfch3ts         energy|osrpa|vdw
           hf    <PATH1>/BH76                           hf         energy|osrpa|vdw
        hfhts    <PATH1>/BH76                        hfhts         energy|osrpa|vdw
          hn2    <PATH1>/BH76                          hn2         energy|osrpa|vdw
        hn2ts    <PATH1>/BH76                        hn2ts         energy|osrpa|vdw
          hnc    <PATH1>/BH76                          hnc         energy|osrpa|vdw
  hoch3fcomp1    <PATH1>/BH76                  hoch3fcomp1         energy|osrpa|vdw
  hoch3fcomp2    <PATH1>/BH76                  hoch3fcomp2         energy|osrpa|vdw
     hoch3fts    <PATH1>/BH76                     hoch3fts         energy|osrpa|vdw
           HS    <PATH1>/BH76                           HS         energy|osrpa|vdw
           n2    <PATH1>/BH76                           n2         energy|osrpa|vdw
         N2H2    <PATH1>/BH76                         N2H2         energy|osrpa|vdw
          N2H    <PATH1>/BH76                          N2H         energy|osrpa|vdw
          n2o    <PATH1>/BH76                          n2o         energy|osrpa|vdw
       n2ohts    <PATH1>/BH76                       n2ohts         energy|osrpa|vdw
          NH2    <PATH1>/BH76                          NH2         energy|osrpa|vdw
          NH3    <PATH1>/BH76                          NH3         energy|osrpa|vdw
           NH    <PATH1>/BH76                           NH         energy|osrpa|vdw
            O    <PATH1>/BH76                            O         energy|osrpa|vdw
          oh-    <PATH1>/BH76                          oh-         energy|osrpa|vdw
           oh    <PATH1>/BH76                           oh         energy|osrpa|vdw
          PH2    <PATH1>/BH76                          PH2         energy|osrpa|vdw
          PH3    <PATH1>/BH76                          PH3         energy|osrpa|vdw
        RKT01    <PATH1>/BH76                        RKT01         energy|osrpa|vdw
        RKT02    <PATH1>/BH76                        RKT02         energy|osrpa|vdw
        RKT03    <PATH1>/BH76                        RKT03         energy|osrpa|vdw
        RKT04    <PATH1>/BH76                        RKT04         energy|osrpa|vdw
        RKT05    <PATH1>/BH76                        RKT05         energy|osrpa|vdw
        RKT06    <PATH1>/BH76                        RKT06         energy|osrpa|vdw
        RKT07    <PATH1>/BH76                        RKT07         energy|osrpa|vdw
        RKT08    <PATH1>/BH76                        RKT08         energy|osrpa|vdw
        RKT09    <PATH1>/BH76                        RKT09         energy|osrpa|vdw
        RKT10    <PATH1>/BH76                        RKT10         energy|osrpa|vdw
        RKT11    <PATH1>/BH76                        RKT11         energy|osrpa|vdw
        RKT12    <PATH1>/BH76                        RKT12         energy|osrpa|vdw
        RKT13    <PATH1>/BH76                        RKT13         energy|osrpa|vdw
        RKT14    <PATH1>/BH76                        RKT14         energy|osrpa|vdw
        RKT15    <PATH1>/BH76                        RKT15         energy|osrpa|vdw
        RKT16    <PATH1>/BH76                        RKT16         energy|osrpa|vdw
        RKT17    <PATH1>/BH76                        RKT17         energy|osrpa|vdw
        RKT18    <PATH1>/BH76                        RKT18         energy|osrpa|vdw
        RKT19    <PATH1>/BH76                        RKT19         energy|osrpa|vdw
        RKT20    <PATH1>/BH76                        RKT20         energy|osrpa|vdw
        RKT21    <PATH1>/BH76                        RKT21         energy|osrpa|vdw
        RKT22    <PATH1>/BH76                        RKT22         energy|osrpa|vdw



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
  3             hf    -1           ch3   -1    hfch3ts     1                  57.02      1.0000
  3              h    -1            f2    -1    hf2ts       1                   2.27      1.0000
  3             hf    -1             f    -1    hf2ts       1                 106.18      1.0000
  3            ch3   -1           clf    -1    ch3fclts    1                   7.43      1.0000
  3           ch3f    -1            cl   -1    ch3fclts    1                  60.17      1.0000
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
  2           c2h5_D0   -1        c2h5ts     1                                   41.75      1.0000
  3            ch3   -1          c2h4    -1    c3h7ts      1                   6.85      1.0000
  2           c3h7    -1        c3h7ts     1                                   32.97      1.0000
  2            hcn    -1         hcnts     1                                   48.16      1.0000
  2            hnc    -1         hcnts     1                                   33.11      1.0000
  3              h    -1           hcl    -1    RKT01       1                   5.70      1.0000
  3             H2    -1            cl    -1    RKT01       1                   8.70      1.0000
  3             oh    -1            H2    -1    RKT02       1                   5.10      1.0000
  3            H2O    -1             h    -1    RKT02       1                  21.20      1.0000
  3            ch3   -1            H2    -1    RKT03       1                  12.10      1.0000
  3            CH4    -1             h    -1    RKT03       1                  15.30      1.0000
  3             oh    -1           CH4    -1    RKT04       1                   6.70      1.0000
  3            H2O    -1           ch3   -1    RKT04       1                  19.60      1.0000
  3              h    -1            H2    -1    RKT06       1                   9.60      1.0000
  3              h    -1            H2    -1    RKT06       1                   9.60      1.0000
  3             oh    -1           NH3    -1    RKT07       1                   3.20      1.0000
  3            H2O    -1           NH2    -1    RKT07       1                  12.70      1.0000
  3            hcl    -1           ch3   -1    RKT08       1                   1.70      1.0000
  3             cl    -1           CH4    -1    RKT08       1                   7.90      1.0000
  3             oh    -1          C2H6    -1    RKT09       1                   3.40      1.0000
  3            H2O    -1          c2h5_D1   -1    RKT09       1                  19.90      1.0000
  3              f    -1            H2    -1    RKT10       1                   1.80      1.0000
  3             hf    -1             h    -1    RKT10       1                  33.40      1.0000
  3              O    -1           CH4    -1    RKT11       1                  13.70      1.0000
  3             oh    -1           ch3   -1    RKT11       1                   8.10      1.0000
  3              h    -1           PH3    -1    RKT12       1                   3.10      1.0000
  3             H2    -1           PH2    -1    RKT12       1                  23.20      1.0000
  3              h    -1            oh    -1    RKT14       1                  10.70      1.0000
  3             H2    -1             O    -1    RKT14       1                  13.10      1.0000
  3              h    -1           H2S    -1    RKT16       1                   3.50      1.0000
  3             H2    -1            HS    -1    RKT16       1                  17.30      1.0000
  3              O    -1           hcl    -1    RKT17       1                   9.80      1.0000
  3             oh    -1            cl    -1    RKT17       1                  10.40      1.0000
  3            NH2    -1           ch3   -1    RKT18       1                   8.00      1.0000
  3             NH    -1           CH4    -1    RKT18       1                  22.40      1.0000
  3            NH2    -1          c2h5_D1   -1    RKT19       1                   7.50      1.0000
  3             NH    -1          C2H6    -1    RKT19       1                  18.30      1.0000
  3           C2H6    -1           NH2    -1    RKT20       1                  10.40      1.0000
  3           c2h5_D1   -1           NH3    -1    RKT20       1                  17.40      1.0000
  3            NH2    -1           CH4    -1    RKT21       1                  14.50      1.0000
  3            NH3    -1           ch3   -1    RKT21       1                  17.80      1.0000
  2           C5H8    -1         RKT22     1                                   38.40      1.0000
  2           C5H8    -1         RKT22     1                                   38.40      1.0000
  4              h    -1           n2o    -1       oh       1      n2    1    -65.08      1.0000
  4              h    -1          ch3f    -1       hf       1     ch3   1    -26.64      1.0000
  4              h    -1            f2    -1       hf       1       f    1   -103.91      1.0000
  4            ch3   -1           clf    -1     ch3f       1      cl   1    -52.74      1.0000
  4             f-    -1         ch3cl    -1      cl-       1    ch3f    1    -32.65      1.0000
  2    fch3clcomp1    -1   fch3clcomp2     1                                  -26.73      1.0000
  4            oh-    -1          ch3f    -1    ch3oh       1      f-    1    -20.11      1.0000
  2    hoch3fcomp2    -1   hoch3fcomp1     1                                  -36.24      1.0000
  3              h    -1            n2    -1      hn2       1                   3.97      1.0000
  3              h    -1            co    -1      hco       1                 -19.51      1.0000
  3              h    -1          c2h4    -1     c2h5_D0    1                 -40.03      1.0000
  3            ch3   -1          c2h4    -1     c3h7       1                 -26.12      1.0000
  2            hnc    -1           hcn     1                                  -15.05      1.0000
  4              h    -1           hcl    -1       H2       1      cl    1     -3.00      1.0000
  4             oh    -1            H2    -1      H2O       1       h    1    -16.10      1.0000
  4            ch3   -1            H2    -1      CH4       1       h    1     -3.20      1.0000
  4             oh    -1           CH4    -1      H2O       1     ch3   1    -12.90      1.0000
  4             oh    -1           NH3    -1      H2O       1     NH2    1     -9.50      1.0000
  4            hcl    -1           ch3   -1       cl       1     CH4    1     -6.20      1.0000
  4             oh    -1          C2H6    -1      H2O       1    c2h5_D1   1    -16.50      1.0000
  4              f    -1            H2    -1       hf       1       h    1    -31.60      1.0000
  4              O    -1           CH4    -1       oh       1     ch3   1      5.60      1.0000
  4              h    -1           PH3    -1       H2       1     PH2    1    -20.10      1.0000
  4              h    -1            oh    -1       H2       1       O    1     -2.40      1.0000
  4              h    -1           H2S    -1       H2       1      HS    1    -13.80      1.0000
  4              O    -1           hcl    -1       oh       1      cl    1     -0.60      1.0000
  4            NH2    -1           ch3   -1       NH       1     CH4    1    -14.40      1.0000
  4            NH2    -1          c2h5_D1   -1       NH       1    C2H6    1    -10.80      1.0000
  4           C2H6    -1           NH2    -1     c2h5_D1      1     NH3    1     -7.00      1.0000
  4            NH2    -1           CH4    -1      NH3       1     ch3   1     -3.30      1.0000
