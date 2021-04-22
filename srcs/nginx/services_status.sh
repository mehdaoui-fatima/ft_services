#!/bin/bash 
openrc default
rc-service nginx start 
var=$?
if [ $var -ne 0 ]; then 
	echo "failed to start nginx...."
	exit $var 
fi

while [ true ]; do
pgrep nginx > /dev/null
STATUS1=$?
if [ $STATUS1 !=  0 ]
then
    rc-service nginx restart 
fi
done
 
