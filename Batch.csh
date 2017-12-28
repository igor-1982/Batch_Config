#! /usr/bin/env csh

setenv BATCH_PATH /home/igor/Documents/Package-Pool/Batch_Config
setenv IGOR_MODULES_PATH $BATCH_PATH/Modules

python2 $BATCH_PATH/Batch.py $argv[1]
