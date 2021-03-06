# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./HEAVY28           2           QChem 

# The project description
__title__ ::
"============================== HEAVY28 set ============================="
"     This is HEAVY28 subset from GMTKN30 proposed by Grimme             "
"     The basis set of def2-QZVP is used here                            "
"     Here, the molecules which don't need ECP are calculated first      "
"     As Q-Chem cannot handle G function with ECP, we remove it          "
"     consistently                                                       "
"     Link rimp2-def2-QZVP to rimp2-aug-cc-pvDZ                          "

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
****
S     0 
S   10   1.00
 1273410.9023000             0.11767088246E-04      
 190697.8300700              0.91478610166E-04      
  43397.8853300              0.48090078640E-03      
  12291.8096770              0.20257193592E-02      
   4009.7420824              0.73190096406E-02      
   1447.3531030              0.23300499900E-01      
    564.30102913             0.65386213610E-01      
    233.74506243             0.15614449910    
    101.56402814             0.29318563787    
     45.805907187            0.36287914289    
S   3   1.00
    394.27281503             0.18753305081E-01      
    121.72249591             0.16870726663    
     46.754125963            0.63806830653    
S   1   1.00
     20.923008254            1.0000000        
S   1   1.00
      8.2685567800           1.0000000        
S   1   1.00
      3.8629345671           1.0000000        
S   1   1.00
      1.7794684781           1.0000000        
S   1   1.00
      0.61064260103          1.0000000        
S   1   1.00
      0.27412269445          1.0000000        
S   1   1.00
      0.11325939107          1.0000000        
P   8   1.00
   2189.8930459              0.23912552864E-03      
    518.94596592             0.20772032158E-02      
    168.19560151             0.11242420571E-01      
     63.745282788            0.44069933941E-01      
     26.597033077            0.12918778608    
     11.774251449            0.26910820167    
      5.3534379024           0.37855928620    
      2.4701911802           0.29692134655    
P   2   1.00
     82.120288349           -0.39420318847E-01      
      4.9523532869           0.64048403090    
P   1   1.00
      1.0828262029           1.0000000        
P   1   1.00
      0.49271277356          1.0000000        
P   1   1.00
      0.20483450942          1.0000000        
P   1   1.00
      0.80743615716E-01            1.0000000        
D   1   1.00
      4.15900000             1.0000000        
D   1   1.00
      1.01900000             1.0000000        
D   1   1.00
      0.464000000            1.0000000        
D   1   1.00
      0.194000000            1.0000000        
F   1   1.00
      0.335000000            1.0000000        
F   1   1.00
      0.869000000            1.0000000        
****
Cl     0 
S   10   1.00
 1467459.0095000             0.11478257194E-04      
 219756.1643300              0.89234299775E-04      
  50010.7703010              0.46911086186E-03      
  14164.8239180              0.19762446133E-02      
   4620.7465525              0.71419937783E-02      
   1667.8991635              0.22753219445E-01      
    650.29199265             0.63959782953E-01      
    269.38037376             0.15331059238    
    117.06752106             0.28986952417    
     52.811766843            0.36348071452    
S   3   1.00
    461.42769988             0.18019457578E-01      
    142.12665355             0.16489442314    
     54.437838768            0.63891587584    
S   1   1.00
     24.160770219            1.0000000        
S   1   1.00
      9.7083540306           1.0000000        
S   1   1.00
      4.5640696733           1.0000000        
S   1   1.00
      2.1194744832           1.0000000        
S   1   1.00
      0.75722365394          1.0000000        
S   1   1.00
      0.33747224597          1.0000000        
S   1   1.00
      0.13860775149          1.0000000        
P   8   1.00
   2501.9457890              0.24242618410E-03      
    592.88059285             0.21079961749E-02      
    192.18089186             0.11432693869E-01      
     72.875710488            0.44956698060E-01      
     30.436358370            0.13197476145    
     13.490178902            0.27493639225    
      6.1478071413           0.38347236372    
      2.8450944820           0.28871943885    
P   2   1.00
    105.39397936            -0.34311760144E-01      
      6.7369738513           0.64060818902    
P   1   1.00
      1.2421095772           1.0000000        
