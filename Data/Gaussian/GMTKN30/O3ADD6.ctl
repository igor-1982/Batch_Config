# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./O3ADD6           2            Gaussian

# The project description
__title__ ::
"============================== O3ADD6 set ============================="
"             This is O3ADD6 subset from GMTKN30 proposed by Grimme     "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/G3Large NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                9 is the total number of jobs in this batch list
__batch__ :: 9
#"Flag"         "DIR"                        "InpName"       "JobType"
        c2h2    <PATH1>/O3ADD6             c2h2.com         energy
        c2h4    <PATH1>/O3ADD6             c2h4.com         energy
 o3_c2h2_add    <PATH1>/O3ADD6      o3_c2h2_add.com         energy
  o3_c2h2_ts    <PATH1>/O3ADD6       o3_c2h2_ts.com         energy
 o3_c2h2_vdw    <PATH1>/O3ADD6      o3_c2h2_vdw.com         energy
 o3_c2h4_add    <PATH1>/O3ADD6      o3_c2h4_add.com         energy
  o3_c2h4_ts    <PATH1>/O3ADD6       o3_c2h4_ts.com         energy
 o3_c2h4_vdw    <PATH1>/O3ADD6      o3_c2h4_vdw.com         energy
          o3    <PATH1>/O3ADD6               o3.com         energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
 3    o3     -1    c2h2     -1  o3_c2h2_vdw      1           -1.90       1.0
 3    o3     -1    c2h2     -1  o3_c2h2_ts       1            7.74       1.0
 3    o3     -1    c2h2     -1  o3_c2h2_add      1          -63.80       1.0
 3    o3     -1    c2h4     -1  o3_c2h4_vdw      1           -1.94       1.0
 3    o3     -1    c2h4     -1  o3_c2h4_ts       1            3.37       1.0
 3    o3     -1    c2h4     -1  o3_c2h4_add      1          -57.15       1.0


