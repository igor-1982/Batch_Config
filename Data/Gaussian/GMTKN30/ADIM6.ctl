# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ADIM6           2              Gaussian

# The project description
__title__ ::
"============================== ADIM6 set ============================="
"             This is ADIM6 subset from GMTKN30 proposed by Grimme     "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/G3Large NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                12 is the total number of jobs in this batch list
__batch__ :: 12
#"Flag"         "DIR"                        "InpName"       "JobType"
 AM2           <PATH1>/ADIM6                  AM2.com            energy
 AD2           <PATH1>/ADIM6                  AD2.com            energy
 AM3           <PATH1>/ADIM6                  AM3.com            energy
 AD3           <PATH1>/ADIM6                  AD3.com            energy
 AM4           <PATH1>/ADIM6                  AM4.com            energy
 AD4           <PATH1>/ADIM6                  AD4.com            energy
 AM5           <PATH1>/ADIM6                  AM5.com            energy
 AD5           <PATH1>/ADIM6                  AD5.com            energy
 AM6           <PATH1>/ADIM6                  AM6.com            energy
 AD6           <PATH1>/ADIM6                  AD6.com            energy
 AM7           <PATH1>/ADIM6                  AM7.com            energy
 AD7           <PATH1>/ADIM6                  AD7.com            energy


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
