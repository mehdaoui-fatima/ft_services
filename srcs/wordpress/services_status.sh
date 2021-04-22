#!/bin/bash 
openrc default
rc-service nginx start 
var=$?
if [ $var -ne 0 ]; then 
	echo "failed to start nginx...."
	exit $var 
fi

rc-service php-fpm7 start 
var=$?
if [ $var -ne 0 ]; then 
	echo "failed to start php-fpm7...."
	exit $var 
fi

while [ true ]; do
pgrep nginx > /dev/null
STATUS1=$?
pgrep php-fpm7 > /dev/null
STATUS2=$?
if [ $STATUS1 -ne  0 ]
then
    rc-service nginx restart 
fi
if [ $STATUS2 -ne  0 ]
then
    rc-service php-fpm7 restart 
fi
done
 
