#!/bin/bash
echo "Estoy en Nginx" > /var/www/html/index.html
nginx -g "daemon off;"
