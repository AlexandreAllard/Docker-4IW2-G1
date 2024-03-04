FROM php:7.4-fpm-alpine

# Installer PostgreSQL dev
RUN apk add --no-cache postgresql-dev

# Installer les extensions PHP
RUN docker-php-ext-install pgsql pdo_pgsql

# Télécharger Adminer
ADD https://www.adminer.org/latest.php /var/www/adminer/index.php

# Exposer le port
EXPOSE 8080

# Lancer le serveur PHP
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/adminer"]