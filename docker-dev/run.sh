#!/usr/bin/env bash

#set cron configuration
# crontab /var/www/app/docker-dev/crontab

#prepare application
cd /var/www/app

php artisan migrate --force
php artisan cache:clear
php artisan route:cache

#start it
sudo /var/www/app/docker-dev/run_root.sh