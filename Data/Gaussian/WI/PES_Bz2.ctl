# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./B3LYP           2		  Gaussian

# The project description
__title__ ::
"======================== PPS for Bz2 ==============================="
"There are 118 points in the potential energy surface of three types"
"                Benzen-Benzen Pi-Pi stackings                      "

# Gaussian input machine and options
__gaussian__ ::
#p b3lyp/6-311+G(3df,p2) scf=tight



# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , '.'
<PATH2> , '.'

# The molecular set to batch: 
#               119 is the total number of jobs in this batch list
__batch__ ::  119
#"Flag"         "DIR"                         "InpName"       "JobType"
 C6H6           <PATH1>/bz2s_scan             ben.com         energy
# 118 points in Bz2 PESs
# Sandwich
 s32            <PATH1>/bz2s_scan            s1.com           energy
 s33            <PATH1>/bz2s_scan            s2.com           energy
 s34            <PATH1>/bz2s_scan            s3.com           energy
 s35            <PATH1>/bz2s_scan            s4.com           energy
 s36            <PATH1>/bz2s_scan            s5.com           energy
 s37            <PATH1>/bz2s_scan            s6.com           energy
 s38            <PATH1>/bz2s_scan            s7.com           energy
 s39            <PATH1>/bz2s_scan            s8.com           energy
 s40            <PATH1>/bz2s_scan            s9.com           energy
 s41            <PATH1>/bz2s_scan           s10.com           energy
 s42            <PATH1>/bz2s_scan           s11.com           energy
 s45            <PATH1>/bz2s_scan           s12.com           energy
 s50            <PATH1>/bz2s_scan           s13.com           energy
 s55            <PATH1>/bz2s_scan           s14.com           energy
 s60            <PATH1>/bz2s_scan           s15.com           energy
 s65            <PATH1>/bz2s_scan           s16.com           energy
# T-Shape
 t44            <PATH1>/bz2t_scan            t1.com           energy
 t45            <PATH1>/bz2t_scan            t2.com           energy
 t46            <PATH1>/bz2t_scan            t3.com           energy
 t47            <PATH1>/bz2t_scan            t4.com           energy
 t48            <PATH1>/bz2t_scan            t5.com           energy
 t49            <PATH1>/bz2t_scan            t6.com           energy
 t50            <PATH1>/bz2t_scan            t7.com           energy
 t51            <PATH1>/bz2t_scan            t8.com           energy
 t52            <PATH1>/bz2t_scan            t9.com           energy
 t53            <PATH1>/bz2t_scan           t10.com           energy
 t54            <PATH1>/bz2t_scan           t11.com           energy
 t55            <PATH1>/bz2t_scan           t12.com           energy
 t56            <PATH1>/bz2t_scan           t13.com           energy
 t59            <PATH1>/bz2t_scan           t14.com           energy
 t64            <PATH1>/bz2t_scan           t15.com           energy
 t69            <PATH1>/bz2t_scan           t16.com           energy
 t74            <PATH1>/bz2t_scan           t17.com           energy
 t79            <PATH1>/bz2t_scan           t18.com           energy
# Parallel-Shape-D32
 pd32L20        <PATH1>/bz2pd_32_scan       pA1.com           energy
 pd32L18        <PATH1>/bz2pd_32_scan       pA2.com           energy
 pd32L16        <PATH1>/bz2pd_32_scan       pA3.com           energy
 pd32L14        <PATH1>/bz2pd_32_scan       pA4.com           energy
 pd32L12        <PATH1>/bz2pd_32_scan       pA5.com           energy
 pd32L10        <PATH1>/bz2pd_32_scan       pA6.com           energy
 pd32L08        <PATH1>/bz2pd_32_scan       pA7.com           energy
 pd32L06        <PATH1>/bz2pd_32_scan       pA8.com           energy
 pd32L04        <PATH1>/bz2pd_32_scan       pA9.com           energy
 pd32L02        <PATH1>/bz2pd_32_scan      pA10.com           energy
 pd32L00        <PATH1>/bz2s_scan            s1.com           energy
 pd32R02        <PATH1>/bz2pd_32_scan      pA10.com           energy
 pd32R04        <PATH1>/bz2pd_32_scan       pA9.com           energy
 pd32R06        <PATH1>/bz2pd_32_scan       pA8.com           energy
 pd32R08        <PATH1>/bz2pd_32_scan       pA7.com           energy
 pd32R10        <PATH1>/bz2pd_32_scan       pA6.com           energy
 pd32R12        <PATH1>/bz2pd_32_scan       pA5.com           energy
 pd32R14        <PATH1>/bz2pd_32_scan       pA4.com           energy
 pd32R16        <PATH1>/bz2pd_32_scan       pA3.com           energy
 pd32R18        <PATH1>/bz2pd_32_scan       pA2.com           energy
 pd32R20        <PATH1>/bz2pd_32_scan       pA1.com           energy
