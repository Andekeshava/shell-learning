#!/bin/bash
START_TIME=$(date +%s)
echo "start time of the script execution: $START_TIME"

sleep 20

END_TIME=$(date +%s)
echo "end time of the script ececution: $END_TIME"

TOTAL_TIME=$(END_TIME - START_TIME)
echo "total time taken for the script execution is: $TOTAL_TIME"