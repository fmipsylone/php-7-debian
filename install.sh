#!/bin/bash
cd "$(dirname "$0")"

# Create a dir for storing PHP module conf
mkdir /usr/local/php7.2/etc/conf.d

# Symlink php-fpm to php7-fpm
ln -s /usr/local/php7.2/sbin/php-fpm /usr/local/php7.2/sbin/php7.2-fpm

# Add config files
cp php-src/php.ini-production /usr/local/php7.2/lib/php.ini
cp conf/www.conf /usr/local/php7.2/etc/php-fpm.d/www.conf
cp conf/php-fpm.conf /usr/local/php7.2/etc/php-fpm.conf
cp conf/modules.ini /usr/local/php7.2/etc/conf.d/modules.ini

# Add the init script
cp conf/php7.2-fpm.init /etc/init.d/php7.2-fpm
chmod +x /etc/init.d/php7.2-fpm
update-rc.d php7.2-fpm defaults

service php7.2-fpm start
