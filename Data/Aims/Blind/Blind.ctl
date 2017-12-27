# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./Blind           2                Aims

# The project description
__title__ ::
"============================== Blind 2012 test set ============================="
"             Blind 2012 test set (JCP, 145, 124105 (2016))                      "

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
#                21+27+24+21+18+21+18+21+21+48 is the total number of jobs in this batch list
__batch__ :: 240
#"Flag"         "DIR"                        "InpName"       "JobType"
# Bz-Methane 21
 BM-1           <PATH1>/Bz-Methane            BM-1             energy
 BM-1-A         <PATH1>/Bz-Methane            BM-1-A           energy
 BM-1-B         <PATH1>/Bz-Methane            BM-1-B           energy
 BM-2           <PATH1>/Bz-Methane            BM-2             energy
 BM-2-A         <PATH1>/Bz-Methane            BM-2-A           energy
 BM-2-B         <PATH1>/Bz-Methane            BM-2-B           energy
 BM-3           <PATH1>/Bz-Methane            BM-3             energy
 BM-3-A         <PATH1>/Bz-Methane            BM-3-A           energy
 BM-3-B         <PATH1>/Bz-Methane            BM-3-B           energy
 BM-4           <PATH1>/Bz-Methane            BM-4             energy
 BM-4-A         <PATH1>/Bz-Methane            BM-4-A           energy
 BM-4-B         <PATH1>/Bz-Methane            BM-4-B           energy
 BM-5           <PATH1>/Bz-Methane            BM-5             energy
 BM-5-A         <PATH1>/Bz-Methane            BM-5-A           energy
 BM-5-B         <PATH1>/Bz-Methane            BM-5-B           energy
 BM-6           <PATH1>/Bz-Methane            BM-6             energy
 BM-6-A         <PATH1>/Bz-Methane            BM-6-A           energy
 BM-6-B         <PATH1>/Bz-Methane            BM-6-B           energy
 BM-7           <PATH1>/Bz-Methane            BM-7             energy
 BM-7-A         <PATH1>/Bz-Methane            BM-7-A           energy
 BM-7-B         <PATH1>/Bz-Methane            BM-7-B           energy
# Bz-Water 27
 BW-1           <PATH1>/Bz-Water               BW-1            energy
 BW-1-A         <PATH1>/Bz-Water               BW-1-A          energy
 BW-1-B         <PATH1>/Bz-Water               BW-1-B          energy
 BW-2           <PATH1>/Bz-Water               BW-2            energy
 BW-2-A         <PATH1>/Bz-Water               BW-2-A          energy
 BW-2-B         <PATH1>/Bz-Water               BW-2-B          energy
 BW-3           <PATH1>/Bz-Water               BW-3            energy
 BW-3-A         <PATH1>/Bz-Water               BW-3-A          energy
 BW-3-B         <PATH1>/Bz-Water               BW-3-B          energy
 BW-4           <PATH1>/Bz-Water               BW-4            energy
 BW-4-A         <PATH1>/Bz-Water               BW-4-A          energy
 BW-4-B         <PATH1>/Bz-Water               BW-4-B          energy
 BW-5           <PATH1>/Bz-Water               BW-5            energy
 BW-5-A         <PATH1>/Bz-Water               BW-5-A          energy
 BW-5-B         <PATH1>/Bz-Water               BW-5-B          energy
 BW-6           <PATH1>/Bz-Water               BW-6            energy
 BW-6-A         <PATH1>/Bz-Water               BW-6-A          energy
 BW-6-B         <PATH1>/Bz-Water               BW-6-B          energy
 BW-7           <PATH1>/Bz-Water               BW-7            energy
 BW-7-A         <PATH1>/Bz-Water               BW-7-A          energy
 BW-7-B         <PATH1>/Bz-Water               BW-7-B          energy
 BW-8           <PATH1>/Bz-Water               BW-8            energy
 BW-8-A         <PATH1>/Bz-Water               BW-8-A          energy
 BW-8-B         <PATH1>/Bz-Water               BW-8-B          energy
 BW-9           <PATH1>/Bz-Water               BW-9            energy
 BW-9-A         <PATH1>/Bz-Water               BW-9-A          energy
 BW-9-B         <PATH1>/Bz-Water               BW-9-B          energy
