#!/bin/bash

/etc/init.d/php7.2-fpm stop
rm -r /usr/local/php7.2
update-rc.d php7.2-fpm remove
rm /etc/init.d/php7.2-fpm
