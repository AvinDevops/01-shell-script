#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOG=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

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
    echo $i
    dnf list installed mysql &>> $LOG
    if [ $? -ne 0 ]
    then
        echo -e "$i is already installed...$G SKIPPING $N"
    else
        echo -e "$i is not installed...$R now install it"
    fi
done