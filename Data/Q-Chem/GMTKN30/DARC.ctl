# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./DARC            2             QChem

# The project description
__title__ ::
"============================== DARC set ============================="
"        This is DARC subset from GMTKN30 proposed by Grimme          "

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
#              22 is the total number of jobs in this batch list
__batch__ :: 22
#  "Flag"         "DIR"                               "InpName"       "JobType"
   butadiene      <PATH1>/DARC                        butadiene.in    energy
     chdiene      <PATH1>/DARC                          chdiene.in    energy
     cpdiene      <PATH1>/DARC                          cpdiene.in    energy
      ethene      <PATH1>/DARC                           ethene.in    energy
      ethine      <PATH1>/DARC                           ethine.in    energy
      furane      <PATH1>/DARC                           furane.in    energy
      malein      <PATH1>/DARC                           malein.in    energy
    maleinNH      <PATH1>/DARC                         maleinNH.in    energy
         P10      <PATH1>/DARC                              P10.in    energy
        P10X      <PATH1>/DARC                             P10X.in    energy
          P1      <PATH1>/DARC                               P1.in    energy
          P2      <PATH1>/DARC                               P2.in    energy
          P3      <PATH1>/DARC                               P3.in    energy
          P4      <PATH1>/DARC                               P4.in    energy
          P5      <PATH1>/DARC                               P5.in    energy
          P6      <PATH1>/DARC                               P6.in    energy
          P7      <PATH1>/DARC                               P7.in    energy
         P7X      <PATH1>/DARC                              P7X.in    energy
          P8      <PATH1>/DARC                               P8.in    energy
         P8X      <PATH1>/DARC                              P8X.in    energy
          P9      <PATH1>/DARC                               P9.in    energy
         P9X      <PATH1>/DARC                              P9X.in    energy



# Training set for the atomization energy
#              14 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 14  627.51
#"Number" "Flag" "Scale"                                          "Ref"      "Weight"
   3     ethene   -1    butadiene     -1    P1     1              -43.8    1.0000
   3     ethine   -1    butadiene     -1    P2     1              -59.3    1.0000
   3     ethene   -1      cpdiene     -1    P3     1              -30.0    1.0000
   3     ethine   -1      cpdiene     -1    P4     1              -33.1    1.0000
   3     ethene   -1      chdiene     -1    P5     1              -36.5    1.0000
   3     ethine   -1      chdiene     -1    P6     1              -48.2    1.0000
   3     furane   -1       malein     -1    P7     1              -14.4    1.0000
   3     furane   -1       malein     -1    P7X    1              -16.2    1.0000
   3     furane   -1     maleinNH     -1    P8     1              -17.2    1.0000
   3     furane   -1     maleinNH     -1    P8X    1              -19.2    1.0000
   3    cpdiene   -1       malein     -1    P9     1              -31.6    1.0000
   3    cpdiene   -1       malein     -1    P9X    1              -32.1    1.0000
   3    cpdiene   -1     maleinNH     -1    P10    1              -34.1    1.0000
   3    cpdiene   -1     maleinNH     -1    P10X   1              -34.4    1.0000
