# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./B3LYP           2		  QChem

# The project description
__title__ ::
"============================ S22 set ==============================="
"This is a extended S22 set, which contains 5 subsets:               "
"   1)  in 0.9 equilibium                                            "
"   2)  in 1.0 equilibium                                            "
"   3)  in 1.2 equilibium                                            "
"   4)  in 1.5 equilibium                                            "
"   5)  in 2.0 equilibium                                            "

__initial guess__ ::
# For XYGJ4OS
#0.773066, 0.226934, 0.0000, 0.50626, 0.275376, 0.0000, 0.0000, 0.426352, 0.0000
0.773066, 0.0000, 0.50626, 0.275376, 0.426352

# "There are about algorithms at present:                                    "
# "   0) batch    :: just batch the results based on intital guess           "
# "   1) leastsq  :: least square fit algorithm                              "
# "   2) fmin_rms :: downhill simplex algorithm based on RMS                 "
# "   3) fmin_mad :: downhill simplex algorithm based on MAD                 "
# "   4) fmin_cobyla_rms :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on RMS                            "
# "   5) fmin_cobyla_mad :: constrained optimization BY Linear algorithm     "
# "                         (COBYLA) based on MAD                            "
__optimization algorithm__ :: batch

__optimization job__ :: xyg3

__optimization function__ :: 25
def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    #a1, a2, a3, a4, a5, a6, a7, a8, a9 = C                           # for XYGJ4OS
    a1, a3, a4, a5, a8 = C                                            # for XYGJ4OS
    a2  = 1. - a1
    a6  = 0.
    a7  = 0.
    a9  = 0.

    E_noXC, Ex_HF, Ex_LDA, dEx_B, Ec_VWN, dEc_LYP, Ec_PT21, aaaa, abab, bbbb = P
    return E_noXC + a1*Ex_HF + a2*Ex_LDA + a3*dEx_B + a4*Ec_VWN + a5* dEc_LYP \
            + a6*Ec_PT21 + a7*aaaa + a8*abab + a9*bbbb

def opt_func_constrained(C,P):
    '''\
    The constrained function for optimization, where C is the parameters
    '''
    con = 0.5
    for a in C:
        if a<0 or a>1:
	    con = -1
            break
    return con


# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , '.'

