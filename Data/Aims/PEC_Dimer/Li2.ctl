# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./Li2              2         Aims

# The project description
__title__ ::
"============================= Li-Li ==============================="
" Reference data were calculated by CCSD(T)/aug-cc-pVQZ           "

# several global statements of control.in for aims Package
__aims_basis__ :: /u/igor1982/export/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  16  052512.scalapack.mpi
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
#override_illconditioning .true.
end aims


# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .


# The molecular set to batch: 
#               43 is the total number of jobs in this batch list
__batch__ :: 43
#"Flag"         "DIR"                         "InpName"       "JobType"
 Li             <PATH1>/Li2                        Li       energy
 Li2_1_8        <PATH1>/Li2                   Li2_1_8       energy
 Li2_2_0        <PATH1>/Li2                   Li2_2_0       energy
 Li2_2_2        <PATH1>/Li2                   Li2_2_2       energy
 Li2_2_3        <PATH1>/Li2                   Li2_2_3       energy
 Li2_2_4        <PATH1>/Li2                   Li2_2_4       energy
 Li2_2_5        <PATH1>/Li2                   Li2_2_5       energy
 Li2_2_6        <PATH1>/Li2                   Li2_2_6       energy
 Li2_2_6_5      <PATH1>/Li2                 Li2_2_6_5       energy
 Li2_2_7        <PATH1>/Li2                   Li2_2_7       energy
 Li2_2_7_5      <PATH1>/Li2                 Li2_2_7_5       energy
 Li2_2_8        <PATH1>/Li2                   Li2_2_8       energy
 Li2_2_9        <PATH1>/Li2                   Li2_2_9       energy
 Li2_3_0        <PATH1>/Li2                   Li2_3_0       energy
 Li2_3_1        <PATH1>/Li2                   Li2_3_1       energy
 Li2_3_2        <PATH1>/Li2                   Li2_3_2       energy
 Li2_3_4        <PATH1>/Li2                   Li2_3_4       energy
 Li2_3_6        <PATH1>/Li2                   Li2_3_6       energy
 Li2_3_8        <PATH1>/Li2                   Li2_3_8       energy
 Li2_4_0        <PATH1>/Li2                   Li2_4_0       energy
 Li2_4_2        <PATH1>/Li2                   Li2_4_2       energy
 Li2_4_4        <PATH1>/Li2                   Li2_4_4       energy
 Li2_4_6        <PATH1>/Li2                   Li2_4_6       energy
 Li2_4_8        <PATH1>/Li2                   Li2_4_8       energy
 Li2_5_0        <PATH1>/Li2                   Li2_5_0       energy
 Li2_5_4        <PATH1>/Li2                   Li2_5_4       energy
 Li2_5_8        <PATH1>/Li2                   Li2_5_8       energy
 Li2_6_2        <PATH1>/Li2                   Li2_6_2       energy
 Li2_6_6        <PATH1>/Li2                   Li2_6_6       energy
 Li2_7_0        <PATH1>/Li2                   Li2_7_0       energy
 Li2_7_4        <PATH1>/Li2                   Li2_7_4       energy
 Li2_7_8        <PATH1>/Li2                   Li2_7_8       energy
 Li2_8_2        <PATH1>/Li2                   Li2_8_2       energy
 Li2_8_6        <PATH1>/Li2                   Li2_8_6       energy
 Li2_9_0        <PATH1>/Li2                   Li2_9_0       energy
 Li2_9_4        <PATH1>/Li2                   Li2_9_4       energy
 Li2_9_8        <PATH1>/Li2                   Li2_9_8       energy
 Li2_10_2       <PATH1>/Li2                  Li2_10_2       energy
 Li2_10_6       <PATH1>/Li2                  Li2_10_6       energy
 Li2_11_0       <PATH1>/Li2                  Li2_11_0       energy
 Li2_11_4       <PATH1>/Li2                  Li2_11_4       energy
 Li2_11_8       <PATH1>/Li2                  Li2_11_8       energy
 Li2_12_2       <PATH1>/Li2                  Li2_12_2       energy

# Training set for the atomization energy
#       42 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 42  1.0
#"Number" "Flag"     "Scale"                                 "Ref"       "Weight"
 2         Li2_1_8     1        Li   -2                       -0.15546645    1.0
 2         Li2_2_0     1        Li   -2                       -0.16798407    1.0
 2         Li2_2_2     1        Li   -2                       -0.17269549    1.0
 2         Li2_2_3     1        Li   -2                       -0.17392928    1.0
 2         Li2_2_4     1        Li   -2                       -0.17200743    1.0
 2         Li2_2_5     1        Li   -2                       -0.16199823    1.0
 2         Li2_2_6     1        Li   -2                       -0.11375545    1.0
 2         Li2_2_6_5   1        Li   -2                       -0.14735649    1.0
 2         Li2_2_7     1        Li   -2                       -0.05565932    1.0
 2         Li2_2_7_5   1        Li   -2                       -0.08194259    1.0
 2         Li2_2_8     1        Li   -2                       -0.03584206    1.0
 2         Li2_2_9     1        Li   -2                       -0.02203175    1.0
 2         Li2_3_0     1        Li   -2                       -0.01305196    1.0
 2         Li2_3_1     1        Li   -2                       -0.00753252    1.0
 2         Li2_3_2     1        Li   -2                       -0.00427712    1.0
 2         Li2_3_4     1        Li   -2                       -0.00240904    1.0
 2         Li2_3_6     1        Li   -2                       -0.00135465    1.0
 2         Li2_3_8     1        Li   -2                       -0.00076472    1.0
 2         Li2_4_0     1        Li   -2                       -0.00043577    1.0
 2         Li2_4_2     1        Li   -2                       -0.00025228    1.0
 2         Li2_4_4     1        Li   -2                       -0.00014935    1.0
 2         Li2_4_6     1        Li   -2                       -0.00009094    1.0
 2         Li2_4_8     1        Li   -2                       -0.00005717    1.0
 2         Li2_5_0     1        Li   -2                       -0.00002508    1.0
 2         Li2_5_4     1        Li   -2                       -0.00001272    1.0
 2         Li2_5_8     1        Li   -2                       -0.00000730    1.0
 2         Li2_6_2     1        Li   -2                       -0.00000451    1.0
 2         Li2_6_6     1        Li   -2                       -0.00000297    1.0
 2         Li2_7_0     1        Li   -2                       -0.00000197    1.0
 2         Li2_7_4     1        Li   -2                       -0.00000134    1.0
 2         Li2_7_8     1        Li   -2                       -0.00000095    1.0
 2         Li2_8_2     1        Li   -2                       -0.00000070    1.0
 2         Li2_8_6     1        Li   -2                       -0.00000070    1.0
 2         Li2_9_0     1        Li   -2                       -0.00000070    1.0
 2         Li2_9_4     1        Li   -2                       -0.00000070    1.0
 2         Li2_9_8     1        Li   -2                       -0.00000070    1.0
 2         Li2_10_2    1        Li   -2                       -0.00000070    1.0
 2         Li2_10_6    1        Li   -2                       -0.00000070    1.0
 2         Li2_11_0    1        Li   -2                       -0.00000070    1.0
 2         Li2_11_4    1        Li   -2                       -0.00000070    1.0
 2         Li2_11_8    1        Li   -2                       -0.00000070    1.0
 2         Li2_12_2    1        Li   -2                       -0.00000070    1.0
