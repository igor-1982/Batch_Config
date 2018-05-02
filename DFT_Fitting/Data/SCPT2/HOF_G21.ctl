# The project environment :
# "ProjDir" specifying the storage DIR of this project
# "ProjCtrl" = 0 : to run all the jobs
#   = 1 : to fetch result from existed log and chk files
#   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package
#                  = "QChem"    : to run jobs using Q-Chem package
#                  = "Aims"     : to run jobs using FHI-aims package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./G21            0              Aims

# The project description
__title__ ::
"=========================== G2-1 set =============================="
"              There are 56 molecules in G2-1 set                   "
"All the geometries are optimized at the level of B3LYP/6-311+G(d,p)"

__initial guess__ ::
# enhanced_factor,  screen_factor,  shift_factor
  1.0E0,            1.0E0           0.0E0

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

__optimization job__ :: scpt2

__optimization function__ :: update_aims_scpt2.py

# several global statements of control.in for aims Package
__aims_basis__ :: /home/zhang/Documents/Package-Pool/aims/my_basis_pool/gaussian/cc-pVDZ
__aims__ ::  2  030113.mpi
xc                      pbe0
total_energy_method     mp2
frozen_core_postSCF     1
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

# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> , '.'
<PATH2> , '.'

# The molecular set to batch: 
#               71 is the total number of jobs in this batch list
__batch__ ::  71
#"Flag"         "DIR"                         "InpName"       "JobType"
# Atoms  15
 H_0            <PATH1>/EAtom                 H_0.in          cmp2 
# He_0           <PATH1>/EAtom                He_0.in          cmp2 
 Li_0           <PATH1>/EAtom                 Li_0.in         cmp2 
 Be_0           <PATH1>/EAtom                 Be_0.in         cmp2 
 B_0            <PATH1>/EAtom                 B_0.in          cmp2 
 C_0            <PATH1>/EAtom                 C_0.in          cmp2 
 N_0            <PATH1>/EAtom                 N_0.in          cmp2 
 O_0            <PATH1>/EAtom                 O_0.in          cmp2 
 F_0            <PATH1>/EAtom                 F_0.in          cmp2 
# Ne_0           <PATH1>/EAtom                Ne_0.in          cmp2 
 Na_0           <PATH1>/EAtom                 Na_0.in         cmp2 
 Mg_0           <PATH1>/EAtom                 Mg_0.in         cmp2 
 Al_0           <PATH1>/EAtom                 Al_0.in         cmp2 
 Si_0           <PATH1>/EAtom                 Si_0.in         cmp2 
 P_0            <PATH1>/EAtom                 P_0.in          cmp2 
 S_0            <PATH1>/EAtom                 S_0.in          cmp2 
 Cl_0           <PATH1>/EAtom                 Cl_0.in         cmp2 
