# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./NHTBH38           2             Aims

# The project description
__title__ ::
"============================== NHTBH38 set ============================="
"        This is NHTBH38 subset including 38 reactions with strong        "
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
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/draco/u/igor1982/export/Batch_Config/Data/Aims/MR-All'

# The molecular set to batch: 
#               50 is the total number of jobs in this batch list
__batch__ :: 50
#"Flag"         "DIR"                       "InpName"       "JobType"
  # 45 molecules
  C2H4         <PATH1>/NHTBH38             C2H4                       energy
  CH3          <PATH1>/NHTBH38             CH3                        energy
  CH3CH2       <PATH1>/NHTBH38             CH3CH2                     energy 
  CH3CH2CH2    <PATH1>/NHTBH38             CH3CH2CH2                  energy
  CH3Cl        <PATH1>/NHTBH38             CH3Cl                      energy
  CH3F         <PATH1>/NHTBH38             CH3F                       energy 
  CH3OH        <PATH1>/NHTBH38             CH3OH                      energy
  ClCH3Cl      <PATH1>/NHTBH38             ClCH3Cl                    energy
  ClCH3ClTS    <PATH1>/NHTBH38             ClCH3ClTS                  energy
  F2           <PATH1>/NHTBH38             F2                         energy
  FCH3Cl1      <PATH1>/NHTBH38             FCH3Cl1                    energy
  FCH3ClTS     <PATH1>/NHTBH38             FCH3ClTS                   energy
  FCH3Cl2      <PATH1>/NHTBH38             FCH3Cl2                    energy
  FCH3F        <PATH1>/NHTBH38             FCH3F                      energy
  FCH3FTS      <PATH1>/NHTBH38             FCH3FTS                    energy
  FCl          <PATH1>/NHTBH38             FCl                        energy
  HCl          <PATH1>/NHTBH38             HCl                        energy
  HCN          <PATH1>/NHTBH38             HCN                        energy
  HCO          <PATH1>/NHTBH38             HCO                        energy
  CO           <PATH1>/NHTBH38             CO                         energy
  HF           <PATH1>/NHTBH38             HF                         energy
  HN2          <PATH1>/NHTBH38             HN2                        energy
  HNC          <PATH1>/NHTBH38             HNC                        energy
  N2           <PATH1>/NHTBH38             N2                         energy
  N2O          <PATH1>/NHTBH38             N2O                        energy
  OH           <PATH1>/NHTBH38             OH                         energy
  OH-          <PATH1>/NHTBH38             OH-                        energy
  OHCH3F1      <PATH1>/NHTBH38             OHCH3F1                    energy
  OHCH3FTS     <PATH1>/NHTBH38             OHCH3FTS                   energy
  OHCH3F2      <PATH1>/NHTBH38             OHCH3F2                    energy
  TS1          <PATH1>/NHTBH38             TS1                        energy
  TS2          <PATH1>/NHTBH38             TS2                        energy
  TS3          <PATH1>/NHTBH38             TS3                        energy
  TS4          <PATH1>/NHTBH38             TS4                        energy
  TS5          <PATH1>/NHTBH38             TS5                        energy
  TS6          <PATH1>/NHTBH38             TS6                        energy
  TS7          <PATH1>/NHTBH38             TS7                        energy
  TS9          <PATH1>/NHTBH38             TS9                        energy
  TS11         <PATH1>/NHTBH38             TS11                       energy
  TS13         <PATH1>/NHTBH38             TS13                       energy
  TS15         <PATH1>/NHTBH38             TS15                       energy
  TS16         <PATH1>/NHTBH38             TS16                       energy
  TS17         <PATH1>/NHTBH38             TS17                       energy
  TS18         <PATH1>/NHTBH38             TS18                       energy
  TS19         <PATH1>/NHTBH38             TS19                       energy
  # 5 atoms or anions
  H            <PATH1>/NHTBH38             H                          energy
  Cl           <PATH1>/NHTBH38             Cl                         energy
  Cl-          <PATH1>/NHTBH38             Cl-                        energy
  F            <PATH1>/NHTBH38             F                          energy
  F-           <PATH1>/NHTBH38             F-                         energy
# Training set for the atomization energy
#              38 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  38 627.51
#"Number" "Flag"      "Scale"                                              "Ref"      "Weight" 
    3    H         -1    N2O         -1      TS1       1                   17.13    1.0000
    3    OH        -1    N2          -1      TS1       1                   82.47    1.0000
	3    H         -1    HF          -1      TS2       1                   42.18    1.0000 	
	3    H         -1    HF          -1      TS2       1                   42.18    1.0000 	
	3    H         -1    HCl         -1      TS3       1                   18.00    1.0000  
	3    H         -1    HCl         -1      TS3       1                   18.00    1.0000  
	3    H         -1    CH3F        -1      TS4       1                   18.00    1.0000  
	3    HF        -1    CH3         -1      TS4       1                   57.02    1.0000  
	3    H         -1    F2          -1      TS5       1                   2.27     1.0000
	3    F         -1    HF          -1      TS5       1                   106.18   1.0000
	3    CH3       -1    FCl         -1      TS6       1                   6.73     1.0000
	3    CH3F      -1    Cl          -1      TS6       1                   60.00    1.0000
	3    F-        -1    CH3F        -1      TS7       1                   -0.34    1.0000
	3    F-        -1    CH3F        -1      TS7       1                   -0.34    1.0000
	2    FCH3F     -1    FCH3FTS      1                                     13.38    1.0000
	2    FCH3F     -1    FCH3FTS      1                                     13.38    1.0000
	3    Cl-       -1    CH3Cl       -1       TS9      1                   3.10     1.0000
	3    Cl-       -1    CH3Cl       -1       TS9      1                   3.10     1.0000
	2    ClCH3Cl   -1    ClCH3ClTS    1                                     13.41    1.0000
	2    ClCH3Cl   -1    ClCH3ClTS   1                                     13.41    1.0000
	3    F-        -1    CH3Cl       -1      TS11      1                  -12.54   1.0000
	3    Cl-       -1    CH3F        -1      TS11      1                   20.11    1.0000
	2    FCH3Cl1   -1    FCH3ClTS     1                                     3.44     1.0000
	2    FCH3Cl2   -1    FCH3ClTS     1                                     29.42    1.0000
	3    OH-       -1    CH3F       -1       TS13      1                   -2.44    1.0000
	3    CH3OH     -1    F-         -1       TS13      1                   17.66    1.0000
	2    OHCH3F1   -1    OHCH3FTS    1                                     10.96    1.0000 
	2    OHCH3F2   -1    OHCH3FTS     1                                     47.20    1.0000 
	3    H         -1    N2          -1      TS15      1                   14.36    1.0000
	2    HN2       -1    TS15        1                                     10.61    1.0000
	3    H         -1    CO          -1      TS16      1                   3.17     1.0000 
	2    HCO       -1    TS16        1                                     22.68    1.0000 
	3    H         -1    C2H4        -1      TS17      1                   1.72     1.0000
	2    CH3CH2    -1    TS17        1                                     41.75     1.0000
	3    CH3       -1    C2H4        -1      TS18      1                   6.85     1.0000    
	2    CH3CH2CH2 -1    TS18        1                                     32.97    1.0000    
	2    HCN       -1     TS19       1                                     48.07    1.0000
	2    HNC       -1     TS19       1                                     32.82    1.0000
