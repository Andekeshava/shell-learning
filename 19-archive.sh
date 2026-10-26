#! /bin/bash

source_dir=$1
destination_dir=$2
days={3:-14}

usage(){
    echo "USAGE: $0 [source_dir] [Destination_dir] [Days are options, by default it takes 14days]"
}

if [ -z "$source_dir" ] || [ -z "$destination_dir" ]; then
   echo "Either source or destination directories are empty"
   usage
fi

if [ ! -d "$source_dir" ] && [ ! -d "$destination_dir" ]; then
   echo "ERROR: Either source or destination directory are not present"
   exit 1
fi

echo "Scanning the files"

files_to_archive=$( find $source_dir --name "*.log" --type f --mtime +$days )

if [ -z "$files_to_archive" ]; then
   echo "ALRET: There are not files older than 14days"
   exit 0
fi

timestamp=$(date +%Y-%m-%d-%H-%M-%S)

file_name="$destination_dir/logs-$timestamp.tar.gz"

tar -czf $file_name $files_to_archive

if [ $? -ne 0 ]; then 
   echo "==== ERROR: Log files are failed to archive ===="
   exit 1
else
   echo "==== File is compresed ===="
   while IFS= read -r line
   do
     echo "Log files are archived"
     rm -rf $line
     echo "==== Files are Deleted ===="
   done <<< $files_to_archive
fi     


