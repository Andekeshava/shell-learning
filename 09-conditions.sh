#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "Run the command using sudo access"
   exit 1
fi

dnf install nginx -no

if [ $? -eq 0 ]; then
   echo "Nginx installation is Success"
else
   echo "Nginx Installation is failed" 
fi

