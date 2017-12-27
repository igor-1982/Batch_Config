# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./B3LYP           2              Gaussian

# The project description
__title__ ::
"============================== Bond3 set ==========================="
"             This is the set for non-bond interaction               "

# Machine and option keyword of Gaussian Package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) NoSymm Scf=Tight


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                52 is the total number of jobs in this batch list
__batch__ :: 52
#"Flag"         "DIR"                        "InpName"       "JobType"
NB1             <PATH1>/NCIE                 1.com            energy
NB2             <PATH1>/NCIE                 2.com            energy
NB3             <PATH1>/NCIE                 3.com            energy
NB4             <PATH1>/NCIE                 4.com            energy
NB5             <PATH1>/NCIE                 5.com            energy
NB6             <PATH1>/NCIE                 6.com            energy
NB7             <PATH1>/NCIE                 7.com            energy
NB8             <PATH1>/NCIE                 8.com            energy
NB9             <PATH1>/NCIE                 9.com            energy
NB10            <PATH1>/NCIE                10.com            energy
NB11            <PATH1>/NCIE                11.com            energy
NB12            <PATH1>/NCIE                12.com            energy
NB13            <PATH1>/NCIE                13.com            energy
NB14            <PATH1>/NCIE                14.com            energy
NB15            <PATH1>/NCIE                15.com            energy
NB16            <PATH1>/NCIE                16.com            energy
NB17            <PATH1>/NCIE                17.com            energy
NB18            <PATH1>/NCIE                18.com            energy
NB19            <PATH1>/NCIE                19.com            energy
NB20            <PATH1>/NCIE                20.com            energy
NB21            <PATH1>/NCIE                21.com            energy
NB22            <PATH1>/NCIE                22.com            energy
NB23            <PATH1>/NCIE                23.com            energy
NB24            <PATH1>/NCIE                24.com            energy
NB25            <PATH1>/NCIE                25.com            energy
NB26            <PATH1>/NCIE                26.com            energy
NB27            <PATH1>/NCIE                27.com            energy
NB28            <PATH1>/NCIE                28.com            energy
NB29            <PATH1>/NCIE                29.com            energy
NB30            <PATH1>/NCIE                30.com            energy
NB31            <PATH1>/NCIE                31.com            energy
NB32            <PATH1>/NCIE                32.com            energy
NB33            <PATH1>/NCIE                33.com            energy
NB34            <PATH1>/NCIE                34.com            energy
NB35            <PATH1>/NCIE                35.com            energy
NB36            <PATH1>/NCIE                36.com            energy
NB37            <PATH1>/NCIE                37.com            energy
NB38            <PATH1>/NCIE                38.com            energy
NB39            <PATH1>/NCIE                39.com            energy
NB40            <PATH1>/NCIE                40.com            energy
NB41            <PATH1>/NCIE                41.com            energy
NB42            <PATH1>/NCIE                42.com            energy
NB43            <PATH1>/NCIE                43.com            energy
NB44            <PATH1>/NCIE                44.com            energy
NB45            <PATH1>/NCIE                45.com            energy
NB46            <PATH1>/NCIE                46.com            energy
NB47            <PATH1>/NCIE                47.com            energy
NB48            <PATH1>/NCIE                48.com            energy
NB49            <PATH1>/NCIE                49.com            energy
NB50            <PATH1>/NCIE                50.com            energy
NB51            <PATH1>/NCIE                51.com            energy
NB52            <PATH1>/NCIE                52.com            energy

# Training set for the atomization energy
#               52 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 52  627.51
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
# 31 Non bond interaction for NCIE set
# 6 Hydrogen bond complexes (HB)                : 
 2         NB21   -1   NB1    2                           3.15       30.0
 2         NB22   -1   NB2    2                           4.57       30.0
 2         NB23   -1   NB3    2                           4.97       30.0
 3         NB24   -1   NB3    1  NB1    1                 6.41       30.0
 2         NB25   -1   NB4    2                           14.94      30.0
 2         NB26   -1   NB5    2                           16.15      30.0
# 7 Charge transfer comlexes (CT)               : 
 3         NB27   -1   NB6    1  NB7    1                 1.06       30.0
 3         NB28   -1   NB1    1  NB7    1                 1.81       30.0
 3         NB29   -1   NB9    1  NB8    1                 3.81       30.0
 3         NB30   -1   NB10   1  NB8    1                 4.86       30.0
 3         NB31   -1   NB1    1  NB11   1                 4.88       30.0
 3         NB32   -1   NB3    1  NB8    1                 5.36       30.0
 3         NB33   -1   NB1    1  NB8    1                 10.62      30.0
# 6 Dipole interaction complexes (DI)           : 
 2         NB34   -1   NB12   2                           1.66       30.0
 2         NB35   -1   NB13   2                           2.01       30.0
 3         NB36   -1   NB12   1  NB13   1                 3.35       30.0
 3         NB37   -1   NB14   1  NB13   1                 3.55       30.0
 3         NB38   -1   NB15   1  NB10   1                 3.59       30.0
 3         NB39   -1   NB15   1  NB13   1                 4.16       30.0
# 7 Weak interaction complexes (WI)             : 
 3         NB40   -1   NB16   1  NB17   1                 0.47       30.0
 3         NB41   -1   NB16   1  NB18   1                 0.22       30.0
 2         NB46   -1   NB18   2                           0.51       30.0
 3         NB43   -1   NB19   1  NB16   1                 0.04       30.0
 3         NB42   -1   NB19   1  NB20   1                 0.06       30.0
 2         NB44   -1   NB16   2                           0.08       30.0
 3         NB45   -1   NB16   1  NB20   1                 0.13       30.0
# 5 Pi-Pi stacking complexes (PPS)              : 
 2         NB47   -1   NB9    2                           1.34       30.0
 2         NB48   -1   NB6    2                           1.42       30.0
 2         NB49   -1   NB52   2                           1.81       30.0
 2         NB50   -1   NB52   2                           2.74       30.0
 2         NB51   -1   NB52   2                           2.78       30.0
