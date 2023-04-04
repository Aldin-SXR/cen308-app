FROM richarvey/nginx-php-fpm:1.9.1

COPY . .

# Image config
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN composer install --no-dev --working-dir=/var/www/html

CMD ["/start.sh"]
