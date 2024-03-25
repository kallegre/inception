FROM debian:buster

RUN apt update && apt install -y wget \
&& apt install -y php7.3 php-fpm php-mysql mariadb-client \
&& wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
&& cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz \
&& chown -R root:root /var/www/wordpress