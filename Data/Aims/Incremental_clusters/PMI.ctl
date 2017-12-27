# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./S22           2                Aims

# The project description
__title__ ::
"============================== Incremental PMI set ============================="
"                  Incremental PMI set constructed for RRS-PBC                   "

# several global statements of control.in for aims Package
__aims_basis__ :: /home/zhang/Documents/Package-Pool/aims/my_basis_pool/gaussian/cc-pVDZ
__aims__ ::  2  081912.mpi
xc                      pbe                  
#total_energy_method     rpa
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.6
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           200
rpa_frozen_core         1
end aims          



# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '/home/zhang/Dropbox/SourceCode-Pool/Batch_Config/Data/Aims/Incremental_clusters'

# The molecular set to batch: 
#                10 is the total number of jobs in this batch list
__batch__ :: 10
#"Flag"         "DIR"                        "InpName"       "JobType"
 H_0            <PATH1>/PMI                  H_0              energy
 C_0            <PATH1>/PMI                  C_0              energy
 N_0            <PATH1>/PMI                  N_0              energy
 09             <PATH1>/PMI                  Cluster_09       energy
 19             <PATH1>/PMI                  Cluster_19       energy
 29             <PATH1>/PMI                  Cluster_29       energy
 39             <PATH1>/PMI                  Cluster_39       energy
 49             <PATH1>/PMI                  Cluster_49       energy
 79             <PATH1>/PMI                  Cluster_79       energy
 99             <PATH1>/PMI                  Cluster_99       energy

# Training set for the atomization energy
#               22 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 7  627.51
#"Number" "Flag" "Scale"                               "Ref"      "Weight"
  4        09     -0.1111111  H_0  1  C_0  1  N_0  1   0.00        1.0
  4        19     -0.0562316  H_0  1  C_0  1  N_0  1   0.00        1.0
  4        29     -0.0344828  H_0  1  C_0  1  N_0  1   0.00        1.0
  4        39     -0.0256410  H_0  1  C_0  1  N_0  1   0.00        1.0
  4        49     -0.0204082  H_0  1  C_0  1  N_0  1   0.00        1.0
  4        79     -0.0126582  H_0  1  C_0  1  N_0  1   0.00        1.0
  4        99     -0.0101010  H_0  1  C_0  1  N_0  1   0.00        1.0
