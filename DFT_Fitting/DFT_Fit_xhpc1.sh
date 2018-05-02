#!/usr/bin/env bash

export ROOT_PATH=/share/home/wenxinzy/export/Batch_Config
export FITTING_PATH=${ROOT_PATH}/DFT_Fitting
export IGOR_MODULES_PATH=${ROOT_PATH}/Modules

export PYPATH=/share/apps/Python/Anaconda2/bin/

nohup ${PYPATH}/python2.7 ${FITTING_PATH}/DFT_Fit.py $*  
