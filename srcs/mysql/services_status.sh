#!/bin/bash 
openrc default
rc-service mariadb start
while [ true ]; do
pgrep nginx > /dev/null
STATUS1=$?
if [ $STATUS1 !=  0 ]
then
   rc-service mariadb start
fi
done
 
