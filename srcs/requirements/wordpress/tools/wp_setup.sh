#!/bin/bash

sleep 10

if [ -f "$WP_PATH/wp-config.php" ]

then
  echo "Wordpress already confiured."

else
	echo "$WP_PATH/wp-config.php not found."

	wp-cli.phar core download --allow-root --path=$WP_PATH

	wp-cli.phar config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --path=$WP_PATH --allow-root

	echo "Wordpress Configured Successfully"

	wp-cli.phar core install  --allow-root --path=$WP_PATH \
		--url=$DOMAIN_NAME \
		--title='Title' \
		--admin_user=$ADMIN_USER \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL \
		--skip-email

	wp-cli.phar theme activate twentytwentytwo --allow-root --path=$WP_PATH

	wp-cli.phar user create $WP_USER_NAME $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root --path=$WP_PATH

	echo "Wordpress Installed Successfully"

fi

echo "Starting PHP-FPM"

/usr/sbin/php-fpm7.3 -F
