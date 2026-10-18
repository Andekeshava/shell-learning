#!/bin/bash

USER_ID=$(id -u)

log_folder="/var/log/shell-learning/"
log_file="${log_folder}/${0}.log"

if [ ${USER_ID} -ne 0 ]; then
   echo "run the script using sudo access"
   exit 1
fi

mkdir -p ${log_folder}

validate(){
    if [ ${1} -ne 0 ]; then
       echo "${2} failed"
       exit 1
    else
       echo "${2} success"
    fi         
}

for package in $@;
do
  echo "installing $package......"
  dnf install $package -y
  validate $? "${package} is"
done  