# G2-1 set 56
 G2-1           <PATH2>/G2                    G2-1.in         cmp2 
 G2-2           <PATH2>/G2                    G2-2.in         cmp2 
 G2-3           <PATH2>/G2                    G2-3.in         cmp2 
 G2-4           <PATH2>/G2                    G2-4.in         cmp2 
 G2-5           <PATH2>/G2                    G2-5.in         cmp2 
 G2-6           <PATH2>/G2                    G2-6.in         cmp2 
 G2-7           <PATH2>/G2                    G2-7.in         cmp2 
 G2-8           <PATH2>/G2                    G2-8.in         cmp2 
 G2-9           <PATH2>/G2                    G2-9.in         cmp2 
 G2-10          <PATH2>/G2                    G2-10.in	      cmp2 
 G2-11          <PATH2>/G2                    G2-11.in	      cmp2  
 G2-12          <PATH2>/G2                    G2-12.in	      cmp2  
 G2-13          <PATH2>/G2                    G2-13.in	      cmp2  
 G2-14          <PATH2>/G2                    G2-14.in	      cmp2  
 G2-15          <PATH2>/G2                    G2-15.in	      cmp2  
 G2-16          <PATH2>/G2                    G2-16.in	      cmp2  
 G2-17          <PATH2>/G2                    G2-17.in	      cmp2  
 G2-18          <PATH2>/G2                    G2-18.in	      cmp2  
 G2-19          <PATH2>/G2                    G2-19.in	      cmp2  
 G2-20          <PATH2>/G2                    G2-20.in	      cmp2  
 G2-21          <PATH2>/G2                    G2-21.in	      cmp2  
 G2-22          <PATH2>/G2                    G2-22.in	      cmp2  
 G2-23          <PATH2>/G2                    G2-23.in	      cmp2  
 G2-24          <PATH2>/G2                    G2-24.in	      cmp2  
 G2-25          <PATH2>/G2                    G2-25.in	      cmp2  
 G2-26          <PATH2>/G2                    G2-26.in	      cmp2  
 G2-27          <PATH2>/G2                    G2-27.in	      cmp2  
 G2-28          <PATH2>/G2                    G2-28.in	      cmp2  
 G2-29          <PATH2>/G2                    G2-29.in	      cmp2  
 G2-30          <PATH2>/G2                    G2-30.in	      cmp2  
 G2-31          <PATH2>/G2                    G2-31.in	      cmp2  
 G2-32          <PATH2>/G2                    G2-32.in	      cmp2  
 G2-33          <PATH2>/G2                    G2-33.in	      cmp2  
 G2-34          <PATH2>/G2                    G2-34.in	      cmp2  
 G2-35          <PATH2>/G2                    G2-35.in	      cmp2  
 G2-36          <PATH2>/G2                    G2-36.in	      cmp2  
 G2-37          <PATH2>/G2                    G2-37.in	      cmp2  
 G2-38          <PATH2>/G2                    G2-38.in	      cmp2  
 G2-39          <PATH2>/G2                    G2-39.in	      cmp2  
 G2-40          <PATH2>/G2                    G2-40.in	      cmp2  
 G2-41          <PATH2>/G2                    G2-41.in	      cmp2  
 G2-42          <PATH2>/G2                    G2-42.in	      cmp2  
 G2-43          <PATH2>/G2                    G2-43.in	      cmp2  
 G2-44          <PATH2>/G2                    G2-44.in	      cmp2  
 G2-45          <PATH2>/G2                    G2-45.in	      cmp2  
 G2-46          <PATH2>/G2                    G2-46.in	      cmp2  
 G2-47          <PATH2>/G2                    G2-47.in	      cmp2  
 G2-48          <PATH2>/G2                    G2-48.in	      cmp2  
 G2-49          <PATH2>/G2                    G2-49.in	      cmp2  
 G2-50          <PATH2>/G2                    G2-50.in	      cmp2  
 G2-51          <PATH2>/G2                    G2-51.in	      cmp2  
 G2-52          <PATH2>/G2                    G2-52.in	      cmp2  
 G2-53          <PATH2>/G2                    G2-53.in	      cmp2  
 G2-54          <PATH2>/G2                    G2-54.in	      cmp2  
 G2-55          <PATH2>/G2                    G2-55.in	      cmp2  
 G2-136	        <PATH2>/G2                    G2-136.in       cmp2  

