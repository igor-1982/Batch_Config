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
"        def2-QZVP is used here                                       "

# $rem group of Q-Chem Package
__qchem__ ::  1 rmp2  # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
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
N     0 
S   8   1.00
  90726.8892100              0.39257887368E-04      
  13590.5288010              0.30513316455E-03      
   3092.9883781              0.16000560446E-02      
    875.99876362             0.66982937306E-02      
    285.74469982             0.23690078765E-01      
    103.11913417             0.71455405268E-01      
     40.128556777            0.17632774876    
     16.528095704            0.32677592815    
S   2   1.00
     69.390960983            0.80052094386E-01      
     20.428200596            0.78268063538    
S   1   1.00
      7.1292587972           1.0000000        
S   1   1.00
      3.1324304893           1.0000000        
S   1   1.00
      0.98755778723          1.0000000        
S   1   1.00
      0.38765721307          1.0000000        
S   1   1.00
      0.14909883075          1.0000000        
P   5   1.00
    150.05742670            -0.86216165986E-03      
     35.491599483           -0.68571273236E-02      
     11.247864223           -0.31795688855E-01      
      4.0900305195          -0.10537396822    
      1.6220573146          -0.24519708041    
P   1   1.00
      0.66442261530          1.0000000        
P   1   1.00
      0.27099770070          1.0000000        
P   1   1.00
      0.10688749984          1.0000000        
D   1   1.00
      2.83700000             1.0000000        
D   1   1.00
      0.96800000             1.0000000        
D   1   1.00
      0.33500000             1.0000000        
F   1   1.00
      2.02700000             1.0000000        
F   1   1.00
      0.68500000             1.0000000        
G   1   1.00
      1.42700000             1.0000000        
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
