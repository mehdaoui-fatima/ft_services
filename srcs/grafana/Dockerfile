
FROM    alpine:3.12.3
RUN     apk update  && \
        apk add wget && \
        apk add openrc  && \
        wget https://dl.grafana.com/oss/release/grafana-7.3.1.linux-amd64.tar.gz && \
        tar -zxvf grafana-7.3.1.linux-amd64.tar.gz && \
        mv grafana-7.3.1 grafana && \
        apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
      


ADD     services_status.sh /tmp 

EXPOSE 3000

ENTRYPOINT ["sh", "/tmp/services_status.sh"]

