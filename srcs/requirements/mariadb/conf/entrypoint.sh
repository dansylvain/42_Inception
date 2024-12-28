#!/bin/bash
set -e

# check that db is initialized
if [ ! -f /var/lib/mysql/.initialized ]; then
    echo "Initialisation de la base de données..."
    mysqld_safe & # temporary launch for initialization
    pid="$!"

    # wait for mariaDB to be ready
    while ! mysqladmin ping --silent; do
        sleep 1
    done

    mysql -uroot < /init.sql
    touch /var/lib/mysql/.initialized

    # stop mariaDB temporarily
    kill "$pid"
    wait "$pid"
fi

# relaunch mariaDB in normal mode
exec mysqld_safe
