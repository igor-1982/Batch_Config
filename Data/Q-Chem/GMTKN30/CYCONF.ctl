# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./CYCONF            2           QChem

# The project description
__title__ ::
"============================== CYCONF set ============================="
"        This is CYCONF subset from GMTKN30 proposed by Grimme          "

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
#              11 is the total number of jobs in this batch list
__batch__ :: 11
#  "Flag"         "DIR"                               "InpName"       "JobType"
    10            <PATH1>/CYCONF                       10.in          energy
    11            <PATH1>/CYCONF                       11.in          energy
     1            <PATH1>/CYCONF                        1.in          energy
     2            <PATH1>/CYCONF                        2.in          energy
     3            <PATH1>/CYCONF                        3.in          energy
     4            <PATH1>/CYCONF                        4.in          energy
     5            <PATH1>/CYCONF                        5.in          energy
     6            <PATH1>/CYCONF                        6.in          energy
     7            <PATH1>/CYCONF                        7.in          energy
     8            <PATH1>/CYCONF                        8.in          energy
     9            <PATH1>/CYCONF                        9.in          energy

# Training set for the atomization energy
#              10 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 10  627.51
#"Number" "Flag" "Scale"                                          "Ref"      "Weight"
  2        1      -1       2     1                                1.522      1.0000
  2        1      -1       3     1                                1.609      1.0000
  2        1      -1       4     1                                1.948      1.0000
  2        1      -1       5     1                                1.795      1.0000
  2        1      -1       6     1                                2.098      1.0000
  2        1      -1       7     1                                1.933      1.0000
  2        1      -1       8     1                                2.177      1.0000
  2        1      -1       9     1                                2.359      1.0000
  2        1      -1       10    1                                2.562      1.0000
  2        1      -1       11    1                                2.674      1.0000
