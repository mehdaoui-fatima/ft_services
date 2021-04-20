FROM    alpine:3.12.3

RUN     apk update && \
        apk add wget  && \
        apk add openrc && \
        apk add vsftpd && \
        rc-update add vsftpd default 
        #nc -zv 127.0.0.1 21 
COPY    setup.sh /tmp
RUN     sh tmp/setup.sh
COPY    vsftpd.conf etc/vsftpd/


EXPOSE 21
