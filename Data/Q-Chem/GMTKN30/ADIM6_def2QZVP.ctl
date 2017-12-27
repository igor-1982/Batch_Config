# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ADIM6           2              QChem

# The project description
__title__ ::
"============================== ADIM6 set ============================="
"             This is ADIM6 subset from GMTKN30 proposed by Grimme     "
"             def2-QZVP from EMSL                                      "

# $rem group of Q-Chem Package
__qchem__ ::  1  rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static      = 200
mem_total       = 7500
exchange        = b3lyp
basis           = gen
purecart        = 1111
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
      0.75983791611E-01      1.0000000        
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
$end


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                12 is the total number of jobs in this batch list
__batch__ :: 12
#"Flag"         "DIR"                        "InpName"       "JobType"
 AM2           <PATH1>/ADIM6                  AM2.in            energy
 AD2           <PATH1>/ADIM6                  AD2.in            energy
 AM3           <PATH1>/ADIM6                  AM3.in            energy
 AD3           <PATH1>/ADIM6                  AD3.in            energy
 AM4           <PATH1>/ADIM6                  AM4.in            energy
 AD4           <PATH1>/ADIM6                  AD4.in            energy
 AM5           <PATH1>/ADIM6                  AM5.in            energy
 AD5           <PATH1>/ADIM6                  AD5.in            energy
 AM6           <PATH1>/ADIM6                  AM6.in            energy
 AD6           <PATH1>/ADIM6                  AD6.in            energy
 AM7           <PATH1>/ADIM6                  AM7.in            energy
 AD7           <PATH1>/ADIM6                  AD7.in            energy


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
