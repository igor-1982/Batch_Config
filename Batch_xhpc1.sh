#! /usr/bin/env bash

export BATCH_PATH=/share/home/wenxinzy/export/Batch_Config
export IGOR_MODULES_PATH=$BATCH_PATH/Modules

python2 $BATCH_PATH/Batch.py $argv[1]