P   1   1.00
      0.55669714254          1.0000000        
P   1   1.00
      0.23387801464          1.0000000        
P   1   1.00
      0.93164490890E-01            1.0000000        
D   1   1.00
      5.19100000             1.0000000        
D   1   1.00
      1.27600000             1.0000000        
D   1   1.00
      0.583000000            1.0000000        
D   1   1.00
      0.243000000            1.0000000        
F   1   1.00
      0.423000000            1.0000000        
F   1   1.00
      1.08900000             1.0000000        
****
Br     0 
S   11   1.00
 10629044.2640000            0.59322104325E-05      
 1591918.2739000             0.46118980689E-04      
 362333.9843700              0.24244612378E-03      
 102643.1114100              0.10231422748E-02      
  33489.8466680              0.37121984175E-02      
  12091.2471900              0.11978107933E-01      
   4716.1908789              0.34682692842E-01      
   1956.1598080              0.89068331264E-01      
    853.08595848             0.19330124567    
    387.96633666             0.32071144956    
    182.85156613             0.32996797574    
S   4   1.00
   3240.4086421              0.65905194070E-02      
   1000.4631935              0.68439609656E-01      
    383.37301682             0.34495478668    
    166.03929698             0.82315542085    
S   1   1.00
     87.919906994            1.0000000        
S   1   1.00
     35.675840068            1.0000000        
S   1   1.00
     17.543657842            1.0000000        
S   1   1.00
      8.4473660433           1.0000000        
S   1   1.00
      3.9666180616           1.0000000        
S   1   1.00
      1.8356815987           1.0000000        
S   1   1.00
      0.59084778776          1.0000000        
S   1   1.00
      0.28863218421          1.0000000        
S   1   1.00
      0.12153380537          1.0000000        
P   10   1.00
  26566.4765790              0.62073657410E-04      
   6290.5088566              0.55131636217E-03      
   2043.3178410              0.31680110980E-02      
    781.67221007             0.13816597290E-01      
    331.51078945             0.48018539681E-01      
    151.09198667             0.13162015183    
     72.395278166            0.26860052203    
     35.869510844            0.36827391093    
     18.139906191            0.27108612944    
      9.0466688944           0.76215338633E-01      
P   5   1.00
    253.71822146            -0.13729169381E-02      
     97.250818058           -0.10393811185E-01      
     42.034897960           -0.32204214612E-01      
      9.9685673555           0.24224770086    
      4.9395854745           0.53557868398    
P   1   1.00
      2.4382845475           1.0000000        
P   1   1.00
      1.1800000000           1.0000000        
P   1   1.00
      0.51047564965          1.0000000        
P   1   1.00
      0.21215851928          1.0000000        
P   1   1.00
      0.83943604990E-01            1.0000000        
D   7   1.00
    601.44434484             0.62783723765E-03      
    180.85718640             0.57205157153E-02      
     69.986806340            0.29002521527E-01      
     30.324710300            0.96446989766E-01      
     14.027909238            0.22065825870    
      6.6511702082           0.33657642375    
      3.1354168338           0.34872040582    
D   1   1.00
      1.4393591843           1.0000000        
D   1   1.00
      0.59350441438          1.0000000        
D   1   1.00
      0.2300000              1.0000000        
F   1   1.00
      0.34070000000          1.0000000        
F   1   1.00
      0.82570000000          1.0000000        
****
$end

# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                5 is the total number of jobs in this batch list
__batch__ :: 5
#"Flag"         "DIR"                        "InpName"       "JobType"
         h2o    <PATH1>/HEAVY28                   h2o.in     energy
         h2s    <PATH1>/HEAVY28                   h2s.in     energy
         hbr    <PATH1>/HEAVY28                   hbr.in     energy
         hcl    <PATH1>/HEAVY28                   hcl.in     energy
         nh3    <PATH1>/HEAVY28                   nh3.in     energy

# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  1        h2o        1                                      0.0000       1.0000
  1        h2s        1                                      0.0000       1.0000
  1        hbr        1                                      0.0000       1.0000
  1        hcl        1                                      0.0000       1.0000
  1         hi        1                                      0.0000       1.0000
  1        nh3        1                                      0.0000       1.0000
