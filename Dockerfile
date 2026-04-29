# ---- STAGE 1: Desarrollo ----
FROM php:8.2-apache AS development

RUN docker-php-ext-install mysqli \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/xdebug.ini

COPY ./web /var/www/html

# ---- STAGE 2: Producción ----
FROM php:8.2-apache AS production

RUN docker-php-ext-install mysqli

COPY --from=development /var/www/html /var/www/html


