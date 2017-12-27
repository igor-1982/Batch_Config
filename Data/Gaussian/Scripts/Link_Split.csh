#! /usr/bin/env csh

setenv BATCH_PATH /home/igor/Dropbox/SourceCode-Pool/Batch_Config/Data/Gaussian
setenv IGOR_MODULES_PATH /home/igor/Dropbox/SourceCode-Pool/My_Modules

python $BATCH_PATH/Link_Split.py $argv[1-]
