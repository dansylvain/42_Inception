FROM debian:11

# Mettre à jour les paquets et installer Nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Exposer le port HTTP par défaut (443)
EXPOSE 443

COPY ./conf/nginx.conf ./etc/nginx/conf.d/nginx.conf

# Commande de démarrage de Nginx
CMD ["nginx", "-g", "daemon off;"]

VOLUME ["/var/www/html"]

# docker build -t nginx-img .
# docker run --rm --network my-network --name nginx-ctn -d -p 80:80 nginx-img 