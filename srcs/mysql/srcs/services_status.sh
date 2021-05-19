#!/bin/bash 

openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'password'; FLUSH PRIVILEGES;"
mysql -u root -e "create database wordpress;"
mysql -u root -e "create database phpmyadmin;" 
mysql < /tmp/phpmyadmin.sql -u root
rc-service telegraf start
while sleep 20; do
pgrep mysqld > /dev/null
status1=$?
pgrep telegraf >> /dev/null
status2=$?
if [ $status1 !=  0 ]
then
   # rc-service mariadb start
   exit 1
fi
if [ $status2 != 0 ]; then
   # rc-service telegraf restart
   exit 1
fi
done
 
