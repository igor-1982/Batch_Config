#!/usr/bin/env bash

export ROOT_PATH=/home/igor/Documents/Package-Pool/Batch_Config
export FITTING_PATH=${ROOT_PATH}/DFT_Fitting
export IGOR_MODULES_PATH=${ROOT_PATH}/Modules

nohup python2 $FITTING_PATH/DFT_Fit.py $*  

