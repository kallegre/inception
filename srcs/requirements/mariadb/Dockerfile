FROM debian:buster

RUN apt update && apt install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/createDB.sh /

ENTRYPOINT ["bash", "createDB.sh"]