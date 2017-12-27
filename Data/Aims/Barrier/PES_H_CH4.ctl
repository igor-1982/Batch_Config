# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using FHI-aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PES_H_CH4      2              Aims

# The project description
__title__ ::
"This is the potential energy surface of H+CH4->H2+CH3 reaction"

# Machine and option keyword of FHI-aims Package                                                                                                                                        
__aims_basis__ :: /mnt/lxfs1/home/zhang/export/aims/my_basis_pool/NAO-VCC-XZ/NAO-VCC-QZ
__aims__ ::  12  052014.mpi
xc                       pbe
vdw_correction_hirshfeld
#total_energy_method      rPT2
#rpa_along_ac_path        10
#frequency_points         480
frozen_core_postSCF      1
charge                   0.
relativistic             none
occupation_type          integer 0.0001
mixer                    pulay
n_max_pulay              10
charge_mix_param         0.5
sc_accuracy_rho          1E-6
sc_accuracy_eev          1E-4
sc_accuracy_etot         1E-6
sc_iter_limit            200
override_illconditioning .true.
end aims

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1>   '/mnt/lxfs1/home/zhang/export/Batch_Config/Data/Aims/Barrier'


# The atomic set to batch: 
#            49+37=86 is the total number of jobs in this batch list
__batch__ :: 86
#"Flag"           "DIR"            "InpName"          "JobType"
# H+CH4 49
A1             <PATH1>/PES_H_CH4   H_CH4_0           energy 
A2             <PATH1>/PES_H_CH4   H_CH4_1           energy 
A3             <PATH1>/PES_H_CH4   H_CH4_2           energy 
A4             <PATH1>/PES_H_CH4   H_CH4_3           energy 
A5             <PATH1>/PES_H_CH4   H_CH4_4           energy 
A6             <PATH1>/PES_H_CH4   H_CH4_5           energy 
A7             <PATH1>/PES_H_CH4   H_CH4_6           energy 
A8             <PATH1>/PES_H_CH4   H_CH4_7           energy 
A9             <PATH1>/PES_H_CH4   H_CH4_8           energy 
A10            <PATH1>/PES_H_CH4   H_CH4_9           energy 
A11            <PATH1>/PES_H_CH4   H_CH4_10          energy 
A12            <PATH1>/PES_H_CH4   H_CH4_11          energy 
A13            <PATH1>/PES_H_CH4   H_CH4_12          energy 
A14            <PATH1>/PES_H_CH4   H_CH4_13          energy 
A15            <PATH1>/PES_H_CH4   H_CH4_14          energy 
A16            <PATH1>/PES_H_CH4   H_CH4_15          energy 
A17            <PATH1>/PES_H_CH4   H_CH4_16          energy 
A18            <PATH1>/PES_H_CH4   H_CH4_17          energy 
A19            <PATH1>/PES_H_CH4   H_CH4_18          energy 
A20            <PATH1>/PES_H_CH4   H_CH4_19          energy 
A21            <PATH1>/PES_H_CH4   H_CH4_20          energy 
A22            <PATH1>/PES_H_CH4   H_CH4_21          energy 
A23            <PATH1>/PES_H_CH4   H_CH4_22          energy 
A24            <PATH1>/PES_H_CH4   H_CH4_23          energy 
A25            <PATH1>/PES_H_CH4   H_CH4_24          energy 
A26            <PATH1>/PES_H_CH4   H_CH4_25          energy 
A27            <PATH1>/PES_H_CH4   H_CH4_26          energy 
A28            <PATH1>/PES_H_CH4   H_CH4_27          energy 
A29            <PATH1>/PES_H_CH4   H_CH4_28          energy 
A30            <PATH1>/PES_H_CH4   H_CH4_29          energy 
A31            <PATH1>/PES_H_CH4   H_CH4_30          energy 
A32            <PATH1>/PES_H_CH4   H_CH4_31          energy 
A33            <PATH1>/PES_H_CH4   H_CH4_32          energy 
A34            <PATH1>/PES_H_CH4   H_CH4_33          energy 
A35            <PATH1>/PES_H_CH4   H_CH4_34          energy 
A36            <PATH1>/PES_H_CH4   H_CH4_35          energy 
A37            <PATH1>/PES_H_CH4   H_CH4_36          energy 
A38            <PATH1>/PES_H_CH4   H_CH4_37          energy 
A39            <PATH1>/PES_H_CH4   H_CH4_38          energy 
A40            <PATH1>/PES_H_CH4   H_CH4_39          energy 
A41            <PATH1>/PES_H_CH4   H_CH4_40          energy 
A42            <PATH1>/PES_H_CH4   H_CH4_41          energy 
A43            <PATH1>/PES_H_CH4   H_CH4_42          energy 
A44            <PATH1>/PES_H_CH4   H_CH4_43          energy 
A45            <PATH1>/PES_H_CH4   H_CH4_44          energy 
A46            <PATH1>/PES_H_CH4   H_CH4_45          energy 
A47            <PATH1>/PES_H_CH4   H_CH4_46          energy 
A48            <PATH1>/PES_H_CH4   H_CH4_47          energy 
A49            <PATH1>/PES_H_CH4   H_CH4_48          energy 
# H2+CH3 37
B1             <PATH1>/PES_H_CH4   H2_CH3_0          energy 
B2             <PATH1>/PES_H_CH4   H2_CH3_1          energy 
B3             <PATH1>/PES_H_CH4   H2_CH3_2          energy 
B4             <PATH1>/PES_H_CH4   H2_CH3_3          energy 
B5             <PATH1>/PES_H_CH4   H2_CH3_4          energy 
B6             <PATH1>/PES_H_CH4   H2_CH3_5          energy 
B7             <PATH1>/PES_H_CH4   H2_CH3_6          energy 
B8             <PATH1>/PES_H_CH4   H2_CH3_7          energy 
B9             <PATH1>/PES_H_CH4   H2_CH3_8          energy 
B10            <PATH1>/PES_H_CH4   H2_CH3_9          energy 
B11            <PATH1>/PES_H_CH4   H2_CH3_10         energy 
B12            <PATH1>/PES_H_CH4   H2_CH3_11         energy 
B13            <PATH1>/PES_H_CH4   H2_CH3_12         energy 
B14            <PATH1>/PES_H_CH4   H2_CH3_13         energy 
B15            <PATH1>/PES_H_CH4   H2_CH3_14         energy 
B16            <PATH1>/PES_H_CH4   H2_CH3_15         energy 
B17            <PATH1>/PES_H_CH4   H2_CH3_16         energy 
B18            <PATH1>/PES_H_CH4   H2_CH3_17         energy 
B19            <PATH1>/PES_H_CH4   H2_CH3_18         energy 
B20            <PATH1>/PES_H_CH4   H2_CH3_19         energy 
B21            <PATH1>/PES_H_CH4   H2_CH3_20         energy 
B22            <PATH1>/PES_H_CH4   H2_CH3_21         energy 
B23            <PATH1>/PES_H_CH4   H2_CH3_22         energy 
B24            <PATH1>/PES_H_CH4   H2_CH3_23         energy 
B25            <PATH1>/PES_H_CH4   H2_CH3_24         energy 
B26            <PATH1>/PES_H_CH4   H2_CH3_25         energy 
B27            <PATH1>/PES_H_CH4   H2_CH3_26         energy 
B28            <PATH1>/PES_H_CH4   H2_CH3_27         energy 
B29            <PATH1>/PES_H_CH4   H2_CH3_28         energy 
B30            <PATH1>/PES_H_CH4   H2_CH3_29         energy 
B31            <PATH1>/PES_H_CH4   H2_CH3_30         energy 
B32            <PATH1>/PES_H_CH4   H2_CH3_31         energy 
B33            <PATH1>/PES_H_CH4   H2_CH3_32         energy 
B34            <PATH1>/PES_H_CH4   H2_CH3_33         energy 
B35            <PATH1>/PES_H_CH4   H2_CH3_34         energy 
B36            <PATH1>/PES_H_CH4   H2_CH3_35         energy 
B37            <PATH1>/PES_H_CH4   H2_CH3_36         energy 


