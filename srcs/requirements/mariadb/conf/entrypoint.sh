#!/bin/bash
set -e

# check that db is initialized
if [ ! -f /var/lib/mysql/.initialized ]; then
    echo "Initialisation de la base de données..."

	# replace environnement variables in file init.sql
    sed -e "s|\${MYSQL_DATABASE}|${MYSQL_DATABASE}|g" \
        -e "s|\${MYSQL_USER}|${MYSQL_USER}|g" \
        -e "s|\${MYSQL_PASSWORD}|${MYSQL_PASSWORD}|g" \
        /init.sql > /tmp/init_with_env.sql
	
    mysqld_safe & # temporary launch for initialization
    pid="$!"

    # wait for mariaDB to be ready
    while ! mysqladmin ping --silent; do
        sleep 1
    done

    mysql -uroot -p${MYSQL_ROOT_PASSWORD} < /tmp/init_with_env.sql
    touch /var/lib/mysql/.initialized

    # stop mariaDB temporarily
    kill "$pid"
    wait "$pid"
fi

# relaunch mariaDB in normal mode
exec mysqld_safe
