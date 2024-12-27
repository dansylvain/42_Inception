#!/bin/bash
set -e

# Lance MariaDB en arrière-plan
mysqld_safe --skip-networking &
pid="$!"

# Attends que MariaDB soit prêt
while ! mysqladmin ping --silent; do
    sleep 1
done

# Si c'est le premier démarrage, initialise la base de données
if [ ! -f /var/lib/mysql/.initialized ]; then
    echo "Initialisation de la base de données..."
    mysql -uroot < /init.sql
    touch /var/lib/mysql/.initialized
fi

# Arrête MariaDB en arrière-plan pour le relancer en mode normal
kill "$pid"
wait "$pid"

# Relance MariaDB en mode normal
exec mysqld_safe
	