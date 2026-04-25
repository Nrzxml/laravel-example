FROM php:8.2-cli

WORKDIR /app

RUN apt-get update && apt-get install -y unzip git

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . .

# 🔥 TAMBAH INI
RUN composer config --global audit.block-insecure false

RUN composer install

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]