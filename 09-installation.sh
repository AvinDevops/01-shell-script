#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "please run with root access"
    #exit 1
else
    echo "you are root user, you have access to install"
fi

dnf install mysql -y
if [ $? -ne 0 ]
then
    echo "Mysql installation is failed"
else
    echo "Mysql installation is success"
fi


echo "Is script proceeding..?"