# Parallel-Shape-D34
 pd34L20        <PATH1>/bz2pd_34_scan       pB1.com           energy
 pd34L18        <PATH1>/bz2pd_34_scan       pB2.com           energy
 pd34L16        <PATH1>/bz2pd_34_scan       pB3.com           energy
 pd34L14        <PATH1>/bz2pd_34_scan       pB4.com           energy
 pd34L12        <PATH1>/bz2pd_34_scan       pB5.com           energy
 pd34L10        <PATH1>/bz2pd_34_scan       pB6.com           energy
 pd34L08        <PATH1>/bz2pd_34_scan       pB7.com           energy
 pd34L06        <PATH1>/bz2pd_34_scan       pB8.com           energy
 pd34L04        <PATH1>/bz2pd_34_scan       pB9.com           energy
 pd34L02        <PATH1>/bz2pd_34_scan      pB10.com           energy
 pd34L00        <PATH1>/bz2s_scan            s3.com           energy
 pd34R02        <PATH1>/bz2pd_34_scan      pB10.com           energy
 pd34R04        <PATH1>/bz2pd_34_scan       pB9.com           energy
 pd34R06        <PATH1>/bz2pd_34_scan       pB8.com           energy
 pd34R08        <PATH1>/bz2pd_34_scan       pB7.com           energy
 pd34R10        <PATH1>/bz2pd_34_scan       pB6.com           energy
 pd34R12        <PATH1>/bz2pd_34_scan       pB5.com           energy
 pd34R14        <PATH1>/bz2pd_34_scan       pB4.com           energy
 pd34R16        <PATH1>/bz2pd_34_scan       pB3.com           energy
 pd34R18        <PATH1>/bz2pd_34_scan       pB2.com           energy
 pd34R20        <PATH1>/bz2pd_34_scan       pB1.com           energy
# Parallel-Shape-D36
 pd36L20        <PATH1>/bz2pd_36_scan       pC1.com           energy
 pd36L18        <PATH1>/bz2pd_36_scan       pC2.com           energy
 pd36L16        <PATH1>/bz2pd_36_scan       pC3.com           energy
 pd36L14        <PATH1>/bz2pd_36_scan       pC4.com           energy
 pd36L12        <PATH1>/bz2pd_36_scan       pC5.com           energy
 pd36L10        <PATH1>/bz2pd_36_scan       pC6.com           energy
 pd36L08        <PATH1>/bz2pd_36_scan       pC7.com           energy
 pd36L06        <PATH1>/bz2pd_36_scan       pC8.com           energy
 pd36L04        <PATH1>/bz2pd_36_scan       pC9.com           energy
 pd36L02        <PATH1>/bz2pd_36_scan      pC10.com           energy
 pd36L00        <PATH1>/bz2s_scan            s5.com           energy
 pd36R02        <PATH1>/bz2pd_36_scan      pC10.com           energy
 pd36R04        <PATH1>/bz2pd_36_scan       pC9.com           energy
 pd36R06        <PATH1>/bz2pd_36_scan       pC8.com           energy
 pd36R08        <PATH1>/bz2pd_36_scan       pC7.com           energy
 pd36R10        <PATH1>/bz2pd_36_scan       pC6.com           energy
 pd36R12        <PATH1>/bz2pd_36_scan       pC5.com           energy
 pd36R14        <PATH1>/bz2pd_36_scan       pC4.com           energy
 pd36R16        <PATH1>/bz2pd_36_scan       pC3.com           energy
 pd36R18        <PATH1>/bz2pd_36_scan       pC2.com           energy
 pd36R20        <PATH1>/bz2pd_36_scan       pC1.com           energy
