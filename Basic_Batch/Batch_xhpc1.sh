#! /usr/bin/env bash

export ROOT_PATH=/share/home/wenxinzy/export/Batch_Config
export IGOR_MODULES_PATH=$ROOT_PATH/Modules
export BATCH_PATH=$ROOT_PATH/Basic_Batch

python2 $BATCH_PATH/Batch.py $1
