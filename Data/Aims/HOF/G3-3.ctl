# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using Aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G3-3           2		   Aims

# The project description
__title__ ::
"============================ G3-3 set ==============================="
"              There are  75 molecules in G3-3 set                    "
"All the geometries are optimized at the level of                     "
"G3    :   B3LYP/6-311+G(d,p)                                         "
"G3m   :   B3LYP/6-31G(2df,p)                                         "
"G3s   :   B3LYP/6-31G(d)                                             "                                                                    

# several global statements of control.in for aims Package
__aims_basis__ :: /home/igor/Documents/Package-Pool/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  2  051512.mpi
xc                      pbe                                                                                                                 
total_energy_method     rpa
charge                  0.
relativistic            none
occupation_type         gaussian 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.2
sc_accuracy_rho  1E-6
sc_accuracy_eev  1E-4
sc_accuracy_etot 1E-6
sc_iter_limit    200
end aims


# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , './EAtom'
<PATH2> , './G3'

# The molecular set to batch: 
#                75 is the total number of jobs in this batch list
__batch__ ::  75
#"Flag"         "DIR"                         "InpName"       "JobType"
# G3-3 set 75
 G2-149	        <PATH2>                       G2-149         energy
 G2-150	        <PATH2>                       G2-150         energy
 G2-151	        <PATH2>                       G2-151         energy
 G2-152	        <PATH2>                       G2-152         energy
 G2-153	        <PATH2>                       G2-153         energy
 G2-154	        <PATH2>                       G2-154         energy
 G2-155	        <PATH2>                       G2-155         energy
 G2-156	        <PATH2>                       G2-156         energy
 G2-157	        <PATH2>                       G2-157         energy
 G2-158	        <PATH2>                       G2-158         energy
 G2-159	        <PATH2>                       G2-159         energy
 G2-160	        <PATH2>                       G2-160         energy
 G2-161	        <PATH2>                       G2-161         energy
 G2-162	        <PATH2>                       G2-162         energy
 G2-163	        <PATH2>                       G2-163         energy
 G2-164	        <PATH2>                       G2-164         energy
 G2-165	        <PATH2>                       G2-165         energy
 G2-166	        <PATH2>                       G2-166         energy
 G2-167	        <PATH2>                       G2-167         energy
 G2-168	        <PATH2>                       G2-168         energy
 G2-169	        <PATH2>                       G2-169         energy
 G2-170	        <PATH2>                       G2-170         energy
 G2-171	        <PATH2>                       G2-171         energy
 G2-172	        <PATH2>                       G2-172         energy
 G2-173	        <PATH2>                       G2-173         energy
 G2-174	        <PATH2>                       G2-174         energy
 G2-175	        <PATH2>                       G2-175         energy
 G2-176	        <PATH2>                       G2-176         energy
 G2-177	        <PATH2>                       G2-177         energy
 G2-178	        <PATH2>                       G2-178         energy
 G2-179	        <PATH2>                       G2-179         energy
 G2-180	        <PATH2>                       G2-180         energy
 G2-181	        <PATH2>                       G2-181         energy
 G2-182	        <PATH2>                       G2-182         energy
 G2-183	        <PATH2>                       G2-183         energy
 G2-184	        <PATH2>                       G2-184         energy
 G2-185	        <PATH2>                       G2-185         energy
 G2-186	        <PATH2>                       G2-186         energy
 G2-187	        <PATH2>                       G2-187         energy
 G2-188	        <PATH2>                       G2-188         energy
 G2-189	        <PATH2>                       G2-189         energy
 G2-190	        <PATH2>                       G2-190         energy
 G2-191	        <PATH2>                       G2-191         energy
 G2-192	        <PATH2>                       G2-192         energy
 G2-193	        <PATH2>                       G2-193         energy
 G2-194	        <PATH2>                       G2-194         energy
 G2-195	        <PATH2>                       G2-195         energy
 G2-196	        <PATH2>                       G2-196         energy
 G2-197	        <PATH2>                       G2-197         energy
 G2-198	        <PATH2>                       G2-198         energy
 G2-199	        <PATH2>                       G2-199         energy
 G2-200	        <PATH2>                       G2-200         energy
 G2-201	        <PATH2>                       G2-201         energy
 G2-202	        <PATH2>                       G2-202         energy
 G2-203	        <PATH2>                       G2-203         energy
 G2-204	        <PATH2>                       G2-204         energy
 G2-205	        <PATH2>                       G2-205         energy
 G2-206	        <PATH2>                       G2-206         energy
 G2-207	        <PATH2>                       G2-207         energy
 G2-208	        <PATH2>                       G2-208         energy
 G2-209	        <PATH2>                       G2-209         energy
 G2-210	        <PATH2>                       G2-210         energy
 G2-211	        <PATH2>                       G2-211         energy
 G2-212	        <PATH2>                       G2-212         energy
 G2-213	        <PATH2>                       G2-213         energy
 G2-214	        <PATH2>                       G2-214         energy
 G2-215	        <PATH2>                       G2-215         energy
 G2-216	        <PATH2>                       G2-216         energy
 G2-217	        <PATH2>                       G2-217         energy
 G2-218	        <PATH2>                       G2-218         energy
 G2-219	        <PATH2>                       G2-219         energy
 G2-220	        <PATH2>                       G2-220         energy
 G2-221	        <PATH2>                       G2-221         energy
 G2-222	        <PATH2>                       G2-222         energy
 G2-223	        <PATH2>                       G2-223         energy

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




