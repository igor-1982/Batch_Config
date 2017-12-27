# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./MES-light           2                Aims

# The project description
__title__ ::
"============================== MES-light set ============================="
"                                                                          "

# several global statements of control.in for aims Package
__aims_basis__ :: /home/zhang/Documents/Package-Pool/aims/my_basis_pool/gaussian/cc-pVDZ
__aims__ ::  2  081912.mpi
  xc                       pbe
  total_energy_method      rpa
# K or R space algorithm in the exact-exchange part
#  use_hf_kspace_with_rpa   .true.
#  use_hf_kspace            .true.
#  KS_method                lapack
# Parameters related to the SCF convergence
  mixer                    pulay
  sc_iter_limit            100
  sc_accuracy_rho          1E-6
  sc_accuracy_eev          1E-4
  sc_accuracy_etot         1E-6
  override_illconditioning .true.
# K grid number
  k_grid                   1 1 1
end aims          



# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/home/zhang/Dropbox/SourceCode-Pool/Batch_Config/Data/Aims/GMTKN30/'

# The molecular set to batch: 
#                32 is the total number of jobs in this batch list
__batch__ :: 32
#"Flag"         "DIR"                           "InpName"       "JobType"
 AlN_RS         <PATH1>/MSE_light_extended      AlN_RS          energy|rpa
 AlN_WZ         <PATH1>/MSE_light_extended      AlN_WZ          energy|rpa
 AlN_ZB         <PATH1>/MSE_light_extended      AlN_ZB          energy|rpa
 AlP_WZ         <PATH1>/MSE_light_extended      AlP_WZ          energy|rpa
 AlP_ZB         <PATH1>/MSE_light_extended      AlP_ZB          energy|rpa
 Backup         <PATH1>/MSE_light_extended      Backup          energy|rpa
 BeO_WZ         <PATH1>/MSE_light_extended      BeO_WZ          energy|rpa
 BeO_ZB         <PATH1>/MSE_light_extended      BeO_ZB          energy|rpa
 BeS_WZ         <PATH1>/MSE_light_extended      BeS_WZ          energy|rpa
 BeS_ZB         <PATH1>/MSE_light_extended      BeS_ZB          energy|rpa
 BN_WZ          <PATH1>/MSE_light_extended      BN_WZ           energy|rpa
 BN_ZB          <PATH1>/MSE_light_extended      BN_ZB           energy|rpa
 BP_WZ          <PATH1>/MSE_light_extended      BP_WZ           energy|rpa
 BP_ZB          <PATH1>/MSE_light_extended      BP_ZB           energy|rpa
 CC_WZ          <PATH1>/MSE_light_extended      CC_WZ           energy|rpa
 CC_ZB          <PATH1>/MSE_light_extended      CC_ZB           energy|rpa
 LiCl_RS        <PATH1>/MSE_light_extended      LiCl_RS         energy|rpa
 LiCl_WZ        <PATH1>/MSE_light_extended      LiCl_WZ         energy|rpa
 LiCl_ZB        <PATH1>/MSE_light_extended      LiCl_ZB         energy|rpa
 LiF_RS         <PATH1>/MSE_light_extended      LiF_RS          energy|rpa
 LiF_WZ         <PATH1>/MSE_light_extended      LiF_WZ          energy|rpa
 LiF_ZB         <PATH1>/MSE_light_extended      LiF_ZB          energy|rpa
 MgO_RS         <PATH1>/MSE_light_extended      MgO_RS          energy|rpa
 MgS_RS         <PATH1>/MSE_light_extended      MgS_RS          energy|rpa
 MgS_WZ         <PATH1>/MSE_light_extended      MgS_WZ          energy|rpa
 MgS_ZB         <PATH1>/MSE_light_extended      MgS_ZB          energy|rpa
 NaCl_RS        <PATH1>/MSE_light_extended      NaCl_RS         energy|rpa
 NaF_RS         <PATH1>/MSE_light_extended      NaF_RS          energy|rpa
 SiC_WZ         <PATH1>/MSE_light_extended      SiC_WZ          energy|rpa
 SiC_ZB         <PATH1>/MSE_light_extended      SiC_ZB          energy|rpa
 SiSi_WZ        <PATH1>/MSE_light_extended      SiSi_WZ         energy|rpa
 SiSi_ZB        <PATH1>/MSE_light_extended      SiSi_ZB         energy|rpa

# Training set for the atomization energy
#               32 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 4  1.0
#"Number" "Flag" "Scale"                            "Ref"      "Weight"
  1      AlN_RS           1                         0.00     1.0
  1      AlN_WZ           1                         0.00     1.0
  1      AlN_ZB           1                         0.00     1.0
  1      AlP_WZ           1                         0.00     1.0
  1      AlP_ZB           1                         0.00     1.0
  1      Backup           1                         0.00     1.0
  1      BeO_WZ           1                         0.00     1.0
  1      BeO_ZB           1                         0.00     1.0
  1      BeS_WZ           1                         0.00     1.0
  1      BeS_ZB           1                         0.00     1.0
  1      BN_WZ            1                         0.00     1.0
  1      BN_ZB            1                         0.00     1.0
  1      BP_WZ            1                         0.00     1.0
  1      BP_ZB            1                         0.00     1.0
  1      CC_WZ            1                         0.00     1.0
  1      CC_ZB            1                         0.00     1.0
  1      LiCl_RS          1                         0.00     1.0
  1      LiCl_WZ          1                         0.00     1.0
  1      LiCl_ZB          1                         0.00     1.0
  1      LiF_RS           1                         0.00     1.0
  1      LiF_WZ           1                         0.00     1.0
  1      LiF_ZB           1                         0.00     1.0
  1      MgO_RS           1                         0.00     1.0 
  1      MgS_RS           1                         0.00     1.0 
  1      MgS_WZ           1                         0.00     1.0 
  1      MgS_ZB           1                         0.00     1.0 
  1      NaCl_RS          1                         0.00     1.0 
  1      NaF_RS           1                         0.00     1.0  
  1      SiC_WZ           1                         0.00     1.0  
  1      SiC_ZB           1                         0.00     1.0  
  1      SiSi_WZ          1                         0.00     1.0 
  1      SiSi_ZB          1                         0.00     1.0 























