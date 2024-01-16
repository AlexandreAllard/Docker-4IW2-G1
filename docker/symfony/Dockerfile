FROM alpine:latest

###> Installation des éléments nécessaires ###
RUN apk update && apk upgrade && apk add --no-cache  \
    bash  \
    curl  \
    git \
    php82 \
    php82-openssl \
    php82-phar \
    php82-mbstring \
    php82-ctype \
    php82-iconv \
    php82-json \
    php82-xml \
    php82-session \
    php82-tokenizer \
    php82-xmlwriter \
    php82-simplexml \
    php82-dom \
    php82-pdo \
    php82-pdo_mysql \
    php82-pdo_pgsql \
    php82-pdo_sqlite \
    php82-pdo_dblib \
    php82-pdo_odbc \
    php82-xmlreader \
    php82-curl \
    php82-zip \
    sudo
###< Installation des éléments nécessaires ###

###> Bind du bin php8.2 à php ###
RUN ln -s /usr/bin/php82 /usr/bin/php
###< Bind du bin php8.2 à php ###

###> Installation de composer ###
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
###< Installation de composer ###

###> Symfony CLI ###
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | sudo -E bash

RUN apk add symfony-cli
###< Symfony CLI ###

###> Setup du skeleton de base (spécifié api et sans git) ###
RUN symfony new --api --no-git --dir=/var/www/html/partiel
###< Setup du skeleton de base (spécifié api et sans git) ###


###> Changement du workdir et start du serveur automatique ###
WORKDIR /var/www/html/partiel
CMD ["symfony", "server:start"]
###< Changement du workdir et start du serveur automatique ###