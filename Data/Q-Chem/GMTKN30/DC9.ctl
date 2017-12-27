# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./DC9            2              QChem

# The project description
__title__ ::
"============================== DC9 set ============================="
"        This is DC9 subset from GMTKN30 proposed by Grimme          "


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
#              19 is the total number of jobs in this batch list
__batch__ :: 19
#  "Flag"         "DIR"                               "InpName"       "JobType"
        13dip     <PATH1>/DC9                         13dip.in        energy
          be4     <PATH1>/DC9                           be4.in        energy
           be     <PATH1>/DC9                            be.in        energy
      c20bowl     <PATH1>/DC9                       c20bowl.in        energy
      c20cage     <PATH1>/DC9                       c20cage.in        energy
    carbooxo1     <PATH1>/DC9                     carbooxo1.in        energy
    carbooxo2     <PATH1>/DC9                     carbooxo2.in        energy
        ch2n2     <PATH1>/DC9                         ch2n2.in        energy
        ethen     <PATH1>/DC9                         ethen.in        energy
 heptahexaene     <PATH1>/DC9                  heptahexaene.in        energy
  heptatriyne     <PATH1>/DC9                   heptatriyne.in        energy
      ISO_E35     <PATH1>/DC9                       ISO_E35.in        energy
      ISO_E36     <PATH1>/DC9                       ISO_E36.in        energy
      ISO_P35     <PATH1>/DC9                       ISO_P35.in        energy
      ISO_P36     <PATH1>/DC9                       ISO_P36.in        energy
         omcb     <PATH1>/DC9                          omcb.in        energy
           s2     <PATH1>/DC9                            s2.in        energy
           s8     <PATH1>/DC9                            s8.in        energy
      tmethen     <PATH1>/DC9                       tmethen.in        energy



# Training set for the atomization energy
#               9 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 9  627.51
#"Number" "Flag" "Scale"                                          "Ref"      "Weight"
  2        ISO_E36     1          ISO_P36     -1                   -1.0       1.0000
  2        c20cage    -1          c20bowl      1                  -13.3       1.0000
  2    heptatriyne     1     heptahexaene     -1                  -14.3       1.0000
  2        tmethen    -2             omcb      1                  -19.2       1.0000
  2        ISO_E35     1          ISO_P35     -1                  -19.5       1.0000
  2      carbooxo2    -1        carbooxo1      1                  -26.9       1.0000
  3          ethen    -1            ch2n2     -1     13dip    1   -38.1       1.0000
  2            be4     1               be     -4                  -88.4       1.0000
  2             s2    -4               s8      1                 -101.0       1.0000