# The molecular set to batch: 
#               330 is the total number of jobs in this batch list
__batch__ ::  330
#"Flag"         "DIR"                         "InpName"       "JobType"
 S22091         <PATH1>/                      XYG3_Comp      energy
 S22092         <PATH1>/                      XYG3_Comp      energy
 S22093         <PATH1>/                      XYG3_Comp      energy
 S22094         <PATH1>/                      XYG3_Comp      energy
 S22095         <PATH1>/                      XYG3_Comp      energy
 S22096         <PATH1>/                      XYG3_Comp      energy
 S22097         <PATH1>/                      XYG3_Comp      energy
 S22098         <PATH1>/                      XYG3_Comp      energy
 S22099         <PATH1>/                      XYG3_Comp      energy
 S220910        <PATH1>/                      XYG3_Comp      energy
 S220911        <PATH1>/                      XYG3_Comp      energy
 S220912        <PATH1>/                      XYG3_Comp      energy
 S220913        <PATH1>/                      XYG3_Comp      energy
 S220914        <PATH1>/                      XYG3_Comp      energy
 S220915        <PATH1>/                      XYG3_Comp      energy
 S220916        <PATH1>/                      XYG3_Comp      energy
 S220917        <PATH1>/                      XYG3_Comp      energy
 S220918        <PATH1>/                      XYG3_Comp      energy
 S220919        <PATH1>/                      XYG3_Comp      energy
 S220920        <PATH1>/                      XYG3_Comp      energy
 S220921        <PATH1>/                      XYG3_Comp      energy
 S220922        <PATH1>/                      XYG3_Comp      energy
 S220923        <PATH1>/                      XYG3_Comp      energy
 S220924        <PATH1>/                      XYG3_Comp      energy
 S220925        <PATH1>/                      XYG3_Comp      energy
 S220926        <PATH1>/                      XYG3_Comp      energy
 S220927        <PATH1>/                      XYG3_Comp      energy
 S220928        <PATH1>/                      XYG3_Comp      energy
 S220929        <PATH1>/                      XYG3_Comp      energy
 S220930        <PATH1>/                      XYG3_Comp      energy
 S220931        <PATH1>/                      XYG3_Comp      energy
 S220932        <PATH1>/                      XYG3_Comp      energy
 S220933        <PATH1>/                      XYG3_Comp      energy
 S220934        <PATH1>/                      XYG3_Comp      energy
 S220935        <PATH1>/                      XYG3_Comp      energy
 S220936        <PATH1>/                      XYG3_Comp      energy
 S220937        <PATH1>/                      XYG3_Comp      energy
 S220938        <PATH1>/                      XYG3_Comp      energy
 S220939        <PATH1>/                      XYG3_Comp      energy
 S220940        <PATH1>/                      XYG3_Comp      energy
 S220941        <PATH1>/                      XYG3_Comp      energy
 S220942        <PATH1>/                      XYG3_Comp      energy
 S220943        <PATH1>/                      XYG3_Comp      energy
 S220944        <PATH1>/                      XYG3_Comp      energy
 S220945        <PATH1>/                      XYG3_Comp      energy
 S220946        <PATH1>/                      XYG3_Comp      energy
 S220947        <PATH1>/                      XYG3_Comp      energy
 S220948        <PATH1>/                      XYG3_Comp      energy
 S220949        <PATH1>/                      XYG3_Comp      energy
 S220950        <PATH1>/                      XYG3_Comp      energy
 S220951        <PATH1>/                      XYG3_Comp      energy
 S220952        <PATH1>/                      XYG3_Comp      energy
 S220953        <PATH1>/                      XYG3_Comp      energy
 S220954        <PATH1>/                      XYG3_Comp      energy
 S220955        <PATH1>/                      XYG3_Comp      energy
 S220956        <PATH1>/                      XYG3_Comp      energy
 S220957        <PATH1>/                      XYG3_Comp      energy
 S220958        <PATH1>/                      XYG3_Comp      energy
 S220959        <PATH1>/                      XYG3_Comp      energy
 S220960        <PATH1>/                      XYG3_Comp      energy
 S220961        <PATH1>/                      XYG3_Comp      energy
 S220962        <PATH1>/                      XYG3_Comp      energy
 S220963        <PATH1>/                      XYG3_Comp      energy
 S220964        <PATH1>/                      XYG3_Comp      energy
 S220965        <PATH1>/                      XYG3_Comp      energy
 S220966        <PATH1>/                      XYG3_Comp      energy
 S22101         <PATH1>/                      XYG3_Comp      energy
 S22102         <PATH1>/                      XYG3_Comp      energy
 S22103         <PATH1>/                      XYG3_Comp      energy
 S22104         <PATH1>/                      XYG3_Comp      energy
 S22105         <PATH1>/                      XYG3_Comp      energy
 S22106         <PATH1>/                      XYG3_Comp      energy
 S22107         <PATH1>/                      XYG3_Comp      energy
 S22108         <PATH1>/                      XYG3_Comp      energy
 S22109         <PATH1>/                      XYG3_Comp      energy
 S221010        <PATH1>/                      XYG3_Comp      energy
 S221011        <PATH1>/                      XYG3_Comp      energy
 S221012        <PATH1>/                      XYG3_Comp      energy
 S221013        <PATH1>/                      XYG3_Comp      energy
 S221014        <PATH1>/                      XYG3_Comp      energy
 S221015        <PATH1>/                      XYG3_Comp      energy
 S221016        <PATH1>/                      XYG3_Comp      energy
 S221017        <PATH1>/                      XYG3_Comp      energy
 S221018        <PATH1>/                      XYG3_Comp      energy
 S221019        <PATH1>/                      XYG3_Comp      energy
 S221020        <PATH1>/                      XYG3_Comp      energy
 S221021        <PATH1>/                      XYG3_Comp      energy
 S221022        <PATH1>/                      XYG3_Comp      energy
 S221023        <PATH1>/                      XYG3_Comp      energy
 S221024        <PATH1>/                      XYG3_Comp      energy
 S221025        <PATH1>/                      XYG3_Comp      energy
 S221026        <PATH1>/                      XYG3_Comp      energy
 S221027        <PATH1>/                      XYG3_Comp      energy
 S221028        <PATH1>/                      XYG3_Comp      energy
 S221029        <PATH1>/                      XYG3_Comp      energy
 S221030        <PATH1>/                      XYG3_Comp      energy
 S221031        <PATH1>/                      XYG3_Comp      energy
 S221032        <PATH1>/                      XYG3_Comp      energy
 S221033        <PATH1>/                      XYG3_Comp      energy
 S221034        <PATH1>/                      XYG3_Comp      energy
 S221035        <PATH1>/                      XYG3_Comp      energy
 S221036        <PATH1>/                      XYG3_Comp      energy
 S221037        <PATH1>/                      XYG3_Comp      energy
 S221038        <PATH1>/                      XYG3_Comp      energy
 S221039        <PATH1>/                      XYG3_Comp      energy
 S221040        <PATH1>/                      XYG3_Comp      energy
 S221041        <PATH1>/                      XYG3_Comp      energy
 S221042        <PATH1>/                      XYG3_Comp      energy
 S221043        <PATH1>/                      XYG3_Comp      energy
 S221044        <PATH1>/                      XYG3_Comp      energy
 S221045        <PATH1>/                      XYG3_Comp      energy
 S221046        <PATH1>/                      XYG3_Comp      energy
 S221047        <PATH1>/                      XYG3_Comp      energy
 S221048        <PATH1>/                      XYG3_Comp      energy
 S221049        <PATH1>/                      XYG3_Comp      energy
 S221050        <PATH1>/                      XYG3_Comp      energy
 S221051        <PATH1>/                      XYG3_Comp      energy
 S221052        <PATH1>/                      XYG3_Comp      energy
 S221053        <PATH1>/                      XYG3_Comp      energy
 S221054        <PATH1>/                      XYG3_Comp      energy
 S221055        <PATH1>/                      XYG3_Comp      energy
 S221056        <PATH1>/                      XYG3_Comp      energy
 S221057        <PATH1>/                      XYG3_Comp      energy
 S221058        <PATH1>/                      XYG3_Comp      energy
 S221059        <PATH1>/                      XYG3_Comp      energy
 S221060        <PATH1>/                      XYG3_Comp      energy
 S221061        <PATH1>/                      XYG3_Comp      energy
 S221062        <PATH1>/                      XYG3_Comp      energy
 S221063        <PATH1>/                      XYG3_Comp      energy
 S221064        <PATH1>/                      XYG3_Comp      energy
 S221065        <PATH1>/                      XYG3_Comp      energy
 S221066        <PATH1>/                      XYG3_Comp      energy
 S22121         <PATH1>/                      XYG3_Comp      energy
 S22122         <PATH1>/                      XYG3_Comp      energy
 S22123         <PATH1>/                      XYG3_Comp      energy
 S22124         <PATH1>/                      XYG3_Comp      energy
 S22125         <PATH1>/                      XYG3_Comp      energy
 S22126         <PATH1>/                      XYG3_Comp      energy
 S22127         <PATH1>/                      XYG3_Comp      energy
 S22128         <PATH1>/                      XYG3_Comp      energy
 S22129         <PATH1>/                      XYG3_Comp      energy
 S221210        <PATH1>/                      XYG3_Comp      energy
 S221211        <PATH1>/                      XYG3_Comp      energy
 S221212        <PATH1>/                      XYG3_Comp      energy
 S221213        <PATH1>/                      XYG3_Comp      energy
 S221214        <PATH1>/                      XYG3_Comp      energy
 S221215        <PATH1>/                      XYG3_Comp      energy
 S221216        <PATH1>/                      XYG3_Comp      energy
 S221217        <PATH1>/                      XYG3_Comp      energy
 S221218        <PATH1>/                      XYG3_Comp      energy
 S221219        <PATH1>/                      XYG3_Comp      energy
 S221220        <PATH1>/                      XYG3_Comp      energy
 S221221        <PATH1>/                      XYG3_Comp      energy
 S221222        <PATH1>/                      XYG3_Comp      energy
 S221223        <PATH1>/                      XYG3_Comp      energy
 S221224        <PATH1>/                      XYG3_Comp      energy
 S221225        <PATH1>/                      XYG3_Comp      energy
 S221226        <PATH1>/                      XYG3_Comp      energy
 S221227        <PATH1>/                      XYG3_Comp      energy
 S221228        <PATH1>/                      XYG3_Comp      energy
 S221229        <PATH1>/                      XYG3_Comp      energy
 S221230        <PATH1>/                      XYG3_Comp      energy
 S221231        <PATH1>/                      XYG3_Comp      energy
 S221232        <PATH1>/                      XYG3_Comp      energy
 S221233        <PATH1>/                      XYG3_Comp      energy
 S221234        <PATH1>/                      XYG3_Comp      energy
 S221235        <PATH1>/                      XYG3_Comp      energy
 S221236        <PATH1>/                      XYG3_Comp      energy
 S221237        <PATH1>/                      XYG3_Comp      energy
 S221238        <PATH1>/                      XYG3_Comp      energy
 S221239        <PATH1>/                      XYG3_Comp      energy
 S221240        <PATH1>/                      XYG3_Comp      energy
 S221241        <PATH1>/                      XYG3_Comp      energy
 S221242        <PATH1>/                      XYG3_Comp      energy
 S221243        <PATH1>/                      XYG3_Comp      energy
 S221244        <PATH1>/                      XYG3_Comp      energy
 S221245        <PATH1>/                      XYG3_Comp      energy
 S221246        <PATH1>/                      XYG3_Comp      energy
 S221247        <PATH1>/                      XYG3_Comp      energy
 S221248        <PATH1>/                      XYG3_Comp      energy
 S221249        <PATH1>/                      XYG3_Comp      energy
 S221250        <PATH1>/                      XYG3_Comp      energy
 S221251        <PATH1>/                      XYG3_Comp      energy
 S221252        <PATH1>/                      XYG3_Comp      energy
 S221253        <PATH1>/                      XYG3_Comp      energy
 S221254        <PATH1>/                      XYG3_Comp      energy
 S221255        <PATH1>/                      XYG3_Comp      energy
 S221256        <PATH1>/                      XYG3_Comp      energy
 S221257        <PATH1>/                      XYG3_Comp      energy
 S221258        <PATH1>/                      XYG3_Comp      energy
 S221259        <PATH1>/                      XYG3_Comp      energy
 S221260        <PATH1>/                      XYG3_Comp      energy
 S221261        <PATH1>/                      XYG3_Comp      energy
 S221262        <PATH1>/                      XYG3_Comp      energy
 S221263        <PATH1>/                      XYG3_Comp      energy
 S221264        <PATH1>/                      XYG3_Comp      energy
 S221265        <PATH1>/                      XYG3_Comp      energy
 S221266        <PATH1>/                      XYG3_Comp      energy
 S22151         <PATH1>/                      XYG3_Comp      energy
 S22152         <PATH1>/                      XYG3_Comp      energy
 S22153         <PATH1>/                      XYG3_Comp      energy
 S22154         <PATH1>/                      XYG3_Comp      energy
 S22155         <PATH1>/                      XYG3_Comp      energy
 S22156         <PATH1>/                      XYG3_Comp      energy
 S22157         <PATH1>/                      XYG3_Comp      energy
 S22158         <PATH1>/                      XYG3_Comp      energy
 S22159         <PATH1>/                      XYG3_Comp      energy
 S221510        <PATH1>/                      XYG3_Comp      energy
 S221511        <PATH1>/                      XYG3_Comp      energy
 S221512        <PATH1>/                      XYG3_Comp      energy
 S221513        <PATH1>/                      XYG3_Comp      energy
 S221514        <PATH1>/                      XYG3_Comp      energy
 S221515        <PATH1>/                      XYG3_Comp      energy
 S221516        <PATH1>/                      XYG3_Comp      energy
 S221517        <PATH1>/                      XYG3_Comp      energy
 S221518        <PATH1>/                      XYG3_Comp      energy
 S221519        <PATH1>/                      XYG3_Comp      energy
 S221520        <PATH1>/                      XYG3_Comp      energy
 S221521        <PATH1>/                      XYG3_Comp      energy
 S221522        <PATH1>/                      XYG3_Comp      energy
 S221523        <PATH1>/                      XYG3_Comp      energy
 S221524        <PATH1>/                      XYG3_Comp      energy
 S221525        <PATH1>/                      XYG3_Comp      energy
 S221526        <PATH1>/                      XYG3_Comp      energy
 S221527        <PATH1>/                      XYG3_Comp      energy
 S221528        <PATH1>/                      XYG3_Comp      energy
 S221529        <PATH1>/                      XYG3_Comp      energy
 S221530        <PATH1>/                      XYG3_Comp      energy
 S221531        <PATH1>/                      XYG3_Comp      energy
 S221532        <PATH1>/                      XYG3_Comp      energy
 S221533        <PATH1>/                      XYG3_Comp      energy
 S221534        <PATH1>/                      XYG3_Comp      energy
 S221535        <PATH1>/                      XYG3_Comp      energy
 S221536        <PATH1>/                      XYG3_Comp      energy
 S221537        <PATH1>/                      XYG3_Comp      energy
 S221538        <PATH1>/                      XYG3_Comp      energy
 S221539        <PATH1>/                      XYG3_Comp      energy
 S221540        <PATH1>/                      XYG3_Comp      energy
 S221541        <PATH1>/                      XYG3_Comp      energy
 S221542        <PATH1>/                      XYG3_Comp      energy
 S221543        <PATH1>/                      XYG3_Comp      energy
 S221544        <PATH1>/                      XYG3_Comp      energy
 S221545        <PATH1>/                      XYG3_Comp      energy
 S221546        <PATH1>/                      XYG3_Comp      energy
 S221547        <PATH1>/                      XYG3_Comp      energy
 S221548        <PATH1>/                      XYG3_Comp      energy
 S221549        <PATH1>/                      XYG3_Comp      energy
 S221550        <PATH1>/                      XYG3_Comp      energy
 S221551        <PATH1>/                      XYG3_Comp      energy
 S221552        <PATH1>/                      XYG3_Comp      energy
 S221553        <PATH1>/                      XYG3_Comp      energy
 S221554        <PATH1>/                      XYG3_Comp      energy
 S221555        <PATH1>/                      XYG3_Comp      energy
 S221556        <PATH1>/                      XYG3_Comp      energy
 S221557        <PATH1>/                      XYG3_Comp      energy
 S221558        <PATH1>/                      XYG3_Comp      energy
 S221559        <PATH1>/                      XYG3_Comp      energy
 S221560        <PATH1>/                      XYG3_Comp      energy
 S221561        <PATH1>/                      XYG3_Comp      energy
 S221562        <PATH1>/                      XYG3_Comp      energy
 S221563        <PATH1>/                      XYG3_Comp      energy
 S221564        <PATH1>/                      XYG3_Comp      energy
 S221565        <PATH1>/                      XYG3_Comp      energy
 S221566        <PATH1>/                      XYG3_Comp      energy
 S22201         <PATH1>/                      XYG3_Comp      energy
 S22202         <PATH1>/                      XYG3_Comp      energy
 S22203         <PATH1>/                      XYG3_Comp      energy
 S22204         <PATH1>/                      XYG3_Comp      energy
 S22205         <PATH1>/                      XYG3_Comp      energy
 S22206         <PATH1>/                      XYG3_Comp      energy
 S22207         <PATH1>/                      XYG3_Comp      energy
 S22208         <PATH1>/                      XYG3_Comp      energy
 S22209         <PATH1>/                      XYG3_Comp      energy
 S222010        <PATH1>/                      XYG3_Comp      energy
 S222011        <PATH1>/                      XYG3_Comp      energy
 S222012        <PATH1>/                      XYG3_Comp      energy
 S222013        <PATH1>/                      XYG3_Comp      energy
 S222014        <PATH1>/                      XYG3_Comp      energy
 S222015        <PATH1>/                      XYG3_Comp      energy
 S222016        <PATH1>/                      XYG3_Comp      energy
 S222017        <PATH1>/                      XYG3_Comp      energy
 S222018        <PATH1>/                      XYG3_Comp      energy
 S222019        <PATH1>/                      XYG3_Comp      energy
 S222020        <PATH1>/                      XYG3_Comp      energy
 S222021        <PATH1>/                      XYG3_Comp      energy
 S222022        <PATH1>/                      XYG3_Comp      energy
 S222023        <PATH1>/                      XYG3_Comp      energy
 S222024        <PATH1>/                      XYG3_Comp      energy
 S222025        <PATH1>/                      XYG3_Comp      energy
 S222026        <PATH1>/                      XYG3_Comp      energy
 S222027        <PATH1>/                      XYG3_Comp      energy
 S222028        <PATH1>/                      XYG3_Comp      energy
 S222029        <PATH1>/                      XYG3_Comp      energy
 S222030        <PATH1>/                      XYG3_Comp      energy
 S222031        <PATH1>/                      XYG3_Comp      energy
 S222032        <PATH1>/                      XYG3_Comp      energy
 S222033        <PATH1>/                      XYG3_Comp      energy
 S222034        <PATH1>/                      XYG3_Comp      energy
 S222035        <PATH1>/                      XYG3_Comp      energy
 S222036        <PATH1>/                      XYG3_Comp      energy
 S222037        <PATH1>/                      XYG3_Comp      energy
 S222038        <PATH1>/                      XYG3_Comp      energy
 S222039        <PATH1>/                      XYG3_Comp      energy
 S222040        <PATH1>/                      XYG3_Comp      energy
 S222041        <PATH1>/                      XYG3_Comp      energy
 S222042        <PATH1>/                      XYG3_Comp      energy
 S222043        <PATH1>/                      XYG3_Comp      energy
 S222044        <PATH1>/                      XYG3_Comp      energy
 S222045        <PATH1>/                      XYG3_Comp      energy
 S222046        <PATH1>/                      XYG3_Comp      energy
 S222047        <PATH1>/                      XYG3_Comp      energy
 S222048        <PATH1>/                      XYG3_Comp      energy
 S222049        <PATH1>/                      XYG3_Comp      energy
 S222050        <PATH1>/                      XYG3_Comp      energy
 S222051        <PATH1>/                      XYG3_Comp      energy
 S222052        <PATH1>/                      XYG3_Comp      energy
 S222053        <PATH1>/                      XYG3_Comp      energy
 S222054        <PATH1>/                      XYG3_Comp      energy
 S222055        <PATH1>/                      XYG3_Comp      energy
 S222056        <PATH1>/                      XYG3_Comp      energy
 S222057        <PATH1>/                      XYG3_Comp      energy
 S222058        <PATH1>/                      XYG3_Comp      energy
 S222059        <PATH1>/                      XYG3_Comp      energy
 S222060        <PATH1>/                      XYG3_Comp      energy
 S222061        <PATH1>/                      XYG3_Comp      energy
 S222062        <PATH1>/                      XYG3_Comp      energy
 S222063        <PATH1>/                      XYG3_Comp      energy
 S222064        <PATH1>/                      XYG3_Comp      energy
 S222065        <PATH1>/                      XYG3_Comp      energy
 S222066        <PATH1>/                      XYG3_Comp      energy


