#! /usr/bin/env bash

export BATCH_PATH=/home/users/iyzhang/export/Batch_Config
export IGOR_MODULES_PATH=$BATCH_PATH/Modules

python2 $BATCH_PATH/Batch.py $1
