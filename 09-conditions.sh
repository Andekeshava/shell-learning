#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "Run the command using sudo access"
   exit 1
fi

dnf install nginx -no

if [ $? -eq 0 ]; then
   echo "Nginx installation is failed"
   exit 1
else
   echo "Nginx Installation is success" 
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
   echo "MySql installation is failed"
   exit 1
else 
   echo "Mysql installation is success"
fi       

