#! /usr/bin/env csh

setenv BATCH_PATH /draco/u/igor1982/export/Batch_Config
setenv IGOR_MODULES_PATH /draco/u/igor1982/export/My_Modules

python2 $BATCH_PATH/Batch.py $argv[1]
