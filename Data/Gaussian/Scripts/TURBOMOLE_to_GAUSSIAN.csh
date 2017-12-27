#! /usr/bin/env csh

setenv BATCH_PATH /home/igor/Dropbox/SourceCode-Pool/Batch_Config/Data/Gaussian
setenv IGOR_MODULES_PATH /home/igor/Dropbox/SourceCode-Pool/My_Modules

foreach x ($argv)
python2.7 $BATCH_PATH/TURBOMOLE_to_GAUSSIAN.py $x
rm $x
end
