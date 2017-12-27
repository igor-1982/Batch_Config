# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./H2plus            2        QChem

# The project description
__title__ ::
"=========================== H-H plus ============================"
" Reference data were calculated by UHF/aug-cc-pVQZ               "

# Machine and option keyword of QChem Package
__qchem__ ::   1 rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
exchange = b3lyp
basis = 6-311+g(3df,2p)
scf_convergence = 8
xc_grid = 000075000194
$end


# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .


# The molecular set to batch: 
#               52 is the total number of jobs in this batch list
__batch__ :: 52
#"Flag"         "DIR"                         "InpName"       "JobType"
 H             <PATH1>/H2plus                      H.in       energy
 H2_0_6        <PATH1>/H2plus                 H2_0_6.in       energy
 H2_0_7        <PATH1>/H2plus                 H2_0_7.in       energy
 H2_0_8        <PATH1>/H2plus                 H2_0_8.in       energy
 H2_0_9        <PATH1>/H2plus                 H2_0_9.in       energy
 H2_0_9_5      <PATH1>/H2plus               H2_0_9_5.in       energy
 H2_1_0        <PATH1>/H2plus                 H2_1_0.in       energy
 H2_1_0_5      <PATH1>/H2plus               H2_1_0_5.in       energy
 H2_1_1        <PATH1>/H2plus                 H2_1_1.in       energy
 H2_1_1_5      <PATH1>/H2plus               H2_1_1_5.in       energy
 H2_1_2        <PATH1>/H2plus                 H2_1_2.in       energy
 H2_1_4        <PATH1>/H2plus                 H2_1_4.in       energy
 H2_1_6        <PATH1>/H2plus                 H2_1_6.in       energy
 H2_1_8        <PATH1>/H2plus                 H2_1_8.in       energy
 H2_2_0        <PATH1>/H2plus                 H2_2_0.in       energy
 H2_2_2        <PATH1>/H2plus                 H2_2_2.in       energy
 H2_2_4        <PATH1>/H2plus                 H2_2_4.in       energy
 H2_2_6        <PATH1>/H2plus                 H2_2_6.in       energy
 H2_2_8        <PATH1>/H2plus                 H2_2_8.in       energy
 H2_3_0        <PATH1>/H2plus                 H2_3_0.in       energy
 H2_3_2        <PATH1>/H2plus                 H2_3_2.in       energy
 H2_3_4        <PATH1>/H2plus                 H2_3_4.in       energy
 H2_3_6        <PATH1>/H2plus                 H2_3_6.in       energy
 H2_3_8        <PATH1>/H2plus                 H2_3_8.in       energy
 H2_4_0        <PATH1>/H2plus                 H2_4_0.in       energy
 H2_4_2        <PATH1>/H2plus                 H2_4_2.in       energy
 H2_4_6        <PATH1>/H2plus                 H2_4_6.in       energy
 H2_5_0        <PATH1>/H2plus                 H2_5_0.in       energy
 H2_5_4        <PATH1>/H2plus                 H2_5_4.in       energy
 H2_5_8        <PATH1>/H2plus                 H2_5_8.in       energy
 H2_6_2        <PATH1>/H2plus                 H2_6_2.in       energy
 H2_6_6        <PATH1>/H2plus                 H2_6_6.in       energy
 H2_7_0        <PATH1>/H2plus                 H2_7_0.in       energy
 H2_7_4        <PATH1>/H2plus                 H2_7_4.in       energy
 H2_7_8        <PATH1>/H2plus                 H2_7_8.in       energy
 H2_8_2        <PATH1>/H2plus                 H2_8_2.in       energy
 H2_8_6        <PATH1>/H2plus                 H2_8_6.in       energy
 H2_9_0        <PATH1>/H2plus                 H2_9_0.in       energy
 H2_9_4        <PATH1>/H2plus                 H2_9_4.in       energy
 H2_9_8        <PATH1>/H2plus                 H2_9_8.in       energy
 H2_10_2       <PATH1>/H2plus                H2_10_2.in       energy
 H2_10_6       <PATH1>/H2plus                H2_10_6.in       energy
 H2_11_0       <PATH1>/H2plus                H2_11_0.in       energy
 H2_12_0       <PATH1>/H2plus                H2_12_0.in       energy
 H2_13_0       <PATH1>/H2plus                H2_13_0.in       energy
 H2_14_0       <PATH1>/H2plus                H2_14_0.in       energy
 H2_15_0       <PATH1>/H2plus                H2_15_0.in       energy
 H2_16_0       <PATH1>/H2plus                H2_16_0.in       energy
 H2_17_0       <PATH1>/H2plus                H2_17_0.in       energy
 H2_18_0       <PATH1>/H2plus                H2_18_0.in       energy
 H2_19_0       <PATH1>/H2plus                H2_19_0.in       energy
 H2_20_0       <PATH1>/H2plus                H2_20_0.in       energy

