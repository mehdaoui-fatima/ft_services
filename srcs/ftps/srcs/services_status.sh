#!/bin/bash 
openrc default
rc-service vsftpd start 
rc-service telegraf start
while sleep 20;  do
pgrep vsftpd > /dev/null
status1=$?
pgrep telegraf > /dev/null
status2=$?
if [ $status1 != 0 ]
then
    #rc-service vsftpd restart
    exit 1
fi
if [ $status2 != 0 ]
then
    #rc-service telegraf restart
    exit 1
fi

done
 
