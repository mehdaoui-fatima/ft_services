#!/bin/bash 

openrc default
rc-service telegraf start
cd grafana
./bin/grafana-server web
while sleep 60; do
pgrep grafana >> /dev/null
status1=$?
pgrep telegraf >> /dev/null
status2=$?
if [ $status1 != 0 ]; then
then
    /grafana/bin/grafana-server web
fi
if [ $status2 != 0 ]; then
    rc-service telegraf restart
fi
done