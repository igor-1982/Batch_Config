# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./HTBH38           2             Aims

# The project description
__title__ ::
"============================== HTBH38 set ============================="
"        This is HTBH38 subset including 38 reactions with strong        "
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
#               40 is the total number of jobs in this batch list
__batch__ :: 40
#"Flag"         "DIR"                       "InpName"       "JobType"
  # 36 molecules
  HCl          <PATH1>/HTBH38             HCl                  energy
  OH           <PATH1>/HTBH38             OH                   energy
  H2           <PATH1>/HTBH38             H2                   energy 
  H2O          <PATH1>/HTBH38             H2O                  energy
  CH3          <PATH1>/HTBH38             CH3                  energy
  CH4          <PATH1>/HTBH38             CH4                  energy 
  NH3          <PATH1>/HTBH38             NH3                  energy
  NH2          <PATH1>/HTBH38             NH2                  energy
  C2H6         <PATH1>/HTBH38             C2H6                 energy
  C2H5         <PATH1>/HTBH38             C2H5                 energy
  C5H8         <PATH1>/HTBH38             C5H8                 energy
  HF           <PATH1>/HTBH38             HF                   energy
  PH3          <PATH1>/HTBH38             PH3                  energy
  PH2          <PATH1>/HTBH38             PH2                  energy
  H2S          <PATH1>/HTBH38             H2S                  energy
  HS           <PATH1>/HTBH38             HS                   energy
  NH           <PATH1>/HTBH38             NH                   energy
  TS1          <PATH1>/HTBH38             TS1                  energy
  TS2          <PATH1>/HTBH38             TS2                  energy
  TS3          <PATH1>/HTBH38             TS3                  energy
  TS4          <PATH1>/HTBH38             TS4                  energy
  TS5          <PATH1>/HTBH38             TS5                  energy
  TS6          <PATH1>/HTBH38             TS6                  energy
  TS7          <PATH1>/HTBH38             TS7                  energy
  TS8          <PATH1>/HTBH38             TS8                  energy
  TS9          <PATH1>/HTBH38             TS9                  energy
  TS10         <PATH1>/HTBH38             TS10                 energy
  TS11         <PATH1>/HTBH38             TS11                 energy
  TS12         <PATH1>/HTBH38             TS12                 energy
  TS13         <PATH1>/HTBH38             TS13                 energy
  TS14         <PATH1>/HTBH38             TS14                 energy
  TS15         <PATH1>/HTBH38             TS15                 energy
  TS16         <PATH1>/HTBH38             TS16                 energy
  TS17         <PATH1>/HTBH38             TS17                 energy
  TS18         <PATH1>/HTBH38             TS18                 energy
  TS19         <PATH1>/HTBH38             TS19                 energy
  # 4 atoms or anions
  H            <PATH1>/HTBH38              H                   energy
  Cl           <PATH1>/HTBH38              Cl                  energy
  F            <PATH1>/HTBH38              F                   energy
  O            <PATH1>/HTBH38              O                   energy
# Training set for the atomization energy
#              38 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  38 627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight" 
   3    H     -1      HCl     -1      TS1   1                    5.70       1.0000
   3    H2    -1      Cl      -1      TS1   1                    8.70       1.0000
   3    OH    -1      H2      -1      TS2   1                    5.10       1.0000
   3    H2O   -1      H       -1      TS2   1                    21.20      1.0000
   3    CH3   -1      H2      -1      TS3   1                    12.10      1.0000
   3    CH4   -1      H       -1      TS3   1                    15.30      1.0000
   3    OH    -1      CH4     -1      TS4   1                    6.70       1.0000
   3    H2O   -1      CH3     -1      TS4   1                    19.60      1.0000
   3    H     -1      H2      -1      TS5   1                    9.60       1.0000
   3    H     -1      H2      -1      TS5   1                    9.60       1.0000
   3    OH    -1      NH3     -1      TS6   1                    3.20       1.0000 
   3    H2O   -1      NH2     -1      TS6   1                    12.70      1.0000 
   3    HCl   -1      CH3     -1      TS7   1                    1.70       1.0000  
   3    Cl    -1      CH4     -1      TS7   1                    7.90       1.0000  
   3    OH    -1      C2H6    -1      TS8   1                    3.40       1.0000
   3    H2O   -1      C2H5    -1      TS8   1                    19.90      1.0000
   3    F     -1      H2      -1      TS9   1                    1.80       1.0000
   3    HF    -1      H       -1      TS9   1                    33.40      1.0000
   3    O     -1      CH4     -1      TS10  1                    13.70      1.0000 
   3    OH    -1      CH3     -1      TS10  1                    8.10       1.0000 
   3    H     -1      PH3     -1      TS11  1                    3.10       1.0000
   3    H2    -1      PH2     -1      TS11  1                    23.30      1.0000
   3    H     -1      OH      -1      TS12  1                    10.70      1.0000 
   3    H2    -1      O       -1      TS12  1                    13.10      1.0000 
   3    H     -1      H2S     -1      TS13  1                    3.50       1.0000       
   3    H2    -1      HS      -1      TS13  1                    17.30      1.0000       
   3    O     -1      HCl     -1      TS14  1                    9.80       1.0000
   3    OH    -1      Cl      -1      TS14  1                    10.40      1.0000
   3    CH3   -1      NH2     -1      TS15  1                    8.00       1.0000
   3    CH4   -1      NH      -1      TS15  1                    22.40      1.0000
   3    C2H5  -1      NH2     -1      TS16  1                    7.50       1.0000
   3    C2H6  -1      NH      -1      TS16  1                    18.30      1.0000
   3    NH2   -1      C2H6    -1      TS17  1                    10.40      1.0000  
   3    NH3   -1      C2H5    -1      TS17  1                    17.40      1.0000  
   3    NH2   -1      CH4     -1      TS18  1                    14.50      1.0000
   3    NH3   -1      CH3     -1      TS18  1                    17.80      1.0000
   2    C5H8  -1      TS19    1                                  38.40      1.0000  
   2    C5H8  -1      TS19    1                                  38.40      1.0000  

   


