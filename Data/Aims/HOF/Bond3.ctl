# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./Bond3           2             Aims 

# The project description
__title__ ::
"============================== Bond3 set ==========================="
"             There are 44 molecules in this set                     "
"   which combines with G3 set to form Bone266 set usually           "
"All the geometries are optimized at the level of B3LYP/6-311+G(d,p)."


# several global statements of control.in for aims Package
__aims_basis__ :: /home/igor/Documents/Package-Pool/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  2  051512.mpi
xc                      pbe                                                                                                                 
total_energy_method     rpa
charge                  0.
relativistic            none
occupation_type         gaussian 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.2
sc_accuracy_rho  1E-6
sc_accuracy_eev  1E-4
sc_accuracy_etot 1E-6
sc_iter_limit    200
end aims

# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'
<PATH2> = '.'

# The molecular set to batch: 
#                59 is the total number of jobs in this batch list
__batch__ :: 59 
#"Flag"         "DIR"                         "InpName"       "JobType"
# Atoms  15
 H_0            <PATH1>/EAtom                 H_0            energy 
 Li_0           <PATH1>/EAtom                 Li_0           energy 
 Be_0           <PATH1>/EAtom                 Be_0           energy 
 B_0            <PATH1>/EAtom                 B_0            energy 
 C_0            <PATH1>/EAtom                 C_0            energy 
 N_0            <PATH1>/EAtom                 N_0            energy 
 O_0            <PATH1>/EAtom                 O_0            energy 
 F_0            <PATH1>/EAtom                 F_0            energy 
 Na_0           <PATH1>/EAtom                 Na_0           energy 
 Mg_0           <PATH1>/EAtom                 Mg_0           energy 
 Al_0           <PATH1>/EAtom                 Al_0           energy 
 Si_0           <PATH1>/EAtom                 Si_0           energy 
 P_0            <PATH1>/EAtom                 P_0            energy 
 S_0            <PATH1>/EAtom                 S_0            energy 
 Cl_0           <PATH1>/EAtom                 Cl_0           energy 
# Bond3 set 44
 F224           <PATH2>/Bond3                 F224           energy
 F230           <PATH2>/Bond3                 F230           energy
 F234           <PATH2>/Bond3                 F234           energy
 F235           <PATH2>/Bond3                 F235           energy
 F243           <PATH2>/Bond3                 F243           energy
 F244           <PATH2>/Bond3                 F244           energy
 F246           <PATH2>/Bond3                 F246           energy
 F247           <PATH2>/Bond3                 F247           energy
 F248           <PATH2>/Bond3                 F248           energy
 F249           <PATH2>/Bond3                 F249           energy
 F250           <PATH2>/Bond3                 F250           energy
 F251           <PATH2>/Bond3                 F251           energy
 F252           <PATH2>/Bond3                 F252           energy
 F253           <PATH2>/Bond3                 F253           energy
 F254           <PATH2>/Bond3                 F254           energy
 F256           <PATH2>/Bond3                 F256           energy
 F266           <PATH2>/Bond3                 F266           energy
 F267           <PATH2>/Bond3                 F267           energy
 F270           <PATH2>/Bond3                 F270           energy
 F275           <PATH2>/Bond3                 F275           energy
 F277           <PATH2>/Bond3                 F277           energy
 F287           <PATH2>/Bond3                 F287           energy
 F300           <PATH2>/Bond3                 F300           energy
 F301           <PATH2>/Bond3                 F301           energy
 F306           <PATH2>/Bond3                 F306           energy
 F309           <PATH2>/Bond3                 F309           energy
 F332           <PATH2>/Bond3                 F332           energy
 F333           <PATH2>/Bond3                 F333           energy
 F336           <PATH2>/Bond3                 F336           energy
 F340           <PATH2>/Bond3                 F340           energy
 F357           <PATH2>/Bond3                 F357           energy
 F378           <PATH2>/Bond3                 F378           energy
 F379           <PATH2>/Bond3                 F379           energy
 F399           <PATH2>/Bond3                 F399           energy
 F403           <PATH2>/Bond3                 F403           energy
 F404           <PATH2>/Bond3                 F404           energy
 F424           <PATH2>/Bond3                 F424           energy
 F444           <PATH2>/Bond3                 F444           energy
 F523           <PATH2>/Bond3                 F523           energy
 F536           <PATH2>/Bond3                 F536           energy
 F700           <PATH2>/Bond3                 F700           energy
 F771           <PATH2>/Bond3                 F771           energy
 EtONO          <PATH2>/Bond3                 EtONO          energy
 cum            <PATH2>/Bond3                 cum            energy

