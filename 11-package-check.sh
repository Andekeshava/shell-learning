#!/bin/bash

USER_ID=$(id -u)

log_folder="var/log/shell-learning/"
log_file="${log_folder}/${0}.log"

if [${USER_ID} -ne 0]; then
   echo "failed--> execute the script with sudo"
   exit 1
fi

mkdir -p "$log_folder"

validate(){
    if [$1 -ne 0]; then
       echo "${2} failed" | tee -a ${log_file}
       exit 1
    else
       echo "${2} success"  | tee -a ${log_file}
    fi   
}

for package in nginx git mysql; do
    rpm -q ${package} &>> ${log_file}
    validate $? "Pacakge Installation status is:"
done