FROM    alpine:3.12.3
RUN     apk update && \
        apk add openrc && \
        mkdir /run/openrc && touch /run/openrc/softlevel && \
        apk add mariadb mariadb-client && \
        apk add telegraf --repository=http://nl.alpinelinux.org/alpine/edge/community && \
        openrc default && \
        sleep 3 && \
        rc-service mariadb setup && \
        rc-service mariadb start && \
        mysql -u root -e "CREATE USER 'demo'@'localhost' IDENTIFIED BY 'demo';" && \
        mysql -u root -e "GRANT ALL PRIVILEGES ON *.* to 'demo'@'localhost'" && \
        mysql -u root -e "FLUSH PRIVILEGES;" 

ADD     srcs/services_status.sh /tmp  
ADD     srcs/telegraf.conf /etc/

EXPOSE 8086 

ENTRYPOINT ["sh", "/tmp/services_status.sh"]

