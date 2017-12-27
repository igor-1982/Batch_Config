# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files 
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./MP2            2               Gaussian

# The project description
__title__::
"This project aim to calculate electronic response properties along "
"the longatitude direction (X)"
"All the geometries are optimized at MP2/6-31G"


# To specify machine and option keywords of Gaussian Package
__gaussian__ ::
%nproc=8
%mem=6000MB
#P MP2(full)/6-31G scf=tight nosymm


# Specify <MacroPath> in the batch list
__macro_path__ ::
<PATH1> = '.'

# The molecular set to batch:
#               12 is the total number of jobs in this batch list
__batch__ :: 12
PNA              <PATH1>/Polar         PNA.com          polar
ANS              <PATH1>/Polar         ANS.com          polar
C2H2_5           <PATH1>/Polar         C2H2_5.com       polar
C2H2_6           <PATH1>/Polar         C2H2_6.com       polar
C2H2_7           <PATH1>/Polar         C2H2_7.com       polar
C2H2_8           <PATH1>/Polar         C2H2_8.com       polar
C2H2_9           <PATH1>/Polar         C2H2_9.com       polar
C2H2_10	         <PATH1>/Polar         C2H2_10.com      polar
C2H2_11	         <PATH1>/Polar         C2H2_11.com      polar
C2H2_12	         <PATH1>/Polar         C2H2_12.com      polar
C2H2_13	         <PATH1>/Polar         C2H2_13.com      polar
C2H2_14	         <PATH1>/Polar         C2H2_14.com      polar


# Training set for the electronic response property
#              12 is the total number of testing data for elec. resp. prop.
#   "1.0 1.0 1.0" is the scale list to scales dipole, polarizability and
#                    hyperpolarizability from the unit of calc. data
#                    to the unit of ref. data
__polar__ :: 12  1.0 1.0 1.0
# The electronic response properties along X direction 
# which is the longatitude direction for this set of molecules
3     PNA  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3     ANS  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3  C2H2_5  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3  C2H2_6  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3  C2H2_7  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3  C2H2_8  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3  C2H2_9  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3 C2H2_10  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3 C2H2_11  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3 C2H2_12  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3 C2H2_13  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0
3 C2H2_14  X 1.0 1.0  XX 1.0 1.0   XXX 1.0 1.0

