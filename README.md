# 42_inception
The Inception project aims to [describe the main goal of your project]. This project involves setting up a development environment and infrastructure using Docker and other relevant technologies to facilitate application deployment and management.

<p align="center">
  <img src="inception.webp" width="70%"/>
</p>

## Technologies Used
**Docker**: Containerization and orchestration of services.
**Nginx**: Web server for handling HTTP requests.
**WordPress**: CMS application.
**Git**: Version control.

## Prerequisites
Before you begin, ensure you have the following installed on your machine:

. Docker
. Docker Compose
. Git

## Installation
Clone the repository:

```bash
git clone https://github.com/your-username/inception.git
cd inception
```

## Build the containers using Docker Compose:

```bash
docker-compose up -d --build
```

## Access the application through your browser at http://localhost.

## Directory Structure
**Dockerfile**: Configuration file for building Docker containers.
**docker-compose**.yml: Docker Compose configuration for orchestrating services.
**nginx/**: Nginx server configuration files.
**src/**: Source code of the application.
**logs/**: Directory for storing log files.

## Features
Setting up web servers and databases via Docker.
Automated Nginx configuration to route requests.
Support for [add any specific features of your project].

## License
This project is licensed under the [insert license, e.g., MIT].
