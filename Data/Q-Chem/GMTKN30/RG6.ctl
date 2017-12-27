# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./RG6           2              QChem

# The project description
__title__ ::
"============================== RG6 set ============================="
"             This is RG6 subset from GMTKN30 proposed by Grimme     "
"             ECP = aug-cc-pvTZ-PP from EMSL for Kr Xe and Rn        "

# $rem group of Q-Chem Package
__qchem__ ::  1  rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static = 200
mem_total  = 7500
exchange = b3lyp
basis = gen
ecp   = gen
max_scf_cycles = 50
scf_convergence = 7
scf_guess = sad
symmetry = false
xc_grid = 000075000302
$end
$basis
He     0 
S   4   1.00
    234.0000000              0.0025870        
     35.1600000              0.0195330        
      7.9890000              0.0909980        
      2.2120000              0.2720500        
S   1   1.00
      0.6669000              1.0000000        
S   1   1.00
      0.2089000              1.0000000        
S   1   1.00
      0.0513800              1.0000000        
P   1   1.00
      3.0440000              1.0000000        
P   1   1.00
      0.7580000              1.0000000        
P   1   1.00
      0.1993000              1.0000000        
D   1   1.00
      1.9650000              1.0000000        
D   1   1.00
      0.4592000              1.0000000        
****
Ne     0 
S   8   1.00
  24350.0000000              0.0005020        
   3650.0000000              0.0038810        
    829.6000000              0.0199970        
    234.0000000              0.0784180        
     75.6100000              0.2296760        
     26.7300000              0.4327220        
      9.9270000              0.3506420        
      1.1020000             -0.0076450        
S   8   1.00
  24350.0000000             -0.0001180        
   3650.0000000             -0.0009150        
    829.6000000             -0.0047370        
    234.0000000             -0.0192330        
     75.6100000             -0.0603690        
     26.7300000             -0.1425080        
      9.9270000             -0.1777100        
      1.1020000              0.6058360        
S   1   1.00
      2.8360000              1.0000000        
S   1   1.00
      0.3782000              1.0000000        
S   1   1.00
      0.1133000              1.0000000        
P   3   1.00
     54.7000000              0.0171510        
     12.4300000              0.1076560        
      3.6790000              0.3216810        
P   1   1.00
      1.1430000              1.0000000        
P   1   1.00
      0.3300000              1.0000000        
P   1   1.00
      0.0917500              1.0000000        
D   1   1.00
      4.0140000              1.0000000        
D   1   1.00
      1.0960000              1.0000000        
D   1   1.00
      0.3860000              1.0000000        
F   1   1.00
      2.5440000              1.0000000        
F   1   1.00
      1.0840000              1.0000000        
****
Ar     0 
S   13   1.00
 545000.0000000              0.455828D-04     
  81640.0000000              0.354108D-03     
  18580.0000000              0.185797D-02     
   5261.0000000              0.776851D-02     
   1717.0000000              0.274232D-01     
    619.9000000              0.823836D-01     
    241.6000000              0.201230D+00     
     99.7900000              0.356781D+00     
     43.1500000              0.349563D+00     
     19.1400000              0.118266D+00     
      7.4880000              0.560190D-02     
      3.2050000              0.483473D-03     
      0.5204000              0.292025D-04     
S   13   1.00
 545000.0000000             -0.129551D-04     
  81640.0000000             -0.100428D-03     
  18580.0000000             -0.529583D-03     
   5261.0000000             -0.221396D-02     
   1717.0000000             -0.796845D-02     
    619.9000000             -0.245803D-01     
    241.6000000             -0.657798D-01     
     99.7900000             -0.137942D+00     
     43.1500000             -0.201630D+00     
     19.1400000             -0.412834D-01     
      7.4880000              0.484680D+00     
      3.2050000              0.579224D+00     
      0.5204000             -0.727553D-02     
S   13   1.00
 545000.0000000              0.404990D-05     
  81640.0000000              0.313691D-04     
  18580.0000000              0.165646D-03     
   5261.0000000              0.691662D-03     
   1717.0000000              0.249790D-02     
    619.9000000              0.771074D-02     
    241.6000000              0.208714D-01     
     99.7900000              0.443965D-01     
     43.1500000              0.680224D-01     
     19.1400000              0.141350D-01     
      7.4880000             -0.207489D+00     
      3.2050000             -0.425045D+00     
      0.5204000              0.733627D+00     
