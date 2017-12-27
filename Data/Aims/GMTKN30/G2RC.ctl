# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G2RC           2                Aims

# The project description
__title__ ::
"============================== G2RC set ============================="
"             This is G2RC subset from GMTKN30 proposed by Grimme     "

# several global statements of control.in for aims Package
__aims_basis__ :: /home/igor/Documents/Package-Pool/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  2  051512.mpi
xc                      pbe                  
total_energy_method     rpa
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.6
sc_accuracy_rho         1E-6
sc_accuracy_eev         1E-4
sc_accuracy_etot        1E-6
sc_iter_limit           200
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                47 is the total number of jobs in this batch list
__batch__ :: 47
#"Flag"         "DIR"                        "InpName"       "JobType"
  100           <PATH1>/G2RC                  100         energy
  104           <PATH1>/G2RC                  104         energy
  106           <PATH1>/G2RC                  106         energy
  113           <PATH1>/G2RC                  113         energy
  117           <PATH1>/G2RC                  117         energy
  118           <PATH1>/G2RC                  118         energy
   11           <PATH1>/G2RC                   11         energy
  121           <PATH1>/G2RC                  121         energy
  126           <PATH1>/G2RC                  126         energy
  128           <PATH1>/G2RC                  128         energy
   13           <PATH1>/G2RC                   13         energy
   14           <PATH1>/G2RC                   14         energy
   18           <PATH1>/G2RC                   18         energy
    1           <PATH1>/G2RC                    1         energy
   21           <PATH1>/G2RC                   21         energy
   22           <PATH1>/G2RC                   22         energy
   23           <PATH1>/G2RC                   23         energy
   24           <PATH1>/G2RC                   24         energy
   25           <PATH1>/G2RC                   25         energy
   26           <PATH1>/G2RC                   26         energy
   30           <PATH1>/G2RC                   30         energy
   32           <PATH1>/G2RC                   32         energy
   33           <PATH1>/G2RC                   33         energy
   34           <PATH1>/G2RC                   34         energy
   39           <PATH1>/G2RC                   39         energy
   40           <PATH1>/G2RC                   40         energy
   45           <PATH1>/G2RC                   45         energy
   47           <PATH1>/G2RC                   47         energy
   51           <PATH1>/G2RC                   51         energy
   52           <PATH1>/G2RC                   52         energy
   56           <PATH1>/G2RC                   56         energy
   57           <PATH1>/G2RC                   57         energy
   58           <PATH1>/G2RC                   58         energy
   59           <PATH1>/G2RC                   59         energy
   60           <PATH1>/G2RC                   60         energy
   61           <PATH1>/G2RC                   61         energy
   62           <PATH1>/G2RC                   62         energy
   66           <PATH1>/G2RC                   66         energy
   67           <PATH1>/G2RC                   67         energy
   68           <PATH1>/G2RC                   68         energy
    6           <PATH1>/G2RC                    6         energy
   73           <PATH1>/G2RC                   73         energy
   82           <PATH1>/G2RC                   82         energy
   88           <PATH1>/G2RC                   88         energy
    8           <PATH1>/G2RC                    8         energy
   94           <PATH1>/G2RC                   94         energy
   97           <PATH1>/G2RC                   97         energy


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
