# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default one)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./Ion-G2-1       2              Gaussian

# The project description
__title__ ::
"============================ G2-1 set =============================="
"Ionization testing set from G2-1 set"
"Ion28.in need change beta obtial 8->9"
"Ion34.in need change beta obtial 6->7"
"Ion36.in need change beta obtial 14->15"


# To specify machine and option keywords of Gaussian package
__gaussian__ ::  # Following lines are machine and option keywords of Gau-Softs
%nproc=8
%mem=6000MB
#P B3LYP/6-311++G(3df,2p) NoSymm Scf=Tight

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , '.'
<PATH2> , '.'

# The molecular set to batch: 
#               42+41+33+33=149 is the total number of jobs in this batch list
__batch__ ::  149
#"Flag"         "DIR"                         "InpName"       "JobType"
# Neutral atoms  42
 neu0          <PATH1>/G2-1                    neu0.com      energy
 neu1          <PATH1>/G2-1                    neu1.com      energy
 neu2          <PATH1>/G2-1                    neu2.com      energy
 neu3          <PATH1>/G2-1                    neu3.com      energy
 neu4          <PATH1>/G2-1                    neu4.com      energy
 neu5          <PATH1>/G2-1                    neu5.com      energy
 neu6          <PATH1>/G2-1                    neu6.com      energy
 neu7          <PATH1>/G2-1                    neu7.com      energy
 neu8          <PATH1>/G2-1                    neu8.com      energy
 neu9          <PATH1>/G2-1                    neu9.com      energy
 neu10         <PATH1>/G2-1                    neu10.com     energy
 neu11         <PATH1>/G2-1                    neu11.com     energy
 neu12         <PATH1>/G2-1                    neu12.com     energy
 neu13         <PATH1>/G2-1                    neu13.com     energy
 neu14         <PATH1>/G2-1                    neu14.com     energy
 neu15         <PATH1>/G2-1                    neu15.com     energy
 neu16         <PATH1>/G2-1                    neu16.com     energy
 neu17         <PATH1>/G2-1                    neu17.com     energy
 neu18         <PATH1>/G2-1                    neu18.com     energy
 neu19         <PATH1>/G2-1                    neu19.com     energy
 neu20         <PATH1>/G2-1                    neu20.com     energy
 neu21         <PATH1>/G2-1                    neu21.com     energy
 neu22         <PATH1>/G2-1                    neu22.com     energy
 neu23         <PATH1>/G2-1                    neu23.com     energy
 neu24         <PATH1>/G2-1                    neu24.com     energy
 neu25         <PATH1>/G2-1                    neu25.com     energy
 neu26         <PATH1>/G2-1                    neu26.com     energy
 neu27         <PATH1>/G2-1                    neu27.com     energy
 neu28         <PATH1>/G2-1                    neu28.com     energy
 neu29         <PATH1>/G2-1                    neu29.com     energy
 neu30         <PATH1>/G2-1                    neu30.com     energy
 neu31         <PATH1>/G2-1                    neu31.com     energy
 neu32         <PATH1>/G2-1                    neu32.com     energy
 neu33         <PATH1>/G2-1                    neu33.com     energy
 neu34         <PATH1>/G2-1                    neu34.com     energy
 neu35         <PATH1>/G2-1                    neu35.com     energy
 neu36         <PATH1>/G2-1                    neu36.com     energy
 neu37         <PATH1>/G2-1                    neu37.com     energy
 neu38         <PATH1>/G2-1                    neu38.com     energy
 neu39         <PATH1>/G2-1                    neu39.com     energy
 neu40         <PATH1>/G2-1                    neu40.com     energy
 neu41         <PATH1>/G2-1                    neu41.com     energy
# ionic atoms : 41
 ion0          <PATH1>/G2-1                    ion0.com      energy
 ion1          <PATH1>/G2-1                    ion1.com      energy
 ion2          <PATH1>/G2-1                    ion2.com      energy
 ion3          <PATH1>/G2-1                    ion3.com      energy
 ion4          <PATH1>/G2-1                    ion4.com      energy
 ion5          <PATH1>/G2-1                    ion5.com      energy
 ion6          <PATH1>/G2-1                    ion6.com      energy
 ion7          <PATH1>/G2-1                    ion7.com      energy
 ion8          <PATH1>/G2-1                    ion8.com      energy
 ion9          <PATH1>/G2-1                    ion9.com      energy
 ion10         <PATH1>/G2-1                    ion10.com     energy
 ion11         <PATH1>/G2-1                    ion11.com     energy
 ion12         <PATH1>/G2-1                    ion12.com     energy
 ion13         <PATH1>/G2-1                    ion13.com     energy
 ion14         <PATH1>/G2-1                    ion14.com     energy
 ion15         <PATH1>/G2-1                    ion15.com     energy
 ion16         <PATH1>/G2-1                    ion16.com     energy
 ion17         <PATH1>/G2-1                    ion17.com     energy
 ion18         <PATH1>/G2-1                    ion18.com     energy
 ion19         <PATH1>/G2-1                    ion19.com     energy
 ion20         <PATH1>/G2-1                    ion20.com     energy
 ion21         <PATH1>/G2-1                    ion21.com     energy
 ion22         <PATH1>/G2-1                    ion22.com     energy
 ion23         <PATH1>/G2-1                    ion23.com     energy
 ion24         <PATH1>/G2-1                    ion24.com     energy
 ion25         <PATH1>/G2-1                    ion25.com     energy
 ion26         <PATH1>/G2-1                    ion26.com     energy
 ion27         <PATH1>/G2-1                    ion27.com     energy
 ion28         <PATH1>/G2-1                    ion28.com     energy
 ion29         <PATH1>/G2-1                    ion29.com     energy
 ion30         <PATH1>/G2-1                    ion30.com     energy
 ion31         <PATH1>/G2-1                    ion31.com     energy
 ion32         <PATH1>/G2-1                    ion32.com     energy
 ion33         <PATH1>/G2-1                    ion33.com     energy
 ion34         <PATH1>/G2-1                    ion34.com     energy
 ion35         <PATH1>/G2-1                    ion35.com     energy
 ion36         <PATH1>/G2-1                    ion36.com     energy
 ion37         <PATH1>/G2-1                    ion37.com     energy
 ion38         <PATH1>/G2-1                    ion38.com     energy
 ion39         <PATH1>/G2-1                    ion39.com     energy
 ion40         <PATH1>/G2-1                    ion40.com     energy
