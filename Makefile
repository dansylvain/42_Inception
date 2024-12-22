# Variables
DOCKER_COMPOSE = docker-compose

# Cibles
.PHONY: all build up down clean

all: build up

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down --remove-orphans

clean:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans