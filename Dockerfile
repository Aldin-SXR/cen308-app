FROM php:8.0-apache
WORKDIR /var/www/html

COPY . .

# Commong extensions
RUN apt update
RUN apt install zip libzip-dev -y
RUN docker-php-ext-install pdo_mysql zip

# Composer install
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
COPY composer.json composer.json
RUN composer install --no-dev

EXPOSE 80
EXPOSE 443