# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default one)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./Ion-G2-1       2              QChem

# The project description
__title__ ::
"============================ G2-1 set =============================="
"Ionization testing set from G2-1 set"


# Specify several groups input of Q-Chem Package
# 0 for serial version of Q-Chem
# 1 for parallel version of Q-Chem
__qchem__ ::   0 
$rem
exchange = b3lyp
basis = 6-311+g(3df,2p)
scf_convergence = 8
xc_grid = 000075000194
$end

__macro_path__ ::
<PATH1> , '.'
<PATH2> , '.'

# The molecular set to batch: 
#               42+41+33+33=149 is the total number of jobs in this batch list
__batch__ ::  149
#"Flag"         "DIR"                         "InpName"       "JobType"
# Neutral atoms  42
 neu0          <PATH1>/G2-1                    neu0.in      energy
 neu1          <PATH1>/G2-1                    neu1.in      energy
 neu2          <PATH1>/G2-1                    neu2.in      energy
 neu3          <PATH1>/G2-1                    neu3.in      energy
 neu4          <PATH1>/G2-1                    neu4.in      energy
 neu5          <PATH1>/G2-1                    neu5.in      energy
 neu6          <PATH1>/G2-1                    neu6.in      energy
 neu7          <PATH1>/G2-1                    neu7.in      energy
 neu8          <PATH1>/G2-1                    neu8.in      energy
 neu9          <PATH1>/G2-1                    neu9.in      energy
 neu10         <PATH1>/G2-1                    neu10.in     energy
 neu11         <PATH1>/G2-1                    neu11.in     energy
 neu12         <PATH1>/G2-1                    neu12.in     energy
 neu13         <PATH1>/G2-1                    neu13.in     energy
 neu14         <PATH1>/G2-1                    neu14.in     energy
 neu15         <PATH1>/G2-1                    neu15.in     energy
 neu16         <PATH1>/G2-1                    neu16.in     energy
 neu17         <PATH1>/G2-1                    neu17.in     energy
 neu18         <PATH1>/G2-1                    neu18.in     energy
 neu19         <PATH1>/G2-1                    neu19.in     energy
 neu20         <PATH1>/G2-1                    neu20.in     energy
 neu21         <PATH1>/G2-1                    neu21.in     energy
 neu22         <PATH1>/G2-1                    neu22.in     energy
 neu23         <PATH1>/G2-1                    neu23.in     energy
 neu24         <PATH1>/G2-1                    neu24.in     energy
 neu25         <PATH1>/G2-1                    neu25.in     energy
 neu26         <PATH1>/G2-1                    neu26.in     energy
 neu27         <PATH1>/G2-1                    neu27.in     energy
 neu28         <PATH1>/G2-1                    neu28.in     energy
 neu29         <PATH1>/G2-1                    neu29.in     energy
 neu30         <PATH1>/G2-1                    neu30.in     energy
 neu31         <PATH1>/G2-1                    neu31.in     energy
 neu32         <PATH1>/G2-1                    neu32.in     energy
 neu33         <PATH1>/G2-1                    neu33.in     energy
 neu34         <PATH1>/G2-1                    neu34.in     energy
 neu35         <PATH1>/G2-1                    neu35.in     energy
 neu36         <PATH1>/G2-1                    neu36.in     energy
 neu37         <PATH1>/G2-1                    neu37.in     energy
 neu38         <PATH1>/G2-1                    neu38.in     energy
 neu39         <PATH1>/G2-1                    neu39.in     energy
 neu40         <PATH1>/G2-1                    neu40.in     energy
 neu41         <PATH1>/G2-1                    neu41.in     energy