# EDNA-Dimer 24
 ED2-1          <PATH1>/EDNA-Dimer             ED2-1           energy
 ED2-1-A        <PATH1>/EDNA-Dimer             ED2-1-A         energy
 ED2-1-B        <PATH1>/EDNA-Dimer             ED2-1-B         energy
 ED2-2          <PATH1>/EDNA-Dimer             ED2-2           energy
 ED2-2-A        <PATH1>/EDNA-Dimer             ED2-2-A         energy
 ED2-2-B        <PATH1>/EDNA-Dimer             ED2-2-B         energy
 ED2-3          <PATH1>/EDNA-Dimer             ED2-3           energy
 ED2-3-A        <PATH1>/EDNA-Dimer             ED2-3-A         energy
 ED2-3-B        <PATH1>/EDNA-Dimer             ED2-3-B         energy
 ED2-4          <PATH1>/EDNA-Dimer             ED2-4           energy
 ED2-4-A        <PATH1>/EDNA-Dimer             ED2-4-A         energy
 ED2-4-B        <PATH1>/EDNA-Dimer             ED2-4-B         energy
 ED2-5          <PATH1>/EDNA-Dimer             ED2-5           energy
 ED2-5-A        <PATH1>/EDNA-Dimer             ED2-5-A         energy
 ED2-5-B        <PATH1>/EDNA-Dimer             ED2-5-B         energy
 ED2-6          <PATH1>/EDNA-Dimer             ED2-6           energy
 ED2-6-A        <PATH1>/EDNA-Dimer             ED2-6-A         energy
 ED2-6-B        <PATH1>/EDNA-Dimer             ED2-6-B         energy
 ED2-7          <PATH1>/EDNA-Dimer             ED2-7           energy
 ED2-7-A        <PATH1>/EDNA-Dimer             ED2-7-A         energy
 ED2-7-B        <PATH1>/EDNA-Dimer             ED2-7-B         energy
 ED2-8          <PATH1>/EDNA-Dimer             ED2-8           energy
 ED2-8-A        <PATH1>/EDNA-Dimer             ED2-8-A         energy
 ED2-8-B        <PATH1>/EDNA-Dimer             ED2-8-B         energy
# Ethanol-Dimer 21
 ED-1           <PATH1>/Ethanol-Dimer          ED-1            energy
 ED-1-A         <PATH1>/Ethanol-Dimer          ED-1-A          energy
 ED-1-B         <PATH1>/Ethanol-Dimer          ED-1-B          energy
 ED-2           <PATH1>/Ethanol-Dimer          ED-2            energy
 ED-2-A         <PATH1>/Ethanol-Dimer          ED-2-A          energy
 ED-2-B         <PATH1>/Ethanol-Dimer          ED-2-B          energy
 ED-3           <PATH1>/Ethanol-Dimer          ED-3            energy
 ED-3-A         <PATH1>/Ethanol-Dimer          ED-3-A          energy
 ED-3-B         <PATH1>/Ethanol-Dimer          ED-3-B          energy
 ED-4           <PATH1>/Ethanol-Dimer          ED-4            energy
 ED-4-A         <PATH1>/Ethanol-Dimer          ED-4-A          energy
 ED-4-B         <PATH1>/Ethanol-Dimer          ED-4-B          energy
 ED-5           <PATH1>/Ethanol-Dimer          ED-5            energy
 ED-5-A         <PATH1>/Ethanol-Dimer          ED-5-A          energy
 ED-5-B         <PATH1>/Ethanol-Dimer          ED-5-B          energy
 ED-6           <PATH1>/Ethanol-Dimer          ED-6            energy
 ED-6-A         <PATH1>/Ethanol-Dimer          ED-6-A          energy
 ED-6-B         <PATH1>/Ethanol-Dimer          ED-6-B          energy
 ED-7           <PATH1>/Ethanol-Dimer          ED-7            energy
 ED-7-A         <PATH1>/Ethanol-Dimer          ED-7-A          energy
 ED-7-B         <PATH1>/Ethanol-Dimer          ED-7-B          energy
