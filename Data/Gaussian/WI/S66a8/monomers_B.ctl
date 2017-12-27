# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"                 "ProjCtrl"      "ProjTool"
__project__ ::   ./S66a8_monomers_B        2               Gaussian

# The project description
__title__ ::
"========================== S66a8-monomers_B ============================"
"This is the set of S66a8 from JCTC 2011 7 3466 (Hobza)                  "
"========================================================================"

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) Scf=Tight


# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .


# The molecular set to batch: 
#             528 is the total number of jobs in this batch list
__batch__ :: 528
#"Flag"         i                        "DIR"                          "InpName"                        "JobType"
                01_Water-Water_1_y_-30   <PATH1>/monomers_B                 01_Water-Water_1_y_-30.com   energy
                01_Water-Water_1_y_+30   <PATH1>/monomers_B                 01_Water-Water_1_y_+30.com   energy
                01_Water-Water_1_z_-30   <PATH1>/monomers_B                 01_Water-Water_1_z_-30.com   energy
                01_Water-Water_1_z_+30   <PATH1>/monomers_B                 01_Water-Water_1_z_+30.com   energy
                01_Water-Water_2_y_-30   <PATH1>/monomers_B                 01_Water-Water_2_y_-30.com   energy
                01_Water-Water_2_y_+30   <PATH1>/monomers_B                 01_Water-Water_2_y_+30.com   energy
                01_Water-Water_2_z_-30   <PATH1>/monomers_B                 01_Water-Water_2_z_-30.com   energy
                01_Water-Water_2_z_+30   <PATH1>/monomers_B                 01_Water-Water_2_z_+30.com   energy
                 02_Water-MeOH_1_y_-30   <PATH1>/monomers_B                  02_Water-MeOH_1_y_-30.com   energy
                 02_Water-MeOH_1_y_+30   <PATH1>/monomers_B                  02_Water-MeOH_1_y_+30.com   energy
                 02_Water-MeOH_1_z_-30   <PATH1>/monomers_B                  02_Water-MeOH_1_z_-30.com   energy
                 02_Water-MeOH_1_z_+30   <PATH1>/monomers_B                  02_Water-MeOH_1_z_+30.com   energy
                 02_Water-MeOH_2_y_-30   <PATH1>/monomers_B                  02_Water-MeOH_2_y_-30.com   energy
                 02_Water-MeOH_2_y_+30   <PATH1>/monomers_B                  02_Water-MeOH_2_y_+30.com   energy
                 02_Water-MeOH_2_z_-30   <PATH1>/monomers_B                  02_Water-MeOH_2_z_-30.com   energy
                 02_Water-MeOH_2_z_+30   <PATH1>/monomers_B                  02_Water-MeOH_2_z_+30.com   energy
                03_Water-MeNH2_1_y_-30   <PATH1>/monomers_B                 03_Water-MeNH2_1_y_-30.com   energy
                03_Water-MeNH2_1_y_+30   <PATH1>/monomers_B                 03_Water-MeNH2_1_y_+30.com   energy
                03_Water-MeNH2_1_z_-30   <PATH1>/monomers_B                 03_Water-MeNH2_1_z_-30.com   energy
                03_Water-MeNH2_1_z_+30   <PATH1>/monomers_B                 03_Water-MeNH2_1_z_+30.com   energy
                03_Water-MeNH2_2_y_-30   <PATH1>/monomers_B                 03_Water-MeNH2_2_y_-30.com   energy
                03_Water-MeNH2_2_y_+30   <PATH1>/monomers_B                 03_Water-MeNH2_2_y_+30.com   energy
                03_Water-MeNH2_2_z_-30   <PATH1>/monomers_B                 03_Water-MeNH2_2_z_-30.com   energy
                03_Water-MeNH2_2_z_+30   <PATH1>/monomers_B                 03_Water-MeNH2_2_z_+30.com   energy
              04_Water-Peptide_1_y_-30   <PATH1>/monomers_B               04_Water-Peptide_1_y_-30.com   energy
              04_Water-Peptide_1_y_+30   <PATH1>/monomers_B               04_Water-Peptide_1_y_+30.com   energy
              04_Water-Peptide_1_z_-30   <PATH1>/monomers_B               04_Water-Peptide_1_z_-30.com   energy
              04_Water-Peptide_1_z_+30   <PATH1>/monomers_B               04_Water-Peptide_1_z_+30.com   energy
              04_Water-Peptide_2_y_-30   <PATH1>/monomers_B               04_Water-Peptide_2_y_-30.com   energy
              04_Water-Peptide_2_y_+30   <PATH1>/monomers_B               04_Water-Peptide_2_y_+30.com   energy
              04_Water-Peptide_2_z_-30   <PATH1>/monomers_B               04_Water-Peptide_2_z_-30.com   energy
              04_Water-Peptide_2_z_+30   <PATH1>/monomers_B               04_Water-Peptide_2_z_+30.com   energy
                  05_MeOH-MeOH_1_y_-30   <PATH1>/monomers_B                   05_MeOH-MeOH_1_y_-30.com   energy
                  05_MeOH-MeOH_1_y_+30   <PATH1>/monomers_B                   05_MeOH-MeOH_1_y_+30.com   energy
                  05_MeOH-MeOH_1_z_-30   <PATH1>/monomers_B                   05_MeOH-MeOH_1_z_-30.com   energy
                  05_MeOH-MeOH_1_z_+30   <PATH1>/monomers_B                   05_MeOH-MeOH_1_z_+30.com   energy
                  05_MeOH-MeOH_2_y_-30   <PATH1>/monomers_B                   05_MeOH-MeOH_2_y_-30.com   energy
                  05_MeOH-MeOH_2_y_+30   <PATH1>/monomers_B                   05_MeOH-MeOH_2_y_+30.com   energy
                  05_MeOH-MeOH_2_z_-30   <PATH1>/monomers_B                   05_MeOH-MeOH_2_z_-30.com   energy
                  05_MeOH-MeOH_2_z_+30   <PATH1>/monomers_B                   05_MeOH-MeOH_2_z_+30.com   energy
                 06_MeOH-MeNH2_1_y_-30   <PATH1>/monomers_B                  06_MeOH-MeNH2_1_y_-30.com   energy
                 06_MeOH-MeNH2_1_y_+30   <PATH1>/monomers_B                  06_MeOH-MeNH2_1_y_+30.com   energy
                 06_MeOH-MeNH2_1_z_-30   <PATH1>/monomers_B                  06_MeOH-MeNH2_1_z_-30.com   energy
                 06_MeOH-MeNH2_1_z_+30   <PATH1>/monomers_B                  06_MeOH-MeNH2_1_z_+30.com   energy
                 06_MeOH-MeNH2_2_y_-30   <PATH1>/monomers_B                  06_MeOH-MeNH2_2_y_-30.com   energy
                 06_MeOH-MeNH2_2_y_+30   <PATH1>/monomers_B                  06_MeOH-MeNH2_2_y_+30.com   energy
                 06_MeOH-MeNH2_2_z_-30   <PATH1>/monomers_B                  06_MeOH-MeNH2_2_z_-30.com   energy
                 06_MeOH-MeNH2_2_z_+30   <PATH1>/monomers_B                  06_MeOH-MeNH2_2_z_+30.com   energy
               07_MeOH-Peptide_1_y_-30   <PATH1>/monomers_B                07_MeOH-Peptide_1_y_-30.com   energy
               07_MeOH-Peptide_1_y_+30   <PATH1>/monomers_B                07_MeOH-Peptide_1_y_+30.com   energy
               07_MeOH-Peptide_1_z_-30   <PATH1>/monomers_B                07_MeOH-Peptide_1_z_-30.com   energy
               07_MeOH-Peptide_1_z_+30   <PATH1>/monomers_B                07_MeOH-Peptide_1_z_+30.com   energy
               07_MeOH-Peptide_2_y_-30   <PATH1>/monomers_B                07_MeOH-Peptide_2_y_-30.com   energy
               07_MeOH-Peptide_2_y_+30   <PATH1>/monomers_B                07_MeOH-Peptide_2_y_+30.com   energy
               07_MeOH-Peptide_2_z_-30   <PATH1>/monomers_B                07_MeOH-Peptide_2_z_-30.com   energy
               07_MeOH-Peptide_2_z_+30   <PATH1>/monomers_B                07_MeOH-Peptide_2_z_+30.com   energy
                 08_MeOH-Water_1_y_-30   <PATH1>/monomers_B                  08_MeOH-Water_1_y_-30.com   energy
                 08_MeOH-Water_1_y_+30   <PATH1>/monomers_B                  08_MeOH-Water_1_y_+30.com   energy
                 08_MeOH-Water_1_z_-30   <PATH1>/monomers_B                  08_MeOH-Water_1_z_-30.com   energy
                 08_MeOH-Water_1_z_+30   <PATH1>/monomers_B                  08_MeOH-Water_1_z_+30.com   energy
                 08_MeOH-Water_2_y_-30   <PATH1>/monomers_B                  08_MeOH-Water_2_y_-30.com   energy
                 08_MeOH-Water_2_y_+30   <PATH1>/monomers_B                  08_MeOH-Water_2_y_+30.com   energy
                 08_MeOH-Water_2_z_-30   <PATH1>/monomers_B                  08_MeOH-Water_2_z_-30.com   energy
                 08_MeOH-Water_2_z_+30   <PATH1>/monomers_B                  08_MeOH-Water_2_z_+30.com   energy
                 09_MeNH2-MeOH_1_y_-30   <PATH1>/monomers_B                  09_MeNH2-MeOH_1_y_-30.com   energy
                 09_MeNH2-MeOH_1_y_+30   <PATH1>/monomers_B                  09_MeNH2-MeOH_1_y_+30.com   energy
                 09_MeNH2-MeOH_1_z_-30   <PATH1>/monomers_B                  09_MeNH2-MeOH_1_z_-30.com   energy
                 09_MeNH2-MeOH_1_z_+30   <PATH1>/monomers_B                  09_MeNH2-MeOH_1_z_+30.com   energy
                 09_MeNH2-MeOH_2_y_-30   <PATH1>/monomers_B                  09_MeNH2-MeOH_2_y_-30.com   energy
                 09_MeNH2-MeOH_2_y_+30   <PATH1>/monomers_B                  09_MeNH2-MeOH_2_y_+30.com   energy
                 09_MeNH2-MeOH_2_z_-30   <PATH1>/monomers_B                  09_MeNH2-MeOH_2_z_-30.com   energy
                 09_MeNH2-MeOH_2_z_+30   <PATH1>/monomers_B                  09_MeNH2-MeOH_2_z_+30.com   energy
                10_MeNH2-MeNH2_1_y_-30   <PATH1>/monomers_B                 10_MeNH2-MeNH2_1_y_-30.com   energy
                10_MeNH2-MeNH2_1_y_+30   <PATH1>/monomers_B                 10_MeNH2-MeNH2_1_y_+30.com   energy
                10_MeNH2-MeNH2_1_z_-30   <PATH1>/monomers_B                 10_MeNH2-MeNH2_1_z_-30.com   energy
                10_MeNH2-MeNH2_1_z_+30   <PATH1>/monomers_B                 10_MeNH2-MeNH2_1_z_+30.com   energy
                10_MeNH2-MeNH2_2_y_-30   <PATH1>/monomers_B                 10_MeNH2-MeNH2_2_y_-30.com   energy
                10_MeNH2-MeNH2_2_y_+30   <PATH1>/monomers_B                 10_MeNH2-MeNH2_2_y_+30.com   energy
                10_MeNH2-MeNH2_2_z_-30   <PATH1>/monomers_B                 10_MeNH2-MeNH2_2_z_-30.com   energy
                10_MeNH2-MeNH2_2_z_+30   <PATH1>/monomers_B                 10_MeNH2-MeNH2_2_z_+30.com   energy
              11_MeNH2-Peptide_1_y_-30   <PATH1>/monomers_B               11_MeNH2-Peptide_1_y_-30.com   energy
              11_MeNH2-Peptide_1_y_+30   <PATH1>/monomers_B               11_MeNH2-Peptide_1_y_+30.com   energy
              11_MeNH2-Peptide_1_z_-30   <PATH1>/monomers_B               11_MeNH2-Peptide_1_z_-30.com   energy
              11_MeNH2-Peptide_1_z_+30   <PATH1>/monomers_B               11_MeNH2-Peptide_1_z_+30.com   energy
              11_MeNH2-Peptide_2_y_-30   <PATH1>/monomers_B               11_MeNH2-Peptide_2_y_-30.com   energy
              11_MeNH2-Peptide_2_y_+30   <PATH1>/monomers_B               11_MeNH2-Peptide_2_y_+30.com   energy
              11_MeNH2-Peptide_2_z_-30   <PATH1>/monomers_B               11_MeNH2-Peptide_2_z_-30.com   energy
              11_MeNH2-Peptide_2_z_+30   <PATH1>/monomers_B               11_MeNH2-Peptide_2_z_+30.com   energy
                12_MeNH2-Water_1_y_-30   <PATH1>/monomers_B                 12_MeNH2-Water_1_y_-30.com   energy
                12_MeNH2-Water_1_y_+30   <PATH1>/monomers_B                 12_MeNH2-Water_1_y_+30.com   energy
                12_MeNH2-Water_1_z_-30   <PATH1>/monomers_B                 12_MeNH2-Water_1_z_-30.com   energy
                12_MeNH2-Water_1_z_+30   <PATH1>/monomers_B                 12_MeNH2-Water_1_z_+30.com   energy
                12_MeNH2-Water_2_y_-30   <PATH1>/monomers_B                 12_MeNH2-Water_2_y_-30.com   energy
                12_MeNH2-Water_2_y_+30   <PATH1>/monomers_B                 12_MeNH2-Water_2_y_+30.com   energy
                12_MeNH2-Water_2_z_-30   <PATH1>/monomers_B                 12_MeNH2-Water_2_z_-30.com   energy
                12_MeNH2-Water_2_z_+30   <PATH1>/monomers_B                 12_MeNH2-Water_2_z_+30.com   energy
               13_Peptide-MeOH_1_y_-30   <PATH1>/monomers_B                13_Peptide-MeOH_1_y_-30.com   energy
               13_Peptide-MeOH_1_y_+30   <PATH1>/monomers_B                13_Peptide-MeOH_1_y_+30.com   energy
               13_Peptide-MeOH_1_z_-30   <PATH1>/monomers_B                13_Peptide-MeOH_1_z_-30.com   energy
               13_Peptide-MeOH_1_z_+30   <PATH1>/monomers_B                13_Peptide-MeOH_1_z_+30.com   energy
               13_Peptide-MeOH_2_y_-30   <PATH1>/monomers_B                13_Peptide-MeOH_2_y_-30.com   energy
               13_Peptide-MeOH_2_y_+30   <PATH1>/monomers_B                13_Peptide-MeOH_2_y_+30.com   energy
               13_Peptide-MeOH_2_z_-30   <PATH1>/monomers_B                13_Peptide-MeOH_2_z_-30.com   energy
               13_Peptide-MeOH_2_z_+30   <PATH1>/monomers_B                13_Peptide-MeOH_2_z_+30.com   energy
              14_Peptide-MeNH2_1_y_-30   <PATH1>/monomers_B               14_Peptide-MeNH2_1_y_-30.com   energy
              14_Peptide-MeNH2_1_y_+30   <PATH1>/monomers_B               14_Peptide-MeNH2_1_y_+30.com   energy
              14_Peptide-MeNH2_1_z_-30   <PATH1>/monomers_B               14_Peptide-MeNH2_1_z_-30.com   energy
              14_Peptide-MeNH2_1_z_+30   <PATH1>/monomers_B               14_Peptide-MeNH2_1_z_+30.com   energy
              14_Peptide-MeNH2_2_y_-30   <PATH1>/monomers_B               14_Peptide-MeNH2_2_y_-30.com   energy
              14_Peptide-MeNH2_2_y_+30   <PATH1>/monomers_B               14_Peptide-MeNH2_2_y_+30.com   energy
              14_Peptide-MeNH2_2_z_-30   <PATH1>/monomers_B               14_Peptide-MeNH2_2_z_-30.com   energy
              14_Peptide-MeNH2_2_z_+30   <PATH1>/monomers_B               14_Peptide-MeNH2_2_z_+30.com   energy
            15_Peptide-Peptide_1_y_-30   <PATH1>/monomers_B             15_Peptide-Peptide_1_y_-30.com   energy
            15_Peptide-Peptide_1_y_+30   <PATH1>/monomers_B             15_Peptide-Peptide_1_y_+30.com   energy
            15_Peptide-Peptide_1_z_-30   <PATH1>/monomers_B             15_Peptide-Peptide_1_z_-30.com   energy
            15_Peptide-Peptide_1_z_+30   <PATH1>/monomers_B             15_Peptide-Peptide_1_z_+30.com   energy
            15_Peptide-Peptide_2_y_-30   <PATH1>/monomers_B             15_Peptide-Peptide_2_y_-30.com   energy
            15_Peptide-Peptide_2_y_+30   <PATH1>/monomers_B             15_Peptide-Peptide_2_y_+30.com   energy
            15_Peptide-Peptide_2_z_-30   <PATH1>/monomers_B             15_Peptide-Peptide_2_z_-30.com   energy
            15_Peptide-Peptide_2_z_+30   <PATH1>/monomers_B             15_Peptide-Peptide_2_z_+30.com   energy
              16_Peptide-Water_1_y_-30   <PATH1>/monomers_B               16_Peptide-Water_1_y_-30.com   energy
              16_Peptide-Water_1_y_+30   <PATH1>/monomers_B               16_Peptide-Water_1_y_+30.com   energy
              16_Peptide-Water_1_z_-30   <PATH1>/monomers_B               16_Peptide-Water_1_z_-30.com   energy
              16_Peptide-Water_1_z_+30   <PATH1>/monomers_B               16_Peptide-Water_1_z_+30.com   energy
              16_Peptide-Water_2_y_-30   <PATH1>/monomers_B               16_Peptide-Water_2_y_-30.com   energy
              16_Peptide-Water_2_y_+30   <PATH1>/monomers_B               16_Peptide-Water_2_y_+30.com   energy
              16_Peptide-Water_2_z_-30   <PATH1>/monomers_B               16_Peptide-Water_2_z_-30.com   energy
              16_Peptide-Water_2_z_+30   <PATH1>/monomers_B               16_Peptide-Water_2_z_+30.com   energy
           17_Uracil-Uracil_BP_1_y_-30   <PATH1>/monomers_B            17_Uracil-Uracil_BP_1_y_-30.com   energy
           17_Uracil-Uracil_BP_1_y_+30   <PATH1>/monomers_B            17_Uracil-Uracil_BP_1_y_+30.com   energy
           17_Uracil-Uracil_BP_1_z_-30   <PATH1>/monomers_B            17_Uracil-Uracil_BP_1_z_-30.com   energy
           17_Uracil-Uracil_BP_1_z_+30   <PATH1>/monomers_B            17_Uracil-Uracil_BP_1_z_+30.com   energy
           17_Uracil-Uracil_BP_2_y_-30   <PATH1>/monomers_B            17_Uracil-Uracil_BP_2_y_-30.com   energy
           17_Uracil-Uracil_BP_2_y_+30   <PATH1>/monomers_B            17_Uracil-Uracil_BP_2_y_+30.com   energy
           17_Uracil-Uracil_BP_2_z_-30   <PATH1>/monomers_B            17_Uracil-Uracil_BP_2_z_-30.com   energy
           17_Uracil-Uracil_BP_2_z_+30   <PATH1>/monomers_B            17_Uracil-Uracil_BP_2_z_+30.com   energy
             18_Water-Pyridine_1_y_-30   <PATH1>/monomers_B              18_Water-Pyridine_1_y_-30.com   energy
             18_Water-Pyridine_1_y_+30   <PATH1>/monomers_B              18_Water-Pyridine_1_y_+30.com   energy
             18_Water-Pyridine_1_z_-30   <PATH1>/monomers_B              18_Water-Pyridine_1_z_-30.com   energy
             18_Water-Pyridine_1_z_+30   <PATH1>/monomers_B              18_Water-Pyridine_1_z_+30.com   energy
             18_Water-Pyridine_2_y_-30   <PATH1>/monomers_B              18_Water-Pyridine_2_y_-30.com   energy
             18_Water-Pyridine_2_y_+30   <PATH1>/monomers_B              18_Water-Pyridine_2_y_+30.com   energy
             18_Water-Pyridine_2_z_-30   <PATH1>/monomers_B              18_Water-Pyridine_2_z_-30.com   energy
             18_Water-Pyridine_2_z_+30   <PATH1>/monomers_B              18_Water-Pyridine_2_z_+30.com   energy
              19_MeOH-Pyridine_1_y_-30   <PATH1>/monomers_B               19_MeOH-Pyridine_1_y_-30.com   energy
              19_MeOH-Pyridine_1_y_+30   <PATH1>/monomers_B               19_MeOH-Pyridine_1_y_+30.com   energy
              19_MeOH-Pyridine_1_z_-30   <PATH1>/monomers_B               19_MeOH-Pyridine_1_z_-30.com   energy
              19_MeOH-Pyridine_1_z_+30   <PATH1>/monomers_B               19_MeOH-Pyridine_1_z_+30.com   energy
              19_MeOH-Pyridine_2_y_-30   <PATH1>/monomers_B               19_MeOH-Pyridine_2_y_-30.com   energy
              19_MeOH-Pyridine_2_y_+30   <PATH1>/monomers_B               19_MeOH-Pyridine_2_y_+30.com   energy
              19_MeOH-Pyridine_2_z_-30   <PATH1>/monomers_B               19_MeOH-Pyridine_2_z_-30.com   energy
              19_MeOH-Pyridine_2_z_+30   <PATH1>/monomers_B               19_MeOH-Pyridine_2_z_+30.com   energy
                  20_AcOH-AcOH_1_y_-30   <PATH1>/monomers_B                   20_AcOH-AcOH_1_y_-30.com   energy
                  20_AcOH-AcOH_1_y_+30   <PATH1>/monomers_B                   20_AcOH-AcOH_1_y_+30.com   energy
                  20_AcOH-AcOH_1_z_-30   <PATH1>/monomers_B                   20_AcOH-AcOH_1_z_-30.com   energy
                  20_AcOH-AcOH_1_z_+30   <PATH1>/monomers_B                   20_AcOH-AcOH_1_z_+30.com   energy
                  20_AcOH-AcOH_2_y_-30   <PATH1>/monomers_B                   20_AcOH-AcOH_2_y_-30.com   energy
                  20_AcOH-AcOH_2_y_+30   <PATH1>/monomers_B                   20_AcOH-AcOH_2_y_+30.com   energy
                  20_AcOH-AcOH_2_z_-30   <PATH1>/monomers_B                   20_AcOH-AcOH_2_z_-30.com   energy
                  20_AcOH-AcOH_2_z_+30   <PATH1>/monomers_B                   20_AcOH-AcOH_2_z_+30.com   energy
                21_AcNH2-AcNH2_1_y_-30   <PATH1>/monomers_B                 21_AcNH2-AcNH2_1_y_-30.com   energy
                21_AcNH2-AcNH2_1_y_+30   <PATH1>/monomers_B                 21_AcNH2-AcNH2_1_y_+30.com   energy
                21_AcNH2-AcNH2_1_z_-30   <PATH1>/monomers_B                 21_AcNH2-AcNH2_1_z_-30.com   energy
                21_AcNH2-AcNH2_1_z_+30   <PATH1>/monomers_B                 21_AcNH2-AcNH2_1_z_+30.com   energy
                21_AcNH2-AcNH2_2_y_-30   <PATH1>/monomers_B                 21_AcNH2-AcNH2_2_y_-30.com   energy
                21_AcNH2-AcNH2_2_y_+30   <PATH1>/monomers_B                 21_AcNH2-AcNH2_2_y_+30.com   energy
                21_AcNH2-AcNH2_2_z_-30   <PATH1>/monomers_B                 21_AcNH2-AcNH2_2_z_-30.com   energy
                21_AcNH2-AcNH2_2_z_+30   <PATH1>/monomers_B                 21_AcNH2-AcNH2_2_z_+30.com   energy
                22_AcOH-Uracil_1_y_-30   <PATH1>/monomers_B                 22_AcOH-Uracil_1_y_-30.com   energy
                22_AcOH-Uracil_1_y_+30   <PATH1>/monomers_B                 22_AcOH-Uracil_1_y_+30.com   energy
                22_AcOH-Uracil_1_z_-30   <PATH1>/monomers_B                 22_AcOH-Uracil_1_z_-30.com   energy
                22_AcOH-Uracil_1_z_+30   <PATH1>/monomers_B                 22_AcOH-Uracil_1_z_+30.com   energy
                22_AcOH-Uracil_2_y_-30   <PATH1>/monomers_B                 22_AcOH-Uracil_2_y_-30.com   energy
                22_AcOH-Uracil_2_y_+30   <PATH1>/monomers_B                 22_AcOH-Uracil_2_y_+30.com   energy
                22_AcOH-Uracil_2_z_-30   <PATH1>/monomers_B                 22_AcOH-Uracil_2_z_-30.com   energy
                22_AcOH-Uracil_2_z_+30   <PATH1>/monomers_B                 22_AcOH-Uracil_2_z_+30.com   energy
               23_AcNH2-Uracil_1_y_-30   <PATH1>/monomers_B                23_AcNH2-Uracil_1_y_-30.com   energy
               23_AcNH2-Uracil_1_y_+30   <PATH1>/monomers_B                23_AcNH2-Uracil_1_y_+30.com   energy
               23_AcNH2-Uracil_1_z_-30   <PATH1>/monomers_B                23_AcNH2-Uracil_1_z_-30.com   energy
               23_AcNH2-Uracil_1_z_+30   <PATH1>/monomers_B                23_AcNH2-Uracil_1_z_+30.com   energy
               23_AcNH2-Uracil_2_y_-30   <PATH1>/monomers_B                23_AcNH2-Uracil_2_y_-30.com   energy
               23_AcNH2-Uracil_2_y_+30   <PATH1>/monomers_B                23_AcNH2-Uracil_2_y_+30.com   energy
               23_AcNH2-Uracil_2_z_-30   <PATH1>/monomers_B                23_AcNH2-Uracil_2_z_-30.com   energy
               23_AcNH2-Uracil_2_z_+30   <PATH1>/monomers_B                23_AcNH2-Uracil_2_z_+30.com   energy
      24_Benzene-Benzene_pi-pi_1_y_-30   <PATH1>/monomers_B       24_Benzene-Benzene_pi-pi_1_y_-30.com   energy
      24_Benzene-Benzene_pi-pi_1_y_+30   <PATH1>/monomers_B       24_Benzene-Benzene_pi-pi_1_y_+30.com   energy
      24_Benzene-Benzene_pi-pi_1_z_-30   <PATH1>/monomers_B       24_Benzene-Benzene_pi-pi_1_z_-30.com   energy
      24_Benzene-Benzene_pi-pi_1_z_+30   <PATH1>/monomers_B       24_Benzene-Benzene_pi-pi_1_z_+30.com   energy
      24_Benzene-Benzene_pi-pi_2_y_-30   <PATH1>/monomers_B       24_Benzene-Benzene_pi-pi_2_y_-30.com   energy
      24_Benzene-Benzene_pi-pi_2_y_+30   <PATH1>/monomers_B       24_Benzene-Benzene_pi-pi_2_y_+30.com   energy
      24_Benzene-Benzene_pi-pi_2_z_-30   <PATH1>/monomers_B       24_Benzene-Benzene_pi-pi_2_z_-30.com   energy
      24_Benzene-Benzene_pi-pi_2_z_+30   <PATH1>/monomers_B       24_Benzene-Benzene_pi-pi_2_z_+30.com   energy
    25_Pyridine-Pyridine_pi-pi_1_y_-30   <PATH1>/monomers_B     25_Pyridine-Pyridine_pi-pi_1_y_-30.com   energy
    25_Pyridine-Pyridine_pi-pi_1_y_+30   <PATH1>/monomers_B     25_Pyridine-Pyridine_pi-pi_1_y_+30.com   energy
    25_Pyridine-Pyridine_pi-pi_1_z_-30   <PATH1>/monomers_B     25_Pyridine-Pyridine_pi-pi_1_z_-30.com   energy
    25_Pyridine-Pyridine_pi-pi_1_z_+30   <PATH1>/monomers_B     25_Pyridine-Pyridine_pi-pi_1_z_+30.com   energy
    25_Pyridine-Pyridine_pi-pi_2_y_-30   <PATH1>/monomers_B     25_Pyridine-Pyridine_pi-pi_2_y_-30.com   energy
    25_Pyridine-Pyridine_pi-pi_2_y_+30   <PATH1>/monomers_B     25_Pyridine-Pyridine_pi-pi_2_y_+30.com   energy
    25_Pyridine-Pyridine_pi-pi_2_z_-30   <PATH1>/monomers_B     25_Pyridine-Pyridine_pi-pi_2_z_-30.com   energy
    25_Pyridine-Pyridine_pi-pi_2_z_+30   <PATH1>/monomers_B     25_Pyridine-Pyridine_pi-pi_2_z_+30.com   energy
        26_Uracil-Uracil_pi-pi_1_y_-30   <PATH1>/monomers_B         26_Uracil-Uracil_pi-pi_1_y_-30.com   energy
        26_Uracil-Uracil_pi-pi_1_y_+30   <PATH1>/monomers_B         26_Uracil-Uracil_pi-pi_1_y_+30.com   energy
        26_Uracil-Uracil_pi-pi_1_z_-30   <PATH1>/monomers_B         26_Uracil-Uracil_pi-pi_1_z_-30.com   energy
        26_Uracil-Uracil_pi-pi_1_z_+30   <PATH1>/monomers_B         26_Uracil-Uracil_pi-pi_1_z_+30.com   energy
        26_Uracil-Uracil_pi-pi_2_y_-30   <PATH1>/monomers_B         26_Uracil-Uracil_pi-pi_2_y_-30.com   energy
        26_Uracil-Uracil_pi-pi_2_y_+30   <PATH1>/monomers_B         26_Uracil-Uracil_pi-pi_2_y_+30.com   energy
        26_Uracil-Uracil_pi-pi_2_z_-30   <PATH1>/monomers_B         26_Uracil-Uracil_pi-pi_2_z_-30.com   energy
        26_Uracil-Uracil_pi-pi_2_z_+30   <PATH1>/monomers_B         26_Uracil-Uracil_pi-pi_2_z_+30.com   energy
     27_Benzene-Pyridine_pi-pi_1_y_-30   <PATH1>/monomers_B      27_Benzene-Pyridine_pi-pi_1_y_-30.com   energy
     27_Benzene-Pyridine_pi-pi_1_y_+30   <PATH1>/monomers_B      27_Benzene-Pyridine_pi-pi_1_y_+30.com   energy
     27_Benzene-Pyridine_pi-pi_1_z_-30   <PATH1>/monomers_B      27_Benzene-Pyridine_pi-pi_1_z_-30.com   energy
     27_Benzene-Pyridine_pi-pi_1_z_+30   <PATH1>/monomers_B      27_Benzene-Pyridine_pi-pi_1_z_+30.com   energy
     27_Benzene-Pyridine_pi-pi_2_y_-30   <PATH1>/monomers_B      27_Benzene-Pyridine_pi-pi_2_y_-30.com   energy
     27_Benzene-Pyridine_pi-pi_2_y_+30   <PATH1>/monomers_B      27_Benzene-Pyridine_pi-pi_2_y_+30.com   energy
     27_Benzene-Pyridine_pi-pi_2_z_-30   <PATH1>/monomers_B      27_Benzene-Pyridine_pi-pi_2_z_-30.com   energy
     27_Benzene-Pyridine_pi-pi_2_z_+30   <PATH1>/monomers_B      27_Benzene-Pyridine_pi-pi_2_z_+30.com   energy
       28_Benzene-Uracil_pi-pi_1_y_-30   <PATH1>/monomers_B        28_Benzene-Uracil_pi-pi_1_y_-30.com   energy
       28_Benzene-Uracil_pi-pi_1_y_+30   <PATH1>/monomers_B        28_Benzene-Uracil_pi-pi_1_y_+30.com   energy
       28_Benzene-Uracil_pi-pi_1_z_-30   <PATH1>/monomers_B        28_Benzene-Uracil_pi-pi_1_z_-30.com   energy
       28_Benzene-Uracil_pi-pi_1_z_+30   <PATH1>/monomers_B        28_Benzene-Uracil_pi-pi_1_z_+30.com   energy
       28_Benzene-Uracil_pi-pi_2_y_-30   <PATH1>/monomers_B        28_Benzene-Uracil_pi-pi_2_y_-30.com   energy
       28_Benzene-Uracil_pi-pi_2_y_+30   <PATH1>/monomers_B        28_Benzene-Uracil_pi-pi_2_y_+30.com   energy
       28_Benzene-Uracil_pi-pi_2_z_-30   <PATH1>/monomers_B        28_Benzene-Uracil_pi-pi_2_z_-30.com   energy
       28_Benzene-Uracil_pi-pi_2_z_+30   <PATH1>/monomers_B        28_Benzene-Uracil_pi-pi_2_z_+30.com   energy
      29_Pyridine-Uracil_pi-pi_1_y_-30   <PATH1>/monomers_B       29_Pyridine-Uracil_pi-pi_1_y_-30.com   energy
      29_Pyridine-Uracil_pi-pi_1_y_+30   <PATH1>/monomers_B       29_Pyridine-Uracil_pi-pi_1_y_+30.com   energy
      29_Pyridine-Uracil_pi-pi_1_z_-30   <PATH1>/monomers_B       29_Pyridine-Uracil_pi-pi_1_z_-30.com   energy
      29_Pyridine-Uracil_pi-pi_1_z_+30   <PATH1>/monomers_B       29_Pyridine-Uracil_pi-pi_1_z_+30.com   energy
      29_Pyridine-Uracil_pi-pi_2_y_-30   <PATH1>/monomers_B       29_Pyridine-Uracil_pi-pi_2_y_-30.com   energy
      29_Pyridine-Uracil_pi-pi_2_y_+30   <PATH1>/monomers_B       29_Pyridine-Uracil_pi-pi_2_y_+30.com   energy
      29_Pyridine-Uracil_pi-pi_2_z_-30   <PATH1>/monomers_B       29_Pyridine-Uracil_pi-pi_2_z_-30.com   energy
      29_Pyridine-Uracil_pi-pi_2_z_+30   <PATH1>/monomers_B       29_Pyridine-Uracil_pi-pi_2_z_+30.com   energy
             30_Benzene-Ethene_1_y_-30   <PATH1>/monomers_B              30_Benzene-Ethene_1_y_-30.com   energy
             30_Benzene-Ethene_1_y_+30   <PATH1>/monomers_B              30_Benzene-Ethene_1_y_+30.com   energy
             30_Benzene-Ethene_1_z_-30   <PATH1>/monomers_B              30_Benzene-Ethene_1_z_-30.com   energy
             30_Benzene-Ethene_1_z_+30   <PATH1>/monomers_B              30_Benzene-Ethene_1_z_+30.com   energy
             30_Benzene-Ethene_2_y_-30   <PATH1>/monomers_B              30_Benzene-Ethene_2_y_-30.com   energy
             30_Benzene-Ethene_2_y_+30   <PATH1>/monomers_B              30_Benzene-Ethene_2_y_+30.com   energy
             30_Benzene-Ethene_2_z_-30   <PATH1>/monomers_B              30_Benzene-Ethene_2_z_-30.com   energy
             30_Benzene-Ethene_2_z_+30   <PATH1>/monomers_B              30_Benzene-Ethene_2_z_+30.com   energy
              31_Uracil-Ethene_1_y_-30   <PATH1>/monomers_B               31_Uracil-Ethene_1_y_-30.com   energy
              31_Uracil-Ethene_1_y_+30   <PATH1>/monomers_B               31_Uracil-Ethene_1_y_+30.com   energy
              31_Uracil-Ethene_1_z_-30   <PATH1>/monomers_B               31_Uracil-Ethene_1_z_-30.com   energy
              31_Uracil-Ethene_1_z_+30   <PATH1>/monomers_B               31_Uracil-Ethene_1_z_+30.com   energy
              31_Uracil-Ethene_2_y_-30   <PATH1>/monomers_B               31_Uracil-Ethene_2_y_-30.com   energy
              31_Uracil-Ethene_2_y_+30   <PATH1>/monomers_B               31_Uracil-Ethene_2_y_+30.com   energy
              31_Uracil-Ethene_2_z_-30   <PATH1>/monomers_B               31_Uracil-Ethene_2_z_-30.com   energy
              31_Uracil-Ethene_2_z_+30   <PATH1>/monomers_B               31_Uracil-Ethene_2_z_+30.com   energy
              32_Uracil-Ethyne_1_y_-30   <PATH1>/monomers_B               32_Uracil-Ethyne_1_y_-30.com   energy
              32_Uracil-Ethyne_1_y_+30   <PATH1>/monomers_B               32_Uracil-Ethyne_1_y_+30.com   energy
              32_Uracil-Ethyne_1_z_-30   <PATH1>/monomers_B               32_Uracil-Ethyne_1_z_-30.com   energy
              32_Uracil-Ethyne_1_z_+30   <PATH1>/monomers_B               32_Uracil-Ethyne_1_z_+30.com   energy
              32_Uracil-Ethyne_2_y_-30   <PATH1>/monomers_B               32_Uracil-Ethyne_2_y_-30.com   energy
              32_Uracil-Ethyne_2_y_+30   <PATH1>/monomers_B               32_Uracil-Ethyne_2_y_+30.com   energy
              32_Uracil-Ethyne_2_z_-30   <PATH1>/monomers_B               32_Uracil-Ethyne_2_z_-30.com   energy
              32_Uracil-Ethyne_2_z_+30   <PATH1>/monomers_B               32_Uracil-Ethyne_2_z_+30.com   energy
            33_Pyridine-Ethene_1_y_-30   <PATH1>/monomers_B             33_Pyridine-Ethene_1_y_-30.com   energy
            33_Pyridine-Ethene_1_y_+30   <PATH1>/monomers_B             33_Pyridine-Ethene_1_y_+30.com   energy
            33_Pyridine-Ethene_1_z_-30   <PATH1>/monomers_B             33_Pyridine-Ethene_1_z_-30.com   energy
            33_Pyridine-Ethene_1_z_+30   <PATH1>/monomers_B             33_Pyridine-Ethene_1_z_+30.com   energy
            33_Pyridine-Ethene_2_y_-30   <PATH1>/monomers_B             33_Pyridine-Ethene_2_y_-30.com   energy
            33_Pyridine-Ethene_2_y_+30   <PATH1>/monomers_B             33_Pyridine-Ethene_2_y_+30.com   energy
            33_Pyridine-Ethene_2_z_-30   <PATH1>/monomers_B             33_Pyridine-Ethene_2_z_-30.com   energy
            33_Pyridine-Ethene_2_z_+30   <PATH1>/monomers_B             33_Pyridine-Ethene_2_z_+30.com   energy
            34_Pentane-Pentane_1_y_-30   <PATH1>/monomers_B             34_Pentane-Pentane_1_y_-30.com   energy
            34_Pentane-Pentane_1_y_+30   <PATH1>/monomers_B             34_Pentane-Pentane_1_y_+30.com   energy
            34_Pentane-Pentane_1_z_-30   <PATH1>/monomers_B             34_Pentane-Pentane_1_z_-30.com   energy
            34_Pentane-Pentane_1_z_+30   <PATH1>/monomers_B             34_Pentane-Pentane_1_z_+30.com   energy
            34_Pentane-Pentane_2_y_-30   <PATH1>/monomers_B             34_Pentane-Pentane_2_y_-30.com   energy
            34_Pentane-Pentane_2_y_+30   <PATH1>/monomers_B             34_Pentane-Pentane_2_y_+30.com   energy
            34_Pentane-Pentane_2_z_-30   <PATH1>/monomers_B             34_Pentane-Pentane_2_z_-30.com   energy
            34_Pentane-Pentane_2_z_+30   <PATH1>/monomers_B             34_Pentane-Pentane_2_z_+30.com   energy
         35_Neopentane-Pentane_1_y_-30   <PATH1>/monomers_B          35_Neopentane-Pentane_1_y_-30.com   energy
         35_Neopentane-Pentane_1_y_+30   <PATH1>/monomers_B          35_Neopentane-Pentane_1_y_+30.com   energy
         35_Neopentane-Pentane_1_z_-30   <PATH1>/monomers_B          35_Neopentane-Pentane_1_z_-30.com   energy
         35_Neopentane-Pentane_1_z_+30   <PATH1>/monomers_B          35_Neopentane-Pentane_1_z_+30.com   energy
         35_Neopentane-Pentane_2_y_-30   <PATH1>/monomers_B          35_Neopentane-Pentane_2_y_-30.com   energy
         35_Neopentane-Pentane_2_y_+30   <PATH1>/monomers_B          35_Neopentane-Pentane_2_y_+30.com   energy
         35_Neopentane-Pentane_2_z_-30   <PATH1>/monomers_B          35_Neopentane-Pentane_2_z_-30.com   energy
         35_Neopentane-Pentane_2_z_+30   <PATH1>/monomers_B          35_Neopentane-Pentane_2_z_+30.com   energy
      36_Neopentane-Neopentane_1_y_-30   <PATH1>/monomers_B       36_Neopentane-Neopentane_1_y_-30.com   energy
      36_Neopentane-Neopentane_1_y_+30   <PATH1>/monomers_B       36_Neopentane-Neopentane_1_y_+30.com   energy
      36_Neopentane-Neopentane_1_z_-30   <PATH1>/monomers_B       36_Neopentane-Neopentane_1_z_-30.com   energy
      36_Neopentane-Neopentane_1_z_+30   <PATH1>/monomers_B       36_Neopentane-Neopentane_1_z_+30.com   energy
      36_Neopentane-Neopentane_2_y_-30   <PATH1>/monomers_B       36_Neopentane-Neopentane_2_y_-30.com   energy
      36_Neopentane-Neopentane_2_y_+30   <PATH1>/monomers_B       36_Neopentane-Neopentane_2_y_+30.com   energy
      36_Neopentane-Neopentane_2_z_-30   <PATH1>/monomers_B       36_Neopentane-Neopentane_2_z_-30.com   energy
      36_Neopentane-Neopentane_2_z_+30   <PATH1>/monomers_B       36_Neopentane-Neopentane_2_z_+30.com   energy
    37_Cyclopentane-Neopentane_1_y_-30   <PATH1>/monomers_B     37_Cyclopentane-Neopentane_1_y_-30.com   energy
    37_Cyclopentane-Neopentane_1_y_+30   <PATH1>/monomers_B     37_Cyclopentane-Neopentane_1_y_+30.com   energy
    37_Cyclopentane-Neopentane_1_z_-30   <PATH1>/monomers_B     37_Cyclopentane-Neopentane_1_z_-30.com   energy
    37_Cyclopentane-Neopentane_1_z_+30   <PATH1>/monomers_B     37_Cyclopentane-Neopentane_1_z_+30.com   energy
    37_Cyclopentane-Neopentane_2_y_-30   <PATH1>/monomers_B     37_Cyclopentane-Neopentane_2_y_-30.com   energy
    37_Cyclopentane-Neopentane_2_y_+30   <PATH1>/monomers_B     37_Cyclopentane-Neopentane_2_y_+30.com   energy
    37_Cyclopentane-Neopentane_2_z_-30   <PATH1>/monomers_B     37_Cyclopentane-Neopentane_2_z_-30.com   energy
    37_Cyclopentane-Neopentane_2_z_+30   <PATH1>/monomers_B     37_Cyclopentane-Neopentane_2_z_+30.com   energy
  38_Cyclopentane-Cyclopentane_1_y_-30   <PATH1>/monomers_B   38_Cyclopentane-Cyclopentane_1_y_-30.com   energy
  38_Cyclopentane-Cyclopentane_1_y_+30   <PATH1>/monomers_B   38_Cyclopentane-Cyclopentane_1_y_+30.com   energy
  38_Cyclopentane-Cyclopentane_1_z_-30   <PATH1>/monomers_B   38_Cyclopentane-Cyclopentane_1_z_-30.com   energy
  38_Cyclopentane-Cyclopentane_1_z_+30   <PATH1>/monomers_B   38_Cyclopentane-Cyclopentane_1_z_+30.com   energy
  38_Cyclopentane-Cyclopentane_2_y_-30   <PATH1>/monomers_B   38_Cyclopentane-Cyclopentane_2_y_-30.com   energy
  38_Cyclopentane-Cyclopentane_2_y_+30   <PATH1>/monomers_B   38_Cyclopentane-Cyclopentane_2_y_+30.com   energy
  38_Cyclopentane-Cyclopentane_2_z_-30   <PATH1>/monomers_B   38_Cyclopentane-Cyclopentane_2_z_-30.com   energy
  38_Cyclopentane-Cyclopentane_2_z_+30   <PATH1>/monomers_B   38_Cyclopentane-Cyclopentane_2_z_+30.com   energy
       39_Benzene-Cyclopentane_1_y_-30   <PATH1>/monomers_B        39_Benzene-Cyclopentane_1_y_-30.com   energy
       39_Benzene-Cyclopentane_1_y_+30   <PATH1>/monomers_B        39_Benzene-Cyclopentane_1_y_+30.com   energy
       39_Benzene-Cyclopentane_1_z_-30   <PATH1>/monomers_B        39_Benzene-Cyclopentane_1_z_-30.com   energy
       39_Benzene-Cyclopentane_1_z_+30   <PATH1>/monomers_B        39_Benzene-Cyclopentane_1_z_+30.com   energy
       39_Benzene-Cyclopentane_2_y_-30   <PATH1>/monomers_B        39_Benzene-Cyclopentane_2_y_-30.com   energy
       39_Benzene-Cyclopentane_2_y_+30   <PATH1>/monomers_B        39_Benzene-Cyclopentane_2_y_+30.com   energy
       39_Benzene-Cyclopentane_2_z_-30   <PATH1>/monomers_B        39_Benzene-Cyclopentane_2_z_-30.com   energy
       39_Benzene-Cyclopentane_2_z_+30   <PATH1>/monomers_B        39_Benzene-Cyclopentane_2_z_+30.com   energy
         40_Benzene-Neopentane_1_y_-30   <PATH1>/monomers_B          40_Benzene-Neopentane_1_y_-30.com   energy
         40_Benzene-Neopentane_1_y_+30   <PATH1>/monomers_B          40_Benzene-Neopentane_1_y_+30.com   energy
         40_Benzene-Neopentane_1_z_-30   <PATH1>/monomers_B          40_Benzene-Neopentane_1_z_-30.com   energy
         40_Benzene-Neopentane_1_z_+30   <PATH1>/monomers_B          40_Benzene-Neopentane_1_z_+30.com   energy
         40_Benzene-Neopentane_2_y_-30   <PATH1>/monomers_B          40_Benzene-Neopentane_2_y_-30.com   energy
         40_Benzene-Neopentane_2_y_+30   <PATH1>/monomers_B          40_Benzene-Neopentane_2_y_+30.com   energy
         40_Benzene-Neopentane_2_z_-30   <PATH1>/monomers_B          40_Benzene-Neopentane_2_z_-30.com   energy
         40_Benzene-Neopentane_2_z_+30   <PATH1>/monomers_B          40_Benzene-Neopentane_2_z_+30.com   energy
             41_Uracil-Pentane_1_y_-30   <PATH1>/monomers_B              41_Uracil-Pentane_1_y_-30.com   energy
             41_Uracil-Pentane_1_y_+30   <PATH1>/monomers_B              41_Uracil-Pentane_1_y_+30.com   energy
             41_Uracil-Pentane_1_z_-30   <PATH1>/monomers_B              41_Uracil-Pentane_1_z_-30.com   energy
             41_Uracil-Pentane_1_z_+30   <PATH1>/monomers_B              41_Uracil-Pentane_1_z_+30.com   energy
             41_Uracil-Pentane_2_y_-30   <PATH1>/monomers_B              41_Uracil-Pentane_2_y_-30.com   energy
             41_Uracil-Pentane_2_y_+30   <PATH1>/monomers_B              41_Uracil-Pentane_2_y_+30.com   energy
             41_Uracil-Pentane_2_z_-30   <PATH1>/monomers_B              41_Uracil-Pentane_2_z_-30.com   energy
             41_Uracil-Pentane_2_z_+30   <PATH1>/monomers_B              41_Uracil-Pentane_2_z_+30.com   energy
        42_Uracil-Cyclopentane_1_y_-30   <PATH1>/monomers_B         42_Uracil-Cyclopentane_1_y_-30.com   energy
        42_Uracil-Cyclopentane_1_y_+30   <PATH1>/monomers_B         42_Uracil-Cyclopentane_1_y_+30.com   energy
        42_Uracil-Cyclopentane_1_z_-30   <PATH1>/monomers_B         42_Uracil-Cyclopentane_1_z_-30.com   energy
        42_Uracil-Cyclopentane_1_z_+30   <PATH1>/monomers_B         42_Uracil-Cyclopentane_1_z_+30.com   energy
        42_Uracil-Cyclopentane_2_y_-30   <PATH1>/monomers_B         42_Uracil-Cyclopentane_2_y_-30.com   energy
        42_Uracil-Cyclopentane_2_y_+30   <PATH1>/monomers_B         42_Uracil-Cyclopentane_2_y_+30.com   energy
        42_Uracil-Cyclopentane_2_z_-30   <PATH1>/monomers_B         42_Uracil-Cyclopentane_2_z_-30.com   energy
        42_Uracil-Cyclopentane_2_z_+30   <PATH1>/monomers_B         42_Uracil-Cyclopentane_2_z_+30.com   energy
          43_Uracil-Neopentane_1_y_-30   <PATH1>/monomers_B           43_Uracil-Neopentane_1_y_-30.com   energy
          43_Uracil-Neopentane_1_y_+30   <PATH1>/monomers_B           43_Uracil-Neopentane_1_y_+30.com   energy
          43_Uracil-Neopentane_1_z_-30   <PATH1>/monomers_B           43_Uracil-Neopentane_1_z_-30.com   energy
          43_Uracil-Neopentane_1_z_+30   <PATH1>/monomers_B           43_Uracil-Neopentane_1_z_+30.com   energy
          43_Uracil-Neopentane_2_y_-30   <PATH1>/monomers_B           43_Uracil-Neopentane_2_y_-30.com   energy
          43_Uracil-Neopentane_2_y_+30   <PATH1>/monomers_B           43_Uracil-Neopentane_2_y_+30.com   energy
          43_Uracil-Neopentane_2_z_-30   <PATH1>/monomers_B           43_Uracil-Neopentane_2_z_-30.com   energy
          43_Uracil-Neopentane_2_z_+30   <PATH1>/monomers_B           43_Uracil-Neopentane_2_z_+30.com   energy
             44_Ethene-Pentane_1_y_-30   <PATH1>/monomers_B              44_Ethene-Pentane_1_y_-30.com   energy
             44_Ethene-Pentane_1_y_+30   <PATH1>/monomers_B              44_Ethene-Pentane_1_y_+30.com   energy
             44_Ethene-Pentane_1_z_-30   <PATH1>/monomers_B              44_Ethene-Pentane_1_z_-30.com   energy
             44_Ethene-Pentane_1_z_+30   <PATH1>/monomers_B              44_Ethene-Pentane_1_z_+30.com   energy
             44_Ethene-Pentane_2_y_-30   <PATH1>/monomers_B              44_Ethene-Pentane_2_y_-30.com   energy
             44_Ethene-Pentane_2_y_+30   <PATH1>/monomers_B              44_Ethene-Pentane_2_y_+30.com   energy
             44_Ethene-Pentane_2_z_-30   <PATH1>/monomers_B              44_Ethene-Pentane_2_z_-30.com   energy
             44_Ethene-Pentane_2_z_+30   <PATH1>/monomers_B              44_Ethene-Pentane_2_z_+30.com   energy
             45_Ethyne-Pentane_1_y_-30   <PATH1>/monomers_B              45_Ethyne-Pentane_1_y_-30.com   energy
             45_Ethyne-Pentane_1_y_+30   <PATH1>/monomers_B              45_Ethyne-Pentane_1_y_+30.com   energy
             45_Ethyne-Pentane_1_z_-30   <PATH1>/monomers_B              45_Ethyne-Pentane_1_z_-30.com   energy
             45_Ethyne-Pentane_1_z_+30   <PATH1>/monomers_B              45_Ethyne-Pentane_1_z_+30.com   energy
             45_Ethyne-Pentane_2_y_-30   <PATH1>/monomers_B              45_Ethyne-Pentane_2_y_-30.com   energy
             45_Ethyne-Pentane_2_y_+30   <PATH1>/monomers_B              45_Ethyne-Pentane_2_y_+30.com   energy
             45_Ethyne-Pentane_2_z_-30   <PATH1>/monomers_B              45_Ethyne-Pentane_2_z_-30.com   energy
             45_Ethyne-Pentane_2_z_+30   <PATH1>/monomers_B              45_Ethyne-Pentane_2_z_+30.com   energy
            46_Peptide-Pentane_1_y_-30   <PATH1>/monomers_B             46_Peptide-Pentane_1_y_-30.com   energy
            46_Peptide-Pentane_1_y_+30   <PATH1>/monomers_B             46_Peptide-Pentane_1_y_+30.com   energy
            46_Peptide-Pentane_1_z_-30   <PATH1>/monomers_B             46_Peptide-Pentane_1_z_-30.com   energy
            46_Peptide-Pentane_1_z_+30   <PATH1>/monomers_B             46_Peptide-Pentane_1_z_+30.com   energy
            46_Peptide-Pentane_2_y_-30   <PATH1>/monomers_B             46_Peptide-Pentane_2_y_-30.com   energy
            46_Peptide-Pentane_2_y_+30   <PATH1>/monomers_B             46_Peptide-Pentane_2_y_+30.com   energy
            46_Peptide-Pentane_2_z_-30   <PATH1>/monomers_B             46_Peptide-Pentane_2_z_-30.com   energy
            46_Peptide-Pentane_2_z_+30   <PATH1>/monomers_B             46_Peptide-Pentane_2_z_+30.com   energy
         47_Benzene-Benzene_TS_1_y_-30   <PATH1>/monomers_B          47_Benzene-Benzene_TS_1_y_-30.com   energy
         47_Benzene-Benzene_TS_1_y_+30   <PATH1>/monomers_B          47_Benzene-Benzene_TS_1_y_+30.com   energy
         47_Benzene-Benzene_TS_1_z_-30   <PATH1>/monomers_B          47_Benzene-Benzene_TS_1_z_-30.com   energy
         47_Benzene-Benzene_TS_1_z_+30   <PATH1>/monomers_B          47_Benzene-Benzene_TS_1_z_+30.com   energy
         47_Benzene-Benzene_TS_2_y_-30   <PATH1>/monomers_B          47_Benzene-Benzene_TS_2_y_-30.com   energy
         47_Benzene-Benzene_TS_2_y_+30   <PATH1>/monomers_B          47_Benzene-Benzene_TS_2_y_+30.com   energy
         47_Benzene-Benzene_TS_2_z_-30   <PATH1>/monomers_B          47_Benzene-Benzene_TS_2_z_-30.com   energy
         47_Benzene-Benzene_TS_2_z_+30   <PATH1>/monomers_B          47_Benzene-Benzene_TS_2_z_+30.com   energy
       48_Pyridine-Pyridine_TS_1_y_-30   <PATH1>/monomers_B        48_Pyridine-Pyridine_TS_1_y_-30.com   energy
       48_Pyridine-Pyridine_TS_1_y_+30   <PATH1>/monomers_B        48_Pyridine-Pyridine_TS_1_y_+30.com   energy
       48_Pyridine-Pyridine_TS_1_z_-30   <PATH1>/monomers_B        48_Pyridine-Pyridine_TS_1_z_-30.com   energy
       48_Pyridine-Pyridine_TS_1_z_+30   <PATH1>/monomers_B        48_Pyridine-Pyridine_TS_1_z_+30.com   energy
       48_Pyridine-Pyridine_TS_2_y_-30   <PATH1>/monomers_B        48_Pyridine-Pyridine_TS_2_y_-30.com   energy
       48_Pyridine-Pyridine_TS_2_y_+30   <PATH1>/monomers_B        48_Pyridine-Pyridine_TS_2_y_+30.com   energy
       48_Pyridine-Pyridine_TS_2_z_-30   <PATH1>/monomers_B        48_Pyridine-Pyridine_TS_2_z_-30.com   energy
       48_Pyridine-Pyridine_TS_2_z_+30   <PATH1>/monomers_B        48_Pyridine-Pyridine_TS_2_z_+30.com   energy
        49_Benzene-Pyridine_TS_1_y_-30   <PATH1>/monomers_B         49_Benzene-Pyridine_TS_1_y_-30.com   energy
        49_Benzene-Pyridine_TS_1_y_+30   <PATH1>/monomers_B         49_Benzene-Pyridine_TS_1_y_+30.com   energy
        49_Benzene-Pyridine_TS_1_z_-30   <PATH1>/monomers_B         49_Benzene-Pyridine_TS_1_z_-30.com   energy
        49_Benzene-Pyridine_TS_1_z_+30   <PATH1>/monomers_B         49_Benzene-Pyridine_TS_1_z_+30.com   energy
        49_Benzene-Pyridine_TS_2_y_-30   <PATH1>/monomers_B         49_Benzene-Pyridine_TS_2_y_-30.com   energy
        49_Benzene-Pyridine_TS_2_y_+30   <PATH1>/monomers_B         49_Benzene-Pyridine_TS_2_y_+30.com   energy
        49_Benzene-Pyridine_TS_2_z_-30   <PATH1>/monomers_B         49_Benzene-Pyridine_TS_2_z_-30.com   energy
        49_Benzene-Pyridine_TS_2_z_+30   <PATH1>/monomers_B         49_Benzene-Pyridine_TS_2_z_+30.com   energy
       50_Benzene-Ethyne_CH-pi_1_y_-30   <PATH1>/monomers_B        50_Benzene-Ethyne_CH-pi_1_y_-30.com   energy
       50_Benzene-Ethyne_CH-pi_1_y_+30   <PATH1>/monomers_B        50_Benzene-Ethyne_CH-pi_1_y_+30.com   energy
       50_Benzene-Ethyne_CH-pi_1_z_-30   <PATH1>/monomers_B        50_Benzene-Ethyne_CH-pi_1_z_-30.com   energy
       50_Benzene-Ethyne_CH-pi_1_z_+30   <PATH1>/monomers_B        50_Benzene-Ethyne_CH-pi_1_z_+30.com   energy
       50_Benzene-Ethyne_CH-pi_2_y_-30   <PATH1>/monomers_B        50_Benzene-Ethyne_CH-pi_2_y_-30.com   energy
       50_Benzene-Ethyne_CH-pi_2_y_+30   <PATH1>/monomers_B        50_Benzene-Ethyne_CH-pi_2_y_+30.com   energy
       50_Benzene-Ethyne_CH-pi_2_z_-30   <PATH1>/monomers_B        50_Benzene-Ethyne_CH-pi_2_z_-30.com   energy
       50_Benzene-Ethyne_CH-pi_2_z_+30   <PATH1>/monomers_B        50_Benzene-Ethyne_CH-pi_2_z_+30.com   energy
           51_Ethyne-Ethyne_TS_1_y_-30   <PATH1>/monomers_B            51_Ethyne-Ethyne_TS_1_y_-30.com   energy
           51_Ethyne-Ethyne_TS_1_y_+30   <PATH1>/monomers_B            51_Ethyne-Ethyne_TS_1_y_+30.com   energy
           51_Ethyne-Ethyne_TS_1_z_-30   <PATH1>/monomers_B            51_Ethyne-Ethyne_TS_1_z_-30.com   energy
           51_Ethyne-Ethyne_TS_1_z_+30   <PATH1>/monomers_B            51_Ethyne-Ethyne_TS_1_z_+30.com   energy
           51_Ethyne-Ethyne_TS_2_y_-30   <PATH1>/monomers_B            51_Ethyne-Ethyne_TS_2_y_-30.com   energy
           51_Ethyne-Ethyne_TS_2_y_+30   <PATH1>/monomers_B            51_Ethyne-Ethyne_TS_2_y_+30.com   energy
           51_Ethyne-Ethyne_TS_2_z_-30   <PATH1>/monomers_B            51_Ethyne-Ethyne_TS_2_z_-30.com   energy
           51_Ethyne-Ethyne_TS_2_z_+30   <PATH1>/monomers_B            51_Ethyne-Ethyne_TS_2_z_+30.com   energy
         52_Benzene-AcOH_OH-pi_1_y_-30   <PATH1>/monomers_B          52_Benzene-AcOH_OH-pi_1_y_-30.com   energy
         52_Benzene-AcOH_OH-pi_1_y_+30   <PATH1>/monomers_B          52_Benzene-AcOH_OH-pi_1_y_+30.com   energy
         52_Benzene-AcOH_OH-pi_1_z_-30   <PATH1>/monomers_B          52_Benzene-AcOH_OH-pi_1_z_-30.com   energy
         52_Benzene-AcOH_OH-pi_1_z_+30   <PATH1>/monomers_B          52_Benzene-AcOH_OH-pi_1_z_+30.com   energy
         52_Benzene-AcOH_OH-pi_2_y_-30   <PATH1>/monomers_B          52_Benzene-AcOH_OH-pi_2_y_-30.com   energy
         52_Benzene-AcOH_OH-pi_2_y_+30   <PATH1>/monomers_B          52_Benzene-AcOH_OH-pi_2_y_+30.com   energy
         52_Benzene-AcOH_OH-pi_2_z_-30   <PATH1>/monomers_B          52_Benzene-AcOH_OH-pi_2_z_-30.com   energy
         52_Benzene-AcOH_OH-pi_2_z_+30   <PATH1>/monomers_B          52_Benzene-AcOH_OH-pi_2_z_+30.com   energy
        53_Benzene-AcNH2_NH-pi_1_y_-30   <PATH1>/monomers_B         53_Benzene-AcNH2_NH-pi_1_y_-30.com   energy
        53_Benzene-AcNH2_NH-pi_1_y_+30   <PATH1>/monomers_B         53_Benzene-AcNH2_NH-pi_1_y_+30.com   energy
        53_Benzene-AcNH2_NH-pi_1_z_-30   <PATH1>/monomers_B         53_Benzene-AcNH2_NH-pi_1_z_-30.com   energy
        53_Benzene-AcNH2_NH-pi_1_z_+30   <PATH1>/monomers_B         53_Benzene-AcNH2_NH-pi_1_z_+30.com   energy
        53_Benzene-AcNH2_NH-pi_2_y_-30   <PATH1>/monomers_B         53_Benzene-AcNH2_NH-pi_2_y_-30.com   energy
        53_Benzene-AcNH2_NH-pi_2_y_+30   <PATH1>/monomers_B         53_Benzene-AcNH2_NH-pi_2_y_+30.com   energy
        53_Benzene-AcNH2_NH-pi_2_z_-30   <PATH1>/monomers_B         53_Benzene-AcNH2_NH-pi_2_z_-30.com   energy
        53_Benzene-AcNH2_NH-pi_2_z_+30   <PATH1>/monomers_B         53_Benzene-AcNH2_NH-pi_2_z_+30.com   energy
        54_Benzene-Water_OH-pi_1_y_-30   <PATH1>/monomers_B         54_Benzene-Water_OH-pi_1_y_-30.com   energy
        54_Benzene-Water_OH-pi_1_y_+30   <PATH1>/monomers_B         54_Benzene-Water_OH-pi_1_y_+30.com   energy
        54_Benzene-Water_OH-pi_1_z_-30   <PATH1>/monomers_B         54_Benzene-Water_OH-pi_1_z_-30.com   energy
        54_Benzene-Water_OH-pi_1_z_+30   <PATH1>/monomers_B         54_Benzene-Water_OH-pi_1_z_+30.com   energy
        54_Benzene-Water_OH-pi_2_y_-30   <PATH1>/monomers_B         54_Benzene-Water_OH-pi_2_y_-30.com   energy
        54_Benzene-Water_OH-pi_2_y_+30   <PATH1>/monomers_B         54_Benzene-Water_OH-pi_2_y_+30.com   energy
        54_Benzene-Water_OH-pi_2_z_-30   <PATH1>/monomers_B         54_Benzene-Water_OH-pi_2_z_-30.com   energy
        54_Benzene-Water_OH-pi_2_z_+30   <PATH1>/monomers_B         54_Benzene-Water_OH-pi_2_z_+30.com   energy
         55_Benzene-MeOH_OH-pi_1_y_-30   <PATH1>/monomers_B          55_Benzene-MeOH_OH-pi_1_y_-30.com   energy
         55_Benzene-MeOH_OH-pi_1_y_+30   <PATH1>/monomers_B          55_Benzene-MeOH_OH-pi_1_y_+30.com   energy
         55_Benzene-MeOH_OH-pi_1_z_-30   <PATH1>/monomers_B          55_Benzene-MeOH_OH-pi_1_z_-30.com   energy
         55_Benzene-MeOH_OH-pi_1_z_+30   <PATH1>/monomers_B          55_Benzene-MeOH_OH-pi_1_z_+30.com   energy
         55_Benzene-MeOH_OH-pi_2_y_-30   <PATH1>/monomers_B          55_Benzene-MeOH_OH-pi_2_y_-30.com   energy
         55_Benzene-MeOH_OH-pi_2_y_+30   <PATH1>/monomers_B          55_Benzene-MeOH_OH-pi_2_y_+30.com   energy
         55_Benzene-MeOH_OH-pi_2_z_-30   <PATH1>/monomers_B          55_Benzene-MeOH_OH-pi_2_z_-30.com   energy
         55_Benzene-MeOH_OH-pi_2_z_+30   <PATH1>/monomers_B          55_Benzene-MeOH_OH-pi_2_z_+30.com   energy
        56_Benzene-MeNH2_NH-pi_1_y_-30   <PATH1>/monomers_B         56_Benzene-MeNH2_NH-pi_1_y_-30.com   energy
        56_Benzene-MeNH2_NH-pi_1_y_+30   <PATH1>/monomers_B         56_Benzene-MeNH2_NH-pi_1_y_+30.com   energy
        56_Benzene-MeNH2_NH-pi_1_z_-30   <PATH1>/monomers_B         56_Benzene-MeNH2_NH-pi_1_z_-30.com   energy
        56_Benzene-MeNH2_NH-pi_1_z_+30   <PATH1>/monomers_B         56_Benzene-MeNH2_NH-pi_1_z_+30.com   energy
        56_Benzene-MeNH2_NH-pi_2_y_-30   <PATH1>/monomers_B         56_Benzene-MeNH2_NH-pi_2_y_-30.com   energy
        56_Benzene-MeNH2_NH-pi_2_y_+30   <PATH1>/monomers_B         56_Benzene-MeNH2_NH-pi_2_y_+30.com   energy
        56_Benzene-MeNH2_NH-pi_2_z_-30   <PATH1>/monomers_B         56_Benzene-MeNH2_NH-pi_2_z_-30.com   energy
        56_Benzene-MeNH2_NH-pi_2_z_+30   <PATH1>/monomers_B         56_Benzene-MeNH2_NH-pi_2_z_+30.com   energy
      57_Benzene-Peptide_NH-pi_1_y_-30   <PATH1>/monomers_B       57_Benzene-Peptide_NH-pi_1_y_-30.com   energy
      57_Benzene-Peptide_NH-pi_1_y_+30   <PATH1>/monomers_B       57_Benzene-Peptide_NH-pi_1_y_+30.com   energy
      57_Benzene-Peptide_NH-pi_1_z_-30   <PATH1>/monomers_B       57_Benzene-Peptide_NH-pi_1_z_-30.com   energy
      57_Benzene-Peptide_NH-pi_1_z_+30   <PATH1>/monomers_B       57_Benzene-Peptide_NH-pi_1_z_+30.com   energy
      57_Benzene-Peptide_NH-pi_2_y_-30   <PATH1>/monomers_B       57_Benzene-Peptide_NH-pi_2_y_-30.com   energy
      57_Benzene-Peptide_NH-pi_2_y_+30   <PATH1>/monomers_B       57_Benzene-Peptide_NH-pi_2_y_+30.com   energy
      57_Benzene-Peptide_NH-pi_2_z_-30   <PATH1>/monomers_B       57_Benzene-Peptide_NH-pi_2_z_-30.com   energy
      57_Benzene-Peptide_NH-pi_2_z_+30   <PATH1>/monomers_B       57_Benzene-Peptide_NH-pi_2_z_+30.com   energy
     58_Pyridine-Pyridine_CH-N_1_y_-30   <PATH1>/monomers_B      58_Pyridine-Pyridine_CH-N_1_y_-30.com   energy
     58_Pyridine-Pyridine_CH-N_1_y_+30   <PATH1>/monomers_B      58_Pyridine-Pyridine_CH-N_1_y_+30.com   energy
     58_Pyridine-Pyridine_CH-N_1_z_-30   <PATH1>/monomers_B      58_Pyridine-Pyridine_CH-N_1_z_-30.com   energy
     58_Pyridine-Pyridine_CH-N_1_z_+30   <PATH1>/monomers_B      58_Pyridine-Pyridine_CH-N_1_z_+30.com   energy
     58_Pyridine-Pyridine_CH-N_2_y_-30   <PATH1>/monomers_B      58_Pyridine-Pyridine_CH-N_2_y_-30.com   energy
     58_Pyridine-Pyridine_CH-N_2_y_+30   <PATH1>/monomers_B      58_Pyridine-Pyridine_CH-N_2_y_+30.com   energy
     58_Pyridine-Pyridine_CH-N_2_z_-30   <PATH1>/monomers_B      58_Pyridine-Pyridine_CH-N_2_z_-30.com   energy
     58_Pyridine-Pyridine_CH-N_2_z_+30   <PATH1>/monomers_B      58_Pyridine-Pyridine_CH-N_2_z_+30.com   energy
          59_Ethyne-Water_CH-O_1_y_-30   <PATH1>/monomers_B           59_Ethyne-Water_CH-O_1_y_-30.com   energy
          59_Ethyne-Water_CH-O_1_y_+30   <PATH1>/monomers_B           59_Ethyne-Water_CH-O_1_y_+30.com   energy
          59_Ethyne-Water_CH-O_1_z_-30   <PATH1>/monomers_B           59_Ethyne-Water_CH-O_1_z_-30.com   energy
          59_Ethyne-Water_CH-O_1_z_+30   <PATH1>/monomers_B           59_Ethyne-Water_CH-O_1_z_+30.com   energy
          59_Ethyne-Water_CH-O_2_y_-30   <PATH1>/monomers_B           59_Ethyne-Water_CH-O_2_y_-30.com   energy
          59_Ethyne-Water_CH-O_2_y_+30   <PATH1>/monomers_B           59_Ethyne-Water_CH-O_2_y_+30.com   energy
          59_Ethyne-Water_CH-O_2_z_-30   <PATH1>/monomers_B           59_Ethyne-Water_CH-O_2_z_-30.com   energy
          59_Ethyne-Water_CH-O_2_z_+30   <PATH1>/monomers_B           59_Ethyne-Water_CH-O_2_z_+30.com   energy
          60_Ethyne-AcOH_OH-pi_1_y_-30   <PATH1>/monomers_B           60_Ethyne-AcOH_OH-pi_1_y_-30.com   energy
          60_Ethyne-AcOH_OH-pi_1_y_+30   <PATH1>/monomers_B           60_Ethyne-AcOH_OH-pi_1_y_+30.com   energy
          60_Ethyne-AcOH_OH-pi_1_z_-30   <PATH1>/monomers_B           60_Ethyne-AcOH_OH-pi_1_z_-30.com   energy
          60_Ethyne-AcOH_OH-pi_1_z_+30   <PATH1>/monomers_B           60_Ethyne-AcOH_OH-pi_1_z_+30.com   energy
          60_Ethyne-AcOH_OH-pi_2_y_-30   <PATH1>/monomers_B           60_Ethyne-AcOH_OH-pi_2_y_-30.com   energy
          60_Ethyne-AcOH_OH-pi_2_y_+30   <PATH1>/monomers_B           60_Ethyne-AcOH_OH-pi_2_y_+30.com   energy
          60_Ethyne-AcOH_OH-pi_2_z_-30   <PATH1>/monomers_B           60_Ethyne-AcOH_OH-pi_2_z_-30.com   energy
          60_Ethyne-AcOH_OH-pi_2_z_+30   <PATH1>/monomers_B           60_Ethyne-AcOH_OH-pi_2_z_+30.com   energy
               61_Pentane-AcOH_1_y_-30   <PATH1>/monomers_B                61_Pentane-AcOH_1_y_-30.com   energy
               61_Pentane-AcOH_1_y_+30   <PATH1>/monomers_B                61_Pentane-AcOH_1_y_+30.com   energy
               61_Pentane-AcOH_1_z_-30   <PATH1>/monomers_B                61_Pentane-AcOH_1_z_-30.com   energy
               61_Pentane-AcOH_1_z_+30   <PATH1>/monomers_B                61_Pentane-AcOH_1_z_+30.com   energy
               61_Pentane-AcOH_2_y_-30   <PATH1>/monomers_B                61_Pentane-AcOH_2_y_-30.com   energy
               61_Pentane-AcOH_2_y_+30   <PATH1>/monomers_B                61_Pentane-AcOH_2_y_+30.com   energy
               61_Pentane-AcOH_2_z_-30   <PATH1>/monomers_B                61_Pentane-AcOH_2_z_-30.com   energy
               61_Pentane-AcOH_2_z_+30   <PATH1>/monomers_B                61_Pentane-AcOH_2_z_+30.com   energy
              62_Pentane-AcNH2_1_y_-30   <PATH1>/monomers_B               62_Pentane-AcNH2_1_y_-30.com   energy
              62_Pentane-AcNH2_1_y_+30   <PATH1>/monomers_B               62_Pentane-AcNH2_1_y_+30.com   energy
              62_Pentane-AcNH2_1_z_-30   <PATH1>/monomers_B               62_Pentane-AcNH2_1_z_-30.com   energy
              62_Pentane-AcNH2_1_z_+30   <PATH1>/monomers_B               62_Pentane-AcNH2_1_z_+30.com   energy
              62_Pentane-AcNH2_2_y_-30   <PATH1>/monomers_B               62_Pentane-AcNH2_2_y_-30.com   energy
              62_Pentane-AcNH2_2_y_+30   <PATH1>/monomers_B               62_Pentane-AcNH2_2_y_+30.com   energy
              62_Pentane-AcNH2_2_z_-30   <PATH1>/monomers_B               62_Pentane-AcNH2_2_z_-30.com   energy
              62_Pentane-AcNH2_2_z_+30   <PATH1>/monomers_B               62_Pentane-AcNH2_2_z_+30.com   energy
               63_Benzene-AcOH_1_y_-30   <PATH1>/monomers_B                63_Benzene-AcOH_1_y_-30.com   energy
               63_Benzene-AcOH_1_y_+30   <PATH1>/monomers_B                63_Benzene-AcOH_1_y_+30.com   energy
               63_Benzene-AcOH_1_z_-30   <PATH1>/monomers_B                63_Benzene-AcOH_1_z_-30.com   energy
               63_Benzene-AcOH_1_z_+30   <PATH1>/monomers_B                63_Benzene-AcOH_1_z_+30.com   energy
               63_Benzene-AcOH_2_y_-30   <PATH1>/monomers_B                63_Benzene-AcOH_2_y_-30.com   energy
               63_Benzene-AcOH_2_y_+30   <PATH1>/monomers_B                63_Benzene-AcOH_2_y_+30.com   energy
               63_Benzene-AcOH_2_z_-30   <PATH1>/monomers_B                63_Benzene-AcOH_2_z_-30.com   energy
               63_Benzene-AcOH_2_z_+30   <PATH1>/monomers_B                63_Benzene-AcOH_2_z_+30.com   energy
             64_Peptide-Ethene_1_y_-30   <PATH1>/monomers_B              64_Peptide-Ethene_1_y_-30.com   energy
             64_Peptide-Ethene_1_y_+30   <PATH1>/monomers_B              64_Peptide-Ethene_1_y_+30.com   energy
             64_Peptide-Ethene_1_z_-30   <PATH1>/monomers_B              64_Peptide-Ethene_1_z_-30.com   energy
             64_Peptide-Ethene_1_z_+30   <PATH1>/monomers_B              64_Peptide-Ethene_1_z_+30.com   energy
             64_Peptide-Ethene_2_y_-30   <PATH1>/monomers_B              64_Peptide-Ethene_2_y_-30.com   energy
             64_Peptide-Ethene_2_y_+30   <PATH1>/monomers_B              64_Peptide-Ethene_2_y_+30.com   energy
             64_Peptide-Ethene_2_z_-30   <PATH1>/monomers_B              64_Peptide-Ethene_2_z_-30.com   energy
             64_Peptide-Ethene_2_z_+30   <PATH1>/monomers_B              64_Peptide-Ethene_2_z_+30.com   energy
            65_Pyridine-Ethyne_1_y_-30   <PATH1>/monomers_B             65_Pyridine-Ethyne_1_y_-30.com   energy
            65_Pyridine-Ethyne_1_y_+30   <PATH1>/monomers_B             65_Pyridine-Ethyne_1_y_+30.com   energy
            65_Pyridine-Ethyne_1_z_-30   <PATH1>/monomers_B             65_Pyridine-Ethyne_1_z_-30.com   energy
            65_Pyridine-Ethyne_1_z_+30   <PATH1>/monomers_B             65_Pyridine-Ethyne_1_z_+30.com   energy
            65_Pyridine-Ethyne_2_y_-30   <PATH1>/monomers_B             65_Pyridine-Ethyne_2_y_-30.com   energy
            65_Pyridine-Ethyne_2_y_+30   <PATH1>/monomers_B             65_Pyridine-Ethyne_2_y_+30.com   energy
            65_Pyridine-Ethyne_2_z_-30   <PATH1>/monomers_B             65_Pyridine-Ethyne_2_z_-30.com   energy
            65_Pyridine-Ethyne_2_z_+30   <PATH1>/monomers_B             65_Pyridine-Ethyne_2_z_+30.com   energy
             66_MeNH2-Pyridine_1_y_-30   <PATH1>/monomers_B              66_MeNH2-Pyridine_1_y_-30.com   energy
             66_MeNH2-Pyridine_1_y_+30   <PATH1>/monomers_B              66_MeNH2-Pyridine_1_y_+30.com   energy
             66_MeNH2-Pyridine_1_z_-30   <PATH1>/monomers_B              66_MeNH2-Pyridine_1_z_-30.com   energy
             66_MeNH2-Pyridine_1_z_+30   <PATH1>/monomers_B              66_MeNH2-Pyridine_1_z_+30.com   energy
             66_MeNH2-Pyridine_2_y_-30   <PATH1>/monomers_B              66_MeNH2-Pyridine_2_y_-30.com   energy
             66_MeNH2-Pyridine_2_y_+30   <PATH1>/monomers_B              66_MeNH2-Pyridine_2_y_+30.com   energy
             66_MeNH2-Pyridine_2_z_-30   <PATH1>/monomers_B              66_MeNH2-Pyridine_2_z_-30.com   energy
             66_MeNH2-Pyridine_2_z_+30   <PATH1>/monomers_B              66_MeNH2-Pyridine_2_z_+30.com   energy

