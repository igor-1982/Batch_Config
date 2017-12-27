# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./SCONF           2              QChem 

# The project description
__title__ ::
"============================== SCONF set ============================="
"             This is SCONF subset from GMTKN30 proposed by Grimme     "
"             def2-QZVP is used here                                   "

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
C     0 
S   8   1.00
  67025.0710290              0.38736308501E-04      
  10039.9865380              0.30107917575E-03      
   2284.9316911              0.15787918095E-02      
    647.14122130             0.66087087195E-02      
    211.09472335             0.23367123250E-01      
     76.177643862            0.70420716898E-01      
     29.633839163            0.17360344953    
     12.187785081            0.32292305648    
S   2   1.00
     53.026006299            0.74897404492E-01      
     15.258502776            0.76136220983    
S   1   1.00
      5.2403957464           1.0000000        
S   1   1.00
      2.2905022379           1.0000000        
S   1   1.00
      0.69673283006          1.0000000        
S   1   1.00
      0.27599337363          1.0000000        
S   1   1.00
      0.10739884389          1.0000000        
P   5   1.00
    105.12555082             0.84647553844E-03      
     24.884461066            0.66274038534E-02      
      7.8637230826           0.30120390419E-01      
      2.8407001835           0.99951435476E-01      
      1.1227137335           0.23826299282    
P   1   1.00
      0.46050725555          1.0000000        
P   1   1.00
      0.18937530913          1.0000000        
P   1   1.00
      0.75983791611E-01            1.0000000        
D   1   1.00
      1.84800000             1.0000000        
D   1   1.00
      0.64900000             1.0000000        
D   1   1.00
      0.22800000             1.0000000        
F   1   1.00
      1.41900000             1.0000000        
F   1   1.00
      0.48500000             1.0000000        
G   1   1.00
      1.01100000             1.0000000        
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
G   1   1.00
      1.84600000             1.0000000        
****
$end

# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                19 is the total number of jobs in this batch list
__batch__ :: 19
#"Flag"         "DIR"                        "InpName"       "JobType"
   C10          <PATH1>/SCONF                 C10.in          energy
   C11          <PATH1>/SCONF                 C11.in          energy
   C12          <PATH1>/SCONF                 C12.in          energy
   C13          <PATH1>/SCONF                 C13.in          energy
   C14          <PATH1>/SCONF                 C14.in          energy
   C15          <PATH1>/SCONF                 C15.in          energy
    C1          <PATH1>/SCONF                  C1.in          energy
    C2          <PATH1>/SCONF                  C2.in          energy
    C3          <PATH1>/SCONF                  C3.in          energy
    C4          <PATH1>/SCONF                  C4.in          energy
    C5          <PATH1>/SCONF                  C5.in          energy
    C6          <PATH1>/SCONF                  C6.in          energy
    C7          <PATH1>/SCONF                  C7.in          energy
    C8          <PATH1>/SCONF                  C8.in          energy
    C9          <PATH1>/SCONF                  C9.in          energy
    G1          <PATH1>/SCONF                  G1.in          energy
    G2          <PATH1>/SCONF                  G2.in          energy
    G3          <PATH1>/SCONF                  G3.in          energy
    G4          <PATH1>/SCONF                  G4.in          energy

# Training set for the atomization energy
#               17 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 17  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
   2       C1         -1           C2     1                    0.83      1.0000
   2       C1         -1           C3     1                    2.60      1.0000
   2       C1         -1           C4     1                    3.37      1.0000
   2       C1         -1           C5     1                    4.87      1.0000
   2       C1         -1           C6     1                    5.18      1.0000
   2       C1         -1           C7     1                    4.47      1.0000
   2       C1         -1           C8     1                    4.68      1.0000
   2       C1         -1           C9     1                    6.69      1.0000
   2       C1         -1          C10     1                    6.75      1.0000
   2       C1         -1          C11     1                    6.08      1.0000
   2       C1         -1          C12     1                    6.05      1.0000
   2       C1         -1          C13     1                    6.17      1.0000
   2       C1         -1          C14     1                    6.75      1.0000
   2       C1         -1          C15     1                    6.71      1.0000
   2       G1         -1           G2     1                    0.27      1.0000
   2       G1         -1           G3     1                    5.92      1.0000
   2       G1         -1           G4     1                    5.29      1.0000
