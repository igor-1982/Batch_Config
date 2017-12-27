# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#                "ProjDir"       "ProjCtrl"
__project__ ::   ./S22           2

# The project description
__title__ ::
"=========================1_adenine_thymine_wc =========================="
"This is the set to optimize the geometry of S22 set."
"========================================================================"

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) Scf=Tight opt freq=noraman


# Specify <MicroPath> in the batch list
__macro_path__ ::
<PATH1> = .


# The molecular set to batch: 
#               22 is the total number of jobs in this batch list
__batch__ :: 22
#"Flag"         "DIR"                     "InpName"         "JobType"
# s22 22
 pccp1_eq       <PATH1>/pccp1              pccp1_eq.com      geom
 pccp2_eq       <PATH1>/pccp2              pccp2_eq.com      geom
 pccp3_eq       <PATH1>/pccp3              pccp3_eq.com      geom
 pccp4_eq       <PATH1>/pccp4              pccp4_eq.com      geom
 pccp5_eq       <PATH1>/pccp5              pccp5_eq.com      geom
 pccp6_eq       <PATH1>/pccp6              pccp6_eq.com      geom
 pccp7_eq       <PATH1>/pccp7              pccp7_eq.com      geom
 pccp8_eq       <PATH1>/pccp8              pccp8_eq.com      geom
 pccp9_eq       <PATH1>/pccp9              pccp9_eq.com      geom
 pccp10_eq      <PATH1>/pccp10             pccp10_eq.com     geom
 pccp11_eq      <PATH1>/pccp11             pccp11_eq.com     geom
 pccp12_eq      <PATH1>/pccp12             pccp12_eq.com     geom
 pccp13_eq      <PATH1>/pccp13             pccp13_eq.com     geom
 pccp14_eq      <PATH1>/pccp14             pccp14_eq.com     geom
 pccp15_eq      <PATH1>/pccp15             pccp15_eq.com     geom
 pccp16_eq      <PATH1>/pccp16             pccp16_eq.com     geom
 pccp17_eq      <PATH1>/pccp17             pccp17_eq.com     geom
 pccp18_eq      <PATH1>/pccp18             pccp18_eq.com     geom
 pccp19_eq      <PATH1>/pccp19             pccp19_eq.com     geom
 pccp20_eq      <PATH1>/pccp20          pccp2_eq0_eq.com     geom
 pccp21_eq      <PATH1>/pccp21          pccp2_eq1_eq.com     geom
 pccp22_eq      <PATH1>/pccp22          pccp2_eq2_eq.com     geom

