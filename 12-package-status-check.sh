#!/bin/bash

USER_ID=$(id -u)

log_folder="/var/log/shell-learning"
log_file="${log_folder}/$0.log"

if [ ${USER_ID} -ne 0 ]; then
   echo "Please execute the script with sudo access"
   exit 1
fi

mkdir -p ${log_file}

validate(){
    if [ $1 -ne 0 ]; then
       echo "${2} not in running state" | tee -a $log_file
    else
       echo "${2} is in running state" | tee -a $log_file
    fi       
}

for status in nginx; do
   dnf install nginx -y &>> ${log_file}
   systemctl status nginx &>> ${log_file}
   validate $? "nginx status"
done   
