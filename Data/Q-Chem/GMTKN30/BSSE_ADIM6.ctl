# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BSSE_ADIM6           2              QChem

# The project description
__title__ ::
"============================== ADIM6 set ============================="
"             This is ADIM6 subset from GMTKN30 proposed by Grimme     "

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
#                6 is the total number of jobs in this batch list
__batch__ :: 6
#"Flag"         "DIR"                        "InpName"       "JobType"
 AD2           <PATH1>/BSSE_ADIM6                  AD2.in            energy
 AD3           <PATH1>/BSSE_ADIM6                  AD3.in            energy
 AD4           <PATH1>/BSSE_ADIM6                  AD4.in            energy
 AD5           <PATH1>/BSSE_ADIM6                  AD5.in            energy
 AD6           <PATH1>/BSSE_ADIM6                  AD6.in            energy
 AD7           <PATH1>/BSSE_ADIM6                  AD7.in            energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag" "Scale"                            "Ref"      "Weight"
  1          AD2          1                         0.0000       1.0
  1          AD3          1                         0.0000       1.0
  1          AD4          1                         0.0000       1.0
  1          AD5          1                         0.0000       1.0
  1          AD6          1                         0.0000       1.0
  1          AD7          1                         0.0000       1.0
