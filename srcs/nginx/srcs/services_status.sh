#!/bin/bash 
openrc default
rc-service nginx start 
rc-service telegraf start
while sleep 20; do
	pgrep nginx > /dev/null
	status1=$?
	pgrep telegraf > /dev/null
	sleep 2
	status2=$?
	if [ $status1 !=  0 ]
	then
		# rc-service nginx restart 
		exit 1
	fi
	if [ $status2 !=  0 ]
	then
		# rc-service telegraf restart
		exit 1
	fi
done
 