# Training set for the atomization energy
#		51 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 51  1.0
#"Number" "Flag"     "Scale"                                    "Ref"       "Weight"
 2        H2_0_6      1         H  -1                       -0.00846688     1.0
 2        H2_0_7      1         H  -1                       -0.05708461     1.0
 2        H2_0_8      1         H  -1                       -0.08343733     1.0
 2        H2_0_9      1         H  -1                       -0.09666773     1.0
 2        H2_0_9_5    1         H  -1                       -0.10006843     1.0
 2        H2_1_0      1         H  -1                       -0.10192919     1.0
 2        H2_1_0_5    1         H  -1                       -0.10257782     1.0
 2        H2_1_1      1         H  -1                       -0.10227181     1.0
 2        H2_1_1_5    1         H  -1                       -0.10121504     1.0
 2        H2_1_2      1         H  -1                       -0.09957021     1.0
 2        H2_1_4      1         H  -1                       -0.08937586     1.0
 2        H2_1_6      1         H  -1                       -0.07672872     1.0
 2        H2_1_8      1         H  -1                       -0.06399999     1.0
 2        H2_2_0      1         H  -1                       -0.05224911     1.0
 2        H2_2_2      1         H  -1                       -0.04191552     1.0
 2        H2_2_4      1         H  -1                       -0.03312440     1.0
 2        H2_2_6      1         H  -1                       -0.02583523     1.0
 2        H2_2_8      1         H  -1                       -0.01991965     1.0
 2        H2_3_0      1         H  -1                       -0.01520711     1.0
 2        H2_3_2      1         H  -1                       -0.01151373     1.0
 2        H2_3_4      1         H  -1                       -0.00866032     1.0
 2        H2_3_6      1         H  -1                       -0.00648283     1.0
 2        H2_3_8      1         H  -1                       -0.00483788     1.0
 2        H2_4_0      1         H  -1                       -0.00360500     1.0
 2        H2_4_2      1         H  -1                       -0.00268637     1.0
 2        H2_4_6      1         H  -1                       -0.00150029     1.0
 2        H2_5_0      1         H  -1                       -0.00085237     1.0
 2        H2_5_4      1         H  -1                       -0.00049847     1.0
 2        H2_5_8      1         H  -1                       -0.00030343     1.0
 2        H2_6_2      1         H  -1                       -0.00019379     1.0
 2        H2_6_6      1         H  -1                       -0.00013029     1.0
 2        H2_7_0      1         H  -1                       -0.00009210     1.0
 2        H2_7_4      1         H  -1                       -0.00006812     1.0
 2        H2_7_8      1         H  -1                       -0.00005235     1.0
 2        H2_8_2      1         H  -1                       -0.00004145     1.0
 2        H2_8_6      1         H  -1                       -0.00003358     1.0
 2        H2_9_0      1         H  -1                       -0.00002766     1.0
 2        H2_9_4      1         H  -1                       -0.00002308     1.0
 2        H2_9_8      1         H  -1                       -0.00001944     1.0
 2        H2_10_2     1         H  -1                       -0.00001634     1.0
 2        H2_10_6     1         H  -1                       -0.00001403     1.0
 2        H2_11_0     1         H  -1                       -0.00001210     1.0
 2        H2_12_0     1         H  -1                       -0.00000855     1.0
 2        H2_13_0     1         H  -1                       -0.00000620     1.0
 2        H2_14_0     1         H  -1                       -0.00000461     1.0
 2        H2_15_0     1         H  -1                       -0.00000349     1.0
 2        H2_16_0     1         H  -1                       -0.00000270     1.0
 2        H2_17_0     1         H  -1                       -0.00000212     1.0
 2        H2_18_0     1         H  -1                       -0.00000168     1.0
 2        H2_19_0     1         H  -1                       -0.00000136     1.0
 2        H2_20_0     1         H  -1                       -0.00000110     1.0
