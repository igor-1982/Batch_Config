# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G21IP           2              Gaussian

# The project description
__title__ ::
"============================== G21IP set ============================="
"             This is G21IP subset from GMTKN30 proposed by Grimme     "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/G3Large NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                71 is the total number of jobs in this batch list
__batch__ :: 71
#"Flag"         "DIR"                        "InpName"       "JobType"
    11         <PATH1>/G21IP                  11.com         energy
    12         <PATH1>/G21IP                  12.com         energy
   137         <PATH1>/G21IP                 137.com         energy
    13         <PATH1>/G21IP                  13.com         energy
    14         <PATH1>/G21IP                  14.com         energy
    18         <PATH1>/G21IP                  18.com         energy
    19         <PATH1>/G21IP                  19.com         energy
    20         <PATH1>/G21IP                  20.com         energy
    22         <PATH1>/G21IP                  22.com         energy
    25         <PATH1>/G21IP                  25.com         energy
    26         <PATH1>/G21IP                  26.com         energy
    30         <PATH1>/G21IP                  30.com         energy
    34         <PATH1>/G21IP                  34.com         energy
    37         <PATH1>/G21IP                  37.com         energy
    43         <PATH1>/G21IP                  43.com         energy
    44         <PATH1>/G21IP                  44.com         energy
    45         <PATH1>/G21IP                  45.com         energy
    48         <PATH1>/G21IP                  48.com         energy
    51         <PATH1>/G21IP                  51.com         energy
     8         <PATH1>/G21IP                   8.com         energy
    al         <PATH1>/G21IP                  al.com         energy
   al+         <PATH1>/G21IP                 al+.com         energy
     b         <PATH1>/G21IP                   b.com         energy
    b+         <PATH1>/G21IP                  b+.com         energy
    be         <PATH1>/G21IP                  be.com         energy
   be+         <PATH1>/G21IP                 be+.com         energy
     c         <PATH1>/G21IP                   c.com         energy
    c+         <PATH1>/G21IP                  c+.com         energy
    cl         <PATH1>/G21IP                  cl.com         energy
   cl+         <PATH1>/G21IP                 cl+.com         energy
     f         <PATH1>/G21IP                   f.com         energy
    f+         <PATH1>/G21IP                  f+.com         energy
     h         <PATH1>/G21IP                   h.com         energy
 IP_59         <PATH1>/G21IP               IP_59.com         energy
 IP_60         <PATH1>/G21IP               IP_60.com         energy
 IP_61         <PATH1>/G21IP               IP_61.com         energy
 IP_62         <PATH1>/G21IP               IP_62.com         energy
 IP_63         <PATH1>/G21IP               IP_63.com         energy
 IP_64         <PATH1>/G21IP               IP_64.com         energy
 IP_65         <PATH1>/G21IP               IP_65.com         energy
 IP_66         <PATH1>/G21IP               IP_66.com         energy
 IP_67         <PATH1>/G21IP               IP_67.com         energy
 IP_68         <PATH1>/G21IP               IP_68.com         energy
 IP_70         <PATH1>/G21IP               IP_70.com         energy
 IP_71         <PATH1>/G21IP               IP_71.com         energy
 IP_72         <PATH1>/G21IP               IP_72.com         energy
 IP_73         <PATH1>/G21IP               IP_73.com         energy
 IP_74         <PATH1>/G21IP               IP_74.com         energy
 IP_75         <PATH1>/G21IP               IP_75.com         energy
 IP_76         <PATH1>/G21IP               IP_76.com         energy
 IP_77         <PATH1>/G21IP               IP_77.com         energy
 IP_78         <PATH1>/G21IP               IP_78.com         energy
 IP_79         <PATH1>/G21IP               IP_79.com         energy
 IP_80         <PATH1>/G21IP               IP_80.com         energy
IP_n65         <PATH1>/G21IP              IP_n65.com         energy
    li         <PATH1>/G21IP                  li.com         energy
   li+         <PATH1>/G21IP                 li+.com         energy
    mg         <PATH1>/G21IP                  mg.com         energy
   mg+         <PATH1>/G21IP                 mg+.com         energy
    na         <PATH1>/G21IP                  na.com         energy
   na+         <PATH1>/G21IP                 na+.com         energy
     n         <PATH1>/G21IP                   n.com         energy
    n+         <PATH1>/G21IP                  n+.com         energy
     o         <PATH1>/G21IP                   o.com         energy
    o+         <PATH1>/G21IP                  o+.com         energy
     p         <PATH1>/G21IP                   p.com         energy
    p+         <PATH1>/G21IP                  p+.com         energy
     s         <PATH1>/G21IP                   s.com         energy
    s+         <PATH1>/G21IP                  s+.com         energy
    si         <PATH1>/G21IP                  si.com         energy
   si+         <PATH1>/G21IP                 si+.com         energy

# Training set for the atomization energy
#               36 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 36  627.51
#"Number" "Flag" "Scale"                          "Ref"      "Weight"
  1           h    -1                             314.900    1.00
  2          li+    1        li    -1             123.300    1.00
  2          be+    1        be    -1             214.900    1.00
  2           b+    1         b    -1             190.400    1.00
  2           c+    1         c    -1             259.600    1.00
  2           n+    1         n    -1             335.300    1.00
  2           o+    1         o    -1             313.800    1.00
  2           f+    1         f    -1             401.700    1.00
  2          na+    1        na    -1             118.500    1.00
  2          mg+    1        mg    -1             176.300    1.00
  2          al+    1        al    -1             138.000    1.00
  2          si+    1        si    -1             188.000    1.00
  2           p+    1         p    -1             241.900    1.00
  2           s+    1         s    -1             239.000    1.00
  2          cl+    1        cl    -1             299.100    1.00
  2        IP_59    1         8    -1             296.339    1.00
  2        IP_60    1        11    -1             235.690    1.00
  2        IP_61    1        12    -1             300.917    1.00
  2        IP_62    1        13    -1             292.648    1.00
  2        IP_63    1        14    -1             371.311    1.00
  2        IP_64    1        18    -1             255.387    1.00
  2        IP_65    1    IP_n65    -1             234.107    1.00
  2        IP_66    1        19    -1             226.367    1.00
  2        IP_67    1        20    -1             227.822    1.00
  2        IP_68    1       137    -1             239.300    1.00
  2        IP_70    1        22    -1             294.459    1.00
  2        IP_71    1        25    -1             264.585    1.00
  2        IP_72    1        26    -1             243.709    1.00
  2        IP_73    1        30    -1             322.986    1.00
  2        IP_74    1        34    -1             359.365    1.00
  2        IP_75    1        37    -1             277.727    1.00
  2        IP_76    1        43    -1             242.854    1.00
  2        IP_77    1        44    -1             215.737    1.00
  2        IP_78    1        45    -1             265.083    1.00
  2        IP_79    1        51    -1             291.699    1.00
  2        IP_80    1        48    -1             261.153    1.00
