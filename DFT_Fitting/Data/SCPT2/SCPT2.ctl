# The project environment :
# "ProjDir" specifying the storage DIR of this project
# "ProjCtrl" = 0 : to run all the jobs
#            = 1 : to fetch result from existed log and chk files
#            = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using FHI-aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./SCPT2            0              Aims

# The project description
__title__ ::
"======================== PES N2 and H2 ============================"
"              There are 56 molecules in G2-1 set                   "
"All the geometries are optimized at the level of B3LYP/6-311+G(d,p)"

__initial guess__ ::
# enhanced_factor,  screen_factor,  shift_factor
  1.0E0,            1.0E0           0.0E0

# "There are about algorithms at present:                                    "
# "   0) batch    :: just batch the results based on intital guess           "
# "   1) leastsq  :: least square fit algorithm                              "
# "   2) fmin_rms :: downhill simplex algorithm based on RMS                 "
# "   3) fmin_mad :: downhill simplex algorithm based on MAD                 "
# "   4) fmin_cobyla_rms :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on RMS                            "
# "   5) fmin_cobyla_mad :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on MAD                            "
__optimization algorithm__ :: fmin_mad

__optimization job__ :: scpt2

__optimization function__ :: update_aims_scpt2.py

# several global statements of control.in for aims Package
__aims_basis__ :: /u/igor1982/export/Basis_set_Fitting/more_tight_NCC_V05_b/NCC-pV5Z
__aims__ ::  16  030113.mpi
xc                      pbe0
total_energy_method     mp2
frozen_core_postSCF     1
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.6
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           200
override_illconditioning .true.
end aims
# "CPU numbers to run aims for special jobs"   "CPU numbers"  "List of job indices in Batch"
__aims_special_nproc__ ::                      16              1
__aims_special_nproc__ ::                      16              2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> = '/u/igor1982/export/Batch_Config/Data/Aims/PEC_Dimer'
<PATH2> = '/u/igor1982/export/Batch_Config/Data/Aims/PEC_Dimer'
<PATH3> = '/u/igor1982/export/Batch_Config/Data/Aims/PEC_Dimer'
<PATH4> = '/u/igor1982/export/Batch_Config/Data/Aims/GMTKN30'

# The molecular set to batch: 
#               79 is the total number of jobs in this batch list
__batch__ ::  79
#"Flag"         "DIR"                         "InpName"       "JobType"
# H2  18
  H             <PATH1>/H2                          H         scpt2 
  H2_0_6        <PATH1>/H2                     H2_0_6         scpt2 
  H2_0_6_5      <PATH1>/H2                   H2_0_6_5         scpt2 
  H2_0_7        <PATH1>/H2                     H2_0_7         scpt2 
  H2_0_7_5      <PATH1>/H2                   H2_0_7_5         scpt2 
  H2_0_8        <PATH1>/H2                     H2_0_8         scpt2 
  H2_1_0        <PATH1>/H2                     H2_1_0         scpt2 
  H2_1_4        <PATH1>/H2                     H2_1_4         scpt2 
  H2_1_8        <PATH1>/H2                     H2_1_8         scpt2 
  H2_2_2        <PATH1>/H2                     H2_2_2         scpt2 
  H2_2_6        <PATH1>/H2                     H2_2_6         scpt2 
  H2_3_0        <PATH1>/H2                     H2_3_0         scpt2 
  H2_3_4        <PATH1>/H2                     H2_3_4         scpt2 
  H2_3_8        <PATH1>/H2                     H2_3_8         scpt2 
  H2_4_2        <PATH1>/H2                     H2_4_2         scpt2 
  H2_5_0        <PATH1>/H2                     H2_5_0         scpt2 
  H2_6_2        <PATH1>/H2                     H2_6_2         scpt2 
  H2_7_0        <PATH1>/H2                     H2_7_0         scpt2 
# N2 set 7
  N             <PATH2>/N2                          N         scpt2 
  N2_1_0_5      <PATH2>/N2                   N2_1_0_5         scpt2 
  N2_1_1        <PATH2>/N2                     N2_1_1         scpt2 
  N2_1_1_5      <PATH2>/N2                   N2_1_1_5         scpt2 
  N2_1_3        <PATH2>/N2                     N2_1_3         scpt2 
  N2_1_6        <PATH2>/N2                     N2_1_6         scpt2 
  N2_3_4        <PATH2>/N2                     N2_3_4         scpt2 
