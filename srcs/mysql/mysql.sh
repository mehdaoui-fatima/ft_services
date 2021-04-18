#!/bin/bash

openrc default 
/etc/init.d/mariadb setup
mysql -u root -e "CREATE USER 'demo'@'localhost' IDENTIFIED BY 'demo';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* to 'demo'@'localhost'";
mysql -u root -e "FLUSH PRIVILEGES;"