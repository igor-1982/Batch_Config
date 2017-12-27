# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"          "ProjCtrl"      "ProjTool"
__project__ ::   ./S66_monomers_A      2            QChem

# The project description
__title__ ::
"========================== S66a8-monomers_A ============================"
"This is the set of S66a8 from JCTC 2011 7 3466 (Hobza)                  "
"========================================================================"


# Machine and option keyword of Gaussian Package
__qchem__ ::  1   rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static = 200
mem_total  = 7500
exchange = b3lyp
basis = 6-311+g(3df,2p)
scf_convergence = 7
symmetry = false
xc_grid = 000075000302
$end

# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .


# The molecular set to batch: 
#               528 is the total number of jobs in this batch list
__batch__ :: 528
#"Flag"                                   "DIR"                          "InpName"                          "JobType"
                01_Water-Water_1_y_-30    <PATH1>/monomers_A                  01_Water-Water_1_y_-30.in     energy
                01_Water-Water_1_y_+30    <PATH1>/monomers_A                  01_Water-Water_1_y_+30.in     energy
                01_Water-Water_1_z_-30    <PATH1>/monomers_A                  01_Water-Water_1_z_-30.in     energy
                01_Water-Water_1_z_+30    <PATH1>/monomers_A                  01_Water-Water_1_z_+30.in     energy
                01_Water-Water_2_y_-30    <PATH1>/monomers_A                  01_Water-Water_2_y_-30.in     energy
                01_Water-Water_2_y_+30    <PATH1>/monomers_A                  01_Water-Water_2_y_+30.in     energy
                01_Water-Water_2_z_-30    <PATH1>/monomers_A                  01_Water-Water_2_z_-30.in     energy
                01_Water-Water_2_z_+30    <PATH1>/monomers_A                  01_Water-Water_2_z_+30.in     energy
                 02_Water-MeOH_1_y_-30    <PATH1>/monomers_A                   02_Water-MeOH_1_y_-30.in     energy
                 02_Water-MeOH_1_y_+30    <PATH1>/monomers_A                   02_Water-MeOH_1_y_+30.in     energy
                 02_Water-MeOH_1_z_-30    <PATH1>/monomers_A                   02_Water-MeOH_1_z_-30.in     energy
                 02_Water-MeOH_1_z_+30    <PATH1>/monomers_A                   02_Water-MeOH_1_z_+30.in     energy
                 02_Water-MeOH_2_y_-30    <PATH1>/monomers_A                   02_Water-MeOH_2_y_-30.in     energy
                 02_Water-MeOH_2_y_+30    <PATH1>/monomers_A                   02_Water-MeOH_2_y_+30.in     energy
                 02_Water-MeOH_2_z_-30    <PATH1>/monomers_A                   02_Water-MeOH_2_z_-30.in     energy
                 02_Water-MeOH_2_z_+30    <PATH1>/monomers_A                   02_Water-MeOH_2_z_+30.in     energy
                03_Water-MeNH2_1_y_-30    <PATH1>/monomers_A                  03_Water-MeNH2_1_y_-30.in     energy
                03_Water-MeNH2_1_y_+30    <PATH1>/monomers_A                  03_Water-MeNH2_1_y_+30.in     energy
                03_Water-MeNH2_1_z_-30    <PATH1>/monomers_A                  03_Water-MeNH2_1_z_-30.in     energy
                03_Water-MeNH2_1_z_+30    <PATH1>/monomers_A                  03_Water-MeNH2_1_z_+30.in     energy
                03_Water-MeNH2_2_y_-30    <PATH1>/monomers_A                  03_Water-MeNH2_2_y_-30.in     energy
                03_Water-MeNH2_2_y_+30    <PATH1>/monomers_A                  03_Water-MeNH2_2_y_+30.in     energy
                03_Water-MeNH2_2_z_-30    <PATH1>/monomers_A                  03_Water-MeNH2_2_z_-30.in     energy
                03_Water-MeNH2_2_z_+30    <PATH1>/monomers_A                  03_Water-MeNH2_2_z_+30.in     energy
              04_Water-Peptide_1_y_-30    <PATH1>/monomers_A                04_Water-Peptide_1_y_-30.in     energy
              04_Water-Peptide_1_y_+30    <PATH1>/monomers_A                04_Water-Peptide_1_y_+30.in     energy
              04_Water-Peptide_1_z_-30    <PATH1>/monomers_A                04_Water-Peptide_1_z_-30.in     energy
              04_Water-Peptide_1_z_+30    <PATH1>/monomers_A                04_Water-Peptide_1_z_+30.in     energy
              04_Water-Peptide_2_y_-30    <PATH1>/monomers_A                04_Water-Peptide_2_y_-30.in     energy
              04_Water-Peptide_2_y_+30    <PATH1>/monomers_A                04_Water-Peptide_2_y_+30.in     energy
              04_Water-Peptide_2_z_-30    <PATH1>/monomers_A                04_Water-Peptide_2_z_-30.in     energy
              04_Water-Peptide_2_z_+30    <PATH1>/monomers_A                04_Water-Peptide_2_z_+30.in     energy
                  05_MeOH-MeOH_1_y_-30    <PATH1>/monomers_A                    05_MeOH-MeOH_1_y_-30.in     energy
                  05_MeOH-MeOH_1_y_+30    <PATH1>/monomers_A                    05_MeOH-MeOH_1_y_+30.in     energy
                  05_MeOH-MeOH_1_z_-30    <PATH1>/monomers_A                    05_MeOH-MeOH_1_z_-30.in     energy
                  05_MeOH-MeOH_1_z_+30    <PATH1>/monomers_A                    05_MeOH-MeOH_1_z_+30.in     energy
                  05_MeOH-MeOH_2_y_-30    <PATH1>/monomers_A                    05_MeOH-MeOH_2_y_-30.in     energy
                  05_MeOH-MeOH_2_y_+30    <PATH1>/monomers_A                    05_MeOH-MeOH_2_y_+30.in     energy
                  05_MeOH-MeOH_2_z_-30    <PATH1>/monomers_A                    05_MeOH-MeOH_2_z_-30.in     energy
                  05_MeOH-MeOH_2_z_+30    <PATH1>/monomers_A                    05_MeOH-MeOH_2_z_+30.in     energy
                 06_MeOH-MeNH2_1_y_-30    <PATH1>/monomers_A                   06_MeOH-MeNH2_1_y_-30.in     energy
                 06_MeOH-MeNH2_1_y_+30    <PATH1>/monomers_A                   06_MeOH-MeNH2_1_y_+30.in     energy
                 06_MeOH-MeNH2_1_z_-30    <PATH1>/monomers_A                   06_MeOH-MeNH2_1_z_-30.in     energy
                 06_MeOH-MeNH2_1_z_+30    <PATH1>/monomers_A                   06_MeOH-MeNH2_1_z_+30.in     energy
                 06_MeOH-MeNH2_2_y_-30    <PATH1>/monomers_A                   06_MeOH-MeNH2_2_y_-30.in     energy
                 06_MeOH-MeNH2_2_y_+30    <PATH1>/monomers_A                   06_MeOH-MeNH2_2_y_+30.in     energy
                 06_MeOH-MeNH2_2_z_-30    <PATH1>/monomers_A                   06_MeOH-MeNH2_2_z_-30.in     energy
                 06_MeOH-MeNH2_2_z_+30    <PATH1>/monomers_A                   06_MeOH-MeNH2_2_z_+30.in     energy
               07_MeOH-Peptide_1_y_-30    <PATH1>/monomers_A                 07_MeOH-Peptide_1_y_-30.in     energy
               07_MeOH-Peptide_1_y_+30    <PATH1>/monomers_A                 07_MeOH-Peptide_1_y_+30.in     energy
               07_MeOH-Peptide_1_z_-30    <PATH1>/monomers_A                 07_MeOH-Peptide_1_z_-30.in     energy
               07_MeOH-Peptide_1_z_+30    <PATH1>/monomers_A                 07_MeOH-Peptide_1_z_+30.in     energy
               07_MeOH-Peptide_2_y_-30    <PATH1>/monomers_A                 07_MeOH-Peptide_2_y_-30.in     energy
               07_MeOH-Peptide_2_y_+30    <PATH1>/monomers_A                 07_MeOH-Peptide_2_y_+30.in     energy
               07_MeOH-Peptide_2_z_-30    <PATH1>/monomers_A                 07_MeOH-Peptide_2_z_-30.in     energy
               07_MeOH-Peptide_2_z_+30    <PATH1>/monomers_A                 07_MeOH-Peptide_2_z_+30.in     energy
                 08_MeOH-Water_1_y_-30    <PATH1>/monomers_A                   08_MeOH-Water_1_y_-30.in     energy
                 08_MeOH-Water_1_y_+30    <PATH1>/monomers_A                   08_MeOH-Water_1_y_+30.in     energy
                 08_MeOH-Water_1_z_-30    <PATH1>/monomers_A                   08_MeOH-Water_1_z_-30.in     energy
                 08_MeOH-Water_1_z_+30    <PATH1>/monomers_A                   08_MeOH-Water_1_z_+30.in     energy
                 08_MeOH-Water_2_y_-30    <PATH1>/monomers_A                   08_MeOH-Water_2_y_-30.in     energy
                 08_MeOH-Water_2_y_+30    <PATH1>/monomers_A                   08_MeOH-Water_2_y_+30.in     energy
                 08_MeOH-Water_2_z_-30    <PATH1>/monomers_A                   08_MeOH-Water_2_z_-30.in     energy
                 08_MeOH-Water_2_z_+30    <PATH1>/monomers_A                   08_MeOH-Water_2_z_+30.in     energy
                 09_MeNH2-MeOH_1_y_-30    <PATH1>/monomers_A                   09_MeNH2-MeOH_1_y_-30.in     energy
                 09_MeNH2-MeOH_1_y_+30    <PATH1>/monomers_A                   09_MeNH2-MeOH_1_y_+30.in     energy
                 09_MeNH2-MeOH_1_z_-30    <PATH1>/monomers_A                   09_MeNH2-MeOH_1_z_-30.in     energy
                 09_MeNH2-MeOH_1_z_+30    <PATH1>/monomers_A                   09_MeNH2-MeOH_1_z_+30.in     energy
                 09_MeNH2-MeOH_2_y_-30    <PATH1>/monomers_A                   09_MeNH2-MeOH_2_y_-30.in     energy
                 09_MeNH2-MeOH_2_y_+30    <PATH1>/monomers_A                   09_MeNH2-MeOH_2_y_+30.in     energy
                 09_MeNH2-MeOH_2_z_-30    <PATH1>/monomers_A                   09_MeNH2-MeOH_2_z_-30.in     energy
                 09_MeNH2-MeOH_2_z_+30    <PATH1>/monomers_A                   09_MeNH2-MeOH_2_z_+30.in     energy
                10_MeNH2-MeNH2_1_y_-30    <PATH1>/monomers_A                  10_MeNH2-MeNH2_1_y_-30.in     energy
                10_MeNH2-MeNH2_1_y_+30    <PATH1>/monomers_A                  10_MeNH2-MeNH2_1_y_+30.in     energy
                10_MeNH2-MeNH2_1_z_-30    <PATH1>/monomers_A                  10_MeNH2-MeNH2_1_z_-30.in     energy
                10_MeNH2-MeNH2_1_z_+30    <PATH1>/monomers_A                  10_MeNH2-MeNH2_1_z_+30.in     energy
                10_MeNH2-MeNH2_2_y_-30    <PATH1>/monomers_A                  10_MeNH2-MeNH2_2_y_-30.in     energy
                10_MeNH2-MeNH2_2_y_+30    <PATH1>/monomers_A                  10_MeNH2-MeNH2_2_y_+30.in     energy
                10_MeNH2-MeNH2_2_z_-30    <PATH1>/monomers_A                  10_MeNH2-MeNH2_2_z_-30.in     energy
                10_MeNH2-MeNH2_2_z_+30    <PATH1>/monomers_A                  10_MeNH2-MeNH2_2_z_+30.in     energy
              11_MeNH2-Peptide_1_y_-30    <PATH1>/monomers_A                11_MeNH2-Peptide_1_y_-30.in     energy
              11_MeNH2-Peptide_1_y_+30    <PATH1>/monomers_A                11_MeNH2-Peptide_1_y_+30.in     energy
              11_MeNH2-Peptide_1_z_-30    <PATH1>/monomers_A                11_MeNH2-Peptide_1_z_-30.in     energy
              11_MeNH2-Peptide_1_z_+30    <PATH1>/monomers_A                11_MeNH2-Peptide_1_z_+30.in     energy
              11_MeNH2-Peptide_2_y_-30    <PATH1>/monomers_A                11_MeNH2-Peptide_2_y_-30.in     energy
              11_MeNH2-Peptide_2_y_+30    <PATH1>/monomers_A                11_MeNH2-Peptide_2_y_+30.in     energy
              11_MeNH2-Peptide_2_z_-30    <PATH1>/monomers_A                11_MeNH2-Peptide_2_z_-30.in     energy
              11_MeNH2-Peptide_2_z_+30    <PATH1>/monomers_A                11_MeNH2-Peptide_2_z_+30.in     energy
                12_MeNH2-Water_1_y_-30    <PATH1>/monomers_A                  12_MeNH2-Water_1_y_-30.in     energy
                12_MeNH2-Water_1_y_+30    <PATH1>/monomers_A                  12_MeNH2-Water_1_y_+30.in     energy
                12_MeNH2-Water_1_z_-30    <PATH1>/monomers_A                  12_MeNH2-Water_1_z_-30.in     energy
                12_MeNH2-Water_1_z_+30    <PATH1>/monomers_A                  12_MeNH2-Water_1_z_+30.in     energy
                12_MeNH2-Water_2_y_-30    <PATH1>/monomers_A                  12_MeNH2-Water_2_y_-30.in     energy
                12_MeNH2-Water_2_y_+30    <PATH1>/monomers_A                  12_MeNH2-Water_2_y_+30.in     energy
                12_MeNH2-Water_2_z_-30    <PATH1>/monomers_A                  12_MeNH2-Water_2_z_-30.in     energy
                12_MeNH2-Water_2_z_+30    <PATH1>/monomers_A                  12_MeNH2-Water_2_z_+30.in     energy
               13_Peptide-MeOH_1_y_-30    <PATH1>/monomers_A                 13_Peptide-MeOH_1_y_-30.in     energy
               13_Peptide-MeOH_1_y_+30    <PATH1>/monomers_A                 13_Peptide-MeOH_1_y_+30.in     energy
               13_Peptide-MeOH_1_z_-30    <PATH1>/monomers_A                 13_Peptide-MeOH_1_z_-30.in     energy
               13_Peptide-MeOH_1_z_+30    <PATH1>/monomers_A                 13_Peptide-MeOH_1_z_+30.in     energy
               13_Peptide-MeOH_2_y_-30    <PATH1>/monomers_A                 13_Peptide-MeOH_2_y_-30.in     energy
               13_Peptide-MeOH_2_y_+30    <PATH1>/monomers_A                 13_Peptide-MeOH_2_y_+30.in     energy
               13_Peptide-MeOH_2_z_-30    <PATH1>/monomers_A                 13_Peptide-MeOH_2_z_-30.in     energy
               13_Peptide-MeOH_2_z_+30    <PATH1>/monomers_A                 13_Peptide-MeOH_2_z_+30.in     energy
              14_Peptide-MeNH2_1_y_-30    <PATH1>/monomers_A                14_Peptide-MeNH2_1_y_-30.in     energy
              14_Peptide-MeNH2_1_y_+30    <PATH1>/monomers_A                14_Peptide-MeNH2_1_y_+30.in     energy
              14_Peptide-MeNH2_1_z_-30    <PATH1>/monomers_A                14_Peptide-MeNH2_1_z_-30.in     energy
              14_Peptide-MeNH2_1_z_+30    <PATH1>/monomers_A                14_Peptide-MeNH2_1_z_+30.in     energy
              14_Peptide-MeNH2_2_y_-30    <PATH1>/monomers_A                14_Peptide-MeNH2_2_y_-30.in     energy
              14_Peptide-MeNH2_2_y_+30    <PATH1>/monomers_A                14_Peptide-MeNH2_2_y_+30.in     energy
              14_Peptide-MeNH2_2_z_-30    <PATH1>/monomers_A                14_Peptide-MeNH2_2_z_-30.in     energy
              14_Peptide-MeNH2_2_z_+30    <PATH1>/monomers_A                14_Peptide-MeNH2_2_z_+30.in     energy
            15_Peptide-Peptide_1_y_-30    <PATH1>/monomers_A              15_Peptide-Peptide_1_y_-30.in     energy
            15_Peptide-Peptide_1_y_+30    <PATH1>/monomers_A              15_Peptide-Peptide_1_y_+30.in     energy
            15_Peptide-Peptide_1_z_-30    <PATH1>/monomers_A              15_Peptide-Peptide_1_z_-30.in     energy
            15_Peptide-Peptide_1_z_+30    <PATH1>/monomers_A              15_Peptide-Peptide_1_z_+30.in     energy
            15_Peptide-Peptide_2_y_-30    <PATH1>/monomers_A              15_Peptide-Peptide_2_y_-30.in     energy
            15_Peptide-Peptide_2_y_+30    <PATH1>/monomers_A              15_Peptide-Peptide_2_y_+30.in     energy
            15_Peptide-Peptide_2_z_-30    <PATH1>/monomers_A              15_Peptide-Peptide_2_z_-30.in     energy
            15_Peptide-Peptide_2_z_+30    <PATH1>/monomers_A              15_Peptide-Peptide_2_z_+30.in     energy
              16_Peptide-Water_1_y_-30    <PATH1>/monomers_A                16_Peptide-Water_1_y_-30.in     energy
              16_Peptide-Water_1_y_+30    <PATH1>/monomers_A                16_Peptide-Water_1_y_+30.in     energy
              16_Peptide-Water_1_z_-30    <PATH1>/monomers_A                16_Peptide-Water_1_z_-30.in     energy
              16_Peptide-Water_1_z_+30    <PATH1>/monomers_A                16_Peptide-Water_1_z_+30.in     energy
              16_Peptide-Water_2_y_-30    <PATH1>/monomers_A                16_Peptide-Water_2_y_-30.in     energy
              16_Peptide-Water_2_y_+30    <PATH1>/monomers_A                16_Peptide-Water_2_y_+30.in     energy
              16_Peptide-Water_2_z_-30    <PATH1>/monomers_A                16_Peptide-Water_2_z_-30.in     energy
              16_Peptide-Water_2_z_+30    <PATH1>/monomers_A                16_Peptide-Water_2_z_+30.in     energy
           17_Uracil-Uracil_BP_1_y_-30    <PATH1>/monomers_A             17_Uracil-Uracil_BP_1_y_-30.in     energy
           17_Uracil-Uracil_BP_1_y_+30    <PATH1>/monomers_A             17_Uracil-Uracil_BP_1_y_+30.in     energy
           17_Uracil-Uracil_BP_1_z_-30    <PATH1>/monomers_A             17_Uracil-Uracil_BP_1_z_-30.in     energy
           17_Uracil-Uracil_BP_1_z_+30    <PATH1>/monomers_A             17_Uracil-Uracil_BP_1_z_+30.in     energy
           17_Uracil-Uracil_BP_2_y_-30    <PATH1>/monomers_A             17_Uracil-Uracil_BP_2_y_-30.in     energy
           17_Uracil-Uracil_BP_2_y_+30    <PATH1>/monomers_A             17_Uracil-Uracil_BP_2_y_+30.in     energy
           17_Uracil-Uracil_BP_2_z_-30    <PATH1>/monomers_A             17_Uracil-Uracil_BP_2_z_-30.in     energy
           17_Uracil-Uracil_BP_2_z_+30    <PATH1>/monomers_A             17_Uracil-Uracil_BP_2_z_+30.in     energy
             18_Water-Pyridine_1_y_-30    <PATH1>/monomers_A               18_Water-Pyridine_1_y_-30.in     energy
             18_Water-Pyridine_1_y_+30    <PATH1>/monomers_A               18_Water-Pyridine_1_y_+30.in     energy
             18_Water-Pyridine_1_z_-30    <PATH1>/monomers_A               18_Water-Pyridine_1_z_-30.in     energy
             18_Water-Pyridine_1_z_+30    <PATH1>/monomers_A               18_Water-Pyridine_1_z_+30.in     energy
             18_Water-Pyridine_2_y_-30    <PATH1>/monomers_A               18_Water-Pyridine_2_y_-30.in     energy
             18_Water-Pyridine_2_y_+30    <PATH1>/monomers_A               18_Water-Pyridine_2_y_+30.in     energy
             18_Water-Pyridine_2_z_-30    <PATH1>/monomers_A               18_Water-Pyridine_2_z_-30.in     energy
             18_Water-Pyridine_2_z_+30    <PATH1>/monomers_A               18_Water-Pyridine_2_z_+30.in     energy
              19_MeOH-Pyridine_1_y_-30    <PATH1>/monomers_A                19_MeOH-Pyridine_1_y_-30.in     energy
              19_MeOH-Pyridine_1_y_+30    <PATH1>/monomers_A                19_MeOH-Pyridine_1_y_+30.in     energy
              19_MeOH-Pyridine_1_z_-30    <PATH1>/monomers_A                19_MeOH-Pyridine_1_z_-30.in     energy
              19_MeOH-Pyridine_1_z_+30    <PATH1>/monomers_A                19_MeOH-Pyridine_1_z_+30.in     energy
              19_MeOH-Pyridine_2_y_-30    <PATH1>/monomers_A                19_MeOH-Pyridine_2_y_-30.in     energy
              19_MeOH-Pyridine_2_y_+30    <PATH1>/monomers_A                19_MeOH-Pyridine_2_y_+30.in     energy
              19_MeOH-Pyridine_2_z_-30    <PATH1>/monomers_A                19_MeOH-Pyridine_2_z_-30.in     energy
              19_MeOH-Pyridine_2_z_+30    <PATH1>/monomers_A                19_MeOH-Pyridine_2_z_+30.in     energy
                  20_AcOH-AcOH_1_y_-30    <PATH1>/monomers_A                    20_AcOH-AcOH_1_y_-30.in     energy
                  20_AcOH-AcOH_1_y_+30    <PATH1>/monomers_A                    20_AcOH-AcOH_1_y_+30.in     energy
                  20_AcOH-AcOH_1_z_-30    <PATH1>/monomers_A                    20_AcOH-AcOH_1_z_-30.in     energy
                  20_AcOH-AcOH_1_z_+30    <PATH1>/monomers_A                    20_AcOH-AcOH_1_z_+30.in     energy
                  20_AcOH-AcOH_2_y_-30    <PATH1>/monomers_A                    20_AcOH-AcOH_2_y_-30.in     energy
                  20_AcOH-AcOH_2_y_+30    <PATH1>/monomers_A                    20_AcOH-AcOH_2_y_+30.in     energy
                  20_AcOH-AcOH_2_z_-30    <PATH1>/monomers_A                    20_AcOH-AcOH_2_z_-30.in     energy
                  20_AcOH-AcOH_2_z_+30    <PATH1>/monomers_A                    20_AcOH-AcOH_2_z_+30.in     energy
                21_AcNH2-AcNH2_1_y_-30    <PATH1>/monomers_A                  21_AcNH2-AcNH2_1_y_-30.in     energy
                21_AcNH2-AcNH2_1_y_+30    <PATH1>/monomers_A                  21_AcNH2-AcNH2_1_y_+30.in     energy
                21_AcNH2-AcNH2_1_z_-30    <PATH1>/monomers_A                  21_AcNH2-AcNH2_1_z_-30.in     energy
                21_AcNH2-AcNH2_1_z_+30    <PATH1>/monomers_A                  21_AcNH2-AcNH2_1_z_+30.in     energy
                21_AcNH2-AcNH2_2_y_-30    <PATH1>/monomers_A                  21_AcNH2-AcNH2_2_y_-30.in     energy
                21_AcNH2-AcNH2_2_y_+30    <PATH1>/monomers_A                  21_AcNH2-AcNH2_2_y_+30.in     energy
                21_AcNH2-AcNH2_2_z_-30    <PATH1>/monomers_A                  21_AcNH2-AcNH2_2_z_-30.in     energy
                21_AcNH2-AcNH2_2_z_+30    <PATH1>/monomers_A                  21_AcNH2-AcNH2_2_z_+30.in     energy
                22_AcOH-Uracil_1_y_-30    <PATH1>/monomers_A                  22_AcOH-Uracil_1_y_-30.in     energy
                22_AcOH-Uracil_1_y_+30    <PATH1>/monomers_A                  22_AcOH-Uracil_1_y_+30.in     energy
                22_AcOH-Uracil_1_z_-30    <PATH1>/monomers_A                  22_AcOH-Uracil_1_z_-30.in     energy
                22_AcOH-Uracil_1_z_+30    <PATH1>/monomers_A                  22_AcOH-Uracil_1_z_+30.in     energy
                22_AcOH-Uracil_2_y_-30    <PATH1>/monomers_A                  22_AcOH-Uracil_2_y_-30.in     energy
                22_AcOH-Uracil_2_y_+30    <PATH1>/monomers_A                  22_AcOH-Uracil_2_y_+30.in     energy
                22_AcOH-Uracil_2_z_-30    <PATH1>/monomers_A                  22_AcOH-Uracil_2_z_-30.in     energy
                22_AcOH-Uracil_2_z_+30    <PATH1>/monomers_A                  22_AcOH-Uracil_2_z_+30.in     energy
               23_AcNH2-Uracil_1_y_-30    <PATH1>/monomers_A                 23_AcNH2-Uracil_1_y_-30.in     energy
               23_AcNH2-Uracil_1_y_+30    <PATH1>/monomers_A                 23_AcNH2-Uracil_1_y_+30.in     energy
               23_AcNH2-Uracil_1_z_-30    <PATH1>/monomers_A                 23_AcNH2-Uracil_1_z_-30.in     energy
               23_AcNH2-Uracil_1_z_+30    <PATH1>/monomers_A                 23_AcNH2-Uracil_1_z_+30.in     energy
               23_AcNH2-Uracil_2_y_-30    <PATH1>/monomers_A                 23_AcNH2-Uracil_2_y_-30.in     energy
               23_AcNH2-Uracil_2_y_+30    <PATH1>/monomers_A                 23_AcNH2-Uracil_2_y_+30.in     energy
               23_AcNH2-Uracil_2_z_-30    <PATH1>/monomers_A                 23_AcNH2-Uracil_2_z_-30.in     energy
               23_AcNH2-Uracil_2_z_+30    <PATH1>/monomers_A                 23_AcNH2-Uracil_2_z_+30.in     energy
      24_Benzene-Benzene_pi-pi_1_y_-30    <PATH1>/monomers_A        24_Benzene-Benzene_pi-pi_1_y_-30.in     energy
      24_Benzene-Benzene_pi-pi_1_y_+30    <PATH1>/monomers_A        24_Benzene-Benzene_pi-pi_1_y_+30.in     energy
      24_Benzene-Benzene_pi-pi_1_z_-30    <PATH1>/monomers_A        24_Benzene-Benzene_pi-pi_1_z_-30.in     energy
      24_Benzene-Benzene_pi-pi_1_z_+30    <PATH1>/monomers_A        24_Benzene-Benzene_pi-pi_1_z_+30.in     energy
      24_Benzene-Benzene_pi-pi_2_y_-30    <PATH1>/monomers_A        24_Benzene-Benzene_pi-pi_2_y_-30.in     energy
      24_Benzene-Benzene_pi-pi_2_y_+30    <PATH1>/monomers_A        24_Benzene-Benzene_pi-pi_2_y_+30.in     energy
      24_Benzene-Benzene_pi-pi_2_z_-30    <PATH1>/monomers_A        24_Benzene-Benzene_pi-pi_2_z_-30.in     energy
      24_Benzene-Benzene_pi-pi_2_z_+30    <PATH1>/monomers_A        24_Benzene-Benzene_pi-pi_2_z_+30.in     energy
    25_Pyridine-Pyridine_pi-pi_1_y_-30    <PATH1>/monomers_A      25_Pyridine-Pyridine_pi-pi_1_y_-30.in     energy
    25_Pyridine-Pyridine_pi-pi_1_y_+30    <PATH1>/monomers_A      25_Pyridine-Pyridine_pi-pi_1_y_+30.in     energy
    25_Pyridine-Pyridine_pi-pi_1_z_-30    <PATH1>/monomers_A      25_Pyridine-Pyridine_pi-pi_1_z_-30.in     energy
    25_Pyridine-Pyridine_pi-pi_1_z_+30    <PATH1>/monomers_A      25_Pyridine-Pyridine_pi-pi_1_z_+30.in     energy
    25_Pyridine-Pyridine_pi-pi_2_y_-30    <PATH1>/monomers_A      25_Pyridine-Pyridine_pi-pi_2_y_-30.in     energy
    25_Pyridine-Pyridine_pi-pi_2_y_+30    <PATH1>/monomers_A      25_Pyridine-Pyridine_pi-pi_2_y_+30.in     energy
    25_Pyridine-Pyridine_pi-pi_2_z_-30    <PATH1>/monomers_A      25_Pyridine-Pyridine_pi-pi_2_z_-30.in     energy
    25_Pyridine-Pyridine_pi-pi_2_z_+30    <PATH1>/monomers_A      25_Pyridine-Pyridine_pi-pi_2_z_+30.in     energy
        26_Uracil-Uracil_pi-pi_1_y_-30    <PATH1>/monomers_A          26_Uracil-Uracil_pi-pi_1_y_-30.in     energy
        26_Uracil-Uracil_pi-pi_1_y_+30    <PATH1>/monomers_A          26_Uracil-Uracil_pi-pi_1_y_+30.in     energy
        26_Uracil-Uracil_pi-pi_1_z_-30    <PATH1>/monomers_A          26_Uracil-Uracil_pi-pi_1_z_-30.in     energy
        26_Uracil-Uracil_pi-pi_1_z_+30    <PATH1>/monomers_A          26_Uracil-Uracil_pi-pi_1_z_+30.in     energy
        26_Uracil-Uracil_pi-pi_2_y_-30    <PATH1>/monomers_A          26_Uracil-Uracil_pi-pi_2_y_-30.in     energy
        26_Uracil-Uracil_pi-pi_2_y_+30    <PATH1>/monomers_A          26_Uracil-Uracil_pi-pi_2_y_+30.in     energy
        26_Uracil-Uracil_pi-pi_2_z_-30    <PATH1>/monomers_A          26_Uracil-Uracil_pi-pi_2_z_-30.in     energy
        26_Uracil-Uracil_pi-pi_2_z_+30    <PATH1>/monomers_A          26_Uracil-Uracil_pi-pi_2_z_+30.in     energy
     27_Benzene-Pyridine_pi-pi_1_y_-30    <PATH1>/monomers_A       27_Benzene-Pyridine_pi-pi_1_y_-30.in     energy
     27_Benzene-Pyridine_pi-pi_1_y_+30    <PATH1>/monomers_A       27_Benzene-Pyridine_pi-pi_1_y_+30.in     energy
     27_Benzene-Pyridine_pi-pi_1_z_-30    <PATH1>/monomers_A       27_Benzene-Pyridine_pi-pi_1_z_-30.in     energy
     27_Benzene-Pyridine_pi-pi_1_z_+30    <PATH1>/monomers_A       27_Benzene-Pyridine_pi-pi_1_z_+30.in     energy
     27_Benzene-Pyridine_pi-pi_2_y_-30    <PATH1>/monomers_A       27_Benzene-Pyridine_pi-pi_2_y_-30.in     energy
     27_Benzene-Pyridine_pi-pi_2_y_+30    <PATH1>/monomers_A       27_Benzene-Pyridine_pi-pi_2_y_+30.in     energy
     27_Benzene-Pyridine_pi-pi_2_z_-30    <PATH1>/monomers_A       27_Benzene-Pyridine_pi-pi_2_z_-30.in     energy
     27_Benzene-Pyridine_pi-pi_2_z_+30    <PATH1>/monomers_A       27_Benzene-Pyridine_pi-pi_2_z_+30.in     energy
       28_Benzene-Uracil_pi-pi_1_y_-30    <PATH1>/monomers_A         28_Benzene-Uracil_pi-pi_1_y_-30.in     energy
       28_Benzene-Uracil_pi-pi_1_y_+30    <PATH1>/monomers_A         28_Benzene-Uracil_pi-pi_1_y_+30.in     energy
       28_Benzene-Uracil_pi-pi_1_z_-30    <PATH1>/monomers_A         28_Benzene-Uracil_pi-pi_1_z_-30.in     energy
       28_Benzene-Uracil_pi-pi_1_z_+30    <PATH1>/monomers_A         28_Benzene-Uracil_pi-pi_1_z_+30.in     energy
       28_Benzene-Uracil_pi-pi_2_y_-30    <PATH1>/monomers_A         28_Benzene-Uracil_pi-pi_2_y_-30.in     energy
       28_Benzene-Uracil_pi-pi_2_y_+30    <PATH1>/monomers_A         28_Benzene-Uracil_pi-pi_2_y_+30.in     energy
       28_Benzene-Uracil_pi-pi_2_z_-30    <PATH1>/monomers_A         28_Benzene-Uracil_pi-pi_2_z_-30.in     energy
       28_Benzene-Uracil_pi-pi_2_z_+30    <PATH1>/monomers_A         28_Benzene-Uracil_pi-pi_2_z_+30.in     energy
      29_Pyridine-Uracil_pi-pi_1_y_-30    <PATH1>/monomers_A        29_Pyridine-Uracil_pi-pi_1_y_-30.in     energy
      29_Pyridine-Uracil_pi-pi_1_y_+30    <PATH1>/monomers_A        29_Pyridine-Uracil_pi-pi_1_y_+30.in     energy
      29_Pyridine-Uracil_pi-pi_1_z_-30    <PATH1>/monomers_A        29_Pyridine-Uracil_pi-pi_1_z_-30.in     energy
      29_Pyridine-Uracil_pi-pi_1_z_+30    <PATH1>/monomers_A        29_Pyridine-Uracil_pi-pi_1_z_+30.in     energy
      29_Pyridine-Uracil_pi-pi_2_y_-30    <PATH1>/monomers_A        29_Pyridine-Uracil_pi-pi_2_y_-30.in     energy
      29_Pyridine-Uracil_pi-pi_2_y_+30    <PATH1>/monomers_A        29_Pyridine-Uracil_pi-pi_2_y_+30.in     energy
      29_Pyridine-Uracil_pi-pi_2_z_-30    <PATH1>/monomers_A        29_Pyridine-Uracil_pi-pi_2_z_-30.in     energy
      29_Pyridine-Uracil_pi-pi_2_z_+30    <PATH1>/monomers_A        29_Pyridine-Uracil_pi-pi_2_z_+30.in     energy
             30_Benzene-Ethene_1_y_-30    <PATH1>/monomers_A               30_Benzene-Ethene_1_y_-30.in     energy
             30_Benzene-Ethene_1_y_+30    <PATH1>/monomers_A               30_Benzene-Ethene_1_y_+30.in     energy
             30_Benzene-Ethene_1_z_-30    <PATH1>/monomers_A               30_Benzene-Ethene_1_z_-30.in     energy
             30_Benzene-Ethene_1_z_+30    <PATH1>/monomers_A               30_Benzene-Ethene_1_z_+30.in     energy
             30_Benzene-Ethene_2_y_-30    <PATH1>/monomers_A               30_Benzene-Ethene_2_y_-30.in     energy
             30_Benzene-Ethene_2_y_+30    <PATH1>/monomers_A               30_Benzene-Ethene_2_y_+30.in     energy
             30_Benzene-Ethene_2_z_-30    <PATH1>/monomers_A               30_Benzene-Ethene_2_z_-30.in     energy
             30_Benzene-Ethene_2_z_+30    <PATH1>/monomers_A               30_Benzene-Ethene_2_z_+30.in     energy
              31_Uracil-Ethene_1_y_-30    <PATH1>/monomers_A                31_Uracil-Ethene_1_y_-30.in     energy
              31_Uracil-Ethene_1_y_+30    <PATH1>/monomers_A                31_Uracil-Ethene_1_y_+30.in     energy
              31_Uracil-Ethene_1_z_-30    <PATH1>/monomers_A                31_Uracil-Ethene_1_z_-30.in     energy
              31_Uracil-Ethene_1_z_+30    <PATH1>/monomers_A                31_Uracil-Ethene_1_z_+30.in     energy
              31_Uracil-Ethene_2_y_-30    <PATH1>/monomers_A                31_Uracil-Ethene_2_y_-30.in     energy
              31_Uracil-Ethene_2_y_+30    <PATH1>/monomers_A                31_Uracil-Ethene_2_y_+30.in     energy
              31_Uracil-Ethene_2_z_-30    <PATH1>/monomers_A                31_Uracil-Ethene_2_z_-30.in     energy
              31_Uracil-Ethene_2_z_+30    <PATH1>/monomers_A                31_Uracil-Ethene_2_z_+30.in     energy
              32_Uracil-Ethyne_1_y_-30    <PATH1>/monomers_A                32_Uracil-Ethyne_1_y_-30.in     energy
              32_Uracil-Ethyne_1_y_+30    <PATH1>/monomers_A                32_Uracil-Ethyne_1_y_+30.in     energy
              32_Uracil-Ethyne_1_z_-30    <PATH1>/monomers_A                32_Uracil-Ethyne_1_z_-30.in     energy
              32_Uracil-Ethyne_1_z_+30    <PATH1>/monomers_A                32_Uracil-Ethyne_1_z_+30.in     energy
              32_Uracil-Ethyne_2_y_-30    <PATH1>/monomers_A                32_Uracil-Ethyne_2_y_-30.in     energy
              32_Uracil-Ethyne_2_y_+30    <PATH1>/monomers_A                32_Uracil-Ethyne_2_y_+30.in     energy
              32_Uracil-Ethyne_2_z_-30    <PATH1>/monomers_A                32_Uracil-Ethyne_2_z_-30.in     energy
              32_Uracil-Ethyne_2_z_+30    <PATH1>/monomers_A                32_Uracil-Ethyne_2_z_+30.in     energy
            33_Pyridine-Ethene_1_y_-30    <PATH1>/monomers_A              33_Pyridine-Ethene_1_y_-30.in     energy
            33_Pyridine-Ethene_1_y_+30    <PATH1>/monomers_A              33_Pyridine-Ethene_1_y_+30.in     energy
            33_Pyridine-Ethene_1_z_-30    <PATH1>/monomers_A              33_Pyridine-Ethene_1_z_-30.in     energy
            33_Pyridine-Ethene_1_z_+30    <PATH1>/monomers_A              33_Pyridine-Ethene_1_z_+30.in     energy
            33_Pyridine-Ethene_2_y_-30    <PATH1>/monomers_A              33_Pyridine-Ethene_2_y_-30.in     energy
            33_Pyridine-Ethene_2_y_+30    <PATH1>/monomers_A              33_Pyridine-Ethene_2_y_+30.in     energy
            33_Pyridine-Ethene_2_z_-30    <PATH1>/monomers_A              33_Pyridine-Ethene_2_z_-30.in     energy
            33_Pyridine-Ethene_2_z_+30    <PATH1>/monomers_A              33_Pyridine-Ethene_2_z_+30.in     energy
            34_Pentane-Pentane_1_y_-30    <PATH1>/monomers_A              34_Pentane-Pentane_1_y_-30.in     energy
            34_Pentane-Pentane_1_y_+30    <PATH1>/monomers_A              34_Pentane-Pentane_1_y_+30.in     energy
            34_Pentane-Pentane_1_z_-30    <PATH1>/monomers_A              34_Pentane-Pentane_1_z_-30.in     energy
            34_Pentane-Pentane_1_z_+30    <PATH1>/monomers_A              34_Pentane-Pentane_1_z_+30.in     energy
            34_Pentane-Pentane_2_y_-30    <PATH1>/monomers_A              34_Pentane-Pentane_2_y_-30.in     energy
            34_Pentane-Pentane_2_y_+30    <PATH1>/monomers_A              34_Pentane-Pentane_2_y_+30.in     energy
            34_Pentane-Pentane_2_z_-30    <PATH1>/monomers_A              34_Pentane-Pentane_2_z_-30.in     energy
            34_Pentane-Pentane_2_z_+30    <PATH1>/monomers_A              34_Pentane-Pentane_2_z_+30.in     energy
         35_Neopentane-Pentane_1_y_-30    <PATH1>/monomers_A           35_Neopentane-Pentane_1_y_-30.in     energy
         35_Neopentane-Pentane_1_y_+30    <PATH1>/monomers_A           35_Neopentane-Pentane_1_y_+30.in     energy
         35_Neopentane-Pentane_1_z_-30    <PATH1>/monomers_A           35_Neopentane-Pentane_1_z_-30.in     energy
         35_Neopentane-Pentane_1_z_+30    <PATH1>/monomers_A           35_Neopentane-Pentane_1_z_+30.in     energy
         35_Neopentane-Pentane_2_y_-30    <PATH1>/monomers_A           35_Neopentane-Pentane_2_y_-30.in     energy
         35_Neopentane-Pentane_2_y_+30    <PATH1>/monomers_A           35_Neopentane-Pentane_2_y_+30.in     energy
         35_Neopentane-Pentane_2_z_-30    <PATH1>/monomers_A           35_Neopentane-Pentane_2_z_-30.in     energy
         35_Neopentane-Pentane_2_z_+30    <PATH1>/monomers_A           35_Neopentane-Pentane_2_z_+30.in     energy
      36_Neopentane-Neopentane_1_y_-30    <PATH1>/monomers_A        36_Neopentane-Neopentane_1_y_-30.in     energy
      36_Neopentane-Neopentane_1_y_+30    <PATH1>/monomers_A        36_Neopentane-Neopentane_1_y_+30.in     energy
      36_Neopentane-Neopentane_1_z_-30    <PATH1>/monomers_A        36_Neopentane-Neopentane_1_z_-30.in     energy
      36_Neopentane-Neopentane_1_z_+30    <PATH1>/monomers_A        36_Neopentane-Neopentane_1_z_+30.in     energy
      36_Neopentane-Neopentane_2_y_-30    <PATH1>/monomers_A        36_Neopentane-Neopentane_2_y_-30.in     energy
      36_Neopentane-Neopentane_2_y_+30    <PATH1>/monomers_A        36_Neopentane-Neopentane_2_y_+30.in     energy
      36_Neopentane-Neopentane_2_z_-30    <PATH1>/monomers_A        36_Neopentane-Neopentane_2_z_-30.in     energy
      36_Neopentane-Neopentane_2_z_+30    <PATH1>/monomers_A        36_Neopentane-Neopentane_2_z_+30.in     energy
    37_Cyclopentane-Neopentane_1_y_-30    <PATH1>/monomers_A      37_Cyclopentane-Neopentane_1_y_-30.in     energy
    37_Cyclopentane-Neopentane_1_y_+30    <PATH1>/monomers_A      37_Cyclopentane-Neopentane_1_y_+30.in     energy
    37_Cyclopentane-Neopentane_1_z_-30    <PATH1>/monomers_A      37_Cyclopentane-Neopentane_1_z_-30.in     energy
    37_Cyclopentane-Neopentane_1_z_+30    <PATH1>/monomers_A      37_Cyclopentane-Neopentane_1_z_+30.in     energy
    37_Cyclopentane-Neopentane_2_y_-30    <PATH1>/monomers_A      37_Cyclopentane-Neopentane_2_y_-30.in     energy
    37_Cyclopentane-Neopentane_2_y_+30    <PATH1>/monomers_A      37_Cyclopentane-Neopentane_2_y_+30.in     energy
    37_Cyclopentane-Neopentane_2_z_-30    <PATH1>/monomers_A      37_Cyclopentane-Neopentane_2_z_-30.in     energy
    37_Cyclopentane-Neopentane_2_z_+30    <PATH1>/monomers_A      37_Cyclopentane-Neopentane_2_z_+30.in     energy
  38_Cyclopentane-Cyclopentane_1_y_-30    <PATH1>/monomers_A    38_Cyclopentane-Cyclopentane_1_y_-30.in     energy
  38_Cyclopentane-Cyclopentane_1_y_+30    <PATH1>/monomers_A    38_Cyclopentane-Cyclopentane_1_y_+30.in     energy
  38_Cyclopentane-Cyclopentane_1_z_-30    <PATH1>/monomers_A    38_Cyclopentane-Cyclopentane_1_z_-30.in     energy
  38_Cyclopentane-Cyclopentane_1_z_+30    <PATH1>/monomers_A    38_Cyclopentane-Cyclopentane_1_z_+30.in     energy
  38_Cyclopentane-Cyclopentane_2_y_-30    <PATH1>/monomers_A    38_Cyclopentane-Cyclopentane_2_y_-30.in     energy
  38_Cyclopentane-Cyclopentane_2_y_+30    <PATH1>/monomers_A    38_Cyclopentane-Cyclopentane_2_y_+30.in     energy
  38_Cyclopentane-Cyclopentane_2_z_-30    <PATH1>/monomers_A    38_Cyclopentane-Cyclopentane_2_z_-30.in     energy
  38_Cyclopentane-Cyclopentane_2_z_+30    <PATH1>/monomers_A    38_Cyclopentane-Cyclopentane_2_z_+30.in     energy
       39_Benzene-Cyclopentane_1_y_-30    <PATH1>/monomers_A         39_Benzene-Cyclopentane_1_y_-30.in     energy
       39_Benzene-Cyclopentane_1_y_+30    <PATH1>/monomers_A         39_Benzene-Cyclopentane_1_y_+30.in     energy
       39_Benzene-Cyclopentane_1_z_-30    <PATH1>/monomers_A         39_Benzene-Cyclopentane_1_z_-30.in     energy
       39_Benzene-Cyclopentane_1_z_+30    <PATH1>/monomers_A         39_Benzene-Cyclopentane_1_z_+30.in     energy
       39_Benzene-Cyclopentane_2_y_-30    <PATH1>/monomers_A         39_Benzene-Cyclopentane_2_y_-30.in     energy
       39_Benzene-Cyclopentane_2_y_+30    <PATH1>/monomers_A         39_Benzene-Cyclopentane_2_y_+30.in     energy
       39_Benzene-Cyclopentane_2_z_-30    <PATH1>/monomers_A         39_Benzene-Cyclopentane_2_z_-30.in     energy
       39_Benzene-Cyclopentane_2_z_+30    <PATH1>/monomers_A         39_Benzene-Cyclopentane_2_z_+30.in     energy
         40_Benzene-Neopentane_1_y_-30    <PATH1>/monomers_A           40_Benzene-Neopentane_1_y_-30.in     energy
         40_Benzene-Neopentane_1_y_+30    <PATH1>/monomers_A           40_Benzene-Neopentane_1_y_+30.in     energy
         40_Benzene-Neopentane_1_z_-30    <PATH1>/monomers_A           40_Benzene-Neopentane_1_z_-30.in     energy
         40_Benzene-Neopentane_1_z_+30    <PATH1>/monomers_A           40_Benzene-Neopentane_1_z_+30.in     energy
         40_Benzene-Neopentane_2_y_-30    <PATH1>/monomers_A           40_Benzene-Neopentane_2_y_-30.in     energy
         40_Benzene-Neopentane_2_y_+30    <PATH1>/monomers_A           40_Benzene-Neopentane_2_y_+30.in     energy
         40_Benzene-Neopentane_2_z_-30    <PATH1>/monomers_A           40_Benzene-Neopentane_2_z_-30.in     energy
         40_Benzene-Neopentane_2_z_+30    <PATH1>/monomers_A           40_Benzene-Neopentane_2_z_+30.in     energy
             41_Uracil-Pentane_1_y_-30    <PATH1>/monomers_A               41_Uracil-Pentane_1_y_-30.in     energy
             41_Uracil-Pentane_1_y_+30    <PATH1>/monomers_A               41_Uracil-Pentane_1_y_+30.in     energy
             41_Uracil-Pentane_1_z_-30    <PATH1>/monomers_A               41_Uracil-Pentane_1_z_-30.in     energy
             41_Uracil-Pentane_1_z_+30    <PATH1>/monomers_A               41_Uracil-Pentane_1_z_+30.in     energy
             41_Uracil-Pentane_2_y_-30    <PATH1>/monomers_A               41_Uracil-Pentane_2_y_-30.in     energy
             41_Uracil-Pentane_2_y_+30    <PATH1>/monomers_A               41_Uracil-Pentane_2_y_+30.in     energy
             41_Uracil-Pentane_2_z_-30    <PATH1>/monomers_A               41_Uracil-Pentane_2_z_-30.in     energy
             41_Uracil-Pentane_2_z_+30    <PATH1>/monomers_A               41_Uracil-Pentane_2_z_+30.in     energy
        42_Uracil-Cyclopentane_1_y_-30    <PATH1>/monomers_A          42_Uracil-Cyclopentane_1_y_-30.in     energy
        42_Uracil-Cyclopentane_1_y_+30    <PATH1>/monomers_A          42_Uracil-Cyclopentane_1_y_+30.in     energy
        42_Uracil-Cyclopentane_1_z_-30    <PATH1>/monomers_A          42_Uracil-Cyclopentane_1_z_-30.in     energy
        42_Uracil-Cyclopentane_1_z_+30    <PATH1>/monomers_A          42_Uracil-Cyclopentane_1_z_+30.in     energy
        42_Uracil-Cyclopentane_2_y_-30    <PATH1>/monomers_A          42_Uracil-Cyclopentane_2_y_-30.in     energy
        42_Uracil-Cyclopentane_2_y_+30    <PATH1>/monomers_A          42_Uracil-Cyclopentane_2_y_+30.in     energy
        42_Uracil-Cyclopentane_2_z_-30    <PATH1>/monomers_A          42_Uracil-Cyclopentane_2_z_-30.in     energy
        42_Uracil-Cyclopentane_2_z_+30    <PATH1>/monomers_A          42_Uracil-Cyclopentane_2_z_+30.in     energy
          43_Uracil-Neopentane_1_y_-30    <PATH1>/monomers_A            43_Uracil-Neopentane_1_y_-30.in     energy
          43_Uracil-Neopentane_1_y_+30    <PATH1>/monomers_A            43_Uracil-Neopentane_1_y_+30.in     energy
          43_Uracil-Neopentane_1_z_-30    <PATH1>/monomers_A            43_Uracil-Neopentane_1_z_-30.in     energy
          43_Uracil-Neopentane_1_z_+30    <PATH1>/monomers_A            43_Uracil-Neopentane_1_z_+30.in     energy
          43_Uracil-Neopentane_2_y_-30    <PATH1>/monomers_A            43_Uracil-Neopentane_2_y_-30.in     energy
          43_Uracil-Neopentane_2_y_+30    <PATH1>/monomers_A            43_Uracil-Neopentane_2_y_+30.in     energy
          43_Uracil-Neopentane_2_z_-30    <PATH1>/monomers_A            43_Uracil-Neopentane_2_z_-30.in     energy
          43_Uracil-Neopentane_2_z_+30    <PATH1>/monomers_A            43_Uracil-Neopentane_2_z_+30.in     energy
             44_Ethene-Pentane_1_y_-30    <PATH1>/monomers_A               44_Ethene-Pentane_1_y_-30.in     energy
             44_Ethene-Pentane_1_y_+30    <PATH1>/monomers_A               44_Ethene-Pentane_1_y_+30.in     energy
             44_Ethene-Pentane_1_z_-30    <PATH1>/monomers_A               44_Ethene-Pentane_1_z_-30.in     energy
             44_Ethene-Pentane_1_z_+30    <PATH1>/monomers_A               44_Ethene-Pentane_1_z_+30.in     energy
             44_Ethene-Pentane_2_y_-30    <PATH1>/monomers_A               44_Ethene-Pentane_2_y_-30.in     energy
             44_Ethene-Pentane_2_y_+30    <PATH1>/monomers_A               44_Ethene-Pentane_2_y_+30.in     energy
             44_Ethene-Pentane_2_z_-30    <PATH1>/monomers_A               44_Ethene-Pentane_2_z_-30.in     energy
             44_Ethene-Pentane_2_z_+30    <PATH1>/monomers_A               44_Ethene-Pentane_2_z_+30.in     energy
             45_Ethyne-Pentane_1_y_-30    <PATH1>/monomers_A               45_Ethyne-Pentane_1_y_-30.in     energy
             45_Ethyne-Pentane_1_y_+30    <PATH1>/monomers_A               45_Ethyne-Pentane_1_y_+30.in     energy
             45_Ethyne-Pentane_1_z_-30    <PATH1>/monomers_A               45_Ethyne-Pentane_1_z_-30.in     energy
             45_Ethyne-Pentane_1_z_+30    <PATH1>/monomers_A               45_Ethyne-Pentane_1_z_+30.in     energy
             45_Ethyne-Pentane_2_y_-30    <PATH1>/monomers_A               45_Ethyne-Pentane_2_y_-30.in     energy
             45_Ethyne-Pentane_2_y_+30    <PATH1>/monomers_A               45_Ethyne-Pentane_2_y_+30.in     energy
             45_Ethyne-Pentane_2_z_-30    <PATH1>/monomers_A               45_Ethyne-Pentane_2_z_-30.in     energy
             45_Ethyne-Pentane_2_z_+30    <PATH1>/monomers_A               45_Ethyne-Pentane_2_z_+30.in     energy
            46_Peptide-Pentane_1_y_-30    <PATH1>/monomers_A              46_Peptide-Pentane_1_y_-30.in     energy
            46_Peptide-Pentane_1_y_+30    <PATH1>/monomers_A              46_Peptide-Pentane_1_y_+30.in     energy
            46_Peptide-Pentane_1_z_-30    <PATH1>/monomers_A              46_Peptide-Pentane_1_z_-30.in     energy
            46_Peptide-Pentane_1_z_+30    <PATH1>/monomers_A              46_Peptide-Pentane_1_z_+30.in     energy
            46_Peptide-Pentane_2_y_-30    <PATH1>/monomers_A              46_Peptide-Pentane_2_y_-30.in     energy
            46_Peptide-Pentane_2_y_+30    <PATH1>/monomers_A              46_Peptide-Pentane_2_y_+30.in     energy
            46_Peptide-Pentane_2_z_-30    <PATH1>/monomers_A              46_Peptide-Pentane_2_z_-30.in     energy
            46_Peptide-Pentane_2_z_+30    <PATH1>/monomers_A              46_Peptide-Pentane_2_z_+30.in     energy
         47_Benzene-Benzene_TS_1_y_-30    <PATH1>/monomers_A           47_Benzene-Benzene_TS_1_y_-30.in     energy
         47_Benzene-Benzene_TS_1_y_+30    <PATH1>/monomers_A           47_Benzene-Benzene_TS_1_y_+30.in     energy
         47_Benzene-Benzene_TS_1_z_-30    <PATH1>/monomers_A           47_Benzene-Benzene_TS_1_z_-30.in     energy
         47_Benzene-Benzene_TS_1_z_+30    <PATH1>/monomers_A           47_Benzene-Benzene_TS_1_z_+30.in     energy
         47_Benzene-Benzene_TS_2_y_-30    <PATH1>/monomers_A           47_Benzene-Benzene_TS_2_y_-30.in     energy
         47_Benzene-Benzene_TS_2_y_+30    <PATH1>/monomers_A           47_Benzene-Benzene_TS_2_y_+30.in     energy
         47_Benzene-Benzene_TS_2_z_-30    <PATH1>/monomers_A           47_Benzene-Benzene_TS_2_z_-30.in     energy
         47_Benzene-Benzene_TS_2_z_+30    <PATH1>/monomers_A           47_Benzene-Benzene_TS_2_z_+30.in     energy
       48_Pyridine-Pyridine_TS_1_y_-30    <PATH1>/monomers_A         48_Pyridine-Pyridine_TS_1_y_-30.in     energy
       48_Pyridine-Pyridine_TS_1_y_+30    <PATH1>/monomers_A         48_Pyridine-Pyridine_TS_1_y_+30.in     energy
       48_Pyridine-Pyridine_TS_1_z_-30    <PATH1>/monomers_A         48_Pyridine-Pyridine_TS_1_z_-30.in     energy
       48_Pyridine-Pyridine_TS_1_z_+30    <PATH1>/monomers_A         48_Pyridine-Pyridine_TS_1_z_+30.in     energy
       48_Pyridine-Pyridine_TS_2_y_-30    <PATH1>/monomers_A         48_Pyridine-Pyridine_TS_2_y_-30.in     energy
       48_Pyridine-Pyridine_TS_2_y_+30    <PATH1>/monomers_A         48_Pyridine-Pyridine_TS_2_y_+30.in     energy
       48_Pyridine-Pyridine_TS_2_z_-30    <PATH1>/monomers_A         48_Pyridine-Pyridine_TS_2_z_-30.in     energy
       48_Pyridine-Pyridine_TS_2_z_+30    <PATH1>/monomers_A         48_Pyridine-Pyridine_TS_2_z_+30.in     energy
        49_Benzene-Pyridine_TS_1_y_-30    <PATH1>/monomers_A          49_Benzene-Pyridine_TS_1_y_-30.in     energy
        49_Benzene-Pyridine_TS_1_y_+30    <PATH1>/monomers_A          49_Benzene-Pyridine_TS_1_y_+30.in     energy
        49_Benzene-Pyridine_TS_1_z_-30    <PATH1>/monomers_A          49_Benzene-Pyridine_TS_1_z_-30.in     energy
        49_Benzene-Pyridine_TS_1_z_+30    <PATH1>/monomers_A          49_Benzene-Pyridine_TS_1_z_+30.in     energy
        49_Benzene-Pyridine_TS_2_y_-30    <PATH1>/monomers_A          49_Benzene-Pyridine_TS_2_y_-30.in     energy
        49_Benzene-Pyridine_TS_2_y_+30    <PATH1>/monomers_A          49_Benzene-Pyridine_TS_2_y_+30.in     energy
        49_Benzene-Pyridine_TS_2_z_-30    <PATH1>/monomers_A          49_Benzene-Pyridine_TS_2_z_-30.in     energy
        49_Benzene-Pyridine_TS_2_z_+30    <PATH1>/monomers_A          49_Benzene-Pyridine_TS_2_z_+30.in     energy
       50_Benzene-Ethyne_CH-pi_1_y_-30    <PATH1>/monomers_A         50_Benzene-Ethyne_CH-pi_1_y_-30.in     energy
       50_Benzene-Ethyne_CH-pi_1_y_+30    <PATH1>/monomers_A         50_Benzene-Ethyne_CH-pi_1_y_+30.in     energy
       50_Benzene-Ethyne_CH-pi_1_z_-30    <PATH1>/monomers_A         50_Benzene-Ethyne_CH-pi_1_z_-30.in     energy
       50_Benzene-Ethyne_CH-pi_1_z_+30    <PATH1>/monomers_A         50_Benzene-Ethyne_CH-pi_1_z_+30.in     energy
       50_Benzene-Ethyne_CH-pi_2_y_-30    <PATH1>/monomers_A         50_Benzene-Ethyne_CH-pi_2_y_-30.in     energy
       50_Benzene-Ethyne_CH-pi_2_y_+30    <PATH1>/monomers_A         50_Benzene-Ethyne_CH-pi_2_y_+30.in     energy
       50_Benzene-Ethyne_CH-pi_2_z_-30    <PATH1>/monomers_A         50_Benzene-Ethyne_CH-pi_2_z_-30.in     energy
       50_Benzene-Ethyne_CH-pi_2_z_+30    <PATH1>/monomers_A         50_Benzene-Ethyne_CH-pi_2_z_+30.in     energy
           51_Ethyne-Ethyne_TS_1_y_-30    <PATH1>/monomers_A             51_Ethyne-Ethyne_TS_1_y_-30.in     energy
           51_Ethyne-Ethyne_TS_1_y_+30    <PATH1>/monomers_A             51_Ethyne-Ethyne_TS_1_y_+30.in     energy
           51_Ethyne-Ethyne_TS_1_z_-30    <PATH1>/monomers_A             51_Ethyne-Ethyne_TS_1_z_-30.in     energy
           51_Ethyne-Ethyne_TS_1_z_+30    <PATH1>/monomers_A             51_Ethyne-Ethyne_TS_1_z_+30.in     energy
           51_Ethyne-Ethyne_TS_2_y_-30    <PATH1>/monomers_A             51_Ethyne-Ethyne_TS_2_y_-30.in     energy
           51_Ethyne-Ethyne_TS_2_y_+30    <PATH1>/monomers_A             51_Ethyne-Ethyne_TS_2_y_+30.in     energy
           51_Ethyne-Ethyne_TS_2_z_-30    <PATH1>/monomers_A             51_Ethyne-Ethyne_TS_2_z_-30.in     energy
           51_Ethyne-Ethyne_TS_2_z_+30    <PATH1>/monomers_A             51_Ethyne-Ethyne_TS_2_z_+30.in     energy
         52_Benzene-AcOH_OH-pi_1_y_-30    <PATH1>/monomers_A           52_Benzene-AcOH_OH-pi_1_y_-30.in     energy
         52_Benzene-AcOH_OH-pi_1_y_+30    <PATH1>/monomers_A           52_Benzene-AcOH_OH-pi_1_y_+30.in     energy
         52_Benzene-AcOH_OH-pi_1_z_-30    <PATH1>/monomers_A           52_Benzene-AcOH_OH-pi_1_z_-30.in     energy
         52_Benzene-AcOH_OH-pi_1_z_+30    <PATH1>/monomers_A           52_Benzene-AcOH_OH-pi_1_z_+30.in     energy
         52_Benzene-AcOH_OH-pi_2_y_-30    <PATH1>/monomers_A           52_Benzene-AcOH_OH-pi_2_y_-30.in     energy
         52_Benzene-AcOH_OH-pi_2_y_+30    <PATH1>/monomers_A           52_Benzene-AcOH_OH-pi_2_y_+30.in     energy
         52_Benzene-AcOH_OH-pi_2_z_-30    <PATH1>/monomers_A           52_Benzene-AcOH_OH-pi_2_z_-30.in     energy
         52_Benzene-AcOH_OH-pi_2_z_+30    <PATH1>/monomers_A           52_Benzene-AcOH_OH-pi_2_z_+30.in     energy
        53_Benzene-AcNH2_NH-pi_1_y_-30    <PATH1>/monomers_A          53_Benzene-AcNH2_NH-pi_1_y_-30.in     energy
        53_Benzene-AcNH2_NH-pi_1_y_+30    <PATH1>/monomers_A          53_Benzene-AcNH2_NH-pi_1_y_+30.in     energy
        53_Benzene-AcNH2_NH-pi_1_z_-30    <PATH1>/monomers_A          53_Benzene-AcNH2_NH-pi_1_z_-30.in     energy
        53_Benzene-AcNH2_NH-pi_1_z_+30    <PATH1>/monomers_A          53_Benzene-AcNH2_NH-pi_1_z_+30.in     energy
        53_Benzene-AcNH2_NH-pi_2_y_-30    <PATH1>/monomers_A          53_Benzene-AcNH2_NH-pi_2_y_-30.in     energy
        53_Benzene-AcNH2_NH-pi_2_y_+30    <PATH1>/monomers_A          53_Benzene-AcNH2_NH-pi_2_y_+30.in     energy
        53_Benzene-AcNH2_NH-pi_2_z_-30    <PATH1>/monomers_A          53_Benzene-AcNH2_NH-pi_2_z_-30.in     energy
        53_Benzene-AcNH2_NH-pi_2_z_+30    <PATH1>/monomers_A          53_Benzene-AcNH2_NH-pi_2_z_+30.in     energy
        54_Benzene-Water_OH-pi_1_y_-30    <PATH1>/monomers_A          54_Benzene-Water_OH-pi_1_y_-30.in     energy
        54_Benzene-Water_OH-pi_1_y_+30    <PATH1>/monomers_A          54_Benzene-Water_OH-pi_1_y_+30.in     energy
        54_Benzene-Water_OH-pi_1_z_-30    <PATH1>/monomers_A          54_Benzene-Water_OH-pi_1_z_-30.in     energy
        54_Benzene-Water_OH-pi_1_z_+30    <PATH1>/monomers_A          54_Benzene-Water_OH-pi_1_z_+30.in     energy
        54_Benzene-Water_OH-pi_2_y_-30    <PATH1>/monomers_A          54_Benzene-Water_OH-pi_2_y_-30.in     energy
        54_Benzene-Water_OH-pi_2_y_+30    <PATH1>/monomers_A          54_Benzene-Water_OH-pi_2_y_+30.in     energy
        54_Benzene-Water_OH-pi_2_z_-30    <PATH1>/monomers_A          54_Benzene-Water_OH-pi_2_z_-30.in     energy
        54_Benzene-Water_OH-pi_2_z_+30    <PATH1>/monomers_A          54_Benzene-Water_OH-pi_2_z_+30.in     energy
         55_Benzene-MeOH_OH-pi_1_y_-30    <PATH1>/monomers_A           55_Benzene-MeOH_OH-pi_1_y_-30.in     energy
         55_Benzene-MeOH_OH-pi_1_y_+30    <PATH1>/monomers_A           55_Benzene-MeOH_OH-pi_1_y_+30.in     energy
         55_Benzene-MeOH_OH-pi_1_z_-30    <PATH1>/monomers_A           55_Benzene-MeOH_OH-pi_1_z_-30.in     energy
         55_Benzene-MeOH_OH-pi_1_z_+30    <PATH1>/monomers_A           55_Benzene-MeOH_OH-pi_1_z_+30.in     energy
         55_Benzene-MeOH_OH-pi_2_y_-30    <PATH1>/monomers_A           55_Benzene-MeOH_OH-pi_2_y_-30.in     energy
         55_Benzene-MeOH_OH-pi_2_y_+30    <PATH1>/monomers_A           55_Benzene-MeOH_OH-pi_2_y_+30.in     energy
         55_Benzene-MeOH_OH-pi_2_z_-30    <PATH1>/monomers_A           55_Benzene-MeOH_OH-pi_2_z_-30.in     energy
         55_Benzene-MeOH_OH-pi_2_z_+30    <PATH1>/monomers_A           55_Benzene-MeOH_OH-pi_2_z_+30.in     energy
        56_Benzene-MeNH2_NH-pi_1_y_-30    <PATH1>/monomers_A          56_Benzene-MeNH2_NH-pi_1_y_-30.in     energy
        56_Benzene-MeNH2_NH-pi_1_y_+30    <PATH1>/monomers_A          56_Benzene-MeNH2_NH-pi_1_y_+30.in     energy
        56_Benzene-MeNH2_NH-pi_1_z_-30    <PATH1>/monomers_A          56_Benzene-MeNH2_NH-pi_1_z_-30.in     energy
        56_Benzene-MeNH2_NH-pi_1_z_+30    <PATH1>/monomers_A          56_Benzene-MeNH2_NH-pi_1_z_+30.in     energy
        56_Benzene-MeNH2_NH-pi_2_y_-30    <PATH1>/monomers_A          56_Benzene-MeNH2_NH-pi_2_y_-30.in     energy
        56_Benzene-MeNH2_NH-pi_2_y_+30    <PATH1>/monomers_A          56_Benzene-MeNH2_NH-pi_2_y_+30.in     energy
        56_Benzene-MeNH2_NH-pi_2_z_-30    <PATH1>/monomers_A          56_Benzene-MeNH2_NH-pi_2_z_-30.in     energy
        56_Benzene-MeNH2_NH-pi_2_z_+30    <PATH1>/monomers_A          56_Benzene-MeNH2_NH-pi_2_z_+30.in     energy
      57_Benzene-Peptide_NH-pi_1_y_-30    <PATH1>/monomers_A        57_Benzene-Peptide_NH-pi_1_y_-30.in     energy
      57_Benzene-Peptide_NH-pi_1_y_+30    <PATH1>/monomers_A        57_Benzene-Peptide_NH-pi_1_y_+30.in     energy
      57_Benzene-Peptide_NH-pi_1_z_-30    <PATH1>/monomers_A        57_Benzene-Peptide_NH-pi_1_z_-30.in     energy
      57_Benzene-Peptide_NH-pi_1_z_+30    <PATH1>/monomers_A        57_Benzene-Peptide_NH-pi_1_z_+30.in     energy
      57_Benzene-Peptide_NH-pi_2_y_-30    <PATH1>/monomers_A        57_Benzene-Peptide_NH-pi_2_y_-30.in     energy
      57_Benzene-Peptide_NH-pi_2_y_+30    <PATH1>/monomers_A        57_Benzene-Peptide_NH-pi_2_y_+30.in     energy
      57_Benzene-Peptide_NH-pi_2_z_-30    <PATH1>/monomers_A        57_Benzene-Peptide_NH-pi_2_z_-30.in     energy
      57_Benzene-Peptide_NH-pi_2_z_+30    <PATH1>/monomers_A        57_Benzene-Peptide_NH-pi_2_z_+30.in     energy
     58_Pyridine-Pyridine_CH-N_1_y_-30    <PATH1>/monomers_A       58_Pyridine-Pyridine_CH-N_1_y_-30.in     energy
     58_Pyridine-Pyridine_CH-N_1_y_+30    <PATH1>/monomers_A       58_Pyridine-Pyridine_CH-N_1_y_+30.in     energy
     58_Pyridine-Pyridine_CH-N_1_z_-30    <PATH1>/monomers_A       58_Pyridine-Pyridine_CH-N_1_z_-30.in     energy
     58_Pyridine-Pyridine_CH-N_1_z_+30    <PATH1>/monomers_A       58_Pyridine-Pyridine_CH-N_1_z_+30.in     energy
     58_Pyridine-Pyridine_CH-N_2_y_-30    <PATH1>/monomers_A       58_Pyridine-Pyridine_CH-N_2_y_-30.in     energy
     58_Pyridine-Pyridine_CH-N_2_y_+30    <PATH1>/monomers_A       58_Pyridine-Pyridine_CH-N_2_y_+30.in     energy
     58_Pyridine-Pyridine_CH-N_2_z_-30    <PATH1>/monomers_A       58_Pyridine-Pyridine_CH-N_2_z_-30.in     energy
     58_Pyridine-Pyridine_CH-N_2_z_+30    <PATH1>/monomers_A       58_Pyridine-Pyridine_CH-N_2_z_+30.in     energy
          59_Ethyne-Water_CH-O_1_y_-30    <PATH1>/monomers_A            59_Ethyne-Water_CH-O_1_y_-30.in     energy
          59_Ethyne-Water_CH-O_1_y_+30    <PATH1>/monomers_A            59_Ethyne-Water_CH-O_1_y_+30.in     energy
          59_Ethyne-Water_CH-O_1_z_-30    <PATH1>/monomers_A            59_Ethyne-Water_CH-O_1_z_-30.in     energy
          59_Ethyne-Water_CH-O_1_z_+30    <PATH1>/monomers_A            59_Ethyne-Water_CH-O_1_z_+30.in     energy
          59_Ethyne-Water_CH-O_2_y_-30    <PATH1>/monomers_A            59_Ethyne-Water_CH-O_2_y_-30.in     energy
          59_Ethyne-Water_CH-O_2_y_+30    <PATH1>/monomers_A            59_Ethyne-Water_CH-O_2_y_+30.in     energy
          59_Ethyne-Water_CH-O_2_z_-30    <PATH1>/monomers_A            59_Ethyne-Water_CH-O_2_z_-30.in     energy
          59_Ethyne-Water_CH-O_2_z_+30    <PATH1>/monomers_A            59_Ethyne-Water_CH-O_2_z_+30.in     energy
          60_Ethyne-AcOH_OH-pi_1_y_-30    <PATH1>/monomers_A            60_Ethyne-AcOH_OH-pi_1_y_-30.in     energy
          60_Ethyne-AcOH_OH-pi_1_y_+30    <PATH1>/monomers_A            60_Ethyne-AcOH_OH-pi_1_y_+30.in     energy
          60_Ethyne-AcOH_OH-pi_1_z_-30    <PATH1>/monomers_A            60_Ethyne-AcOH_OH-pi_1_z_-30.in     energy
          60_Ethyne-AcOH_OH-pi_1_z_+30    <PATH1>/monomers_A            60_Ethyne-AcOH_OH-pi_1_z_+30.in     energy
          60_Ethyne-AcOH_OH-pi_2_y_-30    <PATH1>/monomers_A            60_Ethyne-AcOH_OH-pi_2_y_-30.in     energy
          60_Ethyne-AcOH_OH-pi_2_y_+30    <PATH1>/monomers_A            60_Ethyne-AcOH_OH-pi_2_y_+30.in     energy
          60_Ethyne-AcOH_OH-pi_2_z_-30    <PATH1>/monomers_A            60_Ethyne-AcOH_OH-pi_2_z_-30.in     energy
          60_Ethyne-AcOH_OH-pi_2_z_+30    <PATH1>/monomers_A            60_Ethyne-AcOH_OH-pi_2_z_+30.in     energy
               61_Pentane-AcOH_1_y_-30    <PATH1>/monomers_A                 61_Pentane-AcOH_1_y_-30.in     energy
               61_Pentane-AcOH_1_y_+30    <PATH1>/monomers_A                 61_Pentane-AcOH_1_y_+30.in     energy
               61_Pentane-AcOH_1_z_-30    <PATH1>/monomers_A                 61_Pentane-AcOH_1_z_-30.in     energy
               61_Pentane-AcOH_1_z_+30    <PATH1>/monomers_A                 61_Pentane-AcOH_1_z_+30.in     energy
               61_Pentane-AcOH_2_y_-30    <PATH1>/monomers_A                 61_Pentane-AcOH_2_y_-30.in     energy
               61_Pentane-AcOH_2_y_+30    <PATH1>/monomers_A                 61_Pentane-AcOH_2_y_+30.in     energy
               61_Pentane-AcOH_2_z_-30    <PATH1>/monomers_A                 61_Pentane-AcOH_2_z_-30.in     energy
               61_Pentane-AcOH_2_z_+30    <PATH1>/monomers_A                 61_Pentane-AcOH_2_z_+30.in     energy
              62_Pentane-AcNH2_1_y_-30    <PATH1>/monomers_A                62_Pentane-AcNH2_1_y_-30.in     energy
              62_Pentane-AcNH2_1_y_+30    <PATH1>/monomers_A                62_Pentane-AcNH2_1_y_+30.in     energy
              62_Pentane-AcNH2_1_z_-30    <PATH1>/monomers_A                62_Pentane-AcNH2_1_z_-30.in     energy
              62_Pentane-AcNH2_1_z_+30    <PATH1>/monomers_A                62_Pentane-AcNH2_1_z_+30.in     energy
              62_Pentane-AcNH2_2_y_-30    <PATH1>/monomers_A                62_Pentane-AcNH2_2_y_-30.in     energy
              62_Pentane-AcNH2_2_y_+30    <PATH1>/monomers_A                62_Pentane-AcNH2_2_y_+30.in     energy
              62_Pentane-AcNH2_2_z_-30    <PATH1>/monomers_A                62_Pentane-AcNH2_2_z_-30.in     energy
              62_Pentane-AcNH2_2_z_+30    <PATH1>/monomers_A                62_Pentane-AcNH2_2_z_+30.in     energy
               63_Benzene-AcOH_1_y_-30    <PATH1>/monomers_A                 63_Benzene-AcOH_1_y_-30.in     energy
               63_Benzene-AcOH_1_y_+30    <PATH1>/monomers_A                 63_Benzene-AcOH_1_y_+30.in     energy
               63_Benzene-AcOH_1_z_-30    <PATH1>/monomers_A                 63_Benzene-AcOH_1_z_-30.in     energy
               63_Benzene-AcOH_1_z_+30    <PATH1>/monomers_A                 63_Benzene-AcOH_1_z_+30.in     energy
               63_Benzene-AcOH_2_y_-30    <PATH1>/monomers_A                 63_Benzene-AcOH_2_y_-30.in     energy
               63_Benzene-AcOH_2_y_+30    <PATH1>/monomers_A                 63_Benzene-AcOH_2_y_+30.in     energy
               63_Benzene-AcOH_2_z_-30    <PATH1>/monomers_A                 63_Benzene-AcOH_2_z_-30.in     energy
               63_Benzene-AcOH_2_z_+30    <PATH1>/monomers_A                 63_Benzene-AcOH_2_z_+30.in     energy
             64_Peptide-Ethene_1_y_-30    <PATH1>/monomers_A               64_Peptide-Ethene_1_y_-30.in     energy
             64_Peptide-Ethene_1_y_+30    <PATH1>/monomers_A               64_Peptide-Ethene_1_y_+30.in     energy
             64_Peptide-Ethene_1_z_-30    <PATH1>/monomers_A               64_Peptide-Ethene_1_z_-30.in     energy
             64_Peptide-Ethene_1_z_+30    <PATH1>/monomers_A               64_Peptide-Ethene_1_z_+30.in     energy
             64_Peptide-Ethene_2_y_-30    <PATH1>/monomers_A               64_Peptide-Ethene_2_y_-30.in     energy
             64_Peptide-Ethene_2_y_+30    <PATH1>/monomers_A               64_Peptide-Ethene_2_y_+30.in     energy
             64_Peptide-Ethene_2_z_-30    <PATH1>/monomers_A               64_Peptide-Ethene_2_z_-30.in     energy
             64_Peptide-Ethene_2_z_+30    <PATH1>/monomers_A               64_Peptide-Ethene_2_z_+30.in     energy
            65_Pyridine-Ethyne_1_y_-30    <PATH1>/monomers_A              65_Pyridine-Ethyne_1_y_-30.in     energy
            65_Pyridine-Ethyne_1_y_+30    <PATH1>/monomers_A              65_Pyridine-Ethyne_1_y_+30.in     energy
            65_Pyridine-Ethyne_1_z_-30    <PATH1>/monomers_A              65_Pyridine-Ethyne_1_z_-30.in     energy
            65_Pyridine-Ethyne_1_z_+30    <PATH1>/monomers_A              65_Pyridine-Ethyne_1_z_+30.in     energy
            65_Pyridine-Ethyne_2_y_-30    <PATH1>/monomers_A              65_Pyridine-Ethyne_2_y_-30.in     energy
            65_Pyridine-Ethyne_2_y_+30    <PATH1>/monomers_A              65_Pyridine-Ethyne_2_y_+30.in     energy
            65_Pyridine-Ethyne_2_z_-30    <PATH1>/monomers_A              65_Pyridine-Ethyne_2_z_-30.in     energy
            65_Pyridine-Ethyne_2_z_+30    <PATH1>/monomers_A              65_Pyridine-Ethyne_2_z_+30.in     energy
             66_MeNH2-Pyridine_1_y_-30    <PATH1>/monomers_A               66_MeNH2-Pyridine_1_y_-30.in     energy
             66_MeNH2-Pyridine_1_y_+30    <PATH1>/monomers_A               66_MeNH2-Pyridine_1_y_+30.in     energy
             66_MeNH2-Pyridine_1_z_-30    <PATH1>/monomers_A               66_MeNH2-Pyridine_1_z_-30.in     energy
             66_MeNH2-Pyridine_1_z_+30    <PATH1>/monomers_A               66_MeNH2-Pyridine_1_z_+30.in     energy
             66_MeNH2-Pyridine_2_y_-30    <PATH1>/monomers_A               66_MeNH2-Pyridine_2_y_-30.in     energy
             66_MeNH2-Pyridine_2_y_+30    <PATH1>/monomers_A               66_MeNH2-Pyridine_2_y_+30.in     energy
             66_MeNH2-Pyridine_2_z_-30    <PATH1>/monomers_A               66_MeNH2-Pyridine_2_z_-30.in     energy
             66_MeNH2-Pyridine_2_z_+30    <PATH1>/monomers_A               66_MeNH2-Pyridine_2_z_+30.in     energy

