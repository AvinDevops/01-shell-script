#!/bin/bash

set -e

error_handler(){
    echo "error line no is : $1"
    echo "error description is : $2"
}

trap 'error_handler ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please access with root user"
    exit 1
else
    echo "you are root user"
fi

dnf install nginx -y 

dnf install mysqll -y

echo "Is script reached last step"

