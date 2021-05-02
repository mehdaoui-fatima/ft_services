#!/bin/bash 

openrc default
rc-service influxdb restart
rc-service telegraf start
while sleep 60; do
  pgrep influx >> /dev/null
  status1=$?
  pgrep telegraf >> /dev/null
  status2=$?
  if [ $status1 != 0 ]; then
    rc-service influxdb restart
  fi
  if [ $status2 != 0 ]; then
    rc-service telegraf restart
  fi
done