FROM debian:buster

RUN apt update && apt install -y wget curl \
    && apt install -y php7.3 php-fpm php-mysql mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY tools/wp_setup.sh /

RUN chmod +x /wp_setup.sh
RUN mkdir -p /run/php && \
    chmod 777 /run/php

ENTRYPOINT ["bash", "/wp_setup.sh"]
