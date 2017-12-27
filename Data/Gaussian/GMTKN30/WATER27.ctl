# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./WATER27           2            Gaussian

# The project description
__title__ ::
"============================== WATER27 set ============================="
"             This is WATER27 subset from GMTKN30 proposed by Grimme     "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/G3Large NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                 30 is the total number of jobs in this batch list
__batch__ :: 30
#"Flag"         "DIR"                        "InpName"       "JobType"
        H2O20   <PATH1>/WATER27                 H2O20.com    energy
      H2O20es   <PATH1>/WATER27               H2O20es.com    energy
      H2O20fc   <PATH1>/WATER27               H2O20fc.com    energy
      H2O20fs   <PATH1>/WATER27               H2O20fs.com    energy
         H2O2   <PATH1>/WATER27                  H2O2.com    energy
         H2O3   <PATH1>/WATER27                  H2O3.com    energy
         H2O4   <PATH1>/WATER27                  H2O4.com    energy
         H2O5   <PATH1>/WATER27                  H2O5.com    energy
        H2O6b   <PATH1>/WATER27                 H2O6b.com    energy
       H2O6c2   <PATH1>/WATER27                H2O6c2.com    energy
        H2O6c   <PATH1>/WATER27                 H2O6c.com    energy
         H2O6   <PATH1>/WATER27                  H2O6.com    energy
      H2O8d2d   <PATH1>/WATER27               H2O8d2d.com    energy
       H2O8s4   <PATH1>/WATER27                H2O8s4.com    energy
          H2O   <PATH1>/WATER27                   H2O.com    energy
         H3Op   <PATH1>/WATER27                  H3Op.com    energy
     H3OpH2O2   <PATH1>/WATER27              H3OpH2O2.com    energy
     H3OpH2O3   <PATH1>/WATER27              H3OpH2O3.com    energy
   H3OpH2O62d   <PATH1>/WATER27            H3OpH2O62d.com    energy
   H3OpH2O63d   <PATH1>/WATER27            H3OpH2O63d.com    energy
  H3OpH2O6OHm   <PATH1>/WATER27           H3OpH2O6OHm.com    energy
      H3OpH2O   <PATH1>/WATER27               H3OpH2O.com    energy
          OHm   <PATH1>/WATER27                   OHm.com    energy
      OHmH2O2   <PATH1>/WATER27               OHmH2O2.com    energy
      OHmH2O3   <PATH1>/WATER27               OHmH2O3.com    energy
    OHmH2O4c4   <PATH1>/WATER27             OHmH2O4c4.com    energy
    OHmH2O4cs   <PATH1>/WATER27             OHmH2O4cs.com    energy
      OHmH2O5   <PATH1>/WATER27               OHmH2O5.com    energy
      OHmH2O6   <PATH1>/WATER27               OHmH2O6.com    energy
       OHmH2O   <PATH1>/WATER27                OHmH2O.com    energy



# Training set for the atomization energy
#               27 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 27  627.51
#"Number" "Flag" "Scale"                                      "Ref"      "Weight"
   2           H2O2  -1       H2O    2                          5.01    1.0000
   2           H2O3  -1       H2O    3                         15.80    1.0000
   2           H2O4  -1       H2O    4                         27.40    1.0000
   2           H2O5  -1       H2O    5                         35.90    1.0000
   2           H2O6  -1       H2O    6                         46.00    1.0000
   2          H2O6c  -1       H2O    6                         45.80    1.0000
   2          H2O6b  -1       H2O    6                         45.30    1.0000
   2         H2O6c2  -1       H2O    6                         44.30    1.0000
   2        H2O8d2d  -1       H2O    8                         72.60    1.0000
   2         H2O8s4  -1       H2O    8                         72.60    1.0000
   2          H2O20  -1       H2O   20                        200.10    1.0000
   2        H2O20fc  -1       H2O   20                        212.60    1.0000
   2        H2O20fs  -1       H2O   20                        215.00    1.0000
   2        H2O20es  -1       H2O   20                        217.90    1.0000
   3        H3OpH2O  -1      H3Op    1    H2O     1            33.50    1.0000
   3       H3OpH2O2  -1      H3Op    1    H2O     2            56.90    1.0000
   3       H3OpH2O3  -1      H3Op    1    H2O     3            76.50    1.0000
   3     H3OpH2O63d  -1      H3Op    1    H2O     6           117.80    1.0000
   3     H3OpH2O62d  -1      H3Op    1    H2O     6           114.90    1.0000
   3         OHmH2O  -1       OHm    1    H2O     1            26.60    1.0000
   3        OHmH2O2  -1       OHm    1    H2O     2            48.40    1.0000
   3        OHmH2O3  -1       OHm    1    H2O     3            67.60    1.0000
   3      OHmH2O4c4  -1       OHm    1    H2O     4            84.80    1.0000
   3      OHmH2O4cs  -1       OHm    1    H2O     4            84.80    1.0000
   3        OHmH2O5  -1       OHm    1    H2O     5           100.70    1.0000
   3        OHmH2O6  -1       OHm    1    H2O     6           115.70    1.0000
   2    H3OpH2O6OHm   1    H2O8s4   -1                         28.50    1.0000

