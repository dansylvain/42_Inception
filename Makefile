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