# Training set for the atomization energy
#		528 is the total number of data to be tested
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 528  1.0
#"Number"    "Flag"                       "Scale"            "Ref"    "Weight"
 1                01_Water-Water_1_y_-30   1                 0.0       1.0
 1                01_Water-Water_1_y_+30   1                 0.0       1.0
 1                01_Water-Water_1_z_-30   1                 0.0       1.0
 1                01_Water-Water_1_z_+30   1                 0.0       1.0
 1                01_Water-Water_2_y_-30   1                 0.0       1.0
 1                01_Water-Water_2_y_+30   1                 0.0       1.0
 1                01_Water-Water_2_z_-30   1                 0.0       1.0
 1                01_Water-Water_2_z_+30   1                 0.0       1.0
 1                 02_Water-MeOH_1_y_-30   1                 0.0       1.0
 1                 02_Water-MeOH_1_y_+30   1                 0.0       1.0
 1                 02_Water-MeOH_1_z_-30   1                 0.0       1.0
 1                 02_Water-MeOH_1_z_+30   1                 0.0       1.0
 1                 02_Water-MeOH_2_y_-30   1                 0.0       1.0
 1                 02_Water-MeOH_2_y_+30   1                 0.0       1.0
 1                 02_Water-MeOH_2_z_-30   1                 0.0       1.0
 1                 02_Water-MeOH_2_z_+30   1                 0.0       1.0
 1                03_Water-MeNH2_1_y_-30   1                 0.0       1.0
 1                03_Water-MeNH2_1_y_+30   1                 0.0       1.0
 1                03_Water-MeNH2_1_z_-30   1                 0.0       1.0
 1                03_Water-MeNH2_1_z_+30   1                 0.0       1.0
 1                03_Water-MeNH2_2_y_-30   1                 0.0       1.0
 1                03_Water-MeNH2_2_y_+30   1                 0.0       1.0
 1                03_Water-MeNH2_2_z_-30   1                 0.0       1.0
 1                03_Water-MeNH2_2_z_+30   1                 0.0       1.0
 1              04_Water-Peptide_1_y_-30   1                 0.0       1.0
 1              04_Water-Peptide_1_y_+30   1                 0.0       1.0
 1              04_Water-Peptide_1_z_-30   1                 0.0       1.0
 1              04_Water-Peptide_1_z_+30   1                 0.0       1.0
 1              04_Water-Peptide_2_y_-30   1                 0.0       1.0
 1              04_Water-Peptide_2_y_+30   1                 0.0       1.0
 1              04_Water-Peptide_2_z_-30   1                 0.0       1.0
 1              04_Water-Peptide_2_z_+30   1                 0.0       1.0
 1                  05_MeOH-MeOH_1_y_-30   1                 0.0       1.0
 1                  05_MeOH-MeOH_1_y_+30   1                 0.0       1.0
 1                  05_MeOH-MeOH_1_z_-30   1                 0.0       1.0
 1                  05_MeOH-MeOH_1_z_+30   1                 0.0       1.0
 1                  05_MeOH-MeOH_2_y_-30   1                 0.0       1.0
 1                  05_MeOH-MeOH_2_y_+30   1                 0.0       1.0
 1                  05_MeOH-MeOH_2_z_-30   1                 0.0       1.0
 1                  05_MeOH-MeOH_2_z_+30   1                 0.0       1.0
 1                 06_MeOH-MeNH2_1_y_-30   1                 0.0       1.0
 1                 06_MeOH-MeNH2_1_y_+30   1                 0.0       1.0
 1                 06_MeOH-MeNH2_1_z_-30   1                 0.0       1.0
 1                 06_MeOH-MeNH2_1_z_+30   1                 0.0       1.0
 1                 06_MeOH-MeNH2_2_y_-30   1                 0.0       1.0
 1                 06_MeOH-MeNH2_2_y_+30   1                 0.0       1.0
 1                 06_MeOH-MeNH2_2_z_-30   1                 0.0       1.0
 1                 06_MeOH-MeNH2_2_z_+30   1                 0.0       1.0
 1               07_MeOH-Peptide_1_y_-30   1                 0.0       1.0
 1               07_MeOH-Peptide_1_y_+30   1                 0.0       1.0
 1               07_MeOH-Peptide_1_z_-30   1                 0.0       1.0
 1               07_MeOH-Peptide_1_z_+30   1                 0.0       1.0
 1               07_MeOH-Peptide_2_y_-30   1                 0.0       1.0
 1               07_MeOH-Peptide_2_y_+30   1                 0.0       1.0
 1               07_MeOH-Peptide_2_z_-30   1                 0.0       1.0
 1               07_MeOH-Peptide_2_z_+30   1                 0.0       1.0
 1                 08_MeOH-Water_1_y_-30   1                 0.0       1.0
 1                 08_MeOH-Water_1_y_+30   1                 0.0       1.0
 1                 08_MeOH-Water_1_z_-30   1                 0.0       1.0
 1                 08_MeOH-Water_1_z_+30   1                 0.0       1.0
 1                 08_MeOH-Water_2_y_-30   1                 0.0       1.0
 1                 08_MeOH-Water_2_y_+30   1                 0.0       1.0
 1                 08_MeOH-Water_2_z_-30   1                 0.0       1.0
 1                 08_MeOH-Water_2_z_+30   1                 0.0       1.0
 1                 09_MeNH2-MeOH_1_y_-30   1                 0.0       1.0
 1                 09_MeNH2-MeOH_1_y_+30   1                 0.0       1.0
 1                 09_MeNH2-MeOH_1_z_-30   1                 0.0       1.0
 1                 09_MeNH2-MeOH_1_z_+30   1                 0.0       1.0
 1                 09_MeNH2-MeOH_2_y_-30   1                 0.0       1.0
 1                 09_MeNH2-MeOH_2_y_+30   1                 0.0       1.0
 1                 09_MeNH2-MeOH_2_z_-30   1                 0.0       1.0
 1                 09_MeNH2-MeOH_2_z_+30   1                 0.0       1.0
 1                10_MeNH2-MeNH2_1_y_-30   1                 0.0       1.0
 1                10_MeNH2-MeNH2_1_y_+30   1                 0.0       1.0
 1                10_MeNH2-MeNH2_1_z_-30   1                 0.0       1.0
 1                10_MeNH2-MeNH2_1_z_+30   1                 0.0       1.0
 1                10_MeNH2-MeNH2_2_y_-30   1                 0.0       1.0
 1                10_MeNH2-MeNH2_2_y_+30   1                 0.0       1.0
 1                10_MeNH2-MeNH2_2_z_-30   1                 0.0       1.0
 1                10_MeNH2-MeNH2_2_z_+30   1                 0.0       1.0
 1              11_MeNH2-Peptide_1_y_-30   1                 0.0       1.0
 1              11_MeNH2-Peptide_1_y_+30   1                 0.0       1.0
 1              11_MeNH2-Peptide_1_z_-30   1                 0.0       1.0
 1              11_MeNH2-Peptide_1_z_+30   1                 0.0       1.0
 1              11_MeNH2-Peptide_2_y_-30   1                 0.0       1.0
 1              11_MeNH2-Peptide_2_y_+30   1                 0.0       1.0
 1              11_MeNH2-Peptide_2_z_-30   1                 0.0       1.0
 1              11_MeNH2-Peptide_2_z_+30   1                 0.0       1.0
 1                12_MeNH2-Water_1_y_-30   1                 0.0       1.0
 1                12_MeNH2-Water_1_y_+30   1                 0.0       1.0
 1                12_MeNH2-Water_1_z_-30   1                 0.0       1.0
 1                12_MeNH2-Water_1_z_+30   1                 0.0       1.0
 1                12_MeNH2-Water_2_y_-30   1                 0.0       1.0
 1                12_MeNH2-Water_2_y_+30   1                 0.0       1.0
 1                12_MeNH2-Water_2_z_-30   1                 0.0       1.0
 1                12_MeNH2-Water_2_z_+30   1                 0.0       1.0
 1               13_Peptide-MeOH_1_y_-30   1                 0.0       1.0
 1               13_Peptide-MeOH_1_y_+30   1                 0.0       1.0
 1               13_Peptide-MeOH_1_z_-30   1                 0.0       1.0
 1               13_Peptide-MeOH_1_z_+30   1                 0.0       1.0
 1               13_Peptide-MeOH_2_y_-30   1                 0.0       1.0
 1               13_Peptide-MeOH_2_y_+30   1                 0.0       1.0
 1               13_Peptide-MeOH_2_z_-30   1                 0.0       1.0
 1               13_Peptide-MeOH_2_z_+30   1                 0.0       1.0
 1              14_Peptide-MeNH2_1_y_-30   1                 0.0       1.0
 1              14_Peptide-MeNH2_1_y_+30   1                 0.0       1.0
 1              14_Peptide-MeNH2_1_z_-30   1                 0.0       1.0
 1              14_Peptide-MeNH2_1_z_+30   1                 0.0       1.0
 1              14_Peptide-MeNH2_2_y_-30   1                 0.0       1.0
 1              14_Peptide-MeNH2_2_y_+30   1                 0.0       1.0
 1              14_Peptide-MeNH2_2_z_-30   1                 0.0       1.0
 1              14_Peptide-MeNH2_2_z_+30   1                 0.0       1.0
 1            15_Peptide-Peptide_1_y_-30   1                 0.0       1.0
 1            15_Peptide-Peptide_1_y_+30   1                 0.0       1.0
 1            15_Peptide-Peptide_1_z_-30   1                 0.0       1.0
 1            15_Peptide-Peptide_1_z_+30   1                 0.0       1.0
 1            15_Peptide-Peptide_2_y_-30   1                 0.0       1.0
 1            15_Peptide-Peptide_2_y_+30   1                 0.0       1.0
 1            15_Peptide-Peptide_2_z_-30   1                 0.0       1.0
 1            15_Peptide-Peptide_2_z_+30   1                 0.0       1.0
 1              16_Peptide-Water_1_y_-30   1                 0.0       1.0
 1              16_Peptide-Water_1_y_+30   1                 0.0       1.0
 1              16_Peptide-Water_1_z_-30   1                 0.0       1.0
 1              16_Peptide-Water_1_z_+30   1                 0.0       1.0
 1              16_Peptide-Water_2_y_-30   1                 0.0       1.0
 1              16_Peptide-Water_2_y_+30   1                 0.0       1.0
 1              16_Peptide-Water_2_z_-30   1                 0.0       1.0
 1              16_Peptide-Water_2_z_+30   1                 0.0       1.0
 1           17_Uracil-Uracil_BP_1_y_-30   1                 0.0       1.0
 1           17_Uracil-Uracil_BP_1_y_+30   1                 0.0       1.0
 1           17_Uracil-Uracil_BP_1_z_-30   1                 0.0       1.0
 1           17_Uracil-Uracil_BP_1_z_+30   1                 0.0       1.0
 1           17_Uracil-Uracil_BP_2_y_-30   1                 0.0       1.0
 1           17_Uracil-Uracil_BP_2_y_+30   1                 0.0       1.0
 1           17_Uracil-Uracil_BP_2_z_-30   1                 0.0       1.0
 1           17_Uracil-Uracil_BP_2_z_+30   1                 0.0       1.0
 1             18_Water-Pyridine_1_y_-30   1                 0.0       1.0
 1             18_Water-Pyridine_1_y_+30   1                 0.0       1.0
 1             18_Water-Pyridine_1_z_-30   1                 0.0       1.0
 1             18_Water-Pyridine_1_z_+30   1                 0.0       1.0
 1             18_Water-Pyridine_2_y_-30   1                 0.0       1.0
 1             18_Water-Pyridine_2_y_+30   1                 0.0       1.0
 1             18_Water-Pyridine_2_z_-30   1                 0.0       1.0
 1             18_Water-Pyridine_2_z_+30   1                 0.0       1.0
 1              19_MeOH-Pyridine_1_y_-30   1                 0.0       1.0
 1              19_MeOH-Pyridine_1_y_+30   1                 0.0       1.0
 1              19_MeOH-Pyridine_1_z_-30   1                 0.0       1.0
 1              19_MeOH-Pyridine_1_z_+30   1                 0.0       1.0
 1              19_MeOH-Pyridine_2_y_-30   1                 0.0       1.0
 1              19_MeOH-Pyridine_2_y_+30   1                 0.0       1.0
 1              19_MeOH-Pyridine_2_z_-30   1                 0.0       1.0
 1              19_MeOH-Pyridine_2_z_+30   1                 0.0       1.0
 1                  20_AcOH-AcOH_1_y_-30   1                 0.0       1.0
 1                  20_AcOH-AcOH_1_y_+30   1                 0.0       1.0
 1                  20_AcOH-AcOH_1_z_-30   1                 0.0       1.0
 1                  20_AcOH-AcOH_1_z_+30   1                 0.0       1.0
 1                  20_AcOH-AcOH_2_y_-30   1                 0.0       1.0
 1                  20_AcOH-AcOH_2_y_+30   1                 0.0       1.0
 1                  20_AcOH-AcOH_2_z_-30   1                 0.0       1.0
 1                  20_AcOH-AcOH_2_z_+30   1                 0.0       1.0
 1                21_AcNH2-AcNH2_1_y_-30   1                 0.0       1.0
 1                21_AcNH2-AcNH2_1_y_+30   1                 0.0       1.0
 1                21_AcNH2-AcNH2_1_z_-30   1                 0.0       1.0
 1                21_AcNH2-AcNH2_1_z_+30   1                 0.0       1.0
 1                21_AcNH2-AcNH2_2_y_-30   1                 0.0       1.0
 1                21_AcNH2-AcNH2_2_y_+30   1                 0.0       1.0
 1                21_AcNH2-AcNH2_2_z_-30   1                 0.0       1.0
 1                21_AcNH2-AcNH2_2_z_+30   1                 0.0       1.0
 1                22_AcOH-Uracil_1_y_-30   1                 0.0       1.0
 1                22_AcOH-Uracil_1_y_+30   1                 0.0       1.0
 1                22_AcOH-Uracil_1_z_-30   1                 0.0       1.0
 1                22_AcOH-Uracil_1_z_+30   1                 0.0       1.0
 1                22_AcOH-Uracil_2_y_-30   1                 0.0       1.0
 1                22_AcOH-Uracil_2_y_+30   1                 0.0       1.0
 1                22_AcOH-Uracil_2_z_-30   1                 0.0       1.0
 1                22_AcOH-Uracil_2_z_+30   1                 0.0       1.0
 1               23_AcNH2-Uracil_1_y_-30   1                 0.0       1.0
 1               23_AcNH2-Uracil_1_y_+30   1                 0.0       1.0
 1               23_AcNH2-Uracil_1_z_-30   1                 0.0       1.0
 1               23_AcNH2-Uracil_1_z_+30   1                 0.0       1.0
 1               23_AcNH2-Uracil_2_y_-30   1                 0.0       1.0
 1               23_AcNH2-Uracil_2_y_+30   1                 0.0       1.0
 1               23_AcNH2-Uracil_2_z_-30   1                 0.0       1.0
 1               23_AcNH2-Uracil_2_z_+30   1                 0.0       1.0
 1      24_Benzene-Benzene_pi-pi_1_y_-30   1                 0.0       1.0
 1      24_Benzene-Benzene_pi-pi_1_y_+30   1                 0.0       1.0
 1      24_Benzene-Benzene_pi-pi_1_z_-30   1                 0.0       1.0
 1      24_Benzene-Benzene_pi-pi_1_z_+30   1                 0.0       1.0
 1      24_Benzene-Benzene_pi-pi_2_y_-30   1                 0.0       1.0
 1      24_Benzene-Benzene_pi-pi_2_y_+30   1                 0.0       1.0
 1      24_Benzene-Benzene_pi-pi_2_z_-30   1                 0.0       1.0
 1      24_Benzene-Benzene_pi-pi_2_z_+30   1                 0.0       1.0
 1    25_Pyridine-Pyridine_pi-pi_1_y_-30   1                 0.0       1.0
 1    25_Pyridine-Pyridine_pi-pi_1_y_+30   1                 0.0       1.0
 1    25_Pyridine-Pyridine_pi-pi_1_z_-30   1                 0.0       1.0
 1    25_Pyridine-Pyridine_pi-pi_1_z_+30   1                 0.0       1.0
 1    25_Pyridine-Pyridine_pi-pi_2_y_-30   1                 0.0       1.0
 1    25_Pyridine-Pyridine_pi-pi_2_y_+30   1                 0.0       1.0
 1    25_Pyridine-Pyridine_pi-pi_2_z_-30   1                 0.0       1.0
 1    25_Pyridine-Pyridine_pi-pi_2_z_+30   1                 0.0       1.0
 1        26_Uracil-Uracil_pi-pi_1_y_-30   1                 0.0       1.0
 1        26_Uracil-Uracil_pi-pi_1_y_+30   1                 0.0       1.0
 1        26_Uracil-Uracil_pi-pi_1_z_-30   1                 0.0       1.0
 1        26_Uracil-Uracil_pi-pi_1_z_+30   1                 0.0       1.0
 1        26_Uracil-Uracil_pi-pi_2_y_-30   1                 0.0       1.0
 1        26_Uracil-Uracil_pi-pi_2_y_+30   1                 0.0       1.0
 1        26_Uracil-Uracil_pi-pi_2_z_-30   1                 0.0       1.0
 1        26_Uracil-Uracil_pi-pi_2_z_+30   1                 0.0       1.0
 1     27_Benzene-Pyridine_pi-pi_1_y_-30   1                 0.0       1.0
 1     27_Benzene-Pyridine_pi-pi_1_y_+30   1                 0.0       1.0
 1     27_Benzene-Pyridine_pi-pi_1_z_-30   1                 0.0       1.0
 1     27_Benzene-Pyridine_pi-pi_1_z_+30   1                 0.0       1.0
 1     27_Benzene-Pyridine_pi-pi_2_y_-30   1                 0.0       1.0
 1     27_Benzene-Pyridine_pi-pi_2_y_+30   1                 0.0       1.0
 1     27_Benzene-Pyridine_pi-pi_2_z_-30   1                 0.0       1.0
 1     27_Benzene-Pyridine_pi-pi_2_z_+30   1                 0.0       1.0
 1       28_Benzene-Uracil_pi-pi_1_y_-30   1                 0.0       1.0
 1       28_Benzene-Uracil_pi-pi_1_y_+30   1                 0.0       1.0
 1       28_Benzene-Uracil_pi-pi_1_z_-30   1                 0.0       1.0
 1       28_Benzene-Uracil_pi-pi_1_z_+30   1                 0.0       1.0
 1       28_Benzene-Uracil_pi-pi_2_y_-30   1                 0.0       1.0
 1       28_Benzene-Uracil_pi-pi_2_y_+30   1                 0.0       1.0
 1       28_Benzene-Uracil_pi-pi_2_z_-30   1                 0.0       1.0
 1       28_Benzene-Uracil_pi-pi_2_z_+30   1                 0.0       1.0
 1      29_Pyridine-Uracil_pi-pi_1_y_-30   1                 0.0       1.0
 1      29_Pyridine-Uracil_pi-pi_1_y_+30   1                 0.0       1.0
 1      29_Pyridine-Uracil_pi-pi_1_z_-30   1                 0.0       1.0
 1      29_Pyridine-Uracil_pi-pi_1_z_+30   1                 0.0       1.0
 1      29_Pyridine-Uracil_pi-pi_2_y_-30   1                 0.0       1.0
 1      29_Pyridine-Uracil_pi-pi_2_y_+30   1                 0.0       1.0
 1      29_Pyridine-Uracil_pi-pi_2_z_-30   1                 0.0       1.0
 1      29_Pyridine-Uracil_pi-pi_2_z_+30   1                 0.0       1.0
 1             30_Benzene-Ethene_1_y_-30   1                 0.0       1.0
 1             30_Benzene-Ethene_1_y_+30   1                 0.0       1.0
 1             30_Benzene-Ethene_1_z_-30   1                 0.0       1.0
 1             30_Benzene-Ethene_1_z_+30   1                 0.0       1.0
 1             30_Benzene-Ethene_2_y_-30   1                 0.0       1.0
 1             30_Benzene-Ethene_2_y_+30   1                 0.0       1.0
 1             30_Benzene-Ethene_2_z_-30   1                 0.0       1.0
 1             30_Benzene-Ethene_2_z_+30   1                 0.0       1.0
 1              31_Uracil-Ethene_1_y_-30   1                 0.0       1.0
 1              31_Uracil-Ethene_1_y_+30   1                 0.0       1.0
 1              31_Uracil-Ethene_1_z_-30   1                 0.0       1.0
 1              31_Uracil-Ethene_1_z_+30   1                 0.0       1.0
 1              31_Uracil-Ethene_2_y_-30   1                 0.0       1.0
 1              31_Uracil-Ethene_2_y_+30   1                 0.0       1.0
 1              31_Uracil-Ethene_2_z_-30   1                 0.0       1.0
 1              31_Uracil-Ethene_2_z_+30   1                 0.0       1.0
 1              32_Uracil-Ethyne_1_y_-30   1                 0.0       1.0
 1              32_Uracil-Ethyne_1_y_+30   1                 0.0       1.0
 1              32_Uracil-Ethyne_1_z_-30   1                 0.0       1.0
 1              32_Uracil-Ethyne_1_z_+30   1                 0.0       1.0
 1              32_Uracil-Ethyne_2_y_-30   1                 0.0       1.0
 1              32_Uracil-Ethyne_2_y_+30   1                 0.0       1.0
 1              32_Uracil-Ethyne_2_z_-30   1                 0.0       1.0
 1              32_Uracil-Ethyne_2_z_+30   1                 0.0       1.0
 1            33_Pyridine-Ethene_1_y_-30   1                 0.0       1.0
 1            33_Pyridine-Ethene_1_y_+30   1                 0.0       1.0
 1            33_Pyridine-Ethene_1_z_-30   1                 0.0       1.0
 1            33_Pyridine-Ethene_1_z_+30   1                 0.0       1.0
 1            33_Pyridine-Ethene_2_y_-30   1                 0.0       1.0
 1            33_Pyridine-Ethene_2_y_+30   1                 0.0       1.0
 1            33_Pyridine-Ethene_2_z_-30   1                 0.0       1.0
 1            33_Pyridine-Ethene_2_z_+30   1                 0.0       1.0
 1            34_Pentane-Pentane_1_y_-30   1                 0.0       1.0
 1            34_Pentane-Pentane_1_y_+30   1                 0.0       1.0
 1            34_Pentane-Pentane_1_z_-30   1                 0.0       1.0
 1            34_Pentane-Pentane_1_z_+30   1                 0.0       1.0
 1            34_Pentane-Pentane_2_y_-30   1                 0.0       1.0
 1            34_Pentane-Pentane_2_y_+30   1                 0.0       1.0
 1            34_Pentane-Pentane_2_z_-30   1                 0.0       1.0
 1            34_Pentane-Pentane_2_z_+30   1                 0.0       1.0
 1         35_Neopentane-Pentane_1_y_-30   1                 0.0       1.0
 1         35_Neopentane-Pentane_1_y_+30   1                 0.0       1.0
 1         35_Neopentane-Pentane_1_z_-30   1                 0.0       1.0
 1         35_Neopentane-Pentane_1_z_+30   1                 0.0       1.0
 1         35_Neopentane-Pentane_2_y_-30   1                 0.0       1.0
 1         35_Neopentane-Pentane_2_y_+30   1                 0.0       1.0
 1         35_Neopentane-Pentane_2_z_-30   1                 0.0       1.0
 1         35_Neopentane-Pentane_2_z_+30   1                 0.0       1.0
 1      36_Neopentane-Neopentane_1_y_-30   1                 0.0       1.0
 1      36_Neopentane-Neopentane_1_y_+30   1                 0.0       1.0
 1      36_Neopentane-Neopentane_1_z_-30   1                 0.0       1.0
 1      36_Neopentane-Neopentane_1_z_+30   1                 0.0       1.0
 1      36_Neopentane-Neopentane_2_y_-30   1                 0.0       1.0
 1      36_Neopentane-Neopentane_2_y_+30   1                 0.0       1.0
 1      36_Neopentane-Neopentane_2_z_-30   1                 0.0       1.0
 1      36_Neopentane-Neopentane_2_z_+30   1                 0.0       1.0
 1    37_Cyclopentane-Neopentane_1_y_-30   1                 0.0       1.0
 1    37_Cyclopentane-Neopentane_1_y_+30   1                 0.0       1.0
 1    37_Cyclopentane-Neopentane_1_z_-30   1                 0.0       1.0
 1    37_Cyclopentane-Neopentane_1_z_+30   1                 0.0       1.0
 1    37_Cyclopentane-Neopentane_2_y_-30   1                 0.0       1.0
 1    37_Cyclopentane-Neopentane_2_y_+30   1                 0.0       1.0
 1    37_Cyclopentane-Neopentane_2_z_-30   1                 0.0       1.0
 1    37_Cyclopentane-Neopentane_2_z_+30   1                 0.0       1.0
 1  38_Cyclopentane-Cyclopentane_1_y_-30   1                 0.0       1.0
 1  38_Cyclopentane-Cyclopentane_1_y_+30   1                 0.0       1.0
 1  38_Cyclopentane-Cyclopentane_1_z_-30   1                 0.0       1.0
 1  38_Cyclopentane-Cyclopentane_1_z_+30   1                 0.0       1.0
 1  38_Cyclopentane-Cyclopentane_2_y_-30   1                 0.0       1.0
 1  38_Cyclopentane-Cyclopentane_2_y_+30   1                 0.0       1.0
 1  38_Cyclopentane-Cyclopentane_2_z_-30   1                 0.0       1.0
 1  38_Cyclopentane-Cyclopentane_2_z_+30   1                 0.0       1.0
 1       39_Benzene-Cyclopentane_1_y_-30   1                 0.0       1.0
 1       39_Benzene-Cyclopentane_1_y_+30   1                 0.0       1.0
 1       39_Benzene-Cyclopentane_1_z_-30   1                 0.0       1.0
 1       39_Benzene-Cyclopentane_1_z_+30   1                 0.0       1.0
 1       39_Benzene-Cyclopentane_2_y_-30   1                 0.0       1.0
 1       39_Benzene-Cyclopentane_2_y_+30   1                 0.0       1.0
 1       39_Benzene-Cyclopentane_2_z_-30   1                 0.0       1.0
 1       39_Benzene-Cyclopentane_2_z_+30   1                 0.0       1.0
 1         40_Benzene-Neopentane_1_y_-30   1                 0.0       1.0
 1         40_Benzene-Neopentane_1_y_+30   1                 0.0       1.0
 1         40_Benzene-Neopentane_1_z_-30   1                 0.0       1.0
 1         40_Benzene-Neopentane_1_z_+30   1                 0.0       1.0
 1         40_Benzene-Neopentane_2_y_-30   1                 0.0       1.0
 1         40_Benzene-Neopentane_2_y_+30   1                 0.0       1.0
 1         40_Benzene-Neopentane_2_z_-30   1                 0.0       1.0
 1         40_Benzene-Neopentane_2_z_+30   1                 0.0       1.0
 1             41_Uracil-Pentane_1_y_-30   1                 0.0       1.0
 1             41_Uracil-Pentane_1_y_+30   1                 0.0       1.0
 1             41_Uracil-Pentane_1_z_-30   1                 0.0       1.0
 1             41_Uracil-Pentane_1_z_+30   1                 0.0       1.0
 1             41_Uracil-Pentane_2_y_-30   1                 0.0       1.0
 1             41_Uracil-Pentane_2_y_+30   1                 0.0       1.0
 1             41_Uracil-Pentane_2_z_-30   1                 0.0       1.0
 1             41_Uracil-Pentane_2_z_+30   1                 0.0       1.0
 1        42_Uracil-Cyclopentane_1_y_-30   1                 0.0       1.0
 1        42_Uracil-Cyclopentane_1_y_+30   1                 0.0       1.0
 1        42_Uracil-Cyclopentane_1_z_-30   1                 0.0       1.0
 1        42_Uracil-Cyclopentane_1_z_+30   1                 0.0       1.0
 1        42_Uracil-Cyclopentane_2_y_-30   1                 0.0       1.0
 1        42_Uracil-Cyclopentane_2_y_+30   1                 0.0       1.0
 1        42_Uracil-Cyclopentane_2_z_-30   1                 0.0       1.0
 1        42_Uracil-Cyclopentane_2_z_+30   1                 0.0       1.0
 1          43_Uracil-Neopentane_1_y_-30   1                 0.0       1.0
 1          43_Uracil-Neopentane_1_y_+30   1                 0.0       1.0
 1          43_Uracil-Neopentane_1_z_-30   1                 0.0       1.0
 1          43_Uracil-Neopentane_1_z_+30   1                 0.0       1.0
 1          43_Uracil-Neopentane_2_y_-30   1                 0.0       1.0
 1          43_Uracil-Neopentane_2_y_+30   1                 0.0       1.0
 1          43_Uracil-Neopentane_2_z_-30   1                 0.0       1.0
 1          43_Uracil-Neopentane_2_z_+30   1                 0.0       1.0
 1             44_Ethene-Pentane_1_y_-30   1                 0.0       1.0
 1             44_Ethene-Pentane_1_y_+30   1                 0.0       1.0
 1             44_Ethene-Pentane_1_z_-30   1                 0.0       1.0
 1             44_Ethene-Pentane_1_z_+30   1                 0.0       1.0
 1             44_Ethene-Pentane_2_y_-30   1                 0.0       1.0
 1             44_Ethene-Pentane_2_y_+30   1                 0.0       1.0
 1             44_Ethene-Pentane_2_z_-30   1                 0.0       1.0
 1             44_Ethene-Pentane_2_z_+30   1                 0.0       1.0
 1             45_Ethyne-Pentane_1_y_-30   1                 0.0       1.0
 1             45_Ethyne-Pentane_1_y_+30   1                 0.0       1.0
 1             45_Ethyne-Pentane_1_z_-30   1                 0.0       1.0
 1             45_Ethyne-Pentane_1_z_+30   1                 0.0       1.0
 1             45_Ethyne-Pentane_2_y_-30   1                 0.0       1.0
 1             45_Ethyne-Pentane_2_y_+30   1                 0.0       1.0
 1             45_Ethyne-Pentane_2_z_-30   1                 0.0       1.0
 1             45_Ethyne-Pentane_2_z_+30   1                 0.0       1.0
 1            46_Peptide-Pentane_1_y_-30   1                 0.0       1.0
 1            46_Peptide-Pentane_1_y_+30   1                 0.0       1.0
 1            46_Peptide-Pentane_1_z_-30   1                 0.0       1.0
 1            46_Peptide-Pentane_1_z_+30   1                 0.0       1.0
 1            46_Peptide-Pentane_2_y_-30   1                 0.0       1.0
 1            46_Peptide-Pentane_2_y_+30   1                 0.0       1.0
 1            46_Peptide-Pentane_2_z_-30   1                 0.0       1.0
 1            46_Peptide-Pentane_2_z_+30   1                 0.0       1.0
 1         47_Benzene-Benzene_TS_1_y_-30   1                 0.0       1.0
 1         47_Benzene-Benzene_TS_1_y_+30   1                 0.0       1.0
 1         47_Benzene-Benzene_TS_1_z_-30   1                 0.0       1.0
 1         47_Benzene-Benzene_TS_1_z_+30   1                 0.0       1.0
 1         47_Benzene-Benzene_TS_2_y_-30   1                 0.0       1.0
 1         47_Benzene-Benzene_TS_2_y_+30   1                 0.0       1.0
 1         47_Benzene-Benzene_TS_2_z_-30   1                 0.0       1.0
 1         47_Benzene-Benzene_TS_2_z_+30   1                 0.0       1.0
 1       48_Pyridine-Pyridine_TS_1_y_-30   1                 0.0       1.0
 1       48_Pyridine-Pyridine_TS_1_y_+30   1                 0.0       1.0
 1       48_Pyridine-Pyridine_TS_1_z_-30   1                 0.0       1.0
 1       48_Pyridine-Pyridine_TS_1_z_+30   1                 0.0       1.0
 1       48_Pyridine-Pyridine_TS_2_y_-30   1                 0.0       1.0
 1       48_Pyridine-Pyridine_TS_2_y_+30   1                 0.0       1.0
 1       48_Pyridine-Pyridine_TS_2_z_-30   1                 0.0       1.0
 1       48_Pyridine-Pyridine_TS_2_z_+30   1                 0.0       1.0
 1        49_Benzene-Pyridine_TS_1_y_-30   1                 0.0       1.0
 1        49_Benzene-Pyridine_TS_1_y_+30   1                 0.0       1.0
 1        49_Benzene-Pyridine_TS_1_z_-30   1                 0.0       1.0
 1        49_Benzene-Pyridine_TS_1_z_+30   1                 0.0       1.0
 1        49_Benzene-Pyridine_TS_2_y_-30   1                 0.0       1.0
 1        49_Benzene-Pyridine_TS_2_y_+30   1                 0.0       1.0
 1        49_Benzene-Pyridine_TS_2_z_-30   1                 0.0       1.0
 1        49_Benzene-Pyridine_TS_2_z_+30   1                 0.0       1.0
 1       50_Benzene-Ethyne_CH-pi_1_y_-30   1                 0.0       1.0
 1       50_Benzene-Ethyne_CH-pi_1_y_+30   1                 0.0       1.0
 1       50_Benzene-Ethyne_CH-pi_1_z_-30   1                 0.0       1.0
 1       50_Benzene-Ethyne_CH-pi_1_z_+30   1                 0.0       1.0
 1       50_Benzene-Ethyne_CH-pi_2_y_-30   1                 0.0       1.0
 1       50_Benzene-Ethyne_CH-pi_2_y_+30   1                 0.0       1.0
 1       50_Benzene-Ethyne_CH-pi_2_z_-30   1                 0.0       1.0
 1       50_Benzene-Ethyne_CH-pi_2_z_+30   1                 0.0       1.0
 1           51_Ethyne-Ethyne_TS_1_y_-30   1                 0.0       1.0
 1           51_Ethyne-Ethyne_TS_1_y_+30   1                 0.0       1.0
 1           51_Ethyne-Ethyne_TS_1_z_-30   1                 0.0       1.0
 1           51_Ethyne-Ethyne_TS_1_z_+30   1                 0.0       1.0
 1           51_Ethyne-Ethyne_TS_2_y_-30   1                 0.0       1.0
 1           51_Ethyne-Ethyne_TS_2_y_+30   1                 0.0       1.0
 1           51_Ethyne-Ethyne_TS_2_z_-30   1                 0.0       1.0
 1           51_Ethyne-Ethyne_TS_2_z_+30   1                 0.0       1.0
 1         52_Benzene-AcOH_OH-pi_1_y_-30   1                 0.0       1.0
 1         52_Benzene-AcOH_OH-pi_1_y_+30   1                 0.0       1.0
 1         52_Benzene-AcOH_OH-pi_1_z_-30   1                 0.0       1.0
 1         52_Benzene-AcOH_OH-pi_1_z_+30   1                 0.0       1.0
 1         52_Benzene-AcOH_OH-pi_2_y_-30   1                 0.0       1.0
 1         52_Benzene-AcOH_OH-pi_2_y_+30   1                 0.0       1.0
 1         52_Benzene-AcOH_OH-pi_2_z_-30   1                 0.0       1.0
 1         52_Benzene-AcOH_OH-pi_2_z_+30   1                 0.0       1.0
 1        53_Benzene-AcNH2_NH-pi_1_y_-30   1                 0.0       1.0
 1        53_Benzene-AcNH2_NH-pi_1_y_+30   1                 0.0       1.0
 1        53_Benzene-AcNH2_NH-pi_1_z_-30   1                 0.0       1.0
 1        53_Benzene-AcNH2_NH-pi_1_z_+30   1                 0.0       1.0
 1        53_Benzene-AcNH2_NH-pi_2_y_-30   1                 0.0       1.0
 1        53_Benzene-AcNH2_NH-pi_2_y_+30   1                 0.0       1.0
 1        53_Benzene-AcNH2_NH-pi_2_z_-30   1                 0.0       1.0
 1        53_Benzene-AcNH2_NH-pi_2_z_+30   1                 0.0       1.0
 1        54_Benzene-Water_OH-pi_1_y_-30   1                 0.0       1.0
 1        54_Benzene-Water_OH-pi_1_y_+30   1                 0.0       1.0
 1        54_Benzene-Water_OH-pi_1_z_-30   1                 0.0       1.0
 1        54_Benzene-Water_OH-pi_1_z_+30   1                 0.0       1.0
 1        54_Benzene-Water_OH-pi_2_y_-30   1                 0.0       1.0
 1        54_Benzene-Water_OH-pi_2_y_+30   1                 0.0       1.0
 1        54_Benzene-Water_OH-pi_2_z_-30   1                 0.0       1.0
 1        54_Benzene-Water_OH-pi_2_z_+30   1                 0.0       1.0
 1         55_Benzene-MeOH_OH-pi_1_y_-30   1                 0.0       1.0
 1         55_Benzene-MeOH_OH-pi_1_y_+30   1                 0.0       1.0
 1         55_Benzene-MeOH_OH-pi_1_z_-30   1                 0.0       1.0
 1         55_Benzene-MeOH_OH-pi_1_z_+30   1                 0.0       1.0
 1         55_Benzene-MeOH_OH-pi_2_y_-30   1                 0.0       1.0
 1         55_Benzene-MeOH_OH-pi_2_y_+30   1                 0.0       1.0
 1         55_Benzene-MeOH_OH-pi_2_z_-30   1                 0.0       1.0
 1         55_Benzene-MeOH_OH-pi_2_z_+30   1                 0.0       1.0
 1        56_Benzene-MeNH2_NH-pi_1_y_-30   1                 0.0       1.0
 1        56_Benzene-MeNH2_NH-pi_1_y_+30   1                 0.0       1.0
 1        56_Benzene-MeNH2_NH-pi_1_z_-30   1                 0.0       1.0
 1        56_Benzene-MeNH2_NH-pi_1_z_+30   1                 0.0       1.0
 1        56_Benzene-MeNH2_NH-pi_2_y_-30   1                 0.0       1.0
 1        56_Benzene-MeNH2_NH-pi_2_y_+30   1                 0.0       1.0
 1        56_Benzene-MeNH2_NH-pi_2_z_-30   1                 0.0       1.0
 1        56_Benzene-MeNH2_NH-pi_2_z_+30   1                 0.0       1.0
 1      57_Benzene-Peptide_NH-pi_1_y_-30   1                 0.0       1.0
 1      57_Benzene-Peptide_NH-pi_1_y_+30   1                 0.0       1.0
 1      57_Benzene-Peptide_NH-pi_1_z_-30   1                 0.0       1.0
 1      57_Benzene-Peptide_NH-pi_1_z_+30   1                 0.0       1.0
 1      57_Benzene-Peptide_NH-pi_2_y_-30   1                 0.0       1.0
 1      57_Benzene-Peptide_NH-pi_2_y_+30   1                 0.0       1.0
 1      57_Benzene-Peptide_NH-pi_2_z_-30   1                 0.0       1.0
 1      57_Benzene-Peptide_NH-pi_2_z_+30   1                 0.0       1.0
 1     58_Pyridine-Pyridine_CH-N_1_y_-30   1                 0.0       1.0
 1     58_Pyridine-Pyridine_CH-N_1_y_+30   1                 0.0       1.0
 1     58_Pyridine-Pyridine_CH-N_1_z_-30   1                 0.0       1.0
 1     58_Pyridine-Pyridine_CH-N_1_z_+30   1                 0.0       1.0
 1     58_Pyridine-Pyridine_CH-N_2_y_-30   1                 0.0       1.0
 1     58_Pyridine-Pyridine_CH-N_2_y_+30   1                 0.0       1.0
 1     58_Pyridine-Pyridine_CH-N_2_z_-30   1                 0.0       1.0
 1     58_Pyridine-Pyridine_CH-N_2_z_+30   1                 0.0       1.0
 1          59_Ethyne-Water_CH-O_1_y_-30   1                 0.0       1.0
 1          59_Ethyne-Water_CH-O_1_y_+30   1                 0.0       1.0
 1          59_Ethyne-Water_CH-O_1_z_-30   1                 0.0       1.0
 1          59_Ethyne-Water_CH-O_1_z_+30   1                 0.0       1.0
 1          59_Ethyne-Water_CH-O_2_y_-30   1                 0.0       1.0
 1          59_Ethyne-Water_CH-O_2_y_+30   1                 0.0       1.0
 1          59_Ethyne-Water_CH-O_2_z_-30   1                 0.0       1.0
 1          59_Ethyne-Water_CH-O_2_z_+30   1                 0.0       1.0
 1          60_Ethyne-AcOH_OH-pi_1_y_-30   1                 0.0       1.0
 1          60_Ethyne-AcOH_OH-pi_1_y_+30   1                 0.0       1.0
 1          60_Ethyne-AcOH_OH-pi_1_z_-30   1                 0.0       1.0
 1          60_Ethyne-AcOH_OH-pi_1_z_+30   1                 0.0       1.0
 1          60_Ethyne-AcOH_OH-pi_2_y_-30   1                 0.0       1.0
 1          60_Ethyne-AcOH_OH-pi_2_y_+30   1                 0.0       1.0
 1          60_Ethyne-AcOH_OH-pi_2_z_-30   1                 0.0       1.0
 1          60_Ethyne-AcOH_OH-pi_2_z_+30   1                 0.0       1.0
 1               61_Pentane-AcOH_1_y_-30   1                 0.0       1.0
 1               61_Pentane-AcOH_1_y_+30   1                 0.0       1.0
 1               61_Pentane-AcOH_1_z_-30   1                 0.0       1.0
 1               61_Pentane-AcOH_1_z_+30   1                 0.0       1.0
 1               61_Pentane-AcOH_2_y_-30   1                 0.0       1.0
 1               61_Pentane-AcOH_2_y_+30   1                 0.0       1.0
 1               61_Pentane-AcOH_2_z_-30   1                 0.0       1.0
 1               61_Pentane-AcOH_2_z_+30   1                 0.0       1.0
 1              62_Pentane-AcNH2_1_y_-30   1                 0.0       1.0
 1              62_Pentane-AcNH2_1_y_+30   1                 0.0       1.0
 1              62_Pentane-AcNH2_1_z_-30   1                 0.0       1.0
 1              62_Pentane-AcNH2_1_z_+30   1                 0.0       1.0
 1              62_Pentane-AcNH2_2_y_-30   1                 0.0       1.0
 1              62_Pentane-AcNH2_2_y_+30   1                 0.0       1.0
 1              62_Pentane-AcNH2_2_z_-30   1                 0.0       1.0
 1              62_Pentane-AcNH2_2_z_+30   1                 0.0       1.0
 1               63_Benzene-AcOH_1_y_-30   1                 0.0       1.0
 1               63_Benzene-AcOH_1_y_+30   1                 0.0       1.0
 1               63_Benzene-AcOH_1_z_-30   1                 0.0       1.0
 1               63_Benzene-AcOH_1_z_+30   1                 0.0       1.0
 1               63_Benzene-AcOH_2_y_-30   1                 0.0       1.0
 1               63_Benzene-AcOH_2_y_+30   1                 0.0       1.0
 1               63_Benzene-AcOH_2_z_-30   1                 0.0       1.0
 1               63_Benzene-AcOH_2_z_+30   1                 0.0       1.0
 1             64_Peptide-Ethene_1_y_-30   1                 0.0       1.0
 1             64_Peptide-Ethene_1_y_+30   1                 0.0       1.0
 1             64_Peptide-Ethene_1_z_-30   1                 0.0       1.0
 1             64_Peptide-Ethene_1_z_+30   1                 0.0       1.0
 1             64_Peptide-Ethene_2_y_-30   1                 0.0       1.0
 1             64_Peptide-Ethene_2_y_+30   1                 0.0       1.0
 1             64_Peptide-Ethene_2_z_-30   1                 0.0       1.0
 1             64_Peptide-Ethene_2_z_+30   1                 0.0       1.0
 1            65_Pyridine-Ethyne_1_y_-30   1                 0.0       1.0
 1            65_Pyridine-Ethyne_1_y_+30   1                 0.0       1.0
 1            65_Pyridine-Ethyne_1_z_-30   1                 0.0       1.0
 1            65_Pyridine-Ethyne_1_z_+30   1                 0.0       1.0
 1            65_Pyridine-Ethyne_2_y_-30   1                 0.0       1.0
 1            65_Pyridine-Ethyne_2_y_+30   1                 0.0       1.0
 1            65_Pyridine-Ethyne_2_z_-30   1                 0.0       1.0
 1            65_Pyridine-Ethyne_2_z_+30   1                 0.0       1.0
 1             66_MeNH2-Pyridine_1_y_-30   1                 0.0       1.0
 1             66_MeNH2-Pyridine_1_y_+30   1                 0.0       1.0
 1             66_MeNH2-Pyridine_1_z_-30   1                 0.0       1.0
 1             66_MeNH2-Pyridine_1_z_+30   1                 0.0       1.0
 1             66_MeNH2-Pyridine_2_y_-30   1                 0.0       1.0
 1             66_MeNH2-Pyridine_2_y_+30   1                 0.0       1.0
 1             66_MeNH2-Pyridine_2_z_-30   1                 0.0       1.0
 1             66_MeNH2-Pyridine_2_z_+30   1                 0.0       1.0
