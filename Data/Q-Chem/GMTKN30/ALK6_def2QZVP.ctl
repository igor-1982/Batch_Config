# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ALK6           2              QChem

# The project description
__title__ ::
"============================== ALK6 set ============================="
"        This is ALK6 subset from GMTKN30 proposed by Grimme          "
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
Li     0 
S   9   1.00
  14853.9770850              0.42711388815E-04      
   2225.2236477              0.33235310800E-03      
    504.88739008             0.17518436649E-02      
    142.45847548             0.73477995850E-02      
     46.315599580            0.25899837683E-01      
     16.655335474            0.76670682431E-01      
      6.4331186199           0.18276075765    
      2.6027043858           0.32655434038    
      1.0897245405           0.37000429828    
S   2   1.00
      4.4236595971           0.11120987921    
      1.2356394990           0.79987335862    
S   1   1.00
      0.46067470602          1.0000000        
S   1   1.00
      0.96617166955E-01            1.0000000        
S   1   1.00
      0.45915452296E-01            1.0000000        
S   1   1.00
      0.21140048730E-01            1.0000000        
P   3   1.00
      3.2605109206           0.86504749023E-02      
      0.65003043115          0.47614123736E-01      
      0.16941671073          0.21001138000    
P   1   1.00
      0.55732343767E-01            1.0000000        
P   1   1.00
      0.20489959241E-01            1.0000000        
P   1   1.00
      3.3270000              1.0000000        
D   1   1.00
      0.2300000              1.0000000        
D   1   1.00
      0.0757000              1.0000000        
F   1   1.00
      0.1350000              1.0000000        
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
Na     0 
S   10   1.00
 379852.2008100              0.20671384468E-04      
  56886.0063780              0.16070466617E-03      
  12942.7018380              0.84462905848E-03      
   3664.3017904              0.35519026029E-02      
   1194.7417499              0.12754034468E-01      
    430.98192917             0.39895462742E-01      
    167.83169424             0.10720154498    
     69.306669040            0.23339516913    
     29.951170886            0.36333077287    
     13.380791097            0.30544770974    
S   3   1.00
    121.74011283             0.36142427284E-01      
     37.044143387            0.28820961687    
     13.995422624            0.79337384869    
S   1   1.00
      5.9827797428           1.0000000        
S   1   1.00
      2.4830455118           1.0000000        
S   1   1.00
      1.0452506187           1.0000000        
S   1   1.00
      0.43875640383          1.0000000        
S   1   1.00
      0.65595633185E-01            1.0000000        
S   1   1.00
      0.30561925072E-01            1.0000000        
S   1   1.00
      0.15509064018E-01            1.0000000        
P   8   1.00
    690.77627017             0.37478518415E-03      
    163.82806121             0.31775441030E-02      
     52.876460769            0.16333581338E-01      
     19.812270493            0.59754902585E-01      
      8.1320378784           0.15879328812    
      3.4969068377           0.29049363260    
      1.5117244146           0.36368131139    
      0.64479294912          0.28195867334    
P   1   1.00
      0.26145823312          1.0000000        
P   1   1.00
      0.11704726116          1.0000000        
P   1   1.00
      0.40494747666E-01            1.0000000        
P   1   1.00
      0.15666707355E-01            1.0000000        
D   1   1.00
      2.9000000              1.0000000        
D   1   1.00
      0.2300000              1.0000000        
D   1   1.00
      0.0757000              1.0000000        
F   1   1.00
      0.1350000              1.0000000        
****
K     0 
S   11   1.00
 2022075.1391000             0.10144874011E-04      
 303044.6556800              0.78783500963E-04      
  69013.9384900              0.41380919674E-03      
  19559.2446150              0.17427571893E-02      
   6383.8934901              0.63004086126E-02      
   2305.3502858              0.20125347032E-01      
    899.14418101             0.56966060520E-01      
    372.59500133             0.13882654093    
    161.97635247             0.27132285414    
     73.085553853            0.36383620662    
     33.595644762            0.24724464776    
S   4   1.00
    685.49855365             0.44367463797E-02      
    211.66163373             0.42502718169E-01      
     80.851405131            0.18467742018    
     35.108667236            0.29353173891    
S   1   1.00
     14.409437283            1.0000000        
S   1   1.00
      6.8697147262           1.0000000        
S   1   1.00
      3.2121883687           1.0000000        
S   1   1.00
      1.2610484365           1.0000000        
S   1   1.00
      0.61438946301          1.0000000        
S   1   1.00
      0.27264370973          1.0000000        
S   1   1.00
      0.77173005207E-01            1.0000000        
S   1   1.00
      0.40918397569E-01            1.0000000        
S   1   1.00
      0.17055762425E-01            1.0000000        
P   9   1.00
   3469.6649718              0.21340225970E-03      
    822.02356107             0.18637844836E-02      
    266.58406636             0.10211431546E-01      
    101.28048161             0.40799604728E-01      
     42.429490761            0.12257473393    
     18.912083912            0.26405833679    
      8.7017779030           0.38227164575    
      4.0854567599           0.29998812383    
      1.8667286060           0.78007265591E-01      
P   5   1.00
     27.544639057           -0.58222994163E-02      
      9.2098893609          -0.26787531329E-01      
      1.7232877425           0.30666847665    
      0.77969303735          0.66927944165    
      0.34379047862          0.60376468615    
P   1   1.00
      0.14346681918          1.0000000        
P   1   1.00
      0.68000000000E-01            1.0000000        
P   1   1.00
      0.32000000000E-01            1.0000000        
P   1   1.00
      0.15300000000E-01            1.0000000        
D   1   1.00
      1.7000000              1.0000000        
D   1   1.00
      0.5100000              1.0000000        
D   1   1.00
      0.1800000              1.0000000        
D   1   1.00
      0.0540000              1.0000000        
F   1   1.00
      0.2670000              1.0000000        
****
$end


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#              13 is the total number of jobs in this batch list
__batch__ :: 13
#  "Flag"         "DIR"                        "InpName"       "JobType"
     bz          <PATH1>/ALK6                    bz.in         energy
  bz_k+          <PATH1>/ALK6                 bz_k+.in         energy
 bz_li+          <PATH1>/ALK6                bz_li+.in         energy
 bz_na+          <PATH1>/ALK6                bz_na+.in         energy
     k2          <PATH1>/ALK6                    k2.in         energy
     k8          <PATH1>/ALK6                    k8.in         energy
     k+          <PATH1>/ALK6                    k+.in         energy
    li2          <PATH1>/ALK6                   li2.in         energy
    li8          <PATH1>/ALK6                   li8.in         energy
    li+          <PATH1>/ALK6                   li+.in         energy
    na2          <PATH1>/ALK6                   na2.in         energy
    na8          <PATH1>/ALK6                   na8.in         energy
    na+          <PATH1>/ALK6                   na+.in         energy



# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag" "Scale"                             "Ref"      "Weight"
  3     li+     1     bz     1    bz_li+     -1      38.4       1.000
  3     na+     1     bz     1    bz_na+     -1      25.0       1.000
  3      k+     1     bz     1     bz_k+     -1      19.2       1.000
  2     li2     4    li8    -1                       83.2       1.000
  2     na2     4    na8    -1                       54.6       1.000
  2      k2     4     k8    -1                       47.1       1.000
