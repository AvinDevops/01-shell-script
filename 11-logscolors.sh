#!/bin/bash

USERID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOG=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "$SCRIPTNAME"

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo -e "$2.... is $R failed $N"
        exit 1
    else
        echo -e "$2.... is $G success $N"
    fi
}


if [ $USERID -ne 0 ]
then
    echo "please access with root user"
    exit 1
else
    echo "you have root access"
fi

dnf install mysql -y &>> $LOG
VALIDATE $? "Installing mysql"

dnf install gitt -y &>> $LOG
VALIDATE $? "Installing Git"

echo "Is script loading..!"