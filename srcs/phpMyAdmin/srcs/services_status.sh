#!/bin/bash 
openrc default
rc-service nginx start 
rc-service php-fpm7 start 
rc-service telegraf start
while sleep 20; do
pgrep nginx >> /dev/null
status1=$?
pgrep php-fpm7 >> /dev/null
status2=$? 
pgrep telegraf >> /dev/null
status3=$? 
if [ $status1 != 0 ]
then
    # rc-service nginx restart 
    exit 1 
fi
if [ $status2 != 0 ]
then
    # rc-service php-fpm7 restart
    exit 1 
fi
if [ $status3 != 0 ]; then
    # rc-service telegraf restart
    exit 1 
fi
done
 
