#!/bin/bash 
openrc default
rc-service nginx start 
rc-service php-fpm7 start 
sleep 10
while [ true ]; do
pgrep nginx
STATUS1=$?
pgrep php-fpm7
STATUS2=$?
echo $STATUS1 $STATUS2
if [ $STATUS1 != 0 ]
then
    rc-service nginx restart 
fi
if [ $STATUS2 != 0 ]
then
    rc-service php-fpm7 restart
fi
done
 
