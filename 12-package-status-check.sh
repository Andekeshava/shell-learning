#!/bin/bash

USER_ID=$(id -u)

log_folder="/var/log/shell-learning/"
log_file="${log_folder}/${0}.log"

if [ ${USER_ID} -ne 0 ]; then
   echo "Please execute the script with sudo access"
   exit 1
fi

mkdir -p "${log_folder}"



validate() {
    if [ $1 -ne 0 ]; then
       #systemctl enable nginx
       echo "${2} failed" | tee -a $log_file
       exit 1
    else
       echo "${2} success" | tee -a $log_file
    fi       
}

echo "Installing nginx...."
dnf install nginx -y &>> ${log_file}
validate $? "nginx installation is"


if systemctl is-active --quiet nginx; then
   echo "Nginx is already running"
else 
   echo "Nginx is still not running...starting nginx" | tee -a ${log_file}

   systemctl enable nginx &>> ${log_file}
   validate $? "Nginx enable is"

   systemctl start nginx &>> ${log_file}
   validate $? "Nginx start is"
fi

if systemctl is-active --quiet nginx; then
   echo "Nginx is running successfully" | tee -a ${log_file}
else
   echo "Nginx is still failing" | tee -a ${log_file}
   exit 1
fi   


