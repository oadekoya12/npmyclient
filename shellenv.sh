# /usr/bin/sh
ls -al
mkdir -p logs/nginx/  logs/php/
touch logs/nginx/access.log  logs/nginx/error.log
touch logs/php/php_errors.log 

# Drupal



# Run Docker compose
# docker compose up --build -d    