FROM debian:11

# Mettre à jour les paquets et installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# # Créer un utilisateur pour MariaDB
# RUN useradd -ms /bin/bash mariadb

# Créer les répertoires pour les données de MariaDB et le socket
RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld

# Exposer le port par défaut de MariaDB
EXPOSE 3306

# # Changer l'utilisateur pour exécuter MariaDB
# USER mariadb

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/init.sql /init.sql
COPY ./conf/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


# Commande pour démarrer le service MariaDB
CMD ["mysqld_safe"]

#VOLUME ["/var/lib/mysql"]

# docker build -t mariadb-img .
# ! volume to be added!!!
# docker run --name mariadb-ctn --rm -d mariadb-img