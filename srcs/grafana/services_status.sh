#!/bin/bash 

openrc default
cd grafana
 /grafana/bin/grafana-server web
sleep 10
while [ true ]; do
pgrep grafana
STATUS1=$?
if [ $STATUS1 != 0 ]
then
    /grafana/bin/grafana-server web
fi
done
 
