#! /usr/bin/env csh
# Usage :: 为文件名加前缀
setenv BATCH_PATH /home/igor/Dropbox/SourceCode-Pool/Batch_Config/Data
setenv IGOR_MODULES_PATH /home/igor/Dropbox/SourceCode-Pool/My_Modules

python $BATCH_PATH/change_name.py $1
