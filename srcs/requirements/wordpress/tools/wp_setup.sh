#!/bin/bash

sleep 10

wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --url='http://kallegre.42.fr' \
	--title='Title' \
	--admin_user='admin' \
	--admin_password='admin' \
	--admin_email='admin@admin.com'