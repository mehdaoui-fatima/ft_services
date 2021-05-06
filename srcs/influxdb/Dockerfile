FROM    alpine:3.12.3

RUN     apk update  && \
        apk add wget && \
        apk add openrc   && \
        apk add influxdb && \
        mkdir -p /run/openrc/softlevel && \
        apk add telegraf --repository=http://nl.alpinelinux.org/alpine/edge/community && \
        openrc default && rc-service influxdb restart && \
        sleep 3 && \
        influx -execute "create user fmehdaou with password '123' WITH ALL PRIVILEGES" && \
        influx -username fmehdaou -password 123 -execute "create database influxdb" && \
        influx -username fmehdaou -password 123 -execute "CREATE DATABASE ftpsdb" && \
        influx -username fmehdaou -password 123 -execute "CREATE DATABASE grafanadb" && \
        influx -username fmehdaou -password 123 -execute "CREATE DATABASE nginxdb" && \
        influx -username fmehdaou -password 123 -execute "CREATE DATABASE mysqldb" && \
        influx -username fmehdaou -password 123 -execute "CREATE DATABASE phpmyadmindb" && \
        influx -username fmehdaou -password 123 -execute "CREATE DATABASE wordpressdb" 


ADD     services_status.sh /tmp
ADD     telegraf.conf /etc/

#By default, InfluxDB uses TCP port 8086 for client-server communication over the InfluxDB HTTP API
EXPOSE 8086 

ENTRYPOINT ["sh", "/tmp/services_status.sh"]