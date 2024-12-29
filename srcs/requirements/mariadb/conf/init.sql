CREATE DATABASE IF NOT EXISTS wp_database;
USE wp_database;
CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY 'wp_password';
GRANT ALL PRIVILEGES ON wp_database.* TO 'wp_user'@'%';
SOURCE /docker-entrypoint-initdb.d/dump.sql
FLUSH PRIVILEGES;