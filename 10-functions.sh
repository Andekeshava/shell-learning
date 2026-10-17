#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "Cannot run the script without sudo access"
   exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
       echo "${2} failed"
       exit 1
    else
       echo "${2} Success"    
}

echo "running....pls wait...."
dnf install nginx -y

validate $? "Installation is"