#!/bin/sh

for d in "init drive record mariadb mariadb/data mariadb/backup mariadb/socket"; do
 mkdir ./$d
 chmod -R +x ./$d
done

docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > ./init/initdb.sql

echo "MARIADB_PASSWORD=$(openssl rand -base64 40)" >> .env