S   1   1.00
      1.1960000              1.0000000        
S   1   1.00
      0.1954000              1.0000000        
S   1   1.00
      0.0685000              1.0000000        
P   7   1.00
    761.8000000              0.236976D-02     
    180.2000000              0.190199D-01     
     57.5000000              0.880807D-01     
     21.2400000              0.256377D+00     
      8.3880000              0.438711D+00     
      3.4160000              0.347569D+00     
      0.4523000             -0.523882D-02     
P   7   1.00
    761.8000000             -0.667211D-03     
    180.2000000             -0.532717D-02     
     57.5000000             -0.255494D-01     
     21.2400000             -0.757197D-01     
      8.3880000             -0.141133D+00     
      3.4160000             -0.932768D-01     
      0.4523000              0.562450D+00     
P   1   1.00
      1.2060000              1.0000000        
P   1   1.00
      0.1545000              1.0000000        
P   1   1.00
      0.0487000              1.0000000        
D   1   1.00
      0.4100000              1.0000000        
D   1   1.00
      1.2540000              1.0000000        
D   1   1.00
      0.1690000              1.0000000        
F   1   1.00
      0.8900000              1.0000000        
F   1   1.00
      0.4060000              1.0000000        
****
Kr     0 
S   7   1.00
   9707.4400000              0.0005970        
   1463.5000000              0.0041290        
    327.6790000              0.0134570        
     52.4256000              0.0750740        
     18.8522000             -0.3918980        
      4.1692800              0.6673520        
      1.9926600              0.5062680        
S   7   1.00
   9707.4400000             -0.0002650        
   1463.5000000             -0.0017680        
    327.6790000             -0.0062010        
     52.4256000             -0.0283990        
     18.8522000              0.1568790        
      4.1692800             -0.3648090        
      1.9926600             -0.4330440        
S   1   1.00
      0.6836950              1.0000000        
S   1   1.00
      0.3243380              1.0000000        
S   1   1.00
      0.1382090              1.0000000        
S   1   1.00
      0.0506000              1.0000000        
P   9   1.00
    489.4570000              0.0006030        
     93.6395000              0.0064790        
     28.5921000             -0.0892740        
      7.8986100              0.3394840        
      3.8156600              0.5150780        
      1.8108300              0.2468760        
      0.7417580              0.0218330        
      0.2957270             -0.0006140        
      0.1104530              0.0002810        
P   9   1.00
    489.4570000             -0.0002110        
     93.6395000             -0.0016870        
     28.5921000              0.0263440        
      7.8986100             -0.1186870        
      3.8156600             -0.1935790        
      1.8108300             -0.0744460        
      0.7417580              0.3647020        
      0.2957270              0.5564060        
      0.1104530              0.2557360        
P   1   1.00
      0.9094000              1.0000000        
P   1   1.00
      0.1416000              1.0000000        
P   1   1.00
      0.0465000              1.0000000        
D   7   1.00
    377.8210000              0.0014340        
    114.8970000              0.0146290        
     46.9440000              0.0710960        
     20.5536000              0.1835580        
      9.3713700              0.3229310        
      4.2829000              0.3770300        
      1.9178400              0.2568870        
D   1   1.00
      0.7763900              1.0000000        
D   1   1.00
      0.2956000              1.0000000        
D   1   1.00
      0.1199000              1.0000000        
F   1   1.00
      0.6746000              1.0000000        
F   1   1.00
      0.3066000              1.0000000        
****
Xe     0 
S   9   1.00
   6456.4000000              0.0002500        
    974.0610000              0.0016300        
    214.4290000              0.0047330        
     31.3308000             -0.0336990        
     19.6130000              0.2439310        
      8.8860900             -0.7646530        
      2.3250800              0.9007940        
      1.1842200              0.4415130        
      0.0921780              0.0008510        
