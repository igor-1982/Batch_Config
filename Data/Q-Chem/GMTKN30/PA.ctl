# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./PA             2               QChem

# The project description
__title__ ::
"============================== PA set ============================="
"             This is PA subset from GMTKN30 proposed by Grimme     "

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
#                24 is the total number of jobs in this batch list
__batch__ :: 24
#"Flag"         "DIR"                        "InpName"       "JobType"
 c2h2           <PATH1>/PA                   c2h2.in         energy
c2h2p           <PATH1>/PA                  c2h2p.in         energy
   h2           <PATH1>/PA                     h2.in         energy
  h2o           <PATH1>/PA                    h2o.in         energy
 h2op           <PATH1>/PA                   h2op.in         energy
  h2p           <PATH1>/PA                    h2p.in         energy
  h2s           <PATH1>/PA                    h2s.in         energy
 h2sp           <PATH1>/PA                   h2sp.in         energy
  hcl           <PATH1>/PA                    hcl.in         energy
 hclp           <PATH1>/PA                   hclp.in         energy
  nh3           <PATH1>/PA                    nh3.in         energy
 nh3p           <PATH1>/PA                   nh3p.in         energy
   p2           <PATH1>/PA                     p2.in         energy
  p2p           <PATH1>/PA                    p2p.in         energy
   p4           <PATH1>/PA                     p4.in         energy
  p4p           <PATH1>/PA                    p4p.in         energy
   p6           <PATH1>/PA                     p6.in         energy
  p6p           <PATH1>/PA                    p6p.in         energy
   p8           <PATH1>/PA                     p8.in         energy
  p8p           <PATH1>/PA                    p8p.in         energy
  ph3           <PATH1>/PA                    ph3.in         energy
 ph3p           <PATH1>/PA                   ph3p.in         energy
 sih4           <PATH1>/PA                   sih4.in         energy
sih4p           <PATH1>/PA                  sih4p.in         energy


# Training set for the atomization energy
#               12 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 12  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  2        p2          1          p2p            -1           167.8       1.00
  2        p4          1          p4p            -1           193.4       1.00
  2        p6          1          p6p            -1           209.7       1.00
  2        p8          1          p8p            -1           219.7       1.00
  2        nh3         1          nh3p           -1           211.9       1.00
  2        h2o         1          h2op           -1           171.6       1.00
  2        c2h2        1          c2h2p          -1           157.4       1.00
  2        sih4        1          sih4p          -1           156.8       1.00
  2        ph3         1          ph3p           -1           192.7       1.00
  2        h2s         1          h2sp           -1           174.2       1.00
  2        hcl         1          hclp           -1           137.8       1.00
  2        h2          1          h2p            -1           106.3       1.00

 


