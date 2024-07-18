#!/bin/bash

sleep 10

if [ -f "$WP_PATH/wp-config.php" ]

then
  echo "Wordpress already confiured."

else
	echo "$WP_PATH/wp-config.php not found."
	wp core download --allow-root --path=$WP_PATH

	echo $MYSQL_DATABASE
	echo $MYSQL_USER
	echo $MYSQL_PASSWORD
	echo $WP_PATH

	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --path=$WP_PATH --allow-root

	echo "Wordpress Configured Successfully"
	echo "Lunching Wordpress Installation"

	wp core install  --allow-root --path=$WP_PATH \
		--url='http://kallegre.42.fr' \
		--title='Title' \
		--admin_user='admin' \
		--admin_password='admin' \
		--admin_email='admin@admin.com'

	echo "Wordpress Installed Successfully"

	wp theme install twentyseventeen --activate --path=$WP_PATH --allow-root
  	wp user create kallegre --role=administrator --user_pass=kallegre --path=$WP_PATH --allow-root

fi

/usr/sbin/php-fpm7.3 -F
