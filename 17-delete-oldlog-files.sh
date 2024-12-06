#!/bin/bash

SOURCE_DIRECTORY="/tmp/logs/"

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

if [ -d $SOURCE_DIRECTORY ]
then
    echo "$SOURCE_DIRECTORY exists"
else
    echo "$SOURCE_DIRECTORY is not exixts"
fi


while IFS= read -r line
do 
    echo "Deleting file : $line"
    rm -rf $line
done <<< $FILES