S   9   1.00
   6456.4000000             -0.0001300        
    974.0610000             -0.0008850        
    214.4290000             -0.0023580        
     31.3308000              0.0072910        
     19.6130000             -0.0926390        
      8.8860900              0.3537950        
      2.3250800             -0.6158300        
      1.1842200             -0.4130600        
      0.0921780              0.1423370        
S   1   1.00
      0.4268540              1.0000000        
S   1   1.00
      0.2016450              1.0000000        
S   1   1.00
      0.1143000              1.0000000        
S   1   1.00
      0.0476000              1.0000000        
P   9   1.00
    191.1700000              0.0007650        
     22.5178000              0.0369520        
     10.0604000             -0.2806880        
      5.5576200              0.1427170        
      2.6962500              0.6356540        
      1.3076400              0.3932570        
      0.5306750              0.0410560        
      0.2224610             -0.0022510        
      0.0868810              0.0007740        
P   9   1.00
    191.1700000             -0.0003290        
     22.5178000             -0.0127810        
     10.0604000              0.1082740        
      5.5576200             -0.0720510        
      2.6962500             -0.2845800        
      1.3076400             -0.1852050        
      0.5306750              0.3583360        
      0.2224610              0.5883940        
      0.0868810              0.2572450        
P   1   1.00
      0.6953000              1.0000000        
P   1   1.00
      0.1135000              1.0000000        
P   1   1.00
      0.0420000              1.0000000        
D   7   1.00
    142.9710000              0.0007360        
     41.3057000              0.0053720        
     10.9222000             -0.0288270        
      6.8240800              0.1199100        
      3.6669600              0.3324640        
      1.9828900              0.3892090        
      1.0539900              0.2483590        
D   1   1.00
      0.5299030              1.0000000        
D   1   1.00
      0.2192000              1.0000000        
D   1   1.00
      0.0917000              1.0000000        
F   1   1.00
      0.4779000              1.0000000        
F   1   1.00
      0.2287000              1.0000000        
****
Rn     0 
S   9   1.00
   3407.2000000              0.0002290        
    516.4830000              0.0012550        
     97.0281000              0.0036740        
     26.4655000             -0.0885740        
     16.5631000              0.3733190        
      7.2510600             -0.9622370        
      2.1719300              0.8751670        
      1.1801200              0.5520340        
      0.0909250              0.0020960        
S   9   1.00
   3407.2000000             -0.0001250        
    516.4830000             -0.0007910        
     97.0281000             -0.0013530        
     26.4655000              0.0328160        
     16.5631000             -0.1662340        
      7.2510600              0.5134720        
      2.1719300             -0.7293370        
      1.1801200             -0.4533150        
      0.0909250              0.1289040        
S   1   1.00
      0.4014950              1.0000000        
S   1   1.00
      0.1948420              1.0000000        
S   1   1.00
      0.1060000              1.0000000        
S   1   1.00
      0.0429000              1.0000000        
P   9   1.00
     20.7239000             -0.0087120        
     12.9996000              0.1615290        
      8.1734800             -0.4339190        
      2.7474200              0.4447680        
      1.5639000              0.5621850        
      0.8110200              0.1912550        
      0.4009630              0.0133510        
      0.1737640              0.0015260        
      0.0715760             -0.0001560        
P   9   1.00
     20.7239000             -0.0002330        
     12.9996000             -0.0514810        
      8.1734800              0.1655770        
      2.7474200             -0.2323410        
      1.5639000             -0.2874580        
      0.8110200             -0.0486090        
      0.4009630              0.4450460        
      0.1737640              0.5480680        
      0.0715760              0.1999230        
P   1   1.00
      0.6463000              1.0000000        
P   1   1.00
      0.1083000              1.0000000        
P   1   1.00
      0.0426000              1.0000000        
D   6   1.00
     75.4318000              0.0007340        
     18.0171000              0.0088650        
      7.3516500             -0.0771450        
      3.2521200              0.2250370        
      1.8098900              0.4386570        
      0.9565500              0.3545790        
D   1   1.00
      0.4747500              1.0000000        
D   1   1.00
      0.1960000              1.0000000        
D   1   1.00
      0.0794000              1.0000000        
F   1   1.00
      0.4303000              1.0000000        
F   1   1.00
      0.2084000              1.0000000        
