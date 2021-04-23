#!/bin/bash 
openrc default
rc-service vsftpd start 
sleep 10
while [ true ]; do
pgrep vsftpd > /dev/null
STATUS1=$?
if [ $STATUS1 != 0 ]
then
    rc-service vsftpd restart 
fi
done
 
