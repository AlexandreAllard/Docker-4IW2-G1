FROM php:7.4-fpm-alpine

# Installer les dépendances nécessaires pour les extensions PHP
RUN apk add --no-cache postgresql-dev

# Installer pdo et pdo_pgsql
RUN docker-php-ext-install pdo pdo_pgsql

# Copier l'application
COPY . /var/www/symfony

# Définir le répertoire de travail
WORKDIR /var/www/symfony