# Training set for the atomization energy
#              110 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
__energy__ :: 110  1.0
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
# 110 Non-Bond interactions in S22 set
#   22 for S22_0.9 set
 3         S22091  -1   S220923    1  S220945   1         0.00384058   1.0
 3         S22092  -1   S220924    1  S220946   1         0.00688276   1.0
 3         S22093  -1   S220925    1  S220947   1         0.02603464   1.0
 3         S22094  -1   S220926    1  S220948   1         0.02253510   1.0
 3         S22095  -1   S220927    1  S220949   1         0.02984654   1.0
 3         S22096  -1   S220928    1  S220950   1         0.02410480   1.0
 3         S22097  -1   S220929    1  S220951   1         0.02393747   1.0
 3         S22098  -1   S220930    1  S220952   1         0.00053704   1.0
 3         S22099  -1   S220931    1  S220953   1         0.00108524   1.0
 3         S220910 -1   S220932    1  S220954   1         0.00173384   1.0
 3         S220911 -1   S220933    1  S220955   1         0.00023585   1.0
 3         S220912 -1   S220934    1  S220956   1         0.00268681   1.0
 3         S220913 -1   S220935    1  S220957   1         0.01077752   1.0
 3         S220914 -1   S220936    1  S220958   1         0.00227725   1.0
 3         S220915 -1   S220937    1  S220959   1         0.01273446   1.0
 3         S220916 -1   S220938    1  S220960   1         0.00187089   1.0
 3         S220917 -1   S220939    1  S220961   1         0.00479196   1.0
 3         S220918 -1   S220940    1  S220962   1         0.00325094   1.0
 3         S220919 -1   S220941    1  S220963   1         0.00640309   1.0
 3         S220920 -1   S220942    1  S220964   1         0.00351229   1.0
 3         S220921 -1   S220943    1  S220965   1         0.00796003   1.0
 3         S220922 -1   S220944    1  S220966   1         0.01023410   1.0
# 22 for S22_1.0 set
 3         S22101  -1   S221023    1  S221045   1         0.00505171   1.0
 3         S22102  -1   S221024    1  S221046   1         0.00799987   1.0
 3         S22103  -1   S221025    1  S221047   1         0.02965690   1.0
 3         S22104  -1   S221026    1  S221048   1         0.02543386   1.0
 3         S22105  -1   S221027    1  S221049   1         0.03290784   1.0
 3         S22106  -1   S221028    1  S221050   1         0.02662906   1.0
 3         S22107  -1   S221029    1  S221051   1         0.02608723   1.0
 3         S22108  -1   S221030    1  S221052   1         0.00084461   1.0
 3         S22109  -1   S221031    1  S221053   1         0.00240634   1.0
 3         S221010 -1   S221032    1  S221054   1         0.00239040   1.0
 3         S221011 -1   S221033    1  S221055   1         0.00435053   1.0
 3         S221012 -1   S221034    1  S221056   1         0.00704371   1.0
 3         S221013 -1   S221035    1  S221057   1         0.01612723   1.0
 3         S221014 -1   S221036    1  S221058   1         0.00831859   1.0
 3         S221015 -1   S221037    1  S221059   1         0.01948973   1.0
 3         S221016 -1   S221038    1  S221060   1         0.00243821   1.0
 3         S221017 -1   S221039    1  S221061   1         0.00522701   1.0
 3         S221018 -1   S221040    1  S221062   1         0.00374496   1.0
 3         S221019 -1   S221041    1  S221063   1         0.00710746   1.0
 3         S221020 -1   S221042    1  S221064   1         0.00436646   1.0
 3         S221021 -1   S221043    1  S221065   1         0.00913133   1.0
 3         S221022 -1   S221044    1  S221066   1         0.01123488   1.0
# 22 for S22_1.2 set
 3         S22121  -1   S221223    1  S221245   1         0.00376568   1.0
 3         S22122  -1   S221224    1  S221246   1         0.00644452   1.0
 3         S22123  -1   S221225    1  S221247   1         0.02489841   1.0
 3         S22124  -1   S221226    1  S221248   1         0.02134787   1.0
 3         S22125  -1   S221227    1  S221249   1         0.02734299   1.0
 3         S22126  -1   S221228    1  S221250   1         0.02219407   1.0
 3         S22127  -1   S221229    1  S221251   1         0.02119647   1.0
 3         S22128  -1   S221230    1  S221252   1         0.00039681   1.0
 3         S22129  -1   S221231    1  S221253   1         0.00129082   1.0
 3         S221210 -1   S221232    1  S221254   1         0.00179758   1.0
 3         S221211 -1   S221233    1  S221255   1         0.00305493   1.0
 3         S221212 -1   S221234    1  S221256   1         0.00481427   1.0
 3         S221213 -1   S221235    1  S221257   1         0.00997275   1.0
 3         S221214 -1   S221236    1  S221258   1         0.00527800   1.0
 3         S221215 -1   S221237    1  S221259   1         0.01311852   1.0
 3         S221216 -1   S221238    1  S221260   1         0.00172746   1.0
 3         S221217 -1   S221239    1  S221261   1         0.00393779   1.0
 3         S221218 -1   S221240    1  S221262   1         0.00278243   1.0
 3         S221219 -1   S221241    1  S221263   1         0.00585967   1.0
 3         S221220 -1   S221242    1  S221264   1         0.00357923   1.0
 3         S221221 -1   S221243    1  S221265   1         0.00777199   1.0
 3         S221222 -1   S221244    1  S221266   1         0.00922216   1.0
# 22 for S22_1.5 set
 3         S22151  -1   S221523    1  S221545   1         0.00177368   1.0
 3         S22152  -1   S221524    1  S221546   1         0.00365572   1.0
 3         S22153  -1   S221525    1  S221547   1         0.01471849   1.0
 3         S22154  -1   S221526    1  S221548   1         0.01291454   1.0
 3         S22155  -1   S221527    1  S221549   1         0.01667224   1.0
 3         S22156  -1   S221528    1  S221550   1         0.01302768   1.0
 3         S22157  -1   S221529    1  S221551   1         0.01184682   1.0
 3         S22158  -1   S221530    1  S221552   1         0.00009880   1.0
 3         S22159  -1   S221531    1  S221553   1         0.00032350   1.0
 3         S221510 -1   S221532    1  S221554   1         0.00077130   1.0
 3         S221511 -1   S221533    1  S221555   1         0.00084301   1.0
 3         S221512 -1   S221534    1  S221556   1         0.00156492   1.0
 3         S221513 -1   S221535    1  S221557   1         0.00385811   1.0
 3         S221514 -1   S221536    1  S221558   1         0.00155854   1.0
 3         S221515 -1   S221537    1  S221559   1         0.00517283   1.0
 3         S221516 -1   S221538    1  S221560   1         0.00077768   1.0
 3         S221517 -1   S221539    1  S221561   1         0.00206849   1.0
 3         S221518 -1   S221540    1  S221562   1         0.00135137   1.0
 3         S221519 -1   S221541    1  S221563   1         0.00332903   1.0
 3         S221520 -1   S221542    1  S221564   1         0.00177686   1.0
 3         S221521 -1   S221543    1  S221565   1         0.00446527   1.0
 3         S221522 -1   S221544    1  S221566   1         0.00542940   1.0
# 22 for S22_2.0 set
 3         S22201  -1   S222023    1  S222045   1         0.00056573   1.0
 3         S22202  -1   S222024    1  S222046   1         0.00153145   1.0
 3         S22203  -1   S222025    1  S222047   1         0.00579274   1.0
 3         S22204  -1   S222026    1  S222048   1         0.00559991   1.0
 3         S22205  -1   S222027    1  S222049   1         0.00730666   1.0
 3         S22206  -1   S222028    1  S222050   1         0.00519195   1.0
 3         S22207  -1   S222029    1  S222051   1         0.00413061   1.0
 3         S22208  -1   S222030    1  S222052   1         0.00001594   1.0
 3         S22209  -1   S222031    1  S222053   1         0.00004621   1.0
 3         S222010 -1   S222032    1  S222054   1         0.00019442   1.0
 3         S222011 -1   S222033    1  S222055   1         0.00011633   1.0
 3         S222012 -1   S222034    1  S222056   1         0.00029960   1.0
 3         S222013 -1   S222035    1  S222057   1         0.00110755   1.0
 3         S222014 -1   S222036    1  S222058   1         0.00013705   1.0
 3         S222015 -1   S222037    1  S222059   1         0.00147089   1.0
 3         S222016 -1   S222038    1  S222060   1         0.00023426   1.0
 3         S222017 -1   S222039    1  S222061   1         0.00078724   1.0
 3         S222018 -1   S222040    1  S222062   1         0.00044143   1.0
 3         S222019 -1   S222041    1  S222063   1         0.00135297   1.0
 3         S222020 -1   S222042    1  S222064   1         0.00056254   1.0
 3         S222021 -1   S222043    1  S222065   1         0.00176093   1.0
 3         S222022 -1   S222044    1  S222066   1         0.00219757   1.0

