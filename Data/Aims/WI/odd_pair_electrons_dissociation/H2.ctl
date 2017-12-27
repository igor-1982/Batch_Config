# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"  "ProjTool"
__project__ ::   ./H2              2          QChem

# The project description
__title__ ::
"============================= H-H ==============================="

# Machine and option keyword of QChem Package
__qchem__ ::  1   # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static      = 200
mem_total       = 3500
exchange        = HF
correlation     = ccsd(t)
basis           = aug-cc-pVQZ
scf_convergence = 7
symmetry        = false
xc_grid         = 000075000302
$end


# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .
<PATH2> = .


# The molecular set to batch: 
#               27 is the total number of jobs in this batch list
__batch__ :: 27
#"Flag"         "DIR"                         "InpName"       "JobType"
# Atoms 1 
 H             <PATH1>/H2                          H.in       energy
 H2_0_2        <PATH1>/H2                     H2_0_2.in       energy
 H2_0_4        <PATH1>/H2                     H2_0_4.in       energy
 H2_0_6        <PATH1>/H2                     H2_0_6.in       energy
 H2_0_8        <PATH1>/H2                     H2_0_8.in       energy
 H2_1_0        <PATH1>/H2                     H2_1_0.in       energy
 H2_1_2        <PATH1>/H2                     H2_1_2.in       energy
 H2_1_4        <PATH1>/H2                     H2_1_4.in       energy
 H2_1_6        <PATH1>/H2                     H2_1_6.in       energy
 H2_1_8        <PATH1>/H2                     H2_1_8.in       energy
 H2_2_0        <PATH1>/H2                     H2_2_0.in       energy
 H2_2_2        <PATH1>/H2                     H2_2_2.in       energy
 H2_2_4        <PATH1>/H2                     H2_2_4.in       energy
 H2_2_6        <PATH1>/H2                     H2_2_6.in       energy
 H2_2_8        <PATH1>/H2                     H2_2_8.in       energy
 H2_3_0        <PATH1>/H2                     H2_3_0.in       energy
 H2_3_2        <PATH1>/H2                     H2_3_2.in       energy
 H2_3_4        <PATH1>/H2                     H2_3_4.in       energy
 H2_3_6        <PATH1>/H2                     H2_3_6.in       energy
 H2_3_8        <PATH1>/H2                     H2_3_8.in       energy
 H2_4_0        <PATH1>/H2                     H2_4_0.in       energy
 H2_4_2        <PATH1>/H2                     H2_4_2.in       energy
 H2_4_6        <PATH1>/H2                     H2_4_6.in       energy
 H2_5_0        <PATH1>/H2                     H2_5_0.in       energy
 H2_5_4        <PATH1>/H2                     H2_5_4.in       energy
 H2_5_8        <PATH1>/H2                     H2_5_8.in       energy
 H2_6_2        <PATH1>/H2                     H2_6_2.in       energy

# Training set for the atomization energy
#		26 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 26  1.0
#"Number" "Flag"     "Scale"                                 "Ref"    "Weight"
 2        H2_0_2  1      H  -2                               0.00       1.0
 2        H2_0_4  1      H  -2                               0.00       1.0
 2        H2_0_6  1      H  -2                               0.00       1.0
 2        H2_0_8  1      H  -2                               0.00       1.0
 2        H2_1_0  1      H  -2                               0.00       1.0
 2        H2_1_2  1      H  -2                               0.00       1.0
 2        H2_1_4  1      H  -2                               0.00       1.0
 2        H2_1_6  1      H  -2                               0.00       1.0
 2        H2_1_8  1      H  -2                               0.00       1.0
 2        H2_2_0  1      H  -2                               0.00       1.0
 2        H2_2_2  1      H  -2                               0.00       1.0
 2        H2_2_4  1      H  -2                               0.00       1.0
 2        H2_2_6  1      H  -2                               0.00       1.0
 2        H2_2_8  1      H  -2                               0.00       1.0
 2        H2_3_0  1      H  -2                               0.00       1.0
 2        H2_3_2  1      H  -2                               0.00       1.0
 2        H2_3_4  1      H  -2                               0.00       1.0
 2        H2_3_6  1      H  -2                               0.00       1.0
 2        H2_3_8  1      H  -2                               0.00       1.0
 2        H2_4_0  1      H  -2                               0.00       1.0
 2        H2_4_2  1      H  -2                               0.00       1.0
 2        H2_4_6  1      H  -2                               0.00       1.0
 2        H2_5_0  1      H  -2                               0.00       1.0
 2        H2_5_4  1      H  -2                               0.00       1.0
 2        H2_5_8  1      H  -2                               0.00       1.0
 2        H2_6_2  1      H  -2                               0.00       1.0