# FOX-7-Dimer 18
 FD-1          <PATH1>/FOX-7-Dimer             FD-1            energy
 FD-1-A        <PATH1>/FOX-7-Dimer             FD-1-A          energy
 FD-1-B        <PATH1>/FOX-7-Dimer             FD-1-B          energy
 FD-2          <PATH1>/FOX-7-Dimer             FD-2            energy
 FD-2-A        <PATH1>/FOX-7-Dimer             FD-2-A          energy
 FD-2-B        <PATH1>/FOX-7-Dimer             FD-2-B          energy
 FD-3          <PATH1>/FOX-7-Dimer             FD-3            energy
 FD-3-A        <PATH1>/FOX-7-Dimer             FD-3-A          energy
 FD-3-B        <PATH1>/FOX-7-Dimer             FD-3-B          energy
 FD-4          <PATH1>/FOX-7-Dimer             FD-4            energy
 FD-4-A        <PATH1>/FOX-7-Dimer             FD-4-A          energy
 FD-4-B        <PATH1>/FOX-7-Dimer             FD-4-B          energy
 FD-5          <PATH1>/FOX-7-Dimer             FD-5            energy
 FD-5-A        <PATH1>/FOX-7-Dimer             FD-5-A          energy
 FD-5-B        <PATH1>/FOX-7-Dimer             FD-5-B          energy
 FD-6          <PATH1>/FOX-7-Dimer             FD-6            energy
 FD-6-A        <PATH1>/FOX-7-Dimer             FD-6-A          energy
 FD-6-B        <PATH1>/FOX-7-Dimer             FD-6-B          energy
# Imidazole-Dimer 21
 ID-1           <PATH1>/Imidazole-Dimer        ID-1            energy
 ID-1-A         <PATH1>/Imidazole-Dimer        ID-1-A          energy
 ID-1-B         <PATH1>/Imidazole-Dimer        ID-1-B          energy
 ID-2           <PATH1>/Imidazole-Dimer        ID-2            energy
 ID-2-A         <PATH1>/Imidazole-Dimer        ID-2-A          energy
 ID-2-B         <PATH1>/Imidazole-Dimer        ID-2-B          energy
 ID-3           <PATH1>/Imidazole-Dimer        ID-3            energy
 ID-3-A         <PATH1>/Imidazole-Dimer        ID-3-A          energy
 ID-3-B         <PATH1>/Imidazole-Dimer        ID-3-B          energy
 ID-4           <PATH1>/Imidazole-Dimer        ID-4            energy
 ID-4-A         <PATH1>/Imidazole-Dimer        ID-4-A          energy
 ID-4-B         <PATH1>/Imidazole-Dimer        ID-4-B          energy
 ID-5           <PATH1>/Imidazole-Dimer        ID-5            energy
 ID-5-A         <PATH1>/Imidazole-Dimer        ID-5-A          energy
 ID-5-B         <PATH1>/Imidazole-Dimer        ID-5-B          energy
 ID-6           <PATH1>/Imidazole-Dimer        ID-6            energy
 ID-6-A         <PATH1>/Imidazole-Dimer        ID-6-A          energy
 ID-6-B         <PATH1>/Imidazole-Dimer        ID-6-B          energy
 ID-7           <PATH1>/Imidazole-Dimer        ID-7            energy
 ID-7-A         <PATH1>/Imidazole-Dimer        ID-7-A          energy
 ID-7-B         <PATH1>/Imidazole-Dimer        ID-7-B          energy
# Methyl-Formate-Dimer 18
 MFD-1          <PATH1>/Methyl-Formate-Dimer   MFD-1           energy
 MFD-1-A        <PATH1>/Methyl-Formate-Dimer   MFD-1-A         energy
 MFD-1-B        <PATH1>/Methyl-Formate-Dimer   MFD-1-B         energy
 MFD-2          <PATH1>/Methyl-Formate-Dimer   MFD-2           energy
 MFD-2-A        <PATH1>/Methyl-Formate-Dimer   MFD-2-A         energy
 MFD-2-B        <PATH1>/Methyl-Formate-Dimer   MFD-2-B         energy
 MFD-3          <PATH1>/Methyl-Formate-Dimer   MFD-3           energy
 MFD-3-A        <PATH1>/Methyl-Formate-Dimer   MFD-3-A         energy
 MFD-3-B        <PATH1>/Methyl-Formate-Dimer   MFD-3-B         energy
 MFD-4          <PATH1>/Methyl-Formate-Dimer   MFD-4           energy
 MFD-4-A        <PATH1>/Methyl-Formate-Dimer   MFD-4-A         energy
 MFD-4-B        <PATH1>/Methyl-Formate-Dimer   MFD-4-B         energy
 MFD-5          <PATH1>/Methyl-Formate-Dimer   MFD-5           energy
 MFD-5-A        <PATH1>/Methyl-Formate-Dimer   MFD-5-A         energy
 MFD-5-B        <PATH1>/Methyl-Formate-Dimer   MFD-5-B         energy
 MFD-6          <PATH1>/Methyl-Formate-Dimer   MFD-6           energy
 MFD-6-A        <PATH1>/Methyl-Formate-Dimer   MFD-6-A         energy
 MFD-6-B        <PATH1>/Methyl-Formate-Dimer   MFD-6-B         energy
