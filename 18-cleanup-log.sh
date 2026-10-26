#!/bin/bash

source_dir=$1
days=${2:-14} # if you run the script without passing days then by default it will take 14days as input and delete files older than 14

usage(){
    echo "USAGE:: $0 [SOURCE_DIR] [days are optional but by default it takes 14days]"
    exit 1
}

if [ -z $source_dir ]; then
   echo "ERROR:: MISSING PARAMETERS"
   usage
fi

if [ ! -d "$source_dir" ]; then
   echo "ERROR:: $source_dir doesn't exist"
fi

echo "Scanning files older than 14days to delete"

files_to_delete = $(find "$source_dir" -name "*.log" -type f -mtime +$days)

if [ -z $files_to_delete ]; then
   echo "No files older than 14days are found"
   exit 0
fi

while IFS= read -r line
do
  echo "Files which are going to be deleted are: $line"
  rm -rf $line
  echo "Files which are deleted are: $line"
done <<< $files_to_delete
   