#!/bin/sh
#cp /var/www/.env.example /var/www/.env

chmod -R 777 /var/www/storage
chmod -R 777 /var/www/bootstrap/cache

/usr/bin/composer config --global github-oauth.github.com f40a33d419a6e0e4f7dfeddf4954bd6b312d6084

cd /var/www && /usr/bin/composer install --prefer-dist && \
    /usr/bin/php artisan migrate && \
    /usr/bin/php artisan passport:keys

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf