# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./MB08-165          2            Aims 

# The project description
__title__ ::
"============================== MB08-165 set ============================="
"             This is MB08-165 subset from GMTKN30 proposed by Grimme     "

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
#                180 is the total number of jobs in this batch list
__batch__ :: 180
#"Flag"         "DIR"                        "InpName"       "JobType"
 001      <PATH1>/MB08-165                   001           energy
 002      <PATH1>/MB08-165                   002           energy
 003      <PATH1>/MB08-165                   003           energy
 004      <PATH1>/MB08-165                   004           energy
 005      <PATH1>/MB08-165                   005           energy
 006      <PATH1>/MB08-165                   006           energy
 007      <PATH1>/MB08-165                   007           energy
 008      <PATH1>/MB08-165                   008           energy
 009      <PATH1>/MB08-165                   009           energy
 010      <PATH1>/MB08-165                   010           energy
 011      <PATH1>/MB08-165                   011           energy
 012      <PATH1>/MB08-165                   012           energy
 013      <PATH1>/MB08-165                   013           energy
 014      <PATH1>/MB08-165                   014           energy
 015      <PATH1>/MB08-165                   015           energy
 016      <PATH1>/MB08-165                   016           energy
 017      <PATH1>/MB08-165                   017           energy
 018      <PATH1>/MB08-165                   018           energy
 019      <PATH1>/MB08-165                   019           energy
 020      <PATH1>/MB08-165                   020           energy
 021      <PATH1>/MB08-165                   021           energy
 022      <PATH1>/MB08-165                   022           energy
 023      <PATH1>/MB08-165                   023           energy
 024      <PATH1>/MB08-165                   024           energy
 025      <PATH1>/MB08-165                   025           energy
 026      <PATH1>/MB08-165                   026           energy
 027      <PATH1>/MB08-165                   027           energy
 028      <PATH1>/MB08-165                   028           energy
 029      <PATH1>/MB08-165                   029           energy
 030      <PATH1>/MB08-165                   030           energy
 031      <PATH1>/MB08-165                   031           energy
 032      <PATH1>/MB08-165                   032           energy
 033      <PATH1>/MB08-165                   033           energy
 034      <PATH1>/MB08-165                   034           energy
 035      <PATH1>/MB08-165                   035           energy
 036      <PATH1>/MB08-165                   036           energy
 037      <PATH1>/MB08-165                   037           energy
 038      <PATH1>/MB08-165                   038           energy
 039      <PATH1>/MB08-165                   039           energy
 040      <PATH1>/MB08-165                   040           energy
 041      <PATH1>/MB08-165                   041           energy
 042      <PATH1>/MB08-165                   042           energy
 043      <PATH1>/MB08-165                   043           energy
 044      <PATH1>/MB08-165                   044           energy
 045      <PATH1>/MB08-165                   045           energy
 046      <PATH1>/MB08-165                   046           energy
 047      <PATH1>/MB08-165                   047           energy
 048      <PATH1>/MB08-165                   048           energy
 049      <PATH1>/MB08-165                   049           energy
 050      <PATH1>/MB08-165                   050           energy
 051      <PATH1>/MB08-165                   051           energy
 052      <PATH1>/MB08-165                   052           energy
 053      <PATH1>/MB08-165                   053           energy
 054      <PATH1>/MB08-165                   054           energy
 055      <PATH1>/MB08-165                   055           energy
 056      <PATH1>/MB08-165                   056           energy
 057      <PATH1>/MB08-165                   057           energy
 058      <PATH1>/MB08-165                   058           energy
 059      <PATH1>/MB08-165                   059           energy
 060      <PATH1>/MB08-165                   060           energy
 061      <PATH1>/MB08-165                   061           energy
 062      <PATH1>/MB08-165                   062           energy
 063      <PATH1>/MB08-165                   063           energy
 064      <PATH1>/MB08-165                   064           energy
 065      <PATH1>/MB08-165                   065           energy
 066      <PATH1>/MB08-165                   066           energy
 067      <PATH1>/MB08-165                   067           energy
 068      <PATH1>/MB08-165                   068           energy
 069      <PATH1>/MB08-165                   069           energy
 070      <PATH1>/MB08-165                   070           energy
 071      <PATH1>/MB08-165                   071           energy
 072      <PATH1>/MB08-165                   072           energy
 073      <PATH1>/MB08-165                   073           energy
 074      <PATH1>/MB08-165                   074           energy
 075      <PATH1>/MB08-165                   075           energy
 076      <PATH1>/MB08-165                   076           energy
 077      <PATH1>/MB08-165                   077           energy
 078      <PATH1>/MB08-165                   078           energy
 079      <PATH1>/MB08-165                   079           energy
 080      <PATH1>/MB08-165                   080           energy
 081      <PATH1>/MB08-165                   081           energy
 082      <PATH1>/MB08-165                   082           energy
 083      <PATH1>/MB08-165                   083           energy
 084      <PATH1>/MB08-165                   084           energy
 085      <PATH1>/MB08-165                   085           energy
 086      <PATH1>/MB08-165                   086           energy
 087      <PATH1>/MB08-165                   087           energy
 088      <PATH1>/MB08-165                   088           energy
 089      <PATH1>/MB08-165                   089           energy
 090      <PATH1>/MB08-165                   090           energy
 091      <PATH1>/MB08-165                   091           energy
 092      <PATH1>/MB08-165                   092           energy
 093      <PATH1>/MB08-165                   093           energy
 094      <PATH1>/MB08-165                   094           energy
 095      <PATH1>/MB08-165                   095           energy
 096      <PATH1>/MB08-165                   096           energy
 097      <PATH1>/MB08-165                   097           energy
 098      <PATH1>/MB08-165                   098           energy
 099      <PATH1>/MB08-165                   099           energy
 100      <PATH1>/MB08-165                   100           energy
 101      <PATH1>/MB08-165                   101           energy
 102      <PATH1>/MB08-165                   102           energy
 103      <PATH1>/MB08-165                   103           energy
 104      <PATH1>/MB08-165                   104           energy
 105      <PATH1>/MB08-165                   105           energy
 106      <PATH1>/MB08-165                   106           energy
 107      <PATH1>/MB08-165                   107           energy
 108      <PATH1>/MB08-165                   108           energy
 109      <PATH1>/MB08-165                   109           energy
 110      <PATH1>/MB08-165                   110           energy
 111      <PATH1>/MB08-165                   111           energy
 112      <PATH1>/MB08-165                   112           energy
 113      <PATH1>/MB08-165                   113           energy
 114      <PATH1>/MB08-165                   114           energy
 115      <PATH1>/MB08-165                   115           energy
 116      <PATH1>/MB08-165                   116           energy
 117      <PATH1>/MB08-165                   117           energy
 118      <PATH1>/MB08-165                   118           energy
 119      <PATH1>/MB08-165                   119           energy
 120      <PATH1>/MB08-165                   120           energy
 121      <PATH1>/MB08-165                   121           energy
 122      <PATH1>/MB08-165                   122           energy
 123      <PATH1>/MB08-165                   123           energy
 124      <PATH1>/MB08-165                   124           energy
 125      <PATH1>/MB08-165                   125           energy
 126      <PATH1>/MB08-165                   126           energy
 127      <PATH1>/MB08-165                   127           energy
 128      <PATH1>/MB08-165                   128           energy
 129      <PATH1>/MB08-165                   129           energy
 130      <PATH1>/MB08-165                   130           energy
 131      <PATH1>/MB08-165                   131           energy
 132      <PATH1>/MB08-165                   132           energy
 133      <PATH1>/MB08-165                   133           energy
 134      <PATH1>/MB08-165                   134           energy
 135      <PATH1>/MB08-165                   135           energy
 136      <PATH1>/MB08-165                   136           energy
 137      <PATH1>/MB08-165                   137           energy
 138      <PATH1>/MB08-165                   138           energy
 139      <PATH1>/MB08-165                   139           energy
 140      <PATH1>/MB08-165                   140           energy
 141      <PATH1>/MB08-165                   141           energy
 142      <PATH1>/MB08-165                   142           energy
 143      <PATH1>/MB08-165                   143           energy
 144      <PATH1>/MB08-165                   144           energy
 145      <PATH1>/MB08-165                   145           energy
 146      <PATH1>/MB08-165                   146           energy
 147      <PATH1>/MB08-165                   147           energy
 148      <PATH1>/MB08-165                   148           energy
 149      <PATH1>/MB08-165                   149           energy
 150      <PATH1>/MB08-165                   150           energy
 151      <PATH1>/MB08-165                   151           energy
 152      <PATH1>/MB08-165                   152           energy
 153      <PATH1>/MB08-165                   153           energy
 154      <PATH1>/MB08-165                   154           energy
 155      <PATH1>/MB08-165                   155           energy
 156      <PATH1>/MB08-165                   156           energy
 157      <PATH1>/MB08-165                   157           energy
 158      <PATH1>/MB08-165                   158           energy
 159      <PATH1>/MB08-165                   159           energy
 160      <PATH1>/MB08-165                   160           energy
 161      <PATH1>/MB08-165                   161           energy
 162      <PATH1>/MB08-165                   162           energy
 163      <PATH1>/MB08-165                   163           energy
 164      <PATH1>/MB08-165                   164           energy
 165      <PATH1>/MB08-165                   165           energy
 166_h    <PATH1>/MB08-165                 166_h           energy
 167_li   <PATH1>/MB08-165                167_li           energy
 168_be   <PATH1>/MB08-165                168_be           energy
 169_b    <PATH1>/MB08-165                 169_b           energy
 170_c    <PATH1>/MB08-165                 170_c           energy
 171_n    <PATH1>/MB08-165                 171_n           energy
 172_o    <PATH1>/MB08-165                 172_o           energy
 173_f    <PATH1>/MB08-165                 173_f           energy
 174_na   <PATH1>/MB08-165                174_na           energy
 175_mg   <PATH1>/MB08-165                175_mg           energy
 176_al   <PATH1>/MB08-165                176_al           energy
 177_si   <PATH1>/MB08-165                177_si           energy
 178_p    <PATH1>/MB08-165                 178_p           energy
 179_s    <PATH1>/MB08-165                 179_s           energy
 180_cl   <PATH1>/MB08-165                180_cl           energy


# Training set for the atomization energy
#              165 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 165  627.51
#"Number" "Flag" "Scale"                                                                                  "Ref"      "Weight"
  4    001    -2    170_c     2    172_o    1    166_h    2                                               128.981     1.0000
  5    002    -2    171_n     1    172_o    1    178_p    1    166_h    5                                 10.1995     1.0000
  6    003    -2    166_h    -8    169_b    4    170_c    2    167_li   2    171_n    1                  -64.5198     1.0000
  4    004    -2    168_be    2    179_s    1    166_h    4                                               64.2156     1.0000
  5    005    -2    168_be    2    180_cl   1    171_n    1    166_h    3                                 103.341     1.0000
  6    006    -2    166_h    -4    176_al   2    169_b    2    168_be   2    171_n     1                  94.8625     1.0000
  3    007    -2    177_si    2    166_h    3                                                            -83.7923     1.0000
  4    008    -1    166_h    -2    170_c    2    167_li   1                                              -87.8609     1.0000
  6    009    -2    166_h    -4    176_al   2    169_b    2    168_be   2    173_f     1                  101.855     1.0000
  4    010    -1    174_na    1    172_o    1    166_h    2                                               73.4314     1.0000
  3    011    -2    168_be    2    166_h    5                                                            -69.9266     1.0000
  3    012    -1    169_b     1    166_h    2                                                             6.29251     1.0000
  4    013    -2    168_be    2    178_p    1    166_h    4                                              -7.72743     1.0000
  4    014    -2    167_li    4    172_o    1    166_h    3                                               212.840     1.0000
  4    015    -2    168_be    2    172_o    1    166_h    4                                               167.785     1.0000
  4    016    -1    169_b     1    167_li   1    166_h    1                                               70.6529     1.0000
  5    017    -2    168_be    2    180_cl   1    179_s    1    166_h    3                                 93.7936     1.0000
  3    018    -1    175_mg    1    177_si   1                                                            -2.14101     1.0000
  4    019    -2    169_b     2    175_mg   2    178_p    1                                               79.8097     1.0000
  5    020    -2    169_b     2    173_f    1    167_li   2    166_h    1                                 315.129     1.0000
  6    021    -2    166_h    -7    168_be   2    170_c    4    173_f    1    179_s     1                  145.384     1.0000
  4    022    -2    172_o     1    178_p    1    166_h    6                                               82.0241     1.0000
  3    023    -1    169_b     1    167_li   2                                                             33.4068     1.0000
  4    024    -2    169_b     2    168_be   2    179_s    1                                               166.621     1.0000
  4    025    -2    171_n     1    179_s    1    166_h    6                                              -34.7981     1.0000
  4    026    -1    169_b     1    171_n    1    166_h    1                                              -53.9231     1.0000
  4    027    -1    166_h    -1    170_c    1    177_si   1                                              -64.2575     1.0000
  5    028    -2    169_b     2    173_f    1    172_o    1    166_h    2                                 228.294     1.0000
  6    029    -2    166_h    -2    170_c    2    173_f    1    175_mg   2    172_o     1                  141.522     1.0000
  4    030    -2    168_be    2    171_n    1    166_h    4                                              -5.23890     1.0000
  4    031    -2    169_b     2    173_f    1    166_h    3                                               199.354     1.0000
  7    032    -2    166_h    -7    176_al   2    167_li   4    171_n    1    172_o     1    177_si    2   346.765     1.0000
  5    033    -2    169_b     2    180_cl   1    173_f    1    166_h    2                                 246.838     1.0000
  4    034    -2    170_c     2    173_f    1    167_li   2                                              -9.71568     1.0000
  6    035    -1    166_h    -3    169_b    1    170_c    1    167_li   1    175_mg    1                 -4.91770     1.0000
  5    036    -2    166_h    -1    170_c    2    167_li   2    174_na   2                                -34.4301     1.0000
  5    037    -2    166_h    -5    170_c    2    175_mg   2    177_si   2                                -199.360     1.0000
  6    038    -2    166_h    -2    168_be   2    170_c    2    171_n    1    172_o     1                  41.6549     1.0000
  6    039    -2    166_h    -3    169_b    2    170_c    2    180_cl   1    178_p     1                  25.5228     1.0000
  6    040    -2    166_h    -3    168_be   4    180_cl   1    167_li   2    171_n     2                  144.978     1.0000
  5    041    -2    176_al    2    173_f    2    178_p    1    166_h    1                                 273.134     1.0000
  5    042    -2    169_b     2    173_f    1    167_li   2    166_h    1                                 316.083     1.0000
  6    043    -2    166_h    -3    176_al   2    170_c    2    180_cl   1    179_s     1                  31.8490     1.0000
  3    044    -1    176_al    1    166_h    2                                                             3.75113     1.0000
  4    045    -1    169_b     1    174_na   1    166_h    1                                               65.5461     1.0000
  6    046    -1    166_h    -3    169_b    1    168_be   1    174_na   1    177_si    1                  36.6235     1.0000
  4    047    -2    167_li    2    178_p    1    166_h    5                                               49.5159     1.0000
  5    048    -2    166_h    -2    176_al   2    170_c    2    172_o    1                                 96.3261     1.0000
  4    049    -2    168_be    2    179_s    1    166_h    4                                               93.5031     1.0000
  4    050    -2    176_al    2    180_cl   1    166_h    3                                               62.6219     1.0000
  5    051    -2    173_f     1    167_li   2    171_n    1    166_h    4                                 88.2948     1.0000
  5    052    -2    166_h    -2    169_b    2    170_c    2    179_s    1                                -12.6939     1.0000
  5    053    -2    166_h    -2    169_b    2    170_c    2    172_o    1                                 47.9831     1.0000
  4    054    -2    168_be    4    171_n    1    166_h    1                                               16.9482     1.0000
  6    055    -2    180_cl    1    173_f    1    175_mg   2    179_s    1    166_h     2                  433.664     1.0000
  4    056    -2    173_f     1    167_li   2    166_h    5                                               248.457     1.0000
  4    057    -1    169_b     1    174_na   1    166_h    1                                               65.2968     1.0000
  4    058    -1    167_li    1    171_n    1    166_h    2                                               13.2213     1.0000
  3    059    -2    180_cl    1    166_h    7                                                             49.8152     1.0000
  5    060    -2    169_b     2    173_f    1    171_n    1    166_h    2                                 282.122     1.0000
  4    061    -2    168_be    2    179_s    1    166_h    4                                               96.9399     1.0000
  3    062    -1    174_na    1    166_h    3                                                             2.20915     1.0000
  6    063    -2    166_h    -1    176_al   2    173_f    1    175_mg   2    179_s     1                  331.099     1.0000
  5    064    -2    166_h    -3    170_c    2    171_n    1    177_si   2                                -45.3574     1.0000
  4    065    -2    175_mg    2    172_o    1    166_h    4                                               185.358     1.0000
  4    066    -2    176_al    2    171_n    1    166_h    3                                               7.87624     1.0000
  5    067    -2    166_h    -1    176_al   2    169_b    2    171_n    1                                 133.716     1.0000
  4    068    -2    169_b     2    171_n    1    166_h    3                                               103.749     1.0000
  4    069    -2    173_f     1    171_n    1    166_h    6                                               201.248     1.0000
  5    070    -2    166_h    -1    168_be   2    170_c    2    173_f    1                                 62.5938     1.0000
  5    071    -2    166_h    -2    176_al   2    170_c    2    172_o    1                                 95.3155     1.0000
  4    072    -2    174_na    2    172_o    1    177_si   2                                               148.937     1.0000
  5    073    -1    166_h    -2    169_b    1    168_be   1    170_c    1                                -37.5031     1.0000
  6    074    -1    166_h    -5    169_b    2    168_be   1    167_li   1    177_si    1                  17.3911     1.0000
  5    075    -2    170_c     2    173_f    1    171_n    1    172_o    1                                 32.5568     1.0000
  4    076    -1    169_b     1    167_li   1    166_h    1                                               65.4965     1.0000
  5    077    -2    169_b     2    173_f    1    171_n    2    166_h    1                                 91.6377     1.0000
  4    078    -2    176_al    2    168_be   2    172_o    1                                               225.237     1.0000
  3    079    -2    173_f     1    166_h    7                                                             139.537     1.0000
  6    080    -1    166_h    -3    169_b    1    168_be   1    170_c    1    167_li    1                  37.2200     1.0000
  4    081    -2    167_li    2    178_p    1    166_h    5                                               86.8257     1.0000
  4    082    -2    166_h    -3    170_c    4    171_n    1                                              -120.440     1.0000
  5    083    -2    166_h   -10    170_c    6    173_f    1    167_li   2                                -169.048     1.0000
  3    084    -1    166_h    -1    170_c    2                                                            -18.3432     1.0000
  4    085    -2    166_h    -3    170_c    4    172_o    1                                              -117.717     1.0000
  3    086    -1    169_b     1    166_h    2                                                             6.35849     1.0000
  6    087    -1    166_h    -4    176_al   1    169_b    1    170_c    1    175_mg    1                 -54.4616     1.0000
  5    088    -2    166_h    -9    170_c    6    171_n    1    179_s    1                                -394.886     1.0000
  5    089    -2    166_h    -7    169_b    2    170_c    4    171_n    1                                -200.179     1.0000
  3    090    -2    170_c     2    166_h    3                                                            -108.999     1.0000
  5    091    -2    166_h    -3    169_b    2    170_c    2    172_o    2                                 37.6627     1.0000
  3    092    -1    170_c     1    175_mg   1                                                            -7.84241     1.0000
  5    093    -2    171_n     1    178_p    1    177_si   2    166_h     1                                17.4039     1.0000
  5    094    -2    170_c     2    172_o    1    179_s    1    166_h     1                                44.6214     1.0000
  5    095    -2    166_h   -11    170_c    6    175_mg   2    178_p     1                               -341.816     1.0000
  4    096    -2    166_h    -3    170_c    4    178_p    1                                              -87.7490     1.0000
  4    097    -2    166_h    -3    170_c    4    179_s    1                                              -131.461     1.0000
  4    098    -2    172_o     1    179_s    1    166_h    6                                               181.605     1.0000
  4    099    -2    170_c     2    172_o    1    166_h    2                                               67.8673     1.0000
  4    100    -1    166_h    -3    169_b    1    170_c    2                                              -98.8525     1.0000
  3    101    -2    172_o     1    166_h    7                                                             20.4527     1.0000
  5    102    -2    166_h    -1    170_c    2    175_mg   2    172_o     1                               -10.5301     1.0000
  5    103    -2    166_h    -4    170_c    4    171_n    1    172_o     1                               -171.697     1.0000
  5    104    -2    166_h    -9    170_c    4    167_li   2    177_si    2                               -207.901     1.0000
  4    105    -2    166_h    -3    170_c    4    171_n    1                                              -107.287     1.0000
  5    106    -2    166_h    -4    170_c    4    173_f    1    178_p     1                               -100.917     1.0000
  4    107    -2    170_c     2    171_n    2    166_h    1                                              -124.796     1.0000
  5    108    -2    170_c     2    171_n    1    178_p    1    179_s     1                               -125.960     1.0000
  3    109    -1    171_n     1    166_h    3                                                            -8.47506     1.0000
  4    110    -1    166_h    -5    170_c    3    175_mg   1                                              -187.013     1.0000
  4    111    -2    166_h    -8    170_c    6    171_n    1                                              -362.354     1.0000
  5    112    -2    166_h    -9    170_c    6    172_o    1    178_p     1                               -359.841     1.0000
  6    113    -2    166_h    -8    170_c    4    167_li   2    175_mg    2    172_o    1                  45.4665     1.0000
  5    114    -2    166_h    -2    176_al   2    170_c    2    171_n     1                               -146.899     1.0000
  5    115    -2    170_c     2    171_n    1    172_o    1    166_h     1                               -67.9433     1.0000
  6    116    -2    176_al    2    173_f    1    172_o    1    178_p     1    166_h    1                  275.154     1.0000
  4    117    -2    166_h    -3    170_c    4    173_f    1                                              -25.4577     1.0000
  4    118    -1    176_al    1    172_o    1    166_h    1                                               52.5672     1.0000
  5    119    -2    173_f     1    172_o    1    178_p    1    166_h     5                                241.368     1.0000
  4    120    -2    167_li    2    179_s    1    166_h    5                                               45.1749     1.0000
  4    121    -1    166_h    -3    176_al   1    170_c    2                                              -59.4490     1.0000
  6    122    -2    166_h    -5    170_c    2    172_o    2    178_p     1    177_si   2                  192.865     1.0000
  4    123    -2    170_c     2    171_n    1    166_h    2                                              -125.570     1.0000
  5    124    -2    166_h    -8    170_c    4    178_p    1    177_si    2                               -311.385     1.0000
  6    125    -2    166_h    -1    170_c    2    180_cl   1    167_li    2    179_s    1                  62.6230     1.0000
  5    126    -2    166_h    -2    169_b    2    170_c    2    172_o     1                                60.0493     1.0000
  4    127    -1    166_h    -1    170_c    1    177_si   1                                              -64.1000     1.0000
  5    128    -2    166_h    -1    170_c    2    175_mg   2    178_p     1                               -62.1802     1.0000
  4    129    -2    166_h   -18    170_c   10    172_o    1                                              -570.616     1.0000
  5    130    -2    166_h    -8    170_c    4    179_s    1    177_si    2                               -192.107     1.0000
  4    131    -2    166_h    -3    170_c    4    178_p    1                                              -95.9995     1.0000
  5    132    -2    166_h    -7    169_b    2    170_c    4    173_f     1                               -37.9086     1.0000
  4    133    -2    173_f     1    178_p    1    166_h    6                                               107.648     1.0000
  5    134    -1    166_h    -2    170_c    1    171_n    1    177_si    1                               -81.9379     1.0000
  5    135    -2    180_cl    1    171_n    2    178_p    1    166_h     4                                39.5101     1.0000
  5    136    -2    166_h    -2    169_b    2    170_c    2    172_o     1                                49.1758     1.0000
  4    137    -1    166_h    -1    170_c    1    177_si   1                                              -6.34873     1.0000
  4    138    -2    171_n     1    174_na   2    166_h    5                                               47.4697     1.0000
  4    139    -2    166_h    -3    170_c    4    171_n    1                                              -266.696     1.0000
  5    140    -2    166_h    -2    169_b    2    170_c    2    172_o     1                                25.3882     1.0000
  4    141    -2    170_c     2    179_s    1    166_h    2                                              -114.797     1.0000
  5    142    -2    166_h    -4    170_c    4    172_o    1    179_s     1                               -86.2672     1.0000
  4    143    -2    166_h    -3    170_c    4    171_n    1                                              -192.415     1.0000
  5    144    -2    176_al    2    180_cl   1    178_p    1    166_h     2                                179.059     1.0000
  5    145    -2    166_h   -11    169_b    4    170_c    4    178_p     1                               -173.890     1.0000
  5    146    -1    166_h    -4    176_al   1    170_c    2    174_na    1                               -55.0056     1.0000
  5    147    -2    166_h    -3    170_c    2    173_f    1    177_si    2                               -68.0568     1.0000
  6    148    -2    166_h   -12    169_b    2    170_c    4    179_s     1    177_si   2                 -259.774     1.0000
  5    149    -2    170_c     2    171_n    1    179_s    1    166_h     1                               -116.996     1.0000
  5    150    -2    166_h    -7    176_al   2    170_c    4    171_n     1                               -119.366     1.0000
  4    151    -2    166_h    -3    170_c    4    171_n    1                                              -225.208     1.0000
  5    152    -2    170_c     2    171_n    1    172_o    1    166_h     1                                59.1866     1.0000
  4    153    -2    180_cl    2    172_o    1    177_si   2                                               301.652     1.0000
  5    154    -2    166_h   -13    170_c    6    173_f    1    177_si    2                               -312.657     1.0000
  5    155    -1    166_h    -6    176_al   2    170_c    2    167_li    1                               -72.2330     1.0000
  4    156    -2    166_h    -3    180_cl   1    177_si   4                                              -77.7889     1.0000
  3    157    -1    166_h    -6    170_c    4                                                            -240.681     1.0000
  5    158    -2    166_h    -8    170_c    4    172_o    1    177_si    2                               -164.123     1.0000
  5    159    -2    175_mg    2    172_o    1    178_p    1    166_h     3                                180.391     1.0000
  4    160    -2    180_cl    2    178_p    1    166_h    5                                               127.820     1.0000
  4    161    -2    180_cl    1    171_n    2    166_h    5                                              -79.3552     1.0000
  4    162    -1    166_h    -1    170_c    1    177_si   1                                              -64.2480     1.0000
  5    163    -2    166_h    -4    170_c    4    172_o    1    179_s     1                               -42.4830     1.0000
  5    164    -2    170_c     2    171_n    1    172_o    1    166_h     1                                52.2871     1.0000
  5    165    -2    166_h   -10    170_c    6    167_li   2    172_o     1                               -136.630     1.0000

