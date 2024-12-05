#!/bin/bash

USERID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOG=/tmp/$SCRIPTNAME-$TIMESTAMP.log

echo "$SCRIPTNAME"

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo "$2.... is failed"
        exit 1
    else
        echo "$2.... is success"
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