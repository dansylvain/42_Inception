FROM debian:11

# Mettre à jour les paquets et installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl \
    wget \
    tar \
    && rm -rf /var/lib/apt/lists/*

# Télécharger et extraire WordPress
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz \
    && rm latest.tar.gz

# Copier les fichiers de WordPress dans le répertoire /var/www/html
RUN mkdir -p /var/www/html \
    && mv wordpress/* /var/www/html/ \
    && chown -R www-data:www-data /var/www/html \
	&& mkdir -p /run/php

# Configurer PHP-FPM pour écouter sur le port 9000
RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

# Exposer le port pour PHP-FPM
EXPOSE 9000

COPY ./conf/wp-config.php var/www/html/wp-config.php
# RUN chown www-data:www-data /var/www/html/wp-config.php && chmod 644 /var/www/html/wp-config.php

# Démarrer PHP-FPM
CMD ["/usr/sbin/php-fpm7.4", "-F"]

# docker build -t wp-img .
# docker run --rm --network my-network --name wp-ctn -d -p 3000:3000 wp-img