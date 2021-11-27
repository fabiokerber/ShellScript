#!/bin/bash
JOB=`basename $0`
HOST=`hostname`
DATA=`date '+%d/%m/%Y - %H:%M'`

SERVER=(
    serverbananinha01
    serverbananinha02
)

LEN=${#SERVER[@]}

for (( i=0; i<$LEN; i++ ))
do
    SLIST="${SERVER[$i]}"

rm -rf /var/log/httpd/*

done