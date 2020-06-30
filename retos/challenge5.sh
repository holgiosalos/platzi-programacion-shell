#!/bin/bash
# Challenge #1: Creating variables and·printing·their·values on a log file with the following format YYYYmmddHHMMSS.log

option="Holmes"
result=30

fileName=`date +%Y%m%d%H%M%S`

echo "Option: $option, Result: $result" >> "$fileName.log"

