# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./RG6           2              QChem

# The project description
__title__ ::
"============================== RG3 set ============================="
"             This is RG3 subset modified from RG6                   "
"             which is a subset of GMTKN30 proposed by Grimme        "

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
<PATH1> = '/home/wenxinzy/export/softs/Batch_Config/Data/Q-Chem/GMTKN30'

# The molecular set to batch: 
#               9 is the total number of jobs in this batch list
__batch__ :: 9
#"Flag"         "DIR"                        "InpName"       "JobType"
 ne_2           <PATH1>/RG6                 ne_2.in            energy
 ne             <PATH1>/RG6                   ne.in            energy
 ne_cp          <PATH1>/RG6                ne_cp.in            energy
 ar_2           <PATH1>/RG6                 ar_2.in            energy
 ar             <PATH1>/RG6                   ar.in            energy
 ar_cp          <PATH1>/RG6                ar_cp.in            energy
 kr_2           <PATH1>/RG6                 kr_2.in            energy
 kr             <PATH1>/RG6                   kr.in            energy
 kr_cp          <PATH1>/RG6                kr_cp.in            energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag" "Scale"                                           "Ref"      "Weight"
  2        ne_2       -1       ne        2                         0.08       1.0
  2        ar_2       -1       ar        2                         0.28       1.0
  2        kr_2       -1       kr        2                         0.40       1.0