# ionic atoms : 41
 ion0          <PATH1>/G2-1                    ion0.in      energy
 ion1          <PATH1>/G2-1                    ion1.in      energy
 ion2          <PATH1>/G2-1                    ion2.in      energy
 ion3          <PATH1>/G2-1                    ion3.in      energy
 ion4          <PATH1>/G2-1                    ion4.in      energy
 ion5          <PATH1>/G2-1                    ion5.in      energy
 ion6          <PATH1>/G2-1                    ion6.in      energy
 ion7          <PATH1>/G2-1                    ion7.in      energy
 ion8          <PATH1>/G2-1                    ion8.in      energy
 ion9          <PATH1>/G2-1                    ion9.in      energy
 ion10         <PATH1>/G2-1                    ion10.in     energy
 ion11         <PATH1>/G2-1                    ion11.in     energy
 ion12         <PATH1>/G2-1                    ion12.in     energy
 ion13         <PATH1>/G2-1                    ion13.in     energy
 ion14         <PATH1>/G2-1                    ion14.in     energy
 ion15         <PATH1>/G2-1                    ion15.in     energy
 ion16         <PATH1>/G2-1                    ion16.in     energy
 ion17         <PATH1>/G2-1                    ion17.in     energy
 ion18         <PATH1>/G2-1                    ion18.in     energy
 ion19         <PATH1>/G2-1                    ion19.in     energy
 ion20         <PATH1>/G2-1                    ion20.in     energy
 ion21         <PATH1>/G2-1                    ion21.in     energy
 ion22         <PATH1>/G2-1                    ion22.in     energy
 ion23         <PATH1>/G2-1                    ion23.in     energy
 ion24         <PATH1>/G2-1                    ion24.in     energy
 ion25         <PATH1>/G2-1                    ion25.in     energy
 ion26         <PATH1>/G2-1                    ion26.in     energy
 ion27         <PATH1>/G2-1                    ion27.in     energy
 ion28         <PATH1>/G2-1                    ion28.in     energy
 ion29         <PATH1>/G2-1                    ion29.in     energy
 ion30         <PATH1>/G2-1                    ion30.in     energy
 ion31         <PATH1>/G2-1                    ion31.in     energy
 ion32         <PATH1>/G2-1                    ion32.in     energy
 ion33         <PATH1>/G2-1                    ion33.in     energy
 ion34         <PATH1>/G2-1                    ion34.in     energy
 ion35         <PATH1>/G2-1                    ion35.in     energy
 ion36         <PATH1>/G2-1                    ion36.in     energy
 ion37         <PATH1>/G2-1                    ion37.in     energy
 ion38         <PATH1>/G2-1                    ion38.in     energy
 ion39         <PATH1>/G2-1                    ion39.in     energy
 ion40         <PATH1>/G2-1                    ion40.in     energy
# neutral atoms : 33
 neu42         <PATH1>/G2-1                    neu42.in     energy
 neu43         <PATH1>/G2-1                    neu43.in     energy
 neu44         <PATH1>/G2-1                    neu44.in     energy
 neu45         <PATH1>/G2-1                    neu45.in     energy
 neu46         <PATH1>/G2-1                    neu46.in     energy
 neu47         <PATH1>/G2-1                    neu47.in     energy
 neu48         <PATH1>/G2-1                    neu48.in     energy
 neu49         <PATH1>/G2-1                    neu49.in     energy
 neu50         <PATH1>/G2-1                    neu50.in     energy
 neu51         <PATH1>/G2-1                    neu51.in     energy
 neu52         <PATH1>/G2-1                    neu52.in     energy
 neu53         <PATH1>/G2-1                    neu53.in     energy
 neu54         <PATH1>/G2-1                    neu54.in     energy
 neu55         <PATH1>/G2-1                    neu55.in     energy
 neu56         <PATH1>/G2-1                    neu56.in     energy
 neu57         <PATH1>/G2-1                    neu57.in     energy
 neu58         <PATH1>/G2-1                    neu58.in     energy
 neu59         <PATH1>/G2-1                    neu59.in     energy
 neu60         <PATH1>/G2-1                    neu60.in     energy
 neu61         <PATH1>/G2-1                    neu61.in     energy
 neu62         <PATH1>/G2-1                    neu62.in     energy
 neu63         <PATH1>/G2-1                    neu63.in     energy
 neu64         <PATH1>/G2-1                    neu64.in     energy
 neu65         <PATH1>/G2-1                    neu65.in     energy
 neu66         <PATH1>/G2-1                    neu66.in     energy
 neu67         <PATH1>/G2-1                    neu67.in     energy
 neu68         <PATH1>/G2-1                    neu68.in     energy
 neu69         <PATH1>/G2-1                    neu69.in     energy
 neu70         <PATH1>/G2-1                    neu70.in     energy
 neu71         <PATH1>/G2-1                    neu71.in     energy
 neu72         <PATH1>/G2-1                    neu72.in     energy
 neu73         <PATH1>/G2-1                    neu73.in     energy
 neu74         <PATH1>/G2-1                    neu74.in     energy
