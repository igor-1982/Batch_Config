# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./ISOL22           2            QChem

# The project description
__title__ ::
"============================== ISOL22 set ============================="
"             This is ISOL22 subset from GMTKN30 proposed by Grimme     "

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
#               44 is the total number of jobs in this batch list
__batch__ :: 44
#"Flag"         "DIR"                        "InpName"       "JobType"
   i10e          <PATH1>/ISOL22              i10e.in         energy
   i10p          <PATH1>/ISOL22              i10p.in         energy
   i11e          <PATH1>/ISOL22              i11e.in         energy
   i11p          <PATH1>/ISOL22              i11p.in         energy
   i12e          <PATH1>/ISOL22              i12e.in         energy
   i12p          <PATH1>/ISOL22              i12p.in         energy
   i13e          <PATH1>/ISOL22              i13e.in         energy
   i13p          <PATH1>/ISOL22              i13p.in         energy
   i14e          <PATH1>/ISOL22              i14e.in         energy
   i14p          <PATH1>/ISOL22              i14p.in         energy
   i15e          <PATH1>/ISOL22              i15e.in         energy
   i15p          <PATH1>/ISOL22              i15p.in         energy
   i16e          <PATH1>/ISOL22              i16e.in         energy
   i16p          <PATH1>/ISOL22              i16p.in         energy
   i17e          <PATH1>/ISOL22              i17e.in         energy
   i17p          <PATH1>/ISOL22              i17p.in         energy
   i18e          <PATH1>/ISOL22              i18e.in         energy
   i18p          <PATH1>/ISOL22              i18p.in         energy
   i19e          <PATH1>/ISOL22              i19e.in         energy
   i19p          <PATH1>/ISOL22              i19p.in         energy
   i20e          <PATH1>/ISOL22              i20e.in         energy
   i20p          <PATH1>/ISOL22              i20p.in         energy
   i21e          <PATH1>/ISOL22              i21e.in         energy
   i21p          <PATH1>/ISOL22              i21p.in         energy
   i22e          <PATH1>/ISOL22              i22e.in         energy
   i22p          <PATH1>/ISOL22              i22p.in         energy
   i23e          <PATH1>/ISOL22              i23e.in         energy
   i23p          <PATH1>/ISOL22              i23p.in         energy
   i24e          <PATH1>/ISOL22              i24e.in         energy
   i24p          <PATH1>/ISOL22              i24p.in         energy
    i2e          <PATH1>/ISOL22               i2e.in         energy
    i2p          <PATH1>/ISOL22               i2p.in         energy
    i3e          <PATH1>/ISOL22               i3e.in         energy
    i3p          <PATH1>/ISOL22               i3p.in         energy
    i5e          <PATH1>/ISOL22               i5e.in         energy
    i5p          <PATH1>/ISOL22               i5p.in         energy
    i6e          <PATH1>/ISOL22               i6e.in         energy
    i6p          <PATH1>/ISOL22               i6p.in         energy
    i7e          <PATH1>/ISOL22               i7e.in         energy
    i7p          <PATH1>/ISOL22               i7p.in         energy
    i8e          <PATH1>/ISOL22               i8e.in         energy
    i8p          <PATH1>/ISOL22               i8p.in         energy
    i9e          <PATH1>/ISOL22               i9e.in         energy
    i9p          <PATH1>/ISOL22               i9p.in         energy



# Training set for the atomization energy
#              22 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ ::  22 627.51
#"Number" "Flag"      "Scale"                                 "Ref"      "Weight"
  2     i2e    -1   i2p      1                                40.59      1.0000
  2     i3e    -1   i3p      1                                11.68      1.0000
  2     i5e    -1   i5p      1                                34.94      1.0000
  2     i6e    -1   i6p      1                                25.89      1.0000
  2     i7e    -1   i7p      1                                18.79      1.0000
  2     i8e    -1   i8p      1                                18.30      1.0000
  2     i9e    -1   i9p      1                                22.31      1.0000
  2    i10e    -1   i10p     1                                7.910      1.0000
  2    i11e    -1   i11p     1                                38.13      1.0000
  2    i12e    -1   i12p     1                                0.960      1.0000
  2    i13e    -1   i13p     1                                35.08      1.0000
  2    i14e    -1   i14p     1                                5.200      1.0000
  2    i15e    -1   i15p     1                                3.870      1.0000
  2    i16e    -1   i16p     1                                22.59      1.0000
  2    i17e    -1   i17p     1                                11.07      1.0000
  2    i18e    -1   i18p     1                                26.08      1.0000
  2    i19e    -1   i19p     1                                17.02      1.0000
  2    i20e    -1   i20p     1                                4.520      1.0000
  2    i21e    -1   i21p     1                                13.38      1.0000
  2    i22e    -1   i22p     1                                0.480      1.0000
  2    i23e    -1   i23p     1                                27.61      1.0000
  2    i24e    -1   i24p     1                                16.05      1.0000

