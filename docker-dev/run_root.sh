cp /var/www/app/docker-dev/nginx-app.conf /etc/nginx/sites-enabled/default
cp /var/www/app/docker-dev/php.ini /usr/local/etc/php/conf.d/app.ini
cp /var/www/app/docker-dev/supervisord.conf /etc/supervisord.conf

chown root:root /etc/supervisord.conf
chown root:root /usr/local/etc/php/conf.d/app.ini
chown root:root /etc/nginx/sites-enabled/default

mkdir -p /var/log/app/
chown www-data:www-data -R /var/log/app

/usr/bin/supervisord -c /etc/supervisord.conf