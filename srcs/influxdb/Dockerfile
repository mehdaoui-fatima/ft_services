FROM    alpine:3.12.3

RUN     apk update  && \
        apk add wget && \
        apk add openrc   && \
        apk add influxdb && \
        mkdir -p /run/openrc/softlevel && \
        apk add telegraf --repository=http://nl.alpinelinux.org/alpine/edge/community && \
        openrc default && rc-service influxdb restart 
        
ADD     srcs/services_status.sh /tmp
ADD     srcs/telegraf.conf /etc/

#By default, InfluxDB uses TCP port 8086 for client-server communication over the InfluxDB HTTP API
EXPOSE 8086 

ENTRYPOINT ["sh", "/tmp/services_status.sh"]