# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BSR36            2             Aims

# The project description
__title__ ::
"============================== BSR36 set ============================="
"        This is BSR36 subset from GMTKN30 proposed by Grimme          "

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
sc_accuracy_rho  1E-6
sc_accuracy_eev  1E-4
sc_accuracy_etot 1E-6
sc_iter_limit    200
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#              38 is the total number of jobs in this batch list
__batch__ :: 38
#  "Flag"         "DIR"                               "InpName"       "JobType"
      c1          <PATH1>/BSR36                         c1         energy
      c2          <PATH1>/BSR36                         c2         energy
    c2h6          <PATH1>/BSR36                       c2h6         energy
      c3          <PATH1>/BSR36                         c3         energy
      c4          <PATH1>/BSR36                         c4         energy
      c5          <PATH1>/BSR36                         c5         energy
     ch4          <PATH1>/BSR36                        ch4         energy
     h10          <PATH1>/BSR36                        h10         energy
     h11          <PATH1>/BSR36                        h11         energy
     h12          <PATH1>/BSR36                        h12         energy
     h13          <PATH1>/BSR36                        h13         energy
     h14          <PATH1>/BSR36                        h14         energy
     h15          <PATH1>/BSR36                        h15         energy
      h1          <PATH1>/BSR36                         h1         energy
      h2          <PATH1>/BSR36                         h2         energy
      h3          <PATH1>/BSR36                         h3         energy
      h4          <PATH1>/BSR36                         h4         energy
      h5          <PATH1>/BSR36                         h5         energy
      h6          <PATH1>/BSR36                         h6         energy
      h7          <PATH1>/BSR36                         h7         energy
      h8          <PATH1>/BSR36                         h8         energy
      h9          <PATH1>/BSR36                         h9         energy
     r10          <PATH1>/BSR36                        r10         energy
     r11          <PATH1>/BSR36                        r11         energy
     r12          <PATH1>/BSR36                        r12         energy
     r13          <PATH1>/BSR36                        r13         energy
     r14          <PATH1>/BSR36                        r14         energy
     r15          <PATH1>/BSR36                        r15         energy
     r16          <PATH1>/BSR36                        r16         energy
      r1          <PATH1>/BSR36                         r1         energy
      r2          <PATH1>/BSR36                         r2         energy
      r3          <PATH1>/BSR36                         r3         energy
      r4          <PATH1>/BSR36                         r4         energy
      r5          <PATH1>/BSR36                         r5         energy
      r6          <PATH1>/BSR36                         r6         energy
      r7          <PATH1>/BSR36                         r7         energy
      r8          <PATH1>/BSR36                         r8         energy
      r9          <PATH1>/BSR36                         r9         energy

# Training set for the atomization energy
#              36 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 36  627.51
#"Number" "Flag" "Scale"                                      "Ref"      "Weight"
  3    c2h6    5     h1     -1     ch4      -4                 9.81     1.0000
  3    c2h6    5     h2     -1     ch4      -4                 9.66     1.0000
  3    c2h6    5     h3     -1     ch4      -4                11.37     1.0000
  3    c2h6    5     h4     -1     ch4      -4                 9.04     1.0000
  3    c2h6    5     h5     -1     ch4      -4                 8.71     1.0000
  3    c2h6    6     h6     -1     ch4      -5                10.91     1.0000
  3    c2h6    6     h7     -1     ch4      -5                13.05     1.0000
  3    c2h6    6     h8     -1     ch4      -5                11.89     1.0000
  3    c2h6    6     h9     -1     ch4      -5                13.53     1.0000
  3    c2h6    6    h10     -1     ch4      -5                11.43     1.0000
  3    c2h6    6    h11     -1     ch4      -5                12.97     1.0000
  3    c2h6    6    h12     -1     ch4      -5                12.77     1.0000
  3    c2h6    6    h13     -1     ch4      -5                11.23     1.0000
  3    c2h6    6    h14     -1     ch4      -5                10.16     1.0000
  3    c2h6    7    h15     -1     ch4      -6                15.05     1.0000
  3    c2h6    5     r1     -1     ch4      -5                 2.38     1.0000
  3    c2h6    6     r2     -1     ch4      -6                10.67     1.0000
  3    c2h6    6     r3     -1     ch4      -6                 6.35     1.0000
  3    c2h6    7     r4     -1     ch4      -7                14.88     1.0000
  3    c2h6    7     r5     -1     ch4      -7                10.65     1.0000
  3    c2h6    7     r6     -1     ch4      -7                10.11     1.0000
  3    c2h6    7     r7     -1     ch4      -7                 9.13     1.0000
  3    c2h6    7     r8     -1     ch4      -7                10.48     1.0000
  3    c2h6    7     r9     -1     ch4      -7                 9.82     1.0000
  3    c2h6   11    r10     -1     ch4     -12                19.30     1.0000
  3    c2h6   11    r11     -1     ch4     -12                 9.67     1.0000
  3    c2h6   11    r12     -1     ch4     -12                15.19     1.0000
  3    c2h6   11    r13     -1     ch4     -12                26.05     1.0000
  3    c2h6   11    r14     -1     ch4     -12                23.45     1.0000
  3    c2h6   13    r15     -1     ch4     -14                27.96     1.0000
  3    c2h6   12    r16     -1     ch4     -12                25.41     1.0000
  3    c2h6   12     c1     -1     ch4     -14                27.56     1.0000
  3    c2h6   14     c2     -1     ch4     -16                39.56     1.0000
  3    c2h6   14     c3     -1     ch4     -16                32.42     1.0000
  3    c2h6   16     c4     -1     ch4     -18                51.44     1.0000
  3    c2h6   18     c5     -1     ch4     -22                47.06     1.0000
