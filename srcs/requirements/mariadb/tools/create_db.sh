#!/bin/bash

echo "script started"

# Starting MySQL Service
/etc/init.d/mysql start

sleep 2

# Writing MySQL Instructions
cat << EOF > mariadb.sql
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
EOF

echo "MySQL Database: $MYSQL_DATABASE"
echo "MySQL User: $MYSQL_USER"
echo "MySQL User Password: $MYSQL_PASSWORD"

# Running MySQL Instructions
mysql -u root < mariadb.sql

echo "MySQL Database Created Successfully"

# Stoping MySQL Service
/etc/init.d/mysql stop

sleep 2

mysqld_safe