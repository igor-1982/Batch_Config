# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ISO34           2             QChem

# The project description
__title__ ::
"============================== ISO34 set ============================="
"             This is ISO34 subset from GMTKN30 proposed by Grimme     "
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
#                63 is the total number of jobs in this batch list
__batch__ :: 63
#"Flag"         "DIR"                        "InpName"       "JobType"
   E10          <PATH1>/ISO34                 E10.in          energy
   E11          <PATH1>/ISO34                 E11.in          energy
   E12          <PATH1>/ISO34                 E12.in          energy
   E13          <PATH1>/ISO34                 E13.in          energy
   E14          <PATH1>/ISO34                 E14.in          energy
   E15          <PATH1>/ISO34                 E15.in          energy
   E16          <PATH1>/ISO34                 E16.in          energy
   E17          <PATH1>/ISO34                 E17.in          energy
   E18          <PATH1>/ISO34                 E18.in          energy
   E19          <PATH1>/ISO34                 E19.in          energy
    E1          <PATH1>/ISO34                  E1.in          energy
   E20          <PATH1>/ISO34                 E20.in          energy
   E21          <PATH1>/ISO34                 E21.in          energy
   E22          <PATH1>/ISO34                 E22.in          energy
   E23          <PATH1>/ISO34                 E23.in          energy
   E24          <PATH1>/ISO34                 E24.in          energy
   E25          <PATH1>/ISO34                 E25.in          energy
   E26          <PATH1>/ISO34                 E26.in          energy
   E27          <PATH1>/ISO34                 E27.in          energy
   E28          <PATH1>/ISO34                 E28.in          energy
   E29          <PATH1>/ISO34                 E29.in          energy
   E30          <PATH1>/ISO34                 E30.in          energy
   E31          <PATH1>/ISO34                 E31.in          energy
   E32          <PATH1>/ISO34                 E32.in          energy
   E33          <PATH1>/ISO34                 E33.in          energy
   E34          <PATH1>/ISO34                 E34.in          energy
    E3          <PATH1>/ISO34                  E3.in          energy
    E4          <PATH1>/ISO34                  E4.in          energy
    E5          <PATH1>/ISO34                  E5.in          energy
    E7          <PATH1>/ISO34                  E7.in          energy
    E8          <PATH1>/ISO34                  E8.in          energy
    E9          <PATH1>/ISO34                  E9.in          energy
   P10          <PATH1>/ISO34                 P10.in          energy
   P11          <PATH1>/ISO34                 P11.in          energy
   P12          <PATH1>/ISO34                 P12.in          energy
   P13          <PATH1>/ISO34                 P13.in          energy
   P14          <PATH1>/ISO34                 P14.in          energy
   P15          <PATH1>/ISO34                 P15.in          energy
   P16          <PATH1>/ISO34                 P16.in          energy
   P17          <PATH1>/ISO34                 P17.in          energy
   P18          <PATH1>/ISO34                 P18.in          energy
    P1          <PATH1>/ISO34                  P1.in          energy
   P20          <PATH1>/ISO34                 P20.in          energy
   P21          <PATH1>/ISO34                 P21.in          energy
   P23          <PATH1>/ISO34                 P23.in          energy
   P24          <PATH1>/ISO34                 P24.in          energy
   P25          <PATH1>/ISO34                 P25.in          energy
   P26          <PATH1>/ISO34                 P26.in          energy
   P27          <PATH1>/ISO34                 P27.in          energy
   P28          <PATH1>/ISO34                 P28.in          energy
   P29          <PATH1>/ISO34                 P29.in          energy
    P2          <PATH1>/ISO34                  P2.in          energy
   P30          <PATH1>/ISO34                 P30.in          energy
   P31          <PATH1>/ISO34                 P31.in          energy
   P32          <PATH1>/ISO34                 P32.in          energy
   P33          <PATH1>/ISO34                 P33.in          energy
   P34          <PATH1>/ISO34                 P34.in          energy
    P3          <PATH1>/ISO34                  P3.in          energy
    P4          <PATH1>/ISO34                  P4.in          energy
    P6          <PATH1>/ISO34                  P6.in          energy
    P7          <PATH1>/ISO34                  P7.in          energy
    P8          <PATH1>/ISO34                  P8.in          energy
    P9          <PATH1>/ISO34                  P9.in          energy



# Training set for the atomization energy
#               34 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 34  627.51
#"Number" "Flag"      "Scale"                       "Ref"      "Weight"
   2     E1     -1     P1      1                     1.62    1.000
   2     E1     -1     P2      1                    21.88    1.000
   2     E3     -1     P3      1                     7.20    1.000
   2     E4     -1     P4      1                     0.99    1.000
   2     E5     -1     E4      1                     0.93    1.000
   2     E4     -1     P6      1                     2.62    1.000
   2     E7     -1     P7      1                    11.15    1.000
   2     E8     -1     P8      1                    22.90    1.000
   2     E9     -1     P9      1                     6.94    1.000
   2    E10     -1    P10      1                     3.58    1.000
   2    E11     -1    P11      1                     1.91    1.000
   2    E12     -1    P12      1                    46.95    1.000
   2    E13     -1    P13      1                    36.04    1.000
   2    E14     -1    P14      1                    24.20    1.000
   2    E15     -1    P15      1                     7.26    1.000
   2    E16     -1    P16      1                    10.81    1.000
   2    E17     -1    P17      1                    26.98    1.000
   2    E18     -1    P18      1                    11.16    1.000
   2    E19     -1    E20      1                     4.60    1.000
   2    E20     -1    P20      1                    20.23    1.000
   2    E21     -1    P21      1                     0.94    1.000
   2    E22     -1    E21      1                     3.23    1.000
   2    E23     -1    P23      1                     5.26    1.000
   2    E24     -1    P24      1                    12.52    1.000
   2    E25     -1    P25      1                    26.49    1.000
   2    E26     -1    P26      1                    18.16    1.000
   2    E27     -1    P27      1                    64.17    1.000
   2    E28     -1    P28      1                    31.22    1.000
   2    E29     -1    P29      1                    11.90    1.000
   2    E30     -1    P30      1                     9.50    1.000
   2    E31     -1    P31      1                    14.05    1.000
   2    E32     -1    P32      1                     7.10    1.000
   2    E33     -1    P33      1                     5.62    1.000
   2    E34     -1    P34      1                     7.26    1.000