# neutral atoms : 33
 neu42         <PATH1>/G2-1                    neu42.com     energy
 neu43         <PATH1>/G2-1                    neu43.com     energy
 neu44         <PATH1>/G2-1                    neu44.com     energy
 neu45         <PATH1>/G2-1                    neu45.com     energy
 neu46         <PATH1>/G2-1                    neu46.com     energy
 neu47         <PATH1>/G2-1                    neu47.com     energy
 neu48         <PATH1>/G2-1                    neu48.com     energy
 neu49         <PATH1>/G2-1                    neu49.com     energy
 neu50         <PATH1>/G2-1                    neu50.com     energy
 neu51         <PATH1>/G2-1                    neu51.com     energy
 neu52         <PATH1>/G2-1                    neu52.com     energy
 neu53         <PATH1>/G2-1                    neu53.com     energy
 neu54         <PATH1>/G2-1                    neu54.com     energy
 neu55         <PATH1>/G2-1                    neu55.com     energy
 neu56         <PATH1>/G2-1                    neu56.com     energy
 neu57         <PATH1>/G2-1                    neu57.com     energy
 neu58         <PATH1>/G2-1                    neu58.com     energy
 neu59         <PATH1>/G2-1                    neu59.com     energy
 neu60         <PATH1>/G2-1                    neu60.com     energy
 neu61         <PATH1>/G2-1                    neu61.com     energy
 neu62         <PATH1>/G2-1                    neu62.com     energy
 neu63         <PATH1>/G2-1                    neu63.com     energy
 neu64         <PATH1>/G2-1                    neu64.com     energy
 neu65         <PATH1>/G2-1                    neu65.com     energy
 neu66         <PATH1>/G2-1                    neu66.com     energy
 neu67         <PATH1>/G2-1                    neu67.com     energy
 neu68         <PATH1>/G2-1                    neu68.com     energy
 neu69         <PATH1>/G2-1                    neu69.com     energy
 neu70         <PATH1>/G2-1                    neu70.com     energy
 neu71         <PATH1>/G2-1                    neu71.com     energy
 neu72         <PATH1>/G2-1                    neu72.com     energy
 neu73         <PATH1>/G2-1                    neu73.com     energy
 neu74         <PATH1>/G2-1                    neu74.com     energy
# ionic atoms : 33
 ion41         <PATH1>/G2-1                    ion41.com     energy
 ion42         <PATH1>/G2-1                    ion42.com     energy
 ion43         <PATH1>/G2-1                    ion43.com     energy
 ion44         <PATH1>/G2-1                    ion44.com     energy
 ion45         <PATH1>/G2-1                    ion45.com     energy
 ion46         <PATH1>/G2-1                    ion46.com     energy
 ion47         <PATH1>/G2-1                    ion47.com     energy
 ion48         <PATH1>/G2-1                    ion48.com     energy
 ion49         <PATH1>/G2-1                    ion49.com     energy
 ion50         <PATH1>/G2-1                    ion50.com     energy
 ion51         <PATH1>/G2-1                    ion51.com     energy
 ion52         <PATH1>/G2-1                    ion52.com     energy
 ion53         <PATH1>/G2-1                    ion53.com     energy
 ion54         <PATH1>/G2-1                    ion54.com     energy
 ion55         <PATH1>/G2-1                    ion55.com     energy
 ion56         <PATH1>/G2-1                    ion56.com     energy
 ion57         <PATH1>/G2-1                    ion57.com     energy
 ion58         <PATH1>/G2-1                    ion58.com     energy
 ion59         <PATH1>/G2-1                    ion59.com     energy
 ion60         <PATH1>/G2-1                    ion60.com     energy
 ion61         <PATH1>/G2-1                    ion61.com     energy
 ion62         <PATH1>/G2-1                    ion62.com     energy
 ion63         <PATH1>/G2-1                    ion63.com     energy
 ion64         <PATH1>/G2-1                    ion64.com     energy
 ion65         <PATH1>/G2-1                    ion65.com     energy
 ion66         <PATH1>/G2-1                    ion66.com     energy
 ion67         <PATH1>/G2-1                    ion67.com     energy
 ion68         <PATH1>/G2-1                    ion68.com     energy
 ion69         <PATH1>/G2-1                    ion69.com     energy
 ion70         <PATH1>/G2-1                    ion70.com     energy
 ion71         <PATH1>/G2-1                    ion71.com     energy
 ion72         <PATH1>/G2-1                    ion72.com     energy
 ion73         <PATH1>/G2-1                    ion73.com     energy

# Training set for the total energy
#               149 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 149  1.0
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

