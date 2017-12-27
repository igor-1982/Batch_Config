# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ADIM6           2              QChem

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
#                12 is the total number of jobs in this batch list
__batch__ :: 12
#"Flag"         "DIR"                        "InpName"       "JobType"
 AM2           <PATH1>/ADIM6                  AM2.in            energy
 AD2           <PATH1>/ADIM6                  AD2.in            energy
 AM3           <PATH1>/ADIM6                  AM3.in            energy
 AD3           <PATH1>/ADIM6                  AD3.in            energy
 AM4           <PATH1>/ADIM6                  AM4.in            energy
 AD4           <PATH1>/ADIM6                  AD4.in            energy
 AM5           <PATH1>/ADIM6                  AM5.in            energy
 AD5           <PATH1>/ADIM6                  AD5.in            energy
 AM6           <PATH1>/ADIM6                  AM6.in            energy
 AD6           <PATH1>/ADIM6                  AD6.in            energy
 AM7           <PATH1>/ADIM6                  AM7.in            energy
 AD7           <PATH1>/ADIM6                  AD7.in            energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag" "Scale"                            "Ref"      "Weight"
  2         AM2    2        AD2          -1         1.30       1.0
  2         AM3    2        AD3          -1         1.97       1.0
  2         AM4    2        AD4          -1         2.79       1.0
  2         AM5    2        AD5          -1         3.68       1.0
  2         AM6    2        AD6          -1         4.61       1.0
  2         AM7    2        AD7          -1         5.60       1.0
