#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please access with root user"
    exit 1
else
    echo "you are root user"
fi

dnf install mysqll -y

echo "Is sscript reached last step"

