#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    #echo "exit status: $1"
    #echo "what are you doing: $2"

    if [ $1 -ne 0 ]
    then
        echo "$2... is failed"
    else
        echo "$2... is success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "please access with root user"
    exit 1
else
    echo "you have root access, please install"
fi

dnf install mysqll -y
VALIDATE $? "Installing Mysql"

echo "Script reached last line of code..!"