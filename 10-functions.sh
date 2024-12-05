#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "exit status: $1"
    echo "what are you doing: $2"
}

if [ $USERID -ne 0 ]
then
    echo "please access with root user"
    exit 0
else
    echo "you have root access, please install"
fi

dnf install mysql -y
VALIDATE $? "Installing Mysql"