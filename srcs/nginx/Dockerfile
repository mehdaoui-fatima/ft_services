FROM    alpine:3.12.3
RUN     apk update ; \
        apk add openrc ; \
        apk add nginx ; \
        apk add openssl
        
COPY    setup.sh   /tmp
RUN     sh /tmp/setup.sh
COPY    nginx.conf      /etc/nginx/
COPY    index.html      /www
RUN     mkdir -p /run/nginx  && mkdir -p /run/openrc/softlevel








EXPOSE 80 443