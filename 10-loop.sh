#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/Pratice1"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -P $LOGS_FOLDER
echo "Script started executing at : $(date)" | tee -a $LOG_FILE

if  [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root user"
    exit 1 #failure is other than 0
fi

VALIDATE(){ #functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: Installing $2.....$R failure $N" | tee -a $LOG_FILE
        exit 1
    else
         echo -e "Installing $2..... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

#$@

for package in $@
do
    echo "Package is : $Package"
done