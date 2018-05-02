# The project environment :
# "ProjDir" specifying the storage DIR of this project
# "ProjCtrl" = 0 : to run all the jobs
#            = 1 : to fetch result from existed log and chk files
#            = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using FHI-aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./OPT           0              Aims

# The project description
__title__ ::
"======================== PES N2 and H2 ============================"
"              There are 56 molecules in G2-1 set                   "
"All the geometries are optimized at the level of B3LYP/6-311+G(d,p)"

__initial guess__ ::
  0.8E0  1.0E0  3.0E+1  4.0E-2 

# "There are about algorithms at present:                                    "
# "   0) batch    :: just batch the results based on intital guess           "
# "   1) leastsq  :: least square fit algorithm                              "
# "   2) fmin_rms :: downhill simplex algorithm based on RMS                 "
# "   3) fmin_mad :: downhill simplex algorithm based on MAD                 "
# "   4) fmin_cobyla_rms :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on RMS                            "
# "   5) fmin_cobyla_mad :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on MAD                            "
__optimization algorithm__ :: fmin_rms

__optimization job__ :: scsrpa

__optimization function__ :: update_aims_scsrpa.py

# several global statements of control.in for aims Package
__aims_basis__ :: /share/home/wenxinzy/export/BasisSet/Mixed-nZ/Basis-4Z
__aims_batch_type__ :: serial Aims_Environment.xhpc1
__aims__ ::  24 1 24 180424.scalapack.mpi
xc                       pbe0
total_energy_method      osrpa
frozen_core_postSCF      1
frequency_points         60
frozen_core_postSCF      1
relativistic             none
occupation_type          gaussian 0.0001
mixer                    pulay
n_max_pulay              10
charge_mix_param         0.6
sc_accuracy_rho          1E-6
sc_accuracy_eev          1E-4
sc_accuracy_etot         1E-6
sc_iter_limit            200
override_illconditioning .true.
end aims
# "CPU numbers to run aims for special jobs"   "CPU numbers"  "List of job indices in Batch"
#__aims_special_nproc__ ::                       2              1

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> = '/share/home/wenxinzy/export/Batch_Config/Data/Aims/PEC_Dimer'
<PATH2> = '/share/home/wenxinzy/export/Batch_Config/Data/Aims/PEC_Dimer'
<PATH3> = '/share/home/wenxinzy/export/Batch_Config/Data/Aims/PEC_Dimer'
<PATH4> = '/share/home/wenxinzy/export/Batch_Config/Data/Aims/GMTKN30'
<PATH5> = '/share/home/wenxinzy/export/Batch_Config/Data/Aims/MR-All
# The molecular set to batch: 
#               79 is the total number of jobs in this batch list
__batch__ :: 53 
#"Flag"         "DIR"                         "InpName"       "JobType"
# H2  18
  H             <PATH1>/H2                          H         scsrpa 
  H2_0_6        <PATH1>/H2                     H2_0_6         scsrpa 
  H2_0_6_5      <PATH1>/H2                   H2_0_6_5         scsrpa 
  H2_0_7        <PATH1>/H2                     H2_0_7         scsrpa 
  H2_0_7_5      <PATH1>/H2                   H2_0_7_5         scsrpa 
  H2_0_8        <PATH1>/H2                     H2_0_8         scsrpa 
  H2_1_0        <PATH1>/H2                     H2_1_0         scsrpa 
  H2_1_4        <PATH1>/H2                     H2_1_4         scsrpa 
  H2_1_8        <PATH1>/H2                     H2_1_8         scsrpa 
  H2_2_2        <PATH1>/H2                     H2_2_2         scsrpa 
  H2_2_6        <PATH1>/H2                     H2_2_6         scsrpa 
  H2_3_0        <PATH1>/H2                     H2_3_0         scsrpa 
  H2_3_4        <PATH1>/H2                     H2_3_4         scsrpa 
  H2_3_8        <PATH1>/H2                     H2_3_8         scsrpa 
  H2_4_2        <PATH1>/H2                     H2_4_2         scsrpa 
  H2_5_0        <PATH1>/H2                     H2_5_0         scsrpa 
  H2_6_2        <PATH1>/H2                     H2_6_2         scsrpa 
  H2_7_0        <PATH1>/H2                     H2_7_0         scsrpa 
# N2 set 7
  N             <PATH2>/N2                          N         scsrpa 
  N2_1_0_5      <PATH2>/N2                   N2_1_0_5         scsrpa 
  N2_1_1        <PATH2>/N2                     N2_1_1         scsrpa 
  N2_1_1_5      <PATH2>/N2                   N2_1_1_5         scsrpa 
  N2_1_3        <PATH2>/N2                     N2_1_3         scsrpa 
  N2_1_6        <PATH2>/N2                     N2_1_6         scsrpa 
  N2_3_4        <PATH2>/N2                     N2_3_4         scsrpa 
