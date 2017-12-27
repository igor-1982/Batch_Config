# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PES_bz_methane   2            Aims

# The project description
__title__ ::
"============================== bz-methane ==========================="
"             This is the set for PES of C6H6+CH4                     "

# Machine and option keyword of QChem Package
# several global statements of control.in for aims Package
__aims_basis__ :: /home/igor/Documents/Package-Pool/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  2  051512.mpi
xc                      pbe
total_energy_method     rpa
relativistic            none
occupation_type         gaussian 0.0001
mixer                   pulay
n_max_pulay             5
charge_mix_param        0.2
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           200
end aims

# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                20 is the total number of jobs in this batch list
__batch__ :: 20
#"Flag"         "DIR"                        "InpName"       "JobType"
  0            <PATH1>/bz_methane_scan        0            energy
  1            <PATH1>/bz_methane_scan        1            energy
  2            <PATH1>/bz_methane_scan        2            energy
  3            <PATH1>/bz_methane_scan        3            energy
  4            <PATH1>/bz_methane_scan        4            energy
  5            <PATH1>/bz_methane_scan        5            energy
  6            <PATH1>/bz_methane_scan        6            energy
  7            <PATH1>/bz_methane_scan        7            energy
  8            <PATH1>/bz_methane_scan        8            energy
  9            <PATH1>/bz_methane_scan        9            energy
 10            <PATH1>/bz_methane_scan       10            energy
 11            <PATH1>/bz_methane_scan       11            energy
 12            <PATH1>/bz_methane_scan       12            energy
 13            <PATH1>/bz_methane_scan       13            energy
 14            <PATH1>/bz_methane_scan       14            energy
 15            <PATH1>/bz_methane_scan       15            energy
 16            <PATH1>/bz_methane_scan       16            energy
 17            <PATH1>/bz_methane_scan       17            energy
 18            <PATH1>/bz_methane_scan       18            energy
 19            <PATH1>/bz_methane_scan       19            energy

# Training set for the atomization energy
#               20 is the total number of the energy testing data
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 20  1.0
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
  1         0     1                                       0.0        1.0
  1         1     1                                       0.0        1.0
  1         2     1                                       0.0        1.0
  1         3     1                                       0.0        1.0
  1         4     1                                       0.0        1.0
  1         5     1                                       0.0        1.0
  1         6     1                                       0.0        1.0
  1         7     1                                       0.0        1.0
  1         8     1                                       0.0        1.0
  1         9     1                                       0.0        1.0
  1        10     1                                       0.0        1.0
  1        11     1                                       0.0        1.0
  1        12     1                                       0.0        1.0
  1        13     1                                       0.0        1.0
  1        14     1                                       0.0        1.0
  1        15     1                                       0.0        1.0
  1        16     1                                       0.0        1.0
  1        17     1                                       0.0        1.0
  1        18     1                                       0.0        1.0
  1        19     1                                       0.0        1.0