# Training set for experimental atomic energy
#                86 is the total number of the testing energy data
#               1.0 is the scale factor from "a.u." to "a.u."
#                      which scales the calc. data in "a.u."
#                      to the ref. data in "a.u."
__energy__ ::   86     1.0
#"Number" "Flag" "Scale"  "Ref"  "Weight"
  1       A1      1        0.0000   1.0 
  1       A2      1        0.0000   1.0
  1       A3      1        0.0000   1.0
  1       A4      1        0.0000   1.0
  1       A5      1        0.0000   1.0
  1       A6      1        0.0000   1.0
  1       A7      1        0.0000   1.0
  1       A8      1        0.0000   1.0
  1       A9      1        0.0000   1.0
  1       A10     1        0.0000   1.0
  1       A11     1        0.0000   1.0
  1       A12     1        0.0000   1.0
  1       A13     1        0.0000   1.0
  1       A14     1        0.0000   1.0
  1       A15     1        0.0000   1.0
  1       A16     1        0.0000   1.0
  1       A17     1        0.0000   1.0
  1       A18     1        0.0000   1.0
  1       A19     1        0.0000   1.0
  1       A20     1        0.0000   1.0
  1       A21     1        0.0000   1.0
  1       A22     1        0.0000   1.0
  1       A23     1        0.0000   1.0
  1       A24     1        0.0000   1.0
  1       A25     1        0.0000   1.0
  1       A26     1        0.0000   1.0
  1       A27     1        0.0000   1.0
  1       A28     1        0.0000   1.0
  1       A29     1        0.0000   1.0
  1       A30     1        0.0000   1.0
  1       A31     1        0.0000   1.0
  1       A32     1        0.0000   1.0
  1       A33     1        0.0000   1.0
  1       A34     1        0.0000   1.0
  1       A35     1        0.0000   1.0
  1       A36     1        0.0000   1.0
  1       A37     1        0.0000   1.0
  1       A38     1        0.0000   1.0
  1       A39     1        0.0000   1.0
  1       A40     1        0.0000   1.0
  1       A41     1        0.0000   1.0
  1       A42     1        0.0000   1.0
  1       A43     1        0.0000   1.0
  1       A44     1        0.0000   1.0
  1       A45     1        0.0000   1.0
  1       A46     1        0.0000   1.0
  1       A47     1        0.0000   1.0
  1       A48     1        0.0000   1.0
  1       A49     1        0.0000   1.0
  1       B1      1        0.0000   1.0 
  1       B2      1        0.0000   1.0
  1       B3      1        0.0000   1.0
  1       B4      1        0.0000   1.0
  1       B5      1        0.0000   1.0
  1       B6      1        0.0000   1.0
  1       B7      1        0.0000   1.0
  1       B8      1        0.0000   1.0
  1       B9      1        0.0000   1.0
  1       B10     1        0.0000   1.0
  1       B11     1        0.0000   1.0
  1       B12     1        0.0000   1.0
  1       B13     1        0.0000   1.0
  1       B14     1        0.0000   1.0
  1       B15     1        0.0000   1.0
  1       B16     1        0.0000   1.0
  1       B17     1        0.0000   1.0
  1       B18     1        0.0000   1.0
  1       B19     1        0.0000   1.0
  1       B20     1        0.0000   1.0
  1       B21     1        0.0000   1.0
  1       B22     1        0.0000   1.0
  1       B23     1        0.0000   1.0
  1       B24     1        0.0000   1.0
  1       B25     1        0.0000   1.0
  1       B26     1        0.0000   1.0
  1       B27     1        0.0000   1.0
  1       B28     1        0.0000   1.0
  1       B29     1        0.0000   1.0
  1       B30     1        0.0000   1.0
  1       B31     1        0.0000   1.0
  1       B32     1        0.0000   1.0
  1       B33     1        0.0000   1.0
  1       B34     1        0.0000   1.0
  1       B35     1        0.0000   1.0
  1       B36     1        0.0000   1.0
  1       B37     1        0.0000   1.0