# ionic atoms : 33
 ion41         <PATH1>/G2-1                    ion41.in     energy
 ion42         <PATH1>/G2-1                    ion42.in     energy
 ion43         <PATH1>/G2-1                    ion43.in     energy
 ion44         <PATH1>/G2-1                    ion44.in     energy
 ion45         <PATH1>/G2-1                    ion45.in     energy
 ion46         <PATH1>/G2-1                    ion46.in     energy
 ion47         <PATH1>/G2-1                    ion47.in     energy
 ion48         <PATH1>/G2-1                    ion48.in     energy
 ion49         <PATH1>/G2-1                    ion49.in     energy
 ion50         <PATH1>/G2-1                    ion50.in     energy
 ion51         <PATH1>/G2-1                    ion51.in     energy
 ion52         <PATH1>/G2-1                    ion52.in     energy
 ion53         <PATH1>/G2-1                    ion53.in     energy
 ion54         <PATH1>/G2-1                    ion54.in     energy
 ion55         <PATH1>/G2-1                    ion55.in     energy
 ion56         <PATH1>/G2-1                    ion56.in     energy
 ion57         <PATH1>/G2-1                    ion57.in     energy
 ion58         <PATH1>/G2-1                    ion58.in     energy
 ion59         <PATH1>/G2-1                    ion59.in     energy
 ion60         <PATH1>/G2-1                    ion60.in     energy
 ion61         <PATH1>/G2-1                    ion61.in     energy
 ion62         <PATH1>/G2-1                    ion62.in     energy
 ion63         <PATH1>/G2-1                    ion63.in     energy
 ion64         <PATH1>/G2-1                    ion64.in     energy
 ion65         <PATH1>/G2-1                    ion65.in     energy
 ion66         <PATH1>/G2-1                    ion66.in     energy
 ion67         <PATH1>/G2-1                    ion67.in     energy
 ion68         <PATH1>/G2-1                    ion68.in     energy
 ion69         <PATH1>/G2-1                    ion69.in     energy
 ion70         <PATH1>/G2-1                    ion70.in     energy
 ion71         <PATH1>/G2-1                    ion71.in     energy
 ion72         <PATH1>/G2-1                    ion72.in     energy
 ion73         <PATH1>/G2-1                    ion73.in     energy

