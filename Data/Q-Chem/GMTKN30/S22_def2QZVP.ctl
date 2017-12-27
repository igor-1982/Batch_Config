# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./S22           2               QChem

# The project description
__title__ ::
"============================== S22 set ============================="
"             This is S22 subset from GMTKN30 proposed by Grimme     "
"             def2-QZVP basis set is used here                       "

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
#                56 is the total number of jobs in this batch list
__batch__ :: 56
#"Flag"         "DIR"                        "InpName"       "JobType"
 01             <PATH1>/S22                  01.in            energy
 01a            <PATH1>/S22                 01a.in            energy
 02             <PATH1>/S22                  02.in            energy
 02a            <PATH1>/S22                 02a.in            energy
 03             <PATH1>/S22                  03.in            energy
 03a            <PATH1>/S22                 03a.in            energy
 04             <PATH1>/S22                  04.in            energy
 04a            <PATH1>/S22                 04a.in            energy
 05             <PATH1>/S22                  05.in            energy
 05a            <PATH1>/S22                 05a.in            energy
 06             <PATH1>/S22                  06.in            energy
 06a            <PATH1>/S22                 06a.in            energy
 06b            <PATH1>/S22                 06b.in            energy
 07             <PATH1>/S22                  07.in            energy
 07a            <PATH1>/S22                 07a.in            energy
 07b            <PATH1>/S22                 07b.in            energy
 08             <PATH1>/S22                  08.in            energy
 08a            <PATH1>/S22                 08a.in            energy
 09             <PATH1>/S22                  09.in            energy
 09a            <PATH1>/S22                 09a.in            energy
 10             <PATH1>/S22                  10.in            energy
 10a            <PATH1>/S22                 10a.in            energy
 10b            <PATH1>/S22                 10b.in            energy
 11             <PATH1>/S22                  11.in            energy
 11a            <PATH1>/S22                 11a.in            energy
 12             <PATH1>/S22                  12.in            energy
 12a            <PATH1>/S22                 12a.in            energy
 13             <PATH1>/S22                  13.in            energy
 13a            <PATH1>/S22                 13a.in            energy
 14             <PATH1>/S22                  14.in            energy
 14a            <PATH1>/S22                 14a.in            energy
 14b            <PATH1>/S22                 14b.in            energy
 15             <PATH1>/S22                  15.in            energy
 15a            <PATH1>/S22                 15a.in            energy
 15b            <PATH1>/S22                 15b.in            energy
 16             <PATH1>/S22                  16.in            energy
 16a            <PATH1>/S22                 16a.in            energy
 16b            <PATH1>/S22                 16b.in            energy
 17             <PATH1>/S22                  17.in            energy
 17a            <PATH1>/S22                 17a.in            energy
 17b            <PATH1>/S22                 17b.in            energy
 18             <PATH1>/S22                  18.in            energy
 18a            <PATH1>/S22                 18a.in            energy
 18b            <PATH1>/S22                 18b.in            energy
 19             <PATH1>/S22                  19.in            energy
 19a            <PATH1>/S22                 19a.in            energy
 19b            <PATH1>/S22                 19b.in            energy
 20             <PATH1>/S22                  20.in            energy
 20a            <PATH1>/S22                 20a.in            energy
 20b            <PATH1>/S22                 20b.in            energy
 21             <PATH1>/S22                  21.in            energy
 21a            <PATH1>/S22                 21a.in            energy
 21b            <PATH1>/S22                 21b.in            energy
 22             <PATH1>/S22                  22.in            energy
 22a            <PATH1>/S22                 22a.in            energy
 22b            <PATH1>/S22                 22b.in            energy

# Training set for the atomization energy
#               22 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 22  627.51
#"Number" "Flag" "Scale"                            "Ref"      "Weight"
  2       01         -1     01a   2                   3.17     1.0
  2       02         -1     02a   2                   5.02     1.0
  2       03         -1     03a   2                  18.80     1.0
  2       04         -1     04a   2                  16.12     1.0
  2       05         -1     05a   2                  20.69     1.0
  3       06         -1     06a   1   06b        1   17.00     1.0
  3       07         -1     07a   1   07b        1   16.74     1.0
  2       08         -1     08a   2                   0.53     1.0
  2       09         -1     09a   2                   1.50     1.0
  3       10         -1     10a   1   10b        1    1.45     1.0
  2       11         -1     11a   2                   2.62     1.0
  2       12         -1     12a   2                   4.20     1.0
  2       13         -1     13a   2                   9.74     1.0
  3       14         -1     14a   1   14b        1    4.59     1.0
  3       15         -1     15a   1   15b        1   11.66     1.0
  3       16         -1     16a   1   16b        1    1.51     1.0
  3       17         -1     17a   1   17b        1    3.29     1.0
  3       18         -1     18a   1   18b        1    2.32     1.0
  3       19         -1     19a   1   19b        1    4.55     1.0
  3       20         -1     20a   1   20b        1    2.71     1.0
  3       21         -1     21a   1   21b        1    5.62     1.0
  3       22         -1     22a   1   22b        1    7.09     1.0
