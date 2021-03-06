# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./EAtom           2               Aims

# The project description
__title__ ::
"This is a set of atoms"


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

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1>   '.'


# The atomic set to batch: 
#                26 is the total number of jobs in this batch list
__batch__ :: 26
#"Flag" 	"DIR"			"InpName" 	"JobType"
# Period 1'th-(Main elements)
H_0             <PATH1>/EAtom           H_0            energy 
He_0            <PATH1>/EAtom           He_0           energy 
# Period 2'th-(Main elements)
Li_0            <PATH1>/EAtom           Li_0           energy 
Be_0            <PATH1>/EAtom           Be_0           energy 
B_0             <PATH1>/EAtom           B_0            energy 
C_0             <PATH1>/EAtom           C_0            energy 
N_0             <PATH1>/EAtom           N_0            energy 
O_0             <PATH1>/EAtom           O_0            energy 
F_0             <PATH1>/EAtom           F_0            energy 
Ne_0            <PATH1>/EAtom           Ne_0           energy 
# Period 3'th-(Main elements)
Na_0            <PATH1>/EAtom           Na_0           energy 
Mg_0            <PATH1>/EAtom           Mg_0           energy 
Al_0            <PATH1>/EAtom           Al_0           energy 
Si_0            <PATH1>/EAtom           Si_0           energy 
P_0             <PATH1>/EAtom           P_0            energy 
S_0             <PATH1>/EAtom           S_0            energy 
Cl_0            <PATH1>/EAtom           Cl_0           energy 
Ar_0            <PATH1>/EAtom           Ar_0           energy 
# Period 4'th-(Main elements)
K_0             <PATH1>/EAtom           K_0            energy 
Ca_0            <PATH1>/EAtom           Ca_0           energy 
Ga_0            <PATH1>/EAtom           Ga_0           energy 
Ge_0            <PATH1>/EAtom           Ge_0           energy 
As_0            <PATH1>/EAtom           As_0           energy 
Se_0            <PATH1>/EAtom           Se_0           energy 
Br_0            <PATH1>/EAtom           Br_0           energy 
Kr_0            <PATH1>/EAtom           Kr_0           energy 


# Training set for experimental atomic energy
#                18 is the total number of the testing energy data
#               1.0 is the scale factor from "a.u." to "a.u."
#                      which scales the calc. data in "a.u."
#                      to the ref. data in "a.u."
__energy__ ::   18     1.0
#"Number" "Flag" "Scale"  "Ref"       "Weight"
  1        H_0    1       -0.500000   1.0 
  1        He_0   1       -2.903724   1.0
  1        Li_0   1       -7.478060   1.0
  1        Be_0   1       -14.66739   1.0
  1        B_0    1       -24.65390   1.0
  1        C_0    1       -37.84500   1.0
  1        N_0    1       -54.58930   1.0
  1        O_0    1       -75.06740   1.0
  1        F_0    1       -99.73410   1.0
  1        Ne_0   1       -128.9383   1.0
  1        Na_0   1       -162.2554   1.0
  1        Mg_0   1       -200.0540   1.0
  1        Al_0   1       -242.3470   1.0
  1        Si_0   1       -289.3600   1.0
  1        P_0    1       -341.2600   1.0
  1        S_0    1       -398.1110   1.0
  1        Cl_0   1       -460.1500   1.0
  1        Ar_0   1       -527.5440   1.0


# Training set for the total atomic energy at the level of Hartree-Fock limit
#                18 is the total number of the testing energy data
#               1.0 is the scale factor from "a.u." to "a.u."
#                      which scales the calc. data in "a.u."
#                      to the ref. data in "a.u."
__energy.Bak__ :: 18  1.0
#"Number" "Flag" "Scale"  "Ref"       "Weight"
  1       H_0    1        -0.500000   1.0 
  1       He_0   1        -2.861704   1.0 
  1       Li_0   1        -7.432730   1.0 
  1       Be_0   1        -14.57303   1.0 
  1       B_0    1        -24.52906   1.0 
  1       C_0    1        -37.68864   1.0 
  1       N_0    1        -54.40096   1.0 
  1       O_0    1        -74.80942   1.0 
  1       F_0    1        -99.40932   1.0 
  1       Ne_0   1        -128.54710  1.0 
  1       Na_0   1        -161.85892  1.0 
  1       Mg_0   1        -199.61457  1.0 
  1       Al_0   1        -241.87642  1.0 
  1       Si_0   1        -288.85433  1.0 
  1       P_0    1        -340.71907  1.0 
  1       S_0    1        -397.50477  1.0 
  1       Cl_0   1        -459.48172  1.0 
  1       Ar_0   1        -526.81790  1.0 