__xyg3 components__ ::  330
#        E_noXC        E_K           Ex_LDA       dEx_Becke    Ec_VWN       dEc_LYP     PT2_1ST      PT2_aaaa     PT2_abab     PT2_bbbb
S22091   -97.09464730  -15.32700986  -13.85810400  -1.52583516  -1.63817900  0.99694145  0.00000000  -0.07973535  -0.54418120  -0.07973535
S22092  -134.23697186  -17.86621372  -16.24661600  -1.72637871  -1.71816900  1.03151117  0.00000000  -0.09518399  -0.58263812  -0.09518399
S22093  -332.93417571  -44.70000757  -40.67005800  -4.31918692  -4.19919400  2.49009862  0.00000000  -0.25560205  -1.46801820  -0.25560205
S22094  -295.77067301  -42.18640969  -38.30698000  -4.11795341  -4.12102400  2.45618450  0.00000000  -0.24034314  -1.42657027  -0.24034314
S22095  -721.27350331 -103.83583731  -94.28931400 -10.10258675 -10.04456600  5.94503216  0.00000000  -0.61468982  -3.47943312  -0.61468982
S22096  -539.51089622  -83.90379598  -75.96902900  -8.28086451  -8.47876700  5.05262862  0.00000000  -0.49447550  -2.87745217  -0.49447550
S22097  -797.51353454 -118.68138128 -107.67398900 -11.58480242 -11.68698500  6.92269406  0.00000000  -0.71506266  -4.04034528  -0.71506266
S22098   -67.23766333  -13.17059748  -11.79971100  -1.36527843  -1.56595900  0.97370641  0.00000000  -0.05656506  -0.48113717  -0.05656506
S22099  -132.60432667  -23.48683404  -21.11567400  -2.41568010  -2.58890100  1.58499699  0.00000000  -0.11379688  -0.83897877  -0.11379688
S220910 -231.09077855  -39.84713408  -35.90339200  -4.02370369  -4.27744500  2.58715987  0.00000000  -0.21710851  -1.38587925  -0.21710851
S220911 -394.92945525  -66.52345056  -60.01767800  -6.66980072  -6.99110900  4.19775440  0.00000000  -0.38341891  -2.30676741  -0.38341891
S220912 -454.71102753  -70.71604320  -64.00610600  -7.02435527  -7.12705300  4.25122907  0.00000000  -0.42657404  -2.45560538  -0.42657404
S220913 -721.25346893 -103.82499660  -94.28317000 -10.08974421 -10.04567200  5.94153754  0.00000000  -0.62172160  -3.50331245  -0.62172160
S220914 -508.31138640  -83.92159659  -75.81237100  -8.34695005  -8.71460100  5.20853439  0.00000000  -0.49875414  -2.91511126  -0.49875414
S220915 -797.47663140 -118.68498921 -107.68863100 -11.55881638 -11.69055800  6.91565798  0.00000000  -0.72744996  -4.07195318  -0.72744996
S220916 -132.16291178  -22.71968017  -20.43262100  -2.35905103  -2.44612200  1.49928079  0.00000000  -0.11606663  -0.81724013  -0.11606663
S220917 -264.60114585  -42.18476209  -38.11572500  -4.20567594  -4.35276500  2.61639506  0.00000000  -0.23603460  -1.43672455  -0.23603460
S220918 -246.02642934  -40.91907299  -36.92440800  -4.10598346  -4.31285100  2.59931942  0.00000000  -0.22821635  -1.41692698  -0.22821635
S220919 -278.33678107  -45.29139013  -40.87549000  -4.57842130  -4.68128800  2.81992004  0.00000000  -0.26013319  -1.58544295  -0.26013319
S220920 -394.95479553  -66.51287492  -59.99674000  -6.68250776  -6.98814500  4.20048696  0.00000000  -0.37793702  -2.29213580  -0.37793702
S220921 -508.34388099  -83.90938544  -75.78726400  -8.36346099  -8.71105700  5.21227150  0.00000000  -0.49104000  -2.89532656  -0.49104000
S220922 -528.22042961  -83.00927604  -75.08414600  -8.21784954  -8.44432800  5.04444706  0.00000000  -0.47780232  -2.81419853  -0.47780232
S220923  -48.55409721   -7.65733106   -6.91897500  -0.76827471  -0.81786300  0.49990738  0.00000000  -0.03898882  -0.27045821  -0.03898882
S220924  -67.12769987   -8.92223728   -8.10862700  -0.86896982  -0.85758500  0.51729360  0.00000000  -0.04680223  -0.29048019  -0.04680223
S220925 -166.50579610  -22.30264562  -20.27893600  -2.17511825  -2.09448500  1.24851043  0.00000000  -0.12598930  -0.73493981  -0.12598930
S220926 -147.91433291  -21.05792320  -19.11028900  -2.07230611  -2.05635000  1.23122020  0.00000000  -0.11842748  -0.71259928  -0.11842748
S220927 -360.66505465  -51.88018387  -47.09871800  -5.06558304  -5.01797200  2.97597573  0.00000000  -0.30473315  -1.73956342  -0.30473315
S220928 -279.07696166  -42.54215373  -38.53006300  -4.20703302  -4.25448600  2.53867781  0.00000000  -0.24754311  -1.45095300  -0.24754311
S220929 -403.78069892  -60.81772736  -55.15515500  -5.96409486  -6.00698500  3.56081061  0.00000000  -0.37179235  -2.08122986  -0.37179235
S220930  -33.62200142   -6.58327344   -5.89638200  -0.68552035  -0.78240600  0.48760726  0.00000000  -0.02786166  -0.23955943  -0.02786166
S220931  -66.31125265  -11.73722734  -10.54775100  -1.21455442  -1.29301900  0.79422256  0.00000000  -0.05566006  -0.41695791  -0.05566006
S220932 -197.48604269  -33.25055729  -29.98820000  -3.34871875  -3.49253500  2.10200367  0.00000000  -0.18675833  -1.14096097  -0.18675833
S220933 -197.48623314  -33.25034925  -29.98803000  -3.34869938  -3.49252300  2.10199654  0.00000000  -0.18675925  -1.14096943  -0.18675925
S220934 -227.38013351  -35.34348978  -31.97823700  -3.52725686  -3.56021900  2.12920859  0.00000000  -0.20799748  -1.21465243  -0.20799748
S220935 -360.65854297  -51.88807875  -47.10514400  -5.06610213  -5.01833000  2.97621187  0.00000000  -0.30448785  -1.73845539  -0.30448785
S220936 -197.48746124  -33.24905141  -29.98687100  -3.34874457  -3.49246100  2.10199628  0.00000000  -0.18677667  -1.14110630  -0.18677667
S220937 -403.77933646  -60.81876759  -55.15506400  -5.96518456  -6.00701000  3.56104305  0.00000000  -0.37187912  -2.08163161  -0.37187912
S220938  -66.31125611  -11.73721446  -10.54773100  -1.21456689  -1.29301800  0.79422415  0.00000000  -0.05566336  -0.41698229  -0.05566336
S220939 -197.48791383  -33.24859239  -29.98636100  -3.34883707  -3.49242000  2.10200122  0.00000000  -0.18678238  -1.14117033  -0.18678238
S220940 -197.48691499  -33.24964132  -29.98734000  -3.34877843  -3.49248100  2.10200233  0.00000000  -0.18676961  -1.14105817  -0.18676961
S220941 -197.48891530  -33.24754305  -29.98538100  -3.34889325  -3.49235800  2.10199705  0.00000000  -0.18679536  -1.14128213  -0.18679536
S220942 -197.48697443  -33.24957964  -29.98731000  -3.34874423  -3.49247800  2.10199530  0.00000000  -0.18676856  -1.14105113  -0.18676856
S220943 -197.48977823  -33.24663197  -29.98454300  -3.34892812  -3.49230400  2.10199098  0.00000000  -0.18680602  -1.14137481  -0.18680602
S220944 -264.12575818  -41.48938019  -37.52097900  -4.11910401  -4.21972000  2.52487265  0.00000000  -0.23640226  -1.40210885  -0.23640226
S220945  -48.55409721   -7.65733106   -6.91897500  -0.76827471  -0.81786300  0.49990738  0.00000000  -0.03898882  -0.27045821  -0.03898882
S220946  -67.12623102   -8.92388224   -8.10999500  -0.86898385  -0.85766500  0.51732091  0.00000000  -0.04676695  -0.29023710  -0.04676695
S220947 -166.50579610  -22.30264562  -20.27893600  -2.17511825  -2.09448500  1.24851043  0.00000000  -0.12598930  -0.73493981  -0.12598930
S220948 -147.91433289  -21.05792328  -19.11028900  -2.07230611  -2.05635000  1.23122020  0.00000000  -0.11842748  -0.71259928  -0.11842748
S220949 -360.66505465  -51.88018387  -47.09871800  -5.06558304  -5.01797200  2.97597573  0.00000000  -0.30473315  -1.73956342  -0.30473315
S220950 -260.49006435  -41.29651862  -37.35284800  -4.10245935  -4.21570300  2.52057878  0.00000000  -0.24027205  -1.41725333  -0.24027205
S220951 -393.79380965  -57.79424070  -52.42915400  -5.65049909  -5.67099000  3.36886563  0.00000000  -0.33680923  -1.94987705  -0.33680923
S220952  -33.62200142   -6.58327344   -5.89638200  -0.68552035  -0.78240600  0.48760726  0.00000000  -0.02786166  -0.23955943  -0.02786166
S220953  -66.31125265  -11.73722734  -10.54775100  -1.21455442  -1.29301900  0.79422256  0.00000000  -0.05566006  -0.41695791  -0.05566006
S220954  -33.61754759   -6.58783962   -5.90044500  -0.68562110  -0.78268400  0.48769442  0.00000000  -0.02786089  -0.23930860  -0.02786089
S220955 -197.48623314  -33.25034928  -29.98803000  -3.34869938  -3.49252300  2.10199654  0.00000000  -0.18675925  -1.14096943  -0.18675925
S220956 -227.38049191  -35.34309690  -31.97788600  -3.52727428  -3.56019700  2.12920595  0.00000000  -0.20800696  -1.21471376  -0.20800696
S220957 -360.65854297  -51.88807874  -47.10514400  -5.06610213  -5.01833000  2.97621187  0.00000000  -0.30448785  -1.73845539  -0.30448785
S220958 -310.87886226  -50.64301322  -45.77081100  -5.03515163  -5.21433500  3.11517104  0.00000000  -0.29807261  -1.74018938  -0.29807261
S220959 -393.78225406  -57.80783410  -52.44030000  -5.65129983  -5.67165000  3.36926015  0.00000000  -0.33647343  -1.94817274  -0.33647343
S220960  -65.86091457  -10.97411796   -9.87277800  -1.15081051  -1.15147300  0.70650156  0.00000000  -0.05918109  -0.39839513  -0.05918109
S220961  -67.12744036   -8.92233631   -8.10876200  -0.86901036  -0.85760100  0.51730939  0.00000000  -0.04683094  -0.29064287  -0.04683094
S220962  -48.55253087   -7.65879635   -6.92027400  -0.76836382  -0.81795400  0.49995195  0.00000000  -0.03899114  -0.27047439  -0.03899114
S220963  -80.86693156  -12.02396092  -10.86325900  -1.24423654  -1.18552600  0.72133770  0.00000000  -0.07041004  -0.43958513  -0.07041004
S220964 -197.48729012  -33.24925272  -29.98699000  -3.34878028  -3.49245800  2.10199724  0.00000000  -0.18677326  -1.14109157  -0.18677326
S220965 -310.88125595  -50.64056840  -45.76861800  -5.03517705  -5.21419900  3.11514323  0.00000000  -0.29810997  -1.74041438  -0.29810997
S220966 -264.12635808  -41.48875900  -37.52007000  -4.11964684  -4.21968800  2.52496892  0.00000000  -0.23639529  -1.40235696  -0.23639529
S22101   -97.10441829  -15.32028660  -13.84848100  -1.52923560  -1.63719500  0.99780536  0.00000000  -0.07910590  -0.54300086  -0.07910590
S22102  -134.24805403  -17.85740388  -16.23557000  -1.72942296  -1.71720700  1.03223169  0.00000000  -0.09473243  -0.58219616  -0.09473243
S22103  -332.97408388  -44.66540946  -40.63204900  -4.32569717  -4.19630400  2.49115842  0.00000000  -0.25485299  -1.46907152  -0.25485299
S22104  -295.80233024  -42.16034342  -38.27668400  -4.12417938  -4.11856100  2.45738324  0.00000000  -0.23941928  -1.42634077  -0.23941928
S22105  -721.30763031 -103.80735128  -94.25649300 -10.10911172 -10.04197100  5.94626686  0.00000000  -0.61342309  -3.47946497  -0.61342309
S22106  -539.54256801  -83.87809046  -75.93838100  -8.28724586  -8.47622200  5.05382832  0.00000000  -0.49298694  -2.87596345  -0.49298694
S22107  -797.54628260 -118.65434728 -107.64208200 -11.59157203 -11.68430600  6.92402211  0.00000000  -0.71362528  -4.03893352  -0.71362528
S22108   -67.24203742  -13.16784033  -11.79545600  -1.36802868  -1.56535000  0.97451036  0.00000000  -0.05619740  -0.48024182  -0.05619740
S22109  -132.61641389  -23.47911868  -21.10420400  -2.42142296  -2.58749300  1.58649815  0.00000000  -0.11273710  -0.83674510  -0.11273710
S221010 -231.09748855  -39.84300198  -35.89710500  -4.02697972  -4.27664100  2.58798177  0.00000000  -0.21633152  -1.38406746  -0.21633152
S221011 -394.95636991  -66.50951428  -59.99481700  -6.68113694  -6.98826500  4.20040846  0.00000000  -0.37947401  -2.29668585  -0.37947401
S221012 -454.74235673  -70.69892177  -63.97910100  -7.03664755  -7.12395700  4.25416364  0.00000000  -0.42234518  -2.44493887  -0.42234518
S221013 -721.29695616 -103.79735912  -94.24363400 -10.10735090 -10.04138800  5.94597289  0.00000000  -0.61676834  -3.49282538  -0.61676834
S221014 -508.34492137  -83.90385151  -75.78375800  -8.36080175  -8.71117900  5.21180589  0.00000000  -0.49382812  -2.90303684  -0.49382812
S221015 -797.53192805 -118.65189778 -107.63968000 -11.58138325 -11.68519500  6.92124447  0.00000000  -0.72042447  -4.05667710  -0.72042447
S221016 -132.16855893  -22.71571300  -20.42705200  -2.36115499  -2.44546400  1.49977366  0.00000000  -0.11563039  -0.81637770  -0.11563039
S221017 -264.60921722  -42.17910792  -38.10752600  -4.20931663  -4.35180300  2.61728212  0.00000000  -0.23525791  -1.43500141  -0.23525791
S221018 -246.03351598  -40.91446181  -36.91749500  -4.10938854  -4.31199700  2.60015837  0.00000000  -0.22743535  -1.41509951  -0.22743535
S221019 -278.34668815  -45.28444062  -40.86585700  -4.58236901  -4.68019600  2.82082663  0.00000000  -0.25923324  -1.58374143  -0.25923324
S221020 -394.96438741  -66.50708399  -59.98798700  -6.68687398  -6.98707000  4.20153448  0.00000000  -0.37669166  -2.28923087  -0.37669166
S221021 -508.35758332  -83.90087348  -75.77477800  -8.36899937  -8.70962500  5.21359035  0.00000000  -0.48941343  -2.89156340  -0.48941343
S221022 -528.23546462  -82.99783706  -75.06937600  -8.22276212  -8.44292800  5.04563738  0.00000000  -0.47670011  -2.81225051  -0.47670011
S221023  -48.55409720   -7.65733107   -6.91897500  -0.76827471  -0.81786300  0.49990738  0.00000000  -0.03898882  -0.27045821  -0.03898882
S221024  -67.12623102   -8.92388226   -8.10999500  -0.86898385  -0.85766500  0.51732091  0.00000000  -0.04676695  -0.29023710  -0.04676695
S221025 -166.50579610  -22.30264561  -20.27893600  -2.17511825  -2.09448500  1.24851043  0.00000000  -0.12598930  -0.73493981  -0.12598930
S221026 -147.91433290  -21.05792322  -19.11028900  -2.07230611  -2.05635000  1.23122020  0.00000000  -0.11842748  -0.71259928  -0.11842748
S221027 -360.66505393  -51.88018566  -47.09871800  -5.06558361  -5.01797200  2.97597570  0.00000000  -0.30473312  -1.73956328  -0.30473312
S221028 -279.07696138  -42.54215521  -38.53006300  -4.20703301  -4.25448600  2.53867781  0.00000000  -0.24754309  -1.45095294  -0.24754309
S221029 -403.78069818  -60.81772922  -55.15515600  -5.96409429  -6.00698500  3.56081058  0.00000000  -0.37179233  -2.08122974  -0.37179233
S221030  -33.62200101   -6.58327715   -5.89638200  -0.68551990  -0.78240600  0.48760728  0.00000000  -0.02786167  -0.23955946  -0.02786167
S221031  -66.31125268  -11.73722719  -10.54775100  -1.21455443  -1.29301900  0.79422256  0.00000000  -0.05566006  -0.41695791  -0.05566006
S221032 -197.48604203  -33.25055843  -29.98820000  -3.34871932  -3.49253500  2.10200363  0.00000000  -0.18675833  -1.14096092  -0.18675833
S221033 -197.48623279  -33.25034892  -29.98803100  -3.34869882  -3.49252300  2.10199650  0.00000000  -0.18675924  -1.14096937  -0.18675924
S221034 -227.38013361  -35.34348927  -31.97823700  -3.52725687  -3.56021900  2.12920858  0.00000000  -0.20799747  -1.21465239  -0.20799747
S221035 -360.65854308  -51.88807922  -47.10514400  -5.06610184  -5.01833000  2.97621188  0.00000000  -0.30448787  -1.73845549  -0.30448787
S221036 -197.48746223  -33.24904860  -29.98687000  -3.34874508  -3.49246100  2.10199637  0.00000000  -0.18677667  -1.14110636  -0.18677667
S221037 -403.77933721  -60.81876590  -55.15506400  -5.96518399  -6.00701000  3.56104308  0.00000000  -0.37187913  -2.08163168  -0.37187913
S221038  -66.31125614  -11.73721431  -10.54773100  -1.21456689  -1.29301800  0.79422415  0.00000000  -0.05566336  -0.41698229  -0.05566336
S221039 -197.48789593  -33.24861445  -29.98635800  -3.34884937  -3.49241500  2.10200168  0.00000000  -0.18678109  -1.14116740  -0.18678109
S221040 -197.48691593  -33.24963878  -29.98734000  -3.34877786  -3.49248100  2.10200237  0.00000000  -0.18676962  -1.14105824  -0.18676962
S221041 -197.48891558  -33.24754130  -29.98538100  -3.34889334  -3.49235800  2.10199705  0.00000000  -0.18679536  -1.14128212  -0.18679536
S221042 -197.48697417  -33.24958030  -29.98731000  -3.34874439  -3.49247800  2.10199528  0.00000000  -0.18676856  -1.14105110  -0.18676856
S221043 -197.48977692  -33.24663565  -29.98454400  -3.34892776  -3.49230400  2.10199092  0.00000000  -0.18680601  -1.14137472  -0.18680601
S221044 -264.12575882  -41.48937058  -37.52098100  -4.11910350  -4.21972000  2.52487258  0.00000000  -0.23640222  -1.40210871  -0.23640222
S221045  -48.55409720   -7.65733107   -6.91897500  -0.76827471  -0.81786300  0.49990738  0.00000000  -0.03898882  -0.27045821  -0.03898882
S221046  -67.12623102   -8.92388225   -8.10999500  -0.86898385  -0.85766500  0.51732091  0.00000000  -0.04676695  -0.29023710  -0.04676695
S221047 -166.50579610  -22.30264561  -20.27893600  -2.17511825  -2.09448500  1.24851043  0.00000000  -0.12598930  -0.73493981  -0.12598930
S221048 -147.91433290  -21.05792322  -19.11028900  -2.07230611  -2.05635000  1.23122020  0.00000000  -0.11842748  -0.71259928  -0.11842748
S221049 -360.66505393  -51.88018566  -47.09871800  -5.06558361  -5.01797200  2.97597570  0.00000000  -0.30473312  -1.73956328  -0.30473312
S221050 -260.49006389  -41.29652166  -37.35284800  -4.10245912  -4.21570300  2.52057879  0.00000000  -0.24027207  -1.41725339  -0.24027207
S221051 -393.79380938  -57.79424372  -52.42915300  -5.65049970  -5.67099000  3.36886565  0.00000000  -0.33680925  -1.94987713  -0.33680925
S221052  -33.62200101   -6.58327715   -5.89638200  -0.68551990  -0.78240600  0.48760728  0.00000000  -0.02786167  -0.23955946  -0.02786167
S221053  -66.31125268  -11.73722719  -10.54775100  -1.21455443  -1.29301900  0.79422256  0.00000000  -0.05566006  -0.41695791  -0.05566006
S221054  -33.61754775   -6.58783930   -5.90044500  -0.68562098  -0.78268400  0.48769443  0.00000000  -0.02786089  -0.23930861  -0.02786089
S221055 -197.48623279  -33.25034893  -29.98803100  -3.34869882  -3.49252300  2.10199650  0.00000000  -0.18675924  -1.14096937  -0.18675924
S221056 -227.38049122  -35.34309949  -31.97788600  -3.52727452  -3.56019800  2.12920717  0.00000000  -0.20800695  -1.21471370  -0.20800695
S221057 -360.65854308  -51.88807922  -47.10514400  -5.06610184  -5.01833000  2.97621188  0.00000000  -0.30448787  -1.73845549  -0.30448787
S221058 -310.87886277  -50.64301171  -45.77081100  -5.03515135  -5.21433500  3.11517105  0.00000000  -0.29807261  -1.74018940  -0.29807261
S221059 -393.78225383  -57.80783417  -52.44030000  -5.65130009  -5.67165000  3.36926013  0.00000000  -0.33647342  -1.94817269  -0.33647342
S221060  -65.86091458  -10.97411792   -9.87277800  -1.15081052  -1.15147300  0.70650156  0.00000000  -0.05918109  -0.39839513  -0.05918109
S221061  -67.12744028   -8.92233542   -8.10876200  -0.86901060  -0.85760100  0.51730944  0.00000000  -0.04683094  -0.29064287  -0.04683094
S221062  -48.55253132   -7.65879490   -6.92027400  -0.76836361  -0.81795400  0.49995196  0.00000000  -0.03899114  -0.27047441  -0.03899114
S221063  -80.86693127  -12.02396135  -10.86326000  -1.24423574  -1.18552600  0.72133768  0.00000000  -0.07041001  -0.43958499  -0.07041001
S221064 -197.48729096  -33.24925254  -29.98698900  -3.34878034  -3.49245800  2.10199729  0.00000000  -0.18677326  -1.14109164  -0.18677326
S221065 -310.88125787  -50.64055027  -45.76862000  -5.03517716  -5.21419900  3.11514318  0.00000000  -0.29810977  -1.74041400  -0.29810977
S221066 -264.12635827  -41.48875881  -37.52007000  -4.11964666  -4.21968800  2.52496894  0.00000000  -0.23639529  -1.40235697  -0.23639529
S22121   -97.10996283  -15.31541456  -13.84058700  -1.53331349  -1.63623700  0.99896686  0.00000000  -0.07845521  -0.54178092  -0.07845521
S22122  -134.25601157  -17.84945004  -16.22466800  -1.73347752  -1.71610800  1.03332830  0.00000000  -0.09415155  -0.58146187  -0.09415155
S22123  -333.00894412  -44.62915726  -40.58980600  -4.33547395  -4.19268300  2.49315706  0.00000000  -0.25366285  -1.46960790  -0.25366285
S22124  -295.82873991  -42.13371780  -38.24420200  -4.13295217  -4.11556200  2.45938719  0.00000000  -0.23816816  -1.42553902  -0.23816816
S22125  -721.33543513 -103.77842734  -94.22129300 -10.11851993 -10.03882100  5.94841830  0.00000000  -0.61164792  -3.47884722  -0.61164792
S22126  -539.56943365  -83.85175717  -75.90492900  -8.29649781  -8.47308900  5.05588398  0.00000000  -0.49090209  -2.87330584  -0.49090209
S22127  -797.57408015 -118.62669266 -107.60746700 -11.60126824 -11.68102600  6.92623536  0.00000000  -0.71162504  -4.03638372  -0.71162504
S22128   -67.24370958  -13.16678583  -11.79326400  -1.37029039  -1.56494000  0.97513380  0.00000000  -0.05587641  -0.47946379  -0.05587641
S22129  -132.62181805  -23.47525823  -21.09717600  -2.42694776  -2.58639900  1.58803512  0.00000000  -0.11179091  -0.83485143  -0.11179091
S221210 -231.10231814  -39.83969779  -35.89143800  -4.03105361  -4.27579200  2.58902936  0.00000000  -0.21544476  -1.38209081  -0.21544476
S221211 -394.97056407  -66.50147878  -59.97957600  -6.69219418  -6.98593700  4.20308859  0.00000000  -0.37579122  -2.28758405  -0.37579122
S221212 -454.75887712  -70.68853902  -63.96081100  -7.04873575  -7.12138600  4.25725367  0.00000000  -0.41841929  -2.43527998  -0.41841929
S221213 -721.31752245 -103.78078464  -94.21761000 -10.12448533 -10.03796800  5.95074800  0.00000000  -0.61203151  -3.48284734  -0.61203151
S221214 -508.36403663  -83.89276334  -75.76292800  -8.37551555  -8.70812700  5.21549305  0.00000000  -0.48876549  -2.89090218  -0.48876549
S221215 -797.56081444 -118.63146674 -107.60543600 -11.60453712 -11.68062500  6.92758427  0.00000000  -0.71334235  -4.04107323  -0.71334235
S221216 -132.17216705  -22.71256070  -20.42236600  -2.36360124  -2.44482200  1.50037526  0.00000000  -0.11518004  -0.81564784  -0.11518004
S221217 -264.61500929  -42.17407515  -38.09977500  -4.21378686  -4.35076200  2.61844402  0.00000000  -0.23438273  -1.43315764  -0.23438273
S221218 -246.03851574  -40.91061324  -36.91117800  -4.11357687  -4.31108400  2.60123899  0.00000000  -0.22655318  -1.41313849  -0.22655318
S221219 -278.35463185  -45.27744944  -40.85591800  -4.58758242  -4.67893800  2.82211720  0.00000000  -0.25817624  -1.58189344  -0.25817624
S221220 -394.97202074  -66.50177846  -59.97942700  -6.69237464  -6.98587400  4.20291458  0.00000000  -0.37519725  -2.28584225  -0.37519725
S221221 -508.36902528  -83.89259660  -75.76186500  -8.37627694  -8.70794300  5.21541262  0.00000000  -0.48737792  -2.88695013  -0.48737792
S221222 -528.24837960  -82.98645588  -75.05360100  -8.22964482  -8.44121100  5.04748055  0.00000000  -0.47517398  -2.80931185  -0.47517398
S221223  -48.55409721   -7.65733106   -6.91897500  -0.76827471  -0.81786300  0.49990738  0.00000000  -0.03898882  -0.27045821  -0.03898882
S221224  -67.12769987   -8.92223728   -8.10862700  -0.86896982  -0.85758500  0.51729360  0.00000000  -0.04680223  -0.29048019  -0.04680223
S221225 -166.50579610  -22.30264562  -20.27893600  -2.17511825  -2.09448500  1.24851043  0.00000000  -0.12598930  -0.73493981  -0.12598930
S221226 -147.91433291  -21.05792320  -19.11028900  -2.07230611  -2.05635000  1.23122020  0.00000000  -0.11842748  -0.71259928  -0.11842748
S221227 -360.66505465  -51.88018387  -47.09871800  -5.06558304  -5.01797200  2.97597573  0.00000000  -0.30473315  -1.73956342  -0.30473315
S221228 -279.07696166  -42.54215373  -38.53006300  -4.20703302  -4.25448600  2.53867781  0.00000000  -0.24754311  -1.45095300  -0.24754311
S221229 -403.78069892  -60.81772736  -55.15515500  -5.96409486  -6.00698500  3.56081061  0.00000000  -0.37179235  -2.08122986  -0.37179235
S221230  -33.62200142   -6.58327344   -5.89638200  -0.68552035  -0.78240600  0.48760726  0.00000000  -0.02786166  -0.23955943  -0.02786166
S221231  -66.31125265  -11.73722734  -10.54775100  -1.21455442  -1.29301900  0.79422256  0.00000000  -0.05566006  -0.41695791  -0.05566006
S221232 -197.48604269  -33.25055729  -29.98820000  -3.34871875  -3.49253500  2.10200367  0.00000000  -0.18675833  -1.14096097  -0.18675833
S221233 -197.48623314  -33.25034925  -29.98803000  -3.34869938  -3.49252300  2.10199654  0.00000000  -0.18675925  -1.14096943  -0.18675925
S221234 -227.38013351  -35.34348978  -31.97823700  -3.52725686  -3.56021900  2.12920859  0.00000000  -0.20799748  -1.21465243  -0.20799748
S221235 -360.65854297  -51.88807875  -47.10514400  -5.06610213  -5.01833000  2.97621187  0.00000000  -0.30448785  -1.73845539  -0.30448785
S221236 -197.48746124  -33.24905141  -29.98687100  -3.34874457  -3.49246100  2.10199628  0.00000000  -0.18677667  -1.14110630  -0.18677667
S221237 -403.77933646  -60.81876759  -55.15506400  -5.96518456  -6.00701000  3.56104305  0.00000000  -0.37187912  -2.08163161  -0.37187912
S221238  -66.31125611  -11.73721446  -10.54773100  -1.21456689  -1.29301800  0.79422415  0.00000000  -0.05566336  -0.41698229  -0.05566336
S221239 -197.48791383  -33.24859239  -29.98636100  -3.34883707  -3.49242000  2.10200122  0.00000000  -0.18678238  -1.14117033  -0.18678238
S221240 -197.48691499  -33.24964132  -29.98734000  -3.34877843  -3.49248100  2.10200233  0.00000000  -0.18676961  -1.14105817  -0.18676961
S221241 -197.48891530  -33.24754305  -29.98538100  -3.34889325  -3.49235800  2.10199705  0.00000000  -0.18679536  -1.14128213  -0.18679536
S221242 -197.48697443  -33.24957964  -29.98731000  -3.34874423  -3.49247800  2.10199530  0.00000000  -0.18676856  -1.14105113  -0.18676856
S221243 -197.48977823  -33.24663197  -29.98454300  -3.34892812  -3.49230400  2.10199098  0.00000000  -0.18680602  -1.14137481  -0.18680602
S221244 -264.12575818  -41.48938019  -37.52097900  -4.11910401  -4.21972000  2.52487265  0.00000000  -0.23640226  -1.40210885  -0.23640226
S221245  -48.55409720   -7.65733107   -6.91897500  -0.76827471  -0.81786300  0.49990738  0.00000000  -0.03898882  -0.27045821  -0.03898882
S221246  -67.12623102   -8.92388224   -8.10999500  -0.86898385  -0.85766500  0.51732091  0.00000000  -0.04676695  -0.29023710  -0.04676695
S221247 -166.50579610  -22.30264562  -20.27893600  -2.17511825  -2.09448500  1.24851043  0.00000000  -0.12598930  -0.73493981  -0.12598930
S221248 -147.91433289  -21.05792328  -19.11028900  -2.07230611  -2.05635000  1.23122020  0.00000000  -0.11842748  -0.71259928  -0.11842748
S221249 -360.66505465  -51.88018387  -47.09871800  -5.06558304  -5.01797200  2.97597573  0.00000000  -0.30473315  -1.73956342  -0.30473315
S221250 -260.49006435  -41.29651862  -37.35284800  -4.10245935  -4.21570300  2.52057878  0.00000000  -0.24027205  -1.41725333  -0.24027205
S221251 -393.79380965  -57.79424070  -52.42915400  -5.65049909  -5.67099000  3.36886563  0.00000000  -0.33680923  -1.94987705  -0.33680923
S221252  -33.62200142   -6.58327344   -5.89638200  -0.68552035  -0.78240600  0.48760726  0.00000000  -0.02786166  -0.23955943  -0.02786166
S221253  -66.31125265  -11.73722734  -10.54775100  -1.21455442  -1.29301900  0.79422256  0.00000000  -0.05566006  -0.41695791  -0.05566006
S221254  -33.61754759   -6.58783962   -5.90044500  -0.68562110  -0.78268400  0.48769442  0.00000000  -0.02786089  -0.23930860  -0.02786089
S221255 -197.48623314  -33.25034928  -29.98803000  -3.34869938  -3.49252300  2.10199654  0.00000000  -0.18675925  -1.14096943  -0.18675925
S221256 -227.38049191  -35.34309690  -31.97788600  -3.52727428  -3.56019700  2.12920595  0.00000000  -0.20800696  -1.21471376  -0.20800696
S221257 -360.65854297  -51.88807874  -47.10514400  -5.06610213  -5.01833000  2.97621187  0.00000000  -0.30448785  -1.73845539  -0.30448785
S221258 -310.87886226  -50.64301322  -45.77081100  -5.03515163  -5.21433500  3.11517104  0.00000000  -0.29807261  -1.74018938  -0.29807261
S221259 -393.78225406  -57.80783410  -52.44030000  -5.65129983  -5.67165000  3.36926015  0.00000000  -0.33647343  -1.94817274  -0.33647343
S221260  -65.86091457  -10.97411796   -9.87277800  -1.15081051  -1.15147300  0.70650156  0.00000000  -0.05918109  -0.39839513  -0.05918109
S221261  -67.12744036   -8.92233631   -8.10876200  -0.86901036  -0.85760100  0.51730939  0.00000000  -0.04683094  -0.29064287  -0.04683094
S221262  -48.55253087   -7.65879635   -6.92027400  -0.76836382  -0.81795400  0.49995195  0.00000000  -0.03899114  -0.27047439  -0.03899114
S221263  -80.86693156  -12.02396092  -10.86325900  -1.24423654  -1.18552600  0.72133770  0.00000000  -0.07041004  -0.43958513  -0.07041004
S221264 -197.48729012  -33.24925272  -29.98699000  -3.34878028  -3.49245800  2.10199724  0.00000000  -0.18677326  -1.14109157  -0.18677326
S221265 -310.88125594  -50.64056842  -45.76861800  -5.03517705  -5.21419900  3.11514323  0.00000000  -0.29810997  -1.74041438  -0.29810997
S221266 -264.12635808  -41.48875900  -37.52007000  -4.11964684  -4.21968800  2.52496892  0.00000000  -0.23639529  -1.40235696  -0.23639529
S22151   -97.10977613  -15.31454255  -13.83822400  -1.53569093  -1.63582800  0.99966315  0.00000000  -0.07811935  -0.54115862  -0.07811935
S22152  -134.25681730  -17.84672725  -16.21998200  -1.73635651  -1.71549700  1.03421177  0.00000000  -0.09376467  -0.58089198  -0.09376467
S22153  -333.01916188  -44.61130960  -40.56673800  -4.34379634  -4.19027500  2.49529950  0.00000000  -0.25264828  -1.46935393  -0.25264828
S22154  -295.83539581  -42.12112998  -38.22748500  -4.13989889  -4.11368900  2.46128705  0.00000000  -0.23727741  -1.42480005  -0.23727741
S22155  -721.34090695 -103.76527542  -94.20354800 -10.12608053 -10.03687200  5.95053684  0.00000000  -0.61029231  -3.47810781  -0.61029231
S22156  -539.57575201  -83.84013995  -75.88778400  -8.30405711  -8.47109900  5.05787761  0.00000000  -0.48924468  -2.87072268  -0.48924468
S22157  -797.58100897 -118.61430745 -107.58977200 -11.60906529 -11.67896200  6.92832118  0.00000000  -0.71003580  -4.03385222  -0.71003580
S22158   -67.24392270  -13.16663558  -11.79285100  -1.37095697  -1.56483100  0.97522454  0.00000000  -0.05575965  -0.47920572  -0.05575965
S22159  -132.62231846  -23.47472695  -21.09580100  -2.42885220  -2.58609600  1.58845490  0.00000000  -0.11142485  -0.83412692  -0.11142485
S221510 -231.10334614  -39.83880021  -35.88932600  -4.03348938  -4.27537600  2.58962392  0.00000000  -0.21491483  -1.38094367  -0.21491483
S221511 -394.97214864  -66.50076396  -59.97648300  -6.69665064  -6.98519600  4.20399612  0.00000000  -0.37415471  -2.28365059  -0.37415471
S221512 -454.76068669  -70.68690693  -63.95672900  -7.05367193  -7.12057100  4.25838403  0.00000000  -0.41667398  -2.43106522  -0.41667398
S221513 -721.31853639 -103.77756951  -94.21166200 -10.13101690 -10.03688100  5.95238055  0.00000000  -0.60984851  -3.47838079  -0.60984851
S221514 -508.36633887  -83.89146970  -75.75783800  -8.38253834  -8.70700400  5.21709177  0.00000000  -0.48613048  -2.88463929  -0.48613048
S221515 -797.56297358 -118.62810842 -107.59728400 -11.61444181 -11.67903700  6.93016934  0.00000000  -0.70985616  -4.03325060  -0.70985616
S221516 -132.17256457  -22.71164062  -20.42083600  -2.36493868  -2.44455500  1.50067810  0.00000000  -0.11494779  -0.81539152  -0.11494779
S221517 -264.61600863  -42.17220043  -38.09655900  -4.21658531  -4.35023400  2.61915109  0.00000000  -0.23386843  -1.43215325  -0.23386843
S221518 -246.03950910  -40.90927565  -36.90864100  -4.11613682  -4.31062400  2.60185908  0.00000000  -0.22603464  -1.41205385  -0.22603464
S221519 -278.35645358  -45.27420676  -40.85119600  -4.59125876  -4.67822400  2.82304784  0.00000000  -0.25752903  -1.58094197  -0.25752903
S221520 -394.97396933  -66.49988987  -59.97575200  -6.69596143  -6.98521700  4.20378793  0.00000000  -0.37421090  -2.28364449  -0.37421090
S221521 -508.37200935  -83.88914240  -75.75575000  -8.38138311  -8.70696100  5.21670502  0.00000000  -0.48596353  -2.88387959  -0.48596353
S221522 -528.25249455  -82.98120970  -75.04530000  -8.23507614  -8.44008400  5.04904545  0.00000000  -0.47394982  -2.80682012  -0.47394982
S221523  -48.55409721   -7.65733106   -6.91897500  -0.76827471  -0.81786300  0.49990738  0.00000000  -0.03898882  -0.27045821  -0.03898882
S221524  -67.12769987   -8.92223728   -8.10862700  -0.86896982  -0.85758500  0.51729360  0.00000000  -0.04680223  -0.29048019  -0.04680223
S221525 -166.50579610  -22.30264562  -20.27893600  -2.17511825  -2.09448500  1.24851043  0.00000000  -0.12598930  -0.73493981  -0.12598930
S221526 -147.91433291  -21.05792320  -19.11028900  -2.07230611  -2.05635000  1.23122020  0.00000000  -0.11842748  -0.71259928  -0.11842748
S221527 -360.66505465  -51.88018387  -47.09871800  -5.06558304  -5.01797200  2.97597573  0.00000000  -0.30473315  -1.73956342  -0.30473315
S221528 -279.07696166  -42.54215373  -38.53006300  -4.20703302  -4.25448600  2.53867781  0.00000000  -0.24754311  -1.45095300  -0.24754311
S221529 -403.78069892  -60.81772736  -55.15515500  -5.96409486  -6.00698500  3.56081061  0.00000000  -0.37179235  -2.08122986  -0.37179235
S221530  -33.62200142   -6.58327344   -5.89638200  -0.68552035  -0.78240600  0.48760726  0.00000000  -0.02786166  -0.23955943  -0.02786166
S221531  -66.31125265  -11.73722734  -10.54775100  -1.21455442  -1.29301900  0.79422256  0.00000000  -0.05566006  -0.41695791  -0.05566006
S221532 -197.48604269  -33.25055729  -29.98820000  -3.34871875  -3.49253500  2.10200367  0.00000000  -0.18675833  -1.14096097  -0.18675833
S221533 -197.48623314  -33.25034925  -29.98803000  -3.34869938  -3.49252300  2.10199654  0.00000000  -0.18675925  -1.14096943  -0.18675925
S221534 -227.38013351  -35.34348978  -31.97823700  -3.52725686  -3.56021900  2.12920859  0.00000000  -0.20799748  -1.21465243  -0.20799748
S221535 -360.65854297  -51.88807875  -47.10514400  -5.06610213  -5.01833000  2.97621187  0.00000000  -0.30448785  -1.73845539  -0.30448785
S221536 -197.48746124  -33.24905141  -29.98687100  -3.34874457  -3.49246100  2.10199628  0.00000000  -0.18677667  -1.14110630  -0.18677667
S221537 -403.77933646  -60.81876759  -55.15506400  -5.96518456  -6.00701000  3.56104305  0.00000000  -0.37187912  -2.08163161  -0.37187912
S221538  -66.31125611  -11.73721446  -10.54773100  -1.21456689  -1.29301800  0.79422415  0.00000000  -0.05566336  -0.41698229  -0.05566336
S221539 -197.48791383  -33.24859239  -29.98636100  -3.34883707  -3.49242000  2.10200122  0.00000000  -0.18678238  -1.14117033  -0.18678238
S221540 -197.48691499  -33.24964132  -29.98734000  -3.34877843  -3.49248100  2.10200233  0.00000000  -0.18676961  -1.14105817  -0.18676961
S221541 -197.48891530  -33.24754305  -29.98538100  -3.34889325  -3.49235800  2.10199705  0.00000000  -0.18679536  -1.14128213  -0.18679536
S221542 -197.48697443  -33.24957964  -29.98731000  -3.34874423  -3.49247800  2.10199530  0.00000000  -0.18676856  -1.14105113  -0.18676856
S221543 -197.48977823  -33.24663197  -29.98454300  -3.34892812  -3.49230400  2.10199098  0.00000000  -0.18680602  -1.14137481  -0.18680602
S221544 -264.12575818  -41.48938019  -37.52097900  -4.11910401  -4.21972000  2.52487265  0.00000000  -0.23640226  -1.40210885  -0.23640226
S221545  -48.55409721   -7.65733106   -6.91897500  -0.76827471  -0.81786300  0.49990738  0.00000000  -0.03898882  -0.27045821  -0.03898882
S221546  -67.12623102   -8.92388224   -8.10999500  -0.86898385  -0.85766500  0.51732091  0.00000000  -0.04676695  -0.29023710  -0.04676695
S221547 -166.50579610  -22.30264562  -20.27893600  -2.17511825  -2.09448500  1.24851043  0.00000000  -0.12598930  -0.73493981  -0.12598930
S221548 -147.91433289  -21.05792328  -19.11028900  -2.07230611  -2.05635000  1.23122020  0.00000000  -0.11842748  -0.71259928  -0.11842748
S221549 -360.66505465  -51.88018387  -47.09871800  -5.06558304  -5.01797200  2.97597573  0.00000000  -0.30473315  -1.73956342  -0.30473315
S221550 -260.49006435  -41.29651862  -37.35284800  -4.10245935  -4.21570300  2.52057878  0.00000000  -0.24027205  -1.41725333  -0.24027205
S221551 -393.79380965  -57.79424070  -52.42915400  -5.65049909  -5.67099000  3.36886563  0.00000000  -0.33680923  -1.94987705  -0.33680923
S221552  -33.62200142   -6.58327344   -5.89638200  -0.68552035  -0.78240600  0.48760726  0.00000000  -0.02786166  -0.23955943  -0.02786166
S221553  -66.31125265  -11.73722734  -10.54775100  -1.21455442  -1.29301900  0.79422256  0.00000000  -0.05566006  -0.41695791  -0.05566006
S221554  -33.61754759   -6.58783962   -5.90044500  -0.68562110  -0.78268400  0.48769442  0.00000000  -0.02786089  -0.23930860  -0.02786089
S221555 -197.48623314  -33.25034928  -29.98803000  -3.34869938  -3.49252300  2.10199654  0.00000000  -0.18675925  -1.14096943  -0.18675925
S221556 -227.38049191  -35.34309690  -31.97788600  -3.52727428  -3.56019700  2.12920595  0.00000000  -0.20800696  -1.21471376  -0.20800696
S221557 -360.65854297  -51.88807874  -47.10514400  -5.06610213  -5.01833000  2.97621187  0.00000000  -0.30448785  -1.73845539  -0.30448785
S221558 -310.87886226  -50.64301323  -45.77081100  -5.03515163  -5.21433500  3.11517104  0.00000000  -0.29807261  -1.74018938  -0.29807261
S221559 -393.78225406  -57.80783410  -52.44030000  -5.65129983  -5.67165000  3.36926015  0.00000000  -0.33647343  -1.94817274  -0.33647343
S221560  -65.86091457  -10.97411796   -9.87277800  -1.15081051  -1.15147300  0.70650156  0.00000000  -0.05918109  -0.39839513  -0.05918109
S221561  -67.12744036   -8.92233631   -8.10876200  -0.86901036  -0.85760100  0.51730939  0.00000000  -0.04683094  -0.29064287  -0.04683094
S221562  -48.55253087   -7.65879635   -6.92027400  -0.76836382  -0.81795400  0.49995195  0.00000000  -0.03899114  -0.27047439  -0.03899114
S221563  -80.86693156  -12.02396092  -10.86325900  -1.24423654  -1.18552600  0.72133770  0.00000000  -0.07041004  -0.43958513  -0.07041004
S221564 -197.48729012  -33.24925272  -29.98699000  -3.34878028  -3.49245800  2.10199724  0.00000000  -0.18677326  -1.14109157  -0.18677326
S221565 -310.88125589  -50.64056871  -45.76861800  -5.03517705  -5.21419900  3.11514323  0.00000000  -0.29810997  -1.74041438  -0.29810997
S221566 -264.12635808  -41.48875900  -37.52007000  -4.11964684  -4.21968800  2.52496892  0.00000000  -0.23639529  -1.40235696  -0.23639529
S22201   -97.10873794  -15.31465938  -13.83796000  -1.53642770  -1.63573500  0.99980823  0.00000000  -0.07800136  -0.54093956  -0.07800136
S22202  -134.25517010  -17.84648453  -16.21897800  -1.73764333  -1.71529700  1.03458334  0.00000000  -0.09359414  -0.58063736  -0.09359414
S22203  -333.01619167  -44.60656196  -40.55926500  -4.34877254  -4.18921900  2.49676222  0.00000000  -0.25207515  -1.46925136  -0.25207515
S22204  -295.83247742  -42.11781281  -38.22232500  -4.14361216  -4.11291700  2.46233128  0.00000000  -0.23684395  -1.42455043  -0.23684395
S22205  -721.33574433 -103.76235420  -94.19867500 -10.13019428 -10.03611200  5.95178890  0.00000000  -0.60955188  -3.47791194  -0.6095518
S22206  -539.57169764  -83.83849138  -75.88323900  -8.30832435  -8.47031200  5.05906675  0.00000000  -0.48823443  -2.86893069  -0.48823443
S22207  -797.57763108 -118.61213273 -107.58492300 -11.61339756 -11.67814300  6.92951383  0.00000000  -0.70905546  -4.03203233  -0.70905546
S22208   -67.24399875  -13.16655657  -11.79276700  -1.37103805  -1.56481300  0.97521556  0.00000000  -0.05573018  -0.47913735  -0.05573018
S22209  -132.62247753  -23.47449277  -21.09553200  -2.42909814  -2.58604200  1.58844678  0.00000000  -0.11133705  -0.83395105  -0.11133705
S222010 -231.10349718  -39.83855316  -35.88879800  -4.03424646  -4.27524600  2.58970934  0.00000000  -0.21468883  -1.38042948  -0.21468883
S222011 -394.97238607  -66.50068939  -59.97610700  -6.69732785  -6.98506600  4.20400459  0.00000000  -0.37363342  -2.28226453  -0.37363342
S222012 -454.76068739  -70.68661822  -63.95614100  -7.05449784  -7.12042100  4.25842140  0.00000000  -0.41612944  -2.42971741  -0.41612944
S222013 -721.31792545 -103.77638666  -94.21039200 -10.13211237 -10.03668000  5.95243530  0.00000000  -0.60914879  -3.47711168  -0.60914879
S222014 -508.36626587  -83.89175247  -75.75743600  -8.38392377  -8.70679000  5.21719768  0.00000000  -0.48513306  -2.88213432  -0.48513306
S222015 -797.56227699 -118.62702813 -107.59574000 -11.61630260 -11.67871300  6.93032632  0.00000000  -0.70867346  -4.03060756  -0.70867346
S222016 -132.17231783  -22.71142753  -20.42055900  -2.36531773  -2.44449600  1.50072067  0.00000000  -0.11486730  -0.81536370  -0.11486730
S222017 -264.61558799  -42.17154088  -38.09561600  -4.21761717  -4.35006800  2.61930298  0.00000000  -0.23365490  -1.43177894  -0.23365490
S222018 -246.03948336  -40.90878231  -36.90789700  -4.11699076  -4.31047200  2.60195944  0.00000000  -0.22581851  -1.41161302  -0.22581851
S222019 -278.35618781  -45.27271195  -40.84952100  -4.59276917  -4.67796300  2.82331820  0.00000000  -0.25725609  -1.58067774  -0.25725609
S222020 -394.97417135  -66.49925534  -59.97466700  -6.69730822  -6.98499100  4.20400140  0.00000000  -0.37372563  -2.28256920  -0.37372563
S222021 -508.37162533  -83.88803547  -75.75389000  -8.38359266  -8.70659700  5.21711799  0.00000000  -0.48521590  -2.88232359  -0.48521590
S222022 -528.25247458  -82.97947674  -75.04226800  -8.23800384  -8.43955900  5.04978768  0.00000000  -0.47317428  -2.80522148  -0.47317428
S222023  -48.55409721   -7.65733106   -6.91897500  -0.76827471  -0.81786300  0.49990738  0.00000000  -0.03898882  -0.27045821  -0.03898882
S222024  -67.12769987   -8.92223728   -8.10862700  -0.86896982  -0.85758500  0.51729360  0.00000000  -0.04680223  -0.29048019  -0.04680223
S222025 -166.50579610  -22.30264562  -20.27893600  -2.17511825  -2.09448500  1.24851043  0.00000000  -0.12598930  -0.73493981  -0.12598930
S222026 -147.91433291  -21.05792320  -19.11028900  -2.07230611  -2.05635000  1.23122020  0.00000000  -0.11842748  -0.71259928  -0.11842748
S222027 -360.66505465  -51.88018387  -47.09871800  -5.06558304  -5.01797200  2.97597573  0.00000000  -0.30473315  -1.73956342  -0.30473315
S222028 -279.07696166  -42.54215373  -38.53006300  -4.20703302  -4.25448600  2.53867781  0.00000000  -0.24754311  -1.45095300  -0.24754311
S222029 -403.78069892  -60.81772736  -55.15515500  -5.96409486  -6.00698500  3.56081061  0.00000000  -0.37179235  -2.08122986  -0.37179235
S222030  -33.62200142   -6.58327344   -5.89638200  -0.68552035  -0.78240600  0.48760726  0.00000000  -0.02786166  -0.23955943  -0.02786166
S222031  -66.31125265  -11.73722734  -10.54775100  -1.21455442  -1.29301900  0.79422256  0.00000000  -0.05566006  -0.41695791  -0.05566006
S222032 -197.48604269  -33.25055729  -29.98820000  -3.34871875  -3.49253500  2.10200367  0.00000000  -0.18675833  -1.14096097  -0.18675833
S222033 -197.48623314  -33.25034925  -29.98803000  -3.34869938  -3.49252300  2.10199654  0.00000000  -0.18675925  -1.14096943  -0.18675925
S222034 -227.38013351  -35.34348978  -31.97823700  -3.52725686  -3.56021900  2.12920859  0.00000000  -0.20799748  -1.21465243  -0.20799748
S222035 -360.65854297  -51.88807875  -47.10514400  -5.06610213  -5.01833000  2.97621187  0.00000000  -0.30448785  -1.73845539  -0.30448785
S222036 -197.48746124  -33.24905141  -29.98687100  -3.34874457  -3.49246100  2.10199628  0.00000000  -0.18677667  -1.14110630  -0.18677667
S222037 -403.77933646  -60.81876759  -55.15506400  -5.96518456  -6.00701000  3.56104305  0.00000000  -0.37187912  -2.08163161  -0.37187912
S222038  -66.31125611  -11.73721446  -10.54773100  -1.21456689  -1.29301800  0.79422415  0.00000000  -0.05566336  -0.41698229  -0.05566336
S222039 -197.48791383  -33.24859239  -29.98636100  -3.34883707  -3.49242000  2.10200122  0.00000000  -0.18678238  -1.14117033  -0.18678238
S222040 -197.48691499  -33.24964132  -29.98734000  -3.34877843  -3.49248100  2.10200233  0.00000000  -0.18676961  -1.14105817  -0.18676961
S222041 -197.48891530  -33.24754305  -29.98538100  -3.34889325  -3.49235800  2.10199705  0.00000000  -0.18679536  -1.14128213  -0.18679536
S222042 -197.48697443  -33.24957964  -29.98731000  -3.34874423  -3.49247800  2.10199530  0.00000000  -0.18676856  -1.14105113  -0.18676856
S222043 -197.48977823  -33.24663197  -29.98454300  -3.34892812  -3.49230400  2.10199098  0.00000000  -0.18680602  -1.14137481  -0.18680602
S222044 -264.12575818  -41.48938019  -37.52097900  -4.11910401  -4.21972000  2.52487265  0.00000000  -0.23640226  -1.40210885  -0.23640226
S222045  -48.55409721   -7.65733106   -6.91897500  -0.76827471  -0.81786300  0.49990738  0.00000000  -0.03898882  -0.27045821  -0.03898882
S222046  -67.12623102   -8.92388224   -8.10999500  -0.86898385  -0.85766500  0.51732091  0.00000000  -0.04676695  -0.29023710  -0.04676695
S222047 -166.50579610  -22.30264562  -20.27893600  -2.17511825  -2.09448500  1.24851043  0.00000000  -0.12598930  -0.73493981  -0.12598930
S222048 -147.91433289  -21.05792328  -19.11028900  -2.07230611  -2.05635000  1.23122020  0.00000000  -0.11842748  -0.71259928  -0.11842748
S222049 -360.66505465  -51.88018387  -47.09871800  -5.06558304  -5.01797200  2.97597573  0.00000000  -0.30473315  -1.73956342  -0.30473315
S222050 -260.49006435  -41.29651862  -37.35284800  -4.10245935  -4.21570300  2.52057878  0.00000000  -0.24027205  -1.41725333  -0.24027205
S222051 -393.79380965  -57.79424070  -52.42915400  -5.65049909  -5.67099000  3.36886563  0.00000000  -0.33680923  -1.94987705  -0.33680923
S222052  -33.62200142   -6.58327344   -5.89638200  -0.68552035  -0.78240600  0.48760726  0.00000000  -0.02786166  -0.23955943  -0.02786166
S222053  -66.31125265  -11.73722734  -10.54775100  -1.21455442  -1.29301900  0.79422256  0.00000000  -0.05566006  -0.41695791  -0.05566006
S222054  -33.61754759   -6.58783962   -5.90044500  -0.68562110  -0.78268400  0.48769442  0.00000000  -0.02786089  -0.23930860  -0.02786089
S222055 -197.48623314  -33.25034928  -29.98803000  -3.34869938  -3.49252300  2.10199654  0.00000000  -0.18675925  -1.14096943  -0.18675925
S222056 -227.38049191  -35.34309690  -31.97788600  -3.52727428  -3.56019700  2.12920595  0.00000000  -0.20800696  -1.21471376  -0.20800696
S222057 -360.65854297  -51.88807874  -47.10514400  -5.06610213  -5.01833000  2.97621187  0.00000000  -0.30448785  -1.73845539  -0.30448785
S222058 -310.87886226  -50.64301322  -45.77081100  -5.03515163  -5.21433500  3.11517104  0.00000000  -0.29807261  -1.74018938  -0.29807261
S222059 -393.78225406  -57.80783410  -52.44030000  -5.65129983  -5.67165000  3.36926015  0.00000000  -0.33647343  -1.94817274  -0.33647343
S222060  -65.86091457  -10.97411796   -9.87277800  -1.15081051  -1.15147300  0.70650156  0.00000000  -0.05918109  -0.39839513  -0.05918109
S222061  -67.12744036   -8.92233631   -8.10876200  -0.86901036  -0.85760100  0.51730939  0.00000000  -0.04683094  -0.29064287  -0.04683094
S222062  -48.55253087   -7.65879635   -6.92027400  -0.76836382  -0.81795400  0.49995195  0.00000000  -0.03899114  -0.27047439  -0.03899114
S222063  -80.86693156  -12.02396092  -10.86325900  -1.24423654  -1.18552600  0.72133770  0.00000000  -0.07041004  -0.43958513  -0.07041004
S222064 -197.48729012  -33.24925272  -29.98699000  -3.34878028  -3.49245800  2.10199724  0.00000000  -0.18677326  -1.14109157  -0.18677326
S222065 -310.88125595  -50.64056840  -45.76861800  -5.03517705  -5.21419900  3.11514323  0.00000000  -0.29810997  -1.74041438  -0.29810997
S222066 -264.12635808  -41.48875900  -37.52007000  -4.11964684  -4.21968800  2.52496892  0.00000000  -0.23639529  -1.40235696  -0.23639529
