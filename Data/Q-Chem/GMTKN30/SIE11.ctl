# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./SIE11           2             QChem

# The project description
__title__ ::
"============================== SIE11 set ============================="
"             This is SIE11 subset from GMTKN30 proposed by Grimme     "


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
#                29 is the total number of jobs in this batch list
__batch__ :: 29
#"Flag"         "DIR"                        "InpName"       "JobType"
  aceton+       <PATH1>/SIE11                aceton+.in      energy
   acetyl       <PATH1>/SIE11                 acetyl.in      energy
     but+       <PATH1>/SIE11                   but+.in      energy
       bz       <PATH1>/SIE11                     bz.in      energy
    bz_li       <PATH1>/SIE11                  bz_li.in      energy
     c2h4       <PATH1>/SIE11                   c2h4.in      energy
  c2h4_f2       <PATH1>/SIE11                c2h4_f2.in      energy
      ch3       <PATH1>/SIE11                    ch3.in      energy
    clclf       <PATH1>/SIE11                  clclf.in      energy
    clfcl       <PATH1>/SIE11                  clfcl.in      energy
      clf       <PATH1>/SIE11                    clf.in      energy
    ethyl       <PATH1>/SIE11                  ethyl.in      energy
   ethyl+       <PATH1>/SIE11                 ethyl+.in      energy
       f2       <PATH1>/SIE11                     f2.in      energy
    h2o2+       <PATH1>/SIE11                  h2o2+.in      energy
      h2o       <PATH1>/SIE11                    h2o.in      energy
     h2o+       <PATH1>/SIE11                   h2o+.in      energy
     he2+       <PATH1>/SIE11                   he2+.in      energy
       he       <PATH1>/SIE11                     he.in      energy
      he+       <PATH1>/SIE11                    he+.in      energy
       li       <PATH1>/SIE11                     li.in      energy
    li_f2       <PATH1>/SIE11                  li_f2.in      energy
      mgo       <PATH1>/SIE11                    mgo.in      energy
       na       <PATH1>/SIE11                     na.in      energy
    naomg       <PATH1>/SIE11                  naomg.in      energy
    nh32+       <PATH1>/SIE11                  nh32+.in      energy
  nh3_clf       <PATH1>/SIE11                nh3_clf.in      energy
      nh3       <PATH1>/SIE11                    nh3.in      energy
     nh3+       <PATH1>/SIE11                   nh3+.in      energy


# Training set for the atomization energy
#               11 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 11  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  3   he      1   he+       1      he2+       -1               57.44      1.000
  3   nh3     1   nh3+      1      nh32+      -1               35.34      1.000
  3   h2o     1   h2o+      1      h2o2+      -1               37.25      1.000
  3   but+   -1   ethyl     1      ethyl+      1               35.28      1.000
  3   ch3     1   acetyl    1      aceton+    -1               22.57      1.000
  2   clclf   1   clfcl    -1                                 -1.010      1.000
  3   c2h4    1   f2        1      c2h4_f2    -1               1.080      1.000
  3   li      1   bz        1      bz_li      -1               9.500      1.000
  3   nh3     1   clf       1      nh3_clf    -1               10.50      1.000
  3   mgo     1   na        1      naomg      -1               69.56      1.000
  3   li      1   f2        1      li_f2      -1               94.36      1.000
 


