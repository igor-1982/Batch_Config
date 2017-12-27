# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./O3ADD6           2            QChem 

# The project description
__title__ ::
"============================== O3ADD6 set ============================="
"             This is O3ADD6 subset from GMTKN30 proposed by Grimme     "

# $rem group of Q-Chem Package
__qchem__ ::  1  rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static      = 200
mem_total       = 7500
exchange        = b3lyp
basis           = g3large
max_scf_cycles  = 50
scf_convergence = 7
symmetry        = false
xc_grid         = 000075000302                                                               
$end


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                9 is the total number of jobs in this batch list
__batch__ :: 9
#"Flag"         "DIR"                        "InpName"       "JobType"
        c2h2    <PATH1>/O3ADD6             c2h2.in          energy
        c2h4    <PATH1>/O3ADD6             c2h4.in          energy
 o3_c2h2_add    <PATH1>/O3ADD6      o3_c2h2_add.in          energy
  o3_c2h2_ts    <PATH1>/O3ADD6       o3_c2h2_ts.in          energy
 o3_c2h2_vdw    <PATH1>/O3ADD6      o3_c2h2_vdw.in          energy
 o3_c2h4_add    <PATH1>/O3ADD6      o3_c2h4_add.in          energy
  o3_c2h4_ts    <PATH1>/O3ADD6       o3_c2h4_ts.in          energy
 o3_c2h4_vdw    <PATH1>/O3ADD6      o3_c2h4_vdw.in          energy
          o3    <PATH1>/O3ADD6               o3.in          energy


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


