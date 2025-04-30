FROM php:8.2-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zip git unzip curl libxml2-dev \
    libonig-dev libzip-dev libsqlite3-dev sqlite3 \
    libcurl4-openssl-dev pkg-config libssl-dev libmcrypt-dev \
    libxslt-dev libtidy-dev libpq-dev libicu-dev libgmp-dev \
    libldap2-dev libmagickwand-dev --no-install-recommends && \
    docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd xml zip \
    intl soap xsl tidy mysqli opcache && \
    a2enmod rewrite

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html
