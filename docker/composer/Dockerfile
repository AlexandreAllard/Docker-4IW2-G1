FROM alpine:latest

RUN apk --no-cache add \
    php \
    php-phar \
    php-openssl \
    php-json \
    php-iconv \
    php-tokenizer \
    php-xml \
    php-curl \
    php-mbstring \
&& rm -rf /var/cache/apk/*

RUN mkdir -p /var/www/html/composer

COPY ./composer.json /var/www/html/composer/composer.json

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

VOLUME [ "/app" ]

WORKDIR /var/www/html/composer

CMD ["composer", "install"]