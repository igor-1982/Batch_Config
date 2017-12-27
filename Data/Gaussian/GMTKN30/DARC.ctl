# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./DARC            2              Gaussian

# The project description
__title__ ::
"============================== DARC set ============================="
"        This is DARC subset from GMTKN30 proposed by Grimme          "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/G3Large NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#              22 is the total number of jobs in this batch list
__batch__ :: 22
#  "Flag"         "DIR"                               "InpName"       "JobType"
   butadiene      <PATH1>/DARC                        butadiene.com   energy
     chdiene      <PATH1>/DARC                          chdiene.com   energy
     cpdiene      <PATH1>/DARC                          cpdiene.com   energy
      ethene      <PATH1>/DARC                           ethene.com   energy
      ethine      <PATH1>/DARC                           ethine.com   energy
      furane      <PATH1>/DARC                           furane.com   energy
      malein      <PATH1>/DARC                           malein.com   energy
    maleinNH      <PATH1>/DARC                         maleinNH.com   energy
         P10      <PATH1>/DARC                              P10.com   energy
        P10X      <PATH1>/DARC                             P10X.com   energy
          P1      <PATH1>/DARC                               P1.com   energy
          P2      <PATH1>/DARC                               P2.com   energy
          P3      <PATH1>/DARC                               P3.com   energy
          P4      <PATH1>/DARC                               P4.com   energy
          P5      <PATH1>/DARC                               P5.com   energy
          P6      <PATH1>/DARC                               P6.com   energy
          P7      <PATH1>/DARC                               P7.com   energy
         P7X      <PATH1>/DARC                              P7X.com   energy
          P8      <PATH1>/DARC                               P8.com   energy
         P8X      <PATH1>/DARC                              P8X.com   energy
          P9      <PATH1>/DARC                               P9.com   energy
         P9X      <PATH1>/DARC                              P9X.com   energy



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
