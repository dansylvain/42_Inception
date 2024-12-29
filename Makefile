# Variables
DOCKER_COMPOSE = srcs/docker-compose.yml
# Define the paths for the data directories
MARIADB_DIR = /home/$(USER)/data/mariadb
WORDPRESS_DIR = /home/$(USER)/data/wordpress

# Rule to create the necessary directories
create_dirs:
	@echo "Creating necessary directories..."
	mkdir -p $(MARIADB_DIR)
	mkdir -p $(WORDPRESS_DIR)

# Rule to set the correct permissions for the directories
set_permissions:
	@echo "Setting permissions on directories..."
	sudo chmod -R 777 $(MARIADB_DIR)
	sudo chmod -R 777 $(WORDPRESS_DIR)

# Targets
.PHONY: all build up down clean

# Set the default target to 'all'
.DEFAULT_GOAL := all

# Default target (executed when 'make' is run without arguments)
all: build up

# Build the Docker services
build:
	@echo "Building Docker services..."
	docker-compose -f $(DOCKER_COMPOSE) build

# Start the Docker containers
up: create_dirs set_permissions
	@echo "Starting Docker containers..."
	docker-compose -f $(DOCKER_COMPOSE) up -d

# Stop the Docker containers
down:
	@echo "Stopping Docker containers..."
	@docker-compose -f $(DOCKER_COMPOSE) down

# Clean up by removing unused volumes and data
clean: down
	@echo "Cleaning up volumes and data..."
	@docker system prune -a -f --volumes
	@volumes=$$(docker volume ls -q); \
	if [ -n "$$volumes" ]; then docker volume rm $$volumes; fi
	@sudo rm -rf ~/data

# Restart all services by cleaning up and then bringing up the containers
restart: clean all

# Restart all containers, removing volumes
re:
	@echo "Restarting Docker containers..."
	docker-compose -f $(DOCKER_COMPOSE) down -v
	docker-compose -f $(DOCKER_COMPOSE) up -d

# Restart the WordPress service
wp_restart:
	@echo "Restarting WordPress service..."
	docker-compose -f $(DOCKER_COMPOSE) down -v wordpress
	docker-compose -f $(DOCKER_COMPOSE) build wordpress
	docker-compose -f $(DOCKER_COMPOSE) up -d wordpress

# Restart the Nginx service
nginx_restart:
	@echo "Restarting Nginx service..."
	docker-compose -f $(DOCKER_COMPOSE) build nginx
	docker-compose -f $(DOCKER_COMPOSE) up -d nginx

# Restart the MariaDB service
mariadb_restart:
	@echo "Restarting MariaDB service..."
	docker-compose -f $(DOCKER_COMPOSE) build mariadb
	docker-compose -f $(DOCKER_COMPOSE) up -d mariadb
	