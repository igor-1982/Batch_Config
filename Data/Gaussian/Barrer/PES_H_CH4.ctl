# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PES_H_CH4      2              Gaussian

# The project description
__title__ ::
"This is the potential energy surface of H+CH4->H2+CH3 reaction"

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) NoSymm Scf=Tight


# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1>   '.'


# The atomic set to batch: 
#            49+37=86 is the total number of jobs in this batch list
__batch__ :: 86
#"Flag"           "DIR"            "InpName"          "JobType"
# H+CH4 49
A1             <PATH1>/PES_H_CH4   H_CH4_0.com        energy 
A2             <PATH1>/PES_H_CH4   H_CH4_1.com        energy 
A3             <PATH1>/PES_H_CH4   H_CH4_2.com        energy 
A4             <PATH1>/PES_H_CH4   H_CH4_3.com        energy 
A5             <PATH1>/PES_H_CH4   H_CH4_4.com        energy 
A6             <PATH1>/PES_H_CH4   H_CH4_5.com        energy 
A7             <PATH1>/PES_H_CH4   H_CH4_6.com        energy 
A8             <PATH1>/PES_H_CH4   H_CH4_7.com        energy 
A9             <PATH1>/PES_H_CH4   H_CH4_8.com        energy 
A10            <PATH1>/PES_H_CH4   H_CH4_9.com        energy 
A11            <PATH1>/PES_H_CH4   H_CH4_10.com       energy 
A12            <PATH1>/PES_H_CH4   H_CH4_11.com       energy 
A13            <PATH1>/PES_H_CH4   H_CH4_12.com       energy 
A14            <PATH1>/PES_H_CH4   H_CH4_13.com       energy 
A15            <PATH1>/PES_H_CH4   H_CH4_14.com       energy 
A16            <PATH1>/PES_H_CH4   H_CH4_15.com       energy 
A17            <PATH1>/PES_H_CH4   H_CH4_16.com       energy 
A18            <PATH1>/PES_H_CH4   H_CH4_17.com       energy 
A19            <PATH1>/PES_H_CH4   H_CH4_18.com       energy 
A20            <PATH1>/PES_H_CH4   H_CH4_19.com       energy 
A21            <PATH1>/PES_H_CH4   H_CH4_20.com       energy 
A22            <PATH1>/PES_H_CH4   H_CH4_21.com       energy 
A23            <PATH1>/PES_H_CH4   H_CH4_22.com       energy 
A24            <PATH1>/PES_H_CH4   H_CH4_23.com       energy 
A25            <PATH1>/PES_H_CH4   H_CH4_24.com       energy 
A26            <PATH1>/PES_H_CH4   H_CH4_25.com       energy 
A27            <PATH1>/PES_H_CH4   H_CH4_26.com       energy 
A28            <PATH1>/PES_H_CH4   H_CH4_27.com       energy 
A29            <PATH1>/PES_H_CH4   H_CH4_28.com       energy 
A30            <PATH1>/PES_H_CH4   H_CH4_29.com       energy 
A31            <PATH1>/PES_H_CH4   H_CH4_30.com       energy 
A32            <PATH1>/PES_H_CH4   H_CH4_31.com       energy 
A33            <PATH1>/PES_H_CH4   H_CH4_32.com       energy 
A34            <PATH1>/PES_H_CH4   H_CH4_33.com       energy 
A35            <PATH1>/PES_H_CH4   H_CH4_34.com       energy 
A36            <PATH1>/PES_H_CH4   H_CH4_35.com       energy 
A37            <PATH1>/PES_H_CH4   H_CH4_36.com       energy 
A38            <PATH1>/PES_H_CH4   H_CH4_37.com       energy 
A39            <PATH1>/PES_H_CH4   H_CH4_38.com       energy 
A40            <PATH1>/PES_H_CH4   H_CH4_39.com       energy 
A41            <PATH1>/PES_H_CH4   H_CH4_40.com       energy 
A42            <PATH1>/PES_H_CH4   H_CH4_41.com       energy 
A43            <PATH1>/PES_H_CH4   H_CH4_42.com       energy 
A44            <PATH1>/PES_H_CH4   H_CH4_43.com       energy 
A45            <PATH1>/PES_H_CH4   H_CH4_44.com       energy 
A46            <PATH1>/PES_H_CH4   H_CH4_45.com       energy 
A47            <PATH1>/PES_H_CH4   H_CH4_46.com       energy 
A48            <PATH1>/PES_H_CH4   H_CH4_47.com       energy 
A49            <PATH1>/PES_H_CH4   H_CH4_48.com       energy 
# H2+CH3 37
B1             <PATH1>/PES_H_CH4   H2_CH3_0.com       energy 
B2             <PATH1>/PES_H_CH4   H2_CH3_1.com       energy 
B3             <PATH1>/PES_H_CH4   H2_CH3_2.com       energy 
B4             <PATH1>/PES_H_CH4   H2_CH3_3.com       energy 
B5             <PATH1>/PES_H_CH4   H2_CH3_4.com       energy 
B6             <PATH1>/PES_H_CH4   H2_CH3_5.com       energy 
B7             <PATH1>/PES_H_CH4   H2_CH3_6.com       energy 
B8             <PATH1>/PES_H_CH4   H2_CH3_7.com       energy 
B9             <PATH1>/PES_H_CH4   H2_CH3_8.com       energy 
B10            <PATH1>/PES_H_CH4   H2_CH3_9.com       energy 
B11            <PATH1>/PES_H_CH4   H2_CH3_10.com      energy 
B12            <PATH1>/PES_H_CH4   H2_CH3_11.com      energy 
B13            <PATH1>/PES_H_CH4   H2_CH3_12.com      energy 
B14            <PATH1>/PES_H_CH4   H2_CH3_13.com      energy 
B15            <PATH1>/PES_H_CH4   H2_CH3_14.com      energy 
B16            <PATH1>/PES_H_CH4   H2_CH3_15.com      energy 
B17            <PATH1>/PES_H_CH4   H2_CH3_16.com      energy 
B18            <PATH1>/PES_H_CH4   H2_CH3_17.com      energy 
B19            <PATH1>/PES_H_CH4   H2_CH3_18.com      energy 
B20            <PATH1>/PES_H_CH4   H2_CH3_19.com      energy 
B21            <PATH1>/PES_H_CH4   H2_CH3_20.com      energy 
B22            <PATH1>/PES_H_CH4   H2_CH3_21.com      energy 
B23            <PATH1>/PES_H_CH4   H2_CH3_22.com      energy 
B24            <PATH1>/PES_H_CH4   H2_CH3_23.com      energy 
B25            <PATH1>/PES_H_CH4   H2_CH3_24.com      energy 
B26            <PATH1>/PES_H_CH4   H2_CH3_25.com      energy 
B27            <PATH1>/PES_H_CH4   H2_CH3_26.com      energy 
B28            <PATH1>/PES_H_CH4   H2_CH3_27.com      energy 
B29            <PATH1>/PES_H_CH4   H2_CH3_28.com      energy 
B30            <PATH1>/PES_H_CH4   H2_CH3_29.com      energy 
B31            <PATH1>/PES_H_CH4   H2_CH3_30.com      energy 
B32            <PATH1>/PES_H_CH4   H2_CH3_31.com      energy 
B33            <PATH1>/PES_H_CH4   H2_CH3_32.com      energy 
B34            <PATH1>/PES_H_CH4   H2_CH3_33.com      energy 
B35            <PATH1>/PES_H_CH4   H2_CH3_34.com      energy 
B36            <PATH1>/PES_H_CH4   H2_CH3_35.com      energy 
B37            <PATH1>/PES_H_CH4   H2_CH3_36.com      energy 


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


