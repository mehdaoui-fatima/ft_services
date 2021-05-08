
FROM    alpine:3.12.3
RUN     apk update  && \
        apk add wget && \
        apk add openrc  && \
        wget https://dl.grafana.com/oss/release/grafana-7.3.1.linux-amd64.tar.gz && \
        tar -zxvf grafana-7.3.1.linux-amd64.tar.gz && \
        rm grafana-7.3.1.linux-amd64.tar.gz && \
        mv grafana-7.3.1 grafana && \
        apk add telegraf --repository=http://nl.alpinelinux.org/alpine/edge/community && \
        apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat 


ADD     srcs/services_status.sh /tmp 
ADD     srcs/telegraf.conf /etc/
ADD     srcs/grafana.db /grafana/data/grafana.db

EXPOSE 3000

ENTRYPOINT ["sh", "/tmp/services_status.sh"]

