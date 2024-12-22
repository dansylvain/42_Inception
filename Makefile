# Variables
DOCKER_COMPOSE = srcs/docker-compose.yml

# Cibles
.PHONY: all build up down clean

all: up

build:
	docker-compose -f $(DOCKER_COMPOSE) build

up:
	docker-compose -f $(DOCKER_COMPOSE) up -d

down:
	docker-compose -f  $(DOCKER_COMPOSE) down

clean: down
	docker system prune -af

restart: clean all

re:
	docker-compose -f $(DOCKER_COMPOSE) restart

wp_restart:
	docker-compose -f $(DOCKER_COMPOSE) build wordpress
	docker-compose -f $(DOCKER_COMPOSE) up -d wordpress

nginx_restart:
	docker-compose -f $(DOCKER_COMPOSE) build nginx
	docker-compose -f $(DOCKER_COMPOSE) up -d nginx

mariadb_restart:
	docker-compose -f $(DOCKER_COMPOSE) build mariadb
	docker-compose -f $(DOCKER_COMPOSE) up -d mariadb