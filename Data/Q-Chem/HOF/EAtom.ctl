# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./EAtom           2               QChem

# The project description
__title__ ::
"This is a set of atoms"

# Machine and option keyword of QChem Package
__qchem__ ::   1 rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
exchange = b3lyp
basis = 6-311+g(3df,2p)
scf_convergence = 8
xc_grid = 000075000194
$end

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1>   '.'


# The atomic set to batch: 
#                26 is the total number of jobs in this batch list
__batch__ :: 26
#"Flag" 	"DIR"			"InpName" 	"JobType"
# Period 1'th-(Main elements)
H_0             <PATH1>/EAtom           H_0.in         energy 
He_0            <PATH1>/EAtom           He_0.in        energy 
# Period 2'th-(Main elements)
Li_0            <PATH1>/EAtom           Li_0.in        energy 
Be_0            <PATH1>/EAtom           Be_0.in        energy 
B_0             <PATH1>/EAtom           B_0.in         energy 
C_0             <PATH1>/EAtom           C_0.in         energy 
N_0             <PATH1>/EAtom           N_0.in         energy 
O_0             <PATH1>/EAtom           O_0.in         energy 
F_0             <PATH1>/EAtom           F_0.in         energy 
Ne_0            <PATH1>/EAtom           Ne_0.in        energy 
# Period 3'th-(Main elements)
Na_0            <PATH1>/EAtom           Na_0.in        energy 
Mg_0            <PATH1>/EAtom           Mg_0.in        energy 
Al_0            <PATH1>/EAtom           Al_0.in        energy 
Si_0            <PATH1>/EAtom           Si_0.in        energy 
P_0             <PATH1>/EAtom           P_0.in         energy 
S_0             <PATH1>/EAtom           S_0.in         energy 
Cl_0            <PATH1>/EAtom           Cl_0.in        energy 
Ar_0            <PATH1>/EAtom           Ar_0.in        energy 
# Period 4'th-(Main elements)
K_0             <PATH1>/EAtom           K_0.in         energy 
Ca_0            <PATH1>/EAtom           Ca_0.in        energy 
Ga_0            <PATH1>/EAtom           Ga_0.in        energy 
Ge_0            <PATH1>/EAtom           Ge_0.in        energy 
As_0            <PATH1>/EAtom           As_0.in        energy 
Se_0            <PATH1>/EAtom           Se_0.in        energy 
Br_0            <PATH1>/EAtom           Br_0.in        energy 
Kr_0            <PATH1>/EAtom           Kr_0.in        energy 


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

