#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    #echo "exit status: $1"
    #echo "what are you doing: $2"

    if [ $1 -ne 0 ]
    then
        echo "$2... is failed"
        exit 1
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

dnf install mysql -y
VALIDATE $? "Installing Mysql"

dnf install git -y
VALIDATE $? "Installing Git"

dnf install dockerrr -y
VALIDATE $? "Installing docker"

echo "Script reached last line of code..!"