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

# $rem group of Q-Chem Package
__qchem__ ::  1  rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
mem_static      = 200
mem_total       = 7500
exchange        = b3lyp
basis           = g3large
max_scf_cycles  = 50
scf_convergence = 7
symmetry        = false
xc_grid         = 000075000302                                                               
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

