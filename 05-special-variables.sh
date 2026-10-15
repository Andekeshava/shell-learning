#!/bin/bash

echo "all the passed varailbles are: $@"
echo "number of arguments passed are: $#"
echo " PID of the present script is: $$"
echo "who is running your script: $HOME"
echo "Line numbers for the script: $LINENO"
echo "current path of our script is: $PWD"
sleep 10 &
echo "PID of the script running in the background is: $!"
echo "total time taken to execute the script is: $SECONDS"
echo "realpath: $(realpath $0)"
echo "exit status code of the previous command is: $?"
