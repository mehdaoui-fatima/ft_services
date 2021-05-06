FROM    alpine:3.12.3
RUN     apk update && \
        apk add openrc && \
        apk add nginx && \
        apk add openssl && \
        apk add telegraf --repository=http://nl.alpinelinux.org/alpine/edge/community 
        
COPY    srcs/setup.sh   /tmp 
ADD     srcs/services_status.sh /tmp       
RUN     sh /tmp/setup.sh
COPY    srcs/nginx.conf      /etc/nginx/
COPY    srcs/index.html      /www
RUN     mkdir -p /run/nginx  && mkdir -p /run/openrc/softlevel

ADD     srcs/telegraf.conf /etc/

EXPOSE 80 443

ENTRYPOINT ["sh", "/tmp/services_status.sh"]
