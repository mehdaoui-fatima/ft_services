FROM    alpine:3.12.3
RUN     apk update ; \
        apk add openrc ;\
        mkdir /run/openrc && touch /run/openrc/softlevel ;\
        apk add mariadb mariadb-client

COPY    setup.sh   /tmp
RUN     sh   /tmp/setup.sh
ADD     services_status.sh /tmp  

ENTRYPOINT ["sh", "/tmp/services_status.sh"]