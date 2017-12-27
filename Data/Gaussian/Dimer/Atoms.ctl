# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./Atoms           2              Gaussian

# The project description
__title__ ::
"This is a set of atoms"

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) NoSymm Scf=Tight


# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1>   '.'


# The atomic set to batch: 
#                20 is the total number of jobs in this batch list
__batch__ :: 20
#"Flag" 	"DIR"			"InpName" 	"JobType"
# Period 1'th-(Main elements)
H_0             <PATH1>/Atoms          H_0.com         energy 
He_0            <PATH1>/Atoms          He_0.com        energy 
# Period 2'th-(Main elements)
Li_0            <PATH1>/Atoms          Li_0.com        energy 
Be_0            <PATH1>/Atoms          Be_0.com        energy 
B_0             <PATH1>/Atoms          B_0.com         energy 
C_0             <PATH1>/Atoms          C_0.com         energy 
N_0             <PATH1>/Atoms          N_0.com         energy 
O_0             <PATH1>/Atoms          O_0.com         energy 
F_0             <PATH1>/Atoms          F_0.com         energy 
Ne_0            <PATH1>/Atoms          Ne_0.com        energy 
# Period 3'th-(Main elements)
Na_0            <PATH1>/Atoms          Na_0.com        energy 
Mg_0            <PATH1>/Atoms          Mg_0.com        energy 
Al_0            <PATH1>/Atoms          Al_0.com        energy 
Si_0            <PATH1>/Atoms          Si_0.com        energy 
P_0             <PATH1>/Atoms          P_0.com         energy 
S_0             <PATH1>/Atoms          S_0.com         energy 
Cl_0            <PATH1>/Atoms          Cl_0.com        energy 
Ar_0            <PATH1>/Atoms          Ar_0.com        energy 
# Period 4'th-(Main elements)
Cu_0            <PATH1>/Atoms          Cu_0.com        energy 
Zn_0            <PATH1>/Atoms          Zn_0.com        energy 


# Training set for experimental atomic energy
#                20 is the total number of the testing energy data
#               1.0 is the scale factor from "a.u." to "a.u."
#                      which scales the calc. data in "a.u."
#                      to the ref. data in "a.u."
__energy__ ::   20     1.0
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
  1        Cu_0   1       0.0000000   1.0
  1        Zn_0   1       0.0000000   1.0