# Parallel-Shape-D38
 pd38L20        <PATH1>/bz2pd_38_scan       pD1.com           energy
 pd38L18        <PATH1>/bz2pd_38_scan       pD2.com           energy
 pd38L16        <PATH1>/bz2pd_38_scan       pD3.com           energy
 pd38L14        <PATH1>/bz2pd_38_scan       pD4.com           energy
 pd38L12        <PATH1>/bz2pd_38_scan       pD5.com           energy
 pd38L10        <PATH1>/bz2pd_38_scan       pD6.com           energy
 pd38L08        <PATH1>/bz2pd_38_scan       pD7.com           energy
 pd38L06        <PATH1>/bz2pd_38_scan       pD8.com           energy
 pd38L04        <PATH1>/bz2pd_38_scan       pD9.com           energy
 pd38L02        <PATH1>/bz2pd_38_scan      pD10.com           energy
 pd38L00        <PATH1>/bz2s_scan            s7.com           energy
 pd38R02        <PATH1>/bz2pd_38_scan      pD10.com           energy
 pd38R04        <PATH1>/bz2pd_38_scan       pD9.com           energy
 pd38R06        <PATH1>/bz2pd_38_scan       pD8.com           energy
 pd38R08        <PATH1>/bz2pd_38_scan       pD7.com           energy
 pd38R10        <PATH1>/bz2pd_38_scan       pD6.com           energy
 pd38R12        <PATH1>/bz2pd_38_scan       pD5.com           energy
 pd38R14        <PATH1>/bz2pd_38_scan       pD4.com           energy
 pd38R16        <PATH1>/bz2pd_38_scan       pD3.com           energy
 pd38R18        <PATH1>/bz2pd_38_scan       pD2.com           energy
 pd38R20        <PATH1>/bz2pd_38_scan       pD1.com           energy