# H2...H2 dimer 7
  H2            <PATH3>/H2_dimer                   H2         scpt2
  H2_dimer_3_5  <PATH3>/H2_dimer         H2_dimer_3_5         scpt2
  H2_dimer_3_6  <PATH3>/H2_dimer         H2_dimer_3_6         scpt2
  H2_dimer_3_7  <PATH3>/H2_dimer         H2_dimer_3_7         scpt2
  H2_dimer_4_0  <PATH3>/H2_dimer         H2_dimer_4_0         scpt2
  H2_dimer_4_6  <PATH3>/H2_dimer         H2_dimer_4_6         scpt2
  H2_dimer_5_8  <PATH3>/H2_dimer         H2_dimer_5_8         scpt2
# G2RC set 47
  100           <PATH4>/G2RC                      100         scpt2
  104           <PATH4>/G2RC                      104         scpt2
  106           <PATH4>/G2RC                      106         scpt2
  113           <PATH4>/G2RC                      113         scpt2
  117           <PATH4>/G2RC                      117         scpt2
  118           <PATH4>/G2RC                      118         scpt2
   11           <PATH4>/G2RC                       11         scpt2
  121           <PATH4>/G2RC                      121         scpt2
  126           <PATH4>/G2RC                      126         scpt2
  128           <PATH4>/G2RC                      128         scpt2
   13           <PATH4>/G2RC                       13         scpt2
   14           <PATH4>/G2RC                       14         scpt2
   18           <PATH4>/G2RC                       18         scpt2
    1           <PATH4>/G2RC                        1         scpt2
   21           <PATH4>/G2RC                       21         scpt2
   22           <PATH4>/G2RC                       22         scpt2
   23           <PATH4>/G2RC                       23         scpt2
   24           <PATH4>/G2RC                       24         scpt2
   25           <PATH4>/G2RC                       25         scpt2
   26           <PATH4>/G2RC                       26         scpt2
   30           <PATH4>/G2RC                       30         scpt2
   32           <PATH4>/G2RC                       32         scpt2
   33           <PATH4>/G2RC                       33         scpt2
   34           <PATH4>/G2RC                       34         scpt2
   39           <PATH4>/G2RC                       39         scpt2
   40           <PATH4>/G2RC                       40         scpt2
   45           <PATH4>/G2RC                       45         scpt2
   47           <PATH4>/G2RC                       47         scpt2
   51           <PATH4>/G2RC                       51         scpt2
   52           <PATH4>/G2RC                       52         scpt2
   56           <PATH4>/G2RC                       56         scpt2
   57           <PATH4>/G2RC                       57         scpt2
   58           <PATH4>/G2RC                       58         scpt2
   59           <PATH4>/G2RC                       59         scpt2
   60           <PATH4>/G2RC                       60         scpt2
   61           <PATH4>/G2RC                       61         scpt2
   62           <PATH4>/G2RC                       62         scpt2
   66           <PATH4>/G2RC                       66         scpt2
   67           <PATH4>/G2RC                       67         scpt2
   68           <PATH4>/G2RC                       68         scpt2
    6           <PATH4>/G2RC                        6         scpt2
   73           <PATH4>/G2RC                       73         scpt2
   82           <PATH4>/G2RC                       82         scpt2
   88           <PATH4>/G2RC                       88         scpt2
    8           <PATH4>/G2RC                        8         scpt2
   94           <PATH4>/G2RC                       94         scpt2
   97           <PATH4>/G2RC                       97         scpt2

