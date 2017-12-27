# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./MR-TM-BE13           2             Aims

# The project description
__title__ ::
"============================== MR-TM-BE13 set ============================="
"        This is MG-TM-BE13 subset including 13 reactions with strong        "
"           multi-reference character                                       "

# several global statements of control.in for aims Package
__aims_basis__ :: /draco/u/igor1982/export/species_defaults/tight
__aims__ ::  32 160916.scalapack.mpi 
xc                      pbe
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.2
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           800
relativistic             atomic_zora scalar
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/draco/u/igor1982/export/Batch_Config/Data/Aims/MR-All'

# The molecular set to batch: 
#               31 is the total number of jobs in this batch list
__batch__ :: 31
#"Flag"         "DIR"                       "InpName"       "JobType"
  # 16 molecules
  TiCl         <PATH1>/MR-TM-BE13           TiCl             energy
  VF5          <PATH1>/MR-TM-BE13           VF5              energy
  CrCl         <PATH1>/MR-TM-BE13           CrCl             energy 
  CrOF         <PATH1>/MR-TM-BE13           CrOF             energy
  Fe2Br4       <PATH1>/MR-TM-BE13           Fe2Br4           energy
  CoC4O4H      <PATH1>/MR-TM-BE13           CoC4O4H          energy 
  NiCH2+       <PATH1>/MR-TM-BE13           NiCH2+           energy
  FeC5O5       <PATH1>/MR-TM-BE13           FeC5O5           energy
  VS           <PATH1>/MR-TM-BE13            VS              energy
  CuH          <PATH1>/MR-TM-BE13            CuH             energy
  CuCl         <PATH1>/MR-TM-BE13            CuCl            energy
  VO           <PATH1>/MR-TM-BE13            VO              energy
  NiCl         <PATH1>/MR-TM-BE13            NiCl            energy
  CO_di        <PATH1>/MR-TM-BE13            CO_di              energy
  CH2          <PATH1>/MR-TM-BE13            CH2             energy
  Fe2          <PATH1>/MR-TM-BE13            Fe2             energy
  # 15 atoms or anions  
  Ti           <PATH1>/MR-TM-BE13            Ti              energy
  Cl           <PATH1>/MR-TM-BE13            Cl              energy
  V            <PATH1>/MR-TM-BE13            V               energy
  F            <PATH1>/MR-TM-BE13            F               energy
  O            <PATH1>/MR-TM-BE13            O               energy
  Fe           <PATH1>/MR-TM-BE13            Fe              energy
  Br           <PATH1>/MR-TM-BE13            Br              energy
  Co           <PATH1>/MR-TM-BE13            Co              energy
  H            <PATH1>/MR-TM-BE13            H               energy
  Ni           <PATH1>/MR-TM-BE13            Ni              energy
  Ni+          <PATH1>/MR-TM-BE13            Ni+             energy
  Cu           <PATH1>/MR-TM-BE13            Cu              energy
  Cr           <PATH1>/MR-TM-BE13            Cr              energy
  S            <PATH1>/MR-TM-BE13            S               energy
  C            <PATH1>/MR-TM-BE13            C               energy
# Training set for the atomization energy
#              13 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  13 627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
    3     TiCl        -1    Ti    1   Cl   1                         100.78     1.0000
	3     VF5         -1    V     1   F    5                         564.15     1.0000
	3     CrCl        -1    Cr    1   Cl   1                         90.15      1.0000
	4     CrOF        -1    Cr    1   O    1    F   1                247.58     1.0000
	3     Fe2Br4      -1    Fe2   1   Br   4                         366.80     1.0000
	5     CoC4O4H	  -1    Co    1   C    4   O   4    H   1        1230.13    1.0000
	3     NiCH2+      -1    Ni+   1   CH2  1                         76.30      1.0000
	3     FeC5O5      -1    Fe    1   CO_di   5                         147.40     1.0000
    3     VS          -1    V     1   S    1                         106.90     1.0000
	3     CuH         -1    Cu    1   H    1                         62.60      1.0000
	3     CuCl        -1    Cu    1   Cl   1                         87.70      1.0000
	3     VO          -1    V     1   O    1                         151.00     1.0000
	3     NiCl        -1    Ni    1   Cl   1                         88.00      1.0000 