# Nitrobenzene-Dimer 21
 NBD-1           <PATH1>/Nitrobenzene-Dimer    NBD-1           energy
 NBD-1-A         <PATH1>/Nitrobenzene-Dimer    NBD-1-A         energy
 NBD-1-B         <PATH1>/Nitrobenzene-Dimer    NBD-1-B         energy
 NBD-2           <PATH1>/Nitrobenzene-Dimer    NBD-2           energy
 NBD-2-A         <PATH1>/Nitrobenzene-Dimer    NBD-2-A         energy
 NBD-2-B         <PATH1>/Nitrobenzene-Dimer    NBD-2-B         energy
 NBD-3           <PATH1>/Nitrobenzene-Dimer    NBD-3           energy
 NBD-3-A         <PATH1>/Nitrobenzene-Dimer    NBD-3-A         energy
 NBD-3-B         <PATH1>/Nitrobenzene-Dimer    NBD-3-B         energy
 NBD-4           <PATH1>/Nitrobenzene-Dimer    NBD-4           energy
 NBD-4-A         <PATH1>/Nitrobenzene-Dimer    NBD-4-A         energy
 NBD-4-B         <PATH1>/Nitrobenzene-Dimer    NBD-4-B         energy
 NBD-5           <PATH1>/Nitrobenzene-Dimer    NBD-5           energy
 NBD-5-A         <PATH1>/Nitrobenzene-Dimer    NBD-5-A         energy
 NBD-5-B         <PATH1>/Nitrobenzene-Dimer    NBD-5-B         energy
 NBD-6           <PATH1>/Nitrobenzene-Dimer    NBD-6           energy
 NBD-6-A         <PATH1>/Nitrobenzene-Dimer    NBD-6-A         energy
 NBD-6-B         <PATH1>/Nitrobenzene-Dimer    NBD-6-B         energy
 NBD-7           <PATH1>/Nitrobenzene-Dimer    NBD-7           energy
 NBD-7-A         <PATH1>/Nitrobenzene-Dimer    NBD-7-A         energy
 NBD-7-B         <PATH1>/Nitrobenzene-Dimer    NBD-7-B         energy
# Nitromethane-Dimer 21
 NMD-1           <PATH1>/Nitromethane-Dimer    NMD-1           energy
 NMD-1-A         <PATH1>/Nitromethane-Dimer    NMD-1-A         energy
 NMD-1-B         <PATH1>/Nitromethane-Dimer    NMD-1-B         energy
 NMD-2           <PATH1>/Nitromethane-Dimer    NMD-2           energy
 NMD-2-A         <PATH1>/Nitromethane-Dimer    NMD-2-A         energy
 NMD-2-B         <PATH1>/Nitromethane-Dimer    NMD-2-B         energy
 NMD-3           <PATH1>/Nitromethane-Dimer    NMD-3           energy
 NMD-3-A         <PATH1>/Nitromethane-Dimer    NMD-3-A         energy
 NMD-3-B         <PATH1>/Nitromethane-Dimer    NMD-3-B         energy
 NMD-4           <PATH1>/Nitromethane-Dimer    NMD-4           energy
 NMD-4-A         <PATH1>/Nitromethane-Dimer    NMD-4-A         energy
 NMD-4-B         <PATH1>/Nitromethane-Dimer    NMD-4-B         energy
 NMD-5           <PATH1>/Nitromethane-Dimer    NMD-5           energy
 NMD-5-A         <PATH1>/Nitromethane-Dimer    NMD-5-A         energy
 NMD-5-B         <PATH1>/Nitromethane-Dimer    NMD-5-B         energy
 NMD-6           <PATH1>/Nitromethane-Dimer    NMD-6           energy
 NMD-6-A         <PATH1>/Nitromethane-Dimer    NMD-6-A         energy
 NMD-6-B         <PATH1>/Nitromethane-Dimer    NMD-6-B         energy
 NMD-7           <PATH1>/Nitromethane-Dimer    NMD-7           energy
 NMD-7-A         <PATH1>/Nitromethane-Dimer    NMD-7-A         energy
 NMD-7-B         <PATH1>/Nitromethane-Dimer    NMD-7-B         energy
