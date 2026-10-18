#!/bin/bash
set -e

USER_ID=$(id -u)

log_folder="/var/log/shell-learning/"
log_file="${log_folder}/${0}.log"

trap 'echo "error is in line ${LINENO}", Commad: $BASH_COMMAND "' ERR

if [ ${USER_ID} -ne 0 ]; then
   echo "run the script using sudo access"
   exit 1
fi

mkdir -p ${log_folder}


for package in $@;
do
  dnf list installed ${package} &>> $log_file
  if [ $? -ne 0 ]; then
     echo "${package} is installing"
     dnf install $package -y &>> $log_file
  else
     echo "$package is already installed"
  fi   

done