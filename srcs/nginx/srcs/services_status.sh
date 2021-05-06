#!/bin/bash 
openrc default
rc-service nginx start 
var=$?
if [ $var -ne 0 ]; then 
	echo "failed to start nginx...."
	exit $var 
fi
rc-service telegraf start
sleep 2
var=$?
if [ $var -ne 0 ]; then 
	echo "failed to start telegraf...."
	exit $var 
fi

while [ true ]; do
	pgrep nginx > /dev/null
	status1=$?
	pgrep telegraf > /dev/null
	sleep 2
	status2=$?
	if [ $status1 !=  0 ]
	then
		exit
	fi
	if [ $status2 !=  0 ]
	then
		exit
	fi
done
 
