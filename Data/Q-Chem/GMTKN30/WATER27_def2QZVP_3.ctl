# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./WATER27           2           QChem

# The project description
__title__ ::
"============================== WATER27 set ============================="
"     This is WATER27 subset from GMTKN30 proposed by Grimme             "
"     def2-QZVP basis set is used here                                   "
"     additional one s and p functions are collected from aug-cc-pvQZ    "
"     additional one f functions are collected from aug-cc-pVQZ          "
"     additional one g functions are collected from aug-cc-pVQZ          "

# $rem group of Q-Chem Package
__qchem__ ::  1  rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static      = 200
mem_total       = 7500
exchange        = b3lyp
basis           = gen
max_scf_cycles  = 50
scf_convergence = 7
symmetry        = false
xc_grid         = 000075000302                                                               
$end
$basis
H     0 
S   4   1.00
    190.6916900              0.70815167E-03   
     28.6055320              0.54678827E-02   
      6.5095943              0.27966605E-01   
      1.8412455              0.10764538       
S   1   1.00
      0.59853725             1.0000000        
S   1   1.00
      0.21397624             1.0000000        
S   1   1.00
      0.80316286E-01         1.0000000        
P   1   1.00
      2.29200000             1.0000000        
P   1   1.00
      0.83800000             1.0000000        
P   1   1.00
      0.29200000             1.0000000        
D   1   1.00
      2.06200000             1.0000000        
D   1   1.00
      0.66200000             1.0000000        
F   1   1.00
      1.39700000             1.0000000        
****
O     0 
S   8   1.00
 116506.4690800              0.40383857939E-04      
  17504.3497240              0.31255139004E-03      
   3993.4513230              0.16341473495E-02      
   1133.0063186              0.68283224757E-02      
    369.99569594             0.24124410221E-01      
    133.62074349             0.72730206154E-01      
     52.035643649            0.17934429892    
     21.461939313            0.33059588895    
S   2   1.00
     89.835051252            0.96468652996E-01      
     26.428010844            0.94117481120    
S   1   1.00
      9.2822824649           1.0000000        
S   1   1.00
      4.0947728533           1.0000000        
S   1   1.00
      1.3255349078           1.0000000        
S   1   1.00
      0.51877230787          1.0000000        
S   1   1.00
      0.19772676454          1.0000000
S   1   1.00
      0.0695900              1.0000000
P   5   1.00
    191.15255810             0.25115697705E-02      
     45.233356739            0.20039240864E-01      
     14.353465922            0.93609064762E-01      
      5.2422371832           0.30618127124    
      2.0792418599           0.67810501439    
P   1   1.00
      0.84282371424          1.0000000        
P   1   1.00
      0.33617694891          1.0000000        
P   1   1.00
      0.12863997974          1.0000000
P   1   1.00
      0.0534800              1.0000000
D   1   1.00
      3.77500000             1.0000000        
D   1   1.00
      1.30000000             1.0000000        
D   1   1.00
      0.44400000             1.0000000        
F   1   1.00
      2.66600000             1.0000000        
F   1   1.00
      0.85900000             1.0000000        
F   1   1.00
      0.32400000             1.0000000
G   1   1.00
      1.84600000             1.0000000        
G   1   1.00
      0.7140000              1.0000000
****
$end


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                 30 is the total number of jobs in this batch list
__batch__ :: 30
#"Flag"         "DIR"                        "InpName"       "JobType"
        H2O20   <PATH1>/WATER27                 H2O20.in     energy
      H2O20es   <PATH1>/WATER27               H2O20es.in     energy
      H2O20fc   <PATH1>/WATER27               H2O20fc.in     energy
      H2O20fs   <PATH1>/WATER27               H2O20fs.in     energy
         H2O2   <PATH1>/WATER27                  H2O2.in     energy
         H2O3   <PATH1>/WATER27                  H2O3.in     energy
         H2O4   <PATH1>/WATER27                  H2O4.in     energy
         H2O5   <PATH1>/WATER27                  H2O5.in     energy
        H2O6b   <PATH1>/WATER27                 H2O6b.in     energy
       H2O6c2   <PATH1>/WATER27                H2O6c2.in     energy
        H2O6c   <PATH1>/WATER27                 H2O6c.in     energy
         H2O6   <PATH1>/WATER27                  H2O6.in     energy
      H2O8d2d   <PATH1>/WATER27               H2O8d2d.in     energy
       H2O8s4   <PATH1>/WATER27                H2O8s4.in     energy
          H2O   <PATH1>/WATER27                   H2O.in     energy
         H3Op   <PATH1>/WATER27                  H3Op.in     energy
     H3OpH2O2   <PATH1>/WATER27              H3OpH2O2.in     energy
     H3OpH2O3   <PATH1>/WATER27              H3OpH2O3.in     energy
   H3OpH2O62d   <PATH1>/WATER27            H3OpH2O62d.in     energy
   H3OpH2O63d   <PATH1>/WATER27            H3OpH2O63d.in     energy
  H3OpH2O6OHm   <PATH1>/WATER27           H3OpH2O6OHm.in     energy
      H3OpH2O   <PATH1>/WATER27               H3OpH2O.in     energy
          OHm   <PATH1>/WATER27                   OHm.in     energy
      OHmH2O2   <PATH1>/WATER27               OHmH2O2.in     energy
      OHmH2O3   <PATH1>/WATER27               OHmH2O3.in     energy
    OHmH2O4c4   <PATH1>/WATER27             OHmH2O4c4.in     energy
    OHmH2O4cs   <PATH1>/WATER27             OHmH2O4cs.in     energy
      OHmH2O5   <PATH1>/WATER27               OHmH2O5.in     energy
      OHmH2O6   <PATH1>/WATER27               OHmH2O6.in     energy
       OHmH2O   <PATH1>/WATER27                OHmH2O.in     energy



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

