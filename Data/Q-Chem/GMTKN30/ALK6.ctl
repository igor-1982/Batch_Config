# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ALK6           2              QChem

# The project description
__title__ ::
"============================== ALK6 set ============================="
"        This is ALK6 subset from GMTKN30 proposed by Grimme          "

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
#              13 is the total number of jobs in this batch list
__batch__ :: 13
#  "Flag"         "DIR"                        "InpName"       "JobType"
     bz          <PATH1>/ALK6                    bz.in         energy
  bz_k+          <PATH1>/ALK6                 bz_k+.in         energy
 bz_li+          <PATH1>/ALK6                bz_li+.in         energy
 bz_na+          <PATH1>/ALK6                bz_na+.in         energy
     k2          <PATH1>/ALK6                    k2.in         energy
     k8          <PATH1>/ALK6                    k8.in         energy
     k+          <PATH1>/ALK6                    k+.in         energy
    li2          <PATH1>/ALK6                   li2.in         energy
    li8          <PATH1>/ALK6                   li8.in         energy
    li+          <PATH1>/ALK6                   li+.in         energy
    na2          <PATH1>/ALK6                   na2.in         energy
    na8          <PATH1>/ALK6                   na8.in         energy
    na+          <PATH1>/ALK6                   na+.in         energy



# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag" "Scale"                             "Ref"      "Weight"
  3     li+     1     bz     1    bz_li+     -1      38.4       1.000
  3     na+     1     bz     1    bz_na+     -1      25.0       1.000
  3      k+     1     bz     1     bz_k+     -1      19.2       1.000
  2     li2     4    li8    -1                       83.2       1.000
  2     na2     4    na8    -1                       54.6       1.000
  2      k2     4     k8    -1                       47.1       1.000