# Training set for the atomization energy
#		528 is the total number of data to be tested
#           1.0 is the scale factor from "a.u." to "a.u.", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "a.u."
__energy__ :: 528  1.0
#"Number"     "Flag"                            "Scale"                  "Ref"    "Weight"
  1                01_Water-Water_1_y_-30        1                       0.0       1.0
  1                01_Water-Water_1_y_+30        1                       0.0       1.0
  1                01_Water-Water_1_z_-30        1                       0.0       1.0
  1                01_Water-Water_1_z_+30        1                       0.0       1.0
  1                01_Water-Water_2_y_-30        1                       0.0       1.0
  1                01_Water-Water_2_y_+30        1                       0.0       1.0
  1                01_Water-Water_2_z_-30        1                       0.0       1.0
  1                01_Water-Water_2_z_+30        1                       0.0       1.0
  1                 02_Water-MeOH_1_y_-30        1                       0.0       1.0
  1                 02_Water-MeOH_1_y_+30        1                       0.0       1.0
  1                 02_Water-MeOH_1_z_-30        1                       0.0       1.0
  1                 02_Water-MeOH_1_z_+30        1                       0.0       1.0
  1                 02_Water-MeOH_2_y_-30        1                       0.0       1.0
  1                 02_Water-MeOH_2_y_+30        1                       0.0       1.0
  1                 02_Water-MeOH_2_z_-30        1                       0.0       1.0
  1                 02_Water-MeOH_2_z_+30        1                       0.0       1.0
  1                03_Water-MeNH2_1_y_-30        1                       0.0       1.0
  1                03_Water-MeNH2_1_y_+30        1                       0.0       1.0
  1                03_Water-MeNH2_1_z_-30        1                       0.0       1.0
  1                03_Water-MeNH2_1_z_+30        1                       0.0       1.0
  1                03_Water-MeNH2_2_y_-30        1                       0.0       1.0
  1                03_Water-MeNH2_2_y_+30        1                       0.0       1.0
  1                03_Water-MeNH2_2_z_-30        1                       0.0       1.0
  1                03_Water-MeNH2_2_z_+30        1                       0.0       1.0
  1              04_Water-Peptide_1_y_-30        1                       0.0       1.0
  1              04_Water-Peptide_1_y_+30        1                       0.0       1.0
  1              04_Water-Peptide_1_z_-30        1                       0.0       1.0
  1              04_Water-Peptide_1_z_+30        1                       0.0       1.0
  1              04_Water-Peptide_2_y_-30        1                       0.0       1.0
  1              04_Water-Peptide_2_y_+30        1                       0.0       1.0
  1              04_Water-Peptide_2_z_-30        1                       0.0       1.0
  1              04_Water-Peptide_2_z_+30        1                       0.0       1.0
  1                  05_MeOH-MeOH_1_y_-30        1                       0.0       1.0
  1                  05_MeOH-MeOH_1_y_+30        1                       0.0       1.0
  1                  05_MeOH-MeOH_1_z_-30        1                       0.0       1.0
  1                  05_MeOH-MeOH_1_z_+30        1                       0.0       1.0
  1                  05_MeOH-MeOH_2_y_-30        1                       0.0       1.0
  1                  05_MeOH-MeOH_2_y_+30        1                       0.0       1.0
  1                  05_MeOH-MeOH_2_z_-30        1                       0.0       1.0
  1                  05_MeOH-MeOH_2_z_+30        1                       0.0       1.0
  1                 06_MeOH-MeNH2_1_y_-30        1                       0.0       1.0
  1                 06_MeOH-MeNH2_1_y_+30        1                       0.0       1.0
  1                 06_MeOH-MeNH2_1_z_-30        1                       0.0       1.0
  1                 06_MeOH-MeNH2_1_z_+30        1                       0.0       1.0
  1                 06_MeOH-MeNH2_2_y_-30        1                       0.0       1.0
  1                 06_MeOH-MeNH2_2_y_+30        1                       0.0       1.0
  1                 06_MeOH-MeNH2_2_z_-30        1                       0.0       1.0
  1                 06_MeOH-MeNH2_2_z_+30        1                       0.0       1.0
  1               07_MeOH-Peptide_1_y_-30        1                       0.0       1.0
  1               07_MeOH-Peptide_1_y_+30        1                       0.0       1.0
  1               07_MeOH-Peptide_1_z_-30        1                       0.0       1.0
  1               07_MeOH-Peptide_1_z_+30        1                       0.0       1.0
  1               07_MeOH-Peptide_2_y_-30        1                       0.0       1.0
  1               07_MeOH-Peptide_2_y_+30        1                       0.0       1.0
  1               07_MeOH-Peptide_2_z_-30        1                       0.0       1.0
  1               07_MeOH-Peptide_2_z_+30        1                       0.0       1.0
  1                 08_MeOH-Water_1_y_-30        1                       0.0       1.0
  1                 08_MeOH-Water_1_y_+30        1                       0.0       1.0
  1                 08_MeOH-Water_1_z_-30        1                       0.0       1.0
  1                 08_MeOH-Water_1_z_+30        1                       0.0       1.0
  1                 08_MeOH-Water_2_y_-30        1                       0.0       1.0
  1                 08_MeOH-Water_2_y_+30        1                       0.0       1.0
  1                 08_MeOH-Water_2_z_-30        1                       0.0       1.0
  1                 08_MeOH-Water_2_z_+30        1                       0.0       1.0
  1                 09_MeNH2-MeOH_1_y_-30        1                       0.0       1.0
  1                 09_MeNH2-MeOH_1_y_+30        1                       0.0       1.0
  1                 09_MeNH2-MeOH_1_z_-30        1                       0.0       1.0
  1                 09_MeNH2-MeOH_1_z_+30        1                       0.0       1.0
  1                 09_MeNH2-MeOH_2_y_-30        1                       0.0       1.0
  1                 09_MeNH2-MeOH_2_y_+30        1                       0.0       1.0
  1                 09_MeNH2-MeOH_2_z_-30        1                       0.0       1.0
  1                 09_MeNH2-MeOH_2_z_+30        1                       0.0       1.0
  1                10_MeNH2-MeNH2_1_y_-30        1                       0.0       1.0
  1                10_MeNH2-MeNH2_1_y_+30        1                       0.0       1.0
  1                10_MeNH2-MeNH2_1_z_-30        1                       0.0       1.0
  1                10_MeNH2-MeNH2_1_z_+30        1                       0.0       1.0
  1                10_MeNH2-MeNH2_2_y_-30        1                       0.0       1.0
  1                10_MeNH2-MeNH2_2_y_+30        1                       0.0       1.0
  1                10_MeNH2-MeNH2_2_z_-30        1                       0.0       1.0
  1                10_MeNH2-MeNH2_2_z_+30        1                       0.0       1.0
  1              11_MeNH2-Peptide_1_y_-30        1                       0.0       1.0
  1              11_MeNH2-Peptide_1_y_+30        1                       0.0       1.0
  1              11_MeNH2-Peptide_1_z_-30        1                       0.0       1.0
  1              11_MeNH2-Peptide_1_z_+30        1                       0.0       1.0
  1              11_MeNH2-Peptide_2_y_-30        1                       0.0       1.0
  1              11_MeNH2-Peptide_2_y_+30        1                       0.0       1.0
  1              11_MeNH2-Peptide_2_z_-30        1                       0.0       1.0
  1              11_MeNH2-Peptide_2_z_+30        1                       0.0       1.0
  1                12_MeNH2-Water_1_y_-30        1                       0.0       1.0
  1                12_MeNH2-Water_1_y_+30        1                       0.0       1.0
  1                12_MeNH2-Water_1_z_-30        1                       0.0       1.0
  1                12_MeNH2-Water_1_z_+30        1                       0.0       1.0
  1                12_MeNH2-Water_2_y_-30        1                       0.0       1.0
  1                12_MeNH2-Water_2_y_+30        1                       0.0       1.0
  1                12_MeNH2-Water_2_z_-30        1                       0.0       1.0
  1                12_MeNH2-Water_2_z_+30        1                       0.0       1.0
  1               13_Peptide-MeOH_1_y_-30        1                       0.0       1.0
  1               13_Peptide-MeOH_1_y_+30        1                       0.0       1.0
  1               13_Peptide-MeOH_1_z_-30        1                       0.0       1.0
  1               13_Peptide-MeOH_1_z_+30        1                       0.0       1.0
  1               13_Peptide-MeOH_2_y_-30        1                       0.0       1.0
  1               13_Peptide-MeOH_2_y_+30        1                       0.0       1.0
  1               13_Peptide-MeOH_2_z_-30        1                       0.0       1.0
  1               13_Peptide-MeOH_2_z_+30        1                       0.0       1.0
  1              14_Peptide-MeNH2_1_y_-30        1                       0.0       1.0
  1              14_Peptide-MeNH2_1_y_+30        1                       0.0       1.0
  1              14_Peptide-MeNH2_1_z_-30        1                       0.0       1.0
  1              14_Peptide-MeNH2_1_z_+30        1                       0.0       1.0
  1              14_Peptide-MeNH2_2_y_-30        1                       0.0       1.0
  1              14_Peptide-MeNH2_2_y_+30        1                       0.0       1.0
  1              14_Peptide-MeNH2_2_z_-30        1                       0.0       1.0
  1              14_Peptide-MeNH2_2_z_+30        1                       0.0       1.0
  1            15_Peptide-Peptide_1_y_-30        1                       0.0       1.0
  1            15_Peptide-Peptide_1_y_+30        1                       0.0       1.0
  1            15_Peptide-Peptide_1_z_-30        1                       0.0       1.0
  1            15_Peptide-Peptide_1_z_+30        1                       0.0       1.0
  1            15_Peptide-Peptide_2_y_-30        1                       0.0       1.0
  1            15_Peptide-Peptide_2_y_+30        1                       0.0       1.0
  1            15_Peptide-Peptide_2_z_-30        1                       0.0       1.0
  1            15_Peptide-Peptide_2_z_+30        1                       0.0       1.0
  1              16_Peptide-Water_1_y_-30        1                       0.0       1.0
  1              16_Peptide-Water_1_y_+30        1                       0.0       1.0
  1              16_Peptide-Water_1_z_-30        1                       0.0       1.0
  1              16_Peptide-Water_1_z_+30        1                       0.0       1.0
  1              16_Peptide-Water_2_y_-30        1                       0.0       1.0
  1              16_Peptide-Water_2_y_+30        1                       0.0       1.0
  1              16_Peptide-Water_2_z_-30        1                       0.0       1.0
  1              16_Peptide-Water_2_z_+30        1                       0.0       1.0
  1           17_Uracil-Uracil_BP_1_y_-30        1                       0.0       1.0
  1           17_Uracil-Uracil_BP_1_y_+30        1                       0.0       1.0
  1           17_Uracil-Uracil_BP_1_z_-30        1                       0.0       1.0
  1           17_Uracil-Uracil_BP_1_z_+30        1                       0.0       1.0
  1           17_Uracil-Uracil_BP_2_y_-30        1                       0.0       1.0
  1           17_Uracil-Uracil_BP_2_y_+30        1                       0.0       1.0
  1           17_Uracil-Uracil_BP_2_z_-30        1                       0.0       1.0
  1           17_Uracil-Uracil_BP_2_z_+30        1                       0.0       1.0
  1             18_Water-Pyridine_1_y_-30        1                       0.0       1.0
  1             18_Water-Pyridine_1_y_+30        1                       0.0       1.0
  1             18_Water-Pyridine_1_z_-30        1                       0.0       1.0
  1             18_Water-Pyridine_1_z_+30        1                       0.0       1.0
  1             18_Water-Pyridine_2_y_-30        1                       0.0       1.0
  1             18_Water-Pyridine_2_y_+30        1                       0.0       1.0
  1             18_Water-Pyridine_2_z_-30        1                       0.0       1.0
  1             18_Water-Pyridine_2_z_+30        1                       0.0       1.0
  1              19_MeOH-Pyridine_1_y_-30        1                       0.0       1.0
  1              19_MeOH-Pyridine_1_y_+30        1                       0.0       1.0
  1              19_MeOH-Pyridine_1_z_-30        1                       0.0       1.0
  1              19_MeOH-Pyridine_1_z_+30        1                       0.0       1.0
  1              19_MeOH-Pyridine_2_y_-30        1                       0.0       1.0
  1              19_MeOH-Pyridine_2_y_+30        1                       0.0       1.0
  1              19_MeOH-Pyridine_2_z_-30        1                       0.0       1.0
  1              19_MeOH-Pyridine_2_z_+30        1                       0.0       1.0
  1                  20_AcOH-AcOH_1_y_-30        1                       0.0       1.0
  1                  20_AcOH-AcOH_1_y_+30        1                       0.0       1.0
  1                  20_AcOH-AcOH_1_z_-30        1                       0.0       1.0
  1                  20_AcOH-AcOH_1_z_+30        1                       0.0       1.0
  1                  20_AcOH-AcOH_2_y_-30        1                       0.0       1.0
  1                  20_AcOH-AcOH_2_y_+30        1                       0.0       1.0
  1                  20_AcOH-AcOH_2_z_-30        1                       0.0       1.0
  1                  20_AcOH-AcOH_2_z_+30        1                       0.0       1.0
  1                21_AcNH2-AcNH2_1_y_-30        1                       0.0       1.0
  1                21_AcNH2-AcNH2_1_y_+30        1                       0.0       1.0
  1                21_AcNH2-AcNH2_1_z_-30        1                       0.0       1.0
  1                21_AcNH2-AcNH2_1_z_+30        1                       0.0       1.0
  1                21_AcNH2-AcNH2_2_y_-30        1                       0.0       1.0
  1                21_AcNH2-AcNH2_2_y_+30        1                       0.0       1.0
  1                21_AcNH2-AcNH2_2_z_-30        1                       0.0       1.0
  1                21_AcNH2-AcNH2_2_z_+30        1                       0.0       1.0
  1                22_AcOH-Uracil_1_y_-30        1                       0.0       1.0
  1                22_AcOH-Uracil_1_y_+30        1                       0.0       1.0
  1                22_AcOH-Uracil_1_z_-30        1                       0.0       1.0
  1                22_AcOH-Uracil_1_z_+30        1                       0.0       1.0
  1                22_AcOH-Uracil_2_y_-30        1                       0.0       1.0
  1                22_AcOH-Uracil_2_y_+30        1                       0.0       1.0
  1                22_AcOH-Uracil_2_z_-30        1                       0.0       1.0
  1                22_AcOH-Uracil_2_z_+30        1                       0.0       1.0
  1               23_AcNH2-Uracil_1_y_-30        1                       0.0       1.0
  1               23_AcNH2-Uracil_1_y_+30        1                       0.0       1.0
  1               23_AcNH2-Uracil_1_z_-30        1                       0.0       1.0
  1               23_AcNH2-Uracil_1_z_+30        1                       0.0       1.0
  1               23_AcNH2-Uracil_2_y_-30        1                       0.0       1.0
  1               23_AcNH2-Uracil_2_y_+30        1                       0.0       1.0
  1               23_AcNH2-Uracil_2_z_-30        1                       0.0       1.0
  1               23_AcNH2-Uracil_2_z_+30        1                       0.0       1.0
  1      24_Benzene-Benzene_pi-pi_1_y_-30        1                       0.0       1.0
  1      24_Benzene-Benzene_pi-pi_1_y_+30        1                       0.0       1.0
  1      24_Benzene-Benzene_pi-pi_1_z_-30        1                       0.0       1.0
  1      24_Benzene-Benzene_pi-pi_1_z_+30        1                       0.0       1.0
  1      24_Benzene-Benzene_pi-pi_2_y_-30        1                       0.0       1.0
  1      24_Benzene-Benzene_pi-pi_2_y_+30        1                       0.0       1.0
  1      24_Benzene-Benzene_pi-pi_2_z_-30        1                       0.0       1.0
  1      24_Benzene-Benzene_pi-pi_2_z_+30        1                       0.0       1.0
  1    25_Pyridine-Pyridine_pi-pi_1_y_-30        1                       0.0       1.0
  1    25_Pyridine-Pyridine_pi-pi_1_y_+30        1                       0.0       1.0
  1    25_Pyridine-Pyridine_pi-pi_1_z_-30        1                       0.0       1.0
  1    25_Pyridine-Pyridine_pi-pi_1_z_+30        1                       0.0       1.0
  1    25_Pyridine-Pyridine_pi-pi_2_y_-30        1                       0.0       1.0
  1    25_Pyridine-Pyridine_pi-pi_2_y_+30        1                       0.0       1.0
  1    25_Pyridine-Pyridine_pi-pi_2_z_-30        1                       0.0       1.0
  1    25_Pyridine-Pyridine_pi-pi_2_z_+30        1                       0.0       1.0
  1        26_Uracil-Uracil_pi-pi_1_y_-30        1                       0.0       1.0
  1        26_Uracil-Uracil_pi-pi_1_y_+30        1                       0.0       1.0
  1        26_Uracil-Uracil_pi-pi_1_z_-30        1                       0.0       1.0
  1        26_Uracil-Uracil_pi-pi_1_z_+30        1                       0.0       1.0
  1        26_Uracil-Uracil_pi-pi_2_y_-30        1                       0.0       1.0
  1        26_Uracil-Uracil_pi-pi_2_y_+30        1                       0.0       1.0
  1        26_Uracil-Uracil_pi-pi_2_z_-30        1                       0.0       1.0
  1        26_Uracil-Uracil_pi-pi_2_z_+30        1                       0.0       1.0
  1     27_Benzene-Pyridine_pi-pi_1_y_-30        1                       0.0       1.0
  1     27_Benzene-Pyridine_pi-pi_1_y_+30        1                       0.0       1.0
  1     27_Benzene-Pyridine_pi-pi_1_z_-30        1                       0.0       1.0
  1     27_Benzene-Pyridine_pi-pi_1_z_+30        1                       0.0       1.0
  1     27_Benzene-Pyridine_pi-pi_2_y_-30        1                       0.0       1.0
  1     27_Benzene-Pyridine_pi-pi_2_y_+30        1                       0.0       1.0
  1     27_Benzene-Pyridine_pi-pi_2_z_-30        1                       0.0       1.0
  1     27_Benzene-Pyridine_pi-pi_2_z_+30        1                       0.0       1.0
  1       28_Benzene-Uracil_pi-pi_1_y_-30        1                       0.0       1.0
  1       28_Benzene-Uracil_pi-pi_1_y_+30        1                       0.0       1.0
  1       28_Benzene-Uracil_pi-pi_1_z_-30        1                       0.0       1.0
  1       28_Benzene-Uracil_pi-pi_1_z_+30        1                       0.0       1.0
  1       28_Benzene-Uracil_pi-pi_2_y_-30        1                       0.0       1.0
  1       28_Benzene-Uracil_pi-pi_2_y_+30        1                       0.0       1.0
  1       28_Benzene-Uracil_pi-pi_2_z_-30        1                       0.0       1.0
  1       28_Benzene-Uracil_pi-pi_2_z_+30        1                       0.0       1.0
  1      29_Pyridine-Uracil_pi-pi_1_y_-30        1                       0.0       1.0
  1      29_Pyridine-Uracil_pi-pi_1_y_+30        1                       0.0       1.0
  1      29_Pyridine-Uracil_pi-pi_1_z_-30        1                       0.0       1.0
  1      29_Pyridine-Uracil_pi-pi_1_z_+30        1                       0.0       1.0
  1      29_Pyridine-Uracil_pi-pi_2_y_-30        1                       0.0       1.0
  1      29_Pyridine-Uracil_pi-pi_2_y_+30        1                       0.0       1.0
  1      29_Pyridine-Uracil_pi-pi_2_z_-30        1                       0.0       1.0
  1      29_Pyridine-Uracil_pi-pi_2_z_+30        1                       0.0       1.0
  1             30_Benzene-Ethene_1_y_-30        1                       0.0       1.0
  1             30_Benzene-Ethene_1_y_+30        1                       0.0       1.0
  1             30_Benzene-Ethene_1_z_-30        1                       0.0       1.0
  1             30_Benzene-Ethene_1_z_+30        1                       0.0       1.0
  1             30_Benzene-Ethene_2_y_-30        1                       0.0       1.0
  1             30_Benzene-Ethene_2_y_+30        1                       0.0       1.0
  1             30_Benzene-Ethene_2_z_-30        1                       0.0       1.0
  1             30_Benzene-Ethene_2_z_+30        1                       0.0       1.0
  1              31_Uracil-Ethene_1_y_-30        1                       0.0       1.0
  1              31_Uracil-Ethene_1_y_+30        1                       0.0       1.0
  1              31_Uracil-Ethene_1_z_-30        1                       0.0       1.0
  1              31_Uracil-Ethene_1_z_+30        1                       0.0       1.0
  1              31_Uracil-Ethene_2_y_-30        1                       0.0       1.0
  1              31_Uracil-Ethene_2_y_+30        1                       0.0       1.0
  1              31_Uracil-Ethene_2_z_-30        1                       0.0       1.0
  1              31_Uracil-Ethene_2_z_+30        1                       0.0       1.0
  1              32_Uracil-Ethyne_1_y_-30        1                       0.0       1.0
  1              32_Uracil-Ethyne_1_y_+30        1                       0.0       1.0
  1              32_Uracil-Ethyne_1_z_-30        1                       0.0       1.0
  1              32_Uracil-Ethyne_1_z_+30        1                       0.0       1.0
  1              32_Uracil-Ethyne_2_y_-30        1                       0.0       1.0
  1              32_Uracil-Ethyne_2_y_+30        1                       0.0       1.0
  1              32_Uracil-Ethyne_2_z_-30        1                       0.0       1.0
  1              32_Uracil-Ethyne_2_z_+30        1                       0.0       1.0
  1            33_Pyridine-Ethene_1_y_-30        1                       0.0       1.0
  1            33_Pyridine-Ethene_1_y_+30        1                       0.0       1.0
  1            33_Pyridine-Ethene_1_z_-30        1                       0.0       1.0
  1            33_Pyridine-Ethene_1_z_+30        1                       0.0       1.0
  1            33_Pyridine-Ethene_2_y_-30        1                       0.0       1.0
  1            33_Pyridine-Ethene_2_y_+30        1                       0.0       1.0
  1            33_Pyridine-Ethene_2_z_-30        1                       0.0       1.0
  1            33_Pyridine-Ethene_2_z_+30        1                       0.0       1.0
  1            34_Pentane-Pentane_1_y_-30        1                       0.0       1.0
  1            34_Pentane-Pentane_1_y_+30        1                       0.0       1.0
  1            34_Pentane-Pentane_1_z_-30        1                       0.0       1.0
  1            34_Pentane-Pentane_1_z_+30        1                       0.0       1.0
  1            34_Pentane-Pentane_2_y_-30        1                       0.0       1.0
  1            34_Pentane-Pentane_2_y_+30        1                       0.0       1.0
  1            34_Pentane-Pentane_2_z_-30        1                       0.0       1.0
  1            34_Pentane-Pentane_2_z_+30        1                       0.0       1.0
  1         35_Neopentane-Pentane_1_y_-30        1                       0.0       1.0
  1         35_Neopentane-Pentane_1_y_+30        1                       0.0       1.0
  1         35_Neopentane-Pentane_1_z_-30        1                       0.0       1.0
  1         35_Neopentane-Pentane_1_z_+30        1                       0.0       1.0
  1         35_Neopentane-Pentane_2_y_-30        1                       0.0       1.0
  1         35_Neopentane-Pentane_2_y_+30        1                       0.0       1.0
  1         35_Neopentane-Pentane_2_z_-30        1                       0.0       1.0
  1         35_Neopentane-Pentane_2_z_+30        1                       0.0       1.0
  1      36_Neopentane-Neopentane_1_y_-30        1                       0.0       1.0
  1      36_Neopentane-Neopentane_1_y_+30        1                       0.0       1.0
  1      36_Neopentane-Neopentane_1_z_-30        1                       0.0       1.0
  1      36_Neopentane-Neopentane_1_z_+30        1                       0.0       1.0
  1      36_Neopentane-Neopentane_2_y_-30        1                       0.0       1.0
  1      36_Neopentane-Neopentane_2_y_+30        1                       0.0       1.0
  1      36_Neopentane-Neopentane_2_z_-30        1                       0.0       1.0
  1      36_Neopentane-Neopentane_2_z_+30        1                       0.0       1.0
  1    37_Cyclopentane-Neopentane_1_y_-30        1                       0.0       1.0
  1    37_Cyclopentane-Neopentane_1_y_+30        1                       0.0       1.0
  1    37_Cyclopentane-Neopentane_1_z_-30        1                       0.0       1.0
  1    37_Cyclopentane-Neopentane_1_z_+30        1                       0.0       1.0
  1    37_Cyclopentane-Neopentane_2_y_-30        1                       0.0       1.0
  1    37_Cyclopentane-Neopentane_2_y_+30        1                       0.0       1.0
  1    37_Cyclopentane-Neopentane_2_z_-30        1                       0.0       1.0
  1    37_Cyclopentane-Neopentane_2_z_+30        1                       0.0       1.0
  1  38_Cyclopentane-Cyclopentane_1_y_-30        1                       0.0       1.0
  1  38_Cyclopentane-Cyclopentane_1_y_+30        1                       0.0       1.0
  1  38_Cyclopentane-Cyclopentane_1_z_-30        1                       0.0       1.0
  1  38_Cyclopentane-Cyclopentane_1_z_+30        1                       0.0       1.0
  1  38_Cyclopentane-Cyclopentane_2_y_-30        1                       0.0       1.0
  1  38_Cyclopentane-Cyclopentane_2_y_+30        1                       0.0       1.0
  1  38_Cyclopentane-Cyclopentane_2_z_-30        1                       0.0       1.0
  1  38_Cyclopentane-Cyclopentane_2_z_+30        1                       0.0       1.0
  1       39_Benzene-Cyclopentane_1_y_-30        1                       0.0       1.0
  1       39_Benzene-Cyclopentane_1_y_+30        1                       0.0       1.0
  1       39_Benzene-Cyclopentane_1_z_-30        1                       0.0       1.0
  1       39_Benzene-Cyclopentane_1_z_+30        1                       0.0       1.0
  1       39_Benzene-Cyclopentane_2_y_-30        1                       0.0       1.0
  1       39_Benzene-Cyclopentane_2_y_+30        1                       0.0       1.0
  1       39_Benzene-Cyclopentane_2_z_-30        1                       0.0       1.0
  1       39_Benzene-Cyclopentane_2_z_+30        1                       0.0       1.0
  1         40_Benzene-Neopentane_1_y_-30        1                       0.0       1.0
  1         40_Benzene-Neopentane_1_y_+30        1                       0.0       1.0
  1         40_Benzene-Neopentane_1_z_-30        1                       0.0       1.0
  1         40_Benzene-Neopentane_1_z_+30        1                       0.0       1.0
  1         40_Benzene-Neopentane_2_y_-30        1                       0.0       1.0
  1         40_Benzene-Neopentane_2_y_+30        1                       0.0       1.0
  1         40_Benzene-Neopentane_2_z_-30        1                       0.0       1.0
  1         40_Benzene-Neopentane_2_z_+30        1                       0.0       1.0
  1             41_Uracil-Pentane_1_y_-30        1                       0.0       1.0
  1             41_Uracil-Pentane_1_y_+30        1                       0.0       1.0
  1             41_Uracil-Pentane_1_z_-30        1                       0.0       1.0
  1             41_Uracil-Pentane_1_z_+30        1                       0.0       1.0
  1             41_Uracil-Pentane_2_y_-30        1                       0.0       1.0
  1             41_Uracil-Pentane_2_y_+30        1                       0.0       1.0
  1             41_Uracil-Pentane_2_z_-30        1                       0.0       1.0
  1             41_Uracil-Pentane_2_z_+30        1                       0.0       1.0
  1        42_Uracil-Cyclopentane_1_y_-30        1                       0.0       1.0
  1        42_Uracil-Cyclopentane_1_y_+30        1                       0.0       1.0
  1        42_Uracil-Cyclopentane_1_z_-30        1                       0.0       1.0
  1        42_Uracil-Cyclopentane_1_z_+30        1                       0.0       1.0
  1        42_Uracil-Cyclopentane_2_y_-30        1                       0.0       1.0
  1        42_Uracil-Cyclopentane_2_y_+30        1                       0.0       1.0
  1        42_Uracil-Cyclopentane_2_z_-30        1                       0.0       1.0
  1        42_Uracil-Cyclopentane_2_z_+30        1                       0.0       1.0
  1          43_Uracil-Neopentane_1_y_-30        1                       0.0       1.0
  1          43_Uracil-Neopentane_1_y_+30        1                       0.0       1.0
  1          43_Uracil-Neopentane_1_z_-30        1                       0.0       1.0
  1          43_Uracil-Neopentane_1_z_+30        1                       0.0       1.0
  1          43_Uracil-Neopentane_2_y_-30        1                       0.0       1.0
  1          43_Uracil-Neopentane_2_y_+30        1                       0.0       1.0
  1          43_Uracil-Neopentane_2_z_-30        1                       0.0       1.0
  1          43_Uracil-Neopentane_2_z_+30        1                       0.0       1.0
  1             44_Ethene-Pentane_1_y_-30        1                       0.0       1.0
  1             44_Ethene-Pentane_1_y_+30        1                       0.0       1.0
  1             44_Ethene-Pentane_1_z_-30        1                       0.0       1.0
  1             44_Ethene-Pentane_1_z_+30        1                       0.0       1.0
  1             44_Ethene-Pentane_2_y_-30        1                       0.0       1.0
  1             44_Ethene-Pentane_2_y_+30        1                       0.0       1.0
  1             44_Ethene-Pentane_2_z_-30        1                       0.0       1.0
  1             44_Ethene-Pentane_2_z_+30        1                       0.0       1.0
  1             45_Ethyne-Pentane_1_y_-30        1                       0.0       1.0
  1             45_Ethyne-Pentane_1_y_+30        1                       0.0       1.0
  1             45_Ethyne-Pentane_1_z_-30        1                       0.0       1.0
  1             45_Ethyne-Pentane_1_z_+30        1                       0.0       1.0
  1             45_Ethyne-Pentane_2_y_-30        1                       0.0       1.0
  1             45_Ethyne-Pentane_2_y_+30        1                       0.0       1.0
  1             45_Ethyne-Pentane_2_z_-30        1                       0.0       1.0
  1             45_Ethyne-Pentane_2_z_+30        1                       0.0       1.0
  1            46_Peptide-Pentane_1_y_-30        1                       0.0       1.0
  1            46_Peptide-Pentane_1_y_+30        1                       0.0       1.0
  1            46_Peptide-Pentane_1_z_-30        1                       0.0       1.0
  1            46_Peptide-Pentane_1_z_+30        1                       0.0       1.0
  1            46_Peptide-Pentane_2_y_-30        1                       0.0       1.0
  1            46_Peptide-Pentane_2_y_+30        1                       0.0       1.0
  1            46_Peptide-Pentane_2_z_-30        1                       0.0       1.0
  1            46_Peptide-Pentane_2_z_+30        1                       0.0       1.0
  1         47_Benzene-Benzene_TS_1_y_-30        1                       0.0       1.0
  1         47_Benzene-Benzene_TS_1_y_+30        1                       0.0       1.0
  1         47_Benzene-Benzene_TS_1_z_-30        1                       0.0       1.0
  1         47_Benzene-Benzene_TS_1_z_+30        1                       0.0       1.0
  1         47_Benzene-Benzene_TS_2_y_-30        1                       0.0       1.0
  1         47_Benzene-Benzene_TS_2_y_+30        1                       0.0       1.0
  1         47_Benzene-Benzene_TS_2_z_-30        1                       0.0       1.0
  1         47_Benzene-Benzene_TS_2_z_+30        1                       0.0       1.0
  1       48_Pyridine-Pyridine_TS_1_y_-30        1                       0.0       1.0
  1       48_Pyridine-Pyridine_TS_1_y_+30        1                       0.0       1.0
  1       48_Pyridine-Pyridine_TS_1_z_-30        1                       0.0       1.0
  1       48_Pyridine-Pyridine_TS_1_z_+30        1                       0.0       1.0
  1       48_Pyridine-Pyridine_TS_2_y_-30        1                       0.0       1.0
  1       48_Pyridine-Pyridine_TS_2_y_+30        1                       0.0       1.0
  1       48_Pyridine-Pyridine_TS_2_z_-30        1                       0.0       1.0
  1       48_Pyridine-Pyridine_TS_2_z_+30        1                       0.0       1.0
  1        49_Benzene-Pyridine_TS_1_y_-30        1                       0.0       1.0
  1        49_Benzene-Pyridine_TS_1_y_+30        1                       0.0       1.0
  1        49_Benzene-Pyridine_TS_1_z_-30        1                       0.0       1.0
  1        49_Benzene-Pyridine_TS_1_z_+30        1                       0.0       1.0
  1        49_Benzene-Pyridine_TS_2_y_-30        1                       0.0       1.0
  1        49_Benzene-Pyridine_TS_2_y_+30        1                       0.0       1.0
  1        49_Benzene-Pyridine_TS_2_z_-30        1                       0.0       1.0
  1        49_Benzene-Pyridine_TS_2_z_+30        1                       0.0       1.0
  1       50_Benzene-Ethyne_CH-pi_1_y_-30        1                       0.0       1.0
  1       50_Benzene-Ethyne_CH-pi_1_y_+30        1                       0.0       1.0
  1       50_Benzene-Ethyne_CH-pi_1_z_-30        1                       0.0       1.0
  1       50_Benzene-Ethyne_CH-pi_1_z_+30        1                       0.0       1.0
  1       50_Benzene-Ethyne_CH-pi_2_y_-30        1                       0.0       1.0
  1       50_Benzene-Ethyne_CH-pi_2_y_+30        1                       0.0       1.0
  1       50_Benzene-Ethyne_CH-pi_2_z_-30        1                       0.0       1.0
  1       50_Benzene-Ethyne_CH-pi_2_z_+30        1                       0.0       1.0
  1           51_Ethyne-Ethyne_TS_1_y_-30        1                       0.0       1.0
  1           51_Ethyne-Ethyne_TS_1_y_+30        1                       0.0       1.0
  1           51_Ethyne-Ethyne_TS_1_z_-30        1                       0.0       1.0
  1           51_Ethyne-Ethyne_TS_1_z_+30        1                       0.0       1.0
  1           51_Ethyne-Ethyne_TS_2_y_-30        1                       0.0       1.0
  1           51_Ethyne-Ethyne_TS_2_y_+30        1                       0.0       1.0
  1           51_Ethyne-Ethyne_TS_2_z_-30        1                       0.0       1.0
  1           51_Ethyne-Ethyne_TS_2_z_+30        1                       0.0       1.0
  1         52_Benzene-AcOH_OH-pi_1_y_-30        1                       0.0       1.0
  1         52_Benzene-AcOH_OH-pi_1_y_+30        1                       0.0       1.0
  1         52_Benzene-AcOH_OH-pi_1_z_-30        1                       0.0       1.0
  1         52_Benzene-AcOH_OH-pi_1_z_+30        1                       0.0       1.0
  1         52_Benzene-AcOH_OH-pi_2_y_-30        1                       0.0       1.0
  1         52_Benzene-AcOH_OH-pi_2_y_+30        1                       0.0       1.0
  1         52_Benzene-AcOH_OH-pi_2_z_-30        1                       0.0       1.0
  1         52_Benzene-AcOH_OH-pi_2_z_+30        1                       0.0       1.0
  1        53_Benzene-AcNH2_NH-pi_1_y_-30        1                       0.0       1.0
  1        53_Benzene-AcNH2_NH-pi_1_y_+30        1                       0.0       1.0
  1        53_Benzene-AcNH2_NH-pi_1_z_-30        1                       0.0       1.0
  1        53_Benzene-AcNH2_NH-pi_1_z_+30        1                       0.0       1.0
  1        53_Benzene-AcNH2_NH-pi_2_y_-30        1                       0.0       1.0
  1        53_Benzene-AcNH2_NH-pi_2_y_+30        1                       0.0       1.0
  1        53_Benzene-AcNH2_NH-pi_2_z_-30        1                       0.0       1.0
  1        53_Benzene-AcNH2_NH-pi_2_z_+30        1                       0.0       1.0
  1        54_Benzene-Water_OH-pi_1_y_-30        1                       0.0       1.0
  1        54_Benzene-Water_OH-pi_1_y_+30        1                       0.0       1.0
  1        54_Benzene-Water_OH-pi_1_z_-30        1                       0.0       1.0
  1        54_Benzene-Water_OH-pi_1_z_+30        1                       0.0       1.0
  1        54_Benzene-Water_OH-pi_2_y_-30        1                       0.0       1.0
  1        54_Benzene-Water_OH-pi_2_y_+30        1                       0.0       1.0
  1        54_Benzene-Water_OH-pi_2_z_-30        1                       0.0       1.0
  1        54_Benzene-Water_OH-pi_2_z_+30        1                       0.0       1.0
  1         55_Benzene-MeOH_OH-pi_1_y_-30        1                       0.0       1.0
  1         55_Benzene-MeOH_OH-pi_1_y_+30        1                       0.0       1.0
  1         55_Benzene-MeOH_OH-pi_1_z_-30        1                       0.0       1.0
  1         55_Benzene-MeOH_OH-pi_1_z_+30        1                       0.0       1.0
  1         55_Benzene-MeOH_OH-pi_2_y_-30        1                       0.0       1.0
  1         55_Benzene-MeOH_OH-pi_2_y_+30        1                       0.0       1.0
  1         55_Benzene-MeOH_OH-pi_2_z_-30        1                       0.0       1.0
  1         55_Benzene-MeOH_OH-pi_2_z_+30        1                       0.0       1.0
  1        56_Benzene-MeNH2_NH-pi_1_y_-30        1                       0.0       1.0
  1        56_Benzene-MeNH2_NH-pi_1_y_+30        1                       0.0       1.0
  1        56_Benzene-MeNH2_NH-pi_1_z_-30        1                       0.0       1.0
  1        56_Benzene-MeNH2_NH-pi_1_z_+30        1                       0.0       1.0
  1        56_Benzene-MeNH2_NH-pi_2_y_-30        1                       0.0       1.0
  1        56_Benzene-MeNH2_NH-pi_2_y_+30        1                       0.0       1.0
  1        56_Benzene-MeNH2_NH-pi_2_z_-30        1                       0.0       1.0
  1        56_Benzene-MeNH2_NH-pi_2_z_+30        1                       0.0       1.0
  1      57_Benzene-Peptide_NH-pi_1_y_-30        1                       0.0       1.0
  1      57_Benzene-Peptide_NH-pi_1_y_+30        1                       0.0       1.0
  1      57_Benzene-Peptide_NH-pi_1_z_-30        1                       0.0       1.0
  1      57_Benzene-Peptide_NH-pi_1_z_+30        1                       0.0       1.0
  1      57_Benzene-Peptide_NH-pi_2_y_-30        1                       0.0       1.0
  1      57_Benzene-Peptide_NH-pi_2_y_+30        1                       0.0       1.0
  1      57_Benzene-Peptide_NH-pi_2_z_-30        1                       0.0       1.0
  1      57_Benzene-Peptide_NH-pi_2_z_+30        1                       0.0       1.0
  1     58_Pyridine-Pyridine_CH-N_1_y_-30        1                       0.0       1.0
  1     58_Pyridine-Pyridine_CH-N_1_y_+30        1                       0.0       1.0
  1     58_Pyridine-Pyridine_CH-N_1_z_-30        1                       0.0       1.0
  1     58_Pyridine-Pyridine_CH-N_1_z_+30        1                       0.0       1.0
  1     58_Pyridine-Pyridine_CH-N_2_y_-30        1                       0.0       1.0
  1     58_Pyridine-Pyridine_CH-N_2_y_+30        1                       0.0       1.0
  1     58_Pyridine-Pyridine_CH-N_2_z_-30        1                       0.0       1.0
  1     58_Pyridine-Pyridine_CH-N_2_z_+30        1                       0.0       1.0
  1          59_Ethyne-Water_CH-O_1_y_-30        1                       0.0       1.0
  1          59_Ethyne-Water_CH-O_1_y_+30        1                       0.0       1.0
  1          59_Ethyne-Water_CH-O_1_z_-30        1                       0.0       1.0
  1          59_Ethyne-Water_CH-O_1_z_+30        1                       0.0       1.0
  1          59_Ethyne-Water_CH-O_2_y_-30        1                       0.0       1.0
  1          59_Ethyne-Water_CH-O_2_y_+30        1                       0.0       1.0
  1          59_Ethyne-Water_CH-O_2_z_-30        1                       0.0       1.0
  1          59_Ethyne-Water_CH-O_2_z_+30        1                       0.0       1.0
  1          60_Ethyne-AcOH_OH-pi_1_y_-30        1                       0.0       1.0
  1          60_Ethyne-AcOH_OH-pi_1_y_+30        1                       0.0       1.0
  1          60_Ethyne-AcOH_OH-pi_1_z_-30        1                       0.0       1.0
  1          60_Ethyne-AcOH_OH-pi_1_z_+30        1                       0.0       1.0
  1          60_Ethyne-AcOH_OH-pi_2_y_-30        1                       0.0       1.0
  1          60_Ethyne-AcOH_OH-pi_2_y_+30        1                       0.0       1.0
  1          60_Ethyne-AcOH_OH-pi_2_z_-30        1                       0.0       1.0
  1          60_Ethyne-AcOH_OH-pi_2_z_+30        1                       0.0       1.0
  1               61_Pentane-AcOH_1_y_-30        1                       0.0       1.0
  1               61_Pentane-AcOH_1_y_+30        1                       0.0       1.0
  1               61_Pentane-AcOH_1_z_-30        1                       0.0       1.0
  1               61_Pentane-AcOH_1_z_+30        1                       0.0       1.0
  1               61_Pentane-AcOH_2_y_-30        1                       0.0       1.0
  1               61_Pentane-AcOH_2_y_+30        1                       0.0       1.0
  1               61_Pentane-AcOH_2_z_-30        1                       0.0       1.0
  1               61_Pentane-AcOH_2_z_+30        1                       0.0       1.0
  1              62_Pentane-AcNH2_1_y_-30        1                       0.0       1.0
  1              62_Pentane-AcNH2_1_y_+30        1                       0.0       1.0
  1              62_Pentane-AcNH2_1_z_-30        1                       0.0       1.0
  1              62_Pentane-AcNH2_1_z_+30        1                       0.0       1.0
  1              62_Pentane-AcNH2_2_y_-30        1                       0.0       1.0
  1              62_Pentane-AcNH2_2_y_+30        1                       0.0       1.0
  1              62_Pentane-AcNH2_2_z_-30        1                       0.0       1.0
  1              62_Pentane-AcNH2_2_z_+30        1                       0.0       1.0
  1               63_Benzene-AcOH_1_y_-30        1                       0.0       1.0
  1               63_Benzene-AcOH_1_y_+30        1                       0.0       1.0
  1               63_Benzene-AcOH_1_z_-30        1                       0.0       1.0
  1               63_Benzene-AcOH_1_z_+30        1                       0.0       1.0
  1               63_Benzene-AcOH_2_y_-30        1                       0.0       1.0
  1               63_Benzene-AcOH_2_y_+30        1                       0.0       1.0
  1               63_Benzene-AcOH_2_z_-30        1                       0.0       1.0
  1               63_Benzene-AcOH_2_z_+30        1                       0.0       1.0
  1             64_Peptide-Ethene_1_y_-30        1                       0.0       1.0
  1             64_Peptide-Ethene_1_y_+30        1                       0.0       1.0
  1             64_Peptide-Ethene_1_z_-30        1                       0.0       1.0
  1             64_Peptide-Ethene_1_z_+30        1                       0.0       1.0
  1             64_Peptide-Ethene_2_y_-30        1                       0.0       1.0
  1             64_Peptide-Ethene_2_y_+30        1                       0.0       1.0
  1             64_Peptide-Ethene_2_z_-30        1                       0.0       1.0
  1             64_Peptide-Ethene_2_z_+30        1                       0.0       1.0
  1            65_Pyridine-Ethyne_1_y_-30        1                       0.0       1.0
  1            65_Pyridine-Ethyne_1_y_+30        1                       0.0       1.0
  1            65_Pyridine-Ethyne_1_z_-30        1                       0.0       1.0
  1            65_Pyridine-Ethyne_1_z_+30        1                       0.0       1.0
  1            65_Pyridine-Ethyne_2_y_-30        1                       0.0       1.0
  1            65_Pyridine-Ethyne_2_y_+30        1                       0.0       1.0
  1            65_Pyridine-Ethyne_2_z_-30        1                       0.0       1.0
  1            65_Pyridine-Ethyne_2_z_+30        1                       0.0       1.0
  1             66_MeNH2-Pyridine_1_y_-30        1                       0.0       1.0
  1             66_MeNH2-Pyridine_1_y_+30        1                       0.0       1.0
  1             66_MeNH2-Pyridine_1_z_-30        1                       0.0       1.0
  1             66_MeNH2-Pyridine_1_z_+30        1                       0.0       1.0
  1             66_MeNH2-Pyridine_2_y_-30        1                       0.0       1.0
  1             66_MeNH2-Pyridine_2_y_+30        1                       0.0       1.0
  1             66_MeNH2-Pyridine_2_z_-30        1                       0.0       1.0
  1             66_MeNH2-Pyridine_2_z_+30        1                       0.0       1.0
