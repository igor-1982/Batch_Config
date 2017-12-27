# The project environment :
# 	"ProjDir" specifying the storage DIR of this project
# 	"ProjCtrl" = 0 : to run all the jobs
#		   = 1 : to fetch result from existed log and chk files
#		   = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default one)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./B3LYP           2              Gaussian

# The project description
__title__ ::
"============================ G2 set ==============================="
"All the geometries are obtained from series papers of Martin JML"
"A. Karton, A. Tarnopolsky, J. F. Lamere, G. C. SChatz, and "
"J. M. L. Martin, J. Phys. Chem. A 112, 12868-12886(2008)"


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
#               117 is the total number of jobs in this batch list
__batch__ ::  117
#"Flag"         "DIR"                         "InpName"       "JobType"
# Atoms  18
 H_0            <PATH1>/EAtom                 H_0.com         energy 
 He_0           <PATH1>/EAtom                 He_0.com        energy 
 Li_0           <PATH1>/EAtom                 Li_0.com        energy 
 Be_0           <PATH1>/EAtom                 Be_0.com        energy 
 B_0            <PATH1>/EAtom                 B_0.com         energy 
 C_0            <PATH1>/EAtom                 C_0.com         energy 
 N_0            <PATH1>/EAtom                 N_0.com         energy 
 O_0            <PATH1>/EAtom                 O_0.com         energy 
 F_0            <PATH1>/EAtom                 F_0.com         energy 
 Ne_0           <PATH1>/EAtom                 Ne_0.com        energy 
 Na_0           <PATH1>/EAtom                 Na_0.com        energy 
 Mg_0           <PATH1>/EAtom                 Mg_0.com        energy 
 Al_0           <PATH1>/EAtom                 Al_0.com        energy 
 Si_0           <PATH1>/EAtom                 Si_0.com        energy 
 P_0            <PATH1>/EAtom                 P_0.com         energy 
 S_0            <PATH1>/EAtom                 S_0.com         energy 
 Cl_0           <PATH1>/EAtom                 Cl_0.com        energy 
 Ar_0           <PATH1>/EAtom                 Ar_0.com        energy 
