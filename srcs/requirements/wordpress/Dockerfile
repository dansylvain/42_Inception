FROM debian:11

# update packages and install dependencies
RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl \
    wget \
    tar \
    && rm -rf /var/lib/apt/lists/*

# download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz \
    && rm latest.tar.gz

# copy WordPress files in folder /var/www/html
RUN mkdir -p /var/www/html \
    && mv wordpress/* /var/www/html/ \
    && chown -R www-data:www-data /var/www/html \
	&& mkdir -p /run/php

# Configure PHP-FPM to listen on port 9000
RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

# expose port for PHP-FPM
EXPOSE 9000

COPY ./conf/wp-config.php var/www/html/wp-config.php

# start PHP-FPM
CMD ["/usr/sbin/php-fpm7.4", "-F"]