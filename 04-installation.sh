#!/bin/bash

USERID=$(id -u)

if  [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root user"
    exit 1 #failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing mysql is failure"
    exit 1
else
    echo "Installing mysql is SUCCESS"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing nginx failure"
    exit 1
else
    echo "Installing nginx SUCCESS"
fi

dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing mongodb-mongosh failure"
    exit 1
else
    echo "Installing mongodb-mongosh SUCCESS"
fi