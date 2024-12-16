#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_LIMIT=6
MESSAGE=""


while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}' )
    if [ $USAGE -ge $DISK_LIMIT ]
    then
        MESSAGE+="$FOLDER memory exceeds than disk limit $DISK_LIMIT, current usage: $USAGE"
    fi
done <<< $DISK_USAGE

echo -e "Message: $MESSAGE"