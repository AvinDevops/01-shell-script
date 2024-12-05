#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOG=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R failed $N"
        exit1
    else
        echo -e "$2...$G Success $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "you are not root user"
    exit 1
else
    echo "you have root access"
fi

#echo "all packages: $@"

for i in $@
do 
    #echo $i
    dnf list installed $i &>> $LOG
    if [ $? -eq 0 ]
    then
        echo -e "$i is already installed...$R SKIPPING $N"
    else
        #echo -e "$i is not installed...$R now install it $N"
        dnf install $i -y &>> $LOG
        VALIDATE $? "Installing $i"
    fi
done