# Training set for the atomization energy
#               44 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 44  627.51
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
 4        F224   -1      N_0  1  C_0  1 Cl_0  1          0.0        1.0
 4        F230   -1      H_0  3  C_0  2 Cl_0  3          0.0        1.0
 5        F234   -1      H_0  5  C_0  2  O_0  2  N_0  1  0.0        1.0
 5        F235   -1      H_0  5  C_0  2  O_0  3  N_0  1  0.0        1.0
 4        F243   -1      H_0  7  C_0  3 Cl_0  1          0.0        1.0
 4        F244   -1      H_0  7  C_0  3  F_0  1          0.0        1.0
 5        F246   -1      H_0  7  C_0  3  O_0  2  N_0  1  0.0        1.0
 5        F247   -1      H_0  7  C_0  3  O_0  2  N_0  1  0.0        1.0
 5        F248   -1      H_0  7  C_0  3  O_0  3  N_0  1  0.0        1.0
 5        F249   -1      H_0  7  C_0  3  O_0  3  N_0  1  0.0        1.0
 4        F250   -1      H_0  8  C_0  3  S_0  1          0.0        1.0
 4        F251   -1      H_0  8  C_0  3  S_0  1          0.0        1.0
 4        F252   -1      H_0  8  C_0  3  S_0  1          0.0        1.0
 4        F253   -1      H_0  9  C_0  3  N_0  1          0.0        1.0
 4        F254   -1      H_0  9  C_0  3  N_0  1          0.0        1.0
 3        F256   -1      H_0  8  C_0  4                  0.0        1.0
 3        F266   -1      H_0 10  C_0  4                  0.0        1.0
 3        F267   -1      H_0 10  C_0  4                  0.0        1.0
 4        F270   -1      H_0 10  C_0  5  O_0  1          0.0        1.0
 3        F275   -1      H_0 12  C_0  5                  0.0        1.0
 4        F277   -1      H_0 12  C_0  5  O_0  1          0.0        1.0
 5        F287   -1      H_0  5  C_0  6  O_0  2  N_0  1  0.0        1.0
 4        F300   -1      H_0  5  C_0  7  N_0  1          0.0        1.0
 4        F301   -1      H_0  6  C_0  7  O_0  1          0.0        1.0
 3        F306   -1      H_0 16  C_0  7                  0.0        1.0
 4        F309   -1      H_0  8  C_0  8  O_0  1          0.0        1.0
 3        F332   -1      H_0  5  C_0  3                  0.0        1.0
 3        F333   -1      H_0  7  C_0  3                  0.0        1.0
 3        F336   -1      H_0  6  C_0  4                  0.0        1.0
 3        F340   -1      H_0  9  C_0  4                  0.0        1.0
 3        F357   -1      H_0  8  C_0  8                  0.0        1.0
 4        F378   -1      H_0  6  C_0  4  O_0  2          0.0        1.0
 4        F379   -1      H_0 10  C_0  4  O_0  2          0.0        1.0
 3        F399   -1      O_0  3  N_0  1                  0.0        1.0
 4        F403   -1      H_0  1  O_0  2  N_0  1          0.0        1.0
 4        F404   -1      H_0  1  O_0  3  N_0  1          0.0        1.0
 4        F424   -1      H_0  3  C_0  2  F_0  3          0.0        1.0
 3        F444   -1     Cl_0  3  C_0  1                  0.0        1.0
 4        F523   -1      H_0  6  C_0  2  S_0  2          0.0        1.0
 5        F536   -1      H_0  4  C_0  2  S_0  1  O_0  1  0.0        1.0
 3        F700   -1      H_0 10  C_0 12                  0.0        1.0
 3        F771   -1      H_0  2  S_0  2                  0.0        1.0
 5       EtONO   -1      H_0  5  C_0  2  O_0  2  N_0  1  0.0        1.0
 3         cum   -1      H_0 12  C_0  9                  0.0        1.0



