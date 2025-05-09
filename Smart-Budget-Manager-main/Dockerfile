# Use PHP 8.2 with Apache
FROM php:8.2-apache

# Install system dependencies and PHP extensions
RUN set -eux; \
    # Update package lists and install essential dependencies
    apt-get update && apt-get install -y --no-install-recommends \
        git \
        curl \
        wget \
        zip \
        unzip \
        libzip-dev \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libwebp-dev \
        libxpm-dev \
        libmcrypt-dev \
        libreadline-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        pkg-config \
        libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN set -eux; \
    # Configure and install PHP extensions
    docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
        --with-xpm \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql \
        mysqli \
        mbstring \
        exif \
        pcntl \
        bcmath \
        gd \
        zip \
        intl \
        soap \
        sockets

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . /var/www/html

# Create .env file if it doesn't exist
RUN if [ ! -f .env ]; then \
        cp .env.example .env; \
    fi

# Install Composer dependencies with comprehensive error handling
RUN set -eux; \
    # Ensure Composer uses the correct PHP version
    composer diagnose || true; \
    # Clear any existing vendor directory
    rm -rf vendor; \
    # Install dependencies with verbose output and no interaction
    composer install --no-interaction --no-plugins --no-scripts --verbose

# Generate application key
RUN php artisan key:generate

# Ensure autoloader is generated
RUN composer dump-autoload

# Set proper permissions
RUN chown -R www-data:www-data \
    /var/www/html/storage \
    /var/www/html/bootstrap/cache

# Set ServerName to suppress warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copy Apache configuration
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Enable Apache modules
RUN a2enmod rewrite

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]