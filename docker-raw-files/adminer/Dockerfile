FROM alpine:latest

RUN apk update && apk add --no-cache \
    php7 \
    php7-fpm \
    php7-pdo \
    php7-pdo_pgsql \
    php7-pgsql \
    curl

RUN mkdir -p /var/www/adminer && \
    curl -o /var/www/adminer/index.php -L https://www.adminer.org/latest.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/adminer"]
