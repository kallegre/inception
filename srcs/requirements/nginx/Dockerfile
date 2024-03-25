FROM debian:bookworm

RUN apt update && apt install nginx openssl -y \
	&& mkdir -p /etc/nginx/ssl \
#	mkdir -p /var/run/nginx \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=PACA/L=Nice/O=42/OU=42/CN=kallegre.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf
