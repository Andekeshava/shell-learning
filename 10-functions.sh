#!/bin/bash

USER_ID=$(id -u)
log_folder="/var/log/shell-learning"
log_file="${log_folder}/${0}.log"

if [ $USER_ID -ne 0 ]; then
   echo "Cannot run the script without sudo access"
   exit 1
fi

mkdir -p $log_folder

validate(){
    if [ $1 -ne 0 ]; then
       echo "${2} failed" | tee -a $log_file
       exit 1
    else
       echo "${2} Success" | tee -a $log_file    
    fi   
}

echo "running....pls wait...."
dnf install nginx -y &>> $log_file

validate $? "Nginx Installation is"

dnf install mysql -y &>> $log_file
validate $? "Mysql installation is"