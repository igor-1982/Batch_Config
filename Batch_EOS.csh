#! /usr/bin/env csh                                                                                                                                                                                                

setenv BATCH_PATH /eos/u/igor1982/export/Batch_Config
setenv IGOR_MODULES_PATH $BATCH_PATH/Modules

python2 $BATCH_PATH/Batch.py $argv[1]
