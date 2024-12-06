#!/bin/bash

SOURCE_DIRECTORY="/tmp/logs/"

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

for i in $FILES
do 
    echo $i
done




