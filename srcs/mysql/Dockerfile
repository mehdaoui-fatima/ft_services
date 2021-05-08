FROM    alpine:3.12.3
RUN     apk update && \
        apk add openrc && \
        mkdir /run/openrc && touch /run/openrc/softlevel && \
        apk add mariadb mariadb-client && \
        apk add telegraf --repository=http://nl.alpinelinux.org/alpine/edge/community && \
        openrc default 


ADD     srcs/telegraf.conf /etc/
ADD     srcs/services_status.sh /tmp
ADD     srcs/phpmyadmin.sql  /tmp
ADD     srcs/my.cnf /etc/mysql/


EXPOSE 8086 

ENTRYPOINT ["sh", "/tmp/services_status.sh"]

