FROM    alpine:3.12.3
RUN     apk update && \
        apk add wget && \
        apk add openrc && \
        apk add nginx && \
        apk add php-session php-mbstring php7-common php7-iconv php7-json php7-gd php7-curl php7-zlib php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom && \
        apk add php7 php7-fpm php7-opcache && \
        wget  http://wordpress.org/latest.tar.gz -P /www/ && \
        tar -xzvf /www/latest.tar.gz -C /www/ && \
        rm /www/latest.tar.gz && \
        apk update && \
        adduser -D -g 'www' www && \
        chown -R www:www /var/lib/nginx && \
        chown -R www:www /www && \
        apk add telegraf --repository=http://nl.alpinelinux.org/alpine/edge/community


ADD     srcs/services_status.sh /tmp  
ADD     srcs/nginx.conf      /etc/nginx/
ADD     srcs/wp-config.php /www/wordpress
RUN     mkdir -p /run/nginx  && mkdir -p /run/openrc/softlevel
ADD     srcs/telegraf.conf /etc/

EXPOSE 5050
ENTRYPOINT ["sh", "/tmp/services_status.sh"]