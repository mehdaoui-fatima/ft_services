FROM    alpine:3.12.3
RUN     apk update && \
        apk add wget && \
        apk add openrc && \
        apk add nginx && \
        apk add php-session php-mbstring php7-common php7-iconv php7-json php7-gd php7-curl php7-zlib php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom && \
        apk add php7 php7-fpm php7-opcache && \
        wget  http://wordpress.org/latest.tar.gz -P /www/ && \
        tar -xzvf /www/latest.tar.gz -C /www/ && \
        rm /www/latest.tar.gz
          
COPY    setup.sh   /tmp
RUN     sh /tmp/setup.sh
COPY    nginx.conf      /etc/nginx/
RUN     mkdir -p /run/nginx  && mkdir -p /run/openrc/softlevel








EXPOSE 5050
