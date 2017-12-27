# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PES_H_CH4      2              QChem

# The project description
__title__ ::
"This is the potential energy surface of H+CH4->H2+CH3 reaction"

# Machine and option keyword of QChem Package
__qchem__ ::  1
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
#            49+37=86 is the total number of jobs in this batch list
__batch__ :: 86
#"Flag"           "DIR"            "InpName"          "JobType"
# H+CH4 49
A1             <PATH1>/PES_H_CH4   H_CH4_0.in        energy 
A2             <PATH1>/PES_H_CH4   H_CH4_1.in        energy 
A3             <PATH1>/PES_H_CH4   H_CH4_2.in        energy 
A4             <PATH1>/PES_H_CH4   H_CH4_3.in        energy 
A5             <PATH1>/PES_H_CH4   H_CH4_4.in        energy 
A6             <PATH1>/PES_H_CH4   H_CH4_5.in        energy 
A7             <PATH1>/PES_H_CH4   H_CH4_6.in        energy 
A8             <PATH1>/PES_H_CH4   H_CH4_7.in        energy 
A9             <PATH1>/PES_H_CH4   H_CH4_8.in        energy 
A10            <PATH1>/PES_H_CH4   H_CH4_9.in        energy 
A11            <PATH1>/PES_H_CH4   H_CH4_10.in       energy 
A12            <PATH1>/PES_H_CH4   H_CH4_11.in       energy 
A13            <PATH1>/PES_H_CH4   H_CH4_12.in       energy 
A14            <PATH1>/PES_H_CH4   H_CH4_13.in       energy 
A15            <PATH1>/PES_H_CH4   H_CH4_14.in       energy 
A16            <PATH1>/PES_H_CH4   H_CH4_15.in       energy 
A17            <PATH1>/PES_H_CH4   H_CH4_16.in       energy 
A18            <PATH1>/PES_H_CH4   H_CH4_17.in       energy 
A19            <PATH1>/PES_H_CH4   H_CH4_18.in       energy 
A20            <PATH1>/PES_H_CH4   H_CH4_19.in       energy 
A21            <PATH1>/PES_H_CH4   H_CH4_20.in       energy 
A22            <PATH1>/PES_H_CH4   H_CH4_21.in       energy 
A23            <PATH1>/PES_H_CH4   H_CH4_22.in       energy 
A24            <PATH1>/PES_H_CH4   H_CH4_23.in       energy 
A25            <PATH1>/PES_H_CH4   H_CH4_24.in       energy 
A26            <PATH1>/PES_H_CH4   H_CH4_25.in       energy 
A27            <PATH1>/PES_H_CH4   H_CH4_26.in       energy 
A28            <PATH1>/PES_H_CH4   H_CH4_27.in       energy 
A29            <PATH1>/PES_H_CH4   H_CH4_28.in       energy 
A30            <PATH1>/PES_H_CH4   H_CH4_29.in       energy 
A31            <PATH1>/PES_H_CH4   H_CH4_30.in       energy 
A32            <PATH1>/PES_H_CH4   H_CH4_31.in       energy 
A33            <PATH1>/PES_H_CH4   H_CH4_32.in       energy 
A34            <PATH1>/PES_H_CH4   H_CH4_33.in       energy 
A35            <PATH1>/PES_H_CH4   H_CH4_34.in       energy 
A36            <PATH1>/PES_H_CH4   H_CH4_35.in       energy 
A37            <PATH1>/PES_H_CH4   H_CH4_36.in       energy 
A38            <PATH1>/PES_H_CH4   H_CH4_37.in       energy 
A39            <PATH1>/PES_H_CH4   H_CH4_38.in       energy 
A40            <PATH1>/PES_H_CH4   H_CH4_39.in       energy 
A41            <PATH1>/PES_H_CH4   H_CH4_40.in       energy 
A42            <PATH1>/PES_H_CH4   H_CH4_41.in       energy 
A43            <PATH1>/PES_H_CH4   H_CH4_42.in       energy 
A44            <PATH1>/PES_H_CH4   H_CH4_43.in       energy 
A45            <PATH1>/PES_H_CH4   H_CH4_44.in       energy 
A46            <PATH1>/PES_H_CH4   H_CH4_45.in       energy 
A47            <PATH1>/PES_H_CH4   H_CH4_46.in       energy 
A48            <PATH1>/PES_H_CH4   H_CH4_47.in       energy 
A49            <PATH1>/PES_H_CH4   H_CH4_48.in       energy 
# H2+CH3 37
B1             <PATH1>/PES_H_CH4   H2_CH3_0.in       energy 
B2             <PATH1>/PES_H_CH4   H2_CH3_1.in       energy 
B3             <PATH1>/PES_H_CH4   H2_CH3_2.in       energy 
B4             <PATH1>/PES_H_CH4   H2_CH3_3.in       energy 
B5             <PATH1>/PES_H_CH4   H2_CH3_4.in       energy 
B6             <PATH1>/PES_H_CH4   H2_CH3_5.in       energy 
B7             <PATH1>/PES_H_CH4   H2_CH3_6.in       energy 
B8             <PATH1>/PES_H_CH4   H2_CH3_7.in       energy 
B9             <PATH1>/PES_H_CH4   H2_CH3_8.in       energy 
B10            <PATH1>/PES_H_CH4   H2_CH3_9.in       energy 
B11            <PATH1>/PES_H_CH4   H2_CH3_10.in      energy 
B12            <PATH1>/PES_H_CH4   H2_CH3_11.in      energy 
B13            <PATH1>/PES_H_CH4   H2_CH3_12.in      energy 
B14            <PATH1>/PES_H_CH4   H2_CH3_13.in      energy 
B15            <PATH1>/PES_H_CH4   H2_CH3_14.in      energy 
B16            <PATH1>/PES_H_CH4   H2_CH3_15.in      energy 
B17            <PATH1>/PES_H_CH4   H2_CH3_16.in      energy 
B18            <PATH1>/PES_H_CH4   H2_CH3_17.in      energy 
B19            <PATH1>/PES_H_CH4   H2_CH3_18.in      energy 
B20            <PATH1>/PES_H_CH4   H2_CH3_19.in      energy 
B21            <PATH1>/PES_H_CH4   H2_CH3_20.in      energy 
B22            <PATH1>/PES_H_CH4   H2_CH3_21.in      energy 
B23            <PATH1>/PES_H_CH4   H2_CH3_22.in      energy 
B24            <PATH1>/PES_H_CH4   H2_CH3_23.in      energy 
B25            <PATH1>/PES_H_CH4   H2_CH3_24.in      energy 
B26            <PATH1>/PES_H_CH4   H2_CH3_25.in      energy 
B27            <PATH1>/PES_H_CH4   H2_CH3_26.in      energy 
B28            <PATH1>/PES_H_CH4   H2_CH3_27.in      energy 
B29            <PATH1>/PES_H_CH4   H2_CH3_28.in      energy 
B30            <PATH1>/PES_H_CH4   H2_CH3_29.in      energy 
B31            <PATH1>/PES_H_CH4   H2_CH3_30.in      energy 
B32            <PATH1>/PES_H_CH4   H2_CH3_31.in      energy 
B33            <PATH1>/PES_H_CH4   H2_CH3_32.in      energy 
B34            <PATH1>/PES_H_CH4   H2_CH3_33.in      energy 
B35            <PATH1>/PES_H_CH4   H2_CH3_34.in      energy 
B36            <PATH1>/PES_H_CH4   H2_CH3_35.in      energy 
B37            <PATH1>/PES_H_CH4   H2_CH3_36.in      energy 


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


