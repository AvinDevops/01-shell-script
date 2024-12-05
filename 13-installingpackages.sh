#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOG=/tmp/$SCRIPTNAME-$TIMESTAMP.log



if [ $USERID -ne 0 ]
then
    echo "you are not root user"
    exit 1
else
    echo "you have root access"
fi

echo "all packages: $@"