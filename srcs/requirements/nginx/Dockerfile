FROM debian:11


# Mettre à jour les paquets et installer Nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Installer openssl pour générer des certificats
RUN apt-get update && apt-get install -y openssl && rm -rf /var/lib/apt/lists/*

# Créer les dossiers pour les certificats
RUN mkdir -p /etc/ssl/private /etc/ssl/certs

# Générer le certificat et la clé auto-signés
RUN openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=FR/ST=Occitanie/L=Perpignan/O=42/OU=Student/CN=localhost.local"

COPY ./conf/nginx.conf ./etc/nginx/nginx.conf


# Exposer le port HTTP par défaut (443)
EXPOSE 443

# Commande de démarrage de Nginx
CMD ["nginx", "-g", "daemon off;"]

VOLUME ["/var/www/html"]

# docker build -t nginx-img .
# docker run --rm --network my-network --name nginx-ctn -d -p 80:80 nginx-img 