# Training set for the total energy
#               149 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 149  627.51
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
 1         neu0   1                                     0.0        1.0
 1         neu1   1                                     0.0        1.0
 1         neu2   1                                     0.0        1.0
 1         neu3   1                                     0.0        1.0
 1         neu4   1                                     0.0        1.0
 1         neu5   1                                     0.0        1.0
 1         neu6   1                                     0.0        1.0
 1         neu7   1                                     0.0        1.0
 1         neu8   1                                     0.0        1.0
 1         neu9   1                                     0.0        1.0
 1         neu10  1                                     0.0        1.0
 1         neu11  1                                     0.0        1.0
 1         neu12  1                                     0.0        1.0
 1         neu13  1                                     0.0        1.0
 1         neu14  1                                     0.0        1.0
 1         neu15  1                                     0.0        1.0
 1         neu16  1                                     0.0        1.0
 1         neu17  1                                     0.0        1.0
 1         neu18  1                                     0.0        1.0
 1         neu19  1                                     0.0        1.0
 1         neu20  1                                     0.0        1.0
 1         neu21  1                                     0.0        1.0
 1         neu22  1                                     0.0        1.0
 1         neu23  1                                     0.0        1.0
 1         neu24  1                                     0.0        1.0
 1         neu25  1                                     0.0        1.0
 1         neu26  1                                     0.0        1.0
 1         neu27  1                                     0.0        1.0
 1         neu28  1                                     0.0        1.0
 1         neu29  1                                     0.0        1.0
 1         neu30  1                                     0.0        1.0
 1         neu31  1                                     0.0        1.0
 1         neu32  1                                     0.0        1.0
 1         neu33  1                                     0.0        1.0
 1         neu34  1                                     0.0        1.0
 1         neu35  1                                     0.0        1.0
 1         neu36  1                                     0.0        1.0
 1         neu37  1                                     0.0        1.0
 1         neu38  1                                     0.0        1.0
 1         neu39  1                                     0.0        1.0
 1         neu40  1                                     0.0        1.0
 1         neu41  1                                     0.0        1.0
 1         ion0   1                                     0.0        1.0
 1         ion1   1                                     0.0        1.0
 1         ion2   1                                     0.0        1.0
 1         ion3   1                                     0.0        1.0
 1         ion4   1                                     0.0        1.0
 1         ion5   1                                     0.0        1.0
 1         ion6   1                                     0.0        1.0
 1         ion7   1                                     0.0        1.0
 1         ion8   1                                     0.0        1.0
 1         ion9   1                                     0.0        1.0
 1         ion10  1                                     0.0        1.0
 1         ion11  1                                     0.0        1.0
 1         ion12  1                                     0.0        1.0
 1         ion13  1                                     0.0        1.0
 1         ion14  1                                     0.0        1.0
 1         ion15  1                                     0.0        1.0
 1         ion16  1                                     0.0        1.0
 1         ion17  1                                     0.0        1.0
 1         ion18  1                                     0.0        1.0
 1         ion19  1                                     0.0        1.0
 1         ion20  1                                     0.0        1.0
 1         ion21  1                                     0.0        1.0
 1         ion22  1                                     0.0        1.0
 1         ion23  1                                     0.0        1.0
 1         ion24  1                                     0.0        1.0
 1         ion25  1                                     0.0        1.0
 1         ion26  1                                     0.0        1.0
 1         ion27  1                                     0.0        1.0
 1         ion28  1                                     0.0        1.0
 1         ion29  1                                     0.0        1.0
 1         ion30  1                                     0.0        1.0
 1         ion31  1                                     0.0        1.0
 1         ion32  1                                     0.0        1.0
 1         ion33  1                                     0.0        1.0
 1         ion34  1                                     0.0        1.0
 1         ion35  1                                     0.0        1.0
 1         ion36  1                                     0.0        1.0
 1         ion37  1                                     0.0        1.0
 1         ion38  1                                     0.0        1.0
 1         ion39  1                                     0.0        1.0
 1         ion40  1                                     0.0        1.0
 1         neu42  1                                     0.0        1.0
 1         neu43  1                                     0.0        1.0
 1         neu44  1                                     0.0        1.0
 1         neu45  1                                     0.0        1.0
 1         neu46  1                                     0.0        1.0
 1         neu47  1                                     0.0        1.0
 1         neu48  1                                     0.0        1.0
 1         neu49  1                                     0.0        1.0
 1         neu50  1                                     0.0        1.0
 1         neu51  1                                     0.0        1.0
 1         neu52  1                                     0.0        1.0
 1         neu53  1                                     0.0        1.0
 1         neu54  1                                     0.0        1.0
 1         neu55  1                                     0.0        1.0
 1         neu56  1                                     0.0        1.0
 1         neu57  1                                     0.0        1.0
 1         neu58  1                                     0.0        1.0
 1         neu59  1                                     0.0        1.0
 1         neu60  1                                     0.0        1.0
 1         neu61  1                                     0.0        1.0
 1         neu62  1                                     0.0        1.0
 1         neu63  1                                     0.0        1.0
 1         neu64  1                                     0.0        1.0
 1         neu65  1                                     0.0        1.0
 1         neu66  1                                     0.0        1.0
 1         neu67  1                                     0.0        1.0
 1         neu68  1                                     0.0        1.0
 1         neu69  1                                     0.0        1.0
 1         neu70  1                                     0.0        1.0
 1         neu71  1                                     0.0        1.0
 1         neu72  1                                     0.0        1.0
 1         neu73  1                                     0.0        1.0
 1         neu74  1                                     0.0        1.0
 1         ion41  1                                     0.0        1.0
 1         ion42  1                                     0.0        1.0
 1         ion43  1                                     0.0        1.0
 1         ion44  1                                     0.0        1.0
 1         ion45  1                                     0.0        1.0
 1         ion46  1                                     0.0        1.0
 1         ion47  1                                     0.0        1.0
 1         ion48  1                                     0.0        1.0
 1         ion49  1                                     0.0        1.0
 1         ion50  1                                     0.0        1.0
 1         ion51  1                                     0.0        1.0
 1         ion52  1                                     0.0        1.0
 1         ion53  1                                     0.0        1.0
 1         ion54  1                                     0.0        1.0
 1         ion55  1                                     0.0        1.0
 1         ion56  1                                     0.0        1.0
 1         ion57  1                                     0.0        1.0
 1         ion58  1                                     0.0        1.0
 1         ion59  1                                     0.0        1.0
 1         ion60  1                                     0.0        1.0
 1         ion61  1                                     0.0        1.0
 1         ion62  1                                     0.0        1.0
 1         ion63  1                                     0.0        1.0
 1         ion64  1                                     0.0        1.0
 1         ion65  1                                     0.0        1.0
 1         ion66  1                                     0.0        1.0
 1         ion67  1                                     0.0        1.0
 1         ion68  1                                     0.0        1.0
 1         ion69  1                                     0.0        1.0
 1         ion70  1                                     0.0        1.0
 1         ion71  1                                     0.0        1.0
 1         ion72  1                                     0.0        1.0
 1         ion73  1                                     0.0        1.0

