#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if  [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root user"
    exit 1 #failure is other than 0
fi

VALIDATE(){ #functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: Installing $2.....$R failure $N"
        exit 1
    else
         echo -e "Installing $2..... $G SUCCESS $N"
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "mysql"
else 
    echo "mysql already exist ... $G SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
    echo "nginx already exist ... $G SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then 
    dnf install python3 -y
    VALIDATE $? "python3"
else 
    echo "python3 already exist ... $G SKIPPING $N"
fi    