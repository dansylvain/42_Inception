# Variables
DOCKER_COMPOSE = srcs/docker-compose.yml
# Définir les chemins des répertoires de données
MARIADB_DIR = /home/$(USER)/data/mariadb
WORDPRESS_DIR = /home/$(USER)/data/wordpress

# Règle pour créer les répertoires nécessaires
create_dirs:
	@echo "Création des répertoires nécessaires..."
	mkdir -p $(MARIADB_DIR)
	mkdir -p $(WORDPRESS_DIR)

# Règle pour donner les bonnes permissions aux répertoires
set_permissions:
	@echo "Définition des permissions sur les répertoires..."
	sudo chmod -R 777 $(MARIADB_DIR)
	sudo chmod -R 777 $(WORDPRESS_DIR)

# Cibles
.PHONY: all build up down clean

all: up

build:
	docker-compose -f $(DOCKER_COMPOSE) build

up: create_dirs set_permissions
	docker-compose -f $(DOCKER_COMPOSE) up -d

down:
	docker-compose -f  $(DOCKER_COMPOSE) down

clean: down
	docker system prune -a -f --volumes
	docker volume rm $(shell docker volume ls -q)

restart: clean all

re:
	docker-compose -f $(DOCKER_COMPOSE) down -v
	docker-compose -f $(DOCKER_COMPOSE) up -d

wp_restart:
	docker-compose -f $(DOCKER_COMPOSE) down -v wordpress
	docker-compose -f $(DOCKER_COMPOSE) build wordpress
	docker-compose -f $(DOCKER_COMPOSE) up -d wordpress

nginx_restart:
	docker-compose -f $(DOCKER_COMPOSE) build nginx
	docker-compose -f $(DOCKER_COMPOSE) up -d nginx

mariadb_restart:
	docker-compose -f $(DOCKER_COMPOSE) build mariadb
	docker-compose -f $(DOCKER_COMPOSE) up -d mariadb