# Training set for the atomization energy
#               56 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
#              1.0 is the scale factor from "a.u." to "a.u.", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "a.u."
__energy__ :: 56  1.0
#"Number" "Flag" "Scale"                                 "Ref"         "Weight"
 3         G2-1    -1   Li_0  1  H_0  1                  0.09240338    1.0
 3         G2-2    -1   Be_0  1  H_0  1                  0.07954580    1.0
 3         G2-3    -1    C_0  1  H_0  1                  0.13357373    1.0
 3         G2-4    -1    C_0  1  H_0  2                  0.30309566    1.0
 3         G2-5    -1    C_0  1  H_0  2                  0.28802930    1.0
 3         G2-6    -1    C_0  1  H_0  3                  0.48983726    1.0
 3         G2-7    -1    C_0  1  H_0  4                  0.66934252    1.0
 3         G2-8    -1    N_0  1  H_0  1                  0.13319060    1.0
 3         G2-9    -1    N_0  1  H_0  2                  0.28959063    1.0
 3         G2-10   -1    N_0  1  H_0  3                  0.47478335    1.0
 3         G2-11   -1    O_0  1  H_0  1                  0.16932837    1.0
 3         G2-12   -1    O_0  1  H_0  2                  0.37023453    1.0
 3         G2-13   -1    F_0  1  H_0  1                  0.22415183    1.0
 3         G2-14   -1   Si_0  1  H_0  2                  0.24072682    1.0
 3         G2-15   -1   Si_0  1  H_0  2                  0.20764966    1.0
 3         G2-16   -1   Si_0  1  H_0  3                  0.35854075    1.0
 3         G2-17   -1   Si_0  1  H_0  4                  0.51240758    1.0
 3         G2-18   -1    P_0  1  H_0  2                  0.24371235    1.0
 3         G2-19   -1    P_0  1  H_0  3                  0.38552813    1.0
 3         G2-20   -1    S_0  1  H_0  2                  0.28982275    1.0
 3         G2-21   -1   Cl_0  1  H_0  1                  0.16817893    1.0
 2         G2-22   -1   Li_0  2                          0.03883527    1.0
 3         G2-23   -1   Li_0  1  F_0  1                  0.21848754    1.0
 3         G2-24   -1    C_0  2  H_0  2                  0.64609991    1.0
 3         G2-25   -1    C_0  2  H_0  4                  0.89751528    1.0
 3         G2-26   -1    C_0  2  H_0  6                  1.13451720    1.0
 3         G2-27   -1    C_0  1  N_0  1                  0.28897941    1.0
 4         G2-28   -1    H_0  1  C_0  1  N_0  1          0.49812757    1.0
 3         G2-29   -1    C_0  1  O_0  1                  0.41271778    1.0
 4         G2-30   -1    H_0  1  C_0  1  O_0  1          0.44365463    1.0
 4         G2-31   -1    H_0  2  C_0  1  O_0  1          0.59501990    1.0
 4         G2-32   -1    H_0  4  C_0  1  O_0  1          0.81621300    1.0
 2         G2-33   -1    N_0  2                          0.36414644    1.0
 3         G2-34   -1    N_0  2  H_0  4                  0.69852855    1.0
 3         G2-35   -1    N_0  1  O_0  1                  0.24302825    1.0
 2         G2-36   -1    O_0  2                          0.19096246    1.0
 3         G2-37   -1    H_0  2  O_0  2                  0.42745491    1.0
 2         G2-38   -1    F_0  2                          0.05985550    1.0
 3         G2-39   -1    C_0  1  O_0  2                  0.61930732    1.0
 2         G2-40   -1   Na_0  2                          0.02714276    1.0
 2         G2-41   -1   Si_0  2                          0.11770782    1.0
 2         G2-42   -1    P_0  2                          0.18680322    1.0
 2         G2-43   -1    S_0  2                          0.16012255    1.0
 2         G2-44   -1   Cl_0  2                          0.08960975    1.0
 3         G2-45   -1   Na_0  1 Cl_0  1                  0.15483075    1.0
 3         G2-46   -1   Si_0  1  O_0  1                  0.30534934    1.0
 3         G2-47   -1    S_0  1  C_0  1                  0.27205482    1.0
 3         G2-48   -1    S_0  1  O_0  1                  0.19798705    1.0
 3         G2-49   -1   Cl_0  1  O_0  1                  0.10110933    1.0
 3         G2-50   -1    F_0  1 Cl_0  1                  0.09578412    1.0
 3         G2-51   -1   Si_0  2  H_0  6                  0.84390798    1.0
 4         G2-52   -1    C_0  1  H_0  3 Cl_0  1          0.62713868    1.0
 4         G2-53   -1    H_0  4  C_0  1  S_0  1          0.75370993    1.0
 4         G2-54   -1    H_0  1  O_0  1 Cl_0  1          0.26022258    1.0
 3         G2-55   -1    S_0  1  O_0  2                  0.40977415    1.0
 2         G2-136  -1    H_0  2                          0.17457832    1.0

