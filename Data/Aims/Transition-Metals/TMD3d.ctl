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
__aims_basis__ :: /home/igor/Documents/Package-Pool/Batch_Config/Data/Aims/Transition-Metals/BasisSet_awCVQZ
__aims_batch_type__ :: queue bsub aims_runscr_xhpc1 small
__aims__ ::  4 1 4 180424.scalapack.mpi
xc                      pbe0
relativistic            atomic_zora scalar
RI_method               V
KS_method               serial
restart                 restart
relativistic            none
occupation_type         gaussian 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.2
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           2000
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/home/igor/Documents/Package-Pool/Batch_Config/Data/Aims/Transition-Metals'

# The molecular set to batch: 
#               59 is the total number of jobs in this batch list
__batch__ :: 59
#"Flag"         "DIR"                       "InpName"       "JobType"
  # 16 atoms
  Sc           <PATH1>/TMD3d            Sc              energy
  Ti           <PATH1>/TMD3d            Ti              energy
  V            <PATH1>/TMD3d            V               energy
  Cr           <PATH1>/TMD3d            Cr              energy
  Mn           <PATH1>/TMD3d            Mn              energy
  Fe           <PATH1>/TMD3d            Fe              energy
  Co           <PATH1>/TMD3d            Co              energy
  Ni           <PATH1>/TMD3d            Ni              energy
  Cu           <PATH1>/TMD3d            Cu              energy
  Zn           <PATH1>/TMD3d            Zn              energy
  H            <PATH1>/TMD3d            H               energy
  N            <PATH1>/TMD3d            N               energy
  O            <PATH1>/TMD3d            O               energy
  F            <PATH1>/TMD3d            F               energy
  S            <PATH1>/TMD3d            S               energy
  Cl           <PATH1>/TMD3d            Cl              energy
  # 43 dimers
  ScH          <PATH1>/TMD3d            ScH             energy
  ScO          <PATH1>/TMD3d            ScO             energy
  ScF          <PATH1>/TMD3d            ScF             energy
  ScS          <PATH1>/TMD3d            ScS             energy
  TiH          <PATH1>/TMD3d            TiH             energy
  TiN          <PATH1>/TMD3d            TiN             energy
  TiO          <PATH1>/TMD3d            TiO             energy
  TiF          <PATH1>/TMD3d            TiF             energy
  TiS          <PATH1>/TMD3d            TiS             energy
  TiCl         <PATH1>/TMD3d            TiCl            energy
  VN           <PATH1>/TMD3d            VN              energy
  VO           <PATH1>/TMD3d            VO              energy
  VCl          <PATH1>/TMD3d            VCl             energy
  CrH          <PATH1>/TMD3d            CrH             energy
  CrO          <PATH1>/TMD3d            CrO             energy
  CrF          <PATH1>/TMD3d            CrF             energy
  CrCl         <PATH1>/TMD3d            CrCl            energy
  MnH          <PATH1>/TMD3d            MnH             energy
  MnO          <PATH1>/TMD3d            MnO             energy
  MnF          <PATH1>/TMD3d            MnF             energy
  MnS          <PATH1>/TMD3d            MnS             energy
  MnCl         <PATH1>/TMD3d            MnCl            energy
  FeH          <PATH1>/TMD3d            FeH             energy
  FeO          <PATH1>/TMD3d            FeO             energy
  FeS          <PATH1>/TMD3d            FeS             energy
  FeCl         <PATH1>/TMD3d            FeCl            energy
  CoH          <PATH1>/TMD3d            CoH             energy
  CoO          <PATH1>/TMD3d            CoO             energy
  CoS          <PATH1>/TMD3d            CoS             energy
  CoCl         <PATH1>/TMD3d            CoCl            energy
  NiH          <PATH1>/TMD3d            NiH             energy
  NiO          <PATH1>/TMD3d            NiO             energy
  NiF          <PATH1>/TMD3d            NiF             energy
  NiCl         <PATH1>/TMD3d            NiCl            energy
  CuH          <PATH1>/TMD3d            CuH             energy
  CuO          <PATH1>/TMD3d            CuO             energy
  CuF          <PATH1>/TMD3d            CuF             energy
  CuS          <PATH1>/TMD3d            CuS             energy
  CuCl         <PATH1>/TMD3d            CuCl            energy
  ZnH          <PATH1>/TMD3d            ZnH             energy
  ZnO          <PATH1>/TMD3d            ZnO             energy
  ZnS          <PATH1>/TMD3d            ZnS             energy
  ZnCl         <PATH1>/TMD3d            ZnCl            energy
