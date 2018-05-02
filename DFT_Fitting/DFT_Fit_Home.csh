#!/usr/bin/env tcsh

setenv ROOT_PATH /home/igor/Documents/Package-Pool/Batch_Config
setenv FITTING_PATH ${ROOT_PATH}/DFT_Fitting
setenv IGOR_MODULES_PATH ${ROOT_PATH}/Modules
#export FITTING_PATH=/home/igor/Documents/Package-Pool/DFT_Fitting
#export IGOR_MODULES_PATH=$FITTING_PATH/modules

nohup python2.7 $FITTING_PATH/DFT_Fit.py $*  