# Water-Dimer 48
 WD-1           <PATH1>/Water-Dimer            WD-1            energy
 WD-1-A         <PATH1>/Water-Dimer            WD-1-A          energy
 WD-1-B         <PATH1>/Water-Dimer            WD-1-B          energy
 WD-2           <PATH1>/Water-Dimer            WD-2            energy
 WD-2-A         <PATH1>/Water-Dimer            WD-2-A          energy
 WD-2-B         <PATH1>/Water-Dimer            WD-2-B          energy
 WD-3           <PATH1>/Water-Dimer            WD-3            energy
 WD-3-A         <PATH1>/Water-Dimer            WD-3-A          energy
 WD-3-B         <PATH1>/Water-Dimer            WD-3-B          energy
 WD-4           <PATH1>/Water-Dimer            WD-4            energy
 WD-4-A         <PATH1>/Water-Dimer            WD-4-A          energy
 WD-4-B         <PATH1>/Water-Dimer            WD-4-B          energy
 WD-5           <PATH1>/Water-Dimer            WD-5            energy
 WD-5-A         <PATH1>/Water-Dimer            WD-5-A          energy
 WD-5-B         <PATH1>/Water-Dimer            WD-5-B          energy
 WD-6           <PATH1>/Water-Dimer            WD-6            energy
 WD-6-A         <PATH1>/Water-Dimer            WD-6-A          energy
 WD-6-B         <PATH1>/Water-Dimer            WD-6-B          energy
 WD-7           <PATH1>/Water-Dimer            WD-7            energy
 WD-7-A         <PATH1>/Water-Dimer            WD-7-A          energy
 WD-7-B         <PATH1>/Water-Dimer            WD-7-B          energy
 WD-8           <PATH1>/Water-Dimer            WD-8            energy
 WD-8-A         <PATH1>/Water-Dimer            WD-8-A          energy
 WD-8-B         <PATH1>/Water-Dimer            WD-8-B          energy
 WD-9           <PATH1>/Water-Dimer            WD-9            energy
 WD-9-A         <PATH1>/Water-Dimer            WD-9-A          energy
 WD-9-B         <PATH1>/Water-Dimer            WD-9-B          energy
 WD-10          <PATH1>/Water-Dimer            WD-10           energy
 WD-10-A        <PATH1>/Water-Dimer            WD-10-A         energy
 WD-10-B        <PATH1>/Water-Dimer            WD-10-B         energy
 WD-11          <PATH1>/Water-Dimer            WD-11           energy
 WD-11-A        <PATH1>/Water-Dimer            WD-11-A         energy
 WD-11-B        <PATH1>/Water-Dimer            WD-11-B         energy
 WD-12          <PATH1>/Water-Dimer            WD-12           energy
 WD-12-A        <PATH1>/Water-Dimer            WD-12-A         energy
 WD-12-B        <PATH1>/Water-Dimer            WD-12-B         energy
 WD-13          <PATH1>/Water-Dimer            WD-13           energy
 WD-13-A        <PATH1>/Water-Dimer            WD-13-A         energy
 WD-13-B        <PATH1>/Water-Dimer            WD-13-B         energy
 WD-14          <PATH1>/Water-Dimer            WD-14           energy
 WD-14-A        <PATH1>/Water-Dimer            WD-14-A         energy
 WD-14-B        <PATH1>/Water-Dimer            WD-14-B         energy
 WD-15          <PATH1>/Water-Dimer            WD-15           energy
 WD-15-A        <PATH1>/Water-Dimer            WD-15-A         energy
 WD-15-B        <PATH1>/Water-Dimer            WD-15-B         energy
 WD-16          <PATH1>/Water-Dimer            WD-16           energy
 WD-16-A        <PATH1>/Water-Dimer            WD-16-A         energy
 WD-16-B        <PATH1>/Water-Dimer            WD-16-B         energy

