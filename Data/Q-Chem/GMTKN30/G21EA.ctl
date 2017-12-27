# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G21EA           2             QChem

# The project description
__title__ ::
"============================== G21EA set ============================="
"             This is G21EA subset from GMTKN30 proposed by Grimme     "

# $rem group of Q-Chem Package
__qchem__ ::  1 rmp2  # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
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
#                50 is the total number of jobs in this batch list
__batch__ :: 50
#"Flag"         "DIR"                        "InpName"       "JobType"
     EA_10      <PATH1>/G21EA                EA_10.in        energy
    EA_10n      <PATH1>/G21EA               EA_10n.in        energy
     EA_11      <PATH1>/G21EA                EA_11.in        energy
    EA_11n      <PATH1>/G21EA               EA_11n.in        energy
     EA_12      <PATH1>/G21EA                EA_12.in        energy
    EA_12n      <PATH1>/G21EA               EA_12n.in        energy
     EA_13      <PATH1>/G21EA                EA_13.in        energy
    EA_13n      <PATH1>/G21EA               EA_13n.in        energy
     EA_14      <PATH1>/G21EA                EA_14.in        energy
    EA_14n      <PATH1>/G21EA               EA_14n.in        energy
     EA_15      <PATH1>/G21EA                EA_15.in        energy
    EA_15n      <PATH1>/G21EA               EA_15n.in        energy
     EA_16      <PATH1>/G21EA                EA_16.in        energy
    EA_16n      <PATH1>/G21EA               EA_16n.in        energy
     EA_17      <PATH1>/G21EA                EA_17.in        energy
    EA_17n      <PATH1>/G21EA               EA_17n.in        energy
     EA_18      <PATH1>/G21EA                EA_18.in        energy
    EA_18n      <PATH1>/G21EA               EA_18n.in        energy
     EA_19      <PATH1>/G21EA                EA_19.in        energy
    EA_19n      <PATH1>/G21EA               EA_19n.in        energy
     EA_20      <PATH1>/G21EA                EA_20.in        energy
    EA_20n      <PATH1>/G21EA               EA_20n.in        energy
     EA_21      <PATH1>/G21EA                EA_21.in        energy
    EA_21n      <PATH1>/G21EA               EA_21n.in        energy
     EA_22      <PATH1>/G21EA                EA_22.in        energy
    EA_22n      <PATH1>/G21EA               EA_22n.in        energy
     EA_23      <PATH1>/G21EA                EA_23.in        energy
    EA_23n      <PATH1>/G21EA               EA_23n.in        energy
     EA_24      <PATH1>/G21EA                EA_24.in        energy
    EA_24n      <PATH1>/G21EA               EA_24n.in        energy
     EA_25      <PATH1>/G21EA                EA_25.in        energy
    EA_25n      <PATH1>/G21EA               EA_25n.in        energy
      EA_8      <PATH1>/G21EA                 EA_8.in        energy
     EA_8n      <PATH1>/G21EA                EA_8n.in        energy
      EA_9      <PATH1>/G21EA                 EA_9.in        energy
     EA_9n      <PATH1>/G21EA                EA_9n.in        energy
     EA_c-      <PATH1>/G21EA                EA_c-.in        energy
      EA_c      <PATH1>/G21EA                 EA_c.in        energy
    EA_cl-      <PATH1>/G21EA               EA_cl-.in        energy
     EA_cl      <PATH1>/G21EA                EA_cl.in        energy
     EA_f-      <PATH1>/G21EA                EA_f-.in        energy
      EA_f      <PATH1>/G21EA                 EA_f.in        energy
     EA_o-      <PATH1>/G21EA                EA_o-.in        energy
      EA_o      <PATH1>/G21EA                 EA_o.in        energy
     EA_p-      <PATH1>/G21EA                EA_p-.in        energy
      EA_p      <PATH1>/G21EA                 EA_p.in        energy
     EA_s-      <PATH1>/G21EA                EA_s-.in        energy
      EA_s      <PATH1>/G21EA                 EA_s.in        energy
    EA_si-      <PATH1>/G21EA               EA_si-.in        energy
     EA_si      <PATH1>/G21EA                EA_si.in        energy

# Training set for the atomization energy
#               25 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 25  627.51
#"Number" "Flag" "Scale"                          "Ref"      "Weight"
  2        EA_c      1    EA_c-    -1             29.2       1.0
  2        EA_o      1    EA_o-    -1             33.7       1.0
  2        EA_f      1    EA_f-    -1             78.4       1.0
  2        EA_si     1    EA_si-   -1             32.1       1.0
  2        EA_p      1    EA_p-    -1             17.3       1.0
  2        EA_s      1    EA_s-    -1             48.0       1.0
  2        EA_cl     1    EA_cl-   -1             83.5       1.0
  2        EA_8n     1    EA_8     -1             27.9       1.0
  2        EA_9n     1    EA_9     -1             13.4       1.0
  2        EA_10n    1    EA_10    -1             1.20       1.0
  2        EA_11n    1    EA_11    -1             8.30       1.0
  2        EA_12n    1    EA_12    -1             16.8       1.0
  2        EA_13n    1    EA_13    -1             41.7       1.0
  2        EA_14n    1    EA_14    -1             29.3       1.0
  2        EA_15n    1    EA_15    -1             25.1       1.0
  2        EA_16n    1    EA_16    -1             31.4       1.0
  2        EA_17n    1    EA_17    -1             23.5       1.0
  2        EA_18n    1    EA_18    -1             28.8       1.0
  2        EA_19n    1    EA_19    -1             54.2       1.0
  2        EA_20n    1    EA_20    -1             9.50       1.0
  2        EA_21n    1    EA_21    -1             -0.2       1.0
  2        EA_22n    1    EA_22    -1             89.5       1.0
  2        EA_23n    1    EA_23    -1             24.9       1.0
  2        EA_24n    1    EA_24    -1             38.0       1.0
  2        EA_25n    1    EA_25    -1             54.7       1.0
