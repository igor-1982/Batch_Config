# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G3-3           2		   QChem

# The project description
__title__ ::
"============================ G3-3 set ==============================="
"              There are  75 molecules in G3-3 set                    "
"All the geometries are optimized at the level of                     "
"G3    :   B3LYP/6-311+G(d,p)                                         "
"G3m   :   B3LYP/6-31G(2df,p)                                         "
"G3s   :   B3LYP/6-31G(d)                                             "                                                                    


# $rem group of Q-Chem Package
__qchem__ ::  1  rmp2 # 0 for serial version Q-Chem and 1 for parallel version Q-Chem
$rem
exchange = b3lyp
basis = 6-311+g(3df,2p)
scf_convergence = 8
xc_grid = 000075000194
$end

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , './EAtom'
<PATH2> , './G3'

# The molecular set to batch: 
#                75 is the total number of jobs in this batch list
__batch__ ::  75
#"Flag"         "DIR"                         "InpName"       "JobType"
# G3-3 set 75
 G2-149	        <PATH2>                       G2-149.in      energy
 G2-150	        <PATH2>                       G2-150.in      energy
 G2-151	        <PATH2>                       G2-151.in      energy
 G2-152	        <PATH2>                       G2-152.in      energy
 G2-153	        <PATH2>                       G2-153.in      energy
 G2-154	        <PATH2>                       G2-154.in      energy
 G2-155	        <PATH2>                       G2-155.in      energy
 G2-156	        <PATH2>                       G2-156.in      energy
 G2-157	        <PATH2>                       G2-157.in      energy
 G2-158	        <PATH2>                       G2-158.in      energy
 G2-159	        <PATH2>                       G2-159.in      energy
 G2-160	        <PATH2>                       G2-160.in      energy
 G2-161	        <PATH2>                       G2-161.in      energy
 G2-162	        <PATH2>                       G2-162.in      energy
 G2-163	        <PATH2>                       G2-163.in      energy
 G2-164	        <PATH2>                       G2-164.in      energy
 G2-165	        <PATH2>                       G2-165.in      energy
 G2-166	        <PATH2>                       G2-166.in      energy
 G2-167	        <PATH2>                       G2-167.in      energy
 G2-168	        <PATH2>                       G2-168.in      energy
 G2-169	        <PATH2>                       G2-169.in      energy
 G2-170	        <PATH2>                       G2-170.in      energy
 G2-171	        <PATH2>                       G2-171.in      energy
 G2-172	        <PATH2>                       G2-172.in      energy
 G2-173	        <PATH2>                       G2-173.in      energy
 G2-174	        <PATH2>                       G2-174.in      energy
 G2-175	        <PATH2>                       G2-175.in      energy
 G2-176	        <PATH2>                       G2-176.in      energy
 G2-177	        <PATH2>                       G2-177.in      energy
 G2-178	        <PATH2>                       G2-178.in      energy
 G2-179	        <PATH2>                       G2-179.in      energy
 G2-180	        <PATH2>                       G2-180.in      energy
 G2-181	        <PATH2>                       G2-181.in      energy
 G2-182	        <PATH2>                       G2-182.in      energy
 G2-183	        <PATH2>                       G2-183.in      energy
 G2-184	        <PATH2>                       G2-184.in      energy
 G2-185	        <PATH2>                       G2-185.in      energy
 G2-186	        <PATH2>                       G2-186.in      energy
 G2-187	        <PATH2>                       G2-187.in      energy
 G2-188	        <PATH2>                       G2-188.in      energy
 G2-189	        <PATH2>                       G2-189.in      energy
 G2-190	        <PATH2>                       G2-190.in      energy
 G2-191	        <PATH2>                       G2-191.in      energy
 G2-192	        <PATH2>                       G2-192.in      energy
 G2-193	        <PATH2>                       G2-193.in      energy
 G2-194	        <PATH2>                       G2-194.in      energy
 G2-195	        <PATH2>                       G2-195.in      energy
 G2-196	        <PATH2>                       G2-196.in      energy
 G2-197	        <PATH2>                       G2-197.in      energy
 G2-198	        <PATH2>                       G2-198.in      energy
 G2-199	        <PATH2>                       G2-199.in      energy
 G2-200	        <PATH2>                       G2-200.in      energy
 G2-201	        <PATH2>                       G2-201.in      energy
 G2-202	        <PATH2>                       G2-202.in      energy
 G2-203	        <PATH2>                       G2-203.in      energy
 G2-204	        <PATH2>                       G2-204.in      energy
 G2-205	        <PATH2>                       G2-205.in      energy
 G2-206	        <PATH2>                       G2-206.in      energy
 G2-207	        <PATH2>                       G2-207.in      energy
 G2-208	        <PATH2>                       G2-208.in      energy
 G2-209	        <PATH2>                       G2-209.in      energy
 G2-210	        <PATH2>                       G2-210.in      energy
 G2-211	        <PATH2>                       G2-211.in      energy
 G2-212	        <PATH2>                       G2-212.in      energy
 G2-213	        <PATH2>                       G2-213.in      energy
 G2-214	        <PATH2>                       G2-214.in      energy
 G2-215	        <PATH2>                       G2-215.in      energy
 G2-216	        <PATH2>                       G2-216.in      energy
 G2-217	        <PATH2>                       G2-217.in      energy
 G2-218	        <PATH2>                       G2-218.in      energy
 G2-219	        <PATH2>                       G2-219.in      energy
 G2-220	        <PATH2>                       G2-220.in      energy
 G2-221	        <PATH2>                       G2-221.in      energy
 G2-222	        <PATH2>                       G2-222.in      energy
 G2-223	        <PATH2>                       G2-223.in      energy