# Training set for the atomization energy
#              118 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 118  1.0
#"Number" "Flag" "Scale"                     "Ref"         "Weight"
 1         s32      1                         0.00000000    1.0
 1         s33      1                         0.00000000    1.0
 1         s34      1                         0.00000000    1.0
 1         s35      1                         0.00000000    1.0
 1         s36      1                         0.00000000    1.0
 1         s37      1                         0.00000000    1.0
 1         s38      1                         0.00000000    1.0
 1         s39      1                         0.00000000    1.0
 1         s40      1                         0.00000000    1.0
 1         s41      1                         0.00000000    1.0
 1         s42      1                         0.00000000    1.0
 1         s45      1                         0.00000000    1.0
 1         s50      1                         0.00000000    1.0
 1         s55      1                         0.00000000    1.0
 1         s60      1                         0.00000000    1.0
 1         s65      1                         0.00000000    1.0
 1         t44      1                         0.00000000    1.0
 1         t45      1                         0.00000000    1.0
 1         t46      1                         0.00000000    1.0
 1         t47      1                         0.00000000    1.0
 1         t48      1                         0.00000000    1.0
 1         t49      1                         0.00000000    1.0
 1         t50      1                         0.00000000    1.0
 1         t51      1                         0.00000000    1.0
 1         t52      1                         0.00000000    1.0
 1         t53      1                         0.00000000    1.0
 1         t54      1                         0.00000000    1.0
 1         t55      1                         0.00000000    1.0
 1         t56      1                         0.00000000    1.0
 1         t59      1                         0.00000000    1.0
 1         t64      1                         0.00000000    1.0
 1         t69      1                         0.00000000    1.0
 1         t74      1                         0.00000000    1.0
 1         t79      1                         0.00000000    1.0
 1         pd32L20  1                         0.00000000    1.0
 1         pd32L18  1                         0.00000000    1.0
 1         pd32L16  1                         0.00000000    1.0
 1         pd32L14  1                         0.00000000    1.0
 1         pd32L12  1                         0.00000000    1.0
 1         pd32L10  1                         0.00000000    1.0
 1         pd32L08  1                         0.00000000    1.0
 1         pd32L06  1                         0.00000000    1.0
 1         pd32L04  1                         0.00000000    1.0
 1         pd32L02  1                         0.00000000    1.0
 1         pd32L00  1                         0.00000000    1.0
 1         pd32R02  1                         0.00000000    1.0
 1         pd32R04  1                         0.00000000    1.0
 1         pd32R06  1                         0.00000000    1.0
 1         pd32R08  1                         0.00000000    1.0
 1         pd32R10  1                         0.00000000    1.0
 1         pd32R12  1                         0.00000000    1.0
 1         pd32R14  1                         0.00000000    1.0
 1         pd32R16  1                         0.00000000    1.0
 1         pd32R18  1                         0.00000000    1.0
 1         pd32R20  1                         0.00000000    1.0
 1         pd34L20  1                         0.00000000    1.0
 1         pd34L18  1                         0.00000000    1.0
 1         pd34L16  1                         0.00000000    1.0
 1         pd34L14  1                         0.00000000    1.0
 1         pd34L12  1                         0.00000000    1.0
 1         pd34L10  1                         0.00000000    1.0
 1         pd34L08  1                         0.00000000    1.0
 1         pd34L06  1                         0.00000000    1.0
 1         pd34L04  1                         0.00000000    1.0
 1         pd34L02  1                         0.00000000    1.0
 1         pd34L00  1                         0.00000000    1.0
 1         pd34R02  1                         0.00000000    1.0
 1         pd34R04  1                         0.00000000    1.0
 1         pd34R06  1                         0.00000000    1.0
 1         pd34R08  1                         0.00000000    1.0
 1         pd34R10  1                         0.00000000    1.0
 1         pd34R12  1                         0.00000000    1.0
 1         pd34R14  1                         0.00000000    1.0
 1         pd34R16  1                         0.00000000    1.0
 1         pd34R18  1                         0.00000000    1.0
 1         pd34R20  1                         0.00000000    1.0
 1         pd36L20  1                         0.00000000    1.0
 1         pd36L18  1                         0.00000000    1.0
 1         pd36L16  1                         0.00000000    1.0
 1         pd36L14  1                         0.00000000    1.0
 1         pd36L12  1                         0.00000000    1.0
 1         pd36L10  1                         0.00000000    1.0
 1         pd36L08  1                         0.00000000    1.0
 1         pd36L06  1                         0.00000000    1.0
 1         pd36L04  1                         0.00000000    1.0
 1         pd36L02  1                         0.00000000    1.0
 1         pd36L00  1                         0.00000000    1.0
 1         pd36R02  1                         0.00000000    1.0
 1         pd36R04  1                         0.00000000    1.0
 1         pd36R06  1                         0.00000000    1.0
 1         pd36R08  1                         0.00000000    1.0
 1         pd36R10  1                         0.00000000    1.0
 1         pd36R12  1                         0.00000000    1.0
 1         pd36R14  1                         0.00000000    1.0
 1         pd36R16  1                         0.00000000    1.0
 1         pd36R18  1                         0.00000000    1.0
 1         pd36R20  1                         0.00000000    1.0
 1         pd38L20  1                         0.00000000    1.0
 1         pd38L18  1                         0.00000000    1.0
 1         pd38L16  1                         0.00000000    1.0
 1         pd38L14  1                         0.00000000    1.0
 1         pd38L12  1                         0.00000000    1.0
 1         pd38L10  1                         0.00000000    1.0
 1         pd38L08  1                         0.00000000    1.0
 1         pd38L06  1                         0.00000000    1.0
 1         pd38L04  1                         0.00000000    1.0
 1         pd38L02  1                         0.00000000    1.0
 1         pd38L00  1                         0.00000000    1.0
 1         pd38R02  1                         0.00000000    1.0
 1         pd38R04  1                         0.00000000    1.0
 1         pd38R06  1                         0.00000000    1.0
 1         pd38R08  1                         0.00000000    1.0
 1         pd38R10  1                         0.00000000    1.0
 1         pd38R12  1                         0.00000000    1.0
 1         pd38R14  1                         0.00000000    1.0
 1         pd38R16  1                         0.00000000    1.0
 1         pd38R18  1                         0.00000000    1.0
 1         pd38R20  1                         0.00000000    1.0