****
$end
$ecp
KR     0
KR-ECP     4     10
g-ul potential
  1
  2      1.0000000              0.0000000
  s-ul potential
  3
  2     70.0344100             49.9538350
  2     31.8959710            369.9782380
  2      7.3537280             10.0545440
p-ul potential
  4
  2     47.2651830             99.1018330
  2     46.6642680            198.2325240
  2     23.0081330             28.2046700
  2     22.1009790             56.5167920
d-ul potential
  6
  2     50.7681650            -18.5888770
  2     50.7822280            -27.8753980
  2     15.4794970             -0.2934110
  2     15.5593830             -0.4693990
  2      2.8771540              0.0688810
  2      1.9911960              0.1322700
f-ul potential
  2
  2     15.4375670             -1.2233890
  2     22.0557420             -2.9912330
****
XE     0
XE-ECP     4     28
g-ul potential
  1
  2      1.0000000              0.0000000
s-ul potential
  3
  2     40.0051840             49.9979620
  2     17.8122140            281.0133030
  2      9.3041500             61.5382550
p-ul potential
  4
  2     15.7017720             67.4391420
  2     15.2586080            134.8747110
  2      9.2921840             14.6633000
  2      8.5590030             29.3547300
d-ul potential
  6
  2     15.1856000             35.4369080
  2     14.2845000             53.1957720
  2      7.1218890              9.0462320
  2      6.9919630             13.2236810
  2      0.6239460              0.0848530
  2      0.6472840              0.0441550
f-ul potential
  4
  2     20.8815570            -23.0892950
  2     20.7834430            -30.0744750
  2      5.2533890             -0.2882270
  2      5.3611880             -0.3869240
****
RN     0
RN-ECP     5     60
h potential
  1
  2      1.0000000              0.0000000
s-h potential
  3
  2     30.1512420             49.9655510
  2     14.5212410            283.0700000
  2      8.0520380             62.0028700
p-h potential
  4
  2     11.0099420             71.9691190
  2      9.6176250            143.8605590
  2      7.3360080              4.7147610
  2      6.4062530              9.0130650
d-h potential
  4
  2      8.3692200             36.3683650
  2      8.1169750             54.5517610
  2      5.3536560              9.6344870
  2      5.0972120             14.3879020
f-h potential
  4
  2      6.3485710             21.7972900
  2      6.2959490             28.9468050
  2      2.8821180              1.4473650
  2      2.9080480              2.1779640
g-h potential
  4
  2     11.0152050            -25.2280950
  2     10.9098530            -30.5661210
  2      3.4827610             -0.5748000
  2      3.6004180             -0.7795380
****
$end

# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                13 is the total number of jobs in this batch list
__batch__ :: 13
#"Flag"         "DIR"                        "InpName"       "JobType"
 ne_2           <PATH1>/RG6                 ne_2.in            energy
 ne             <PATH1>/RG6                   ne.in            energy
 ar_2           <PATH1>/RG6                 ar_2.in            energy
 ar             <PATH1>/RG6                   ar.in            energy
 ar_2           <PATH1>/RG6                 ar_2.in            energy
 kr             <PATH1>/RG6                   kr.in            energy
 kr_2           <PATH1>/RG6                 kr_2.in            energy
 kr             <PATH1>/RG6                   kr.in            energy
 rn_2           <PATH1>/RG6                 rn_2.in            energy
 rn             <PATH1>/RG6                   rn.in            energy
 xe             <PATH1>/RG6                   xe.in            energy
 xe_2           <PATH1>/RG6                 xe_2.in            energy
 rnxe           <PATH1>/RG6                 rnxe.in            energy


# Training set for the atomization energy
#               6 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 6  627.51
#"Number" "Flag" "Scale"                                           "Ref"      "Weight"
  2        ne_2       -1       ne        2                         0.08       1.0
  2        ar_2       -1       ar        2                         0.28       1.0
  2        kr_2       -1       kr        2                         0.40       1.0
  2        xe_2       -1       xe        2                         0.56       1.0
  3        rnxe       -1       rn        1         xe      1       0.65       1.0
  2        rn_2       -1       rn        2                         0.79       1.0 
