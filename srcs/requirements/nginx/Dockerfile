FROM debian:11


# update packages and install nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# install openssl to generate certificates
RUN apt-get update && apt-get install -y openssl && rm -rf /var/lib/apt/lists/*

# create folder for certificates
RUN mkdir -p /etc/ssl/private /etc/ssl/certs

# Generate certificate and auto-signed key
RUN openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=FR/ST=Occitanie/L=Perpignan/O=42/OU=Student/CN=dsylvain.42.fr/UID=dsylvain"

COPY ./conf/nginx.conf ./etc/nginx/nginx.conf

# Exposee default HTTP port (443)
EXPOSE 443

# start Nginx
CMD ["nginx", "-g", "daemon off;"]