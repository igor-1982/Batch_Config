#!/bin/env python
import os
import sys

FileList=os.listdir('./')
for item in FileList:
    tmpList = item.split('.')
    tmpName = '_'.join(tmpList[:-1])+'.com'
    os.rename(item,tmpName)
