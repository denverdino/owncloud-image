#!/bin/bash
set -e

if [ ! -e '/var/www/html/version.php' ]; then
	tar cf - --one-file-system -C /usr/src/owncloud . | tar xf -

	if [ -n "$MYSQL_PORT_3306_TCP_ADDR" ]
	then
	    # Set the auto configuration to the linked mysql database
	    sed -i "s/conf_dbname/$MYSQL_ENV_MYSQL_DATABASE/g" /root/owncloud_autoconfig.php
	    sed -i "s/conf_dbuser/$MYSQL_ENV_MYSQL_USER/g" /root/owncloud_autoconfig.php
	    sed -i "s/conf_dbpassword/$MYSQL_ENV_MYSQL_PASSWORD/g" /root/owncloud_autoconfig.php
	    sed -i "s/conf_dbhost/mysql:3306/g" /root/owncloud_autoconfig.php

	    cp /root/owncloud_autoconfig.php /var/www/html/config/autoconfig.php
	fi

	chown -R www-data /var/www/html
fi

exec "$@"
