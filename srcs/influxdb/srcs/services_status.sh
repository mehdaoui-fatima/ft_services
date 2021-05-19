#!/bin/bash 

openrc default
rc-service influxdb restart
sleep 2
rc-service telegraf start
influx -execute "create user fmehdaou with password '123' WITH ALL PRIVILEGES" 
influx -username fmehdaou -password 123 -execute "create database influxdb" 
influx -username fmehdaou -password 123 -execute "CREATE DATABASE ftpsdb" 
influx -username fmehdaou -password 123 -execute "CREATE DATABASE nginxdb" 
influx -username fmehdaou -password 123 -execute "CREATE DATABASE mysqldb" 
influx -username fmehdaou -password 123 -execute "CREATE DATABASE phpmyadmindb" 
influx -username fmehdaou -password 123 -execute "CREATE DATABASE gfdb" 
influx -username fmehdaou -password 123 -execute "CREATE DATABASE wordpressdb"
while sleep 20; do
  pgrep influx >> /dev/null
  status1=$?
  pgrep telegraf >> /dev/null
  status2=$?
  if [ $status1 != 0 ]; then
    # rc-service influxdb restart
    exit 1 
  fi
  if [ $status2 != 0 ]; then
    # rc-service telegraf restart
    exit 1 
  fi
done