# Training set for the atomization energy
#               75 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 75  1.0
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
 1         G2-149   1                                    0.0        1.0
 1         G2-150   1                                    0.0        1.0
 1         G2-151   1                                    0.0        1.0
 1         G2-152   1                                    0.0        1.0
 1         G2-153   1                                    0.0        1.0
 1         G2-154   1                                    0.0        1.0
 1         G2-155   1                                    0.0        1.0
 1         G2-156   1                                    0.0        1.0
 1         G2-157   1                                    0.0        1.0
 1         G2-158   1                                    0.0        1.0
 1         G2-159   1                                    0.0        1.0
 1         G2-160   1                                    0.0        1.0
 1         G2-161   1                                    0.0        1.0
 1         G2-162   1                                    0.0        1.0
 1         G2-163   1                                    0.0        1.0
 1         G2-164   1                                    0.0        1.0
 1         G2-165   1                                    0.0        1.0
 1         G2-166   1                                    0.0        1.0
 1         G2-167   1                                    0.0        1.0
 1         G2-168   1                                    0.0        1.0
 1         G2-169   1                                    0.0        1.0
 1         G2-170   1                                    0.0        1.0
 1         G2-171   1                                    0.0        1.0
 1         G2-172   1                                    0.0        1.0
 1         G2-173   1                                    0.0        1.0
 1         G2-174   1                                    0.0        1.0
 1         G2-175   1                                    0.0        1.0         # Title error "C6H6Cl" in original input
 1         G2-176   1                                    0.0        1.0
 1         G2-177   1                                    0.0        1.0
 1         G2-178   1                                    0.0        1.0
 1         G2-179   1                                    0.0        1.0
 1         G2-180   1                                    0.0        1.0
 1         G2-181   1                                    0.0        1.0
 1         G2-182   1                                    0.0        1.0
 1         G2-183   1                                    0.0        1.0
 1         G2-184   1                                    0.0        1.0
 1         G2-185   1                                    0.0        1.0
 1         G2-186   1                                    0.0        1.0
 1         G2-187   1                                    0.0        1.0
 1         G2-188   1                                    0.0        1.0
 1         G2-189   1                                    0.0        1.0
 1         G2-190   1                                    0.0        1.0
 1         G2-191   1                                    0.0        1.0
 1         G2-192   1                                    0.0        1.0
 1         G2-193   1                                    0.0        1.0
 1         G2-194   1                                    0.0        1.0
 1         G2-195   1                                    0.0        1.0
 1         G2-196   1                                    0.0        1.0
 1         G2-197   1                                    0.0        1.0         # Title inconsistency in the molecular label
 1         G2-198   1                                    0.0        1.0
 1         G2-199   1                                    0.0        1.0
 1         G2-200   1                                    0.0        1.0
 1         G2-201   1                                    0.0        1.0
 1         G2-202   1                                    0.0        1.0
 1         G2-203   1                                    0.0        1.0
 1         G2-204   1                                    0.0        1.0
 1         G2-205   1                                    0.0        1.0
 1         G2-206   1                                    0.0        1.0
 1         G2-207   1                                    0.0        1.0
 1         G2-208   1                                    0.0        1.0
 1         G2-209   1                                    0.0        1.0
 1         G2-210   1                                    0.0        1.0
 1         G2-211   1                                    0.0        1.0
 1         G2-212   1                                    0.0        1.0
 1         G2-213   1                                    0.0        1.0
 1         G2-214   1                                    0.0        1.0
 1         G2-215   1                                    0.0        1.0
 1         G2-216   1                                    0.0        1.0
 1         G2-217   1                                    0.0        1.0
 1         G2-218   1                                    0.0        1.0
 1         G2-219   1                                    0.0        1.0
 1         G2-220   1                                    0.0        1.0
 1         G2-221   1                                    0.0        1.0
 1         G2-222   1                                    0.0        1.0
 1         G2-223   1                                    0.0        1.0




