# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using FHI-aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./Dimers           2             QChem

# The project description
__title__ ::
"This is a set of dimers"

# $rem group of Q-Chem Package
__qchem__ ::  1  rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static      = 200
mem_total       = 7500
exchange        = b3lyp                                                                                                                                 
basis           = g3large
max_scf_cycles  = 50
scf_convergence = 7
symmetry        = false
xc_grid         = 000075000302
$end

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1>   '.'


# The atomic set to batch: 
#                20 is the total number of jobs in this batch list
__batch__ :: 20
#"Flag" 	"DIR"			"InpName" 	"JobType"
# Period 1'th-(Main elements)
H2             <PATH1>/Dimers          H2.in         energy 
He2            <PATH1>/Dimers          He2.in        energy 
# Period 2'th-(Main elements)
Li2            <PATH1>/Dimers          Li2.in        energy 
Be2            <PATH1>/Dimers          Be2.in        energy 
B2             <PATH1>/Dimers          B2.in         energy 
C2             <PATH1>/Dimers          C2.in         energy 
N2             <PATH1>/Dimers          N2.in         energy 
O2             <PATH1>/Dimers          O2.in         energy 
F2             <PATH1>/Dimers          F2.in         energy 
Ne2            <PATH1>/Dimers          Ne2.in        energy 
# Period 3'th-(Main elements)
Na2            <PATH1>/Dimers          Na2.in        energy 
Mg2            <PATH1>/Dimers          Mg2.in        energy 
Al2            <PATH1>/Dimers          Al2.in        energy 
Si2            <PATH1>/Dimers          Si2.in        energy 
P2             <PATH1>/Dimers          P2.in         energy 
S2             <PATH1>/Dimers          S2.in         energy 
Cl2            <PATH1>/Dimers          Cl2.in        energy 
Ar2            <PATH1>/Dimers          Ar2.in        energy 
# Period 4'th-(Main elements)
Cu2            <PATH1>/Dimers          Cu2.in        energy 
Zn2            <PATH1>/Dimers          Zn2.in        energy 


# Training set for experimental atomic energy
#                20 is the total number of the testing energy data
#               1.0 is the scale factor from "a.u." to "a.u."
#                      which scales the calc. data in "a.u."
#                      to the ref. data in "a.u."
__energy__ ::   20     1.0
#"Number" "Flag" "Scale"  "Ref"       "Weight"
  1        H2    1       -0.500000   1.0 
  1        He2   1       -2.903724   1.0
  1        Li2   1       -7.478060   1.0
  1        Be2   1       -14.66739   1.0
  1        B2    1       -24.65390   1.0
  1        C2    1       -37.84500   1.0
  1        N2    1       -54.58930   1.0
  1        O2    1       -75.06740   1.0
  1        F2    1       -99.73410   1.0
  1        Ne2   1       -128.9383   1.0
  1        Na2   1       -162.2554   1.0
  1        Mg2   1       -200.0540   1.0
  1        Al2   1       -242.3470   1.0
  1        Si2   1       -289.3600   1.0
  1        P2    1       -341.2600   1.0
  1        S2    1       -398.1110   1.0
  1        Cl2   1       -460.1500   1.0
  1        Ar2   1       -527.5440   1.0
  1        Cu2   1       0.0000000   1.0
  1        Zn2   1       0.0000000   1.0