# Training set for the geometry optimization
#	       308 is the total number of data to be tested
#    [1.0,1.0,1.0] is the set of scale factors from calculated bond,
#                     angle, and dihedral to corresponding refs
__geom__ :: 308 1.0 1.0 1.0
#  "FLAG"  "BondType" "AtomIndx" "AtomIndx" "AtomIndx" "AtomIndx"  "Ref." "Weight"
# For normal bond
pccp1_eq    1          1          2                                1.3429  1.0  
pccp1_eq    1          1          6                                1.35    1.0
pccp1_eq    1          2          3                                1.4084  1.0
pccp1_eq    1          2          10                               1.3404  1.0
pccp1_eq    1          3          4                                1.3946  1.0
pccp1_eq    1          3          7                                1.3754  1.0
pccp1_eq    1          4          5                                1.3395  1.0
pccp1_eq    1          4          9                                1.3732  1.0
pccp1_eq    1          5          6                                1.33    1.0
pccp1_eq    1          6          11                               1.0827  1.0
pccp1_eq    1          7          8                                1.3225  1.0
pccp1_eq    1          8          9                                1.3677  1.0
pccp1_eq    1          8          12                               1.0771  1.0
pccp1_eq    1          9          13                               1.0064  1.0
pccp1_eq    1          10         14                               1.0156  1.0
pccp1_eq    1          10         15                               1.0034  1.0
pccp1_eq    1          16         17                               1.3707  1.0
pccp1_eq    1          16         21                               1.384   1.0
pccp1_eq    1          16         25                               1.0063  1.0
pccp1_eq    1          17         18                               1.3516  1.0
pccp1_eq    1          17         27                               1.081   1.0
pccp1_eq    1          18         19                               1.4557  1.0
pccp1_eq    1          18         22                               1.4922  1.0
pccp1_eq    1          19         20                               1.3828  1.0
pccp1_eq    1          19         23                               1.2326  1.0
pccp1_eq    1          20         21                               1.3768  1.0
pccp1_eq    1          20         26                               1.042   1.0
pccp1_eq    1          21         24                               1.2181  1.0
pccp1_eq    1          22         28                               1.0889  1.0
pccp1_eq    1          22         29                               1.0889  1.0
pccp1_eq    1          22         30                               1.0881  1.0
pccp2_eq    1          1          2                                1.3658  1.0
pccp2_eq    1          1          14                               1.3727  1.0
pccp2_eq    1          1          15                               1.0069  1.0
pccp2_eq    1          2          3                                1.0772  1.0
pccp2_eq    1          2          4                                1.324   1.0
pccp2_eq    1          4          5                                1.3741  1.0
pccp2_eq    1          5          6                                1.4059  1.0
pccp2_eq    1          5          14                               1.3995  1.0
pccp2_eq    1          6          7                                1.357   1.0
pccp2_eq    1          6          10                               1.3374  1.0
pccp2_eq    1          6          21                               2.9316  1.0
pccp2_eq    1          7          8                                1.0063  1.0
pccp2_eq    1          7          9                                1.0076  1.0
pccp2_eq    1          9          25                               2.8737  1.0
pccp2_eq    1          10         11                               1.3463  1.0
pccp2_eq    1          10         21                               2.6949  1.0
pccp2_eq    1          11         12                               1.0827  1.0
pccp2_eq    1          11         13                               1.3356  1.0
pccp2_eq    1          13         14                               1.3374  1.0
pccp2_eq    1          16         17                               1.3732  1.0
pccp2_eq    1          16         28                               1.3766  1.0
pccp2_eq    1          16         30                               1.0064  1.0
pccp2_eq    1          17         18                               1.0804  1.0
pccp2_eq    1          17         19                               1.352   1.0
pccp2_eq    1          19         20                               1.4916  1.0
pccp2_eq    1          19         24                               1.4556  1.0
pccp2_eq    1          20         21                               1.0888  1.0
pccp2_eq    1          20         22                               1.089   1.0
pccp2_eq    1          20         23                               1.0881  1.0
pccp2_eq    1          24         25                               1.223   1.0
pccp2_eq    1          24         26                               1.3991  1.0
pccp2_eq    1          26         27                               1.0111  1.0
pccp2_eq    1          26         28                               1.3777  1.0
pccp2_eq    1          28         29                               1.2203  1.0
pccp3_eq    1          1          2                                1.0125  1.0
pccp3_eq    1          1          3                                1.0125  1.0
pccp3_eq    1          1          4                                1.0142  1.0
pccp3_eq    1          5          6                                1.0125  1.0
pccp3_eq    1          5          7                                1.0142  1.0
pccp3_eq    1          5          8                                1.0125  1.0
pccp4_eq    1          1          2                                0.9571  1.0
pccp4_eq    1          1          3                                0.9639  1.0
pccp4_eq    1          4          5                                0.959   1.0
pccp4_eq    1          4          6                                0.959   1.0
# For weak bond
pccp1_eq    1          1          26                               1.819   1.0
pccp1_eq    1          14         23                               1.929   1.0
pccp2_eq    1          1          26                               3.4693  1.0
pccp2_eq    1          1          28                               3.092   1.0
pccp2_eq    1          1          29                               3.1538  1.0
pccp2_eq    1          2          26                               3.2827  1.0
pccp2_eq    1          2          27                               3.1225  1.0
pccp2_eq    1          2          28                               3.3527  1.0
pccp2_eq    1          2          29                               3.3707  1.0
pccp2_eq    1          3          29                               3.4501  1.0
pccp2_eq    1          4          24                               3.4627  1.0
pccp2_eq    1          4          26                               3.2138  1.0
pccp2_eq    1          4          27                               3.0631  1.0
pccp2_eq    1          5          24                               3.1881  1.0
pccp2_eq    1          5          26                               3.2914  1.0
pccp2_eq    1          6          19                               3.3874  1.0
pccp2_eq    1          6          24                               3.3249  1.0
pccp2_eq    1          6          25                               3.443   1.0
pccp2_eq    1          7          21                               3.0599  1.0
pccp2_eq    1          7          25                               3.3386  1.0
pccp2_eq    1          9          24                               3.4633  1.0
pccp2_eq    1          10         19                               3.4105  1.0
pccp2_eq    1          10         20                               3.3973  1.0
pccp2_eq    1          11         17                               3.4192  1.0
pccp2_eq    1          11         18                               3.4473  1.0
pccp2_eq    1          11         21                               3.4631  1.0
pccp2_eq    1          13         16                               3.3669  1.0
pccp2_eq    1          13         17                               3.2969  1.0
pccp2_eq    1          13         18                               3.4645  1.0
pccp2_eq    1          14         16                               3.313   1.0
pccp2_eq    1          14         26                               3.4773  1.0
pccp2_eq    1          14         28                               3.3192  1.0
pccp2_eq    1          15         28                               3.2343  1.0
pccp2_eq    1          15         29                               3.0042  1.0
pccp3_eq    1          1          7                                2.504   1.0
pccp3_eq    1          4          5                                2.504   1.0
pccp4_eq    1          3          4                                1.9516  1.0
# For angle
pccp1_eq    2          2          1          6                   119.5527  1.0
pccp1_eq    2          2          1          26                  123.3706  1.0
pccp1_eq    2          6          1          26                  117.0654  1.0
pccp1_eq    2          1          2          3                   117.5443  1.0
pccp1_eq    2          1          2          10                  119.8934  1.0
pccp1_eq    2          3          2          10                  122.5608  1.0
pccp1_eq    2          2          3          4                   116.408   1.0
pccp1_eq    2          2          3          7                   131.6502  1.0
pccp1_eq    2          4          3          7                   111.9417  1.0
pccp1_eq    2          3          4          5                   127.3488  1.0
pccp1_eq    2          3          4          9                   104.3401  1.0
pccp1_eq    2          5          4          9                   128.311   1.0
pccp1_eq    2          4          5          6                   110.7902  1.0
pccp1_eq    2          1          6          5                   128.3557  1.0
pccp1_eq    2          1          6          11                  114.7298  1.0
pccp1_eq    2          5          6          11                  116.9145  1.0
pccp1_eq    2          3          7          8                   103.3548  1.0
pccp1_eq    2          7          8          9                   113.4547  1.0
pccp1_eq    2          7          8          12                  124.838   1.0
pccp1_eq    2          9          8          12                  121.7073  1.0
pccp1_eq    2          4          9          8                   106.9087  1.0
pccp1_eq    2          4          9          13                  125.8318  1.0
pccp1_eq    2          8          9          13                  127.2596  1.0
pccp1_eq    2          2          10         14                  120.2746  1.0
pccp1_eq    2          2          10         15                  118.3155  1.0
pccp1_eq    2          14         10         15                  121.0404  1.0
pccp1_eq    2          10         14         23                  173.6053  1.0
pccp1_eq    2          17         16         21                  123.6626  1.0
pccp1_eq    2          17         16         25                  121.124   1.0
pccp1_eq    2          21         16         25                  115.2134  1.0
pccp1_eq    2          16         17         18                  122.2525  1.0
pccp1_eq    2          16         17         27                  115.6278  1.0
pccp1_eq    2          18         17         27                  122.1197  1.0
pccp1_eq    2          17         18         19                  117.8003  1.0
pccp1_eq    2          17         18         22                  123.8006  1.0
pccp1_eq    2          19         18         22                  118.3991  1.0
pccp1_eq    2          18         19         20                  115.7997  1.0
pccp1_eq    2          18         19         23                  123.257   1.0
pccp1_eq    2          20         19         23                  120.9433  1.0
pccp1_eq    2          19         20         21                  127.3146  1.0
pccp1_eq    2          19         20         26                  117.0058  1.0
pccp1_eq    2          21         20         26                  115.6796  1.0
pccp1_eq    2          16         21         20                  113.1703  1.0
pccp1_eq    2          16         21         24                  122.7118  1.0
pccp1_eq    2          20         21         24                  124.1179  1.0
pccp1_eq    2          18         22         28                  110.5464  1.0
pccp1_eq    2          18         22         29                  110.5436  1.0
pccp1_eq    2          18         22         30                  110.9278  1.0
pccp1_eq    2          28         22         29                  106.8615  1.0
pccp1_eq    2          28         22         30                  108.9268  1.0
pccp1_eq    2          29         22         30                  108.9257  1.0
pccp1_eq    2          14         23         19                  125.5619  1.0
pccp2_eq    2          2          1          14                  106.8787  1.0
pccp2_eq    2          2          1          15                  126.3717  1.0
pccp2_eq    2          14         1          15                  126.4849  1.0
pccp2_eq    2          1          2          3                   121.4583  1.0
pccp2_eq    2          1          2          4                   113.6295  1.0
pccp2_eq    2          3          2          4                   124.9121  1.0
pccp2_eq    2          2          4          5                   103.3118  1.0
pccp2_eq    2          4          5          6                   132.0469  1.0
pccp2_eq    2          4          5          14                  111.845   1.0
pccp2_eq    2          6          5          14                  116.1032  1.0
pccp2_eq    2          5          6          7                   121.729   1.0
pccp2_eq    2          5          6          10                  118.679   1.0
pccp2_eq    2          7          6          10                  119.5699  1.0
pccp2_eq    2          6          7          8                   115.2593  1.0
pccp2_eq    2          6          7          9                   115.7118  1.0
pccp2_eq    2          8          7          9                   116.1716  1.0
pccp2_eq    2          6          10         11                  118.5224  1.0
pccp2_eq    2          10         11         12                  115.1487  1.0
pccp2_eq    2          10         11         13                  128.9555  1.0
pccp2_eq    2          12         11         13                  115.8958  1.0
pccp2_eq    2          11         13         14                  110.8103  1.0
pccp2_eq    2          1          14         5                   104.3305  1.0
pccp2_eq    2          1          14         13                  128.7558  1.0
pccp2_eq    2          5          14         13                  126.9137  1.0
pccp2_eq    2          17         16         28                  123.8347  1.0
pccp2_eq    2          17         16         30                  120.6091  1.0
pccp2_eq    2          28         16         30                  115.4149  1.0
pccp2_eq    2          16         17         18                  115.3908  1.0
pccp2_eq    2          16         17         19                  122.5461  1.0
pccp2_eq    2          18         17         19                  122.0631  1.0
pccp2_eq    2          17         19         20                  123.4575  1.0
pccp2_eq    2          17         19         24                  118.1307  1.0
pccp2_eq    2          20         19         24                  118.4116  1.0
pccp2_eq    2          19         20         21                  110.4801  1.0
pccp2_eq    2          19         20         22                  110.3907  1.0
pccp2_eq    2          19         20         23                  110.7528  1.0
pccp2_eq    2          21         20         22                  107.7434  1.0
pccp2_eq    2          21         20         23                  108.2717  1.0
pccp2_eq    2          22         20         23                  109.1203  1.0
pccp2_eq    2          19         24         25                  125.0732  1.0
pccp2_eq    2          19         24         26                  114.4858  1.0
pccp2_eq    2          25         24         26                  120.4407  1.0
pccp2_eq    2          24         26         27                  115.7649  1.0
pccp2_eq    2          24         26         28                  128.2427  1.0
pccp2_eq    2          27         26         28                  115.6364  1.0
pccp2_eq    2          16         28         26                  112.613   1.0
pccp2_eq    2          16         28         29                  123.4151  1.0
pccp2_eq    2          26         28         29                  123.9707  1.0
pccp3_eq    2          2          1          3                   106.1768  1.0
pccp3_eq    2          2          1          4                   106.6318  1.0
pccp3_eq    2          2          1          7                   126.8369  1.0
pccp3_eq    2          3          1          4                   106.6318  1.0
pccp3_eq    2          3          1          7                   126.8369  1.0
pccp3_eq    2          4          1          7                    58.1604  1.0
pccp3_eq    2          1          4          5                   121.8396  1.0
pccp3_eq    2          4          5          6                   126.8369  1.0
pccp3_eq    2          4          5          7                    58.1604  1.0
pccp3_eq    2          4          5          8                   126.8369  1.0
pccp3_eq    2          6          5          7                   106.6318  1.0
pccp3_eq    2          6          5          8                   106.1768  1.0
pccp3_eq    2          7          5          8                   106.6318  1.0
pccp3_eq    2          1          7          5                   121.8396  1.0
pccp4_eq    2          2          1          3                   104.3375  1.0
pccp4_eq    2          1          3          4                   172.8103  1.0
pccp4_eq    2          3          4          5                   108.9848  1.0
pccp4_eq    2          3          4          6                   108.9848  1.0
pccp4_eq    2          5          4          6                   104.5636  1.0
# For dihedral angles
pccp2_eq    3          14         1          2          3       -179.1627  1.0
pccp2_eq    3          14         1          2          4          0.7202  1.0
pccp2_eq    3          15         1          2          3         -4.7869  1.0
pccp2_eq    3          15         1          2          4        175.096   1.0
pccp2_eq    3          2          1          14         5         -0.5741  1.0
pccp2_eq    3          2          1          14         13       179.4169  1.0
pccp2_eq    3          15         1          14         5       -174.9416  1.0
pccp2_eq    3          15         1          14         13         5.0493  1.0
pccp2_eq    3          1          2          4          5         -0.516   1.0
pccp2_eq    3          3          2          4          5        179.3621  1.0
pccp2_eq    3          2          4          5          6       -179.0221  1.0
pccp2_eq    3          2          4          5          14         0.123   1.0
pccp2_eq    3          4          5          6          7         -1.3199  1.0
pccp2_eq    3          4          5          6          10      -179.6041  1.0
pccp2_eq    3          14         5          6          7        179.5638  1.0
pccp2_eq    3          14         5          6          10         1.2795  1.0
pccp2_eq    3          4          5          14         1          0.2904  1.0
pccp2_eq    3          4          5          14         13      -179.7008  1.0
pccp2_eq    3          6          5          14         1        179.5835  1.0
pccp2_eq    3          6          5          14         13        -0.4077  1.0
pccp2_eq    3          5          6          7          8        165.0276  1.0
pccp2_eq    3          5          6          7          9         24.81    1.0
pccp2_eq    3          10         6          7          8        -16.703   1.0
pccp2_eq    3          10         6          7          9       -156.9206  1.0
pccp2_eq    3          5          6          10         11        -1.1009  1.0
pccp2_eq    3          7          6          10         11      -179.4231  1.0
pccp2_eq    3          6          10         11         12      -179.9106  1.0
pccp2_eq    3          6          10         11         13        -0.0351  1.0
pccp2_eq    3          10         11         13         14         0.8685  1.0
pccp2_eq    3          12         11         13         14      -179.2567  1.0
pccp2_eq    3          11         13         14         1        179.4096  1.0
pccp2_eq    3          11         13         14         5         -0.6014  1.0
pccp2_eq    3          28         16         17         18      -179.0682  1.0
pccp2_eq    3          28         16         17         19         0.9036  1.0
pccp2_eq    3          30         16         17         18        -3.5913  1.0
pccp2_eq    3          30         16         17         19       176.3805  1.0
pccp2_eq    3          17         16         28         26        -2.444   1.0
pccp2_eq    3          17         16         28         29       177.1691  1.0
pccp2_eq    3          30         16         28         26      -178.1344  1.0
pccp2_eq    3          30         16         28         29         1.4787  1.0
pccp2_eq    3          16         17         19         20       179.3606  1.0
pccp2_eq    3          16         17         19         24        -0.794   1.0
pccp2_eq    3          18         17         19         20        -0.6695  1.0
pccp2_eq    3          18         17         19         24       179.1759  1.0
pccp2_eq    3          17         19         20         21       115.53    1.0
pccp2_eq    3          17         19         20         22      -125.3989  1.0
pccp2_eq    3          17         19         20         23        -4.4318  1.0
pccp2_eq    3          24         19         20         21       -64.3149  1.0
pccp2_eq    3          24         19         20         22        54.7562  1.0
pccp2_eq    3          24         19         20         23       175.7233  1.0
pccp2_eq    3          17         19         24         25      -177.8762  1.0
pccp2_eq    3          17         19         24         26         2.3086  1.0
pccp2_eq    3          20         19         24         25         1.9772  1.0
pccp2_eq    3          20         19         24         26      -177.8381  1.0
pccp2_eq    3          19         24         26         27      -177.3031  1.0
pccp2_eq    3          19         24         26         28        -4.5132  1.0
pccp2_eq    3          25         24         26         27         2.8723  1.0
pccp2_eq    3          25         24         26         28       175.6622  1.0
pccp2_eq    3          24         26         28         16         4.4974  1.0
pccp2_eq    3          24         26         28         29      -175.1132  1.0
pccp2_eq    3          27         26         28         16       177.2951  1.0
pccp2_eq    3          27         26         28         29        -2.3155  1.0
pccp3_eq    3          2          1          4          5       -123.4388  1.0
pccp3_eq    3          3          1          4          5        123.4388  1.0
pccp3_eq    3          7          1          4          5          0.0     1.0
pccp3_eq    3          2          1          7          5         87.4659  1.0
pccp3_eq    3          3          1          7          5        -87.4659  1.0
pccp3_eq    3          4          1          7          5          0.0     1.0
pccp3_eq    3          1          4          5          6         87.4659  1.0
pccp3_eq    3          1          4          5          7          0.0     1.0
pccp3_eq    3          1          4          5          8        -87.4659  1.0
pccp3_eq    3          4          5          7          1          0.0     1.0
pccp3_eq    3          6          5          7          1       -123.4388  1.0
pccp3_eq    3          8          5          7          1        123.4388  1.0
pccp4_eq    3          2          1          3          4        180.0     1.0
pccp4_eq    3          1          3          4          5         56.7757  1.0
pccp4_eq    3          1          3          4          6        -56.7757  1.0


