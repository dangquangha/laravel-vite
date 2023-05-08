FROM php:8.1.18-fpm

# Install dependencies
RUN apt-get update \
    && apt-get install -y \
    nginx \
    cron \
    supervisor \
    zip \
    unzip \
    git \
    sudo \
    vim \
    curl

# Custom libs
RUN apt-get install -y libpng-dev libzip-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install bcmath sockets pcntl pdo_mysql gd zip exif

# Install non-standard extensions and composer
RUN pecl install redis && docker-php-ext-enable redis
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy sources
RUN mkdir -p /var/www/app
RUN chown www-data:www-data -R /var/www/app
COPY --chown=www-data:www-data . /var/www/app
 

# Prepare env
RUN chmod +x /var/www/app/docker-dev/run.sh
RUN chmod +x /var/www/app/docker-dev/run_root.sh
RUN echo 'www-data  ALL=(ALL)       NOPASSWD: /var/www/app/docker-dev/run_root.sh' >> /etc/sudoers
ENV TZ=Asia/Ho_Chi_Minh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER www-data
WORKDIR /var/www/app
RUN composer install --optimize-autoloader --no-dev --no-cache

# Expose port 80 and start command
EXPOSE 80
CMD ["sh", "/var/www/app/docker-dev/run.sh"]

# Health check
# HEALTHCHECK --interval=5s --timeout=10s --retries=3 CMD curl -sS 127.0.0.1:80/_bbbtech_/health
