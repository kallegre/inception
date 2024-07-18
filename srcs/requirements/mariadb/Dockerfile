FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/create_db.sh /create_db.sh

RUN chmod +x /create_db.sh

RUN chown mysql:mysql /var/lib/mysql

ENTRYPOINT ["/create_db.sh"]