# Training set for the atomization energy
#              118 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy_relative__ :: 118  1.0
#"Number" "Flag" "Scale"                     "Ref"         "Weight"
 2         s32      1   C6H6  -2              0.00591544    1.0
 2         s33      1   C6H6  -2              0.00267087    1.0
 2         s34      1   C6H6  -2              0.00047967    1.0
 2         s35      1   C6H6  -2             -0.00098006    1.0
 2         s36      1   C6H6  -2             -0.00188842    1.0
 2         s37      1   C6H6  -2             -0.00241112    1.0
 2         s38      1   C6H6  -2             -0.00264856    1.0
 2         s39      1   C6H6  -2             -0.00271071    1.0
 2         s40      1   C6H6  -2             -0.00265334    1.0
 2         s41      1   C6H6  -2             -0.00251948    1.0
 2         s42      1   C6H6  -2             -0.00232506    1.0
 2         s45      1   C6H6  -2             -0.00172268    1.0
 2         s50      1   C6H6  -2             -0.00091632    1.0
 2         s55      1   C6H6  -2             -0.00043665    1.0
 2         s60      1   C6H6  -2             -0.00018167    1.0
 2         s65      1   C6H6  -2             -0.00005737    1.0
 2         t44      1   C6H6  -2              0.00174977    1.0
 2         t45      1   C6H6  -2             -0.00063425    1.0
 2         t46      1   C6H6  -2             -0.00222785    1.0
 2         t47      1   C6H6  -2             -0.00323660    1.0
 2         t48      1   C6H6  -2             -0.00381827    1.0
 2         t49      1   C6H6  -2             -0.00409555    1.0
 2         t50      1   C6H6  -2             -0.00415930    1.0
 2         t51      1   C6H6  -2             -0.00407962    1.0
 2         t52      1   C6H6  -2             -0.00390910    1.0
 2         t53      1   C6H6  -2             -0.00368281    1.0
 2         t54      1   C6H6  -2             -0.00342624    1.0
 2         t55      1   C6H6  -2             -0.00316011    1.0
 2         t56      1   C6H6  -2             -0.00289557    1.0
 2         t59      1   C6H6  -2             -0.00217367    1.0
 2         t64      1   C6H6  -2             -0.00131631    1.0
 2         t69      1   C6H6  -2             -0.00081114    1.0
 2         t74      1   C6H6  -2             -0.00051792    1.0
 2         t79      1   C6H6  -2             -0.00034262    1.0
 2         pd32L20  1   C6H6  -2             -0.00290035    1.0
 2         pd32L18  1   C6H6  -2             -0.00290832    1.0
 2         pd32L16  1   C6H6  -2             -0.00270593    1.0
 2         pd32L14  1   C6H6  -2             -0.00218961    1.0
 2         pd32L12  1   C6H6  -2             -0.00129878    1.0
 2         pd32L10  1   C6H6  -2             -0.00005259    1.0
 2         pd32L08  1   C6H6  -2              0.00148045    1.0
 2         pd32L06  1   C6H6  -2              0.00309636    1.0
 2         pd32L04  1   C6H6  -2              0.00453220    1.0
 2         pd32L02  1   C6H6  -2              0.00555848    1.0
 2         pd32L00  1   C6H6  -2              0.00591544    1.0
 2         pd32R02  1   C6H6  -2              0.00555848    1.0
 2         pd32R04  1   C6H6  -2              0.00453220    1.0
 2         pd32R06  1   C6H6  -2              0.00309636    1.0
 2         pd32R08  1   C6H6  -2              0.00148045    1.0
 2         pd32R10  1   C6H6  -2             -0.00005259    1.0
 2         pd32R12  1   C6H6  -2             -0.00129878    1.0
 2         pd32R14  1   C6H6  -2             -0.00218961    1.0
 2         pd32R16  1   C6H6  -2             -0.00270593    1.0
 2         pd32R18  1   C6H6  -2             -0.00290832    1.0
 2         pd32R20  1   C6H6  -2             -0.00290035    1.0
 2         pd34L20  1   C6H6  -2             -0.00401906    1.0
 2         pd34L18  1   C6H6  -2             -0.00410671    1.0
 2         pd34L16  1   C6H6  -2             -0.00405253    1.0
 2         pd34L14  1   C6H6  -2             -0.00381189    1.0
 2         pd34L12  1   C6H6  -2             -0.00335134    1.0
 2         pd34L10  1   C6H6  -2             -0.00268362    1.0
 2         pd34L08  1   C6H6  -2             -0.00186451    1.0
 2         pd34L06  1   C6H6  -2             -0.00101034    1.0
 2         pd34L04  1   C6H6  -2             -0.00026454    1.0
 2         pd34L02  1   C6H6  -2              0.00027569    1.0
 2         pd34L00  1   C6H6  -2              0.00047967    1.0
 2         pd34R02  1   C6H6  -2              0.00027569    1.0
 2         pd34R04  1   C6H6  -2             -0.00026454    1.0
 2         pd34R06  1   C6H6  -2             -0.00101034    1.0
 2         pd34R08  1   C6H6  -2             -0.00186451    1.0
 2         pd34R10  1   C6H6  -2             -0.00268362    1.0
 2         pd34R12  1   C6H6  -2             -0.00335134    1.0
 2         pd34R14  1   C6H6  -2             -0.00381189    1.0
 2         pd34R16  1   C6H6  -2             -0.00405253    1.0
 2         pd34R18  1   C6H6  -2             -0.00410671    1.0
 2         pd34R20  1   C6H6  -2             -0.00401906    1.0
 2         pd36L20  1   C6H6  -2             -0.00406846    1.0
 2         pd36L18  1   C6H6  -2             -0.00416089    1.0
 2         pd36L16  1   C6H6  -2             -0.00418001    1.0
 2         pd36L14  1   C6H6  -2             -0.00407962    1.0
 2         pd36L12  1   C6H6  -2             -0.00385651    1.0
 2         pd36L10  1   C6H6  -2             -0.00351229    1.0
 2         pd36L08  1   C6H6  -2             -0.00308680    1.0
 2         pd36L06  1   C6H6  -2             -0.00262944    1.0
 2         pd36L04  1   C6H6  -2             -0.00223901    1.0
 2         pd36L02  1   C6H6  -2             -0.00197288    1.0
 2         pd36L00  1   C6H6  -2             -0.00188842    1.0
 2         pd36R02  1   C6H6  -2             -0.00197288    1.0
 2         pd36R04  1   C6H6  -2             -0.00223901    1.0
 2         pd36R06  1   C6H6  -2             -0.00262944    1.0
 2         pd36R08  1   C6H6  -2             -0.00308680    1.0
 2         pd36R10  1   C6H6  -2             -0.00351229    1.0
 2         pd36R12  1   C6H6  -2             -0.00385651    1.0
 2         pd36R14  1   C6H6  -2             -0.00407962    1.0
 2         pd36R16  1   C6H6  -2             -0.00418001    1.0
 2         pd36R18  1   C6H6  -2             -0.00416089    1.0
 2         pd36R20  1   C6H6  -2             -0.00406846    1.0
 2         pd38L20  1   C6H6  -2             -0.00363978    1.0
 2         pd38L18  1   C6H6  -2             -0.00374018    1.0
 2         pd38L16  1   C6H6  -2             -0.00378480    1.0
 2         pd38L14  1   C6H6  -2             -0.00374177    1.0
 2         pd38L12  1   C6H6  -2             -0.00363500    1.0
 2         pd38L10  1   C6H6  -2             -0.00346608    1.0
 2         pd38L08  1   C6H6  -2             -0.00324935    1.0
 2         pd38L06  1   C6H6  -2             -0.00301668    1.0
 2         pd38L04  1   C6H6  -2             -0.00280314    1.0
 2         pd38L02  1   C6H6  -2             -0.00267725    1.0
 2         pd38L00  1   C6H6  -2             -0.00264856    1.0
 2         pd38R02  1   C6H6  -2             -0.00267725    1.0
 2         pd38R04  1   C6H6  -2             -0.00280314    1.0
 2         pd38R06  1   C6H6  -2             -0.00301668    1.0
 2         pd38R08  1   C6H6  -2             -0.00324935    1.0
 2         pd38R10  1   C6H6  -2             -0.00346608    1.0
 2         pd38R12  1   C6H6  -2             -0.00363500    1.0
 2         pd38R14  1   C6H6  -2             -0.00374177    1.0
 2         pd38R16  1   C6H6  -2             -0.00378480    1.0
 2         pd38R18  1   C6H6  -2             -0.00374018    1.0
 2         pd38R20  1   C6H6  -2             -0.00363978    1.0