# W4 set 99
 W40-01          <PATH2>/W4                    W40-01.com     energy
 W40-02          <PATH2>/W4                    W40-02.com     energy
 W40-03          <PATH2>/W4                    W40-03.com     energy
 W40-04          <PATH2>/W4                    W40-04.com     energy
 W40-05          <PATH2>/W4                    W40-05.com     energy
 W40-06          <PATH2>/W4                    W40-06.com     energy
 W40-07          <PATH2>/W4                    W40-07.com     energy
 W40-08          <PATH2>/W4                    W40-08.com     energy
 W40-09          <PATH2>/W4                    W40-09.com     energy
 W40-10          <PATH2>/W4                    W40-10.com     energy
 W40-11          <PATH2>/W4                    W40-11.com     energy
 W40-12          <PATH2>/W4                    W40-12.com     energy
 W40-13          <PATH2>/W4                    W40-13.com     energy
 W40-14          <PATH2>/W4                    W40-14.com     energy
 W40-15          <PATH2>/W4                    W40-15.com     energy
 W40-16          <PATH2>/W4                    W40-16.com     energy
 W40-17          <PATH2>/W4                    W40-17.com     energy
 W40-18          <PATH2>/W4                    W40-18.com     energy
 W40-19          <PATH2>/W4                    W40-19.com     energy
 W40-20          <PATH2>/W4                    W40-20.com     energy
 W40-21          <PATH2>/W4                    W40-21.com     energy
 W40-22          <PATH2>/W4                    W40-22.com     energy
 W40-23          <PATH2>/W4                    W40-23.com     energy
 W40-24          <PATH2>/W4                    W40-24.com     energy
 W40-25          <PATH2>/W4                    W40-25.com     energy
 W40-26          <PATH2>/W4                    W40-26.com     energy
 W40-27          <PATH2>/W4                    W40-27.com     energy
 W40-28          <PATH2>/W4                    W40-28.com     energy
 W40-29          <PATH2>/W4                    W40-29.com     energy
 W40-30          <PATH2>/W4                    W40-30.com     energy
 W40-31          <PATH2>/W4                    W40-31.com     energy
 W40-32          <PATH2>/W4                    W40-32.com     energy
 W44-01          <PATH2>/W4                    W44-01.com      energy
 W44-02          <PATH2>/W4                    W44-02.com      energy
 W44-03          <PATH2>/W4                    W44-03.com      energy
 W44-04          <PATH2>/W4                    W44-04.com      energy
 W44-05          <PATH2>/W4                    W44-05.com      energy
 W44-06          <PATH2>/W4                    W44-06.com      energy
 W44-07          <PATH2>/W4                    W44-07.com      energy
 W44-08          <PATH2>/W4                    W44-08.com      energy
 W44-09          <PATH2>/W4                    W44-09.com      energy
 W44-10          <PATH2>/W4                    W44-10.com      energy
 W44-11          <PATH2>/W4                    W44-11.com      energy
 W44-12          <PATH2>/W4                    W44-12.com      energy
 W44-13          <PATH2>/W4                    W44-13.com      energy
 W44-14          <PATH2>/W4                    W44-14.com      energy
 W44-15          <PATH2>/W4                    W44-15.com      energy
 W44-16          <PATH2>/W4                    W44-16.com      energy
 W44-17          <PATH2>/W4                    W44-17.com      energy
 W44-18          <PATH2>/W4                    W44-18.com      energy
 W44-19          <PATH2>/W4                    W44-19.com      energy
 W44-20          <PATH2>/W4                    W44-20.com      energy
 W44-21          <PATH2>/W4                    W44-21.com      energy
 W44-22          <PATH2>/W4                    W44-22.com      energy
 W44-23          <PATH2>/W4                    W44-23.com      energy
 W44-24          <PATH2>/W4                    W44-24.com      energy
 W44-25          <PATH2>/W4                    W44-25.com      energy
 W44-26          <PATH2>/W4                    W44-26.com      energy
 W44-27          <PATH2>/W4                    W44-27.com      energy
 W44-28          <PATH2>/W4                    W44-28.com      energy
 W44-29          <PATH2>/W4                    W44-29.com      energy
 W43-01          <PATH2>/W4                    W43-01.com      energy
 W43-02          <PATH2>/W4                    W43-02.com      energy
 W43-03          <PATH2>/W4                    W43-03.com      energy
 W43-04          <PATH2>/W4                    W43-04.com      energy
 W43-05          <PATH2>/W4                    W43-05.com      energy
 W43-06          <PATH2>/W4                    W43-06.com      energy
 W43-07          <PATH2>/W4                    W43-07.com      energy
 W43-08          <PATH2>/W4                    W43-08.com      energy
 W43-09          <PATH2>/W4                    W43-09.com      energy
 W43-10          <PATH2>/W4                    W43-10.com      energy
 W43-11          <PATH2>/W4                    W43-11.com      energy
 W43-12          <PATH2>/W4                    W43-12.com      energy
 W43-13          <PATH2>/W4                    W43-13.com      energy
 W43-14          <PATH2>/W4                    W43-14.com      energy
 W43-15          <PATH2>/W4                    W43-15.com      energy
 W43-16          <PATH2>/W4                    W43-16.com      energy
 W43-17          <PATH2>/W4                    W43-17.com      energy
 W43-18          <PATH2>/W4                    W43-18.com      energy
 W43-19          <PATH2>/W4                    W43-19.com      energy
 W42-01          <PATH2>/W4                    W42-01.com      energy
 W42-02          <PATH2>/W4                    W42-02.com      energy
 W42-03          <PATH2>/W4                    W42-03.com      energy
 W42-04          <PATH2>/W4                    W42-04.com      energy
 W42-05          <PATH2>/W4                    W42-05.com      energy
 W42-06          <PATH2>/W4                    W42-06.com      energy
 W42-07          <PATH2>/W4                    W42-07.com      energy
 W42-08          <PATH2>/W4                    W42-08.com      energy
 W42-09          <PATH2>/W4                    W42-09.com      energy
 W42-10          <PATH2>/W4                    W42-10.com      energy
 W42-11          <PATH2>/W4                    W42-11.com      energy
 W42-12          <PATH2>/W4                    W42-12.com      energy
 W42-13          <PATH2>/W4                    W42-13.com      energy
 W42-14          <PATH2>/W4                    W42-14.com      energy
 W42-15          <PATH2>/W4                    W42-15.com      energy
 W42-16          <PATH2>/W4                    W42-16.com      energy
 W42-17          <PATH2>/W4                    W42-17.com      energy
 W42-18          <PATH2>/W4                    W42-18.com      energy
 W42-19          <PATH2>/W4                    W42-19.com      energy

