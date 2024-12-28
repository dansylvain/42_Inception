FROM debian:11

# update packages and install dependencies
RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# create folder for MariaDB data and socket
RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld

# Expose mariadb default port
EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/init.sql /init.sql
COPY ./conf/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


# start database
CMD ["mysqld_safe"]
