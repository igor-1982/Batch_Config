# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./BSR36            2            QChem

# The project description
__title__ ::
"============================== BSR36 set ============================="
"        This is BSR36 subset from GMTKN30 proposed by Grimme          "

# $rem group of Q-Chem Package
__qchem__ ::  1 rmp2  # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
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
#              38 is the total number of jobs in this batch list
__batch__ :: 38
#  "Flag"         "DIR"                               "InpName"       "JobType"
      c1          <PATH1>/BSR36                         c1.in         energy
      c2          <PATH1>/BSR36                         c2.in         energy
    c2h6          <PATH1>/BSR36                       c2h6.in         energy
      c3          <PATH1>/BSR36                         c3.in         energy
      c4          <PATH1>/BSR36                         c4.in         energy
      c5          <PATH1>/BSR36                         c5.in         energy
     ch4          <PATH1>/BSR36                        ch4.in         energy
     h10          <PATH1>/BSR36                        h10.in         energy
     h11          <PATH1>/BSR36                        h11.in         energy
     h12          <PATH1>/BSR36                        h12.in         energy
     h13          <PATH1>/BSR36                        h13.in         energy
     h14          <PATH1>/BSR36                        h14.in         energy
     h15          <PATH1>/BSR36                        h15.in         energy
      h1          <PATH1>/BSR36                         h1.in         energy
      h2          <PATH1>/BSR36                         h2.in         energy
      h3          <PATH1>/BSR36                         h3.in         energy
      h4          <PATH1>/BSR36                         h4.in         energy
      h5          <PATH1>/BSR36                         h5.in         energy
      h6          <PATH1>/BSR36                         h6.in         energy
      h7          <PATH1>/BSR36                         h7.in         energy
      h8          <PATH1>/BSR36                         h8.in         energy
      h9          <PATH1>/BSR36                         h9.in         energy
     r10          <PATH1>/BSR36                        r10.in         energy
     r11          <PATH1>/BSR36                        r11.in         energy
     r12          <PATH1>/BSR36                        r12.in         energy
     r13          <PATH1>/BSR36                        r13.in         energy
     r14          <PATH1>/BSR36                        r14.in         energy
     r15          <PATH1>/BSR36                        r15.in         energy
     r16          <PATH1>/BSR36                        r16.in         energy
      r1          <PATH1>/BSR36                         r1.in         energy
      r2          <PATH1>/BSR36                         r2.in         energy
      r3          <PATH1>/BSR36                         r3.in         energy
      r4          <PATH1>/BSR36                         r4.in         energy
      r5          <PATH1>/BSR36                         r5.in         energy
      r6          <PATH1>/BSR36                         r6.in         energy
      r7          <PATH1>/BSR36                         r7.in         energy
      r8          <PATH1>/BSR36                         r8.in         energy
      r9          <PATH1>/BSR36                         r9.in         energy

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
