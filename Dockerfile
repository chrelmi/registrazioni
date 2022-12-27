FROM composer:2.2 AS builder

FROM php:8.1-fpm

LABEL maintainer="Andrea Bellucci <abellucci@it-al.it>"

# Configurazione PhP
RUN apt-get -y update \
    && apt-get install -y \
        git \
        libzip-dev \
        zip \
        zlib1g-dev \
        libmemcached-dev \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libgmp-dev \
    && pecl install \
        memcached-3.1.5 \
        xdebug \
        pcov \
    && docker-php-ext-enable \
        memcached \
        xdebug \
        pcov \
    && docker-php-ext-install \
        pdo \
        pdo_mysql \
        zip \
        intl \
        gmp \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./docker/php/ "$PHP_INI_DIR/"

# Installazione dipendenze composer
COPY --from=builder /usr/bin/composer /usr/bin/composer

COPY . /var/www/html/
#RUN composer install --prefer-dist --no-interaction --quiet --no-progress
