# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G2RC           2               QChem

# The project description
__title__ ::
"============================== G2RC set ============================="
"             This is G2RC subset from GMTKN30 proposed by Grimme     "

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
#                47 is the total number of jobs in this batch list
__batch__ :: 47
#"Flag"         "DIR"                        "InpName"       "JobType"
  100           <PATH1>/G2RC                  100.in         energy
  104           <PATH1>/G2RC                  104.in         energy
  106           <PATH1>/G2RC                  106.in         energy
  113           <PATH1>/G2RC                  113.in         energy
  117           <PATH1>/G2RC                  117.in         energy
  118           <PATH1>/G2RC                  118.in         energy
   11           <PATH1>/G2RC                   11.in         energy
  121           <PATH1>/G2RC                  121.in         energy
  126           <PATH1>/G2RC                  126.in         energy
  128           <PATH1>/G2RC                  128.in         energy
   13           <PATH1>/G2RC                   13.in         energy
   14           <PATH1>/G2RC                   14.in         energy
   18           <PATH1>/G2RC                   18.in         energy
    1           <PATH1>/G2RC                    1.in         energy
   21           <PATH1>/G2RC                   21.in         energy
   22           <PATH1>/G2RC                   22.in         energy
   23           <PATH1>/G2RC                   23.in         energy
   24           <PATH1>/G2RC                   24.in         energy
   25           <PATH1>/G2RC                   25.in         energy
   26           <PATH1>/G2RC                   26.in         energy
   30           <PATH1>/G2RC                   30.in         energy
   32           <PATH1>/G2RC                   32.in         energy
   33           <PATH1>/G2RC                   33.in         energy
   34           <PATH1>/G2RC                   34.in         energy
   39           <PATH1>/G2RC                   39.in         energy
   40           <PATH1>/G2RC                   40.in         energy
   45           <PATH1>/G2RC                   45.in         energy
   47           <PATH1>/G2RC                   47.in         energy
   51           <PATH1>/G2RC                   51.in         energy
   52           <PATH1>/G2RC                   52.in         energy
   56           <PATH1>/G2RC                   56.in         energy
   57           <PATH1>/G2RC                   57.in         energy
   58           <PATH1>/G2RC                   58.in         energy
   59           <PATH1>/G2RC                   59.in         energy
   60           <PATH1>/G2RC                   60.in         energy
   61           <PATH1>/G2RC                   61.in         energy
   62           <PATH1>/G2RC                   62.in         energy
   66           <PATH1>/G2RC                   66.in         energy
   67           <PATH1>/G2RC                   67.in         energy
   68           <PATH1>/G2RC                   68.in         energy
    6           <PATH1>/G2RC                    6.in         energy
   73           <PATH1>/G2RC                   73.in         energy
   82           <PATH1>/G2RC                   82.in         energy
   88           <PATH1>/G2RC                   88.in         energy
    8           <PATH1>/G2RC                    8.in         energy
   94           <PATH1>/G2RC                   94.in         energy
   97           <PATH1>/G2RC                   97.in         energy


# Training set for the atomization energy
#               25 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 25  627.51
#"Number" "Flag"      "Scale"                             "Ref"      "Weight"
  3   118     -1   117     1     13    1                  -0.96       1.0000
  3    40     -1     1    -1    104    1                  -2.03       1.0000
  3   113     -1    30     1      8    1                  -2.55       1.0000
  3    52     -1     1    -1     18    2                  -3.88       1.0000
  4    30     -1    13    -1     40    1     1      1     -7.01       1.0000
  4   128     -1    13    -1    126    1    22      1     -9.96       1.0000
  3   100     -1    13    -1    106    1                 -20.13       1.0000
  3    25     -1    14    -1    121    1                 -25.37       1.0000
  3    39     -1    45    -1     51    2                 -26.42       1.0000
  4    58     -1    59    -1     57    1    60      1    -26.85       1.0000
  4    67     -1    61    -1     66    1    62      1    -26.33       1.0000
  3    32     -1     1    -1     33    1                 -29.23       1.0000
  3    25     -1    26    -1     88    1                 -32.73       1.0000
  4    47     -1     1    -3     18    1    13      1    -33.91       1.0000
  3    34     -1     1    -3     11    2                 -38.87       1.0000
  4     8     -1    45    -2     97    1    22      2    -47.08       1.0000
  3    25     -1     1    -1     26    1                 -48.42       1.0000
  4    56     -1     1    -3     21    1    13      2    -60.47       1.0000
  4    30     -1     1    -3     13    1     8      1    -64.78       1.0000
  4    73     -1     1    -1     39    1    13      1    -68.72       1.0000
  4    68     -1     1    -1     34    1    13      1    -80.74       1.0000
  3    26     -1     6    -1     82    1                -109.06       1.0000
  3     1     -1    39    -1     14    2                -134.29       1.0000
  2    25     -3    94     1                            -151.57       1.0000
  3    23     -1    39    -1     24    2                -212.70       1.0000
