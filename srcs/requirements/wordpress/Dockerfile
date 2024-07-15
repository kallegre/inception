FROM debian:buster

RUN apt update && apt install -y wget \
&& apt install -y php7.3 php-fpm php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
&& cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY tools/wp_setup.sh /

ENTRYPOINT ["bash", "auto_config.sh"]

RUN mkdir /run/php

CMD ["/usr/sbin/php-fpm7.3", "-F"]
