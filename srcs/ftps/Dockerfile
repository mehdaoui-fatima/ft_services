FROM    alpine:3.12.3

ENV SERVERNAME localhost
ENV COUNTRY MA
ENV STATE Khouribga
ENV LOCALITY Khouribga
ENV ORGANIZATION 1337FIL

RUN     apk update && \
        apk add wget  && \
        apk add openrc && \
        apk add vsftpd && \
        rc-update add vsftpd default && \
        adduser  fmehdaou -D && \
        echo "fmehdaou:123" | chpasswd && \
        apk add openssl && \
        openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=$SERVERNAME" && \
        apk add telegraf --repository=http://nl.alpinelinux.org/alpine/edge/community 

ADD     srcs/vsftpd.conf etc/vsftpd
ADD     srcs/services_status.sh /tmp 
ADD     srcs/telegraf.conf /etc/

EXPOSE 21
ENTRYPOINT ["sh", "/tmp/services_status.sh"]