# G2RC set 17 in 47
    1           <PATH4>/G2RC                        1         scsrpa
    8           <PATH4>/G2RC                        8         scsrpa
   13           <PATH4>/G2RC                       13         scsrpa
   14           <PATH4>/G2RC                       14         scsrpa
   18           <PATH4>/G2RC                       18         scsrpa
   21           <PATH4>/G2RC                       21         scsrpa
   23           <PATH4>/G2RC                       23         scsrpa
   24           <PATH4>/G2RC                       24         scsrpa
   30           <PATH4>/G2RC                       30         scsrpa
   34           <PATH4>/G2RC                       34         scsrpa
   39           <PATH4>/G2RC                       39         scsrpa
   40           <PATH4>/G2RC                       40         scsrpa
   47           <PATH4>/G2RC                       47         scsrpa
   56           <PATH4>/G2RC                       56         scsrpa
   68           <PATH4>/G2RC                       68         scsrpa
   73           <PATH4>/G2RC                       73         scsrpa
  104           <PATH4>/G2RC                      104         scsrpa
# MR-MGM-BE4 11
  CaO           <PATH5>/MR-MGM-BE4                CaO         scsrpa
  KO-           <PATH5>/MR-MGM-BE4                KO-         scsrpa
  LiO-          <PATH5>/MR-MGM-BE4                LiO-        scsrpa
  MgS           <PATH5>/MR-MGM-BE4                MgS         scsrpa
  Ca            <PATH5>/MR-MGM-BE4                Ca          scsrpa
  K             <PATH5>/MR-MGM-BE4                K           scsrpa
  Li            <PATH5>/MR-MGM-BE4                Li          scsrpa
  Mg            <PATH5>/MR-MGM-BE4                Mg          scsrpa
  O             <PATH5>/MR-MGM-BE4                O           scsrpa
  O-            <PATH5>/MR-MGM-BE4                O-          scsrpa
  S             <PATH5>/MR-MGM-BE4                S           scsrpa
# Rest Of G2RC
  100           <PATH4>/G2RC                      100         scsrpa
  106           <PATH4>/G2RC                      106         scsrpa
  113           <PATH4>/G2RC                      113         scsrpa
  117           <PATH4>/G2RC                      117         scsrpa
  118           <PATH4>/G2RC                      118         scsrpa
   11           <PATH4>/G2RC                       11         scsrpa
  121           <PATH4>/G2RC                      121         scsrpa
  126           <PATH4>/G2RC                      126         scsrpa
  128           <PATH4>/G2RC                      128         scsrpa
   22           <PATH4>/G2RC                       22         scsrpa
   25           <PATH4>/G2RC                       25         scsrpa
   26           <PATH4>/G2RC                       26         scsrpa
   32           <PATH4>/G2RC                       32         scsrpa
   33           <PATH4>/G2RC                       33         scsrpa
   45           <PATH4>/G2RC                       45         scsrpa
   51           <PATH4>/G2RC                       51         scsrpa
   52           <PATH4>/G2RC                       52         scsrpa
   57           <PATH4>/G2RC                       57         scsrpa
   58           <PATH4>/G2RC                       58         scsrpa
   59           <PATH4>/G2RC                       59         scsrpa
   60           <PATH4>/G2RC                       60         scsrpa
   61           <PATH4>/G2RC                       61         scsrpa
   62           <PATH4>/G2RC                       62         scsrpa
   66           <PATH4>/G2RC                       66         scsrpa
   67           <PATH4>/G2RC                       67         scsrpa
    6           <PATH4>/G2RC                        6         scsrpa
   82           <PATH4>/G2RC                       82         scsrpa
   88           <PATH4>/G2RC                       88         scsrpa
   94           <PATH4>/G2RC                       94         scsrpa
   97           <PATH4>/G2RC                       97         scsrpa
# H2...H2 dimer 7
  H2            <PATH3>/H2_dimer                   H2         scsrpa
  H2_dimer_3_5  <PATH3>/H2_dimer         H2_dimer_3_5         scsrpa
  H2_dimer_3_6  <PATH3>/H2_dimer         H2_dimer_3_6         scsrpa
  H2_dimer_3_7  <PATH3>/H2_dimer         H2_dimer_3_7         scsrpa
  H2_dimer_4_0  <PATH3>/H2_dimer         H2_dimer_4_0         scsrpa
  H2_dimer_4_6  <PATH3>/H2_dimer         H2_dimer_4_6         scsrpa
  H2_dimer_5_8  <PATH3>/H2_dimer         H2_dimer_5_8         scsrpa