# Training set for the atomization energy
#               48 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "a.u."
#         27.21138 is the scale factor from "a.u." to "ev", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "ev"
__energy__ :: 48 27.21138 
#"Number" "Flag"      "Scale"                                      "Ref"         "Weight"
# H2 17 Refs are CCSD(T)/aug-cc-pV5Z
 2        H2_0_6      1         H  -2                              -4.24075153   11.0000
 2        H2_0_6_5    1         H  -2                              -4.55640109   11.0000
 2        H2_0_7      1         H  -2                              -4.70784385   11.0000
 2        H2_0_7_5    1         H  -2                              -4.74068227   11.0000
 2        H2_0_8      1         H  -2                              -4.68774090   11.0000
 2        H2_1_0      1         H  -2                              -4.01510171   11.0000
 2        H2_1_4      1         H  -2                              -2.23326054   11.0000
 2        H2_1_8      1         H  -2                              -0.97761481   11.0000
 2        H2_2_2      1         H  -2                              -0.35622254   11.0000
 2        H2_2_6      1         H  -2                              -0.11683886   11.0000
 2        H2_3_0      1         H  -2                              -0.03709510   11.0000
 2        H2_3_4      1         H  -2                              -0.01198825   11.0000
 2        H2_3_8      1         H  -2                              -0.00412035   11.0000
 2        H2_4_2      1         H  -2                              -0.00157445   11.0000
 2        H2_5_0      1         H  -2                              -0.00035048   11.0000
 2        H2_6_2      1         H  -2                              -0.00007883   11.0000
 2        H2_7_0      1         H  -2                              -0.00003679   11.0000
# N2 6 Refs are calculated by CCSD(T)/aug-cc-pV5Z for 1.05,1.10,1.15,1.30,1.60
#               for 3.40, the reference is set to 0.0
 2        N2_1_0_5    1         N  -2                              -9.57186958   11.0000
 2        N2_1_1      1         N  -2                              -9.77053987   11.0000
 2        N2_1_1_5    1         N  -2                              -9.60890427   11.0000
 2        N2_1_3      1         N  -2                              -7.96443894   11.0000
 2        N2_1_6      1         N  -2                              -3.74038921   11.0000
 2        N2_3_4      1         N  -2                              -0.00000000   11.0000
# H2...H2 6 Refs are calculated by CCSD(T)/aug-cc-pV5Z
 2         H2_dimer_3_5     1        H2   -2                       -0.00151595   11.0000
 2         H2_dimer_3_6     1        H2   -2                       -0.00153635   11.0000
 2         H2_dimer_3_7     1        H2   -2                       -0.00147867   11.0000
 2         H2_dimer_4_0     1        H2   -2                       -0.00112818   11.0000
 2         H2_dimer_4_6     1        H2   -2                       -0.00051593   11.0000
 2         H2_dimer_5_8     1        H2   -2                       -0.00010476   11.0000
# G2RC 25 Refs are Experimental results generated by HOFs from the G2/97 set
 3   118     -1   117     1     13    1                            -0.04162950    1.0000
 3    40     -1     1    -1    104    1                            -0.08802905    1.0000
 3   113     -1    30     1      8    1                            -0.11057836    1.0000
 3    52     -1     1    -1     18    2                            -0.16825257    1.0000
 4    30     -1    13    -1     40    1     1      1               -0.30398209    1.0000
 4   128     -1    13    -1    126    1    22      1               -0.43190608    1.0000
 3   100     -1    13    -1    106    1                            -0.87291861    1.0000
 3    25     -1    14    -1    121    1                            -1.10014631    1.0000
 3    39     -1    45    -1     51    2                            -1.14567858    1.0000
 4    58     -1    59    -1     57    1    60      1               -1.16432513    1.0000
 4    67     -1    61    -1     66    1    62      1               -1.14177581    1.0000
 3    32     -1     1    -1     33    1                            -1.26753160    1.0000
 3    25     -1    26    -1     88    1                            -1.41930583    1.0000
 4    47     -1     1    -3     18    1    13      1               -1.47047542    1.0000
 3    34     -1     1    -3     11    2                            -1.68556118    1.0000
 4     8     -1    45    -2     97    1    22      2               -2.04158015    1.0000
 3    25     -1     1    -1     26    1                            -2.09968799    1.0000
 4    56     -1     1    -3     21    1    13      2               -2.62222497    1.0000
 4    30     -1     1    -3     13    1     8      1               -2.80912409    1.0000
 4    73     -1     1    -1     39    1    13      1               -2.97997850    1.0000
 4    68     -1     1    -1     34    1    13      1               -3.50121455    1.0000
 3    26     -1     6    -1     82    1                            -4.72928485    1.0000
 3     1     -1    39    -1     14    2                            -5.82336020    1.0000
 2    25     -3    94     1                                        -6.57269123    1.0000
 3    23     -1    39    -1     24    2                            -9.22353648    1.0000
