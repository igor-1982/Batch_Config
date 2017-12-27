# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "CP2K"     : to run jobs using CP2K package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./H2O_dimer   2                aims

# The project description
__title__ ::
"==================================== H2O dimer ================================="
"Geometry of H2O is collected from J. Phys. Chem. A 2004, 108 2305-2313"
"It was optimized at the theoretical level of CCSD(T)/TZ2P(f,d)+dif."
"H2O flagments in H2O dimers using the same geometry of H2O molecule."
"Two parameters (alpha, beta) which represent the relative positions of two "
"flagments are also obtained from J. Phys. Chem. A 2004, 108 2305-2313."
"It was optimized at the theoretical level of CCSD(T)/(FULL)/IO275"

#several global statements of control.in for aims Package
__aims_basis__ :: /u/igor1982/export/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  16  final 
xc                       pbe
total_energy_method      rpa
relativistic             none
occupation_type          gaussian 0.0001 
mixer                    pulay
n_max_pulay              5
charge_mix_param         0.2
sc_accuracy_rho          1E-6
sc_accuracy_eev          1E-4
sc_accuracy_etot         1E-6
sc_iter_limit            200
radial_multiplier        6
frequency_points         80
override_illconditioning .true.
end aims

# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                36 is the total number of jobs in this batch list
__batch__ :: 36
#"Flag"         "DIR"                        "InpName"       "JobType"
  A0           <PATH1>/H2O_dimer          H2O_monomer        energy|rpa
  0            <PATH1>/H2O_dimer     H2O_dimer_1dot60        energy|rpa
  1            <PATH1>/H2O_dimer     H2O_dimer_1dot80        energy|rpa
  2            <PATH1>/H2O_dimer     H2O_dimer_2dot00        energy|rpa
  3            <PATH1>/H2O_dimer     H2O_dimer_2dot20        energy|rpa
  4            <PATH1>/H2O_dimer     H2O_dimer_2dot40        energy|rpa
  5            <PATH1>/H2O_dimer     H2O_dimer_2dot50        energy|rpa
  6            <PATH1>/H2O_dimer     H2O_dimer_2dot60        energy|rpa
  7            <PATH1>/H2O_dimer     H2O_dimer_2dot70        energy|rpa
  8            <PATH1>/H2O_dimer     H2O_dimer_2dot80        energy|rpa
  9            <PATH1>/H2O_dimer     H2O_dimer_2dot85        energy|rpa
 10            <PATH1>/H2O_dimer     H2O_dimer_2dot86        energy|rpa
 11            <PATH1>/H2O_dimer     H2O_dimer_2dot87        energy|rpa
 12            <PATH1>/H2O_dimer     H2O_dimer_2dot88        energy|rpa
 13            <PATH1>/H2O_dimer     H2O_dimer_2dot89        energy|rpa
 14            <PATH1>/H2O_dimer     H2O_dimer_2dot90        energy|rpa
 15            <PATH1>/H2O_dimer     H2O_dimer_2dot91        energy|rpa
 16            <PATH1>/H2O_dimer     H2O_dimer_2dot92        energy|rpa
 17            <PATH1>/H2O_dimer     H2O_dimer_2dot93        energy|rpa
 18            <PATH1>/H2O_dimer     H2O_dimer_2dot94        energy|rpa
 19            <PATH1>/H2O_dimer     H2O_dimer_2dot95        energy|rpa
 20            <PATH1>/H2O_dimer     H2O_dimer_3dot00        energy|rpa
 21            <PATH1>/H2O_dimer     H2O_dimer_3dot10        energy|rpa
 22            <PATH1>/H2O_dimer     H2O_dimer_3dot20        energy|rpa
 23            <PATH1>/H2O_dimer     H2O_dimer_3dot30        energy|rpa
 24            <PATH1>/H2O_dimer     H2O_dimer_3dot40        energy|rpa
 25            <PATH1>/H2O_dimer     H2O_dimer_3dot60        energy|rpa
 26            <PATH1>/H2O_dimer     H2O_dimer_3dot80        energy|rpa
 27            <PATH1>/H2O_dimer     H2O_dimer_4dot00        energy|rpa
 28            <PATH1>/H2O_dimer     H2O_dimer_4dot20        energy|rpa
 29            <PATH1>/H2O_dimer     H2O_dimer_4dot40        energy|rpa
 30            <PATH1>/H2O_dimer     H2O_dimer_4dot60        energy|rpa
 31            <PATH1>/H2O_dimer     H2O_dimer_4dot80        energy|rpa
 32            <PATH1>/H2O_dimer     H2O_dimer_5dot00        energy|rpa
 33            <PATH1>/H2O_dimer     H2O_dimer_5dot20        energy|rpa
 34            <PATH1>/H2O_dimer     H2O_dimer_5dot40        energy|rpa

# Training set for the atomization energy
#               35 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol"
__energy__ :: 35  627.51
#"Number" "Flag" "Scale"  "Flag" "Scale"    "Ref"      "Weight"
  2         0     1       A0      -2        0.0        1.0
  2         1     1       A0      -2        0.0        1.0
  2         2     1       A0      -2        0.0        1.0
  2         3     1       A0      -2        0.0        1.0
  2         4     1       A0      -2        0.0        1.0
  2         5     1       A0      -2        0.0        1.0
  2         6     1       A0      -2        0.0        1.0
  2         7     1       A0      -2        0.0        1.0
  2         8     1       A0      -2        0.0        1.0
  2         9     1       A0      -2        0.0        1.0
  2        10     1       A0      -2        0.0        1.0
  2        11     1       A0      -2        0.0        1.0
  2        12     1       A0      -2        0.0        1.0
  2        13     1       A0      -2        0.0        1.0
  2        14     1       A0      -2        0.0        1.0
  2        15     1       A0      -2        0.0        1.0
  2        16     1       A0      -2        0.0        1.0
  2        17     1       A0      -2        0.0        1.0
  2        18     1       A0      -2        0.0        1.0
  2        19     1       A0      -2        0.0        1.0
  2        20     1       A0      -2        0.0        1.0
  2        21     1       A0      -2        0.0        1.0
  2        22     1       A0      -2        0.0        1.0
  2        23     1       A0      -2        0.0        1.0
  2        24     1       A0      -2        0.0        1.0
  2        25     1       A0      -2        0.0        1.0
  2        26     1       A0      -2        0.0        1.0
  2        27     1       A0      -2        0.0        1.0
  2        28     1       A0      -2        0.0        1.0
  2        29     1       A0      -2        0.0        1.0
  2        30     1       A0      -2        0.0        1.0
  2        31     1       A0      -2        0.0        1.0
  2        32     1       A0      -2        0.0        1.0
  2        33     1       A0      -2        0.0        1.0
  2        34     1       A0      -2        0.0        1.0
  2        35     1       A0      -2        0.0        1.0