# Training set for the total energy
#               99 is the total number of the testing energy data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
#                     which scales the calc. result in "a.u."
#                     to the ref. data in "kcal/mol"
__energy__ :: 99  627.51
#"Number" "Flag" "Scale"                                 "Ref"      "Weight"
 1         W40-01  1                                     0.0        1.0
 1         W40-02  1                                     0.0        1.0
 1         W40-03  1                                     0.0        1.0
 1         W40-04  1                                     0.0        1.0
 1         W40-05  1                                     0.0        1.0
 1         W40-06  1                                     0.0        1.0
 1         W40-07  1                                     0.0        1.0
 1         W40-08  1                                     0.0        1.0
 1         W40-09  1                                     0.0        1.0
 1         W40-10  1                                     0.0        1.0
 1         W40-11  1                                     0.0        1.0
 1         W40-12  1                                     0.0        1.0
 1         W40-13  1                                     0.0        1.0
 1         W40-14  1                                     0.0        1.0
 1         W40-15  1                                     0.0        1.0
 1         W40-16  1                                     0.0        1.0
 1         W40-17  1                                     0.0        1.0
 1         W40-18  1                                     0.0        1.0
 1         W40-19  1                                     0.0        1.0
 1         W40-20  1                                     0.0        1.0
 1         W40-21  1                                     0.0        1.0
 1         W40-22  1                                     0.0        1.0
 1         W40-23  1                                     0.0        1.0
 1         W40-24  1                                     0.0        1.0
 1         W40-25  1                                     0.0        1.0
 1         W40-26  1                                     0.0        1.0
 1         W40-27  1                                     0.0        1.0
 1         W40-28  1                                     0.0        1.0
 1         W40-29  1                                     0.0        1.0
 1         W40-30  1                                     0.0        1.0
 1         W40-31  1                                     0.0        1.0
 1         W40-32  1                                     0.0        1.0
 1         W44-01  1                                     0.0        1.0
 1         W44-02  1                                     0.0        1.0
 1         W44-03  1                                     0.0        1.0
 1         W44-04  1                                     0.0        1.0
 1         W44-05  1                                     0.0        1.0
 1         W44-06  1                                     0.0        1.0
 1         W44-07  1                                     0.0        1.0
 1         W44-08  1                                     0.0        1.0
 1         W44-09  1                                     0.0        1.0
 1         W44-10  1                                     0.0        1.0
 1         W44-11  1                                     0.0        1.0
 1         W44-12  1                                     0.0        1.0
 1         W44-13  1                                     0.0        1.0
 1         W44-14  1                                     0.0        1.0
 1         W44-15  1                                     0.0        1.0
 1         W44-16  1                                     0.0        1.0
 1         W44-17  1                                     0.0        1.0
 1         W44-18  1                                     0.0        1.0
 1         W44-19  1                                     0.0        1.0
 1         W44-20  1                                     0.0        1.0
 1         W44-21  1                                     0.0        1.0
 1         W44-22  1                                     0.0        1.0
 1         W44-23  1                                     0.0        1.0
 1         W44-24  1                                     0.0        1.0
 1         W44-25  1                                     0.0        1.0
 1         W44-26  1                                     0.0        1.0
 1         W44-27  1                                     0.0        1.0
 1         W44-28  1                                     0.0        1.0
 1         W44-29  1                                     0.0        1.0
 1         W43-01  1                                     0.0        1.0
 1         W43-02  1                                     0.0        1.0
 1         W43-03  1                                     0.0        1.0
 1         W43-04  1                                     0.0        1.0
 1         W43-05  1                                     0.0        1.0
 1         W43-06  1                                     0.0        1.0
 1         W43-07  1                                     0.0        1.0
 1         W43-08  1                                     0.0        1.0
 1         W43-09  1                                     0.0        1.0
 1         W43-10  1                                     0.0        1.0
 1         W43-11  1                                     0.0        1.0
 1         W43-12  1                                     0.0        1.0
 1         W43-13  1                                     0.0        1.0
 1         W43-14  1                                     0.0        1.0
 1         W43-15  1                                     0.0        1.0
 1         W43-16  1                                     0.0        1.0
 1         W43-17  1                                     0.0        1.0
 1         W43-18  1                                     0.0        1.0
 1         W43-19  1                                     0.0        1.0
 1         W42-01  1                                     0.0        1.0
 1         W42-02  1                                     0.0        1.0
 1         W42-03  1                                     0.0        1.0
 1         W42-04  1                                     0.0        1.0
 1         W42-05  1                                     0.0        1.0
 1         W42-06  1                                     0.0        1.0
 1         W42-07  1                                     0.0        1.0
 1         W42-08  1                                     0.0        1.0
 1         W42-09  1                                     0.0        1.0
 1         W42-10  1                                     0.0        1.0
 1         W42-11  1                                     0.0        1.0
 1         W42-12  1                                     0.0        1.0
 1         W42-13  1                                     0.0        1.0
 1         W42-14  1                                     0.0        1.0
 1         W42-15  1                                     0.0        1.0
 1         W42-16  1                                     0.0        1.0
 1         W42-17  1                                     0.0        1.0
 1         W42-18  1                                     0.0        1.0
 1         W42-19  1                                     0.0        1.0




