FROM    alpine:3.12.3
RUN     apk update && \
        apk add wget && \
        apk add openrc && \
        apk add nginx && \
        apk add php-session php-mbstring php7-common php7-iconv php7-json php7-gd php7-curl php7-zlib php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom && \
        apk add php-mysqli && \
        apk add php7 php7-fpm php7-opcache && \
        wget  https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz -P /www/ && \
        tar zxvf /www/phpMyAdmin-5.0.2-all-languages.tar.gz -C /www/  && \
        rm /www/phpMyAdmin-5.0.2-all-languages.tar.gz && \
        mv /www/phpMyAdmin-5.0.2-all-languages /www/phpmyadmin && \
        chmod -R 755 /www/phpmyadmin && \
        apk update  && \
        adduser -D -g 'www' www && \
        chown -R www:www /var/lib/nginx    && \
        chown -R www:www /www && \
        apk add telegraf --repository=http://nl.alpinelinux.org/alpine/edge/community 

ADD     srcs/nginx.conf      /etc/nginx/
RUN     mkdir -p /run/nginx  && mkdir -p /run/openrc/softlevel
ADD     srcs/services_status.sh /tmp 
ADD     srcs/telegraf.conf /etc/

EXPOSE 5000
ENTRYPOINT ["sh", "/tmp/services_status.sh"]