# Training set for the atomization energy
#               7+9+8+7+6+7+6+7+7+16 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcalmol", 
__energy__ :: 80  627.51
#"Number" "Flag" "Scale"                            "Ref"      "Weight"
# Bz-Methane 7
  3       BM-1       -1     BM-1-A  1   BM-1-B  1   -0.04704    1.0
  3       BM-2       -1     BM-2-A  1   BM-2-B  1   -1.47601    1.0
  3       BM-3       -1     BM-3-A  1   BM-3-B  1   -0.64348    1.0
  3       BM-4       -1     BM-4-A  1   BM-4-B  1   -0.21726    1.0
  3       BM-5       -1     BM-5-A  1   BM-5-B  1   -0.08338    1.0
  3       BM-6       -1     BM-6-A  1   BM-6-B  1   -0.03655    1.0
  3       BM-7       -1     BM-7-A  1   BM-7-B  1   -0.01752    1.0
# Bz-Water 9
  3       BW-1       -1     BW-1-A  1   BW-1-B  1   +4.86811    1.0
  3       BW-2       -1     BW-2-A  1   BW-2-B  1   -2.88113    1.0
  3       BW-3       -1     BW-3-A  1   BW-3-B  1   -2.86929    1.0
  3       BW-4       -1     BW-4-A  1   BW-4-B  1   -1.94242    1.0
  3       BW-5       -1     BW-5-A  1   BW-5-B  1   -1.25135    1.0
  3       BW-6       -1     BW-6-A  1   BW-6-B  1   -0.82563    1.0
  3       BW-7       -1     BW-7-A  1   BW-7-B  1   -0.40343    1.0
  3       BW-8       -1     BW-8-A  1   BW-8-B  1   -0.22304    1.0
  3       BW-9       -1     BW-9-A  1   BW-9-B  1   -0.13404    1.0
# EDNA-Dimer 8
  3       ED2-1      -1     ED2-1-A  1  ED2-1-B  1  -8.80931    1.0
  3       ED2-2      -1     ED2-2-A  1  ED2-2-B  1 -12.35977    1.0
  3       ED2-3      -1     ED2-3-A  1  ED2-3-B  1  -8.59484    1.0
  3       ED2-4      -1     ED2-4-A  1  ED2-4-B  1  -4.35775    1.0
  3       ED2-5      -1     ED2-5-A  1  ED2-5-B  1  -2.29963    1.0
  3       ED2-6      -1     ED2-6-A  1  ED2-6-B  1  -1.27390    1.0
  3       ED2-7      -1     ED2-7-A  1  ED2-7-B  1  -0.72798    1.0
  3       ED2-8      -1     ED2-8-A  1  ED2-8-B  1  -0.42838    1.0
# Ethanol-Dimer 7
  3       ED-1       -1     ED-1-A  1   ED-1-B  1   -1.57411    1.0
  3       ED-2       -1     ED-2-A  1   ED-2-B  1   -2.86907    1.0
  3       ED-3       -1     ED-3-A  1   ED-3-B  1   -1.36881    1.0
  3       ED-4       -1     ED-4-A  1   ED-4-B  1   -0.49754    1.0
  3       ED-5       -1     ED-5-A  1   ED-5-B  1   -0.21671    1.0
  3       ED-6       -1     ED-6-A  1   ED-6-B  1   -0.11226    1.0
  3       ED-7       -1     ED-7-A  1   ED-7-B  1   -0.06592    1.0
# FOX-7-Dimer 6
  3       FD-1       -1     FD-1-A  1   FD-1-B  1  -11.39114    1.0
  3       FD-2       -1     FD-2-A  1   FD-2-B  1  -12.69972    1.0
  3       FD-3       -1     FD-3-A  1   FD-3-B  1   -7.65232    1.0
  3       FD-4       -1     FD-4-A  1   FD-4-B  1   -4.24262    1.0
  3       FD-5       -1     FD-5-A  1   FD-5-B  1   -2.69626    1.0
  3       FD-6       -1     FD-6-A  1   FD-6-B  1   -1.86649    1.0
