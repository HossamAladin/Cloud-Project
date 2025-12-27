# Use an official PHP image
FROM php:8.2-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Verify project structure
RUN ls -la

# Install Composer dependencies
RUN if [ -f "Smart-Budget-Manager-main/composer.json" ]; then \
        cd Smart-Budget-Manager-main && \
        composer install --no-dev --optimize-autoloader; \
    elif [ -f "composer.json" ]; then \
        composer install --no-dev --optimize-autoloader; \
    else \
        echo "No composer.json found" && exit 1; \
    fi

# Generate app key and clear config (if in Laravel project)
RUN if [ -f "Smart-Budget-Manager-main/artisan" ]; then \
        cd Smart-Budget-Manager-main && \
        php artisan key:generate && \
        php artisan config:clear; \
    elif [ -f "artisan" ]; then \
        php artisan key:generate && \
        php artisan config:clear; \
    fi

# Set permissions
RUN chown -R www-data:www-data /app

# Enable Apache rewrite
RUN a2enmod rewrite

# Expose port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