# Training set for the atomization energy
#              13 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  43 627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
	3     ScH         -1    Sc    1   H    1                  56.0       1.00000
    3     ScO         -1    Sc    1   O    1                 163.8       1.00000
    3     ScF         -1    Sc    1   F    1                 145.4       1.00000
    3     ScS         -1    Sc    1   S    1                 115.5       1.00000
    3     TiH         -1    Ti    1   H    1                  52.9       1.00000
    3     TiN         -1    Ti    1   N    1                 119.2       1.00000
    3     TiO         -1    Ti    1   O    1                 160.9       1.00000
    3     TiF         -1    Ti    1   F    1                 133.4       1.00000
    3     TiS         -1    Ti    1   S    1                 110.3       1.00000
    3     TiCl        -1    Ti    1   Cl   1                 101.6       1.00000
    3     VN          -1    V     1   N    1                 115.7       1.00000
    3     VO          -1    V     1   O    1                 151.2       1.00000
    3     VCl         -1    V     1   Cl   1                  97.5       1.00000
    3     CrH         -1    Cr    1   H    1                  51.7       1.00000
    3     CrO         -1    Cr    1   O    1                 107.0       1.00000
    3     CrF         -1    Cr    1   F    1                 115.4       1.00000
    3     CrCl        -1    Cr    1   Cl   1                  89.9       1.00000
    3     MnH         -1    Mn    1   H    1                  38.5       1.00000
    3     MnO         -1    Mn    1   O    1                  88.7       1.00000
    3     MnF         -1    Mn    1   F    1                 107.3       1.00000
    3     MnS         -1    Mn    1   S    1                  67.8       1.00000
    3     MnCl        -1    Mn    1   Cl   1                  82.2       1.00000
    3     FeH         -1    Fe    1   H    1                  44.5       1.00000
    3     FeO         -1    Fe    1   O    1                  99.1       1.00000
    3     FeS         -1    Fe    1   S    1                  77.7       1.00000
    3     FeCl        -1    Fe    1   Cl   1                  83.6       1.00000
    3     CoH         -1    Co    1   H    1                  56.0       1.00000
    3     CoO         -1    Co    1   O    1                  91.7       1.00000
    3     CoS         -1    Co    1   S    1                  79.7       1.00000
    3     CoCl        -1    Co    1   Cl   1                  84.7       1.00000
    3     NiH         -1    Ni    1   H    1                  70.8       1.00000
    3     NiO         -1    Ni    1   O    1                  93.0       1.00000
    3     NiF         -1    Ni    1   F    1                 105.4       1.00000
    3     NiCl        -1    Ni    1   Cl   1                  92.3       1.00000
    3     CuH         -1    Cu    1   H    1                  66.1       1.00000
    3     CuO         -1    Cu    1   O    1                  62.6       1.00000
    3     CuF         -1    Cu    1   F    1                  97.1       1.00000
    3     CuS         -1    Cu    1   S    1                  66.5       1.00000
    3     CuCl        -1    Cu    1   Cl   1                  88.7       1.00000
    3     ZnH         -1    Zn    1   H    1                  21.4       1.00000
    3     ZnO         -1    Zn    1   O    1                  36.8       1.00000
    3     ZnS         -1    Zn    1   S    1                  34.4       1.00000
    3     ZnCl        -1    Zn    1   Cl   1                  50.1       1.00000