# Training set for the atomization energy
#               54 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "a.u."
#         27.21138 is the scale factor from "a.u." to "ev", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "ev"
__energy__ :: 35  27.21138
#"Number" "Flag"      "Scale"                                      "Ref"         "Weight"
# H2 16 Refs are CCSD(T)/aug-cc-pV5Z
 2        H2_0_6_5    1         H  -2                              -4.55640109   1.0000
 2        H2_0_7      1         H  -2                              -4.70784385   1.0000
 2        H2_0_7_5    1         H  -2                              -4.74068227   1.0000
 2        H2_0_8      1         H  -2                              -4.68774090   1.0000
 2        H2_1_0      1         H  -2                              -4.01510171   1.0000
 2        H2_1_4      1         H  -2                              -2.23326054   6.0000
 2        H2_1_8      1         H  -2                              -0.97761481   6.0000
 2        H2_2_2      1         H  -2                              -0.35622254   6.0000
 2        H2_2_6      1         H  -2                              -0.11683886   6.0000
 2        H2_3_0      1         H  -2                              -0.03709510   1.0000
 2        H2_3_4      1         H  -2                              -0.01198825   1.0000
 2        H2_3_8      1         H  -2                              -0.00412035   1.0000
 2        H2_4_2      1         H  -2                              -0.00157445   1.0000
 2        H2_5_0      1         H  -2                              -0.00035048   1.0000
 2        H2_6_2      1         H  -2                              -0.00007883   1.0000
 2        H2_7_0      1         H  -2                              -0.00003679   1.0000
# N2 6 Refs are calculated by CCSD(T)/aug-cc-pV5Z for 1.05,1.10,1.15,1.30,1.60
#               for 3.40, the reference is set to 0.0
 2        N2_1_0_5    1         N  -2                              -9.57186958   1.0000
 2        N2_1_1      1         N  -2                              -9.77053987   1.0000
 2        N2_1_1_5    1         N  -2                              -9.60890427   1.0000
 2        N2_1_3      1         N  -2                              -7.96443894   6.0000
 2        N2_1_6      1         N  -2                              -3.74038921   6.0000
 2        N2_3_4      1         N  -2                              -0.00000000   1.0000
# G2RC 9 in 25 Refs are Experimental results generated by HOFs from the G2/97 set
 3    40     -1     1    -1    104    1                            -0.08802905    1.0000
 4    30     -1    13    -1     40    1     1      1               -0.30398209    1.0000
 4    47     -1     1    -3     18    1    13      1               -1.47047542    1.0000
 4    56     -1     1    -3     21    1    13      2               -2.62222497    1.0000
 4    30     -1     1    -3     13    1     8      1               -2.80912409    1.0000
 4    73     -1     1    -1     39    1    13      1               -2.97997850    1.0000
 4    68     -1     1    -1     34    1    13      1               -3.50121455    1.0000
 3     1     -1    39    -1     14    2                            -5.82336020    1.0000
 3    23     -1    39    -1     24    2                            -9.22353648    6.0000
# MR-MGM-BE4  4
  3     CaO    -1   Ca       1       O    1                   4.1694542       1.0000
  3     LiO-   -1   Li       1       O-   1                   2.4973361       1.0000
  3      KO-   -1    K       1       O-   1                   1.4370849       1.0000
  3     MgS    -1   Mg       1       S    1                   2.4145107       1.0000
# H2...H2 6 Refs are calculated by CCSD(T)/aug-cc-pV5Z
 2         H2_dimer_3_5     1        H2   -2                       -0.00151595   11.0000
 2         H2_dimer_3_6     1        H2   -2                       -0.00153635   11.0000
 2         H2_dimer_3_7     1        H2   -2                       -0.00147867   11.0000
 2         H2_dimer_4_0     1        H2   -2                       -0.00112818   11.0000
 2         H2_dimer_4_6     1        H2   -2                       -0.00051593   11.0000
 2         H2_dimer_5_8     1        H2   -2                       -0.00010476   11.0000
# Rest of G2RC 25-8
 3   118     -1   117     1     13    1                            -0.04162950    1.0000
 3   113     -1    30     1      8    1                            -0.11057836    1.0000
 3    52     -1     1    -1     18    2                            -0.16825257    1.0000
 4   128     -1    13    -1    126    1    22      1               -0.43190608    1.0000
 3   100     -1    13    -1    106    1                            -0.87291861    1.0000
 3    25     -1    14    -1    121    1                            -1.10014631    1.0000
 3    39     -1    45    -1     51    2                            -1.14567858    1.0000
 4    58     -1    59    -1     57    1    60      1               -1.16432513    1.0000
 4    67     -1    61    -1     66    1    62      1               -1.14177581    1.0000
 3    32     -1     1    -1     33    1                            -1.26753160    1.0000
 3    25     -1    26    -1     88    1                            -1.41930583    1.0000
 3    34     -1     1    -3     11    2                            -1.68556118    1.0000
 4     8     -1    45    -2     97    1    22      2               -2.04158015    1.0000
 3    25     -1     1    -1     26    1                            -2.09968799    1.0000
 3    26     -1     6    -1     82    1                            -4.72928485    1.0000
 2    25     -3    94     1                                        -6.57269123    1.0000
