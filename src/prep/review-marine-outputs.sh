#!/bin/bash

mode=$1
n=10

if [ $mode == 'full' ]; then
   n=1000
fi

BASE_OUTPUT_DIR=/gws/nopw/j04/c3s311a_lot2/data/marine/r092019_cdm_lite/ICOADS_R3.0.0T/level1a
BASE_LOG_DIR=/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/marine
BASE_LOTUS_DIR=/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/lotus-marine

echo "[INFO] Last Outputs..."
echo $BASE_OUTPUT_DIR
ls -ltr $BASE_OUTPUT_DIR | head -$n

echo "[INFO] Last logs..."
echo $BASE_LOG_DIR
ls -ltr $BASE_LOG_DIR/*/* | head -$n

echo "[INFO] Last LOTUS logs..."
echo $BASE_LOTUS_DIR
ls -ltr $BASE_LOTUS_DIR | head -$n

echo 
echo "[INFO] Number of jobs running"
bjobs | wc -l 
echo "[INFO] Top jobs..."
bjobs | head -$n
