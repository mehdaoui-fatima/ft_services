FROM    alpine:3.12.3
RUN     apk update ; \
        apk add openrc ;\
        mkdir -p /run/openrc/softlevel

COPY    mysql.sh   /tmp
RUN     sh   mysql.sh


#EXPOSE 5050