# Imidazole-Dimer 7
  3       ID-1       -1     ID-1-A  1   ID-1-B  1   -6.21725    1.0
  3       ID-2       -1     ID-2-A  1   ID-2-B  1  -10.20708    1.0
  3       ID-3       -1     ID-3-A  1   ID-3-B  1   -5.41093    1.0
  3       ID-4       -1     ID-4-A  1   ID-4-B  1   -2.46822    1.0
  3       ID-5       -1     ID-5-A  1   ID-5-B  1   -1.33584    1.0
  3       ID-6       -1     ID-6-A  1   ID-6-B  1   -0.81918    1.0
  3       ID-7       -1     ID-7-A  1   ID-7-B  1   -0.54476    1.0
# Methyl-Formate-Dimer 6
  3       MFD-1      -1     MFD-1-A  1   MFD-1-B  1  -3.04027   1.0
  3       MFD-2      -1     MFD-2-A  1   MFD-2-B  1  -3.48505   1.0
  3       MFD-3      -1     MFD-3-A  1   MFD-3-B  1  -1.58992   1.0
  3       MFD-4      -1     MFD-4-A  1   MFD-4-B  1  -0.57694   1.0
  3       MFD-5      -1     MFD-5-A  1   MFD-5-B  1  -0.23684   1.0
  3       MFD-6      -1     MFD-6-A  1   MFD-6-B  1  -0.10716   1.0
# Nitrobenzene-Dimer 7
  3       NBD-1      -1     NBD-1-A  1   NBD-1-B  1  -0.36007   1.0
  3       NBD-2      -1     NBD-2-A  1   NBD-2-B  1  -7.10994   1.0
  3       NBD-3      -1     NBD-3-A  1   NBD-3-B  1  -4.57996   1.0
  3       NBD-4      -1     NBD-4-A  1   NBD-4-B  1  -1.86316   1.0
  3       NBD-5      -1     NBD-5-A  1   NBD-5-B  1  -0.92554   1.0
  3       NBD-6      -1     NBD-6-A  1   NBD-6-B  1  -0.55352   1.0
  3       NBD-7      -1     NBD-7-A  1   NBD-7-B  1  -0.37294   1.0
# Nitromethane-Dimer 7
  3       NMD-1      -1     NMD-1-A  1   NMD-1-B  1  -3.46659   1.0
  3       NMD-2      -1     NMD-2-A  1   NMD-2-B  1  -6.39284   1.0
  3       NMD-3      -1     NMD-3-A  1   NMD-3-B  1  -3.50772   1.0
  3       NMD-4      -1     NMD-4-A  1   NMD-4-B  1  -1.59213   1.0
  3       NMD-5      -1     NMD-5-A  1   NMD-5-B  1  -0.85387   1.0
  3       NMD-6      -1     NMD-6-A  1   NMD-6-B  1  -0.51697   1.0
  3       NMD-7      -1     NMD-7-A  1   NMD-7-B  1  -0.33885   1.0
# Water-Dimer 16
  3       WD-1       -1     WD-1-A  1   WD-1-B   1   +8.16216   1.0
  3       WD-2       -1     WD-2-A  1   WD-2-B   1   -3.16838   1.0
  3       WD-3       -1     WD-3-A  1   WD-3-B   1   -5.04849   1.0
  3       WD-4       -1     WD-4-A  1   WD-4-B   1   -4.42398   1.0
  3       WD-5       -1     WD-5-A  1   WD-5-B   1   -3.39899   1.0
  3       WD-6       -1     WD-6-A  1   WD-6-B   1   -2.06677   1.0
  3       WD-7       -1     WD-7-A  1   WD-7-B   1   -1.29223   1.0
  3       WD-8       -1     WD-8-A  1   WD-8-B   1   -0.85374   1.0
  3       WD-9       -1     WD-9-A  1   WD-9-B   1   -0.59401   1.0
  3       WD-10      -1     WD-10-A 1   WD-10-B  1   -0.43113   1.0
  3       WD-11      -1     WD-11-A 1   WD-11-B  1   -0.32364   1.0
  3       WD-12      -1     WD-12-A 1   WD-12-B  1   -0.24962   1.0
  3       WD-13      -1     WD-13-A 1   WD-13-B  1   -0.19730   1.0
  3       WD-14      -1     WD-14-A 1   WD-14-B  1   -0.15849   1.0
  3       WD-15      -1     WD-15-A 1   WD-15-B  1   -0.12935   1.0
  3       WD-16      -1     WD-16-A 1   WD-16-B  1   -0.10700   1.0
